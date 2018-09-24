Return-Path: <SRS0=Dsg5=MG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9529BECE567
	for <linux-clk@archiver.kernel.org>; Mon, 24 Sep 2018 05:35:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 52F0D20989
	for <linux-clk@archiver.kernel.org>; Mon, 24 Sep 2018 05:35:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="F0A+IgX8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52F0D20989
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbeIXLfe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Sep 2018 07:35:34 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40462 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727420AbeIXLfb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Sep 2018 07:35:31 -0400
Received: by mail-wm1-f68.google.com with SMTP id o2-v6so2065353wmh.5
        for <linux-clk@vger.kernel.org>; Sun, 23 Sep 2018 22:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Z9R1aXWDdyaRlMfRGrp94QSZu/fyz5EfI5I6L2UcPxw=;
        b=F0A+IgX8KvCefyU4euLvooaN8cO+Z0pYMbkFBYMrjwVARWC0azKYZ4SdpFTUhsaGi8
         A6VyP3FiL1qHpmaymEvzUYH5q0i9Op5xgMz9NNjpzE4EgPk3xgJVKNwepYUgAc/kjLea
         jWMawZ9ALhUyFVxk/Osw8W0qusXqQ0HqRAh9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z9R1aXWDdyaRlMfRGrp94QSZu/fyz5EfI5I6L2UcPxw=;
        b=ueCxMVQjPIOLwDOYDfGkk/RpRzYh+fcMPOrsAsR4v9eg/qbyCvUhWjM5Zekjw/gdQ+
         3c2eLfWRC0rI9+Uo3bq7RPNuGeDn96c2bYJ0Q1nBusBtsS0UmxCk0MH24w06KiunC5Ya
         BzIYn75kFhmUbmj6Z4wEqYMUAkotNMBj7ujlK2ODQHTj2tddbM/Mp5QuDK90t8F1ie35
         nF1g9gSZWCxM5hd8Z2oWwxSdMVImiRU9CzY7Pwmzc7yKNvc3TRiYofSoSFYtOPgXYShT
         KD5+R3JHcQSzjlgklF/6naUyyk0GUs187sF587fpVDaHLYN4TB7gjWNUncOcplk4321X
         FFSA==
X-Gm-Message-State: APzg51CiW9F0Ds4T2LeDGUB79I48iIVRq6vOE3XxS/fZkcU7p+t/ItFW
        Hbe4tia67DScXjY13IQmqUbW6A==
X-Google-Smtp-Source: ACcGV60TeS+4vcb6rH4dZXvnDjrJlrphbSBaoBASF7zbDuvGACWs16RYgXPlwsoESjE1xZsta9UP8g==
X-Received: by 2002:a1c:f210:: with SMTP id s16-v6mr4263888wmc.36.1537767307505;
        Sun, 23 Sep 2018 22:35:07 -0700 (PDT)
Received: from [192.168.0.41] (89.154.136.77.rev.sfr.net. [77.136.154.89])
        by smtp.googlemail.com with ESMTPSA id g2-v6sm2558997wmh.16.2018.09.23.22.35.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Sep 2018 22:35:06 -0700 (PDT)
Subject: Re: [PATCH v7 05/24] clocksource: Add a new timer-ingenic driver
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Mathieu Malaterre <malat@debian.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>, linux-doc@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        od@zcrc.me, linux-mips@linux-mips.org,
        Paul Burton <paul.burton@mips.com>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ralf Baechle <ralf@linux-mips.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-pwm@vger.kernel.org
References: <5ba8750a.1c69fb81.501e8.d0f0SMTPIN_ADDED_MISSING@mx.google.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <58645f14-aec2-4f66-3a39-34beeabdb035@linaro.org>
Date:   Mon, 24 Sep 2018 07:35:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <5ba8750a.1c69fb81.501e8.d0f0SMTPIN_ADDED_MISSING@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180924053505.uy1QtyE8-84U6w3Bh6fvT7DSZ8M09eQNgp-VpP25PeU@z>

On 24/09/2018 07:24, Paul Cercueil wrote:
> Hi Daniel,
> 
> Le 24 sept. 2018 05:12, Daniel Lezcano <daniel.lezcano@linaro.org> a écrit :
>>
>> On 21/08/2018 19:16, Paul Cercueil wrote: 
>>> This driver handles the TCU (Timer Counter Unit) present on the Ingenic 
>>> JZ47xx SoCs, and provides the kernel with a system timer, and optionally 
>>> with a clocksource and a sched_clock. 
>>>
>>> It also provides clocks and interrupt handling to client drivers. 
>>
>> Can you provide a much more complete description of the timer in order 
>> to make my life easier for the review of this patch? 
> 
> See patch [03/24], it adds a doc file that describes the hardware.

Thanks, I went through but it is incomplete to understand what the timer
do. I will reverse-engineer the code but it would help if you can give
the gross approach. Why multiple channels ? mutexes and completion ?


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

