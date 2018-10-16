Return-Path: <SRS0=lNOc=M4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41767C5ACCC
	for <linux-clk@archiver.kernel.org>; Tue, 16 Oct 2018 21:32:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EF40D21470
	for <linux-clk@archiver.kernel.org>; Tue, 16 Oct 2018 21:32:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWxgndsJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF40D21470
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbeJQFZD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Oct 2018 01:25:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:51942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725960AbeJQFZD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Oct 2018 01:25:03 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A7ADC2145D;
        Tue, 16 Oct 2018 21:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1539725563;
        bh=8sUCgpZ6j9R6fzrvcEK2260gGT8qpUc4hjAXmnqIjiY=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=oWxgndsJQvPJIHJeq/rPvHqJ/rtGh4Tak25xgQpmhuHzS7kw7mjHQkRg9HJZ61aSI
         CTN9jkdXmXxF/jT8A/Blx1eZVZ2eRpGUr5J/xZePoED/+NDBnjdX9iW0ctto7M32Bu
         GofIgSCiTtMLMcWPS6PqgmjCfAB3Mq8O/kM9OAqM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "A.s. Dong" <aisheng.dong@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1539504194-28289-10-git-send-email-aisheng.dong@nxp.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "A.s. Dong" <aisheng.dong@nxp.com>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
 <1539504194-28289-10-git-send-email-aisheng.dong@nxp.com>
Message-ID: <153972556312.5275.17225594568267875356@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH V4 09/11] clk: imx: add common imx_clk_hw_fixed functions
Date:   Tue, 16 Oct 2018 14:32:43 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting A.s. Dong (2018-10-14 01:08:09)
> This may be used by both mmio and scu clks. So let's put it
> into a common file.
> =

> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  drivers/clk/imx/clk-common.h  | 16 ++++++++++++++++
>  drivers/clk/imx/scu/clk-scu.h |  2 ++
>  2 files changed, 18 insertions(+)
>  create mode 100644 drivers/clk/imx/clk-common.h
> =

> diff --git a/drivers/clk/imx/clk-common.h b/drivers/clk/imx/clk-common.h
> new file mode 100644
> index 0000000..e3634a5
> --- /dev/null
> +++ b/drivers/clk/imx/clk-common.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright 2018 NXP
> + */
> +
> +#ifndef __IMX_CLK_COMMON_H
> +#define __IMX_CLK_COMMON_H
> +
> +#include <linux/clk-provider.h>
> +
> +static inline struct clk_hw *imx_clk_hw_fixed(const char *name, int rate)
> +{
> +       return clk_hw_register_fixed_rate(NULL, name, NULL, 0, rate);
> +}

Why do we need this wrapper file? Just call the registration function
directly with the right arguments instead of wrapping them in another
function please.

