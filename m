Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615116;
	b=dOny5auD8+QjANDHjbhGrFe724LRBsoI0kA1XsgWmsogsJ4TJiS/CV/Fd2HgF7euaifP
	 HFcznriQCb/HSPzMa+SwdpQfjSQU1+keIJJ/cMWB8KL1Y+T+hCjV6qr8LZNn0T2HalWOO
	 m0QdeNaZf2Q7x5NWhnz/EIkU3mX9Y45N+Q/A9M4gBm99QP5x3fqCIxKvHwNF8HU3Au3Nj
	 fJeYw+XRFc2VHPTSDl7x6fiABMdXTQWnzRk2yNLuFiTDi7IxBViLjSfZyijjarlzMdTqR
	 liIgM0ZbfnBEUPPaaYolqTrcEgckGs0EbfqA52EIgdGFcRL862CUms1/xiOyguIkUbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615116;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=r/DKQmEszb+fcqdVEHRUAZxDtolo0S47qmYDkLTGymw=;
	b=F7/LgH0nBcLILiJrn4WaBbXEQ8V0E2raV7eq/wVwXtOaX7JJCdifhGypH+/L5nkUcNVp
	 +XyIKX54ajgf5xdbD8QITJHkVaciWbppQtD0HlkUOttqnrmefhKvEq3b2bOwFlQ29R1cM
	 Vyv6E44aN+FGyVgSPloUPc1DIln1PKkX7RKGQ7Se46WlEgRZZFdQhcvQtevEX/+MTqtVm
	 T88vugHdRvboD01lgfOUW63HuAy8aJawKqqtD7XCnABrQOBwxTx3EpXNamclEkHnYN+Qe
	 glmzjXCb/DRIuaX2arF5vo6pdWGnEeZe9tgLLvFCqrjMSzlzrLiwm6GpVUVJkznONuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L1huyh48;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD05E606A329;
	Mon,  2 Nov 2026 10:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L1huyh48
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05AE1F00919;
	Mon,  2 Nov 2026 10:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793615115;
	bh=r/DKQmEszb+fcqdVEHRUAZxDtolo0S47qmYDkLTGymw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L1huyh48LDn0IwZByWYNzUrr75dn2edhjHhyJj3XzPeZs7UGxN5GTtSGcFPOQPpII
	 LhXBBJt3Y87Wqr4UFB9nqh4pqIDR1B+lS4+ifXKK6HX41oeoAf1CrYUpcMh0e4oSIL
	 NMY3PdIToLqenSpXG442/tZlmC731hqD2ik4QFYsJvdLDD/XulEajap0RodYGvSTVp
	 O1zaBgto30XBaNsXcLD9wPRQhw0OYKMpdV0UZcVhhWVmSuo4L1i6VkOrKjtMY75hyw
	 ayqTVzdus8nfQaJAaWmpqTsH0VYVsj7DjZHyRkQCWs9NV5ZtTxHADEi96UJsekmbw2
	 tj39mtfLyC5fw==
Date: Mon, 2 Nov 2026 11:25:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] dt-bindings: stm32: add binding for usb2phy1stp
 clock on stm32mp25
Message-ID: <20261102-festive-private-serpent-be2d8b@quoll>
References: <20261023-ups_mp25_clk_update-v2-0-398d348ea8fd@foss.st.com>
 <20261023-ups_mp25_clk_update-v2-6-398d348ea8fd@foss.st.com>
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
In-Reply-To: <20261023-ups_mp25_clk_update-v2-6-398d348ea8fd@foss.st.com>

On Fri, Oct 23, 2026 at 06:43:22PM +0200, Gabriel Fernandez wrote:
> Add the ck_ker_usb2phy1_stp clock binding required for USB Host (USBH)
> low power support on STM32MP25.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  include/dt-bindings/clock/st,stm32mp25-rcc.h | 1 +
>  1 file changed, 1 insertion(+)
> 

A nit, subject: drop second/last, redundant "binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

