Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66484962B
	for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 09:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719219916; cv=none; b=eZMpOWtHnQlI9ALJWANbpfh5tkI7f7oRMk2spoZxgimU3YTcx+Ph0Ra3n2IhYQLyKOGW7TM7OFqYYyA1/XkoCQxEw71+LmvdJCLUcq5aWwuSDZY5UifGI6jdYbl/xp36sWJ2DmzD7VHDJWVImTf7ug0sVCfw7tCuQ730ulTxxxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719219916; c=relaxed/simple;
	bh=hG12t8OX9r2zsfi6mBRztzi3GNBLfq5sysaB6M3sQR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYI3b4tsvcq+V2kj1Km7Y5lTqzxHoT3pKAwhZHgClrFS2s/s9dHjBDJaw5M1LIk36m52E6DNpDaCZdkL6pRikfosG5btJGPBHObCTYmEejgP8/aLzHcAG4HyZkxLHKN8lxKQKt3xw/AXC7F3kAlTVZc0edY/cW0aKeUyFhRhHjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jlvB3nO2; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jlvB3nO2"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3645e9839b3so3111895f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 02:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719219913; x=1719824713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=di0dNpRixSPGeZUOijvt7RrcSBHiIOF2BknJfQ4DEvM=;
        b=jlvB3nO2j0E/Cw1TQ0Ocs127h5xTK+VcBauO2us23PJQkB6a1Nc5CAeKRyZeJOjyXL
         GC1sa8RHOOdZXC/tmHGXWbAwRWrz9TRLgWujWITNxXLlOzLIhJ6VyBNB2GufbtgdVMSS
         6mTV16HTCacoymb4bc34XS8Fm2XXv+ZUON4XntKZbdq02fyCFoLuHgAm6Ug8GGS3vfoX
         jEtrcGrvBkS1YeF+snK3dj7oasUHFTWy5uUWG1nha+ASWnDynwQkbyaWfUbUjGpCW9hk
         2X4CcySLEh3iRqgZyX0WZ+8NoakHNw0qx55YOYnJhWvtc5i39DmMnFRxWL7SeSTrLsf3
         4uKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719219913; x=1719824713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=di0dNpRixSPGeZUOijvt7RrcSBHiIOF2BknJfQ4DEvM=;
        b=Ym6TMrJexfS3+fjX1e8UAYB6ho1S39w2YQCEjWA+cPA4T5+Atwrh0a6W6MNTe48dxH
         Xe6H3eMLU7Df5H4JjsMj5RidmhWu2AQd0rfDJcn1B8U07DZ5E7GQTafZFueu1HC6jHf8
         97bHpOPyRJDrzdAH4Ie18ePY1TT07ZU/b5O5qZjhQMun24IXxgoJMyYRx2Tfxb5MrMye
         V2OUBZ8mIGBMrRphyJsWqhr7bO4kGSVk0eNBBc4pquwhKUWNIYEpgVkcMuFyYklbSU3w
         FL9a87VeZeeJhKktlRLhFnEcsDC9vRGyrztk3P5aUybrxLPR8t0dgxlkqfcwz1Ys2deI
         jBWA==
X-Forwarded-Encrypted: i=1; AJvYcCW4Jbhfg66S7bWAB3H0Ix2ZVffvMo1VyYNqjHLNraIfB2uF+4lG3KIwux+fjjVVMclYsj62KQXJzZAwjLOMdTtB2CtIrZ1Om3+9
X-Gm-Message-State: AOJu0YwKy/uUwPt++/OBoVhBw29j4ddSw85R8V/0M1UYpAUS5iCERVmm
	HIR9HUtdBBIsOlp7aPC1KcIULN4G3pGgOiG2wpcZDj2Wg5CUQlTDkPE/sPRuCqc=
X-Google-Smtp-Source: AGHT+IFkSDPiD+yWXQfNgR70eBw92raGLyWVYw9jofSEZ+B5IYJBbmKB8z16gdgkMotEoz1Cs0mBxg==
X-Received: by 2002:a05:6000:2c5:b0:366:e89c:342b with SMTP id ffacd0b85a97d-366e89c34bcmr3948138f8f.52.1719219913015;
        Mon, 24 Jun 2024 02:05:13 -0700 (PDT)
Received: from linaro.org ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a2f8268sm9404031f8f.79.2024.06.24.02.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 02:05:12 -0700 (PDT)
Date: Mon, 24 Jun 2024 12:05:11 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] clk: imx: add missing MODULE_DESCRIPTION() macros
Message-ID: <Znk2x1ON5orqjziA@linaro.org>
References: <20240602-md-clk-imx-v1-1-5c6d240f6fab@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240602-md-clk-imx-v1-1-5c6d240f6fab@quicinc.com>

On 24-06-02 08:59:17, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/mxc-clk.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/clk-imxrt1050.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-imxrt1050.c | 1 +
>  drivers/clk/imx/clk.c           | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/imx/clk-imxrt1050.c b/drivers/clk/imx/clk-imxrt1050.c
> index 08d155feb035..efd1ac9d8eeb 100644
> --- a/drivers/clk/imx/clk-imxrt1050.c
> +++ b/drivers/clk/imx/clk-imxrt1050.c
> @@ -176,6 +176,7 @@ static struct platform_driver imxrt1050_clk_driver = {
>  };
>  module_platform_driver(imxrt1050_clk_driver);
>  
> +MODULE_DESCRIPTION("NXP i.MX RT1050 clock driver");
>  MODULE_LICENSE("Dual BSD/GPL");
>  MODULE_AUTHOR("Jesse Taube <Mr.Bossman075@gmail.com>");
>  MODULE_AUTHOR("Giulio Benetti <giulio.benetti@benettiengineering.com>");
> diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
> index e35496af5ceb..df83bd939492 100644
> --- a/drivers/clk/imx/clk.c
> +++ b/drivers/clk/imx/clk.c
> @@ -226,4 +226,5 @@ static int __init imx_clk_disable_uart(void)
>  late_initcall_sync(imx_clk_disable_uart);
>  #endif
>  
> +MODULE_DESCRIPTION("Common clock support for NXP i.MX SoC family");
>  MODULE_LICENSE("GPL v2");
> 
> ---
> base-commit: 83814698cf48ce3aadc5d88a3f577f04482ff92a
> change-id: 20240602-md-clk-imx-370fc1d85ab5
> 
