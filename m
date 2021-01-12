Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E28EC433E0
	for <linux-clk@archiver.kernel.org>; Tue, 12 Jan 2021 19:27:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08BCB2310A
	for <linux-clk@archiver.kernel.org>; Tue, 12 Jan 2021 19:27:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406741AbhALT0t (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Jan 2021 14:26:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:48010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406739AbhALT0s (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 12 Jan 2021 14:26:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25AAE23117;
        Tue, 12 Jan 2021 19:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610479568;
        bh=1Ds1J19akVCIPtrgsA882I0BkKmtbnGeCyUvVetBzL0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=qJ4Yd+0TbTyenNCeMwLztwi3j12MEUophMTbVivckXErLrqo0YBxiXt+j1gY+oDjO
         c+UFyJLzSoAvyVA26EdDyFHpLPdq7qLq2mzXa6ZjSOcTgoz9iyNUosQXoJ+gNu+kc4
         TXCWxU1LX+Xs19K/sd64KYBvkuz6YwPPJhbvAosoM/vqflxKYsiU1OZ8yxeRoAgbte
         yDHGLIWv4gTSI4FN8AIDoWwip5hVjNkd3aC61Mi1tfjFCEOdmIzHge2BsU+f/M1Hib
         YkjF4iri6WgCXOIGZf+1Iepj62Sbptvpt+bG9WTBhA3TY7ZkjQs+TdSI7nyiDxlynv
         jp8cxOxWNFecw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210111014110.GW28365@dragon>
References: <20201230155244.981757-1-arnd@kernel.org> <20210111014110.GW28365@dragon>
Subject: Re: [PATCH] clk: imx: fix Kconfig warning for i.MX SCU clk
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
To:     Arnd Bergmann <arnd@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Date:   Tue, 12 Jan 2021 11:26:06 -0800
Message-ID: <161047956699.3661239.3642448603240028603@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shawn Guo (2021-01-10 17:41:11)
> On Wed, Dec 30, 2020 at 04:52:25PM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >=20
> > A previous patch introduced a harmless randconfig warning:
> >=20
> > WARNING: unmet direct dependencies detected for MXC_CLK_SCU
> >   Depends on [n]: COMMON_CLK [=3Dy] && ARCH_MXC [=3Dn] && IMX_SCU [=3Dy=
] && HAVE_ARM_SMCCC [=3Dy]
> >   Selected by [m]:
> >   - CLK_IMX8QXP [=3Dm] && COMMON_CLK [=3Dy] && (ARCH_MXC [=3Dn] && ARM6=
4 [=3Dy] || COMPILE_TEST [=3Dy]) && IMX_SCU [=3Dy] && HAVE_ARM_SMCCC [=3Dy]
> >=20
> > Since the symbol is now hidden and only selected by other symbols,
> > just remove the dependencies and require the other drivers to
> > get it right.
> >=20
> > Fixes: 6247e31b7530 ("clk: imx: scu: fix MXC_CLK_SCU module build break=
")
> > Reported-by: Anders Roxell <anders.roxell@linaro.org>
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>=20
> Looks good to me.
>=20
> Stephen, I assume that you will pick it up as a material for 5.11-rc.
>=20

Sure. Applied to clk-fixes.
