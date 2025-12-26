Received: from mail6.out.flockmail.com (mail6.out.flockmail.com [18.204.122.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144DA1D86DC
	for <linux-clk@vger.kernel.org>; Fri, 26 Dec 2025 11:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.204.122.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766749220; cv=none; b=vEEwiT3eFqLqBMpN4iRHA8ZcrqNzuCCC7NNWRAjOy7/LC+JMJEoLNEDDjW3YWpzwscN+4p4lv671WN0cuYqB+pTzXULInnbP83T3Uzo4c+vQAxOe+SeG/gyObU8AJD7dyInnCGa4eRbYWFf8iqm5z3hyIziYu7TZfn/U2ebTzyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766749220; c=relaxed/simple;
	bh=dOSqxv7M/sP8mtGINHrXKZPzyknLBIGnf3emvBHZ/KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Onw45QJq/Fmr27brK7fjlGjruy5Jrp2dUOGWL69pzcOK9m8BTcAMjigWATGbeOIJK4YzABIjKd3LqYQRheOGS9GOMwrjahtIY38l9sP/CsymYIs7OIuz83sYS0tL6nc/vPaOZBPuj/rfOfoOo+zl2Qd8Oui4PpaRrWQ2mHAwWj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.b=D9/r7Fe3; arc=none smtp.client-ip=18.204.122.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.b="D9/r7Fe3"
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4dd3ZM6GTQz2xDK;
	Fri, 26 Dec 2025 11:40:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=+MVXjyTjnpv8ySZ72fp3o6XSzP+ZPlo9JjXRLopZJuQ=;
	c=relaxed/relaxed; d=ziyao.cc;
	h=subject:message-id:references:date:from:cc:to:mime-version:in-reply-to:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1766749211; v=1;
	b=D9/r7Fe3rMBLfuc4fqi3N8J4LjrsrtuMNr8iTUFAZQPh9KBGyLDIIa99BMpsrgLdtElBW0Qr
	GrhABI7KJLjyQufOvYqly+AE9BUn39DAbsrHwvof66q4yFWZXPWAK8W0Ujc+Qqjnek6x1HBeazi
	urT2WLy1z60o0gY6fMKEDCWk=
Received: from pie (unknown [117.171.66.90])
	by smtp-out.flockmail.com (Postfix) with ESMTPA id 4dd3ZG0Hzzz2xBN;
	Fri, 26 Dec 2025 11:40:05 +0000 (UTC)
Date: Fri, 26 Dec 2025 11:39:56 +0000
Feedback-ID: :me@ziyao.cc:ziyao.cc:flockmailId
From: Yao Zi <me@ziyao.cc>
To: Yixun Lan <dlan@gentoo.org>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Haylen Chu <heylenay@4d2.org>, Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] clk: spacemit: k3: add the clock tree
Message-ID: <aU50DIe9qMneb0GT@pie>
References: <20251226-k3-clk-v3-0-602ce93bb6c3@gentoo.org>
 <20251226-k3-clk-v3-5-602ce93bb6c3@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226-k3-clk-v3-5-602ce93bb6c3@gentoo.org>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1766749211720356104.27573.6619602783841146947@prod-use1-smtp-out1001.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=WtDRMcfv c=1 sm=1 tr=0 ts=694e741b
	a=rBp+3XZz9uO5KTvnfbZ58A==:117 a=rBp+3XZz9uO5KTvnfbZ58A==:17
	a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10 a=CEWIc4RMnpUA:10 a=7mOBRU54AAAA:8
	a=wGuAUZxNjwbEZGsxmboA:9 a=CjuIK1q_8ugA:10 a=wa9RWnbW_A1YIeRBVszw:22
	a=3z85VNIBY5UIEeAh_hcH:22 a=NWVoK91CQySWRX1oVYDe:22

On Fri, Dec 26, 2025 at 07:01:20PM +0800, Yixun Lan wrote:
> Add clock support to SpacemiT K3 SoC, the clock tree consist of several
> blocks which are APBC, APBS, APMU, DCIU, MPUM.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/clk/spacemit/Kconfig      |    6 +
>  drivers/clk/spacemit/Makefile     |    3 +
>  drivers/clk/spacemit/ccu-k3.c     | 1482 +++++++++++++++++++++++++++++++++++++
>  drivers/clk/spacemit/ccu_common.c |    3 +-
>  4 files changed, 1493 insertions(+), 1 deletion(-)

...

> diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu_common.c
> index f1a837aafb46..5132f73be68d 100644
> --- a/drivers/clk/spacemit/ccu_common.c
> +++ b/drivers/clk/spacemit/ccu_common.c
> @@ -144,7 +144,8 @@ int spacemit_ccu_probe(struct platform_device *pdev)
>  	 * are in APBS region. Reference to MPMU syscon is required to check PLL
>  	 * status.
>  	 */
> -	if (of_device_is_compatible(dev->of_node, "spacemit,k1-pll")) {
> +	if (of_device_is_compatible(dev->of_node, "spacemit,k1-pll") ||
> +		of_device_is_compatible(dev->of_node, "spacemit,k3-pll")) {

To me it's better to add a argument to spacemit_ccu_probe to specify the
compatible of PLL, so we don't need to modify ccu_common.c each time a
new SoC is introduced, and the condition won't be pretty long in the
future.

It isn't a serious issue for now, and I think this piece of code is
acceptable.

>  		struct device_node *mpmu = of_parse_phandle(dev->of_node,
>  							    "spacemit,mpmu", 0);
>  		if (!mpmu)

Regards,
Yao Zi
