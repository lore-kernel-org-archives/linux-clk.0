Return-Path: <SRS0=yL/a=XB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140A6C43331
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 17:24:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D16B620842
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 17:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567790693;
	bh=VFA2y6aGSEi1O7IjtmDRuhV4iW9oDnoUYHFJr+NnkZw=;
	h=In-Reply-To:References:To:From:Cc:Subject:Date:List-ID:From;
	b=iiy+Qkep57dljoBWPeU4IetNKYDyDDEHgJLaWS9wOV9dIpjokg47FKjro/dxJuDzZ
	 AFPuputNo1VEtclT6oDTahR5N/wv58N73+3wnk6M9B0VeRjwH9fkfPxoQKXT8jyYDP
	 LfNAt0+7GM5StiW/V4d8aCbyN7m5VYTQUkLSUkfg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388202AbfIFRYx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Sep 2019 13:24:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:36386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732247AbfIFRYx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 6 Sep 2019 13:24:53 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D1ED620838;
        Fri,  6 Sep 2019 17:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567790692;
        bh=VFA2y6aGSEi1O7IjtmDRuhV4iW9oDnoUYHFJr+NnkZw=;
        h=In-Reply-To:References:To:From:Cc:Subject:Date:From;
        b=2wTQ0bRk+dT5wClH2j/LUxzHRh/DqGD52/v9A6Ct++U/etB+2/+3zj5FvvNZCSqFB
         vKsJpAU8WI43KaV3kjS3zqr7kwZL2KS9jiiANcjo2eqH+QL7lQhtad4nvReOwtFlvL
         infNYS+DXT/9y0hmiCEmYGsUtd2SfQHXH3liB610=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c3e86b5a832a14278e8ba670d51defc70ee78d84.1567590349.git.leonard.crestez@nxp.com>
References: <c3e86b5a832a14278e8ba670d51defc70ee78d84.1567590349.git.leonard.crestez@nxp.com>
To:     Leonard Crestez <leonard.crestez@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Jacky Bai <ping.bai@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Viorel Suman <viorel.suman@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: imx: pll14xx: Fix quick switch of S/K parameter
User-Agent: alot/0.8.1
Date:   Fri, 06 Sep 2019 10:24:51 -0700
Message-Id: <20190906172452.D1ED620838@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Leonard Crestez (2019-09-04 02:49:18)
> The PLL14xx on imx8m can change the S and K parameter without requiring
> a reset and relock of the whole PLL.
>=20
> Fix clk_pll144xx_mp_change register reading and use it for pll1443 as
> well since no reset+relock is required on K changes either.
>=20
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
> ---
>  drivers/clk/imx/clk-pll14xx.c | 40 +++++++----------------------------
>  1 file changed, 8 insertions(+), 32 deletions(-)
>=20
> The PLLs are currently table-based and none of the entries differ only
> in S/K so further work would be required to make use of this. The
> prospective user is audio doing tiny freq adjustments and there is no
> standard API for that.

sub-Hz adjustments?

>=20
> Lacking users is not a good reason to carry broken code around.

Maybe add a Fixes tag so if anyone wants to use it in LTS kernels there
might be a chance that they'll find this patch mention code they're
using.

