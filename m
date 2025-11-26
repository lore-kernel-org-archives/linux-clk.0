Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3D93C1F;
	Wed, 26 Nov 2025 15:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764170245; cv=none; b=KWAMIt+y7MwBlQzTl2u0t8SIjeExmZ96tPUz3tuSm9O/jybzN1FC0Nl+PJu+RE47QbQN1KIEnS/6MXSHFQghZDzUY3iBhC/+B+JxO4YKSkixzikZjRzjiT/tgQWJDAcxSvN2WeiFsiViEdahphehKPk0TZK1k3gCfzjayKoi2Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764170245; c=relaxed/simple;
	bh=rwOxc3oM6BiT9ujdBuYbjPw1NSEhJg/9U/iunCF2lgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JITic/o0AoWtIm1G6510nMgFNK4h3TVxr+poebpPDFGCVbbYzliqfeAiDrgzQyuvILASkSsEmoIZ8u0KrtLrD7OOrmYEVAUulIZo2P2xR7LuLMx4l1DPETroyn8wBQ8DVBSphf1uBrcd6+TbePzPEUWaxUKj1bWpM6Yiz1b3UIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=McZ1pI6Q; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="McZ1pI6Q"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B2FF626210;
	Wed, 26 Nov 2025 16:17:14 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0w9pV8YloJCn; Wed, 26 Nov 2025 16:17:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1764170234; bh=rwOxc3oM6BiT9ujdBuYbjPw1NSEhJg/9U/iunCF2lgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=McZ1pI6Qebpwzpvg/bcPvoKciUG+VWJyW18cOueEY7LIAyRtWjr3tUcYH8wQHQ4Iy
	 PzVSmbawRoc/Hhd+b7Axs/TLF1ZK8ZMK9TM0+iM71gRMmiMsTtPL4+eQcBIBKapOHI
	 L0lvOd/XjojtlLNdIFVLIpK6N+/F2HyoXD4AMEZujYrx2W+di6WU+Zy2F9+KOCNKSu
	 qJ8bCiXjh7lMkd0ZitXPZ0t8V/4lWodGZ/IbU7WyF4hcT4b8tDLGAeuqx6E0wGfB5x
	 5J8C8968PzHWrRZ7dk0c/V9uTZlB1TaDJC/2aR1jUGo2y4ACgU6CnimX466MZkZbUr
	 fRmihdBURkGjQ==
Date: Wed, 26 Nov 2025 15:16:54 +0000
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, Guo Ren <guoren@kernel.org>,
	Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Subject: Re: [PATCH 2/7] clk: thead: th1520-ap: Poll for PLL lock and wait
 for stability
Message-ID: <aScZ5mwesY3wQTQl@pie>
References: <20251120131416.26236-1-ziyao@disroot.org>
 <20251120131416.26236-3-ziyao@disroot.org>
 <aScUELnY-TC8kVzV@gen8>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aScUELnY-TC8kVzV@gen8>

On Wed, Nov 26, 2025 at 08:52:00AM -0600, Drew Fustini wrote:
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
> > 
> > diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> [...]
> > +/*
> > + * All PLLs in TH1520 take 21250ns at maximum to lock, let's take its double
> > + * for safety.
> > + */
> > +#define TH1520_PLL_LOCK_TIMEOUT_US	44
> > +#define TH1520_PLL_STABLE_DELAY_US	30
> 
> I'm taking a second look at this and I think it might be best to add a
> define for the polling loop delay of 5. It could be helpful when other
> people read the code later.
> 
> [...]
> > +	ret = regmap_read_poll_timeout_atomic(pll->common.map, TH1520_PLL_STS,
> > +					      reg, reg & pll->lock_sts_mask,
> > +					      5, TH1520_PLL_LOCK_TIMEOUT_US);
> 
> The loop delay is only used here but I think using a #define would make
> it more readable.

There are TH1520_PLL_LOCK_TIMEOUT_US and TH1520_PLL_STABLE_DELAY_US
defined because they're meaningful constants, either specified by TRM or
implied by vendor code, however the 5us delay is only a randomly-picked
value, as what I've mentioned before.

Anyway, I'm fine with a separate definition. So please go ahead if it
looks better to you.

> Other than that:
> Reviewed-by: Drew Fustini <fustini@kernel.org>
> 
> If no other changes are needed I could fix this up on apply. Let's see
> what other comments there may be. It's too late for me to send a 6.19
> clk pull request so this will have to target the next merge window. I
> can put it into linux-next once 6.19-rc1 is released.

Many thanks for it.

> Thanks,
> Drew

Best regards,
Yao Zi
