Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6713BECAAA1
	for <linux-clk@archiver.kernel.org>; Tue,  6 Sep 2022 12:21:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239955AbiIFMVa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Sep 2022 08:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239960AbiIFMUL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Sep 2022 08:20:11 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73FF570E59
        for <linux-clk@vger.kernel.org>; Tue,  6 Sep 2022 05:17:37 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id b17so1817474wrq.3
        for <linux-clk@vger.kernel.org>; Tue, 06 Sep 2022 05:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=+UlWrw6k4PbZ0Bp3jwpP3kUtJ+9fIITKXd6zIt0eUZE=;
        b=XLrVvAkV1DUhzRF3H2dGjkj6ciwhvJFFu1jFBdKGAxtMFaLYrfCe7qzWcUm8n8VXSB
         zUKFOAgty3NGeEjFaTm3a/z+E6Fzqn1DKITKiEyr8sNBwAHN29vmO/ZPSKTRbtBqoIUZ
         9fzk4hJPDCwT94j9Z3kvMDkecpI7k8+yr0SVwWbW3fASZ/xIX9okKse44m3aQGHuKMbZ
         vx094Yv+1ucIdOqA3AgdqWxHz3V0IHwDVO9OpGDcgBn5w+zYd1w+LPIR7LSXEgKaBRaK
         zsZsBPeCglF9Hd+nd0vO2OhSm9aGAdA5os+gS66l7Sj4/+Lg5ASJdBocrW8Zzosc5OFw
         lw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=+UlWrw6k4PbZ0Bp3jwpP3kUtJ+9fIITKXd6zIt0eUZE=;
        b=jBU3IA6n8RhM/zkhc7HKgmYIBcZX67VFYDA58E+jTglcT0wFxEcxKxW2Nqr8oikF/g
         9RAnJDQHaSDRexPfX12hqY5dIrsGkSq/ZEnEau5OIcJfcKVj9s8MkVY8DvnpB7PtXdHR
         caXA5fMZtHPCQZpvKNhb48chql5zpNrZryeszLpwhU/gdt43QFcIHlt2sA86yzFEmk0W
         bCYVeRg7gsp/HpuIuOXHOlKyLqjM4ucAYvAbXME40Efq0FBDx6qFxsZYItnGx54L7ufq
         TFn31ScjQP5XLX1jco5oI14CaHQRiUb0KTnhXanJbmB+VwisvtQCVCsJrxZD0z3/BPPE
         0cfw==
X-Gm-Message-State: ACgBeo1xuiSzPNdb/4iYzqhigHoal7Fw/F6eZjItKZAfCsx+SFMgbqjs
        P7ee/9JUkeJS3bPJvNetdtgk7A==
X-Google-Smtp-Source: AA6agR7E8jBKkN9pv0a+Lqa5ys9tbNW3Q0pnYjeGQumt1nLD34WHTaz0hQcr9khlbW+SrxYzv8KXmg==
X-Received: by 2002:a05:6000:168e:b0:220:87da:c3e4 with SMTP id y14-20020a056000168e00b0022087dac3e4mr26389881wrd.559.1662466647455;
        Tue, 06 Sep 2022 05:17:27 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id h6-20020a05600c350600b003a541d893desm15741459wmq.38.2022.09.06.05.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 05:17:26 -0700 (PDT)
Date:   Tue, 6 Sep 2022 15:17:25 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] clk: imx: clk-gate-93: fix build error with x86_64
 allmodconfig
Message-ID: <Yxc6VVXs98+HpovI@linaro.org>
References: <20220906024047.1840977-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906024047.1840977-1-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-09-06 10:40:47, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> When building with x86_64 allmodconfig:
> ERROR: modpost: missing MODULE_LICENSE() in drivers/clk/imx/clk-gate-93.o
> 
> Fix it with 'mxc-clk-objs += clk-gate-93.o'
> 
> Fixes: 4e9331d4e2e0 ("clk: imx: add i.MX93 clk gate")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Hi Peng,

Since the commit this patch fixes is just in my tree for now,
I squahed in the mentioned commit.

So, it is applied.

Thanks!

> ---
>  drivers/clk/imx/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
> index 89fe72327788..e8aacb0ee6ac 100644
> --- a/drivers/clk/imx/Makefile
> +++ b/drivers/clk/imx/Makefile
> @@ -12,6 +12,7 @@ mxc-clk-objs += clk-fixup-div.o
>  mxc-clk-objs += clk-fixup-mux.o
>  mxc-clk-objs += clk-frac-pll.o
>  mxc-clk-objs += clk-gate2.o
> +mxc-clk-objs += clk-gate-93.o
>  mxc-clk-objs += clk-gate-exclusive.o
>  mxc-clk-objs += clk-pfd.o
>  mxc-clk-objs += clk-pfdv2.o
> @@ -28,7 +29,7 @@ obj-$(CONFIG_CLK_IMX8MN) += clk-imx8mn.o
>  obj-$(CONFIG_CLK_IMX8MP) += clk-imx8mp.o
>  obj-$(CONFIG_CLK_IMX8MQ) += clk-imx8mq.o
>  
> -obj-$(CONFIG_CLK_IMX93) += clk-imx93.o clk-gate-93.o
> +obj-$(CONFIG_CLK_IMX93) += clk-imx93.o
>  
>  obj-$(CONFIG_MXC_CLK_SCU) += clk-imx-scu.o clk-imx-lpcg-scu.o
>  clk-imx-scu-$(CONFIG_CLK_IMX8QXP) += clk-scu.o clk-imx8qxp.o \
> -- 
> 2.37.1
> 
