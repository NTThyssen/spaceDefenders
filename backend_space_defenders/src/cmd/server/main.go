package main

import (
    "fmt"
    "net"
    "os"
    "time"

)

func main() {
    

    broadcastAddr, err := net.ResolveUDPAddr("udp4", "255.255.255.255:12345")
    if err != nil {
        fmt.Println("Error: ", err)
        return
    }

    conn, err := net.DialUDP("udp4", nil, broadcastAddr)
    if err != nil {
        fmt.Println("Error: ", err)
        return
    }

    defer conn.Close()

    ticker := time.NewTicker(1 * time.Second)

    defer ticker.Stop()
    
    for range ticker.C {
        _, err = conn.Write([]byte("Hello from server"))
        if err != nil {
            fmt.Println("Error: ", err)
            return
        }
        fmt.Println("Message sent")
        os.Exit(0)
    }



    
    
}