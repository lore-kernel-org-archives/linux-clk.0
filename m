Return-Path: <SRS0=a61j=R2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC63C43381
	for <linux-clk@archiver.kernel.org>; Sat, 23 Mar 2019 09:54:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EDCF8218E2
	for <linux-clk@archiver.kernel.org>; Sat, 23 Mar 2019 09:54:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gwWzqPth"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbfCWJyi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 23 Mar 2019 05:54:38 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41197 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbfCWJyi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Mar 2019 05:54:38 -0400
Received: by mail-wr1-f68.google.com with SMTP id p1so4815073wrs.8
        for <linux-clk@vger.kernel.org>; Sat, 23 Mar 2019 02:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-transfer-encoding;
        bh=LZsgGSRiHVyy8KXZJ/fdCilFLcMfaL3cQ5uUGgOqwJI=;
        b=gwWzqPthMGF5iL8VwWjX2OHhJ3Qk3PwMrb26W7wF9dTi25yk69buGl7f4n56zALRYp
         cut+Ts3UehrevT7n2uA9IaQQB6/LGuTMjU/8unRbBiHosplc5IZOfefn2JLr+g9Qy6BJ
         K6CntA23O2reHQxXjFfco2dUH7/X5pGOE3JT4AVYSL63+wBurKz6mC2BuYPiyVQs9l5I
         lHtGW4sD9GcUfmQfst/oT/GEFcNGLfT1EK7KVoQrWTnBmXhyr2D0nxwOq1BSvz8eohm7
         OTRFIWjUfM0vyTBHITL2jnwBV8S8uOslkQQpOAEGlRSjD9ZrZtYd0EZfY+630ueA51GS
         S8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-transfer-encoding;
        bh=LZsgGSRiHVyy8KXZJ/fdCilFLcMfaL3cQ5uUGgOqwJI=;
        b=kRw8MglhWPN36ZXyycZHj+6lKGaWIDzQthSsZmTJJqNKQFFfHSw+vDzBiI2N9rlCHt
         KakYbQi1AQOYhOKtfZIsBszDAikNOiXAs6CRGs2ErhKp0zj/nGjV5jINMcKEpt6foHMv
         2p2MoTT6TSJiA4TxxMmqVID0BtRAD3x9FLoKFgsm6E6nBX0y1XxuFLnPRk5dK38/UvFJ
         ja/0+L5wR2pOZZm2F2b9QJYY5Lrv28RBNLyxYM/XZU4ccbmNyQ/TJcSxmgSrbL6K/Jef
         yH4yv+Q81Baq0b4Dz1bGK7p6t8Y4grFGH0TJVNTYRjPNdegKZwh04G0pr8cG0RL76X5z
         R89Q==
X-Gm-Message-State: APjAAAVKwAPpFVGZY6EfF1r1c7k5niH14gia+nI4Ed4QyZsHNsbDPiAR
        5j6mErKyhDaYUzns4B36i0IkoA==
X-Google-Smtp-Source: APXvYqzNfmI8LIiM8dY3YDPviN0ndzEyEqvMoyppacfjRNniH45/uAfKJG6xhMEfH25vkUdKxHV7VA==
X-Received: by 2002:a5d:428f:: with SMTP id k15mr10084894wrq.113.1553334876368;
        Sat, 23 Mar 2019 02:54:36 -0700 (PDT)
Received: from [192.168.1.77] (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id w9sm5704710wmi.0.2019.03.23.02.54.35
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 23 Mar 2019 02:54:35 -0700 (PDT)
Message-ID: <5C96025A.1010005@baylibre.com>
Date:   Sat, 23 Mar 2019 10:54:34 +0100
From:   Neil Armstrong <narmstrong@baylibre.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To:     Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        jbrunet@baylibre.com, linux-amlogic@lists.infradead.org
CC:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: clock: meson8b: drop the "ABP" clock
 definition
References: <20190319214123.27219-1-martin.blumenstingl@googlemail.com> <20190319214123.27219-2-martin.blumenstingl@googlemail.com> <b7d2edf1-da66-a09f-5f29-28f37ce3f06b@baylibre.com> <7hmulmzcsi.fsf@baylibre.com>
In-Reply-To: <7hmulmzcsi.fsf@baylibre.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



Le 23/03/2019 00:53, Kevin Hilman a écrit :
> Neil Armstrong <narmstrong@baylibre.com> writes:
> 
>> On 19/03/2019 22:41, Martin Blumenstingl wrote:
>>> Commit 8e1dd17c8b0e3f ("dt-bindings: clock: meson8b: export the CPU post
>>> dividers") added a new clock ID "CLKID_ABP" which contains a typo. This
>>> was fixed by adding a new (typo-free) #define CLKID_APB in
>>> commit 40d08f774c17ad ("dt-bindings: clock: meson8b: add APB clock
>>> definition").
>>> Now that the new #define is used by the driver we can remove the old
>>> one (because the old one is not used anywhere).
>>>
>>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>> ---
>>>  include/dt-bindings/clock/meson8b-clkc.h | 1 -
>>>  1 file changed, 1 deletion(-)
>>>
>>> diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
>>> index 8067077a62ca..cd11628f50f8 100644
>>> --- a/include/dt-bindings/clock/meson8b-clkc.h
>>> +++ b/include/dt-bindings/clock/meson8b-clkc.h
>>> @@ -103,7 +103,6 @@
>>>  #define CLKID_MPLL1		94
>>>  #define CLKID_MPLL2		95
>>>  #define CLKID_NAND_CLK		112
>>> -#define CLKID_ABP		124
>>>  #define CLKID_APB		124
>>>  #define CLKID_PERIPH		126
>>>  #define CLKID_AXI		128
>>>
>>
>> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> Neil / Jerome, I'm assuming you will queue this via the clk-meson tree?

Yes,

Neil

> 
> Kevin
> 
