Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E976114287;
	Mon, 23 Dec 2024 15:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734966384; cv=none; b=T6FzwagizTEexVLoNq7sboxqcCtLad+cCoE99GcV7FC7VA/cS1O4zaw12SAt4U4Py8Q0QmOMfhtJrO8nb+I/yldZZ3f1Mfxcp4eJ+HdTYbVwVnY8rgkjYK/JWPz3Y/Z4YlUhi2fJxRZ7GwBHGD2Z36V3GtCzf4hH6xj2CytnZqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734966384; c=relaxed/simple;
	bh=A679kTlYojo7x9OfNYdFDbtrZYj0+xWlOjYQiM02wnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGVfsYSQRMc1laBJS4t9kOFC8qpFtTOg0ghTcUgcLy7T1SK2U13DEPFcANdLo0V75Zh9Wv0bIQWsXAkLEhnJBoSAOiZh70rY33Yoo/xQeHUAF1Vyn47G2n7aqCsC7OeMKU7K6Nj0nKXdCGGAGYsp0bzIRVp2hAI59job3c5vUaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=es/OwD+d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="es/OwD+d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0253C4CED3;
	Mon, 23 Dec 2024 15:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734966383;
	bh=A679kTlYojo7x9OfNYdFDbtrZYj0+xWlOjYQiM02wnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=es/OwD+d92Hyd2m9/Z2qlYS9V1p6fm0dQprrym0TrJjQalkXVFIxdOeF4Do5VAVI5
	 Wchm/OMUMv0hSJZHcxXBByn3ARMVP1H8F3YsSwo0Zxfk2nfaw59yMhHvWKkckf+iUN
	 MOp5xT6SYzm5TDhwm2wUzO1fE3mNPUBzO575MYyxQZrHthTgR8Hofi7+3gnFx0MACH
	 OovxctEdq3pgc/GDxWD6HnfYXIklQb07SLnjwDTma9ITChUhQFDe7dv6ktmJRVFlLa
	 NRwv2Q8Bfp8T4Zntoup+4d2+zZk7WSXqP+LLTsN4EsndUTUR/emrFwVZp+jklY3ggj
	 0fFzWYtQzgxNg==
Date: Mon, 23 Dec 2024 16:06:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 05/18] dt-bindings: clock: imx8m-anatop: add
 oscillators and PLLs
Message-ID: <n5v5y2mhsqrpirw6ceck22vi2xnawk6k67j4tdotu24iqk5j4v@bcvmmuqkuvib>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
 <20241222170534.3621453-6-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241222170534.3621453-6-dario.binacchi@amarulasolutions.com>

On Sun, Dec 22, 2024 at 06:04:20PM +0100, Dario Binacchi wrote:
> Though adding clocks and clock-names properties will break the ABI,
> it is required to accurately describe the hardware. Indeed, the anatop
> module uses the input oscillators to generate various PLLs. In turn,
> the Clock Control Module (CCM) receives clocks from the PLLs and
> oscillators and generates clocks for on-chip peripherals.
> 
> Furthermore, as agreed in [1], this change represents the first step
> toward the implementation of the anatop driver. Currently, in fact,
> there is no dedicated anatop driver, but the CCM driver parses the
> anatop node and registers the PLLs it produces.
> 
> [1] https://lore.kernel.org/imx/20241106090549.3684963-1-dario.binacchi@amarulasolutions.com/
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

