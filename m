Return-Path: <SRS0=1K30=OJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F22CC04EB8
	for <linux-clk@archiver.kernel.org>; Fri, 30 Nov 2018 18:15:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B6EB20867
	for <linux-clk@archiver.kernel.org>; Fri, 30 Nov 2018 18:15:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lTmE76vM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B6EB20867
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbeLAFZ5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 1 Dec 2018 00:25:57 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43725 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725754AbeLAFZ5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 1 Dec 2018 00:25:57 -0500
Received: by mail-pl1-f193.google.com with SMTP id gn14so3175962plb.10
        for <linux-clk@vger.kernel.org>; Fri, 30 Nov 2018 10:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=a3dE7u0/L8JmGeXT/U0F8DBfPvTii0uuME30CGQSW2o=;
        b=lTmE76vMfgurJ3Jz7exdoovIE9xFWCpPgZqXeK783x4Y226aoyknHl4IDkktYJ3dFN
         kC6jhRHOGSXl9TbApOtDPx3CRz+f3w6q30ksb1LJ2bCjKsUY1v3p/fiK1fBvGo7QZ3s6
         sio69fHVU7ncYE/6toxXr7X75kxYeuamk+VmChJP2vxeDJgfB/v1hEpb4x/5JMY2iBnw
         WtdkAH5eOQYvTQ/4cnlCcIT+f7FKygdxvUolMviUqAgTF93pA+jPHBH5yNmfldMrDV8d
         qKW4VPfu/23VcOQkSjiJBJwGbjGqiLUxVBxR+EACX2GsEItl12nH+BZAqOiOjzSn3lDB
         vRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=a3dE7u0/L8JmGeXT/U0F8DBfPvTii0uuME30CGQSW2o=;
        b=dXbLf4Dm4IDByaug5fAyp5RNZI85jF6qZimzEmgMN3002rB46BeOPQEUZQg1USeusq
         Ufz4hHWq00ZIMuoE8/0HZiZXungu9Xsdc2DylMTzfgNipw7E7FmXObuOh6IUV9lF45m0
         9BritgBXcw65mDAwnWsAKIUgk14XrpGoflIGT37wudW9zGbOpdHfh+ioUNELzcMZnM8x
         b19HWvaZW2AZ6igCQnykA4uanHqocVvarAETbqrws/Gv7QA9wLMfW3tmsyhoBjIZNwX3
         jPONudm2YQbbrHv72eyFTWcDzjdLmHa2PdZBm7otXalndkUn3wUVWsjNaUUSDI3LS0By
         Bx0g==
X-Gm-Message-State: AA+aEWaK0n+wXyLBFXgaXD5EBQ/0PDLDa91RmjKCsHj2clubSBH7OtsE
        Y6+R9cK/HLbhpOWkpIBnIy6rsg==
X-Google-Smtp-Source: AFSGD/U4yPYdPMbRb/cLMB1PPuqbJzbun9vT+a2YChTutjRR6LeVD88WYYVmnwBQcAaosWrpYXbthw==
X-Received: by 2002:a17:902:e18d:: with SMTP id cd13mr6684510plb.262.1543601749324;
        Fri, 30 Nov 2018 10:15:49 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.googlemail.com with ESMTPSA id q75sm9528730pfa.38.2018.11.30.10.15.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Nov 2018 10:15:48 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        jbrunet@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, carlo@caione.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 3/3] ARM: dts: meson: switch the clock controller to the HHI register area
In-Reply-To: <6720a94f-ee87-937c-e360-87c2e37d29aa@baylibre.com>
References: <20181028120859.5735-1-martin.blumenstingl@googlemail.com> <20181028120859.5735-4-martin.blumenstingl@googlemail.com> <6720a94f-ee87-937c-e360-87c2e37d29aa@baylibre.com>
Date:   Fri, 30 Nov 2018 10:15:48 -0800
Message-ID: <7hr2f25t4b.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 28/10/2018 13:08, Martin Blumenstingl wrote:
>> The clock controller on Meson8/Meson8m2 and Meson8b is part of a
>> register region called "HHI". This register area contains more
>> functionality than just a clock controller:
>> - the clock controller
>> - some reset controller bits
>> - temperature sensor calibration data (on Meson8b and Meson8m2 only)
>> - HDMI controller
>> 
>> Allow access to this HHI register area as "system controller". Also
>> migrate the Meson8 and Meson8b clock controllers to this new node.
>> 
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  arch/arm/boot/dts/meson.dtsi   |  7 +++++++
>>  arch/arm/boot/dts/meson8.dtsi  | 15 ++++++++-------
>>  arch/arm/boot/dts/meson8b.dtsi | 15 ++++++++-------
>>  3 files changed, 23 insertions(+), 14 deletions(-)
>> 
>> diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
>> index 0d9faf1a51ea..ad903d1a2cb6 100644
>> --- a/arch/arm/boot/dts/meson.dtsi
>> +++ b/arch/arm/boot/dts/meson.dtsi
>
> [...]
>
>>  
>> +&hhi {
>> +	clkc: clock-controller {
>> +		compatible = "amlogic,meson8-clkc";
>> +		#clock-cells = <1>;
>> +		#reset-cells = <1>;
>> +	};
>> +};
>> +
>>  &hwrng {
>>  	compatible = "amlogic,meson8b-rng", "amlogic,meson-rng";
>>  	clocks = <&clkc CLKID_RNG0>;
>> 
>
> Kevin,
>
> I didn't apply this one, but it can wait another cycle I think.

OK, I'll take that one through my dt branch.

I don't see any obvious dependency on the clock patches, so I can apply
it now and include it with my next round of PRs, so...

Queued for v4.21 (branch: v4.21/dt)

Thanks,

Kevin

