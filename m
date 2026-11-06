Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962677;
	b=mqkrBViAjHDjHL4gVkog3juIRCTlQ8gTQUrAHf/F4TPDZm5mVhDDxFoqd5t793KCe8vj
	 X3AQgRWajv8+0KqmxuG54aHiLG1PWKnCC/RBv7aLaXjPC/yweO5RJEou19/kSZLPFHF2w
	 lsfwbYDd96D8m16H3lAzA3f3lz+kvb1UDwVseV8gTgVXGr/EXR2stAf1ri1YMTKf9fft/
	 eMaBD42bVEVsPYxb5CCOYMJR7waqH8fdnGh5nQE7oJiokO3BecRxQK5Svm/atGGFMdCwF
	 xNrKM2rrDYF9omwHDGuO2HNm4hHDgpcVrW33KLUtiok8fkpiLr0dD/o9O/nFPfRkWiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962677;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=FFpmPVuuYr5OY+WPB+hE25pYug3GLunmJUfruqboQtA=;
	b=sJT84p3j5mWvfycKWBsC1NeCSW6a9ppx5FVHouPTqexP7nCGRmofTsdv27xZ/xipmV0D
	 +CS8SWdbSlckNBooxfkQSXWZzYe2YA0PoQqlU7Y7I5FF0C49sxXX3+uMAp/rYW4w+UGrN
	 G16V4qIv3qxsC3U4Dr8XAV1M6QwKeDjRbcM+qJ8g94z9yzl3FvCqPDHd2rqIanKvU7/7B
	 cQDHP8lRssdOJMBEU9ujNLxTk0EPSKguw9ixulGKmoTgnjRdBI6WTAILO/M2Tnfv9dvbU
	 FDWlm2hJTFxBcpyiFCJCWHEHds2G8fFhLtCa/As8wmpxkKk3t9aHM5ARr6/cAiSaT/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JGfRrjyD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF7B606A329;
	Fri,  6 Nov 2026 10:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JGfRrjyD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 023C71F0089F;
	Fri,  6 Nov 2026 10:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793962677;
	bh=FFpmPVuuYr5OY+WPB+hE25pYug3GLunmJUfruqboQtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JGfRrjyDZiNal+NLyiMYsXj/0YfYKX1XORe4GYP0DOASaNA659T+Ku6IN/L9p153f
	 v0uTNv46ZuVOd5g5ZgvYbvzEuysr6IcJL+OpuZs61kejA+c0op19bG2q5xM+49pDZN
	 znCd2wd4FQU9Mii7ASxLxnre7QxG1IvDgfm6JfNz8dtn38FOBFT2VmA3oQRvJVEmaZ
	 MJDDHzUCydieg/oVmsA4ElsizRUiIsMCWwd2amnJdixxPD2rD8ZpWJ9q5k9hv0ZFJo
	 65+mDIsU4GhFd6j7VRyL6J7WgkSS99WMgCcPcCXDKevfkpgSmJ+XQv8I/Zau1oCBrC
	 e0OtR9rj2o8cg==
Date: Fri, 6 Nov 2026 11:57:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Dahl <ada@thorsis.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Ryan Wanner <ryan.wanner@microchip.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v4 02/16] dt-bindings: clock: at91: Split up per SoC
 partially
Message-ID: <20261106-beige-ostrich-of-merriment-ae6eb0@quoll>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-3-ada@thorsis.com>
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
In-Reply-To: <20261105110715.2486432-3-ada@thorsis.com>

On Thu, Nov 05, 2026 at 12:06:38PM +0100, Alexander Dahl wrote:
> Before adding even more new indexes creating more holes in the
> clk at91 drivers pmc_data->chws arrays, split this up.
> 
> This is a partial split up only for some of the old PMC definitions.
> 
> Binding splitup was proposed for several reasons:
> 
> 1) keep the driver code simple, readable, and efficient
> 2) avoid accidental array index duplication
> 3) avoid memory waste by creating more and more unused array members.
> 
> Old values are kept to not break dts, and to maintain dt ABI.
> 
> Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>     v4:
>     - "re-added" some definitions present in hardware but not used in dt
>     - reword header comment (at91 -> Microchip) for newer SoCs
>     - PMC_UTMI was renamed where appropriate according to datasheets
>     
>     v3:
>     - full splitup for all at91 family SoCs instead of just a few
>     
>     v2:
>     - new patch, not present in v1
> 
>  .../reset/atmel,at91sam9260-reset.yaml        |  3 ++-
>  .../bindings/usb/atmel,at91sam9rl-udc.yaml    |  3 ++-
>  .../dt-bindings/clock/atmel,at91rm9200-pmc.h  | 16 ++++++++++++
>  .../dt-bindings/clock/atmel,at91sam9260-pmc.h | 16 ++++++++++++
>  .../dt-bindings/clock/atmel,at91sam9g45-pmc.h | 16 ++++++++++++
>  .../dt-bindings/clock/atmel,at91sam9n12-pmc.h | 16 ++++++++++++
>  .../dt-bindings/clock/atmel,at91sam9rl-pmc.h  | 16 ++++++++++++
>  .../dt-bindings/clock/atmel,at91sam9x5-pmc.h  | 16 ++++++++++++
>  include/dt-bindings/clock/atmel,sama5d2-pmc.h | 20 ++++++++++++++
>  include/dt-bindings/clock/atmel,sama5d3-pmc.h | 16 ++++++++++++
>  include/dt-bindings/clock/atmel,sama5d4-pmc.h | 17 ++++++++++++
>  .../dt-bindings/clock/microchip,sam9x60-pmc.h | 15 +++++++++++
>  .../dt-bindings/clock/microchip,sam9x7-pmc.h  | 19 ++++++++++++++
>  .../clock/microchip,sama7d65-pmc.h            | 26 +++++++++++++++++++
>  .../dt-bindings/clock/microchip,sama7g5-pmc.h | 23 ++++++++++++++++

I miss the "split" part. You only added defines, shouldn't you remove
them from other binding?

Best regards,
Krzysztof

