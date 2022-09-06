Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A3DECAAD5
	for <linux-clk@archiver.kernel.org>; Tue,  6 Sep 2022 16:05:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234226AbiIFQFW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Sep 2022 12:05:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238766AbiIFQFC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Sep 2022 12:05:02 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19A3A97D5C
        for <linux-clk@vger.kernel.org>; Tue,  6 Sep 2022 08:27:19 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id az27so16011311wrb.6
        for <linux-clk@vger.kernel.org>; Tue, 06 Sep 2022 08:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date;
        bh=2ftVrhJ2ARmqdOZep9hKyjQ5LHRHmHjpAzPE66E9Y1A=;
        b=EfkiMmAeB85b3QEHkmGHZq8s1UM0MyK/4EayEn/KsEOtPunLFWXfOncGuBK9OHESUZ
         vAeOdVtn7K76Hbx9Fd4tn+MULEfKmzhtdBIyoIwGqjZQWjQg0Y+JxdqJ6XLPvpc+1GS2
         U2clJjd80TldQNYjMTwCL97cXnvIYfW/8RyGorBLPhz+7rNeYOFeo1XZ2QBrcG7ek360
         7EfVwmuEjFcFMB0rR0u/t/QsWAZiPVF4JxaiiD7U+8S2TCIoWFsEKcY9VPEh/p9A+6yo
         uXPeNU7Z/gqf0w/f9VoXdXhF2R9M+KNNhrdeEJzTzfaKPGF0T37pzbixSN5YfjCJgEYU
         zRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date;
        bh=2ftVrhJ2ARmqdOZep9hKyjQ5LHRHmHjpAzPE66E9Y1A=;
        b=BlCk+C8S5u/FuiGe19B+E1DmjbiA8hnIqkY1HZ8luJYkCbo68kZ4nUlmdgkud13X+4
         DrszOEXeHDR2K98IVNjwiNrktdrbRvSxbPQkOPO9tCOadcXRKyruaSC/G39c+FVN5d4m
         DQ+xaqd3AdG8oPzYANXFC5tbQTl8JcImdpROI1x/oMfWccwnufh+Rb9W5+q6o0COet85
         D8Ab/VBZl1dwnSfvib6CYapjO8OSF5QfxLMTe45eUFtJ+SugCyCCPzUG7ON9+9gxS9py
         fLKUJIGcgKECdEadbA7RtphTXXuDodttM6H7WMM/sDo9BYbba9eYuXnUcf45kXoha9LJ
         6Lkw==
X-Gm-Message-State: ACgBeo0UcUg/EWupAPPSC312Kh+byBmG7i0fSYX3AE2DwBAwmu3pw+9r
        kszxKGRkmmxDziTXTHQybDlFbA==
X-Google-Smtp-Source: AA6agR5m+704HO1TtHOZMt8JRn6bP2bshBPTpy03cweYCsADjDWv6RkZUSP2p35bBrcnAqqtDsDiLw==
X-Received: by 2002:a5d:6f19:0:b0:228:d8e8:3ac8 with SMTP id ay25-20020a5d6f19000000b00228d8e83ac8mr2301832wrb.101.1662478037738;
        Tue, 06 Sep 2022 08:27:17 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id l20-20020a05600c089400b003a30fbde91dsm20501242wmp.20.2022.09.06.08.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 08:27:17 -0700 (PDT)
References: <cc80cda0-4dda-2e3e-3fc8-afa97717479b@gmail.com>
 <1jk06rtlrv.fsf@starbuckisacylon.baylibre.com>
 <09befaaf-b34a-aeda-5dd6-6bfae4b01163@amlogic.com>
User-agent: mu4e 1.8.7; emacs 28.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Yu Tu <yu.tu@amlogic.com>, Heiner Kallweit <hkallweit1@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>
Cc:     "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-clk@vger.kernel.org,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH RESEND] clk: meson: pll: copy retry workaround from
 vendor driver
Date:   Tue, 06 Sep 2022 17:21:10 +0200
In-reply-to: <09befaaf-b34a-aeda-5dd6-6bfae4b01163@amlogic.com>
Message-ID: <1jo7vswmjw.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Tue 30 Aug 2022 at 14:33, Yu Tu <yu.tu@amlogic.com> wrote:

> On 2022/8/29 17:54, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>> On Sun 14 Aug 2022 at 23:25, Heiner Kallweit <hkallweit1@gmail.com>
>> wrote:
>> 
>>> On a S905X4-based system this call fails randomly.
>>> The vendor driver has a retry mechanism and on my system
>>> the second attempt is successful always.

Heiner, ideally commit message should not be about 'your' system
but describe what the system actually is. This would be more useful down
the road.

Based on Yu Tu feedback I'd propose

'
The PCIe PLL locking may be unreliable under some circumstance, such as
high or low temperature. If the PLL fails to lock, reset it a try again.

This helps on the S905X4
'

If this is OK with you, I can amend the message before applying the
patch, or you may resubmit. As you wish.

>>>
>> This reason looks a bit weak to me.
>> I'd like AML team to comment on this PLL problem as I suspect it might
>> relate to other PLL we have been seeing
>
> First of all, we've had this problem before. But the probability is very
> low, most of the PLL will not lock when the chip is tested at high and low
> temperature.
>
> Our actual code has retry mechanism to solve the above problem.
>
>> 
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>> ---
>>>   drivers/clk/meson/clk-pll.c | 12 ++++++++----
>>>   1 file changed, 8 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
>>> index 9e55617bc..daa025b6d 100644
>>> --- a/drivers/clk/meson/clk-pll.c
>>> +++ b/drivers/clk/meson/clk-pll.c
>>> @@ -320,12 +320,16 @@ static int meson_clk_pll_is_enabled(struct clk_hw *hw)
>>>     static int meson_clk_pcie_pll_enable(struct clk_hw *hw)
>>>   {
>>> -	meson_clk_pll_init(hw);
>>> +	int retries = 10;
>>>   -	if (meson_clk_pll_wait_lock(hw))
>>> -		return -EIO;
>>> +	do {
>>> +		meson_clk_pll_init(hw);
>>> +		if (!meson_clk_pll_wait_lock(hw))
>>> +			return 0;
>>> +		pr_info("Retry enabling PCIe PLL clock\n");
>>> +	} while (--retries);
>>>   -	return 0;
>>> +	return -EIO;
>>>   }
>>>     static int meson_clk_pll_enable(struct clk_hw *hw)
>> .

