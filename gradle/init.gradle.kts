import org.gradle.api.internal.tasks.testing.TestDescriptorInternal
import java.io.File

allprojects {
    project.tasks.withType<Test> {
        addTestListener(object : TestListener {
            override fun beforeTest(testDescriptor: TestDescriptor?) {}
            override fun afterSuite(suite: TestDescriptor?, result: TestResult?) {}
            override fun beforeSuite(suite: TestDescriptor?) {}

            override fun afterTest(testDescriptor: TestDescriptor?, result: TestResult?) {
                val test = testDescriptor as TestDescriptorInternal
                if (result?.resultType != TestResult.ResultType.FAILURE) return
                val className = test.className.orEmpty()
                val stackTrace = result.exception?.stackTrace?.find { it.className.startsWith(className) }
                val fileName = stackTrace?.fileName.orEmpty()
                val path = className.split(".").dropLast(1).joinToString("/")
                val filePath = listOf("src/test/java", "src/test/kotlin")
                .map { "$it/$path" }
                .map { File(File(project.projectDir, it), fileName) }
                .let { files -> files.find { it.exists() } ?: files.firstOrNull() }
                ?.absolutePath.orEmpty()
                val lineNum = stackTrace?.lineNumber?.toString().orEmpty()
                val message = result.exception?.message.orEmpty()
                println("$filePath:$lineNum: $message")
            }
        })
    }
}
