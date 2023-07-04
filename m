Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209F8EB64D9
	for <linux-clk@archiver.kernel.org>; Tue,  4 Jul 2023 20:00:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231250AbjGDUAI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Jul 2023 16:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjGDUAH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Jul 2023 16:00:07 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 826D810D9
        for <linux-clk@vger.kernel.org>; Tue,  4 Jul 2023 13:00:05 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fa93d61d48so71237365e9.0
        for <linux-clk@vger.kernel.org>; Tue, 04 Jul 2023 13:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688500804; x=1691092804;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=1fHzMQe/+l45AJ3P9Rbxg4rzS7GRLXVPi798OCju+Z4=;
        b=HQwGSsPcJ+uQHbqPMy98njNj6tF+eQEfyemUayPA+ZJf1lOYRUPLq+6aTVWIpacQzf
         vjhM9O7nFCAGNwkm1s+9r+cTLRansqTYdh0j3fl0rtMmAtjhYvow7V1RefZEzMFY7haR
         NpbEhCtVdafdme+quovgSGdaG6vMZmxL3qcS6lQuXfZXcOYRGLBl541S6xAwnhV4//Fd
         AyDDvLWwy7Etxx/OzT1DyIScjKRyie11qVqqvW1Vem3lLtYyRZAgU+naLKvi97z+j2UO
         Ka9I7yQnBZ/grCmv6tXVUgj0AGWg/iUzh3YeM8MsgWYWCAWI9UlFLCnC8+N+pNuJjxti
         oSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688500804; x=1691092804;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fHzMQe/+l45AJ3P9Rbxg4rzS7GRLXVPi798OCju+Z4=;
        b=dwCHrcYiy9NysGhupfbznfwyl3cPVSUCdKqoctGu/na1ooHlrHaOWqJTluDWUIirzI
         FYfa/KAQQs9mX8s7f8KNGgPIvyB+h/o4HKPSQhc4CpDfikNVBkgPqJ4tsn63hnN9Kd7D
         ee89FY6LcRbUtjrAxoJ8VPIKXuOeSTlbGn4ITxQu/dm9VzCiMNxQNNBziIyCbScKVQts
         4Ay9E/ka9c17Tce9Y1yNP+O8ul8G7NCJGPNYR8FDAyCtaqQqaikin9x9m4CxSxFIUzSf
         MmjyP2gye7ctTEZOtoC8eNtKAWLghvPsNNirmEqbq0cL97PImsnC5wrOqIJyIFUef9QT
         NH+A==
X-Gm-Message-State: AC+VfDxXAwzsbwhV2UHMOonumzwTQzjkc8XlGDF022Zfv7Pbxe+5D0Zv
        8IQcVFOGANfOrcLZ4XcPV6ScPw==
X-Google-Smtp-Source: ACHHUZ4qKooTw7KG7/DJ2LWDyTsusB+7bUHH6LJuNOebyrTILr8eT7yOrJujqqFlxcqRyYVsTymoUg==
X-Received: by 2002:a1c:7409:0:b0:3fb:7724:254b with SMTP id p9-20020a1c7409000000b003fb7724254bmr11950726wmc.9.1688500803967;
        Tue, 04 Jul 2023 13:00:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb0:4a33:b29e:11b3:752b])
        by smtp.gmail.com with ESMTPSA id y6-20020a7bcd86000000b003fbb346279dsm10194wmj.38.2023.07.04.13.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 13:00:03 -0700 (PDT)
References: <20230703200404.20361-1-ddrokosov@sberdevices.ru>
 <1j352378zh.fsf@starbuckisacylon.baylibre.com>
 <20230704195451.7gklbmyautuajqtq@CAB-WSD-L081021>
User-agent: mu4e 1.8.13; emacs 28.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc:     neil.armstrong@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, jian.hu@amlogic.com,
        kernel@sberdevices.ru, rockosov@gmail.com,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Jan Dakinevich <yvdakinevich@sberdevices.ru>
