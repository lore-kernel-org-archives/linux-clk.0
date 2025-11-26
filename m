Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6C1258CDC;
	Wed, 26 Nov 2025 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764167958; cv=none; b=pnH/oCxMi4mSpQ3iywJRtqbK7IlmCxoblOVAvUg3kTf5PBi2eIPsnZUjIb+Q1Herl1r5PaXUJCLKOul8iVQectVINmV4mGa9As1vS9lIAUpjsqdCpIgZZhNvcby9EsN/Q0HQkOAZ9RxAEue6+EzU970q4zC3wtshyF3IEGkUq3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764167958; c=relaxed/simple;
	bh=nF7QOjL2tZfYPd115SN2AbpXYN+ynEk7LVbGs6fObcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZfTax7YUbI0PqGrbGeBDJ6uhEen9cmpB2Txjq8zLL9f8dRDrWxho4uJblzY40LTTXHEFStetwt73s1MknNM6g2E0GWXAYVy91LS1XvUSAhg6pS1/LXYqTE2agHadgLxSmQv95LMBexSV7Lstk9SI+JA+e18ymFtDXYc74NNmdf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WjSFI0mc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WjSFI0mc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85AFC116C6;
	Wed, 26 Nov 2025 14:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764167958;
	bh=nF7QOjL2tZfYPd115SN2AbpXYN+ynEk7LVbGs6fObcw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WjSFI0mcgThDQuF2A2LehUyl/MZp8hUHlBHrfmMOnIbYjZj6Ta8Sgfb3VQs/Bue9d
	 rtpxE4W6QRebr8vuBh+UJONFnDv/n/METct1yOQxn6d9Y87Az2/Xrcs1H3tw6Ie085
	 V/69DscxIyqvhcwudiGfZE0AvIp35yIhToeSyiM5axi7McwA2t+RnLLBGIZmWxeeGJ
	 qQq+2YhfGtwRiG3HndafWCDLz+q/eW726k/ZscqbpHzG2i7Rh5FuRgOuykUbsikNwT
	 ViBy88RfI5b0sncXOwko2QoeiB9p3obyd20100jjb5FhlSfIEw1YQ32+l3JekP1OU3
	 jhnq1cIrfksJA==
Date: Wed, 26 Nov 2025 08:39:11 -0600
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
Message-ID: <aScRD64dGZGxndNL@gen8>
References: <20251120131416.26236-1-ziyao@disroot.org>
 <20251120131416.26236-3-ziyao@disroot.org>
 <aSTXQG5yIIGFjflG@x1>
 <aSUgQpd16Ud8xTx6@pie>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSUgQpd16Ud8xTx6@pie>

On Tue, Nov 25, 2025 at 03:19:30AM +0000, Yao Zi wrote:
> On Mon, Nov 24, 2025 at 02:08:00PM -0800, Drew Fustini wrote:
> > On Thu, Nov 20, 2025 at 01:14:11PM +0000, Yao Zi wrote:
> > > All PLLs found on TH1520 SoC take 21250ns at maximum to lock, and their
> > > lock status is indicated by register PLL_STS (offset 0x80 inside AP
> > > clock controller). We should poll the register to ensure the PLL
> > > actually locks after enabling it.
> > > 
> > > Furthermore, a 30us delay is added after enabling the PLL, after which
> > > the PLL could be considered stable as stated by vendor clock code.
> > > 
> > > Fixes: 56a48c1833aa ("clk: thead: add support for enabling/disabling PLLs")
> > > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > > ---
> > >  drivers/clk/thead/clk-th1520-ap.c | 34 +++++++++++++++++++++++++++++--
> > >  1 file changed, 32 insertions(+), 2 deletions(-)
> > 
> > Thanks for working on this patch series.
> > 
> > [...]
> > > @@ -299,9 +310,21 @@ static void ccu_pll_disable(struct clk_hw *hw)
> > >  static int ccu_pll_enable(struct clk_hw *hw)
> > >  {
> > >  	struct ccu_pll *pll = hw_to_ccu_pll(hw);
> > > +	u32 reg;
> > > +	int ret;
> > >  
> > > -	return regmap_clear_bits(pll->common.map, pll->common.cfg1,
> > > -				 TH1520_PLL_VCO_RST);
> > > +	regmap_clear_bits(pll->common.map, pll->common.cfg1,
> > > +			  TH1520_PLL_VCO_RST);
> > > +
> > > +	ret = regmap_read_poll_timeout_atomic(pll->common.map, TH1520_PLL_STS,
> > > +					      reg, reg & pll->lock_sts_mask,
> > > +					      5, TH1520_PLL_LOCK_TIMEOUT_US);
> > 
> > Is there a reason for the specific value of 5 uS polling delay?
> 
> No, it was picked randomly. A smaller value would reduce latency of
> PLL enabling, and I could tune it more carefully by some testing. But
> it's hard to predict how much improvement it will bring.

Okay, I was just curious. I think it is okay to stick with that current
value if it is working correctly.

> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	udelay(TH1520_PLL_STABLE_DELAY_US);
> > 
> > Is it the case that the 30 uS delay after the lock bit is set is just so
> > that it has the same behavior as the vendor's code? Or did you notice
> > stability problems without this?
> 
> This aligns with the vendor code, and I haven't yet observed stability
> issues without the delay. But I think it's more safe to keep the
> behavior similar since it's hard to test all working conditions.

Okay, that seems reasonable to play it safe.

Thanks,
Drew
