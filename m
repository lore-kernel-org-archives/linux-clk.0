Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364909;
	b=ESfXXc6a8LwS8zpNPrwj8IBilkhSJz/aSVs6yrGVSyDXyhRPKXkA2q3AH+fXOI9GjhAt
	 wCCbyDodJngfY529cWx9fe6w8csZzTE8cYRZMO0D8YeE6UuTycjOjgtG1ji2cZHknFVsU
	 k4e8rYbfvTHnfQ+fMG5oC3Eun/TMh7k1HIBk8nZNB1Ad3G7s29Taz+ph7pv/du/ao5lFG
	 518Se07K2q4JYSiTlEqGZ990CMjB/9c7QuCXgRWUqt+ktCS+ONRdSNEGPCg4ZJDzrW60d
	 kRJD+luaaD7k7SeSxqxTCZyQ1q6z/IfnTByn4DkOGMKs0L34fhSC1BscDgoynmstn1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364909;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=40ClnSdafu9GjCIqCxo5bRhBPDPdsGWMGd+K027J65g=;
	b=0LPmQl1rO7tFASgdYDo9hp2IwyZbkfmbVCUQ2Xo3OIUB3l/6HWhffj5AjHhkK1l5ru9d
	 GhL/00PnAopyry1uUuazASTWUFXEO4HTOqHnNHBV01+m095qG9NFXGI0pxTnTPjjfJj9A
	 44r0Une8r7RhAEDvjTkmoDC7LBgwI+LPd4qiWvC7z0Q7/1D0U4wqNJiSo6a1mE5BQ4nQc
	 9DGO4XCsbkHBDgzXGFqzbq36bZ982LGg/KDQvEnHpvBJ6OpYw0b2xbpw6tVnU+wfmBV92
	 roTmHi5zWJeDyZJFu8MA1a9XqReuBaBJH2U6NtjX0EBmkfvAg3UCfUvPCRcDH5P4+aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qf0VW35p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605CE606A320;
	Sun, 22 Nov 2026 16:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qf0VW35p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582851F000C4;
	Sun, 22 Nov 2026 16:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795364909;
	bh=40ClnSdafu9GjCIqCxo5bRhBPDPdsGWMGd+K027J65g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qf0VW35pxlfhSwIUl8Yu6FaYKS7Um63Qojtwl1KmeEktxADjPWlimxyXka8Y4227b
	 ps4DU+7B6Jvy0Nqkth7EcJGi2eoDaAiLV8uUY9lkWs1dRd25UTNbp0nMJY6D7WnYsa
	 Ppf4w5Ulo4e/Jro+R7zqLR/ZL23oexQYN4Q7bzJmGrzpfaGXjcxaSm6MOlyyH+DL3b
	 maJJzPtTs4jQZ9OVfhnQp9xG7DDUFHQVuMtYAXhkpYcufV3s2hJBhyleZby4x2+717
	 MoY1v1bJv3836fh/fujc67YsrBTbBZ18dAIjhjlnbpj10nWFRfKPV2J4idGbyDJdq/
	 WMbqUrzBGtWyg==
Date: Sun, 22 Nov 2026 17:28:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, patrick.delaunay@foss.st.com, yannick.fertre@foss.st.com, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: arm: stm32: Add clock inputs to
 STM32MP2 SYSCFG
Message-ID: <20261122-benevolent-industrious-deer-0c8bbe@quoll>
References: <20261118-ups_mp25_clk_syscfg-v3-0-935de791a4ce@foss.st.com>
 <20261118-ups_mp25_clk_syscfg-v3-1-935de791a4ce@foss.st.com>
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
In-Reply-To: <20261118-ups_mp25_clk_syscfg-v3-1-935de791a4ce@foss.st.com>

On Wed, Nov 18, 2026 at 12:59:06PM +0100, Gabriel Fernandez wrote:
> The SYSCFG of the STM32MP23x and STM32MP25x SoCs is the provider of the
> LTDC pixel clock, which it selects in its DISPLAYCLKCR register among
> the LTDC kernel clock, the LVDS PHY pixel clock and the DSI PHY byte
> lane clock.
> 
> Describe these inputs with the clocks and clock-names properties. The
> LVDS and the DSI don't exist on STM32MP231/233 and STM32MP251/253, which
> use the same SYSCFG compatibles as STM32MP235 and STM32MP255. So the
> inputs are listed in the "ltdc", "lvds", "dsi" order, and the missing
> ones are omitted at the end of the list.
> 
> The inputs are required, the LTDC kernel clock being always an input of
> the mux. This doesn't break the users of existing devicetrees: no driver
> registered the SYSCFG clock so far, and the clock driver doesn't need
> these properties to probe.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  .../bindings/arm/stm32/st,stm32-syscon.yaml        | 28 +++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

