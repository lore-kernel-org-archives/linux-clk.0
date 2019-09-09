Return-Path: <SRS0=VG/9=XE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2262DC433EF
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 08:20:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D51442086D
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 08:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568017233;
	bh=hUjMFYDt15aaG0KcZhtWuZvcPW21IIr+paV7LbXYOQk=;
	h=In-Reply-To:References:Cc:To:From:Subject:Date:List-ID:From;
	b=a4zZFUlUWe7zpA7hnIZ7ESWDdma8a4ykoMxo/qptt55bg0VQuTqeIJVzxQK3pWuzs
	 Wbcbfpw8enafv9dP+m1rWdxr2bvXVSJlIlt/5hwgWZYqJW7zTz63YUG8ikWMoUG6F7
	 JFehohFQlp4fKtOlUXPmNrofbs5pFJFCbV6IJJf4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbfIIIUd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Sep 2019 04:20:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:56320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726924AbfIIIUd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 9 Sep 2019 04:20:33 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B704D20678;
        Mon,  9 Sep 2019 08:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568017232;
        bh=hUjMFYDt15aaG0KcZhtWuZvcPW21IIr+paV7LbXYOQk=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=LXLYTbc0hnvTUjlZJEbqYjodBBHPV/b8iEKfS7UbLV2zb1p75QOnTkeUJhQRRxc6M
         8GJWSw0+K+FqKPGS3JLrn1fTiPDdflA3APu33YlNsim7A72E9EarwUu2vCFbQheA93
         YNiqaT/PfggdraDmM5l56vTOFLEUmUh794cM81Xc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <VI1PR04MB70239D5AA9604E72E74CD555EEBA0@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <c3e86b5a832a14278e8ba670d51defc70ee78d84.1567590349.git.leonard.crestez@nxp.com> <20190906172452.D1ED620838@mail.kernel.org> <VI1PR04MB70239D5AA9604E72E74CD555EEBA0@VI1PR04MB7023.eurprd04.prod.outlook.com>
Cc:     Jacky Bai <ping.bai@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Viorel Suman <viorel.suman@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
To:     Daniel Baluta <daniel.baluta@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: imx: pll14xx: Fix quick switch of S/K parameter
User-Agent: alot/0.8.1
Date:   Mon, 09 Sep 2019 01:20:31 -0700
Message-Id: <20190909082032.B704D20678@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Leonard Crestez (2019-09-06 12:36:47)
> On 06.09.2019 20:24, Stephen Boyd wrote:
> > Quoting Leonard Crestez (2019-09-04 02:49:18)
> >> The PLL14xx on imx8m can change the S and K parameter without requiring
> >> a reset and relock of the whole PLL.
> >>
> >> Fix clk_pll144xx_mp_change register reading and use it for pll1443 as
> >> well since no reset+relock is required on K changes either.
> >>
> >> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
> >> ---
> >>   drivers/clk/imx/clk-pll14xx.c | 40 +++++++--------------------------=
--
> >>   1 file changed, 8 insertions(+), 32 deletions(-)
> >>
> >> The PLLs are currently table-based and none of the entries differ only
> >> in S/K so further work would be required to make use of this. The
> >> prospective user is audio doing tiny freq adjustments and there is no
> >> standard API for that.
> >=20
> > sub-Hz adjustments?
>=20
> Maybe at the audio level? The PLL itself runs at ~400Mhz so wouldn't=20
> need sub-hz adjustment.
>=20
> My understanding is that adjustments would be made based on an external=20
> clock so if CLK framework rounds to 1hz then it would just take longer=20
> for adjustment to kick in.

Ok.

>=20
> >> Lacking users is not a good reason to carry broken code around.
> >=20
> > Maybe add a Fixes tag so if anyone wants to use it in LTS kernels there
> > might be a chance that they'll find this patch mention code they're
> > using.
>=20
> It doesn't meet stable kernel rules because it doesn't "fix a real bug=20
> that bothers people" but it's still technically a fix:
>=20
> Fixes: 8646d4dcc7fb ("clk: imx: Add PLLs driver for imx8mm soc")
>=20

Sure. Thanks! I assume Shawn will pick this up.

