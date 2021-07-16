Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B5BC12002
	for <linux-clk@archiver.kernel.org>; Fri, 16 Jul 2021 20:26:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB661613CF
	for <linux-clk@archiver.kernel.org>; Fri, 16 Jul 2021 20:26:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232957AbhGPU3i (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Jul 2021 16:29:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:45268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230256AbhGPU3i (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 16 Jul 2021 16:29:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A56CC61158;
        Fri, 16 Jul 2021 20:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626467202;
        bh=CQ62KNcy8erbGsP90kGokpdR9jbTV2+zooB1ubvzSQ8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=twhAPgEHxecbs+9QFTHmed6YNUQ/wkIOuybFfE/FKKw4ZVH0JeJgmrtCAQ+OEG9fV
         iweoKbCK2g9FbN4d44WNm7vYbCluVoeWglrrIPQwRoYfwjSC/j3Cfn6Wboqf5cjFy4
         SPNdCGJagxdeGeasSYmPOljp9+E4/j3bHPHKrgKsiR6SwG6ieboBlZF5UTHvFwIQpH
         BkYeNKpohKedH04lLAAmaFA4SiFa/ytm0yYs3xvzWTDojjoxfjOXMLlJ8aA4JfjpbR
         j36z994tPOAIhyAvJ+bqDRHnggFFb7SKMfs4lNqzFE14GpB5Le+ns3Z9uKPfaC1yZ4
         UMZUzaC/gbwAw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210619230526.1864087-2-linus.walleij@linaro.org>
References: <20210619230526.1864087-1-linus.walleij@linaro.org> <20210619230526.1864087-2-linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] clk: ux500: Add driver for the reset portions of PRCC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Fri, 16 Jul 2021 13:26:41 -0700
Message-ID: <162646720139.2679160.16129595105161738282@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Linus Walleij (2021-06-19 16:05:26)
> The Ux500 PRCC (peripheral reset and clock controller) can also
> control reset of the IP blocks, not just clocks. As the PRCC is probed
> as a clock controller and we have other platforms implementing combined
> clock and reset controllers, follow this pattern and implement the PRCC
> rest controller as part of the clock driver.
>=20
> The reset controller needs to be selected from the machine as Ux500 has
> traditionally selected its mandatory subsystem prerequisites from there.
>=20
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/mach-ux500/Kconfig      |   1 +
>  drivers/clk/ux500/Makefile       |   3 +
>  drivers/clk/ux500/prcc.h         |  36 +++++++
>  drivers/clk/ux500/reset-prcc.c   | 159 +++++++++++++++++++++++++++++++
>  drivers/clk/ux500/reset-prcc.h   |  22 +++++
>  drivers/clk/ux500/u8500_of_clk.c |  32 ++++---
>  6 files changed, 240 insertions(+), 13 deletions(-)
>  create mode 100644 drivers/clk/ux500/prcc.h
>  create mode 100644 drivers/clk/ux500/reset-prcc.c
>  create mode 100644 drivers/clk/ux500/reset-prcc.h
>=20
> diff --git a/arch/arm/mach-ux500/Kconfig b/arch/arm/mach-ux500/Kconfig
> index c1086ebe0050..24ed7f4a87a4 100644
> --- a/arch/arm/mach-ux500/Kconfig
> +++ b/arch/arm/mach-ux500/Kconfig
> @@ -29,6 +29,7 @@ menuconfig ARCH_U8500
>         select REGULATOR_DB8500_PRCMU
>         select REGULATOR_FIXED_VOLTAGE
>         select SOC_BUS
> +       select RESET_CONTROLLER

Please Cc Philipp Zabel <p.zabel@pengutronix.de> for reset controller
things.
