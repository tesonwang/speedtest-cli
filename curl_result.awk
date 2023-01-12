{
        s+=$0
}
END {
        s=s*8/1000000000
        printf "Average speed %2.2f Gbps\n", s
}
