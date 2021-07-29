Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF091C4338F
	for <linux-clk@archiver.kernel.org>; Thu, 29 Jul 2021 19:06:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 82E9260F12
	for <linux-clk@archiver.kernel.org>; Thu, 29 Jul 2021 19:06:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbhG2TGz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Jul 2021 15:06:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:56304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229672AbhG2TGw (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 29 Jul 2021 15:06:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B03660EE2;
        Thu, 29 Jul 2021 19:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627585608;
        bh=syc4qVK1HUgQ7T+avP7cce2aYH49z0jp3zbWnHeOGLQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=APilpr+G81jhKsuDBVvYjcBCDmJ0MV7wSoO+3IenTsdwZxRLFHNx6Ii3mpXsJ+xL+
         l+/1lbXCrlhpCEUWHSwrUarZp177ygZJ/jxw3Fe79iweCu3a6K7RqgDbhTv4JTl+52
         iVvTCIhmskcYbkBuxRzSyWGd9eMWJUqqNztGyxTWkmWU1pEGVFH61luOK/hiNwbe/X
         lRap0KBmW7uefa4zgFiQmjgfnN/gSlwBfcUmjSkSt7cGm6y32WTRYPKO9gca0JYK/d
         n+McSN8W6fv6/4BvMJwpp03ocfRbw2LSNOnv+WeW9TaTjD8UCPPITBYh95KqTQQFTa
         1gfzTG03QJ4uA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2634451.ElGaqSPkdT@diego>
References: <BYAPR20MB24886765F888A9705CBEB70789E39@BYAPR20MB2488.namprd20.prod.outlook.com> <162734809017.2368309.7901135942001140161@swboyd.mtv.corp.google.com> <2634451.ElGaqSPkdT@diego>
Subject: Re: [PATCH] clk: rk3308: make ddrphy4x clock critical
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     t123yh.xyz@gmail.com, Yunhao Tian <t123yh@outlook.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
To:     Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>,
        Yunhao Tian <t123yh@outlook.com>, saravanak@google.com
Date:   Thu, 29 Jul 2021 12:06:47 -0700
Message-ID: <162758560739.714452.5782743329332725952@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko St=C3=BCbner (2021-07-28 02:53:54)
> Am Dienstag, 27. Juli 2021, 03:08:10 CEST schrieb Stephen Boyd:
> > Quoting Yunhao Tian (2021-07-21 05:48:16)
> > > Currently, no driver support for DDR memory controller (DMC) is prese=
nt,
> > > as a result, no driver is explicitly consuming the ddrphy clock. This=
 means
> > > that VPLL1 (parent of ddr clock) will be shutdown if we enable
> > > and then disable any child clock of VPLL1 (e.g. SCLK_I2S0_8CH_TX).
> > > If VPLL1 is disabled, the whole system will freeze, because the DDR
> > > controller will lose its clock. So, it's necessary to prevent VPLL1 f=
rom
> > > shutting down, by marking the ddrphy4x CLK_IS_CRITICAL.
> > >=20
> > > This bug was discovered when I was porting rockchip_i2s_tdm driver to
> > > mainline kernel from Rockchip 4.4 kernel. I guess that other Rockchip
> > > SoCs without DMC driver may need the same patch. If this applies to
> > > other devices, please let us know.
> > >=20
> > > Signed-off-by: Yunhao Tian <t123yh@outlook.com>
> > > ---
> > >  drivers/clk/rockchip/clk-rk3308.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/clk/rockchip/clk-rk3308.c b/drivers/clk/rockchip=
/clk-rk3308.c
> > > index 2c3bd0c749f2..6be077166330 100644
> > > --- a/drivers/clk/rockchip/clk-rk3308.c
> > > +++ b/drivers/clk/rockchip/clk-rk3308.c
> > > @@ -564,7 +564,7 @@ static struct rockchip_clk_branch rk3308_clk_bran=
ches[] __initdata =3D {
> > >         COMPOSITE(SCLK_DDRCLK, "clk_ddrphy4x_src", mux_dpll_vpll0_vpl=
l1_p, CLK_IGNORE_UNUSED,
> > >                         RK3308_CLKSEL_CON(1), 6, 2, MFLAGS, 0, 3, DFL=
AGS,
> > >                         RK3308_CLKGATE_CON(0), 10, GFLAGS),
> > > -       GATE(0, "clk_ddrphy4x", "clk_ddrphy4x_src", CLK_IGNORE_UNUSED,
> > > +       GATE(0, "clk_ddrphy4x", "clk_ddrphy4x_src", CLK_IGNORE_UNUSED=
 | CLK_IS_CRITICAL,
> >=20
> > Is it not enabled by default?
>=20
> All gates are enabled by default, but this gate shares a common parent
> tree down to a pll, so if another leaf-user is disabling their part, this
> untracked clock would get disabled as well.

Right, this problem is cropping up in different places for various
drivers.

>=20
> On that note, I remember a sort of CLK_HANDOFF was planned way back
> in the past, meaning clock is critical until a driver picks it up, after =
this the
> driver is responsible for it. Did that get any momentum?
>=20

Last I saw Saravana sent a patch to sort of connect CLK_HANDOFF to
device driver sync_state() callback. I think we need to at least stash
away that a clk is enabled at boot and then figure out how to tie in
sync_state and/or something else.
