terraform {
 backend "s3" {
   bucket = "backend-hagar"      
    key    = "statefile.tfstate"  
    region = "us-east-1"   
    use_lockfile = true                                     
  }
}
