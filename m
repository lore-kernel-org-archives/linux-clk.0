Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A8FC6FA82
	for <linux-clk@archiver.kernel.org>; Sat, 10 Sep 2022 23:26:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbiIJX0S (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 10 Sep 2022 19:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbiIJX0Q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 10 Sep 2022 19:26:16 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D18CF3ECD8
        for <linux-clk@vger.kernel.org>; Sat, 10 Sep 2022 16:26:15 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 5980F83FD6;
        Sun, 11 Sep 2022 01:26:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1662852374;
        bh=EGp9fonDdPvXqTi7HcjzgCkBSXwMIAwJK00Bcxjs6cE=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=H4XmSCpvWVgfAVf2VanjaDUF1MDh9w0pctdtSXRtkjIWwwWniLi3CHDZGoo3oihin
         eWOl925Q0IRdBzs9N3H+rP6DwePjc6P5Cnasbaf55v5x4OLDgeeNbFDHpjQX9oujAp
         2zQ1oqPyT1VN/6laKTvAPestR5JYLJgwUMr0X25H2OtfJFi76SW8ssT+wIhqpU0C6A
         kbXSkOkt5/E4wx3/u8AQ47G//JszTW7o5DgRE3/UofTiEaEWL9/637Tg40AXFUqURR
         6sVMBIlCU9uw3NPGCLn+vJ2asmFYyOHf9ylbPnup6SFYpYCDRicezbJmBt2mgO87N9
         y286P1uShBTtg==
Message-ID: <43939b0a-d105-e403-c7b0-9281fe3ebebe@denx.de>
Date:   Sun, 11 Sep 2022 01:26:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: clk-renesas-pcie (9FGV0241) does not work
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-clk@vger.kernel.org
References: <3458883.Lt9SDvczpP@steina-w>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <3458883.Lt9SDvczpP@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 8/26/22 10:50, Alexander Stein wrote:
> Hi,

Hi,

> CC'ing Marek as original author.
> 
> I'm trying to use the clk-renesas-pcie driver for 9FGV0241 on my board.
> But apparently it doesn't work. After digging into it IMHO the i2c transfer
> are not correct.
> The datasheet [1] states that for reading the following sequence applies:
> 1. Start
> 2. W slave address
> 3. W beginning byte
> 4. Repeated start
> 5. R slave address
> 6. data byte count (from slave)
> 7. beginning byte (from slave)
> ...
> x. Stop
> 
> So before each read there is an additional byte containing (an apparently
> configurable) amount of bytes to be transferred. This is also what I see in u-
> boot:
>> => i2c md 0x6a 0 9
>> 0000: 08 ff 06 ff 5f ff 01 02 08    ...._....
> 
> The first ff, here on offset 1, is actually the reset default register/byte 0.
> 01 02 (offsets 6 & 7) are the ID registers at byte 5 & 6.
> 
> The write access is quite similar, the amount of bytes to be written has to be
> sent first. So the data byte count is completely ignored, IMHO which is why
> this doesn't work. Am I'm missing something? How can this be fixed?

Can you please test the following patch?

https://patchwork.kernel.org/project/linux-clk/patch/20220910232015.216329-1-marex@denx.de/
