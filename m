Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0590C21771B;
	Thu, 18 Dec 2025 07:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766043677; cv=none; b=Kjv2gtfTyaX1ZXzOT3jRZW67xKa//0YdaKgED6CcziL6SZI6fUb+I8u9EgG4jP2+kRAezneUGe9/PI9x2LzzWq3FkUgMRSKJbkkBnKKSPwqQ9I1tn2N5u9qfUdy80QSL98hLARFPAZeckqI1QawtQKc1p/7I8jQ3yfqkoVhkxns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766043677; c=relaxed/simple;
	bh=E6NfvmDQW8kWtFOIWt2JoT3mLvN6Nh9u2h+9fP8T38E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAvfsA8OV4uWJONJMGQ4cNGaNKuUF/8AAzQMjPRDRo0GMtPXUa+C+shRBNE42zDJzttV2e6tDLG07WStx/9hS+wLrBUCPofOqbzdhcSWDl6lJLJ4NpOuILAAX29qWZi8qAN7wp+fsvAFsja+925A3gCkt6NKV1CaNHUks6ZZvRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 15BB7340F3B;
	Thu, 18 Dec 2025 07:41:14 +0000 (UTC)
Date: Thu, 18 Dec 2025 15:41:10 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Yao Zi <me@ziyao.cc>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@4d2.org>,
	Inochi Amaoto <inochiama@gmail.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 4/4] clk: spacemit: k3: add the clock tree
Message-ID: <20251218074110-GYB1943598@gentoo.org>
References: <20251211-k3-clk-v1-0-8ee47c70c5bc@gentoo.org>
 <20251211-k3-clk-v1-4-8ee47c70c5bc@gentoo.org>
 <aTo8sCPpVM1o9PKX@pie>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTo8sCPpVM1o9PKX@pie>

Hi Yao,

On 03:38 Thu 11 Dec     , Yao Zi wrote:
> On Thu, Dec 11, 2025 at 09:19:44AM +0800, Yixun Lan wrote:
> > Add clock support to SpacemiT K3 SoC, the clock tree consist of several
> > blocks which are APBC, APBS, APMU, DCIU, MPUM.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  drivers/clk/spacemit/Kconfig     |    6 +
> >  drivers/clk/spacemit/Makefile    |   11 +-
> >  drivers/clk/spacemit/ccu-k3.c    | 1641 ++++++++++++++++++++++++++++++++++++++
> >  include/soc/spacemit/ccu.h       |   18 +
> >  include/soc/spacemit/k1-syscon.h |   12 +-
> >  include/soc/spacemit/k3-syscon.h |  273 +++++++
> >  6 files changed, 1947 insertions(+), 14 deletions(-)
> 
...
> > +
> > +	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
> > +}
> 
> This piece of code looks quiet similar to types/functions with the same
> names in ccu-k1.c. If I'm correct, could we separate the logic into a
> new file and avoid duplication?
> 
make sense, will do

> 
> k3_ccu_probe looks quote similar to k1_ccu_probe, too. The only
> difference is that k3_ccu_probe checks for spacemit,k3-pll instead of
> spacemit,k1-pll.
> 
> We could share most of the probe code by writing a SoC-independent probe
> function,
> 
> 	int spacemit_ccu_probe(struct platform_dev *pdev,
> 			       const char *pll_compatible);
> 
> and calling it in ccu-k1.c and ccu-k3.c with different pll_compatible.
> 
ditto

thanks
-- 
Yixun Lan (dlan)
