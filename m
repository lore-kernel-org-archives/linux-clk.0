Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511813F1ABD;
	Tue,  4 Aug 2026 06:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785825477; cv=none; b=Ni2bggDUZa//IpTOIftqjADvVHndWPwcX/Cu9HU9lfx+pMFSaTPBWghp/fMow9Tpovm1A3NLCA8K5QovOE+N1IGAh7KtlkrVWvdL8jyZcDS4xJzMIuccRkwpyMR9OTCBbQybp1EUSTA9Bgk1tgNbbovpLyAcBcH/+FJiY3RCHMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785825477; c=relaxed/simple;
	bh=sVV9ANkNdZSlIxQxx6G0UrPV7UdyTkbaOPTjRrwl8xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y5x8fT9HvTx2Ad7ZAq5vcjEb06qtYuIP4hFUD7tAclh48mVjU0VY5fE1ovjPIxSfoQ9vvRxET9LalhZD62A7dEETDvyFE00dkp9ouRLrO/Nhpe3AxGhzk6Uz7ky2sDR5/M7VBAEYkpwqwkji/UjEMd7s6CeiyXfzgMTdmSnuVwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jaMly5HT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jaMly5HT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77811F000E9;
	Tue,  4 Aug 2026 06:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785825475;
	bh=sVV9ANkNdZSlIxQxx6G0UrPV7UdyTkbaOPTjRrwl8xo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jaMly5HTZ3fqszrH4+9Avu8iT9Iu4USutKzAtFZXji71cQ/MKlmxt3iNMousKck4p
	 0St6s/+igXJGmG6faNAYUPY2KnHGQNaTNxvaFz/nsL/yNENZCNy6pH7KrXDNkwPmRr
	 qDfoC9OjF5pZE9wMZrpqXpk6ZHOMhFQplfeL4f3AX3WcJzdX41CxFDp+BCJFydpPpG
	 7o+mt/Rb9Y1kROTR+MJ0oy1e9kAjGKOCWY7Qbk0Om+6ZdlJF6djsB5j9RFbw5R+et8
	 hmQNo4y9OoTRY6/hLF7yux1HlWKKPvtB0ifjGju0YGkdr05SSK7YFCZF/f5ZN4gcgE
	 eNa1VxO8oR8Hw==
Date: Tue, 4 Aug 2026 08:37:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v9 01/12] dt-bindings: clk: zte: Add zx297520v3 top clock
 and reset controller
Message-ID: <20260804-tough-reindeer-of-zoology-6ccd59@quoll>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-1-d05530d85d28@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260802-zx29clk-v9-1-d05530d85d28@gmail.com>

On Sun, Aug 02, 2026 at 11:33:33PM +0300, Stefan D=C3=B6singer wrote:
> These SoCs have 3 clock and reset controllers: Top, Matrix and LSP.
> Clocks go from oscillator -> top -> matrix -> LSP, with a register in
> top controlling most clocks that get passed to matrix and a register in
> matrix controlling all the clocks that get passed to LSP.
>=20
> Generally every device has two clocks (one work clock, and one that
> connects it to the bus, I call it PCLK), two reset bits (I don't know
> what the difference is - sometimes asserting one is enough to reset the
> device, sometimes both need to be asserted). PCLK and WCLK are
> controlled by individual gates. Some devices have a mux and/or a
> divider for their work clock. Some devices, like the GPIO controller,
> only have reset bits and no clocks.
>=20
> The top clock controller is fed by a 26 MHz external oscillator and has 4
> PLLs to generate other clock rates. ZTE's kernel mostly relies on the
> boot ROM to set up PLLs, but one LTE-related PLL is not configured
> on some boards. Therefore my driver contains code to program PLLs. It
> produces identical settings as the boot ROM for the pre-programmed
> frequencies.
>=20
> Not all clocks will have an explicit user in the end. I am defining a
> lot of them simply to shut them off. The boot loader sets up a few of
> the proprietary timers, which will send regular IRQs (although the
> kernel of course doesn't need to listen to them). I don't plan to add a
> driver for the proprietary timer as I see no use for them - the ARM arch
> timer works just fine. I will add a driver for the very similar
> proprietary watchdog though.
>=20
> The clock list in this patch is pretty complete but not exhaustive.
> There are other bits that are enabled, but I couldn't deduce what they
> are controlling by trial and error. Some of them seem to do nothing.
> Others cause an instant hang of the board when disabled. It is quite
> likely that a handful more clocks will be added in the future, but not a
> large number.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
>=20
> ---
>=20
> Changes v8->v9:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

