Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7CDC433EF
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 12:27:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232419AbiDHM3C (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 08:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231757AbiDHM3B (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 08:29:01 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCC6233DC9B
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 05:26:57 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id m30so12635855wrb.1
        for <linux-clk@vger.kernel.org>; Fri, 08 Apr 2022 05:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version;
        bh=GYmKAXiVY5iRCCnJxkXBlD2rPlZJ1PCYNBabWNTi7Vo=;
        b=Gn0r33PICX6iM1Z+B3IsHI83gHe6Tinntnv9xtP/eRfqHHtlcCFOllNlEJgSdljEdP
         dG7Nn8LjjIPVZuWKsDPJ6ivDM1GE+HPKOT8wwW/8zvN5sjoxZWJnD+4Wxi6UkoL7eFh2
         5kgTDmnHGq3C7IDlNoVJFNyvQ7EDiWYqCQQrIk5DOsvojgdS2g88cgPE+W0p7QxktrS4
         n64EeUSJ69zsbFAmIwXDCbKs6jW8uQKh1QgKW2zr0AcJeoU8RgkTD+xWVI8Ua7HmY188
         rzx3gmRkbhfvLrmJoqwuYekXRq+1JsadGlZ9bpka8CVDMONzskMwxb0vfkCFSVSOh5JO
         fBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version;
        bh=GYmKAXiVY5iRCCnJxkXBlD2rPlZJ1PCYNBabWNTi7Vo=;
        b=xvCt67UvLRjoEg1lIgg6xeRvx2kg6aTtPdjjuvWXKnUiwYmynYGd0s4MsE18sYaoO/
         /pIIAP/Z1g999Mb9TKhFvVrCEjKA8YF1BJJWUJ3zcnivAXJuZM3H/Cuce5Ge52caJAbN
         amk9wj+SJCQ+EhNpPeNOc/8nrOxAngyQAqgOiy1hJZxAHo1GfPmv9x1DmDjkI/8Qn0Ky
         3YpY8P1/2hUo4yWGX1C6+Fnb2EFudCFEdAmkaGXjtG+GLyZYW7+XqHfEmh5fcX62DciW
         X4+1fS5z5Xwt5Pd6kOP7b1iQ7Ioszlq6kI3NaU7f69dsmP4PClIq4WqrjRkFxfiLPL8j
         y8aQ==
X-Gm-Message-State: AOAM531k32X4MzOvF9vTSlQtNjoVJhYVsIottj/KmXriEBirQ9o5JHdD
        JOegGg0Xqx2e7MsmgszkYzk5X5ucTJ90qA==
X-Google-Smtp-Source: ABdhPJzrWiStOdmsdk08vQ4QBgijXe2pf3Klfh4i3OMjwjEfkXmVL1Qg4yy4WPgW+fTOJgeJurlAPw==
X-Received: by 2002:a5d:6485:0:b0:204:1643:ad45 with SMTP id o5-20020a5d6485000000b002041643ad45mr14692645wri.450.1649420816188;
        Fri, 08 Apr 2022 05:26:56 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id a11-20020a056000188b00b00204109f7826sm22266722wri.28.2022.04.08.05.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 05:26:55 -0700 (PDT)
References: <20220408091037.2041955-1-maxime@cerno.tech>
 <20220408091037.2041955-23-maxime@cerno.tech>
 <1jwnfzlxx1.fsf@starbuckisacylon.baylibre.com>
 <20220408104127.ilmcntbhvktr2fbh@houat>
User-agent: mu4e 1.6.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 22/22] clk: Prevent a clock without a rate to register
Date:   Fri, 08 Apr 2022 13:24:59 +0200
In-reply-to: <20220408104127.ilmcntbhvktr2fbh@houat>
Message-ID: <1jpmlrlq0h.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Fri 08 Apr 2022 at 12:41, Maxime Ripard <maxime@cerno.tech> wrote:

> [[PGP Signed Part:Undecided]]
> On Fri, Apr 08, 2022 at 11:18:58AM +0200, Jerome Brunet wrote:
>> On Fri 08 Apr 2022 at 11:10, Maxime Ripard <maxime@cerno.tech> wrote:
>> > A rate of 0 for a clock is considered an error, as evidenced by the
>> > documentation of clk_get_rate() and the code of clk_get_rate() and
>> > clk_core_get_rate_nolock().
>> >
>> > The main source of that error is if the clock is supposed to have a
>> > parent but is orphan at the moment of the call. This is likely to be
>> > transient and solved later in the life of the system as more clocks are
>> > registered.
>> >
>> > The corollary is thus that if a clock is not an orphan, has a parent that
>> > has a rate (so is not an orphan itself either) but returns a rate of 0,
>> > something is wrong in the driver. Let's return an error in such a case.
>> >
>> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>> > ---
>> >  drivers/clk/clk.c | 10 ++++++++++
>> >  1 file changed, 10 insertions(+)
>> >
>> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> > index 8bbb6adeeead..e8c55678da85 100644
>> > --- a/drivers/clk/clk.c
>> > +++ b/drivers/clk/clk.c
>> > @@ -3773,6 +3773,16 @@ static int __clk_core_init(struct clk_core *core)
>> >  		rate = 0;
>> >  	core->rate = core->req_rate = rate;
>> >  
>> > +	/*
>> > +	 * If we're not an orphan clock and our parent has a rate, then
>> > +	 * if our rate is 0, something is badly broken in recalc_rate.
>> > +	 */
>> > +	if (!core->orphan && (parent && parent->rate) && !core->rate) {
>> > +		ret = -EINVAL;
>> > +		pr_warn("%s: recalc_rate returned a null rate\n", core->name);
>> > +		goto out;
>> > +	}
>> > +
>> 
>> As hinted in the cover letter, I don't really agree with that.
>> 
>> There are situations where we can't compute the rate. Getting invalid
>> value in the register is one reason.
>> 
>> You mentioned the PLLs of the Amlogic SoCs (it is not limited to g12 - all
>> SoCs would be affected):
>> 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/meson/clk-pll.c#n82
>> Yes, PLL that have not been previously used (by the ROMCode or the
>> bootloader) tend to have the value of the divider set to 0 which in
>> invalid as it would result in a division by zero.
>> 
>> I don't think this is a bug. It is just what the HW is, an unlocked,
>> uninitialized PLL. There is no problem here and the PLL can remain like
>> that until it is needed.
>
> I think the larger issue is around the semantics of clk_get_rate(), and
> especially whether we can call it without a clk_enable(), and whether
> returning 0 is fine.
>
> The (clk.h) documentation of clk_get_rate() mentions that "This is only
> valid once the clock source has been enabled", and it's fairly
> ambiguous. I can see how it could be interpreted as "you need to call
> clk_enable() before calling clk_get_rate()", but it can also be
> interpreted as "The returned rate will only be valid once clk_enable()
> is called".
>
> I think the latter is the proper interpretation though based on what the
> drivers are doing, and even the CCF itself will call recalc_rate without
> making sure that the clock is enabled (in __clk_core_init() for example).
>
> Then there is the question of whether returning 0 is fine. Again
> clk_get_rate() (clk.c) documentation states that "If clk is NULL then
> returns 0.". This is indeed returned in case of an error condition (in
> clk_get_rate() itself, but also in clk_core_get_rate_nolock()).
>
> All the drivers I could find either assume the rate is valid, or test
> whether it's 0 or not (randomly picked, but across completely different
> platforms):
> https://elixir.bootlin.com/linux/latest/source/drivers/clocksource/armv7m_systick.c#L50
> https://elixir.bootlin.com/linux/latest/source/drivers/cpufreq/armada-8k-cpufreq.c#L74
> https://elixir.bootlin.com/linux/latest/source/sound/soc/sti/uniperif_player.c#L194
> https://elixir.bootlin.com/linux/latest/source/sound/soc/tegra/tegra20_i2s.c#L278
>
> So my understanding is that the consensus is that clk_get_rate() can be
> called even if the clock hasn't been enabled, and that returning 0 is
> only meant to be used for errors in general, a NULL pointer according to
> the documentation.
>
> That would mean that pcie_pll_dco is buggy because it assumes that
> clk_enable()

