Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB21827442;
	Fri, 26 Dec 2025 12:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766751500; cv=none; b=qZB5+yJfSpE2xqF4Mh3JhmF/cHdwceYQAiOJfjOJkNnGVXp8Y8U2AqKzBI8oiDQZw0coNXuuODsUAjwPFG7rR4t4I0kbdy+rnoAf1OqIFEuWkWoGyLHb7rHZ4r9N6n149N62/8nJiCMICACyZSmx92ThipA06b4BRcYlyUIu3Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766751500; c=relaxed/simple;
	bh=h9CgFTFilRzjMtx4ewKo4ScsC7MNsvFHnDRkjClR7UQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRdVL5UxCsQRNZwLs/9POIK8ljyTazJlucU5bCXI2kbZB1DnYmswxf5q4TuFwvt+xFW0/MLAYN4kpCEAYcsHJ2XP5x90RcjSFQQVO+xio3Kl5IVBxUT8mwfpqiJmI4fBsvRIr7L9+HZVQmoIXLVZQBGldsLssTNeTZfZt9W9gpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E0D16341F62;
	Fri, 26 Dec 2025 12:18:17 +0000 (UTC)
Date: Fri, 26 Dec 2025 20:18:12 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Yao Zi <me@ziyao.cc>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@4d2.org>,
	Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] clk: spacemit: k3: add the clock tree
Message-ID: <20251226121812-GYA2007514@gentoo.org>
References: <20251226-k3-clk-v3-0-602ce93bb6c3@gentoo.org>
 <20251226-k3-clk-v3-5-602ce93bb6c3@gentoo.org>
 <aU50DIe9qMneb0GT@pie>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aU50DIe9qMneb0GT@pie>

Hi Yao,

On 11:39 Fri 26 Dec     , Yao Zi wrote:
> On Fri, Dec 26, 2025 at 07:01:20PM +0800, Yixun Lan wrote:
> > Add clock support to SpacemiT K3 SoC, the clock tree consist of several
> > blocks which are APBC, APBS, APMU, DCIU, MPUM.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  drivers/clk/spacemit/Kconfig      |    6 +
> >  drivers/clk/spacemit/Makefile     |    3 +
> >  drivers/clk/spacemit/ccu-k3.c     | 1482 +++++++++++++++++++++++++++++++++++++
> >  drivers/clk/spacemit/ccu_common.c |    3 +-
> >  4 files changed, 1493 insertions(+), 1 deletion(-)
> 
> ...
> 
> > diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu_common.c
> > index f1a837aafb46..5132f73be68d 100644
> > --- a/drivers/clk/spacemit/ccu_common.c
> > +++ b/drivers/clk/spacemit/ccu_common.c
> > @@ -144,7 +144,8 @@ int spacemit_ccu_probe(struct platform_device *pdev)
> >  	 * are in APBS region. Reference to MPMU syscon is required to check PLL
> >  	 * status.
> >  	 */
> > -	if (of_device_is_compatible(dev->of_node, "spacemit,k1-pll")) {
> > +	if (of_device_is_compatible(dev->of_node, "spacemit,k1-pll") ||
> > +		of_device_is_compatible(dev->of_node, "spacemit,k3-pll")) {
> 
> To me it's better to add a argument to spacemit_ccu_probe to specify the
> compatible of PLL, so we don't need to modify ccu_common.c each time a
> new SoC is introduced, and the condition won't be pretty long in the
> future.
Adding extra argument will break {struct platform_driver}.probe() prototype

I can think of creating a sepecific helper function for each driver to
hide the change, but still will bring extra cost, something will like:
 k1_ccu_probe(pdev) -> spacemit_ccu_probe(pdev, compatible)

> 
> It isn't a serious issue for now, and I think this piece of code is
> acceptable.
right, I'd be reluctant to do the change

-- 
Yixun Lan (dlan)
