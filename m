Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793976353;
	b=vSRRfex7QI+BLPDIbM1FItxDovU8G6BkL+MhmRpKQWybGEJtPHuX+Ou9PZFIwZJolUKg
	 Z4crOqJrVWdU6elBm5F22JngJo+7DslAzByGtKJXSrb6tKbWw4FdZDst4AlOg1bdrGHDH
	 RcOEyqWWpgcoEiLK+N32/Gm9m7j5Z1Waoumrbtqhfq4QyJjLNN6D2NEbLgoyNNwEMe0Mw
	 j/bPz9aCBuwKjbF/4qQU9bgLktKB5EM6SgbxrPPsac6fZKUCXvsnD1Tw6/jfax59fmKig
	 t6JBt30Bl9mbETckzVFew3GjjuloRDRTkv5775Pm0SI/xoZL+wiXFFpJJXsFdWF7O7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976353;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nXpHtbwIXWqa0CUduYYty9A7kDwxd+/CalGYDzCTKjw=;
	b=E2aNRr1sdgaBD5una6mrTJpIv45nvojRT0cPMIOJ3weld8c4hexnQVCsmNm76Nqw4OFg
	 2f7IOFqlKN1XZCAs40SQvo3sNuHS0EDd1U4HRB+D5RyxFLfmGuABgewbC+sSIK/KuIjNy
	 NZDhhP8D6MDMkXd2BIU/gGPHwHCM7v1biZQbuWWmDbmgN9wzdk5gpgk2TlZXLOyK9UvmY
	 pXwHy+DwmT2yj7cpaf0SH7TVpz5Angzf/9+7MoJcc46b1rT3cakPw2TpPAGxdsRL87YBz
	 MnotpjeI/gOCGWcGmm1sD5BqqjtFpg90uMx/CVKAZJ//Vji2FLMTiPBLHO2DCxaBy2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grimler.se;
	spf=pass smtp.mailfrom=grimler.se;
	dkim=pass header.d=grimler.se header.i=@grimler.se header.a=rsa-sha256 header.s=key1 header.b=kADcVJZM;
	arc=none smtp.remote-ip=91.218.175.26
Received: from mta0.migadu.com (out-26.mta0.migadu.com [91.218.175.26])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1709606A339
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 14:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1709606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=grimler.se header.i=@grimler.se header.a=rsa-sha256 header.s=key1 header.b=kADcVJZM
X-Envelope-To: linux-clk@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dsRJ/0z/yE/5s58BMhmlVSFV04GmqnxwznaEjY/5328=;
 c=simple/simple; d=grimler.se;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793976343; v=1; x=1794581143;
 b=kADcVJZMgmNCz98SwUVAOSfSrkz7gIzWbzN1tnaTaC/CyM5NEQ9+X5mynXCfvmbkw7XuInM9
 NAROZSBHoV0/9CqgXDtzIomW7cYT/ppqX/Fhy/LhrHWO5UoPgPn3onXSrZp9k+rthRSGL4m1cHm
 gD0Trg+KBvMvns8fnRoJ1Jmg=
X-Envelope-To: linux-clk@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id cf432eae1467532f;
	Fri, 06 Nov 2026 14:45:39 +0000
X-Mizu-Trace-ID: cf432eae1467532f
X-Migadu-Flow: FLOW_OUT
Date: Fri, 6 Nov 2026 15:45:36 +0100
From: Henrik Grimler <henrik@grimler.se>
To: Young-Jun Hong <nirvanah@nirvanahyj.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: samsung: exynos5420: add VPLL rates for 650,
 700 and 750 MHz
Message-ID: <20261106144536.GA3678@localhost>
References: <20261106054210.2893230-1-nirvanah@nirvanahyj.com>
 <20261106054210.2893230-3-nirvanah@nirvanahyj.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106054210.2893230-3-nirvanah@nirvanahyj.com>

Hi Young-Jun,

On Fri, Nov 06, 2026 at 02:41:49PM +0900, Young-Jun Hong wrote:
> The VPLL drives the G3D (Mali) clock on Exynos 5420/5422. Its rate table
> stops at 600 MHz, so GPU OPPs above 600 MHz cannot be reached:
> clk_set_rate() silently keeps fout_vpll at 600 MHz.
> 
> Add the 650, 700 and 750 MHz rows (VCO 1300/1400/1500 MHz, using the same
> P/M/S style as the APLL rows).

What you mean with "using the same P/M/S style as the APLL rows"?

> Tested on Samsung ARTIK 10 (Exynos 5422): with these rows the G3D devfreq
> reaches 700 and 750 MHz, and the OpenCL accuracy suite passes 96/96 at
> 750 MHz with a board-specific 1.35 V OPP.
> 
> The analysis, the code and this changelog were produced with Claude
> Code (Anthropic), a coding assistant.

Was it tested by a human?

> Signed-off-by: Young-Jun Hong <nirvanah@nirvanahyj.com>
> ---
>  drivers/clk/samsung/clk-exynos5420.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 400a5c59815c..1b4b0ae16765 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -1451,6 +1451,9 @@ static const struct samsung_pll_rate_table exynos5420_epll_24mhz_tbl[] = {
>  };
>  
>  static const struct samsung_pll_rate_table exynos5420_vpll_24mhz_tbl[] = {
> +	PLL_35XX_RATE(24 * MHZ, 750000000U,  125, 2, 1),
> +	PLL_35XX_RATE(24 * MHZ, 700000000U,  175, 3, 1),
> +	PLL_35XX_RATE(24 * MHZ, 650000000U,  325, 6, 1),

Do you have any references, like vendor kernel sources, to back up
these choices of dividers and scalar?

Best regards,
Henrik Grimler

>  	PLL_35XX_RATE(24 * MHZ, 600000000U,  200, 2, 2),
>  	PLL_35XX_RATE(24 * MHZ, 543000000U,  181, 2, 2),
>  	PLL_35XX_RATE(24 * MHZ, 480000000U,  160, 2, 2),
> -- 
> 2.47.3
> 
> 
