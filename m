Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DB329BDA3;
	Tue, 30 Dec 2025 12:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767096954; cv=none; b=hc7nnRnbJKYVnw7j/9r05Xe+UvRSSrFhUNyFrAsGzRJgkT8TqWE6OXjK8rXS2hA6cHwL9QnBmIXrG3TzmzwSkSmiX+tJpH1gnj0xT+nwYsUVcx8mvzZF/Ekxflac3u7PDY8CIXiY17wutBLPvpxiQJSsRmn988MAWEP8M2GG85s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767096954; c=relaxed/simple;
	bh=Y/Po/FqO6vE59NYqbjQXKb1Q3Qi7pOB+JpEGg9QpR1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ueFkx2dK24NeECM75ngV+ioxuFG/pytufa8Jcy+vvI/PX6xjrll/fmMeFboqfxzyM4nOt97QbN7lZG/KaMQ1TXH8j7ygB/iANW3eHcal4wT3oEypVJQsVg+9BSWiJf+IsQjsDd03Iiul9+4BNkVTQEeRQqU4xEJmoW6TuM/2+Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k0aqh1n5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k0aqh1n5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42C1C4CEFB;
	Tue, 30 Dec 2025 12:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767096954;
	bh=Y/Po/FqO6vE59NYqbjQXKb1Q3Qi7pOB+JpEGg9QpR1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k0aqh1n59kDbaeR/4CcYaB56B7SXG8q7NxG9LkuxIw/Kd95FPgw4DxV9U8WEgLFmO
	 c/WXG3HqTxk1w0B5SKQUUyGlRXwxuifGt7Es+dvum2o1qNQQTZiz+XutW6Bo9QDstk
	 fTbY35SiIjzWnBCixYaH+MK6AXyCXBsMZH43eRhdE36e/zj62fXb6jYAl2moMB3IU5
	 kz97CYdGFUjykTTZLv1AVdgntStDFNPGaQwBi6Q5NK5k/ISCdYJ1h5qnVU+gTKmLwz
	 lDxbfSxQgCiPXz8y5c9vpbcWzwzpSZPU0SSK+H6o1CpjIVqrvqaOo/LtTwRCjdCO16
	 ARamBg8VMT1pw==
Date: Tue, 30 Dec 2025 13:15:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, cylee12@realtek.com, 
	jyanchou@realtek.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, james.tai@realtek.com, cy.huang@realtek.com, 
	stanley_chang@realtek.com
Subject: Re: [PATCH 8/9] clk: realtek: Add RTD1625-CRT clock controller driver
Message-ID: <20251230-lush-gray-jaguar-debfdb@quoll>
References: <20251229075313.27254-1-eleanor.lin@realtek.com>
 <20251229075313.27254-9-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251229075313.27254-9-eleanor.lin@realtek.com>

On Mon, Dec 29, 2025 at 03:53:12PM +0800, Yu-Chun Lin wrote:
> Add support for the CRT (Clock, Reset, and Test) controller on the Realtek
> RTD1625 SoC. This driver provides clock and reset management for the
> system, allowing peripheral clients to request necessary resources for
> operation.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
>  drivers/clk/realtek/Kconfig           |  13 +
>  drivers/clk/realtek/Makefile          |   1 +
>  drivers/clk/realtek/clk-rtd1625-crt.c | 788 ++++++++++++++++++++++++++
>  3 files changed, 802 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-rtd1625-crt.c
> 
> diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
> index de462c2bb892..9ac7f9a5d8f2 100644
> --- a/drivers/clk/realtek/Kconfig
> +++ b/drivers/clk/realtek/Kconfig
> @@ -28,4 +28,17 @@ config RTK_CLK_COMMON
>  config RTK_CLK_PLL_MMC
>  	bool
>  
> +config COMMON_CLK_RTD1625
> +        tristate "RTD1625 Clock Controller"
> +        select RTK_CLK_COMMON
> +        select RTK_CLK_PLL_MMC
> +        default y
> +	help

Messed indentation.

> +	  Support for the clock controller on Realtek RTD1625 SoCs.
> +
> +	  This driver provides clock sources, gating, multiplexing, and
> +	  reset control for peripherals on the RTD1625 platform.
> +
> +	  Say Y here if your system is based on the RTD1625 and you need
> +	  its peripheral devices to function.

Blank line

>  endif

Best regards,
Krzysztof

