Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA89C6FD1F
	for <linux-clk@archiver.kernel.org>; Wed, 22 Mar 2023 09:00:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbjCVJAD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Mar 2023 05:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbjCVJAC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Mar 2023 05:00:02 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5909151FBE
        for <linux-clk@vger.kernel.org>; Wed, 22 Mar 2023 02:00:00 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso10928511wmo.0
        for <linux-clk@vger.kernel.org>; Wed, 22 Mar 2023 02:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679475599;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDWhDX61pEZpOC/Qh13y4vUXorcsmxd3OlXqgNKWZDE=;
        b=6ZA1ZR0/6wDTVRFkHZ92A3pWWOaEVFibEUDA2P1NJrTPCxZKUEMVdqJjYgTBqdtVMr
         jf9G4qnFGWwfZtb6Pw2RIFJc8RRypESQBA5aMuxN3kPE1pBIzOzz1F58MaqlGNKk2b8I
         rGWVn24/ZxHflRtjl9HY7ie6KpvoykJC/Kmdm2lUTyeuGfDG7iF759fLGUFLWtm/KrfU
         /LmyrHPaGWOuml9/+rTHx5kZJYJLH5BrYqfeYnyphFcfJ/p7RXTWRYFf38IIvQbF+Ozl
         lnROV0+6f/ZFeheb2lDHILWur9oG7LOqxJ0GmzshAW9uhbLB38O00WPlc6NbDw7jEB62
         UcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679475599;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PDWhDX61pEZpOC/Qh13y4vUXorcsmxd3OlXqgNKWZDE=;
        b=DM/gki2MKJ4a63YVnRcpo39o/7mAr1/j6RoHrYKZPzXJgr6+6zCyG2WJBm89/t+rf7
         3YoY7q4BIYyi0CbPnvU8tBmv7B27AMqpht/zSZLoII7Tp7PlZ3U6+tplacIeM4skCQ/R
         Org0VTb5HbPlhpwoatzeQ+ReXyKluIbxY0vIChPVcbDSr2t8VlypRAyHb1bwwaxqbql6
         u4dGITb6LMWS14dAAiaBndvMwxPkyKI7uvI2qLiXgwrKzv5jPRt3B4dDEv8DqTh9AQEX
         lFlsbMaiSZt9WoKki+jAQY/R1hY8MShEURMB92+XD30Ao15OMA3RbzyAfnUYAt/A82oC
         adDA==
X-Gm-Message-State: AO0yUKUvFFJUUxRtnUTKe75vxFVJAeh+6rEpklPVeUKbKl8266vRvE31
        WzIwlacryzbkh5PRYet3uQ0Zcg==
X-Google-Smtp-Source: AK7set/l+T35hALC3b1FNj8Sid6f9cfqYeNM7XX9QpST1HgtuW/nZ4b26CCHYsecaWGcPNr2Fn6QPA==
X-Received: by 2002:a05:600c:3781:b0:3ed:b103:4fe5 with SMTP id o1-20020a05600c378100b003edb1034fe5mr4724897wmr.31.1679475598769;
        Wed, 22 Mar 2023 01:59:58 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id u15-20020a05600c19cf00b003ee5fa61f45sm1223082wmq.3.2023.03.22.01.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 01:59:58 -0700 (PDT)
References: <20230320113445.17260-1-yu.tu@amlogic.com>
 <CAFBinCAE-ihq9oeXc=GqUEHVKUYM+n_e+2_5+gDMTGQcEEhRtg@mail.gmail.com>
 <b5e647e2-4561-e6c1-016f-2c3b260916bb@amlogic.com>
 <1jsfdy77n8.fsf@starbuckisacylon.baylibre.com>
 <d403dda4-e3db-4f26-6996-090a8c520b94@amlogic.com>
User-agent: mu4e 1.8.13; emacs 28.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Yu Tu <yu.tu@amlogic.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, kelvin.zhang@amlogic.com,
        qi.duan@amlogic.com
Subject: Re: [PATCH V2] clk: meson: vid-pll-div: added meson_vid_pll_div_ops
 support
Date:   Wed, 22 Mar 2023 09:41:39 +0100
In-reply-to: <d403dda4-e3db-4f26-6996-090a8c520b94@amlogic.com>
Message-ID: <1j8rfp6u0h.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Wed 22 Mar 2023 at 15:46, Yu Tu <yu.tu@amlogic.com> wrote:

