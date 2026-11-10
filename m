Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297760;
	b=I099suj9lx8XFGU3VjEdCREFIIJsPoAMc/KRuFOtaeDgakrVZvhEaNgrOGZqWX99U17q
	 etW/zJ7VuEnnkGTFE6TfpKb92/sz7QIpebrUvWBVdKfrb54TUQ7dL6YsW+HzNs7bG5ioa
	 plMq/iqmpQMK4WDG/ISfeaSA8cMvEMaMu8V92VCtPSrXRQetdt3TS51y+Tn6a/Nmkw1P9
	 29gU3PprKCuWPGjyCIzOGaSZNM0fd80qL7KCtjnl/fddq5JWQkiOnCKAUlOs5yzwKCOl/
	 oZlivlsgymaWqoEg3i4ML6297yTdWvkqk3mSq+JSc9iPzckipMa1E/6Sns6FKPqwLTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297760;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=AzlN3AkWLSdBc/kc/1UhObJxFo1YqRiElThcXbSlnv4=;
	b=MwGP7vGCKjj4DLrpbGk4xLWvtgYnsglceCy4n8QMNn02UqRMcyAc9fTCrA3A2a8JfMA7
	 j9aSHCF16vhVmv+OOZbxDz2ENoBmrark/Dt1XAHqx2Ick6HZ0Hg1L3G9SBGrjqOGKMynR
	 E64d6/khcXc6KzKE2AnojvnSHs1UbEY21m1ThU8BlG6OzAbGdNbAbFMrX9bJR0hzVloN4
	 f3IczXnFx4ZAH3B729a7L5hdBEVUVp8r6hlfS2jh0Glfpy8AfdHKFiCX6fcVaXfbDaV5O
	 oZILIKfBfcungYrBZKKgvpmF1hVg07sy+2gRBmJXvpJv6eaY59Jmc0rZKEPBTCN/NvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PpHULgDq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C91606A32E;
	Tue, 10 Nov 2026 08:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PpHULgDq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5FD11F0089F;
	Tue, 10 Nov 2026 08:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794297759;
	bh=AzlN3AkWLSdBc/kc/1UhObJxFo1YqRiElThcXbSlnv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PpHULgDqTzaVRk0Nu1guUJ2j23qbcgjmANz6xf/JOk0W/5JVWYmzaruYC7Qe1IPN4
	 gQMwf+8mAi8PgW+yVkBwV9r7sb89Y80WAEV0W5883zHElDUGBX9H/5zQ+QDrB+7Oso
	 PjlziCDWwZtAY2s+g+H7ZwTUmTfztk0VjDpTe0CLB8vjTunkumSXpxLT5O0q5AmP4P
	 vk7MrPguUM4hF1g4/rh8Pg4El6mjBVmjGdnpG2pHGGCQOnFvhzXEGDvQesEm4XIm9o
	 I8PXyFMxykxnpw7p8w7vZxDrp+Ec9pre4WHpbMsRZWZ6lkItiLSDpafwr4iDKlIPiE
	 aqpS8iqRZRrJg==
Date: Tue, 10 Nov 2026 09:02:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Brian Masney <masneyb@kernel.org>
Cc: Long Zhao <longzhao@ambarella.com>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, Long Zhao <zl020895@163.com>, 
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v11 0/5] arm64: add Ambarella CV75 SoC support
Message-ID: <20261110-interesting-hilarious-shark-2dbfc0@quoll>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
 <179427375370.1061670.4050288038934218487.b4-review@b4>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179427375370.1061670.4050288038934218487.b4-review@b4>

On Mon, Nov 09, 2026 at 08:22:33PM -0500, Brian Masney wrote:
> Hi Long / Krzysztof / Conor / Rob,
> 
> > Add the Ambarella CV75 SoC and EVK support: the board binding, the
> > RCT clock binding and driver, ARCH_AMBARELLA, the devicetree and
> > MAINTAINERS.
> > 
> > The clock ID header is added before the devicetree that includes it,
> > so patch 2 (the clock binding) has to be applied before patch 4 (the
> > devicetree).
> > 
> > The ambarella vendor prefix and the CV75 secure scratchpad syscon
> > binding are already in linux-next. This series does not repeat
> > either of them.
> > 
> > GPIO, UART and pinctrl bindings and drivers are separate series.
> > This devicetree references those compatibles.
> > 
> > Tested on the CV75 EVK. The board boots. That boot used a local tree
> > that also includes the GPIO, UART and pinctrl patches.
> > 
> > To: Arnd Bergmann <arnd@arndb.de>
> > To: Krzysztof Kozlowski <krzk@kernel.org>
> > To: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > To: soc@lists.linux.dev
> > To: linux-arm-kernel@lists.infradead.org
> > To: Michael Turquette <mturquette@baylibre.com>
> > To: Stephen Boyd <sboyd@kernel.org>
> > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > Cc: linux-clk@vger.kernel.org
> > Cc: Brian Masney <masneyb@kernel.org>
> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: Long Zhao <longzhao@ambarella.com>
> > Cc: Long Zhao <zl020895@163.com>
> > Cc: linux-kernel@vger.kernel.org
> > 
> > Signed-off-by: Long Zhao <longzhao@ambarella.com>
> > ---
> > Changes in v11:
> > - clk: use builtin_platform_driver(). The Kconfig symbol is bool. (Brian)
> > - clk: drop CLK_IS_CRITICAL from the core PLL. It has no enable op. (Brian)
> > - clk: drop the misleading (u64) cast in the div_u64() call. (Brian)
> > - clk: add .suppress_bind_attrs = true to block sysfs unbind. (Brian)
> > - clk: drop MODULE_AUTHOR. (Brian)
> > - Link to v10:
> >   https://patch.msgid.link/20261019-cv75-soc-v10-0-d386065e2dd5@ambarella.com
> > 
> > ---
> > Long Zhao (5):
> >       dt-bindings: arm: add Ambarella CV75 platforms
> >       dt-bindings: clock: add Ambarella CV75 RCT
> >       clk: ambarella: add CV75 RCT clock controller
> >       arm64: ambarella: add ARCH_AMBARELLA and CV75 EVK DT
> >       MAINTAINERS: add ARM/AMBARELLA SoC support
> 
> The clk changes look good to me.
> 
> Before I start to merge things, and since I'm a new maintainer here, I
> just want to make sure that I am doing this correctly, and have the
> expected merge strategy for everyone involved.
> 
> - I create a new shared immutable branch based on v7.4-rc1 and I can put
>   the first two dt-bindings patches in that. I merge this into clk-pile
>   (feeds clk-next) with --no-ff. The DTS folks will merge this immutable
>   branch as well.
> 
> - I can then merge patches 3 and 5 into clk-pile.

You will have code depending on non-exisitng ARCH_AMBARELLA symbol, but
if that's fine for you then sure.

> 
> - The DTS folks will take patch 4.

The entire platform is for SoC tree. This sounds ok for me, but I am not
sure if Arnd was merging pulls with dependencies. If not, then worse
case the arm64 bits will wait a cycle. Anyway, I guess you can take
clock bits.

Best regards,
Krzysztof

