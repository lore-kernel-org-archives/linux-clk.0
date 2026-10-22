Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663139;
	b=qhWABSNnDtHEvEbBc1jS16VFsT6kkQ8RgH1OXgqW/USvobjSgMyXB20QRFJDKO726o1i
	 o6U1KYSs2sPBh++5qdPaqkGe4DaSFSyrd8o2bjH0PkP5gyKbsNRWzByFdnzJgfp+By5us
	 TwHBJHtUr+GLm7nLbuVNf1C2zZRTVR282ZsxINiVsgXNfOz6SDWFnxmP2poE1MgnX4cvG
	 znIUQh/Xwgw4dLC5Qprh6ipWwyVpZQN0xhqQM/SGkcDHvjWkh/loMwWaE2H0WpD1VctW9
	 u3x0GzO0idAOOzyO2ENgfvWCObpL/IKFvqOOKX88bye8QPP0zW2MrPLRiZ3ChsDoWQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663139;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4SnLNd5w0z2j+M0DUYOzSs1MGDbeGkfvlokW6ZHl9ak=;
	b=pPMolcbVjFfrTyBP2Oayotxc3RluSgyu1QXns7mIq/TvJVtPQMogX8Mw1NeddVaAWqGt
	 IfAZ41BZ0sZZhMdcprbvGT1+UaEessq18pYHQfiIr0NWedKVXTwior4svU1V9DRTgOTdT
	 4CGy/r594MY8ztlSb8BWLX17c0igeT5JDTm/40dcfDr0haGxFkYTLr7ovn7SLoDbpyh2v
	 72ngPoXPFXvNJV0RcvhzNGFYNLzaTQ990hUyceXPV6ZokkWyQKW/aFFKHIxUP5EHpM+yQ
	 a6D68K9FdF1K+K9aDredpxBShLmfA9dVpnMR8eDQJ5gKx9p3U7oUgdwgEgcha8EgBEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GnpgJrAq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE50606A31B;
	Thu, 22 Oct 2026 09:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GnpgJrAq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF321F000C1;
	Thu, 22 Oct 2026 09:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792663139;
	bh=4SnLNd5w0z2j+M0DUYOzSs1MGDbeGkfvlokW6ZHl9ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GnpgJrAqse237anlo1ylTV1VGXMmeCDfb0l4eXb82966faybLMzbc57npZ24D/U20
	 cIJp55OZ+7DBHCwexWAlIUQPs+MmIFEYA7b6qpjo7pgAVLtZz7DDHAuAuYSpKeSwsi
	 9VBKuoH0a7LANeivMjNTnleLVkWm+YLafubsHwt2tgE0hnLYANrrmGSkf7PxQ9ejiU
	 JEX1L/saOROiz/YPVZn4tX8JCeSxEzkcLeu9M4ScH4uWZuPF0EN1qiobU3EyrLGpj7
	 H0lZFtICBrF2Ixa3sUfYXHYh8Ay75ZUbpZwtB54F9FY0DDiq5lhSGD9qI1o5+AAagl
	 5knMtM/qh006w==
Date: Thu, 22 Oct 2026 11:58:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: clock: stm32mp13: add SPI1 to SPI5 bus
 clocks
Message-ID: <20261022-scrupulous-toucan-of-judgment-00c8cf@quoll>
References: <20261020-ups_mp13_clk_spi-v1-0-6c00730945c7@foss.st.com>
 <20261020-ups_mp13_clk_spi-v1-2-6c00730945c7@foss.st.com>
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
In-Reply-To: <20261020-ups_mp13_clk_spi-v1-2-6c00730945c7@foss.st.com>

On Tue, Oct 20, 2026 at 10:31:08AM +0200, Gabriel Fernandez wrote:
> The STM32MP13 RCC binding only provides the kernel clocks of the SPI
> and I2S instances (SPIx_K). Their bus interface clocks are missing,
> whereas the I2S binding requires one as its "pclk" clock.
> 
> Add the IDs of the SPI1 to SPI5 bus clocks, as already done for the
> SPI instances of the STM32MP15.
> 
> Drop STM32MP1_LAST_CLK: it is not part of the binding ABI, it would have
> to change each time an ID is added, and the driver no longer uses it as
> it defines the number of clocks by itself.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  include/dt-bindings/clock/stm32mp13-clks.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

