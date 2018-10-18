Return-Path: <SRS0=Y0Ip=M6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D25C5ACCC
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 17:38:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DF00B2145D
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 17:38:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eblv0ToH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF00B2145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbeJSBkU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Oct 2018 21:40:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:43544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726269AbeJSBkU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Oct 2018 21:40:20 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C11842083E;
        Thu, 18 Oct 2018 17:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1539884299;
        bh=fCPxyGmFRPFx8tD9EdrEGWYKKh/A4yTdLsOhMEDgkeA=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=Eblv0ToHdlr7hO/hHStc89jh7sPmQU4ARhS0CN1ygztmHFZ0/d7RVM3aqo3+Yi1YB
         2i+71YVdnKdt48SoeortUGTjyWun4a3fdvjxeHHA+EPi6SQP9ViE9enPFt0xEC7S9d
         ra2yheBmNZgAfqAqE0yZ2vjcdeUhuPzlpbidOWQE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "A.s. Dong" <aisheng.dong@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1539881347-20871-10-git-send-email-aisheng.dong@nxp.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "A.s. Dong" <aisheng.dong@nxp.com>
References: <1539881347-20871-1-git-send-email-aisheng.dong@nxp.com>
 <1539881347-20871-10-git-send-email-aisheng.dong@nxp.com>
Message-ID: <153988429912.5275.13469659599335212731@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH V5 9/9] clk: imx: add imx8qxp clk driver
Date:   Thu, 18 Oct 2018 10:38:19 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting A.s. Dong (2018-10-18 09:54:15)
> +
> +#include <dt-bindings/clock/imx8qxp-clock.h>
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#include <soc/imx/imx8qxp/lpcg.h>
> +
> +#include "clk-scu.h"
> +
> +static struct clk_hw_onecell_data *imx8qxp_clk_data;
> +
> +static const char * const enet_sels[] =3D { "enet_25MHz", "enet_125MHz",=
 };
> +static const char * const enet0_rmii_tx_sels[] =3D { "enet0_ref_div", "d=
ummy", };
> +static const char * const enet1_rmii_tx_sels[] =3D { "enet1_ref_div", "d=
ummy", };
> +
> +static int imx8qxp_clk_probe(struct platform_device *pdev)
> +{
> +       struct device_node *ccm_node =3D pdev->dev.of_node;

Where's the DT binding for this device?

> +       struct clk_hw **clks;
> +       int ret, i;
> +
> +       ret =3D imx_clk_scu_init();
