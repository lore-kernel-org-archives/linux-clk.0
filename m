Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227264;
	b=pmHSAWewL1uF3qTtP+pjg8ME1CgKavY+tIM36q6UjBcW8VcOmlYUwj0H8C4PvQrNyDr7
	 JXahySY5RCfokAfqqzveqKtPvzpDIDPV71AHsc9NPvznqwm8yf4c3VMv/RFWMlkPZx3b1
	 L90hjft3zQ+KIYXCfR0iYF5g50HOKJju06cqlWZTbOhTW0bzY1ZAcIPmpAw1F7QXNQ74S
	 kQeoxV+oNIZgc84mXwzyWUBkwAHlfedf0COAGSDq3h+VqSagnVACOeYyhchxQHccAQxWc
	 e5VLxIq8mJ4W6mIu1LcEN20DW2cIPyIJfyQzmfxOHT3lzYADxu7g1bdpgHW4jChnb+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227264;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2fk8QtX0+1VyjhcQimuCaGWSsBbHKuQjRjuFEVWcw2Q=;
	b=M1FBWT2uEaPH8mSfkrQ/oxNNS3pvtLZZEeh11aZJW35hA7cWHbVG2AO4aUZP0Yb6Fxw5
	 +SXjUZ1D8zmFm1j7RsB2kS2VNYcUs6qaclnSdeML6aaK7Q1JE2vu7AS13fEl1lirD/O42
	 dSeLxUv3lHsjT0OVTKAu6u86+UGJDO95CS+IHwYS3lS6zw6azvws2ShslsriebEKKUhtp
	 EAcaBsfvUPPPZO9iHSrSTL+4pRCOivwUBs9kf1kj2CHoddAIhUTX541eHyhNNq+SS0f5y
	 0jEX+lBFGowmaaPAZ0lJD3R4/Xgl5gfUXLGaRgVGKSSvUXyXG+QEkP3tNPUfs5QIieQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BNaJTdro;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9A7606A333;
	Mon,  9 Nov 2026 12:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BNaJTdro
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6904C1F008A1;
	Mon,  9 Nov 2026 12:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794227264;
	bh=2fk8QtX0+1VyjhcQimuCaGWSsBbHKuQjRjuFEVWcw2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BNaJTdroW0NW2Sg0vMhqzSnHgTK5NcXGRBPvvhz/PAbhO+sdKaRGSdMlpaCxACDeG
	 /mxYEoPK5U4ngmavKkhWp3vPvTLgERpmbWhrF2sTNL7gKEnvybfcsoqTm6iSbdGh4O
	 HTtyWpMZCgmgJQjZ+QLrj+0cva9hWHNp93CsEhL6NIJL2YFe8dj5/mU6TXzAGh9hB4
	 O2FVpmSTHoM2G271lExw5ETwODpV+cKw8LiKLVABxhILzdFds7LYst7TxNMm/pa2H6
	 vFW1RM8G7fWuF7ceRekv+gZW+OBDUA9tYz+CAq5uiPn7/oLDxsu6c5v9IQnU87j1bS
	 tagA/8rf1k3EA==
Date: Mon, 9 Nov 2026 13:27:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/8] dt-bindings: stm32: add kernel clocks for ETR and
 STM
Message-ID: <20261109-heavenly-orchid-copperhead-3ddc0a@quoll>
References: <20261106-ups_mp25_clk_update-v4-0-9e32b817c38d@foss.st.com>
 <20261106-ups_mp25_clk_update-v4-2-9e32b817c38d@foss.st.com>
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
In-Reply-To: <20261106-ups_mp25_clk_update-v4-2-9e32b817c38d@foss.st.com>

On Fri, Nov 06, 2026 at 05:16:32PM +0100, Gabriel Fernandez wrote:
> Add the kernel clocks of the ETR (CK_KER_ETR) and of the STM
> (CK_KER_STM) for STM32MP25, with the matching SCMI clocks
> (CK_SCMI_KER_ETR and CK_SCMI_KER_STM).
> These are the trace (ATB) clocks of the CoreSight Embedded
> Trace Router and System Trace Macrocell, while the bus clocks
> only provide register access (APB).
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  include/dt-bindings/clock/st,stm32mp25-rcc.h | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

