Return-Path: <SRS0=Wnie=N3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E688C43441
	for <linux-clk@archiver.kernel.org>; Fri, 16 Nov 2018 23:19:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C5402086A
	for <linux-clk@archiver.kernel.org>; Fri, 16 Nov 2018 23:19:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="l75j07P/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C5402086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728809AbeKQJdW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 17 Nov 2018 04:33:22 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41998 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbeKQJdW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 17 Nov 2018 04:33:22 -0500
Received: by mail-pg1-f195.google.com with SMTP id d72so7780762pga.9
        for <linux-clk@vger.kernel.org>; Fri, 16 Nov 2018 15:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=qcbldZMu68BJoiL+02D1gKTjracjjQPQiOLPdGDzgRk=;
        b=l75j07P/X5D4FNJGd4UMUHMyfZRCenOAlrIGdH0cisJCx8KyEv9yxS7vLKzm+kiY4p
         AWQi9x/zpru83EyswwA33XiSBs7erCnf/W9HZxHepioT4AH3U4N+ySy3FeJb0M/4qsDA
         fXTr6YYWcaN80oGDLovrRMxTWM/3uw2m4tIc6sL+/sdPD/tHWwREmpR+YQ6Jwxu0xttw
         uooND78pjFZKrNwui186jZOu1qAO+QX0XEShMYUnVbhpajJsha/gnbEG58crw/iFUW20
         qHB7Eq2IKoSSgl0oBWOBZv8VlIraOXQ35iYKoUNBPf3BJCxyLLikezpHe0wYFtqLJXoH
         gz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=qcbldZMu68BJoiL+02D1gKTjracjjQPQiOLPdGDzgRk=;
        b=Kn7YQzZ7/dN3Hc9fgbmW7qSyLGznHYq0jCIikDSlx017Pw8QR5BA2eDKXyBoCS2xKz
         JtGruOBwKcNVohwIf40S9pYt9wfOGXhDM5KyVlnbqhzwuWUi9JYnbjPl7h5oiEdKW37e
         JChYgQypKW39LsPzo6f43aWQTAyvdqjTJ+VgJsaXcsj9TFOu5O4OZkj+1JK1Zp+CMozi
         x2H2iowgjYZanasyiQSfHVOYQeiq3QC2viKolhMKKHpiyu1VUqH9Y+tUY1HfRt7G6Kia
         xqhP3Z3K2w+IsU6175aXsEADi7u1v/f/+1ftTBDiJveXnXbd2rHZQUhvNkrC6RCcCxEY
         5P8Q==
X-Gm-Message-State: AGRZ1gL454A/kcrqC6UdXtj+VpkulmCuuEmqLlDxgNmFj37nkvHGr0R1
        hwqDeS8dSOLj9PlsnLim7pEqvQ==
X-Google-Smtp-Source: AJdET5fCNgKV0w9IoDCnzl4SeI+cwIBQG0BErv15el1OXqjZtWFXUcLL1wNSm78kUzQWEibWBDSD8w==
X-Received: by 2002:a63:1b48:: with SMTP id b8mr11792119pgm.187.1542410341553;
        Fri, 16 Nov 2018 15:19:01 -0800 (PST)
Received: from localhost ([216.234.200.180])
        by smtp.gmail.com with ESMTPSA id 19sm16308474pfs.108.2018.11.16.15.19.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Nov 2018 15:19:00 -0800 (PST)
From:   Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date:   Fri, 16 Nov 2018 15:18:59 -0800 (PST)
To:     Rob Herring <robh@kernel.org>
cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Palmer Dabbelt <palmer@sifive.com>,
        Megan Wachs <megan@sifive.com>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Paul Walmsley <paul@pwsan.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: clk: add documentation for the SiFive
 PRCI driver
In-Reply-To: <20181024184757.GA22367@bogus>
Message-ID: <alpine.DEB.2.21.9999.1811161510590.25712@viisi.sifive.com>
References: <20181020135024.28573-1-paul.walmsley@sifive.com> <20181020135024.28573-3-paul.walmsley@sifive.com> <20181024184757.GA22367@bogus>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 24 Oct 2018, Rob Herring wrote:

> On Sat, Oct 20, 2018 at 06:50:23AM -0700, Paul Walmsley wrote:
>> Add DT binding documentation for the Linux driver for the SiFive
>> PRCI clock & reset control IP block, as found on the SiFive
>> FU540 chip.
>>
>> Cc: Michael Turquette <mturquette@baylibre.com>
>> Cc: Stephen Boyd <sboyd@kernel.org>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Palmer Dabbelt <palmer@sifive.com>
>> Cc: Megan Wachs <megan@sifive.com>
>> Cc: linux-clk@vger.kernel.org
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-riscv@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
>> Signed-off-by: Paul Walmsley <paul@pwsan.com>
>> ---
>> v2: remove out-of-date example, add documentation for the compatible
>>     string and for the required PCB clock nodes
>>
>> .../bindings/clock/sifive/fu540-prci.txt      | 43 +++++++++++++++++++
>>  1 file changed, 43 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
>>
>> diff --git a/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
>> new file mode 100644
>> index 000000000000..d7c1e83fa5ed
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
>> @@ -0,0 +1,43 @@
>> +SiFive FU540 PRCI bindings
>> +
>> +On the FU540 family of SoCs, most system-wide clock and reset integration
>> +is via the PRCI IP block.
>> +
>> +Required properties:
>> +- compatible: Should be "sifive,<chip>-prci<version>".  As of the time this
>> +              file was written, only one value is supported:
>> +	      "sifive,fu540-c000-prci0"
>
> What happens with this depends on the discussion on the other bindings.

We'll drop the trailing 0 since the SoC identifier prefix should be 
sufficiently precise.

> Though here you are inconsistent without a fallback. Of course, I've
> never seen a clock controller be the same across SoCs.

As you write, the assumption is that chip integration IP blocks like this 
one are likely to be specific to individual SoCs.

This may not be universally true for SiFive looking into the future, but 
since we don't yet have a clear sense of the extent of exact reuse (i.e. 
chip "families"), am not yet comfortable with advocating something like 
"sifive,prci0" yet, as we do with the sifive-blocks.

>> +- reg: Should describe the PRCI's register target physical address region
>> +- clocks: Should point to the hfclk device tree node and the rtcclk
>> +          device tree node.  The RTC clock here is not a time-of-day clock,
>> +	  but is instead a high-stability clock source for system timers
>> +	  and cycle counters.
>> +- #clock-cells: Should be <1>
>> +
>> +The clock consumer should specify the desired clock via the clock ID
>> +macros defined in include/linux/clk/sifive-fu540-prci.h.  These macros
>> +begin with PRCI_CLK_.
>> +
>> +The hfclk and rtcclk nodes are required, and represent physical
>> +crystals or resonators located on the PCB.
>> +
>> +Examples:
>> +
>> +hfclk: hfclk {
>> +	#clock-cells = <0>;
>> +	compatible = "fixed-clock";
>> +	clock-frequency = <33333333>;
>> +	clock-output-names = "hfclk";
>> +};
>> +rtcclk: rtcclk {
>> +	#clock-cells = <0>;
>> +	compatible = "fixed-clock";
>> +	clock-frequency = <1000000>;
>> +	clock-output-names = "rtcclk";
>> +};
>> +prci0: prci@10000000 {
>
> clock-controller@...

Thanks; fixed.


- Paul
