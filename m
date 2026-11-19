Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099256;
	b=WXNbwmxtMKmYBfTcGA+wiGZIUS8TTDWYVgCw8I8gRhABoNQJ7pIiIUFXOAB/tGrLhHYh
	 ohF/HUgTaEznYntGPyczc6oBPiIGqdm4DkQuGnXqU+oAZkVfPCzaC02VHsogq9iVm9zFk
	 NrKhuaD3RjbxJA6UMINwjs9cLwu4KwZM8RGvaIarmSNhqhBxv9vi2sATsDaxVjnb3w4wt
	 h6PiYrND6xJIP/sVChrIUAsaX5XaHvcMh/I/urD/qVIdhyRarVP4tG3AXGIfW4rB5ekBK
	 N/Gd3sM6XkOf6k3I6JOdGyyTZxGXDqbsTVQdlIe+2sEMPcchT4VSbPtXK1v2MC4NZFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099256;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 User-Agent;
	bh=2Bo4SNRejcptfdbl/T7ioVzGH9ExfpssBlBBB+Y7ODI=;
	b=fehqc/Imy5S2YTSmgTUVaSMjgtPOSzReIWumoB53IJMnvaxAaMCuCZboaAKPsJLJYVeR
	 1Hk5mn4gOyxAGm2w+dsNYIL0g2qwOK0kLgrKFUpJmLqsxj0kngnkC/thXcbjrgoMkiZOZ
	 b4O0/I/ee6rKK2Z1GkVMieYt+9MSk8ePTtuASZ0x2LapmcBbOhAJXBlR82iQk1SKqA1JA
	 rF3d4FNJMap1lbAtu2CZJzcxsufXspnuprr+Sx+5JoueDBIKdQwG3IkP1yDIjvE/fS+Pe
	 YRpoqUkQHJjaIIc7IXMkyvo/XRYaUBPlV0ubMTRaYzamDIkJ4Y2Kb9fldKStH5T8oiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gztt8nYr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D237606A320;
	Thu, 19 Nov 2026 14:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gztt8nYr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409D41F000C4;
	Thu, 19 Nov 2026 14:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795099256;
	bh=2Bo4SNRejcptfdbl/T7ioVzGH9ExfpssBlBBB+Y7ODI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gztt8nYrDs5jwVfu1xBiUfW04Xw8Gr+ccPbNaPLA3Sbx9zr9SsyvjOheo+PHTFS6b
	 pPPwotwBfj2kw1J9fld9CKOmyJl/gZeKxkJnMp9npAF0BqfVA5p4wI22vPKu6UyrMs
	 FF1nTsUYeBBWw0XOELmSTR7KLnWiarMpo/XQt1MD0d4B5Z5x7rM+ClCkHpMXH+oe00
	 zFdpDoEOI2AlOcZAihJ1C3KKYVlsP9zje+Pt/ZVRffzWq6WeX5/M1FTCIzGD7wyt9p
	 sfB9X4WLU8v9wraO6Wevl+uBg9eJ5dTDY3vEM27+xi8waS0yJcgTt4LuvE57bsZ/1P
	 rQWEBmLAYKSHg==
Date: Thu, 19 Nov 2026 09:40:52 -0500
From: Brian Masney <masneyb@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Long Zhao <longzhao@ambarella.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
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
Subject: Re: [PATCH v12 0/6] arm64: add Ambarella CV75 SoC support
Message-ID: <av8KdBCzXLeNE0BX@x1g10>
References: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
 <1148990d-dfa6-489d-99f8-4bf4417b2c4c@app.fastmail.com>
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
In-Reply-To: <1148990d-dfa6-489d-99f8-4bf4417b2c4c@app.fastmail.com>
User-Agent: Mutt/2.4.3 (2026-10-09)

On Thu, Nov 19, 2026 at 03:18:26PM +0100, Arnd Bergmann wrote:
> On Thu, Nov 19, 2026, at 11:13, Long Zhao via B4 Relay wrote:
> > Add the Ambarella CV75 SoC and EVK support: the board binding, the
> > RCT clock binding and driver, ARCH_AMBARELLA, the devicetree and
> > MAINTAINERS.
> >
> > Apply the patches in this order:
> >
> > 1. board binding
> > 2. RCT clock binding and clock ID header
> > 3. ARCH_AMBARELLA
> > 4. RCT clock driver
> > 5. CV75 SoC and EVK device tree, plus defconfig
> > 6. MAINTAINERS
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
> 
> I merged this into the soc/newsoc branch now, which may get
> additional SoCs from other vendors for the merge window. This
> should be in linux-next starting tomorrow.
> 
> I also pushed the contents out in two branches:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=newsoc/ambarella
> 
> contains all six patches, while

I pulled the branch with all six patches into clk-next.

Brian
