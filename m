Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E05A8C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 13 May 2022 06:58:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377536AbiEMG57 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 May 2022 02:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377528AbiEMG55 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 May 2022 02:57:57 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3160866AE8
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 23:57:56 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id c190-20020a1c35c7000000b0038e37907b5bso6408583wma.0
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 23:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hASHPxv83GRvBq/XPbZdnxvQhLbD/eQRxLrZ3SHe3bA=;
        b=MxmcUOjEGFiLSngN/s+THREtdHFypFyRomxXgORGuf0OBSoSVonN4PCD4g7HVyqhrs
         aUMhRTId2H4bGCNg3lxU7geHZwdf3zQhDaEk9gGuJ+kwmjP4rylWr3uHxYCy6j9Srs3b
         YIOsXtxuWYHiTthFqmj2O7fVJK4diCiepDOKDd2ZPqK6qRCuHkwuV38Wt8Nzl3pqnSUp
         baiss945RrZk/SvxyAamevYckSxYsUaBTu7/qGTF9yCtqr5wMLgRBK3e/SbwtmWcDanw
         nAmbV/BasVDgoSft8nk4Wisg1DiWST27z3CsjvO8kbdpqoUuU2ABCWzbPfuq5Sxr27MO
         pwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hASHPxv83GRvBq/XPbZdnxvQhLbD/eQRxLrZ3SHe3bA=;
        b=gVFezfkoE/6+QTXoV609B+clW4TMjRklN/I+xJrzF9IG2SB6EQxefuTF009eKl0LKb
         jpZwiA4lC9Y2+X5+LYojNA4M46Yup945cw3VrkCjMSe3jLVvh7gY9K4owFNtllecuM54
         ZQuSV+FzIST7wYpf8mp3QX5MwkK5LHnh3p6Ud1Zke5DbmjInQKE6EiS/kEEQJrA+GQPY
         aoYEj8vPMqq6ZhiHDFUivkmLmziOxX+SYidGhoZpcffRGXPRc6tt0L+q/b9RYy+jAqBB
         Ar5e5Uur0pMj8aZlAoeCemH6y/p2iC3SKM0hsh4cGdAGMq0grdsahhBhe+7143at55IW
         ME6A==
X-Gm-Message-State: AOAM532l9IGRruNGyyB/b7uc4376uPe213Pop69GrupXw8BNoWpnpX45
        4bjBBmhfv+klkIqCwijM4CM12A==
X-Google-Smtp-Source: ABdhPJyGGZfF70Iywd0l6jNDT8xauodRFr/j9UDsyWKsA2dt9sva3CTS66dFHS1xmiPJjzdkhpf4GQ==
X-Received: by 2002:a05:600c:6021:b0:394:56be:18e with SMTP id az33-20020a05600c602100b0039456be018emr3038733wmb.86.1652425074641;
        Thu, 12 May 2022 23:57:54 -0700 (PDT)
Received: from [192.168.0.167] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e15-20020adfa74f000000b0020c5253d8e5sm1301475wrd.49.2022.05.12.23.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 23:57:54 -0700 (PDT)
Message-ID: <0e72e176-d7b0-ed10-08f3-ba7d4729a931@linaro.org>
Date:   Fri, 13 May 2022 08:57:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH V4 3/5] arm64: dts: nuvoton: Add initial support for
 MA35D1
Content-Language: en-US
To:     Jacky Huang <ychuang3@nuvoton.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, ychuang570808@gmail.com
Cc:     robh+dt@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org,
        arnd@arndb.de, olof@lixom.net, catalin.marinas@arm.com,
        will@kernel.org, soc@kernel.org, cfli0@nuvoton.com
References: <20220510032558.10304-1-ychuang3@nuvoton.com>
 <20220510032558.10304-4-ychuang3@nuvoton.com>
 <03ac0a67-bd1f-12ca-74f7-8d5b05857ea7@linaro.org>
 <46a55b01-ee9f-604f-72c9-916bc2f02a09@nuvoton.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <46a55b01-ee9f-604f-72c9-916bc2f02a09@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/05/2022 08:48, Jacky Huang wrote:
>>> +
>>> +	hxt_24m: hxt_24mhz {
>> No underscores in node name. Generic node names, so "clock-X" or
>> "clock-some-suffix"
> 
> OK, I will modify it as
>   hxt-24m: hxt-24mhz

No, it is not a generic node name. Please read my reply again.

> 
>>> +		compatible = "fixed-clock";
>>> +		#clock-cells = <0>;
>>> +		clock-frequency = <24000000>;
>> This does not look like property of SoC. Where is this clock defined? In
>> the SoC or on the board?
> 
> It's an external crystal on the board.
> I add this node, because it's the clock source of clock controller.
> It always present on all ma35d1 boards.
> 
>      clk: clock-controller@40460200 {
>          compatible = "nuvoton,ma35d1-clk";
>          reg = <0x0 0x40460200 0x0 0x100>;
>          #clock-cells = <1>;
>          clocks = <&hxt_24m>;
>          clock-names = "HXT_24MHz";
> ...
> 
>>> +		clock-output-names = "HXT_24MHz";
>>> +	};
>>> +
>>> +	timer {
>>> +		compatible = "arm,armv8-timer";
>>> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |
>>> +					  IRQ_TYPE_LEVEL_LOW)>,
>>> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) |
>>> +					  IRQ_TYPE_LEVEL_LOW)>,
>>> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) |
>>> +					  IRQ_TYPE_LEVEL_LOW)>,
>>> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) |
>>> +					  IRQ_TYPE_LEVEL_LOW)>;
>>> +		clock-frequency = <12000000>;
>>> +	};
>>> +
>>> +	sys: system-controller@40460000 {
>>> +		compatible = "nuvoton,ma35d1-sys", "syscon", "simple-mfd";
>> Why is this a simple-mfd if there are no children here? What do you want
>> to instantiate here?
> 
> It's not a device, but a set of registers for system level control.
> I want to provide a register base mapping for other devices to access 
> system control registers.

This does not explain why you need simple-mfd. simple-mfd is not for
providing a register base mapping for other devices.

> 
>> Where is the nuvoton,ma35d1-sys compatible documented?
> 
> OK, I will add the compatible document in next version.
> 
> 
>>> +		reg = <0x0 0x40460000 0x0 0x400>;
>>> +	};
>>> +
>>> +	reset: reset-controller {
>>> +		compatible = "nuvoton,ma35d1-reset";
>> Also not documented.
> 
> I will also add the document for it.

All of these should fail on checkpatch which points that you either did
not run it or ignored the result.

Please run checkpatch on all your submissions to Linux kernel and be
sure that there is no warning or error.



Best regards,
Krzysztof
