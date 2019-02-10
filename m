Return-Path: <SRS0=QJXt=QR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECC2C282C2
	for <linux-clk@archiver.kernel.org>; Sun, 10 Feb 2019 10:58:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7DB4320863
	for <linux-clk@archiver.kernel.org>; Sun, 10 Feb 2019 10:58:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="q1qpBOc9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbfBJK6i (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 10 Feb 2019 05:58:38 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40596 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbfBJK6h (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 10 Feb 2019 05:58:37 -0500
Received: by mail-wm1-f67.google.com with SMTP id q21so11375714wmc.5
        for <linux-clk@vger.kernel.org>; Sun, 10 Feb 2019 02:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-transfer-encoding;
        bh=qnM4uoHXmMhXZ2WSd2m5FOB3LMp6OfNKdQlrbW/TTYg=;
        b=q1qpBOc9iq42xCKxoPhadGJE4WlZWXtY37GRCPtarFZEgMbYqwXMTuY9giyQF7JeXi
         7Vu1dx7df40Dv5d8/ivsYI7B6deq2hZ5AY2NBv2txEL2yAWukJwyPzf5JL9R1LObS+s5
         wk/BIcy/xc4+1RRfhfNvvhaACBnxh4ALlc+Nrq9SY+pSF1cg94OcCQ15LL9WvY3UlFgA
         R+obMAEHLPfM8d9fIQtXhNza1TdWvMvJImoTaG9IrGnF1QFR1Su8Ryj/mm7wyG8JTcKB
         TZkFaPdkGu05NbjSN08f8yLOId8Qh09JvZWz8l8brR//cKcPQk32Pv7XgwqIj6LqzuBQ
         Uu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-transfer-encoding;
        bh=qnM4uoHXmMhXZ2WSd2m5FOB3LMp6OfNKdQlrbW/TTYg=;
        b=o6Bv+zeNq0rAuGTz6DwzMCo+ZNYPylyu21DEsyZDdetqpz7aWZnm+YCWJKyJMxZRvQ
         /DHy+I/PTbTz7wdplutRpyrTKJiks4+Ma4Km9njnKYxSywHzHC3MxUkw5icw/7I6JRE5
         9x2ajz4FwVTkPb8xMNfaXyxMF+MCT4h7ADl8kmvaUqU8CS8XT0jTmzjFGkBHaSM6/J24
         1F2uKtI2aJijtjLGrc+ypSXMnuIbEYvpGQ3P//34163/PaJOOIw7pwu6XKFscQIYkKB+
         FBXSw41RH43tZUZznKyasOdZXvBWSCJc4xw+gB/nYU0i0Dqv47+WFVnoAsumW3LmYjkr
         6NiQ==
X-Gm-Message-State: AHQUAuaE1IfQRg5JzhHUsj75nulmBBUsdXKNpieF2QQogUlWWKynA1LV
        SUJHpSwiT6DLueL7GZZeVzWyVw==
X-Google-Smtp-Source: AHgI3IY8naheJSREpzLbfwCC8Q7sn6SOObGst4S5tOs7vDBl5g/2npVP9CruZZ3USQS6Hk5orRztZg==
X-Received: by 2002:a5d:5101:: with SMTP id s1mr23514233wrt.89.1549796315457;
        Sun, 10 Feb 2019 02:58:35 -0800 (PST)
Received: from Armstrongs-MacBook-Pro.local (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id a144sm13286266wmd.30.2019.02.10.02.58.34
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 02:58:34 -0800 (PST)
Message-ID: <5C6003D9.9090304@baylibre.com>
Date:   Sun, 10 Feb 2019 11:58:33 +0100
From:   Neil Armstrong <narmstrong@baylibre.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC:     linux-amlogic@lists.infradead.org, jbrunet@baylibre.com,
        linux-clk@vger.kernel.org, sboyd@kernel.org,
        linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] clk: meson8b: fix typo "ABP" -> "APB"
References: <20190119205121.9621-1-martin.blumenstingl@googlemail.com> <095d0dca-f8d5-df7c-dbd0-7c2c50fcab82@baylibre.com> <CAFBinCCrYrxnb6Dk-0kGwbk0ttwe+je+wKZqxe6GUASnNdAckQ@mail.gmail.com>
In-Reply-To: <CAFBinCCrYrxnb6Dk-0kGwbk0ttwe+je+wKZqxe6GUASnNdAckQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Martin,

Le 09/02/2019 01:24, Martin Blumenstingl a écrit :
> Hi Neil,
> 
> On Mon, Jan 21, 2019 at 11:40 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> On 19/01/2019 21:51, Martin Blumenstingl wrote:
>>> It turns out that I'm not good at spelling "APB". Unfortunately an ABP
>>> (instead of APB) typo snug into two clocks in v5.0.
>>>
>>> Currently there are no users of that clock yet, so fix it now
>>> before it's too late (meaning before it's used by <something>).
>>>
>>> I decided to go the "normal" route where we can have separate
>>> branches for the dt-bindings and the drivers in the clk-meson
>>> repo. This means:
>>> - new (typo-free) clock #define
>>> - change the clock controller to use the new #define
>>> - (next development cycle) drop the old #define
>>>
>>>
>>> Changes since v1 at [0]:
>>> - split into a dt-bindings and clock controller driver patch
>>>
>>>
>>> [0] https://patchwork.kernel.org/cover/10742001/
>>>
>>>
>>> Martin Blumenstingl (2):
>>>   dt-bindings: clock: meson8b: add APB clock definition
>>>   clk: meson: meson8b: fix the naming of the APB clocks
>>>
>>>  drivers/clk/meson/meson8b.c              | 26 ++++++++++++------------
>>>  drivers/clk/meson/meson8b.h              |  2 +-
>>>  include/dt-bindings/clock/meson8b-clkc.h |  1 +
>>>  3 files changed, 15 insertions(+), 14 deletions(-)
>>>
>>
>> Once rob acks it, I'll apply both to next/drivers since it's not used (yet ?)
>> and not a critical fix.
> I have just noticed that I forgot to CC Rob and devicetree@vger.kernel.org.
> do you want me to re-send this series?

Yes please re-send !

Neil

> 
> as you already noticed this is not critical, so taking this through
> next/drivers is fine for me.
> 
> 
> Regards
> Martin
> 