Subject: Re: [PATCH v1] clk: meson: change usleep_range() to udelay() for
 atomic context
Date:   Tue, 04 Jul 2023 21:58:31 +0200
In-reply-to: <20230704195451.7gklbmyautuajqtq@CAB-WSD-L081021>
Message-ID: <1jy1jv5tx8.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Tue 04 Jul 2023 at 22:54, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:

> Hello Jerome,
>
> Thank you for the review!
>
> On Tue, Jul 04, 2023 at 09:43:41PM +0200, Jerome Brunet wrote:
>> 
>> On Mon 03 Jul 2023 at 23:04, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:
>> 
>> > The function meson_clk_pll_enable() can be invoked under the enable_lock
>> > spinlock from the clk core logic
>> 
>> ---
>> > (please refer to
>> > drivers/clk/clk.c:clk_core_enable_lock()), which risks a kernel panic
>> > during the usleep_range() call:
>> >
>> 
>> This part of the comment is not very useful - please drop it
>> 
>
> Do you mean a stack trace or reference to clk_core_enable_lock()?

The comment about clk_core_enable_lock.
The stack trace is useful, it may help people googling the warning

>
>> >    BUG: scheduling while atomic: kworker/u4:2/36/0x00000002
>> >    Modules linked in: g_ffs usb_f_fs libcomposite
>> >    CPU: 1 PID: 36 Comm: kworker/u4:2 Not tainted 6.4.0-rc5 #273
>> >    Workqueue: events_unbound async_run_entry_fn
>> >    Call trace:
>> >     dump_backtrace+0x9c/0x128
>> >     show_stack+0x20/0x38
>> >     dump_stack_lvl+0x48/0x60
>> >     dump_stack+0x18/0x28
>> >     __schedule_bug+0x58/0x78
>> >     __schedule+0x828/0xa88
>> >     schedule+0x64/0xd8
>> >     schedule_hrtimeout_range_clock+0xd0/0x208
>> >     schedule_hrtimeout_range+0x1c/0x30
>> >     usleep_range_state+0x6c/0xa8
>> >     meson_clk_pll_enable+0x1f4/0x310
>> >     clk_core_enable+0x78/0x200
>> >     clk_core_enable+0x58/0x200
>> >     clk_core_enable+0x58/0x200
>> >     clk_core_enable+0x58/0x200
>> >     clk_enable+0x34/0x60
>> >
>> > Considering that this code is expected to be used in an atomic context,
>> > it is required to use the udelay() function instead of usleep_range()
>> > for the atomic context safety.
>> 
>> Please use an imperative form, instructing the code to change 
>> 
>
> Ack
>
>> >
>> > Fixes: b6ec400aa153 ("clk: meson: introduce new pll power-on sequence for A1 SoC family")
>> > Reported-by: Jan Dakinevich <yvdakinevich@sberdevices.ru>
>> > Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
>> > Signed-off-by: Jan Dakinevich <yvdakinevich@sberdevices.ru>
>> 
>> The tags are confusing here
>> I suppose a 2 lines change has not be been written with 4 hands ;)
>> 
>> If Jan just reported and you made the change then drop his signed-off
>> If he did the job, then drop the reported-by and change the author
>> 
>
> No problem :) Sometimes 2 lines change is produced during 4 hands
> debugging :)
>
>> > ---
>> >  drivers/clk/meson/clk-pll.c | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
>> > index 56ec2210f1ad..eef6f37c8d8d 100644
>> > --- a/drivers/clk/meson/clk-pll.c
>> > +++ b/drivers/clk/meson/clk-pll.c
>> > @@ -367,9 +367,9 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>> >  	 * 3. enable the lock detect module
>> >  	 */
>> >  	if (MESON_PARM_APPLICABLE(&pll->current_en)) {
>> > -		usleep_range(10, 20);
>> > +		udelay(10);
>> >  		meson_parm_write(clk->map, &pll->current_en, 1);
>> > -		usleep_range(40, 50);
>> > +		udelay(40);
>> >  	};
>> >  
>> >  	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
>> 

