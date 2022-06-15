Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD09C43334
	for <linux-clk@archiver.kernel.org>; Wed, 15 Jun 2022 21:33:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239284AbiFOVdi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Jun 2022 17:33:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349738AbiFOVdc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Jun 2022 17:33:32 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD3E8562F3
        for <linux-clk@vger.kernel.org>; Wed, 15 Jun 2022 14:33:31 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id m32-20020a05600c3b2000b0039756bb41f2so1782545wms.3
        for <linux-clk@vger.kernel.org>; Wed, 15 Jun 2022 14:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FHCgMR0zC6073KkKzBA7+KuYMf8m8qDzlw0gsozoQIE=;
        b=W2QVbbAYYu7mWgIYle5tHxbX0FLapzLXF0sLdVCrI227bEvunK2SICl7MLBavrSx2d
         3YtGMuLqfoJxUYbi8NDEmBV4lRqvx9YldMl4ezfeHU/o8AzdfmTiIPuczRjptgv9DeVC
         4Jj5JCdPRvJd6aN1vSahO0ukJZEkwpFvicoYYS+DT0FcjX/T2BjxebQr3VhqUI12pG6K
         uTt+XyUe6BIXpd26MxXZKtzBg5QjrxKLd961Ho7/pwd6zmckQZkGqEtWG78yWEsQB5nq
         3scVK+/lJmqz4DF1oQfodurvKt5dB4PQQSOo3gP9zQe1d1d6mHUhvrlWu+dGUbrtzefR
         BnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FHCgMR0zC6073KkKzBA7+KuYMf8m8qDzlw0gsozoQIE=;
        b=reurhS0aa63o+vZsuJmQOd/3oJPiJDvLVp9YBTMtsd/6FoLftpFqJx9T4fOuOXudW3
         lTlOaxNGX5uFG+TPzBOWZHosKKT4OTi6eHVKKleZ8cx84H1EbARbiGX96pOOPBpsaQEA
         HgyXFSB7knjA2Vp1Jr5pAMHcGzH+e/Gm9KTsVHBvAegUHW/4XExL2C/nnr9fQbt8Ilj1
         pNM7MriWjyfOEP60Cm3aq9VfTFFc7QZPidvLXZwXWA597XV//8vuC5K80c8aiqIWbVLV
         5KRPjRFzCcoA1Pgr/1jNU8Lg1Mk3ajxMU52ECBb+axqQV1AECU7CcPaKrPBjJzVN4FAm
         FTpQ==
X-Gm-Message-State: AJIora/+bAbQzRqegCgpZlpgmcVt/t0QuUfwM1jCemZszRTB/J/vzfGA
        mit13R2zrRgW7aIz755Jz4te1g==
X-Google-Smtp-Source: AGRyM1svoZTNQUoMWyJhFy1AB6oHLf7bgOw37rJYJjPV9QaPGg6mHy//U6S7JSX4hvFGrav1+gSQUQ==
X-Received: by 2002:a05:600c:d0:b0:39c:5927:3fa7 with SMTP id u16-20020a05600c00d000b0039c59273fa7mr1547005wmm.36.1655328810461;
        Wed, 15 Jun 2022 14:33:30 -0700 (PDT)
Received: from ryzen ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id z7-20020a1c4c07000000b0039c4b518df4sm209452wmf.5.2022.06.15.14.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 14:33:30 -0700 (PDT)
Date:   Thu, 16 Jun 2022 00:33:28 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     abel.vesa@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/7] clk: imx93: correct nic_media parent
Message-ID: <YqpQKMeAHwuOgb8U@ryzen>
References: <20220609132902.3504651-1-peng.fan@oss.nxp.com>
 <20220609132902.3504651-3-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609132902.3504651-3-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-06-09 21:28:57, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> NIC_MEDIA sources from media_axi_root, not media_apb_root.
>
> Fixes: 24defbe194b6 ("clk: imx: add i.MX93 clk")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-imx93.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
> index 172cd56c9610..26885bd3971c 100644
> --- a/drivers/clk/imx/clk-imx93.c
> +++ b/drivers/clk/imx/clk-imx93.c
> @@ -219,7 +219,7 @@ static const struct imx93_clk_ccgr {
>  	{ IMX93_CLK_LCDIF_GATE,		"lcdif",	"media_apb_root",	0x9640, },
>  	{ IMX93_CLK_PXP_GATE,		"pxp",		"media_apb_root",	0x9680, },
>  	{ IMX93_CLK_ISI_GATE,		"isi",		"media_apb_root",	0x96c0, },
> -	{ IMX93_CLK_NIC_MEDIA_GATE,	"nic_media",	"media_apb_root",	0x9700, },
> +	{ IMX93_CLK_NIC_MEDIA_GATE,	"nic_media",	"media_axi_root",	0x9700, },
>  	{ IMX93_CLK_USB_CONTROLLER_GATE, "usb_controller", "hsio_root",		0x9a00, },
>  	{ IMX93_CLK_USB_TEST_60M_GATE,	"usb_test_60m",	"hsio_usb_test_60m_root", 0x9a40, },
>  	{ IMX93_CLK_HSIO_TROUT_24M_GATE, "hsio_trout_24m", "osc_24m",		0x9a80, },
> --
> 2.25.1
>
