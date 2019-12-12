Return-Path: <SRS0=I7U7=2C=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4904DC2D0CA
	for <linux-clk@archiver.kernel.org>; Thu, 12 Dec 2019 19:36:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 210F72467C
	for <linux-clk@archiver.kernel.org>; Thu, 12 Dec 2019 19:36:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="lGc6HuLS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730762AbfLLTgl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Dec 2019 14:36:41 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44568 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730765AbfLLTgk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Dec 2019 14:36:40 -0500
Received: by mail-lf1-f67.google.com with SMTP id v201so117411lfa.11
        for <linux-clk@vger.kernel.org>; Thu, 12 Dec 2019 11:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lIK7T8B7Eyyku8RF0XNgNwtCGhRp7hkIh7+TFMDTOOM=;
        b=lGc6HuLSAiMqXLMDP/tAyif2jwHyEA6NsPow0XZ3qXGTakl08BokK7tnFnkRXIYVT4
         CB+WqxsNtTwVLVA1yChKPip/IMbsON8pgRvKA5uMK+GL+s/ReQwFrXSJS/aIcDc25jPO
         NQcVSSANR21HgM77FanVSlyChehzNv5KcWsgAWxYP5IhhkHTQeF9lT++50iw3iNU38Xg
         RRKHqENHjODrPdGnUvQaeOiDEDZTZIwjPe4DKFeUY6nYFetlY/d5Jhv8aGTFSl+Koqdl
         rWlDmGR8MgXaYe9WGKZz1ZmW3CfvmOOyGOrSXr7JcvlfFjAS02V+iLjeGWMdmUp+I8Lf
         r55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=lIK7T8B7Eyyku8RF0XNgNwtCGhRp7hkIh7+TFMDTOOM=;
        b=Es30yUkmuXTtK2TfdcbgOReM9sMe99monvKqhKflnkK5ZeMar32MkMfdc5AMDd7Okp
         l9o3EDFu7jzuBwVrlDFQMqQRuqLYdjBfpaOLoqEiHFMsHzDsRytTZPpn/vKwViEzTLRW
         05SEZSrGLJGmkMyr/dpqayvuSKVoWR2iRsz92skRAGTicCl+0kCehAJLzj4vuIfNosgK
         CN+c4nZo4SXQOtVbMBOr5nFq0MJ9wwl/diadCkF7xBRhHfVcfnP7lka/0GgzXLmXoSIh
         ZqhQ/O7hfvfuJnSi7z41UjDw2m1v0WFM2xoWllNIAnaFOe0BpZ9WoycSFoctawpgdxid
         IszA==
X-Gm-Message-State: APjAAAWZwxe4LkBA/xHHDS3JcDKtbiBjjC0aZ1b2+paZo9tGl7JDAO/k
        cgYJCJHIxEXMcVmY/7SuCAcftg==
X-Google-Smtp-Source: APXvYqxdpKEqSDXHq2d0D9envgFK5PeLwzFOc+DNwPACrZIGrON9Q2farga3fEcJ/DDnTT7CDyNnRA==
X-Received: by 2002:ac2:53a8:: with SMTP id j8mr6952034lfh.28.1576179398495;
        Thu, 12 Dec 2019 11:36:38 -0800 (PST)
Received: from wasted.cogentembedded.com ([2a00:1fa0:818:b9d7:c53b:d021:132e:26de])
        by smtp.gmail.com with ESMTPSA id y23sm3518960ljk.6.2019.12.12.11.36.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Dec 2019 11:36:37 -0800 (PST)
Subject: Re: [PATCH v2 1/6] spi: Add SPIBSC driver
To:     Chris Brandt <chris.brandt@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Mason Yang <masonccyang@mxic.com.tw>
References: <20191206134202.18784-1-chris.brandt@renesas.com>
 <20191206134202.18784-2-chris.brandt@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <37c13497-d20f-583f-72d7-1e3c8a241990@cogentembedded.com>
Date:   Thu, 12 Dec 2019 22:36:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20191206134202.18784-2-chris.brandt@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/06/2019 04:41 PM, Chris Brandt wrote:

> Add a driver for the SPIBSC controller in Renesas SoC devices.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

   Hm... I've just tested JFFS2 with this driver and got the same result as with
my own drivers:

root@192.168.2.11:~# mount -t jffs2 /dev/mtdblock11 /mnt/jffs2/                 
root@192.168.2.11:~# cd /mnt/jffs2/                                             
root@192.168.2.11:/mnt/jffs2# ls -l                                             
total 34                                                                        
-rwxr-xr-x 1 root root 18678 Jan 22  2000 evtest                                
-rw-r--r-- 1 root root 15169 Jan 22  2000 evtest.c                              
root@192.168.2.11:/mnt/jffs2# rm evtest                                         
root@192.168.2.11:/mnt/jffs2# ls -l                                             
total 15                                                                        
-rw-r--r-- 1 root root 15169 Jan 22  2000 evtest.c                              
root@192.168.2.11:/mnt/jffs2# cd                                                
root@192.168.2.11:~# umount /mnt/jffs2/                                         
root@192.168.2.11:~# mount -t jffs2 /dev/mtdblock11 /mnt/jffs2/                 
root@192.168.2.11:~# ls -l /mnt/jffs2/                                          
total 34                                                                        
-rwxr-xr-x 1 root root 18678 Jan 22  2000 evtest                                
-rw-r--r-- 1 root root 15169 Jan 22  2000 evtest.c                              

   As you can see, the deleted file is back after unmount/re-mount...

MBR, Sergei
