Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 284BDC433F5
	for <linux-clk@archiver.kernel.org>; Fri,  3 Sep 2021 18:33:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B4F161056
	for <linux-clk@archiver.kernel.org>; Fri,  3 Sep 2021 18:33:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348002AbhICSeP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Sep 2021 14:34:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:59760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346181AbhICSeH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 3 Sep 2021 14:34:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E4A360724;
        Fri,  3 Sep 2021 18:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630693987;
        bh=2VCYYGoCk3mGK2hcQYFybjDX6U8y+rSBiFZLP7nqLg8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=a4Xt67Y0n6gKE1kYqCavYl7wc35dUxpuNoeFNgPgtd3IMP9QPJISVc2S7mgwhwJjR
         gKgxm47GFISKNcF/7RSNuzdlJGeoHbxIoF2Op61HgdaT562h4KiRKWnWrOGfhpwcrS
         Gf4AGXtWet1IOmS4lUfSg2Sfe51Jml3F55ha00v/5l0MDQ/GdEp422a5BWrlBtu7+t
         sMAoq8J3fuCyK6BH3rCcChrWisaFL5r7+U4BkjIVVPe+opoz4tPBQa+4MP3a4pwmv9
         7BkEt/ynF+Wq7ByzeqADwTjOyJxRG9nrMP+WTR+eDgaopX9b12zQN4BERwL72EURic
         Iee9BJ/rfZejQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210902080211.7922-1-miles.chen@mediatek.com>
References: <20210902080211.7922-1-miles.chen@mediatek.com>
Subject: Re: [PATCH] clk: imx: use module_platform_driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        wsd_upstream@mediatek.com, Miles Chen <miles.chen@mediatek.com>
To:     Abel Vesa <abel.vesa@nxp.com>, Fabio Estevam <festevam@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Miles Chen <miles.chen@mediatek.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
Date:   Fri, 03 Sep 2021 11:33:06 -0700
Message-ID: <163069398650.405991.6861280615873228198@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Miles Chen (2021-09-02 01:02:11)
> Replace builtin_platform_driver_probe with module_platform_driver_probe
> because that CONFIG_CLK_IMX8QXP can be set to =3Dm (kernel module).
>=20
> Cc: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> ---

Should it have a fixes tag?
