Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28085C433F5
	for <linux-clk@archiver.kernel.org>; Sat, 23 Apr 2022 04:42:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231164AbiDWEpZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 23 Apr 2022 00:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230471AbiDWEpZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Apr 2022 00:45:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5883B12EF17
        for <linux-clk@vger.kernel.org>; Fri, 22 Apr 2022 21:42:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DD92960B25
        for <linux-clk@vger.kernel.org>; Sat, 23 Apr 2022 04:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA7AC385A0;
        Sat, 23 Apr 2022 04:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650688948;
        bh=jVYj4xRZQcQ7pCTntHC1ZSSKMWMGHnyhLMrJiTkvtNk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=odtvTXe/KYsQ+wJMdCPD64WBLvIA4DuCOLxSM57ai7eysZIqqAyq9ZJJoOQtu51kU
         KjRPToCz8buuotD/ZbzRWtiXvPPVaCChRs8BOS/BsmQCu/Hp84+5I/7cZOenm6EHUx
         +IDWfg+QD/SNaKEmnjug6mQ9hOeeCfuQ3QQ33VcdJUPBIU+WEF4J2W/NGaKJYF7HjE
         l06We6qfxufzRP5eKq1u1TSbaFcCXm24M3IhdbL+L59nk/4nhpvMU4wpQzUvXKhcgb
         G9wWHT1RQINJWeGkU73w+bm7xfOXEVA2LeT8bS8udP31CxJf6Vdi/DsMMVZLIxnR9K
         4rI2pS2B1Lq+w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220408104127.ilmcntbhvktr2fbh@houat>
References: <20220408091037.2041955-1-maxime@cerno.tech> <20220408091037.2041955-23-maxime@cerno.tech> <1jwnfzlxx1.fsf@starbuckisacylon.baylibre.com> <20220408104127.ilmcntbhvktr2fbh@houat>
Subject: Re: [PATCH 22/22] clk: Prevent a clock without a rate to register
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 22 Apr 2022 21:42:26 -0700
User-Agent: alot/0.10
Message-Id: <20220423044228.2AA7AC385A0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-04-08 03:41:27)
> On Fri, Apr 08, 2022 at 11:18:58AM +0200, Jerome Brunet wrote:
> > On Fri 08 Apr 2022 at 11:10, Maxime Ripard <maxime@cerno.tech> wrote:
> > > A rate of 0 for a clock is considered an error, as evidenced by the
> > > documentation of clk_get_rate() and the code of clk_get_rate() and
> > > clk_core_get_rate_nolock().

Where?

> > >
> > > The main source of that error is if the clock is supposed to have a
> > > parent but is orphan at the moment of the call. This is likely to be
> > > transient and solved later in the life of the system as more clocks a=
re
> > > registered.
> > >
> > > The corollary is thus that if a clock is not an orphan, has a parent =
that
> > > has a rate (so is not an orphan itself either) but returns a rate of =
0,
> > > something is wrong in the driver. Let's return an error in such a cas=
e.
> > >
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > ---
> > >  drivers/clk/clk.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index 8bbb6adeeead..e8c55678da85 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -3773,6 +3773,16 @@ static int __clk_core_init(struct clk_core *co=
re)
> > >             rate =3D 0;
> > >     core->rate =3D core->req_rate =3D rate;
> > > =20
> > > +   /*
> > > +    * If we're not an orphan clock and our parent has a rate, then
> > > +    * if our rate is 0, something is badly broken in recalc_rate.
> > > +    */
> > > +   if (!core->orphan && (parent && parent->rate) && !core->rate) {
> > > +           ret =3D -EINVAL;
> > > +           pr_warn("%s: recalc_rate returned a null rate\n", core->n=
ame);
> > > +           goto out;
> > > +   }
> > > +
> >=20
> > As hinted in the cover letter, I don't really agree with that.
> >=20
> > There are situations where we can't compute the rate. Getting invalid
> > value in the register is one reason.
> >=20
> > You mentioned the PLLs of the Amlogic SoCs (it is not limited to g12 - =
all
> > SoCs would be affected):
> >=20
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/clk/meson/clk-pll.c#n82
> > Yes, PLL that have not been previously used (by the ROMCode or the
> > bootloader) tend to have the value of the divider set to 0 which in
> > invalid as it would result in a division by zero.
> >=20
> > I don't think this is a bug. It is just what the HW is, an unlocked,
> > uninitialized PLL. There is no problem here and the PLL can remain like
> > that until it is needed.
>=20
> I think the larger issue is around the semantics of clk_get_rate(), and
> especially whether we can call it without a clk_enable(), and whether
> returning 0 is fine.
>=20
> The (clk.h) documentation of clk_get_rate() mentions that "This is only
> valid once the clock source has been enabled", and it's fairly
> ambiguous. I can see how it could be interpreted as "you need to call
> clk_enable() before calling clk_get_rate()", but it can also be
> interpreted as "The returned rate will only be valid once clk_enable()
> is called".

