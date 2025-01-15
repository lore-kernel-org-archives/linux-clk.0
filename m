Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978871D89F1;
	Wed, 15 Jan 2025 23:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736983365; cv=none; b=TkY+9JoWANAz3CxLbBBK5+nteBAGWu0BoxjWKR7o6tIBtf+oCgDqC8/G98M8FdRosl+5cmg9aFgQr1biqygBMxowPhXzMhj53pxte1fnp93LhQbIgbgdWxlNxqhut8LckZGGsTPLsVfnUJL+XvCKNJ/AKL5Tv8kE3SJfElHrtUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736983365; c=relaxed/simple;
	bh=BO+8gUrMYtjwhGtLnfcOVQRae2UvKhRyXsiVHIp04Yk=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=jY6/yExzAjtROzZ9snRM6+QzysLDx+ir3sim3cbhJsU7D28DbESqVpnnq/oEajVsY9iXO2j482aa0COx0QyMqJDOzWasL0hNLbEE6lFle7XoHrlUHZjVqnvyYTw0hjOhRcskUSqndQ03ChuylclXefXxzrAz01CcVjmVrrjT0ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LDBJyv1x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LDBJyv1x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01311C4CED1;
	Wed, 15 Jan 2025 23:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736983365;
	bh=BO+8gUrMYtjwhGtLnfcOVQRae2UvKhRyXsiVHIp04Yk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=LDBJyv1xAPiQ8OCfWXU6EpFIHgkh4MEsISk7KwOyyjt1uaMJV5hcdoZlPFsh+9EWI
	 26C1r2GsMdvncAHrRzi9Lj2IpoVa4BGyiLMFEl/xtK8fR3CitwTAEOlmEB4DuOJrnf
	 rqYKoOV2PKZv5qO8ZB0HhFLOV5FT9k3wjUpvS2S+AjHiMLFrQnwYTbg9vWYvqIlI0I
	 PQX5jnLvq1Jv/gTn5PVJwoEQky/DLlNwyeyYuTTFbfcV3D2ayHun4mjXlEtss3Ae2n
	 /JapwHKSEw1o+qyr5p1yHmQSe3JocrpIsN8psa/wDyd5/e2kCBj0YrMM4cRhnkrQXI
	 RaA75ETzeAmcQ==
Message-ID: <aab7227a048a822ba7f228930d3a4eec.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250114182021.670435-2-dario.binacchi@amarulasolutions.com>
References: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com> <20250114182021.670435-2-dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: convert stm32 rcc bindings to json-schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-amarula@amarulasolutions.com, Dario Binacchi <dario.binacchi@amarulasolutions.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, linux-kernel@vger.kernel.org
Date: Wed, 15 Jan 2025 15:22:42 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Dario Binacchi (2025-01-14 10:19:46)
> The patch converts st,stm32-rcc.txt to the JSON schema, but it does more
> than that. The old bindings, in fact, only covered the stm32f{4,7}
> platforms and not the stm32h7. Therefore, to avoid patch submission tests
> failing, it was necessary to add the corresponding compatible (i. e.
> st,stm32h743-rcc) and specify that, in this case, 3 are the clocks instead
> of the 2 required for the stm32f{4,7} platforms.
> Additionally, the old bindings made no mention of the st,syscfg property,
> which is used by both the stm32f{4,7} and the stm32h7 platforms.
>=20
> The patch also fixes the files referencing to the old st,stm32-rcc.txt.
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---

Applied to clk-next
