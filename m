Return-Path: <SRS0=CNvH=EI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B02C00A89
	for <linux-clk@archiver.kernel.org>; Mon,  2 Nov 2020 21:33:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F53D22226
	for <linux-clk@archiver.kernel.org>; Mon,  2 Nov 2020 21:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604352826;
	bh=U1BkvZSwvx6lWjZUoBcs2be0FQU5WeuZX3Xt68Dyt+w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=iBpibsMG9zKkZbcSyn6XEQgua2/mlOLt9E6zsBymCBHN2plnllsc4fRyftvJuSAh/
	 gnscKni4k4KqHW6Rwn/wSrujpJqOk70vIACtbSG4/VgYiBrD7Y5LctMm1NW/8rFoqX
	 6xtVLmogKw4XyqjuEC57MKYgev2+R37l1fzH5UuY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725841AbgKBVdq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 2 Nov 2020 16:33:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:57358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725833AbgKBVdq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 2 Nov 2020 16:33:46 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8EEE2208B6;
        Mon,  2 Nov 2020 21:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604352825;
        bh=U1BkvZSwvx6lWjZUoBcs2be0FQU5WeuZX3Xt68Dyt+w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HZVZS59yedvKVvVgWkP823Q8T0mnlsA+5xOCMT/YTvc9Bv4aig55zan8YMhcK2Cjy
         +DfWihAgg9ein/iS8UuIQTXG3wpjdAp9xNwFDWn3AewFNtI4Mm4/j5zNpbmuzjsqIf
         T/YlE2xhnGAmYYXCjNwF8Y8OKwAAyxb5YtS/b4aE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201030153733.30160-1-aisheng.dong@nxp.com>
References: <20201030153733.30160-1-aisheng.dong@nxp.com>
Subject: Re: [PATCH 1/1] clk: imx: scu: fix build break when compiled as modules
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        shawnguo@kernel.org, fabio.estevam@nxp.com, linux-imx@nxp.com,
        kernel@pengutronix.de, Dong Aisheng <aisheng.dong@nxp.com>,
        kernel test robot <lkp@intel.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org
Date:   Mon, 02 Nov 2020 13:33:44 -0800
Message-ID: <160435282419.884498.14315761164677770440@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dong Aisheng (2020-10-30 08:37:33)
> After commit e0d0d4d86c76 ("clk: imx8qxp: Support building i.MX8QXP clock
> driver as module"), clk-scu.c and clk-imx8qxp.c are complied in one modul=
e,
> thus there can be only one module_init() in those two files.
> Commit 77d8f3068c63 ("clk: imx: scu: add two cells binding support")
> introduced another module_init() in clk_scu.c which caused the errors
> below.
>=20
> To fix the issue, we can remove the unnecessary builtin_platform_driver
> from clk_scu.c and directly register the driver in imx_clk_scu_init().
>=20
>   CC [M]  drivers/clk/imx/clk-scu.o
> In file included from ../include/linux/of_device.h:6,
>                  from ../include/linux/of_platform.h:12,
>                  from ../drivers/clk/imx/clk-scu.c:11:
> ../drivers/clk/imx/clk-scu.c: In function =E2=80=98imx_clk_scu_init=E2=80=
=99:
> ../drivers/clk/imx/clk-scu.c:176:35: error: =E2=80=98imx_clk_scu_driver=
=E2=80=99 undeclared (first use in this function); did you mean =E2=80=98im=
x_clk_scu_init=E2=80=99?
>   176 |  return platform_driver_register(&imx_clk_scu_driver);
>       |                                   ^~~~~~~~~~~~~~~~~~
> ../include/linux/platform_device.h:218:29: note: in definition of macro =
=E2=80=98platform_driver_register=E2=80=99
>   218 |  __platform_driver_register(drv, THIS_MODULE)
>       |                             ^~~
> ../drivers/clk/imx/clk-scu.c:176:35: note: each undeclared identifier is =
reported only once for each function it appears in
>   176 |  return platform_driver_register(&imx_clk_scu_driver);
>       |                                   ^~~~~~~~~~~~~~~~~~
> ../include/linux/platform_device.h:218:29: note: in definition of macro =
=E2=80=98platform_driver_register=E2=80=99
>   218 |  __platform_driver_register(drv, THIS_MODULE)
>       |                             ^~~
> ../drivers/clk/imx/clk-scu.c:177:1: error: control reaches end of non-voi=
d function [-Werror=3Dreturn-type]
>   177 | }
>       | ^
> At top level:
> ../drivers/clk/imx/clk-scu.c:470:31: warning: =E2=80=98imx_clk_scu_driver=
=E2=80=99 defined but not used [-Wunused-variable]
>   470 | static struct platform_driver imx_clk_scu_driver =3D {
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 77d8f3068c63 ("clk: imx: scu: add two cells binding support")
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Oh wait, I see this is upstream now.

Applied to clk-fixes
