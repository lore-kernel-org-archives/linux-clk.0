Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7022BDC0E;
	Mon, 24 Nov 2025 22:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764022084; cv=none; b=JGK2hydwdNg7FvIQMnx1rbU86o1t+uLuIQMvc6yX6WtaTHu7mML45BvroO0gvUm+g+1NMxyJwzYO1wJgXRr3ds9TzRUE4u4So3487tqtSFY0t2NZwCoMpiI+khI+HwfgmlfzFVjG/HpKftnwuqza8jWHcYST4gTJYQ6os8QT1ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764022084; c=relaxed/simple;
	bh=tRIizhAm0T07j/KjWlRXHqsJfg1L4Mqka5PJmjK76b8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LiH2V/aI1jaXQlZbOTC4ePGEZA/IB2/SdufEOELGleJkrlCHm/S0p8J8PwoK2nVeoOPOZ16BwXNSRfHZ+hb5w25r9/FJpgmRe11Zy45P4r1HNBEAP16mgppvbvjrTB439xw+PW4d5xfpkQI3NUr4VL4rIyJI0zcs45vbjQnyRVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yi4Lmhlp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yi4Lmhlp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442DBC4CEF1;
	Mon, 24 Nov 2025 22:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764022082;
	bh=tRIizhAm0T07j/KjWlRXHqsJfg1L4Mqka5PJmjK76b8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yi4Lmhlpw+CmUaQsBeZJ/CC0+dmrJeDNcb2LB4tkQo0gJ1gwcsormH560h7ZdKxZS
	 f0o5n8vJnBtRz5WTql7AOBmEYgDOdxOYvQqMU842AMM7Q3WkVDHSwwsDBIjPizJQg8
	 DcgwbQJiluIeZ8MltHdHv0W5vgeAVABVYPYXttj+4ekyBxh+mIRYUJg72/EVSGvmhN
	 BDlTITqJ5+ixP3E+STbmbZGLSLcBI8ttejkwOOpllGQgPwslKjJeK1wmJXjxQvd3S3
	 nb0sVqo4SiZJwj3bn4ax/hrbfkMP8MO6kOPacC5KeqEUPouboxVINkO/FDAHmMor6G
	 YAhEmb2jo6moA==
Date: Mon, 24 Nov 2025 14:08:00 -0800
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>
Subject: Re: [PATCH 2/7] clk: thead: th1520-ap: Poll for PLL lock and wait
 for stability
Message-ID: <aSTXQG5yIIGFjflG@x1>
References: <20251120131416.26236-1-ziyao@disroot.org>
 <20251120131416.26236-3-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120131416.26236-3-ziyao@disroot.org>

On Thu, Nov 20, 2025 at 01:14:11PM +0000, Yao Zi wrote:
> All PLLs found on TH1520 SoC take 21250ns at maximum to lock, and their
> lock status is indicated by register PLL_STS (offset 0x80 inside AP
> clock controller). We should poll the register to ensure the PLL
> actually locks after enabling it.
> 
> Furthermore, a 30us delay is added after enabling the PLL, after which
> the PLL could be considered stable as stated by vendor clock code.
> 
> Fixes: 56a48c1833aa ("clk: thead: add support for enabling/disabling PLLs")
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 34 +++++++++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)

Thanks for working on this patch series.

[...]
> @@ -299,9 +310,21 @@ static void ccu_pll_disable(struct clk_hw *hw)
>  static int ccu_pll_enable(struct clk_hw *hw)
>  {
>  	struct ccu_pll *pll = hw_to_ccu_pll(hw);
> +	u32 reg;
> +	int ret;
>  
> -	return regmap_clear_bits(pll->common.map, pll->common.cfg1,
> -				 TH1520_PLL_VCO_RST);
> +	regmap_clear_bits(pll->common.map, pll->common.cfg1,
> +			  TH1520_PLL_VCO_RST);
> +
> +	ret = regmap_read_poll_timeout_atomic(pll->common.map, TH1520_PLL_STS,
> +					      reg, reg & pll->lock_sts_mask,
> +					      5, TH1520_PLL_LOCK_TIMEOUT_US);

Is there a reason for the specific value of 5 uS polling delay?

> +	if (ret)
> +		return ret;
> +
> +	udelay(TH1520_PLL_STABLE_DELAY_US);

Is it the case that the 30 uS delay after the lock bit is set is just so
that it has the same behavior as the vendor's code? Or did you notice
stability problems without this?

Thanks,
Drew
