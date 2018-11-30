Return-Path: <SRS0=1K30=OJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87EBAC04EB8
	for <linux-clk@archiver.kernel.org>; Fri, 30 Nov 2018 20:15:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A9422145D
	for <linux-clk@archiver.kernel.org>; Fri, 30 Nov 2018 20:15:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1BDPI016"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A9422145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbeLAHZy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 1 Dec 2018 02:25:54 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39992 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725749AbeLAHZy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 1 Dec 2018 02:25:54 -0500
Received: by mail-pg1-f195.google.com with SMTP id z10so2953092pgp.7
        for <linux-clk@vger.kernel.org>; Fri, 30 Nov 2018 12:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=S3h6x4Q6TrOxECPjVHrAnOIqdyNtF6hqLenH5hJehdU=;
        b=1BDPI016xvgYrBLeoB62dQHpwLB4u7nmTdmzYm/r1EILuZYxUYhkxo6YpxZ2lOV+HM
         OaPenc/9vtVpdI1aoa7Iv/ItFmFad1uZeXqGkQOeMGRx3Q1X+s4doIK3tw0IhG4IEIyK
         IJ+ttaMXcEOB8ad1tCl7bHuynKvAUdH1BItClmooTefHx+f6uqXUU3EQyDF0WItQryef
         T0MCjUwsTI/97ohpUYv62G1ox3dwj0MxeKPHh2EwoJsPCDTnUGBc0HB3VW54e6idPmkK
         WgZbr/fom5tBk61cfFUGBLm3bGpJUUohiSy4pglJVocJfLU/aXmQ6EXIPxiYl4xYJSPE
         cG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=S3h6x4Q6TrOxECPjVHrAnOIqdyNtF6hqLenH5hJehdU=;
        b=W13qs32GfApEYCEbCIlvjDD/AvT2uhq0wPAiDibvO3R50brs8X7vOyYza+QCMHQKny
         Ip/NmfQYRu4m68chDcSkF7lOiZs2dObSDmi7Hpi3Vn+kziJIS8kdlYo3muMlp7zunU25
         pvIBV4GhPzDf5ue1cNWez+aEEzKaTcatDv4/lp/ZXS1sf8LRIJF7+7wHUbtrH/B1QgrQ
         ZTyC1wRCoGGOjgWh029w+nUh+Ie454v+7ZjxLCH7ctyvzSnaThIkeIZUHFU7GbMMg1mV
         lq2IcUq8Jj4V+LEJqzRUMf9GpdMuH07PF4zgAVp6WBKx466gA9r2RNXMgx/7XmUMeYz8
         DiAw==
X-Gm-Message-State: AA+aEWbrVyZr2hlyEe6zcI5HpgJTH+RRL95NlalkE0trL4/468tp6Wa0
        eMYPbgEBOyOENb7j52I19jq41w==
X-Google-Smtp-Source: AFSGD/V49rUfH8fSiVj9lIqkQmaS5zKDm9FsJ6emdVDwWAPh9VVJtvCljOHV+DWWbByptnRugnl8aw==
X-Received: by 2002:a63:7b06:: with SMTP id w6mr5951812pgc.288.1543608927356;
        Fri, 30 Nov 2018 12:15:27 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.googlemail.com with ESMTPSA id g15sm28232368pfj.131.2018.11.30.12.15.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Nov 2018 12:15:26 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        jbrunet@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, carlo@caione.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 3/3] ARM: dts: meson: switch the clock controller to the HHI register area
In-Reply-To: <7hr2f25t4b.fsf@baylibre.com>
References: <20181028120859.5735-1-martin.blumenstingl@googlemail.com> <20181028120859.5735-4-martin.blumenstingl@googlemail.com> <6720a94f-ee87-937c-e360-87c2e37d29aa@baylibre.com> <7hr2f25t4b.fsf@baylibre.com>
Date:   Fri, 30 Nov 2018 12:15:25 -0800
Message-ID: <7h4lby5nky.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Kevin Hilman <khilman@baylibre.com> writes:

> Neil Armstrong <narmstrong@baylibre.com> writes:
>
>> On 28/10/2018 13:08, Martin Blumenstingl wrote:
>>> The clock controller on Meson8/Meson8m2 and Meson8b is part of a
>>> register region called "HHI". This register area contains more
>>> functionality than just a clock controller:
>>> - the clock controller
>>> - some reset controller bits
>>> - temperature sensor calibration data (on Meson8b and Meson8m2 only)
>>> - HDMI controller
>>> 
>>> Allow access to this HHI register area as "system controller". Also
>>> migrate the Meson8 and Meson8b clock controllers to this new node.
>>> 
>>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
>>> ---
>>>  arch/arm/boot/dts/meson.dtsi   |  7 +++++++
>>>  arch/arm/boot/dts/meson8.dtsi  | 15 ++++++++-------
>>>  arch/arm/boot/dts/meson8b.dtsi | 15 ++++++++-------
>>>  3 files changed, 23 insertions(+), 14 deletions(-)
>>> 
>>> diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
>>> index 0d9faf1a51ea..ad903d1a2cb6 100644
>>> --- a/arch/arm/boot/dts/meson.dtsi
>>> +++ b/arch/arm/boot/dts/meson.dtsi
>>
>> [...]
>>
>>>  
>>> +&hhi {
>>> +	clkc: clock-controller {
>>> +		compatible = "amlogic,meson8-clkc";
>>> +		#clock-cells = <1>;
>>> +		#reset-cells = <1>;
>>> +	};
>>> +};
>>> +
>>>  &hwrng {
>>>  	compatible = "amlogic,meson8b-rng", "amlogic,meson-rng";
>>>  	clocks = <&clkc CLKID_RNG0>;
>>> 
>>
>> Kevin,
>>
>> I didn't apply this one, but it can wait another cycle I think.
>
> OK, I'll take that one through my dt branch.
>
> I don't see any obvious dependency on the clock patches,

... and a quick boot test shows I was wrong, and should've (re)read
Martin's cover letter a couple more times. :)

I think it's best to leave this one until the next cycle when all the
deps are merged.

Kevin
