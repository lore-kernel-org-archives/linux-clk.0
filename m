Return-Path: <SRS0=Dsg5=MG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45811C433F4
	for <linux-clk@archiver.kernel.org>; Mon, 24 Sep 2018 03:12:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BDB9120C0A
	for <linux-clk@archiver.kernel.org>; Mon, 24 Sep 2018 03:12:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="SnqAMKCC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDB9120C0A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbeIXJMb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Sep 2018 05:12:31 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53696 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726711AbeIXJMa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Sep 2018 05:12:30 -0400
Received: by mail-wm1-f67.google.com with SMTP id b19-v6so8111260wme.3
        for <linux-clk@vger.kernel.org>; Sun, 23 Sep 2018 20:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+SNeM+3rEiB9AOJ7flDOpSJUnC15RRsbdFD5lT7uKC0=;
        b=SnqAMKCCGlWIo/gOYkuoAs6fkjlHU+/PYDwsByRhX8K9QEb0k+OOvp7jo0cYnz0VoJ
         gYfDgSLx7YBuZk5tL1/bvp/R+CYcS+ic+3Urbh28xnTHUWHPmUSnSFi47oIsT+OaVRP3
         Wdr13LB00WqD50k9N2Q7Wke0wOF97W/UopqT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+SNeM+3rEiB9AOJ7flDOpSJUnC15RRsbdFD5lT7uKC0=;
        b=a8LCtSH42jrf46ufT/CQmWLEH61Vp6xjOMEq/Ep7EzONgoHnZ+214+Xx5NtUTFZor5
         SzB31sC7XABYR6H/J1fY++wXCtDbZPalg/BVTzpARhS9z40WH8rUFNcsAOHYixisaIl8
         NXtwepVU5+T/iltI5jR3e+Y1AfZeIyLkvu+GZGTcBcEDHZczVWOIslZ5vEwd3wpepVQ9
         NOYpUCS331268PVCjCvWVyiT4U1ybsNzJV3W8Rjkcn1sjukLIdP0kS2ec6URqHpv72F0
         ltL9aCgHyJDA06eJfPcxE8drTge0aY0TbMT/nkrEXL10zViYaHXcTfR3yceiag9H3g1m
         3Zqw==
X-Gm-Message-State: ABuFfoi3AUdpYXEVehFbunkmqcfwcfQ/RXivKf4fEdhLrtvnkh6T6zDI
        mTBE/Lypjx0weucHxVtItclM3m11w0M=
X-Google-Smtp-Source: ANB0Vdays2jX5iJ+DbdDiAqzMmKDj57HlI7Zx1ZrlnPZ6HnjXxnmIM3fgkhpedb1bS6kSJDV7g3VIA==
X-Received: by 2002:a1c:7711:: with SMTP id t17-v6mr5661512wmi.35.1537758751389;
        Sun, 23 Sep 2018 20:12:31 -0700 (PDT)
Received: from [192.168.0.41] (sju31-1-78-210-255-2.fbx.proxad.net. [78.210.255.2])
        by smtp.googlemail.com with ESMTPSA id k63-v6sm31067102wmd.46.2018.09.23.20.12.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Sep 2018 20:12:30 -0700 (PDT)
Subject: Re: [PATCH v7 05/24] clocksource: Add a new timer-ingenic driver
To:     Paul Cercueil <paul@crapouillou.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     od@zcrc.me, Mathieu Malaterre <malat@debian.org>,
        linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-mips@linux-mips.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20180821171635.22740-1-paul@crapouillou.net>
 <20180821171635.22740-6-paul@crapouillou.net>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <e0836866-552f-374b-d271-a4ea2d4953ac@linaro.org>
Date:   Mon, 24 Sep 2018 05:12:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180821171635.22740-6-paul@crapouillou.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180924031229.tnp99SczegU3xNX8DXto2c-P4kZOqTA4T76WSAMJ5R4@z>

On 21/08/2018 19:16, Paul Cercueil wrote:
> This driver handles the TCU (Timer Counter Unit) present on the Ingenic
> JZ47xx SoCs, and provides the kernel with a system timer, and optionally
> with a clocksource and a sched_clock.
> 
> It also provides clocks and interrupt handling to client drivers.

Can you provide a much more complete description of the timer in order
to make my life easier for the review of this patch?

Thanks

  -- Daniel

-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

