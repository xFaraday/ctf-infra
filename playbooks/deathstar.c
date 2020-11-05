#include <stdio.h>
#include <stdlib.h>

int main() {
    long unlock=0x41414141;
    char buf[40];

    printf("Quick the security systems are down! Send the exploit!\n");
    printf("input: ");
    scanf("%44s", &buf);

    printf("Malware peforming <><><><><> Memory capture\n");
    printf("buf currently: %s\n", buf);
    printf("unlock currently: 0x%08x\n\n\n\n\n", unlock);

    if(unlock==0xdeaddead){ 
	setreuid(1001,1001);
	system("/bin/sh");
    }
    else {
        printf("Exploit failed security system back online\n\n\n");
        exit(1);
    }
}
