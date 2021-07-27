Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD70C4320A
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 01:08:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01E4D60F5A
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 01:08:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233673AbhG0A1q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Jul 2021 20:27:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:38918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231479AbhG0A1n (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 26 Jul 2021 20:27:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6355160F58;
        Tue, 27 Jul 2021 01:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627348091;
        bh=IjhHO8zX3K7iiI4nhm+dbjPp5WA79s/ELxEb/UmhUNs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=CcyvlzpFBMw7G6HOuEmAC/NpOMQ5iTWRkbVCvIIhqv3msOIwtzMcaumlP+vJoP7q9
         7N3OXZCa3xUrBuTxIal3LyDnQMVJRvMyDUGbA2nvZQy2cyr8pf6zLBYIkkwmc9gbfI
         z+p8Ksnt/QBW0kyI5mSbWo7wxmVIH5GHUCU8Ek3F+kB/+PwCu79UmnIl9HDGvcd5xc
         JJ14dlQV2BKcRap90bo8KzaCHmorvR+2pUipZYpqZGtB5z5mpAOjZLB3YcVzK0ti4t
         tUq0EuKTs1XQcqyLsipMGIKqTaDMgOLKGssJp1ffwuABlenzmezDnalgmW3D1X0jXd
         kMKTL2HviHt0A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <BYAPR20MB24886765F888A9705CBEB70789E39@BYAPR20MB2488.namprd20.prod.outlook.com>
References: <BYAPR20MB24886765F888A9705CBEB70789E39@BYAPR20MB2488.namprd20.prod.outlook.com>
Subject: Re: [PATCH] clk: rk3308: make ddrphy4x clock critical
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     t123yh.xyz@gmail.com, Yunhao Tian <t123yh@outlook.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
To:     Yunhao Tian <t123yh@outlook.com>, heiko@sntech.de
Date:   Mon, 26 Jul 2021 18:08:10 -0700
Message-ID: <162734809017.2368309.7901135942001140161@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Yunhao Tian (2021-07-21 05:48:16)
> Currently, no driver support for DDR memory controller (DMC) is present,
> as a result, no driver is explicitly consuming the ddrphy clock. This mea=
ns
> that VPLL1 (parent of ddr clock) will be shutdown if we enable
> and then disable any child clock of VPLL1 (e.g. SCLK_I2S0_8CH_TX).
> If VPLL1 is disabled, the whole system will freeze, because the DDR
> controller will lose its clock. So, it's necessary to prevent VPLL1 from
> shutting down, by marking the ddrphy4x CLK_IS_CRITICAL.
>=20
> This bug was discovered when I was porting rockchip_i2s_tdm driver to
> mainline kernel from Rockchip 4.4 kernel. I guess that other Rockchip
> SoCs without DMC driver may need the same patch. If this applies to
> other devices, please let us know.
>=20
> Signed-off-by: Yunhao Tian <t123yh@outlook.com>
> ---
>  drivers/clk/rockchip/clk-rk3308.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/rockchip/clk-rk3308.c b/drivers/clk/rockchip/clk=
-rk3308.c
> index 2c3bd0c749f2..6be077166330 100644
> --- a/drivers/clk/rockchip/clk-rk3308.c
> +++ b/drivers/clk/rockchip/clk-rk3308.c
> @@ -564,7 +564,7 @@ static struct rockchip_clk_branch rk3308_clk_branches=
[] __initdata =3D {
>         COMPOSITE(SCLK_DDRCLK, "clk_ddrphy4x_src", mux_dpll_vpll0_vpll1_p=
, CLK_IGNORE_UNUSED,
>                         RK3308_CLKSEL_CON(1), 6, 2, MFLAGS, 0, 3, DFLAGS,
>                         RK3308_CLKGATE_CON(0), 10, GFLAGS),
> -       GATE(0, "clk_ddrphy4x", "clk_ddrphy4x_src", CLK_IGNORE_UNUSED,
> +       GATE(0, "clk_ddrphy4x", "clk_ddrphy4x_src", CLK_IGNORE_UNUSED | C=
LK_IS_CRITICAL,

Is it not enabled by default?

>                         RK3308_CLKGATE_CON(0), 11, GFLAGS),
>         FACTOR_GATE(0, "clk_ddr_stdby_div4", "clk_ddrphy4x", CLK_IGNORE_U=
NUSED, 1, 4,
>                         RK3308_CLKGATE_CON(0), 13, GFLAGS),