> On 2023/3/21 17:41, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
> Hi Jerome,
> 	Thank you for your reply.
>> On Tue 21 Mar 2023 at 10:29, Yu Tu <yu.tu@amlogic.com> wrote:
>>=20
>>> Hi Martin=EF=BC=8C
>>> 	First of all, thank you for your reply.
>>>
>>> On 2023/3/20 23:35, Martin Blumenstingl wrote:
>>>> [ EXTERNAL EMAIL ]
>>>> Hello Yu Tu,
>>>> On Mon, Mar 20, 2023 at 12:35=E2=80=AFPM Yu Tu <yu.tu@amlogic.com> wro=
te:
>>>>>
>>>>> Since the previous code only provides "ro_ops" for the vid_pll_div
>>>>> clock. In fact, the clock can be set. So add "ops" that can set the
>>>>> clock, especially for later chips like S4 SOC and so on.
>>>>>
>>>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>>>> ---
>>>> please describe the changes you did compared to the previous version(s)
>>>
>>> I'll add it in the next version.
>>>
>>>> [...]
>>>>> diff --git a/drivers/clk/meson/vid-pll-div.h b/drivers/clk/meson/vid-=
pll-div.h
>>>>> index c0128e33ccf9..bbccab340910 100644
>>>>> --- a/drivers/clk/meson/vid-pll-div.h
>>>>> +++ b/drivers/clk/meson/vid-pll-div.h
>>>>> @@ -10,11 +10,14 @@
>>>>>    #include <linux/clk-provider.h>
>>>>>    #include "parm.h"
>>>>>
>>>>> +#define VID_PLL_DIV_TABLE_SIZE         14
>>>> In v1 you used ARRAY_SIZE(vid_pll_div_table) wherever this new macro
>>>> is used instead.
>>>> I think using ARRAY_SIZE is the better approach because it means the
>>>> references will update automatically if an entry is added/removed from
>>>> vid_pll_div_table
>>>
>>> I agree with you. Perhaps the key is to understand what Jerome said.
>> I asked you to describe how this divider actually works. Not remove
>> ARRAY_SIZE().
>
> OKay! I misunderstood your meaning.
>
>> This divider uses tables only because the parameters are "magic".
>> I'd like the driver to be able come up with "computed" values instead.
>> What I requested is some explanation about how this HW clock works
>> because the documentation is not very clear when it comes to this. These
>> values must come from somewhere, I'd like to understand "how".
>> This is the same as the PLL driver which can take a range and come up
>> with the different parameters, instead of using big pre-computed tables.
>>=20
>>>
>>>> Also I think there's a different understanding about what Jerome
>>>> previously wrote:
>>>>> It would be nice to actually describe how this vid pll work so we can
>>>>> stop using precompute "magic" values and actually use the IP to its f=
ull
>>>>> capacity.
>>>>   From what I understand is that you interpreted this as "let's change
>>>> ARRAY_SIZE(vid_pll_div_table) to a new macro called
>>>> VID_PLL_DIV_TABLE_SIZE".
>>>> But I think what Jerome meant is: "let's get rid of vid_pll_div_table
>>>> and implement how to actually calculate the clock rate - without
>>>> hard-coding 14 possible clock settings in vid_pll_div_table". Look at
>>>> clk-mpll.c and/or clk-pll.c which allow calculating arbitrary rates
>>>> without any hard-coded tables.
>>>
>> exactly ... or at least an explanation about how it works and
>> why it is too complicated to compute the values at runtime.
>>=20
>>> In fact, pll and mpll are also fixed register writes corresponding
>>> values.
>> That is not true. The pll and mpll drivers are able to compute their
>> values at runtime. Please have a look at the drivers.
>>=20
>
> After consulting the engineer of the chip design, the clock is a digital
> frequency divider, and the frequency divider is verified by the sequence
> generator, which is bit0-bi15. bit16-bit17 confirms the size of the
> frequency division.

That, we already know. This is what the datasheet already give us.
It is still a bit light.

You don't set the bit randomly and check the output, do you ?

The question is how setting this bit impact the relation between
the input and output rate? IOW, from these 17bits, how do you come up
with the multiplier and divider values (and the other way around) ?=20

> Whereas other PLLS and MPLLS are analog dividers so
> there are fixed formulas to calculate.
>
> So Neil had no problem implementing it this way. So now I want to know yo=
ur
> advice what should I do next?

1) Neil did what he could to get compute the rate (RO) which the little
information he had. You are trying to extend the driver, keeping an
dummy approach. It is only fair that I ask you to make this a real
driver.

2) Because something has been done once, it not necessarily appropriate
to continue ... this type of argument hardly a valid reason.

I don't want to keep adding table based driver unless necessary.
So far, you have not proved this approach is really required, nor
provided the necessary information to make the calculation.

>
>>> But every SOC is different, so it makes more sense to set it
>>> outside. The VID PLL is a fixed value for all current SoCs.
>>>
>>>> Best regards,
>>>> Martin
>>>>
>>=20

