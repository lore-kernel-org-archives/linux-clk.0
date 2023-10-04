Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E111E8FDD1
	for <linux-clk@archiver.kernel.org>; Wed,  4 Oct 2023 07:55:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241594AbjJDHz4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Oct 2023 03:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241495AbjJDHzz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Oct 2023 03:55:55 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26C20AF
        for <linux-clk@vger.kernel.org>; Wed,  4 Oct 2023 00:55:50 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-536071e79deso1370584a12.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Oct 2023 00:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696406148; x=1697010948; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=huU9GLUbAyhJezerPvvPuYZjgMHClNgkYZPBCp4Pq+Y=;
        b=S1WfeXR8AImo076v8hdVMpBnk/kNnRjLZHLFlTj2C6AvZxZHxe5ZQohFeuXNhuw+uC
         dgrWWhaJT9EyNU0QqE+1jiGhWDMXH2O+So4mfY1+8mndOCY5to/1R2vbv8DAc3cT9ADb
         +HbJKj3Y33O3J68lsdDV870gJrNstzh5k553X2cEtrToj22nqOUMLYSjEsQSEdd0J5BL
         3loZ/0pwg/jp1cP8CmbuAUZ16AhNPUfr92ie7GmuyuQGjEADZvH9AbqvyhhjJbbONzwq
         BjtR4Bn0qXRWfIiVwqd4T1WMIO8Q12FnvxNxBcH7xSG5v4NcMQw/IoFZt1sUfA9qAvnv
         CWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696406148; x=1697010948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=huU9GLUbAyhJezerPvvPuYZjgMHClNgkYZPBCp4Pq+Y=;
        b=rv/u7juTY9e2ks08Ak4MWl1l66OAAHOM2bdf/FoJD3+lUF6NhDqcQtkMskuQg7IodZ
         qFget9H/ZoJbh4mvUvkGLwhCXoLAZFBVwker7KiHE+gi+QCSFacQxmgZd4Nlmj7KYOmE
         zPpwZO/gGepHUnQKVEClpsACGCsH8bmrhs3UIlMz3R+nMlBWXCq5PaYLP6H7cmfFPSfr
         uJva04hyjdW3VQPnsmQTyaV+iUFG347+TAnXKYIYnWKpRxVxb1G9vrtzY+cnj4f6huhB
         Vix/OdGwPkpUFayYnDr0lv2+5M9BeoSTzUXWPjdWVFQf6LXmOxZ8Wq9bVj3FARup7SuH
         Bh4A==
X-Gm-Message-State: AOJu0YzF7YZP2Qg755OsOb4kNXrPpniSQ9UBIWjYeHqeC8G4A8/Qa0da
        WMlxcJqDqhcV5jxWFcuBO5RMOw==
X-Google-Smtp-Source: AGHT+IHYri6C7OFNJQ5pfBwP0AN4RO0hD5jinL/XXp9CFPzYNcSt/SJw8CjREvYv8gJeLfBAsQwMnQ==
X-Received: by 2002:aa7:d70b:0:b0:52f:a763:aab4 with SMTP id t11-20020aa7d70b000000b0052fa763aab4mr1234365edq.5.1696406148624;
        Wed, 04 Oct 2023 00:55:48 -0700 (PDT)
Received: from linaro.org ([86.123.99.172])
        by smtp.gmail.com with ESMTPSA id l18-20020a056402345200b005231e3d89efsm1999829edc.31.2023.10.04.00.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 00:55:48 -0700 (PDT)
Date:   Wed, 4 Oct 2023 10:55:46 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/4] clk: imx: Add 1039.5MHz frequency support for imx9
 pll
Message-ID: <ZR0agiulSIHBOPpb@linaro.org>
References: <20230912131649.1491378-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912131649.1491378-1-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-09-12 21:16:46, Peng Fan (OSS) wrote:
> From: Jacky Bai <ping.bai@nxp.com>
> 
> For video pll, it may need to 1039.5MHz clock to fulfill
> the LVDS display 148.5MHz * 7 requirement. So add 1039.5MHz
> frequency config support for i.MX9 video PLL.

Whole series LGTM.

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Acked-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/imx/clk-fracn-gppll.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
> index 44462ab50e51..96105ee4d9ef 100644
> --- a/drivers/clk/imx/clk-fracn-gppll.c
> +++ b/drivers/clk/imx/clk-fracn-gppll.c
> @@ -78,6 +78,7 @@ struct clk_fracn_gppll {
>   * The Fvco should be in range 2.5Ghz to 5Ghz
>   */
>  static const struct imx_fracn_gppll_rate_table fracn_tbl[] = {
> +	PLL_FRACN_GP(1039500000U, 173, 25, 100, 1, 4),
>  	PLL_FRACN_GP(650000000U, 162, 50, 100, 0, 6),
>  	PLL_FRACN_GP(594000000U, 198, 0, 1, 0, 8),
>  	PLL_FRACN_GP(560000000U, 140, 0, 1, 0, 6),
> -- 
> 2.37.1
> 
