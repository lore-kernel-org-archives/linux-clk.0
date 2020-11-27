Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21B3C3E8C5
	for <linux-clk@archiver.kernel.org>; Fri, 27 Nov 2020 20:17:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CF0221D7F
	for <linux-clk@archiver.kernel.org>; Fri, 27 Nov 2020 20:17:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TOOfSjAp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732312AbgK0UQ6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 27 Nov 2020 15:16:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:40738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731379AbgK0UQa (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 27 Nov 2020 15:16:30 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CB368206F7;
        Fri, 27 Nov 2020 20:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606508188;
        bh=FPQG/Gj4KnDrsVvZOjQIh9kS3ZFl/ooHI8AwGxcPYrE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TOOfSjAprV1GZJ3xjrATnqrsm6aUeIQYFLCfB04tArVPlRubCJOGTn+UiIJLtYwAm
         yVepdCYRQ63iHGe0OPe06gxStd00jIB+eeQ1/hVizJ4YFTy5TIuI7cuUZJlxaWxxLV
         1rCTDAHFMFR3bmsCthiov4FVFIIyoP+Fw+6aZ+BI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201125105037.22079-1-aisheng.dong@nxp.com>
References: <20201125105037.22079-1-aisheng.dong@nxp.com>
Subject: Re: [PATCH 1/1] clk: imx: scu: fix MXC_CLK_SCU module build break
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        sudipm.mukherjee@gmail.com, shawnguo@kernel.org,
        dongas86@gmail.com, Dong Aisheng <aisheng.dong@nxp.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org
Date:   Fri, 27 Nov 2020 12:16:27 -0800
Message-ID: <160650818748.2717324.6222265265679775690@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dong Aisheng (2020-11-25 02:50:37)
> This issue can be reproduced by CONFIG_IMX_MBOX=3Dm and CONFIG_MXC_CLK_SC=
U=3Dm.
> It's caused by current Makefile can't support build clk-scu.o and

What is the issue? Can you include the error message?

> clk-imx8qxp.o separately.
> "obj-$(CONFIG_MXC_CLK_SCU) +=3D clk-imx-scu.o clk-imx-lpcg-scu.o
> clk-imx-scu-$(CONFIG_CLK_IMX8QXP) +=3D clk-scu.o clk-imx8qxp.o"
> Only enable MXC_CLK_SCU while CLK_IMX8QXP not is meaningless and buggy.

Ok. So CLK_IMX8QXP selects MXC_CLK_SCU?

>=20
> This patch makes MXC_CLK_SCU to be invisible to users and can only be
> selected by CLK_IMX8QXP option to ensure they're built together.
>=20
> Fixes: e0d0d4d86c766 ("clk: imx8qxp: Support building i.MX8QXP clock driv=
er as module")
> Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  drivers/clk/imx/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
> index 3b393cb07295..dbacdd70af2e 100644
> --- a/drivers/clk/imx/Kconfig
> +++ b/drivers/clk/imx/Kconfig
> @@ -5,7 +5,7 @@ config MXC_CLK
>         depends on ARCH_MXC || COMPILE_TEST
> =20
>  config MXC_CLK_SCU
> -       tristate "IMX SCU clock"
> +       tristate
>         depends on ARCH_MXC || COMPILE_TEST

Is it a temporary workaround? Because COMPILE_TEST on an option that
isn't selectable is meaningless.

>         depends on IMX_SCU && HAVE_ARM_SMCCC
>
