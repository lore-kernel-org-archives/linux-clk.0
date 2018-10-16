Return-Path: <SRS0=lNOc=M4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C716BC5ACC6
	for <linux-clk@archiver.kernel.org>; Tue, 16 Oct 2018 21:34:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7909421470
	for <linux-clk@archiver.kernel.org>; Tue, 16 Oct 2018 21:34:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zvqYHRAX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7909421470
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbeJQF06 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Oct 2018 01:26:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:52476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726168AbeJQF05 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Oct 2018 01:26:57 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0C2BB2145D;
        Tue, 16 Oct 2018 21:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1539725678;
        bh=Ho9KpbohbA0760vRD204NuYD79hruaWcA5S8s3BKno8=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=zvqYHRAX3RXmmyYEATDnDBjulIqExxRzgb5kpNq7ofDakzj+3HpTqeBgPumPWptI1
         6vGLRVGpSIo/Z1Pz8qmf8aWxCSRQ3id0aEZYADY3qjgddacXzPhKZwqBNdCyaQjsZt
         BcFS9hv+rp2+mniqW7mUwVhUquwCPs9Sprhl19zc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "A.s. Dong" <aisheng.dong@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1539504194-28289-11-git-send-email-aisheng.dong@nxp.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "A.s. Dong" <aisheng.dong@nxp.com>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
 <1539504194-28289-11-git-send-email-aisheng.dong@nxp.com>
Message-ID: <153972567736.5275.15651461252543929480@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH V4 10/11] clk: imx: add imx_check_clk_hws helper function
Date:   Tue, 16 Oct 2018 14:34:37 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting A.s. Dong (2018-10-14 01:08:13)
> Add imx_check_clk_hws helper function
> =

> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  drivers/clk/imx/clk-common.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> =

> diff --git a/drivers/clk/imx/clk-common.h b/drivers/clk/imx/clk-common.h
> index e3634a5..01550fd 100644
> --- a/drivers/clk/imx/clk-common.h
> +++ b/drivers/clk/imx/clk-common.h
> @@ -13,4 +13,15 @@ static inline struct clk_hw *imx_clk_hw_fixed(const ch=
ar *name, int rate)
>         return clk_hw_register_fixed_rate(NULL, name, NULL, 0, rate);
>  }
>  =

> +static inline void imx_check_clk_hws(struct clk_hw *clks[], unsigned int=
 count)
> +{
> +       unsigned int i;
> +
> +       for (i =3D 0; i < count; i++) {
> +               if (IS_ERR(clks[i]))
> +                       pr_err("i.MX clk %u: register failed with %ld\n",
> +                               i, PTR_ERR(clks[i]));
> +       }
> +}

And get rid of this too? I don't see the need for layers on top of code
snippets. Just write them many times in the same driver, and then
decide to consolidate that logic behind something larger than a few
helper functions.

> +