I enjoy the ambiguity! :) This question has come up before and it
doesn't really matter. Drivers can call clk_prepare_enable() if they
want to be sure that clk_get_rate() is meaningful to them, or they can
not. The CCF returns a rate that it gets from calling recalc_rate, which
could be inaccurate for others reasons, either because some driver has
called clk_set_rate() after the clk_get_rate() or because the clk is an
orphan still and clk_get() succeeded, or because the clk_op couldn't
calculate it at the time of caching. Indeed the CCF doesn't try to
recalc the rate after enabling the clk. Maybe we should do that? It
would mean that we have to schedule a work from the enable path to
update the rate accounting outside of any atomic context.

Just thinking out loud, the simpler solution is to probably drop all
rate caching in the CCF and get the frequency on a clk_get_rate() call.
It complicates some of the core though when we check to see if we need
to update clk rates. We could have some middle ground where drivers
indicate that they want to update their cached rate because it's valid
now (either from their enable path or from somewhere else). This may be
nice actually because we could have clk providers call this to force a
recalc down the tree from where they've updated. I think the qcom
DisplayPort phy would want this.

>=20
> I think the latter is the proper interpretation though based on what the
> drivers are doing, and even the CCF itself will call recalc_rate without
> making sure that the clock is enabled (in __clk_core_init() for example).
>=20
> Then there is the question of whether returning 0 is fine. Again
> clk_get_rate() (clk.c) documentation states that "If clk is NULL then
> returns 0.". This is indeed returned in case of an error condition (in
> clk_get_rate() itself, but also in clk_core_get_rate_nolock()).

A NULL clk isn't an error. We use NULL in the CCF to indicate that it's
an optional clk. Returning 0 from clk_get_rate() is not an error. If
clk_get() returns an error pointer then it's an error. And NULL isn't an
error value per PTR_ERR() (because NULL =3D=3D 0 when casted, this isn't
golang).

>=20
> All the drivers I could find either assume the rate is valid, or test
> whether it's 0 or not (randomly picked, but across completely different
> platforms):
> https://elixir.bootlin.com/linux/latest/source/drivers/clocksource/armv7m=
_systick.c#L50
> https://elixir.bootlin.com/linux/latest/source/drivers/cpufreq/armada-8k-=
cpufreq.c#L74
> https://elixir.bootlin.com/linux/latest/source/sound/soc/sti/uniperif_pla=
yer.c#L194
> https://elixir.bootlin.com/linux/latest/source/sound/soc/tegra/tegra20_i2=
s.c#L278
>=20
> So my understanding is that the consensus is that clk_get_rate() can be
> called even if the clock hasn't been enabled, and that returning 0 is
> only meant to be used for errors in general, a NULL pointer according to
> the documentation.

Again, NULL isn't an invalid clk handle.

>=20
> That would mean that pcie_pll_dco is buggy because it assumes that
> clk_enable() is going to be called before clk_get_rate(), gp0_pll_dco
> and hifi_pll_dco because they expect "someone" to call clk_set_rate()
> before clk_get_rate(), and hdmi_pll_dco because it will always return 0,
> unless the display driver comes around and updates it. If it never does,
> or if it's not compiled in, then you're out of luck.
>=20

I think this is all fine.
