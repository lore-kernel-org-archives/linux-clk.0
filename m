Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E7421146C;
	Tue, 25 Nov 2025 03:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764040796; cv=none; b=OVWNFSHVg8rptIweov4sEz2mGupJXoA2LxedWP82fzJ57ShVjdnntCi2gS2Rhbtda+ls77mkRCTwFXXjMsQ3cmEWzUXKiDKqym+A60G0d5hsscYKzihmFVObPDMKYDs2gbia8vWCpdMBbeupeJYbOPImQh9F2pxuQp7VmTic57w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764040796; c=relaxed/simple;
	bh=JR+sp99N2EqcRAaGQJ7HVli1aoDpzWzkW455mFGvkwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rERQHcIpdx7nVWgkyOTEnZww0mgaXnIVBgqgd8xqneBtZ90pN3VE3mAjDzzUE1j2czSMCvPc+W9dsMrj5kV6HcZ2UkbmSpy0niBF0tPQu6tS/xKxDZEicFnpDgGeTXTaTyO0qfT/Eyc6h1x6V6OqaltGsmRF/WHJLm3FAP5wpxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Wht6FJHg; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Wht6FJHg"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 28E9F25FF5;
	Tue, 25 Nov 2025 04:19:51 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FikJKz6zNPqU; Tue, 25 Nov 2025 04:19:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1764040790; bh=JR+sp99N2EqcRAaGQJ7HVli1aoDpzWzkW455mFGvkwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wht6FJHgmMPiddXI45FDaC6u6fM/uyw78Q4mHk13u5YB1X3qk9qjELN246jfQghI4
	 b1zLTfmim+dXFMyzeV6DbyCdleZpy40EQ+qsYu+FVBi7hLp9pyhCDSY7Z9vIoJwQoZ
	 PIzEQQyijaPTtRnpjJVxVY2qkD49MgFWcOFp4fApXx8pNXg71joxBLBHMKNhEHgzS7
	 uaG4DAmImlNjif1Hgs5jDKQuMIsK6LSeEEHXT5ulxwVclr2Ty7JuztZoHk0WUpGxUl
	 xOVFLcj66ulL65EAaffKdawSHOUnJmKpFeACOQqYyPxVnlYCHGcW0iLw9cJJw60DN5
	 +yao+mexO2oYQ==
Date: Tue, 25 Nov 2025 03:19:30 +0000
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>
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
Message-ID: <aSUgQpd16Ud8xTx6@pie>
References: <20251120131416.26236-1-ziyao@disroot.org>
 <20251120131416.26236-3-ziyao@disroot.org>
 <aSTXQG5yIIGFjflG@x1>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSTXQG5yIIGFjflG@x1>

On Mon, Nov 24, 2025 at 02:08:00PM -0800, Drew Fustini wrote:
> On Thu, Nov 20, 2025 at 01:14:11PM +0000, Yao Zi wrote:
> > All PLLs found on TH1520 SoC take 21250ns at maximum to lock, and their
> > lock status is indicated by register PLL_STS (offset 0x80 inside AP
> > clock controller). We should poll the register to ensure the PLL
> > actually locks after enabling it.
> > 
> > Furthermore, a 30us delay is added after enabling the PLL, after which
> > the PLL could be considered stable as stated by vendor clock code.
> > 
> > Fixes: 56a48c1833aa ("clk: thead: add support for enabling/disabling PLLs")
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  drivers/clk/thead/clk-th1520-ap.c | 34 +++++++++++++++++++++++++++++--
> >  1 file changed, 32 insertions(+), 2 deletions(-)
> 
> Thanks for working on this patch series.
> 
> [...]
> > @@ -299,9 +310,21 @@ static void ccu_pll_disable(struct clk_hw *hw)
> >  static int ccu_pll_enable(struct clk_hw *hw)
> >  {
> >  	struct ccu_pll *pll = hw_to_ccu_pll(hw);
> > +	u32 reg;
> > +	int ret;
> >  
> > -	return regmap_clear_bits(pll->common.map, pll->common.cfg1,
> > -				 TH1520_PLL_VCO_RST);
> > +	regmap_clear_bits(pll->common.map, pll->common.cfg1,
> > +			  TH1520_PLL_VCO_RST);
> > +
> > +	ret = regmap_read_poll_timeout_atomic(pll->common.map, TH1520_PLL_STS,
> > +					      reg, reg & pll->lock_sts_mask,
> > +					      5, TH1520_PLL_LOCK_TIMEOUT_US);
> 
> Is there a reason for the specific value of 5 uS polling delay?

No, it was picked randomly. A smaller value would reduce latency of
PLL enabling, and I could tune it more carefully by some testing. But
it's hard to predict how much improvement it will bring.

> > +	if (ret)
> > +		return ret;
> > +
> > +	udelay(TH1520_PLL_STABLE_DELAY_US);
> 
> Is it the case that the 30 uS delay after the lock bit is set is just so
> that it has the same behavior as the vendor's code? Or did you notice
> stability problems without this?

This aligns with the vendor code, and I haven't yet observed stability
issues without the delay. But I think it's more safe to keep the
behavior similar since it's hard to test all working conditions.

> Thanks,
> Drew

Best regards,
Yao Zi
