Return-Path: <SRS0=CNvH=EI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01FFBC00A89
	for <linux-clk@archiver.kernel.org>; Mon,  2 Nov 2020 23:36:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A29FF22384
	for <linux-clk@archiver.kernel.org>; Mon,  2 Nov 2020 23:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604360171;
	bh=CRV8C2Tp6iKLHwUS/Grck1D9BQp3JqHIdxV29tUsxvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=LW7NoyLU+NaA1V0YiGtHuEagPi/bGpc2IsMp/BMUhGkMo4bEHyPlgIdWkSmsQFQ46
	 GXnjdTFxOGmyRmx3aFSwm+dt7yIdgkXU00ohDZDLKHxcmPPToJ4EUAvnRoWR7Silos
	 Hi0ZKoXS2WeQ/ZTuZ6695mZNXQXMSCquJ2quS8sk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgKBXgL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 2 Nov 2020 18:36:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:34572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726433AbgKBXgL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 2 Nov 2020 18:36:11 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CCE76222BA;
        Mon,  2 Nov 2020 23:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604360170;
        bh=CRV8C2Tp6iKLHwUS/Grck1D9BQp3JqHIdxV29tUsxvU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XVRKF95eDLutw9IswFoF+yzqV6t7m4cR5sn5Z4a3nWJIA8Uxoj+cNFCb4MjaOO74w
         GgTmALuAAxat7t/AJe41xqHytBG8rbd4Xyp6uotn00+1QiYPpC53j3BSOMI+F4qx0b
         XJ/h6Kh+wVTlhkSYr1oO5pWOpMyIDNAH/sBwyJEI=
Date:   Tue, 3 Nov 2020 07:36:05 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sboyd@kernel.org, mturquette@baylibre.com, fabio.estevam@nxp.com,
        linux-imx@nxp.com, kernel@pengutronix.de,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/1] clk: imx: scu: fix build break when compiled as
 modules
Message-ID: <20201102233604.GV31601@dragon>
References: <20201030153733.30160-1-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201030153733.30160-1-aisheng.dong@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Oct 30, 2020 at 11:37:33PM +0800, Dong Aisheng wrote:
> After commit e0d0d4d86c76 ("clk: imx8qxp: Support building i.MX8QXP clock
> driver as module"), clk-scu.c and clk-imx8qxp.c are complied in one module,
> thus there can be only one module_init() in those two files.
> Commit 77d8f3068c63 ("clk: imx: scu: add two cells binding support")
> introduced another module_init() in clk_scu.c which caused the errors
> below.
> 
> To fix the issue, we can remove the unnecessary builtin_platform_driver
> from clk_scu.c and directly register the driver in imx_clk_scu_init().
> 
>   CC [M]  drivers/clk/imx/clk-scu.o
> In file included from ../include/linux/of_device.h:6,
>                  from ../include/linux/of_platform.h:12,
>                  from ../drivers/clk/imx/clk-scu.c:11:
> ../drivers/clk/imx/clk-scu.c: In function ‘imx_clk_scu_init’:
> ../drivers/clk/imx/clk-scu.c:176:35: error: ‘imx_clk_scu_driver’ undeclared (first use in this function); did you mean ‘imx_clk_scu_init’?
>   176 |  return platform_driver_register(&imx_clk_scu_driver);
>       |                                   ^~~~~~~~~~~~~~~~~~
> ../include/linux/platform_device.h:218:29: note: in definition of macro ‘platform_driver_register’
>   218 |  __platform_driver_register(drv, THIS_MODULE)
>       |                             ^~~
> ../drivers/clk/imx/clk-scu.c:176:35: note: each undeclared identifier is reported only once for each function it appears in
>   176 |  return platform_driver_register(&imx_clk_scu_driver);
>       |                                   ^~~~~~~~~~~~~~~~~~
> ../include/linux/platform_device.h:218:29: note: in definition of macro ‘platform_driver_register’
>   218 |  __platform_driver_register(drv, THIS_MODULE)
>       |                             ^~~
> ../drivers/clk/imx/clk-scu.c:177:1: error: control reaches end of non-void function [-Werror=return-type]
>   177 | }
>       | ^
> At top level:
> ../drivers/clk/imx/clk-scu.c:470:31: warning: ‘imx_clk_scu_driver’ defined but not used [-Wunused-variable]
>   470 | static struct platform_driver imx_clk_scu_driver = {
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 77d8f3068c63 ("clk: imx: scu: add two cells binding support")
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Applied, thanks.
