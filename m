Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B8DC6FD1D
	for <linux-clk@archiver.kernel.org>; Tue, 21 Mar 2023 09:53:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbjCUJxV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Mar 2023 05:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbjCUJxU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Mar 2023 05:53:20 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00404399CD
        for <linux-clk@vger.kernel.org>; Tue, 21 Mar 2023 02:53:17 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id u11-20020a05600c19cb00b003edcc414997so4201563wmq.3
        for <linux-clk@vger.kernel.org>; Tue, 21 Mar 2023 02:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679392396;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yA68mVCD9647FSmY0WIdU7C5V3TS02L03uEop8rxjQ=;
        b=j7FCeyRD6YBEXkRQv9mUPmCaBZopvhSVUbtRsIfzj/pnb4sqgsiAeDscdckWwXbJQo
         rjchjtuAqteH/0uW7PK9TnqwyoDcMRrcFz7dB33YBFhNPAseRGBOSnFSFF1j0sfC4pDm
         Baw24bVOKgGQ6ImuYOT2jDq/1oEJEwUaB80eP1jm2UWoPXPSfubmFCKdkED6PKIR6mOk
         DHx1w4KS1Aii4stKzbzr83UNUrIp4KKD+co/YPnxnGWlMBB+4EeyxqPZOBpBlGnEnAyg
         fHDV/uY1gYzSz5Z99GGxK6REzDia3BT2Fb/A5pD7b8IqziVsfd+iMHpitq1SgAo0i+w2
         omww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679392396;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8yA68mVCD9647FSmY0WIdU7C5V3TS02L03uEop8rxjQ=;
        b=lzdSttvWX2nJ98fSeH/tDcOmCHoP5jYRVgZUXNmvrzJPj5MbB+d5JOe22Obde4cCxG
         471/MMclmPst9XrjNRabDIFzdDGjE75bhD65en61O3VdoTtp6cuEO5A93B0QwvtH4DVY
         yQmigJ4MHul1SIu34K961h3vTszQCAYZCgJGbazZNI7uacZYRElTg6ThYcwnXolxdiUd
         brwty4ouJkB2TU8hnQHOeRcMWJK2LhZWnkU9WglDDV09rLv2MI3TkM2pvjFXAVBWHtSp
         y1RpOhWdWUW6EbFH71bxPoz27jqisx6rWieL8tu7b6BRX94o5Vlr4MhchGzH8sMZ/8H8
         kAUQ==
X-Gm-Message-State: AO0yUKUloJ8c2tHW6qfGCmJJGpJUjtgIc8smP2UdpAdjCGetJ0iQ8a+W
        C3kY2IpZ7n6rQKdbNEvEsJ9hxA==
X-Google-Smtp-Source: AK7set++dkFwaIUlLnHFajj9Ph/VXG0+DakPApcFT7auIiRl4rgMhGx0C7G/lIYM20rkGG0T7rr73A==
X-Received: by 2002:a1c:7717:0:b0:3e2:2467:d3f5 with SMTP id t23-20020a1c7717000000b003e22467d3f5mr1826132wmi.25.1679392396513;
        Tue, 21 Mar 2023 02:53:16 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id fc6-20020a05600c524600b003ee04190ddfsm4655830wmb.17.2023.03.21.02.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 02:53:16 -0700 (PDT)
References: <20230320113445.17260-1-yu.tu@amlogic.com>
 <CAFBinCAE-ihq9oeXc=GqUEHVKUYM+n_e+2_5+gDMTGQcEEhRtg@mail.gmail.com>
 <b5e647e2-4561-e6c1-016f-2c3b260916bb@amlogic.com>
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
Date:   Tue, 21 Mar 2023 10:41:33 +0100
In-reply-to: <b5e647e2-4561-e6c1-016f-2c3b260916bb@amlogic.com>
Message-ID: <1jsfdy77n8.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Tue 21 Mar 2023 at 10:29, Yu Tu <yu.tu@amlogic.com> wrote:

> Hi Martin=EF=BC=8C
> 	First of all, thank you for your reply.
>
> On 2023/3/20 23:35, Martin Blumenstingl wrote:
>> [ EXTERNAL EMAIL ]
>> Hello Yu Tu,
>> On Mon, Mar 20, 2023 at 12:35=E2=80=AFPM Yu Tu <yu.tu@amlogic.com> wrote:
>>>
>>> Since the previous code only provides "ro_ops" for the vid_pll_div
>>> clock. In fact, the clock can be set. So add "ops" that can set the
>>> clock, especially for later chips like S4 SOC and so on.
>>>
>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>> ---
>> please describe the changes you did compared to the previous version(s)
>
> I'll add it in the next version.
>
>> [...]
>>> diff --git a/drivers/clk/meson/vid-pll-div.h b/drivers/clk/meson/vid-pl=
l-div.h
>>> index c0128e33ccf9..bbccab340910 100644
>>> --- a/drivers/clk/meson/vid-pll-div.h
>>> +++ b/drivers/clk/meson/vid-pll-div.h
>>> @@ -10,11 +10,14 @@
>>>   #include <linux/clk-provider.h>
>>>   #include "parm.h"
>>>
>>> +#define VID_PLL_DIV_TABLE_SIZE         14
>> In v1 you used ARRAY_SIZE(vid_pll_div_table) wherever this new macro
>> is used instead.
>> I think using ARRAY_SIZE is the better approach because it means the
>> references will update automatically if an entry is added/removed from
>> vid_pll_div_table
>
> I agree with you. Perhaps the key is to understand what Jerome said.

I asked you to describe how this divider actually works. Not remove
ARRAY_SIZE().

This divider uses tables only because the parameters are "magic".
I'd like the driver to be able come up with "computed" values instead.

What I requested is some explanation about how this HW clock works
because the documentation is not very clear when it comes to this. These
values must come from somewhere, I'd like to understand "how".

This is the same as the PLL driver which can take a range and come up
with the different parameters, instead of using big pre-computed tables.

>
>> Also I think there's a different understanding about what Jerome
>> previously wrote:
>>> It would be nice to actually describe how this vid pll work so we can
>>> stop using precompute "magic" values and actually use the IP to its full
>>> capacity.
>>  From what I understand is that you interpreted this as "let's change
>> ARRAY_SIZE(vid_pll_div_table) to a new macro called
>> VID_PLL_DIV_TABLE_SIZE".
>> But I think what Jerome meant is: "let's get rid of vid_pll_div_table
>> and implement how to actually calculate the clock rate - without
>> hard-coding 14 possible clock settings in vid_pll_div_table". Look at
>> clk-mpll.c and/or clk-pll.c which allow calculating arbitrary rates
>> without any hard-coded tables.
>

exactly ... or at least an explanation about how it works and
why it is too complicated to compute the values at runtime.

> In fact, pll and mpll are also fixed register writes corresponding
> values.

That is not true. The pll and mpll drivers are able to compute their
values at runtime. Please have a look at the drivers.

> But every SOC is different, so it makes more sense to set it
> outside. The VID PLL is a fixed value for all current SoCs.
>
>> Best regards,
>> Martin
>>=20

