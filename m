Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED85C433DB
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 20:16:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91CF964E0A
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 20:16:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239620AbhBDUQV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Feb 2021 15:16:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:60002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238852AbhBDTzS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 4 Feb 2021 14:55:18 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1440264E02;
        Thu,  4 Feb 2021 19:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612468468;
        bh=d1OwWDrPgZnfxsboVh9Eld311RgpY3QRaC4WAAL4zjQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=qFLhQjqA+R5OoxEm0ZKGNkC0QcWss2Fa7wxZEM1TGKepGMoBca7FAiRaMDf6fSOKM
         2C2oU8NdtAjcRbroPS1R4Rm1HE4GgxfGOQjzZa+guFGo3kEq6g/nzRTf2m8ponHCcT
         jgj1UCzwtnQZQdjjNuepHm5Y2uQHZMosB8L76WrSMkf1HPtfUAmqluHSbauvFBXgsZ
         juZ+6vD415Sqr4ZVVqoAHS2Fz3Zg6Z0OdBaEmR8yE98hYDvWxbCi43xqq2XKgYI3j7
         HvtsusfaDhWSW2d3lk4U4LFLMrVe3MiS7h9aYyJRnjjfmz9BQ1CzzKGYJ86LM2f8XK
         ZgaWx3eisbLkg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210202073329.GQ907@dragon>
References: <20210202073329.GQ907@dragon>
Subject: Re: [GIT PULL] i.MX clock changes for 5.12
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To:     Shawn Guo <shawnguo@kernel.org>
Date:   Thu, 04 Feb 2021 11:54:26 -0800
Message-ID: <161246846660.76967.11858384559876597343@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shawn Guo (2021-02-01 23:33:30)
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e=
5e:
>=20
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/c=
lk-imx-5.12
>=20
> for you to fetch changes up to de5774d192ba15539191ed8b0c79f3d52464b8e3:
>=20
>   clk: imx: Move 'imx6sl_set_wait_clk()'s prototype out to accessible hea=
der (2021-01-30 22:13:23 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

BTW, I see this from sparse

arch/arm/mach-imx/pm-imx6.c:372:24: warning: cast removes address space '__=
iomem' of expression
arch/arm/mach-imx/pm-imx6.c:512:9: warning: incorrect type in argument 1 (d=
ifferent address spaces)
arch/arm/mach-imx/pm-imx6.c:512:9:    expected void *s
arch/arm/mach-imx/pm-imx6.c:512:9:    got void [noderef] __iomem *static [a=
ssigned] [toplevel] suspend_ocram_base
arch/arm/mach-imx/pm-imx6.c:513:17: warning: incorrect type in assignment (=
different address spaces)
arch/arm/mach-imx/pm-imx6.c:513:17:    expected struct imx6_cpu_pm_info *pm=
_info
arch/arm/mach-imx/pm-imx6.c:513:17:    got void [noderef] __iomem *static [=
assigned] [toplevel] suspend_ocram_base
arch/arm/mach-imx/pm-imx6.c:569:36: warning: incorrect type in argument 1 (=
different address spaces)
arch/arm/mach-imx/pm-imx6.c:569:36:    expected void *dest
arch/arm/mach-imx/pm-imx6.c:569:36:    got void [noderef] __iomem *