This one indeed does everything in the enable and I could agree it is
fishy, but since it supports only a single rate I don't think it is a
problem. Even if it had a proper set_rate(), it would not change your
problem since it would still return 0 until some consumer actually needs
its parameter to change.

> is going to be called before clk_get_rate(), gp0_pll_dco
> and hifi_pll_dco because they expect "someone" to call clk_set_rate()
> before clk_get_rate(),

No, they don't expect anything. They will return 0 until they are set
with a an actual rate. I don't think returning 0 should be
problem and it has not been so far.

I understand the ambiguity you mentioned above. If the framework decides
it is clearly forbidden to return 0, we'll change.

Still I don't think it would be wise. What are the alternative if you
can't compute a rate ? return 1 ? This looks aweful to me. At least 0 is
a clear indication that the clock is not in a working state.

> and hdmi_pll_dco because it will always return 0,

It is a read-only clock - whatever we do in CCF, it is not going to
change. CCF has always supported RO clocks.

> unless the display driver comes around and updates it. If it never does,
> or if it's not compiled in, then you're out of luck.

I'm all for managing the display clocks from CCF but it has proved tricky
so far. Maybe it will someday.

Being a read-only clock, the value is what it is and CCF should
deal with it gracefully. It has so far.

If the driver actually managing the clock is not compiled in, then the
clock will never be set, and it should not be a problem either.

