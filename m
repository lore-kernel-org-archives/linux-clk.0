Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C761B142D;
	Sat, 27 Dec 2025 18:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766861564; cv=none; b=dQuL+ob7HDD0PhLMT9g5VuQMDmnV27+P08mhQlOTKc3j67cmftQBOYyx2mXfXE5LWf5Qe4Cs5SRLDpswmkCo6803rrk5BygYi4krD/xO0kpnP0Aj8VdyS1GvsBWH/l/ZrGL0RemRpdSiK/5XrX95QPOshxw6FXfs1VW0BTwcv5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766861564; c=relaxed/simple;
	bh=ObLQag+t/j0+Hsg6LB5V3rgB9rREalXbubdiXzH0dOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNF0bMfqBrtijU2yfXOsLaA2oDDReXUDt9w+Vazx3jwVHe3dfSBTbymfv5rxbcGwfs8R171NnPiktwKKC2R7+s98jDXx5RXOC0jj8SQqoKzV+P7utt/4xYUjiJgi/LfdFZom7aw59NU/t5Y91NyF4IQPAVtZOrNNxG4Isx1ho1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 7FCE0340F7B;
	Sat, 27 Dec 2025 18:52:42 +0000 (UTC)
Date: Sun, 28 Dec 2025 02:52:31 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@4d2.org>,
	Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: soc: spacemit: add k3 syscon
 compatible
Message-ID: <20251227185231-GYA2018741@gentoo.org>
References: <20251226-k3-clk-v3-0-602ce93bb6c3@gentoo.org>
 <20251226-k3-clk-v3-1-602ce93bb6c3@gentoo.org>
 <20251227-glaring-aromatic-raven-cbe30c@quoll>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-glaring-aromatic-raven-cbe30c@quoll>

Hi Krzysztof,

On 12:25 Sat 27 Dec     , Krzysztof Kozlowski wrote:
> On Fri, Dec 26, 2025 at 07:01:16PM +0800, Yixun Lan wrote:
> > The SpacemiT K3 SoC clock IP is scattered over several different blocks,
> > which are APBC, APBS, APMU, DCIU, MPMU, all of them are capable of
> > generating clock and reset signals. APMU and MPMU have additional Power
> > Domain management functionality.
> > 
...
> >  
> >  properties:
> >    compatible:
> > -    const: spacemit,k1-pll
> > +    contains:
> 
> No drop, there is no such syntax for this property, so you copied here
> something completely different.
oh, will drop it in next version

-- 
Yixun Lan (dlan)
