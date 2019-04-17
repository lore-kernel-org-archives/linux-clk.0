Return-Path: <SRS0=liI3=ST=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B20CEC282DA
	for <linux-clk@archiver.kernel.org>; Wed, 17 Apr 2019 23:30:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 78FF32184B
	for <linux-clk@archiver.kernel.org>; Wed, 17 Apr 2019 23:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555543856;
	bh=Isl+vqpMeZZ+yoHua+CHjKEXO4JgH2YxGu8WEXXbaHE=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=x6NSIIKzo2BghxLOxg1zSsYsY09itb4yNOcNSuRMOqfudT6vRY15r0RBKB3lxIOgT
	 RFxHuqlSJjFcT5ucN9c7ubcFQHRMWbZws0Ct9QQl7Hgh7r4BhI51O8XSVHS3xtj9uY
	 T4MY9BgRQCMnP3PDhmr1MVFFuGICCdWZMAPjBKUc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730285AbfDQXaz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Apr 2019 19:30:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:44844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729500AbfDQXaz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Apr 2019 19:30:55 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 427D42183F;
        Wed, 17 Apr 2019 23:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555543854;
        bh=Isl+vqpMeZZ+yoHua+CHjKEXO4JgH2YxGu8WEXXbaHE=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=RyPwUqk4je9ZQBwiO8OZnUdwZI1p7XCfgvkWmy4oMUfxDiC3+5b9xCXXaMWPjsqA/
         yoO/E3fs7TWZhXQKPVgGxFEYbUjThcgk9i5GcYjmm7TWlFrDRwMA2IcDovl5xiJgfX
         e5AEeLcKL7t5PemiZ3Acgcny9gnr1k4L/+B/A1pc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190415101046.5872-3-jonas.gorski@gmail.com>
References: <20190415101046.5872-1-jonas.gorski@gmail.com> <20190415101046.5872-3-jonas.gorski@gmail.com>
Cc:     Anatolij Gustschin <agust@denx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <michal.simek@xilinx.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH RFT V2 2/8] clk: fractional-divider: add explicit big endian support
To:     Jonas Gorski <jonas.gorski@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Message-ID: <155554385335.15276.1472868812556796901@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Wed, 17 Apr 2019 16:30:53 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jonas Gorski (2019-04-15 03:10:40)
> diff --git a/drivers/clk/clk-fractional-divider.c b/drivers/clk/clk-fract=
ional-divider.c
> index fdfe2e423d15..b9988d3b3828 100644
> --- a/drivers/clk/clk-fractional-divider.c
> +++ b/drivers/clk/clk-fractional-divider.c
> @@ -13,6 +13,22 @@
>  #include <linux/slab.h>
>  #include <linux/rational.h>
> =20
> +static inline u32 clk_fd_readl(struct clk_fractional_divider *fd)
> +{
> +       if (fd->flags & CLK_FRAC_DIVIDER_BIG_ENDIAN)
> +               return ioread32be(fd->reg);
> +       else
> +               return clk_readl(fd->reg);

Can you write it without the else?

       if (fd->flags & CLK_FRAC_DIVIDER_BIG_ENDIAN)
               return ioread32be(fd->reg);

       return clk_readl(fd->reg);

This same comment applies to all the basic clk types.