>
>> IMO, whenever possible we should not put default values in the clocks
>> which is why I chose to leave it like that.
>>
>> The PLL being unlocked, it has no rate. It is not set to have any rate.
>> IMO a returning a rate of 0 is valid here.
>
> If there's not a sensible default in the hardware already, I don't see
> what the big issue is to be honest. You already kind of do that for all
> the other PLL parameters with init_regs

Those initial parameters are "magic" analog setting which don't have an
impact on the rate setting. The initial rate of the clock is never set
by the clock driver on purpose.

> , and most drivers do that for
> various stuff:
> https://elixir.bootlin.com/linux/latest/source/drivers/clk/imx/clk-imx6q.c#L917
> https://elixir.bootlin.com/linux/latest/source/drivers/clk/nxp/clk-lpc32xx.c#L1550
> https://elixir.bootlin.com/linux/latest/source/drivers/clk/rockchip/clk-rk3036.c#L448
> https://elixir.bootlin.com/linux/latest/source/drivers/clk/sunxi-ng/ccu-sun8i-h3.c#L1157
> https://elixir.bootlin.com/linux/latest/source/drivers/clk/tegra/clk-tegra20.c#L1013

It is done by other drivers or controllers, yes. It does not make it
right (again, it is just my opinion). Rate should never be set by the
clock driver or the clock controller - Those should just implement what
consumer wants. I would agree it sometimes proves tricky to hold onto
this.

Taking one of the example above:
https://elixir.bootlin.com/linux/latest/source/drivers/clk/nxp/clk-lpc32xx.c#L1550

I think it would be better to have an "assigned-clock" on the related
PLL in the USB node of the platform DT. That way the PLL is set when
needed.

If we go down the road of "others are doing it, so why not ?", I think Marek
initial regression report mentioned Exynos too ;) 

>
> If the driver needs that kind of quirks in order to make the clock
> usable in itself, then it just makes sense to do that, especially if
> it's to avoid breaking a generic API.

As it is the clock are usable and it did not break anything so far.

I have no problem updating the drivers if need be. I do have a problem
with the framework changing and requiring the clock driver to set an
initial rate to make it happy.

>
> Maxime
>
> [[End of PGP Signed Part]]

