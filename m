Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227279;
	b=ubRyruU7uchbe+1W3JxB2HqtYATyu326+BCPX4hDldGnjMGrAWTtjPkAeccnmelsxI8/
	 JEusOmPLj8KX1W5arCeZ/8/NNpMbFM7wFYkJL1GCrsuf0bMDC+euxECQxRrXxAgC2xzRL
	 FZsNdbQGv8lgC3BgzaTeeTYt4z0pbx1ybLoMzbrpopzSdlirBCyUI12D6gzEEiefFBWSb
	 KfoxJEB2sq3G9AL7hlAVIvVamvxc4beQ5t1ibE8nFw7cQn1Uamso7SPd9BcbBheJNJP+2
	 kDmxXGgCo57+JPPpFjpUPrSAahPeHZvTac05Ng3b5nXbyyMGdZ1ccVeX4itwMVBGjCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227279;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gCHTfCW97KpYQJTKEFqZ/ymfH4VJHD4E4IGyWOcVdiE=;
	b=2DU0N6vrneMGhpk10FB8y6k8XK42QbxqKrZfs+E1NaBaljASZw4WjSMzX2NV3BRI+HK2
	 iBMiRFEbdo8za8tOKSJEjH5njQGjSmKMkgPP1isxNHLR1V7Ho+fMjoa1q8ACu9roYAhOY
	 3h8tIFofiX5RnjfZ/pIXSCaPIThz4P1mOyvdPQbIvW/Y/qQ1cmtkWtJLIb42/XsXmqGG/
	 0ud/ffPh7SdEFWy/8OB6XfL0Th4H1T/c36bO4HmhJC1EIYLLZJSBwZ/uS4y9K4QbIlxn1
	 RdFpfyLVOQmB3JjBhang9w3tskYCIhoN/LuZng8MOx0UipbyRw2EXStEECQFE4+Hr0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bJAkJOZp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974CA606A322;
	Mon,  9 Nov 2026 12:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bJAkJOZp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F7641F0089F;
	Mon,  9 Nov 2026 12:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794227279;
	bh=gCHTfCW97KpYQJTKEFqZ/ymfH4VJHD4E4IGyWOcVdiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bJAkJOZpQM6h9sgGDj6agmWdRQPGL2hS4t1t+waOoqK0Hnfy359N421qqvgXVJEf5
	 AHdF2R7HuIwvmBMGzneVN7q+NSOit4jPiTiYqg5J5QkxwtG/IR+K2BGrdMqs8aq6Vs
	 AbTOemJ9M8UX2lWHfBgm84bT3BROYbe80y3/TuVthg+IL+W2uDfZlo+Yc+x7OyF+DX
	 PAojDZY9cT6NhPhGxGhjJxuKJ7UlJwdHKPBJoBdUsyo8MzYricxCBLSYMd+/sjWGPm
	 ibp9KckV7siLxVuLRwV3xyYTsUj4ebyKt1cmdiUZUMdU9ZZwfFpCcGKEgYRorJlH+n
	 fVn9AYn9OJ7Sw==
Date: Mon, 9 Nov 2026 13:27:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Gwenael Treuveur <gwenael.treuveur@foss.st.com>
Subject: Re: [PATCH v4 4/8] dt-bindings: stm32: add clocks for Cortex-CM0 on
 stm32mp25
Message-ID: <20261109-radiant-bear-of-sunshine-3db3cd@quoll>
References: <20261106-ups_mp25_clk_update-v4-0-9e32b817c38d@foss.st.com>
 <20261106-ups_mp25_clk_update-v4-4-9e32b817c38d@foss.st.com>
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
In-Reply-To: <20261106-ups_mp25_clk_update-v4-4-9e32b817c38d@foss.st.com>

On Fri, Nov 06, 2026 at 05:16:34PM +0100, Gabriel Fernandez wrote:
> From: Gwenael Treuveur <gwenael.treuveur@foss.st.com>
> 
> Add the clock identifiers needed to allocate the D3 peripherals to the
> Cortex-M0 (CPU3 domain) and to enable their autonomous mode:
> 
>  - CK_CPU3 and CK_<IP>_C3: allocation of the CPU3 domain and of the D3
>    peripherals to CPU3
>  - CK_CPU3_AM and CK_<IP>_AM: autonomous mode of the CPU3 domain and of
>    the D3 peripherals
>  - CK_HSI_KER_ON, CK_HSE_KER_ON and CK_MSI_KER_ON: kernel clocks of the
>    HSI, HSE and MSI oscillators
> 
> Add the matching SCMI clocks: CK_SCMI_HSI_KER_ON, CK_SCMI_HSE_KER_ON,
> CK_SCMI_MSI_KER_ON and the autonomous mode clocks owned by the SCMI
> server (CK_SCMI_GPIOZ_AM, CK_SCMI_IPCC2_AM, CK_SCMI_LPDMA_AM and
> CK_SCMI_RTC_AM).
> 
> The three kernel clocks of the HSI, HSE and MSI oscillators are also
> added at the end of the RCC input clocks. They are optional, so that
> the existing device trees remain valid.
> 
> Signed-off-by: Gwenael Treuveur <gwenael.treuveur@foss.st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  .../bindings/clock/st,stm32mp25-rcc.yaml           |  9 +++++-
>  include/dt-bindings/clock/st,stm32mp25-rcc.h       | 35 ++++++++++++++++++++++
>  2 files changed, 43 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

