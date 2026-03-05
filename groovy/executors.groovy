import jenkins.model.Jenkins

def instance = Jenkins.getInstance()
def executors = System.getenv("SPRYKER_JENKINS_EXECUTORS")?.toInteger() ?: 2

instance.setNumExecutors(executors)
instance.save()

