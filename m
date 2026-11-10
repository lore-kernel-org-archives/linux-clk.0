Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313463;
	b=2oUU4fBIfBKDv3QBaL1YZ5DAknuBIoMgSdx4OwqEME227Bxk6mra8GjKVdvSZuwN5Z3z
	 CpSbi2bycRTxNvjr5WeZOnaYUfC2H9sFQfeFFRnzFeeT8rM8EOpenJtJr+cI7TTyhqusl
	 42euKmislUfnxovOcQ1HcRvqXdFt/r60FFbtYeZSQE0k1rAkHihy0CoZSWugDECD27fxP
	 3whaOcz+wjO7jEnqiNvzp20x+2j54c1gpLLqAgx7gv6zL/qXoZV3LU+cae2VPH17f3Tu+
	 1UbPExfTXUYbD092mNsSwX2QazvQFhx7xUQuD2l7E9okJZC8nzhsyr50H/q8Dmw/fQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313463;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 User-Agent;
	bh=LL088vvOh6sCBfd/LnyaL4FRMTZvCBi1FWJIhdFJWI4=;
	b=5MttigKjs610/FHhEnDoq6UxB9KoHCASIusnzfXVwoktqgF/ecDCqoaF14mWVShvz+gk
	 phrLhFPkP/iyDCV7H6RbBC48fYLZcEEACCsXwM3OScZ3Y+Me0j2ntmrLG2IEL1wTULjhl
	 IFA+zTcJ8+iAwHH2R2P57AoHXQXO/2/757te0LfqEJWO43GZ9AVzQaV6LgzZ59U1IW/uf
	 5uKkWUs7oAwLXh0z4dmjgKiLg8ONT1c2P0/sJrmunIvhminq1TYz3N3GgBo4wVn5vDV6Z
	 SxFASQLUmeu5q6tn4fIsB9Sl36kwqsbGi/KdjffepiyDn+9iivtIHsvs6esS5tN1x/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xfbc4F3R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CB8606A338;
	Tue, 10 Nov 2026 12:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xfbc4F3R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A5E1F008A5;
	Tue, 10 Nov 2026 12:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794313462;
	bh=LL088vvOh6sCBfd/LnyaL4FRMTZvCBi1FWJIhdFJWI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xfbc4F3RjRSXIrNUyLL2NbxzuNH5ng7v0WWr3KxmWgCMx5Nf8sApnL5Sjxz3vPEs4
	 0el6E7b6RZ/g58jz9Sw9socXPiS9VavINGXvyMl4iqbf8m7rTLdzVKPgRPGFDZiOaj
	 bi4EapaiJwxvIT/WfkHJmq3NKL2f5oaAvkhXmCPNBctrI0bhvU7KOPXPj6+QqTFF4a
	 +EDM2N2q8a+2KYSOO1eyr8IWy0hGmr2msM/uD4K2PucFQcVD5mnVGgwliVIMNaNbX6
	 i7skrT+s3oTEcjW31S9+Ni/2QBrldxdqO5sKAT4MlCwMd3huCIIzJp57yBWD74ZCJ3
	 U50ex3AEIpkFg==
Date: Tue, 10 Nov 2026 07:24:19 -0500
From: Brian Masney <masneyb@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Long Zhao <longzhao@ambarella.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v11 0/5] arm64: add Ambarella CV75 SoC support
Message-ID: <avMM8z-LYncKS8ip@x1g10>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
 <179427375370.1061670.4050288038934218487.b4-review@b4>
 <20261110-interesting-hilarious-shark-2dbfc0@quoll>
 <7eeaf54d-2d7d-420c-a34e-eebc6dd0effe@app.fastmail.com>
 <bbc16906-45e2-4d81-ae81-ad93e87b13be@kernel.org>
 <c67939c7-9725-459e-97dd-e104f3b14022@app.fastmail.com>
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
In-Reply-To: <c67939c7-9725-459e-97dd-e104f3b14022@app.fastmail.com>
User-Agent: Mutt/2.4.2 (2026-08-30)

On Tue, Nov 10, 2026 at 09:46:29AM +0100, Arnd Bergmann wrote:
> On Tue, Nov 10, 2026, at 09:27, Krzysztof Kozlowski wrote:
> > On 10/11/2026 09:23, Arnd Bergmann wrote:
> >> On Tue, Nov 10, 2026, at 09:02, Krzysztof Kozlowski wrote:
> >>> On Mon, Nov 09, 2026 at 08:22:33PM -0500, Brian Masney wrote:
> >>>>
> >>>> - I create a new shared immutable branch based on v7.4-rc1 and I can put
> >>>>   the first two dt-bindings patches in that. I merge this into clk-pile
> >>>>   (feeds clk-next) with --no-ff. The DTS folks will merge this immutable
> >>>>  branch as well.
> >>>> 
> >>>> - I can then merge patches 3 and 5 into clk-pile.
> >>>>
> >>>> - The DTS folks will take patch 4.
> >> 
> >> If the clk driver is required to boot, I would
> >> suggest having a branch with the two clk patches that
> >> can get merged (not applied) into both the clk tree
> >> and the soc/newsoc branch to put the other patches
> >> on top.
> >
> > There is a build dependency - DTS needs clock binding
> > header - so it has to be second, unless the dependency
> > is decoupled.
> 
> Ok, I see. Let's go with Brian's suggestion then.

I see that the pinctrl driver was merged into v7.4-rc1 and also
lists ARCH_AMBARELLA. It doesn't cause any build warnings or issues, so
I'm fine with this too just as long as ARCH_AMBARELLA is going to appear
in the tree.

I'll make shared immutable branch with the dt-bindings this evening
my time. It'll be fine for patch 4 to go through the DTS tree.

Brian
