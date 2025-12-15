Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B9D7494;
	Mon, 15 Dec 2025 16:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816654; cv=none; b=rYWBaDglXgWeZpTncV9Xkqnmix4SYzqTiKMkK7sLHH7wESyy2gcgBInOH3QvVJJn2ekMEIbtyTs84zr2wfFxJoPXofgJ8eOGz5fFGHDG6Sn8STwO+vUviGNXF70qUAeao02qfGF4E7Nx1ImxB0xuTsVUg1/Umyn67p+rK6FCjGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816654; c=relaxed/simple;
	bh=povrRVnkD4sb2LJU1Tc1rqf66LNEj9/0BEQW1JVluXY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=PqlNZ9ezDGHMY3r0i203Z7Kf7tvrIXFAoA7bgBKCkpzne+xW7r+oSY/onNPkHbXNGBRNlm8use8WcpX01jG0Dx2tAf7d8WBQpnJ5UKNZDYuqnAcUDcnE6hl4BEos/brjXPuOqWhBJeshH+T1db6/UJXQa37/Yk2vmq4vizydFTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r9ROIy/B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r9ROIy/B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1D5C4CEF5;
	Mon, 15 Dec 2025 16:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765816653;
	bh=povrRVnkD4sb2LJU1Tc1rqf66LNEj9/0BEQW1JVluXY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=r9ROIy/BQFY1qK0HZgSL55FBi5gKYbThyKkqHb/z3PxqTcthn9rk9CiOsc03iBwjB
	 /4E8qynsP2r8iFoLXTa5uj7VZdzTzb9d65Buqv/TKrHUUr36bQd4oPlFYUt2+LmJ7N
	 8DSjl3coqXd+gEXXOGpKMDq03gwxN39Y5SZ3ZEuuKplqGmvoR7fv8uWfHt1amaj3kr
	 MurFmFhuuHXGT2x/ZEtpdH1Nnyg/NaBNqrt8i5fp66VXNOMBy0uzKtfkXfymb5Xhr9
	 3zjRKQRcXsm2fm37o1QeuAQSiS52MeRLSIlgD+Y+Qoq2TVNzSQ6cpwKNLEfhWtXZ+s
	 oRNlEe+nXAAmQ==
Date: Mon, 15 Dec 2025 10:37:32 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Haylen Chu <heylenay@4d2.org>, Inochi Amaoto <inochiama@gmail.com>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Conor Dooley <conor+dt@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
In-Reply-To: <20251211-k3-clk-v1-1-8ee47c70c5bc@gentoo.org>
References: <20251211-k3-clk-v1-0-8ee47c70c5bc@gentoo.org>
 <20251211-k3-clk-v1-1-8ee47c70c5bc@gentoo.org>
Message-Id: <176581665051.3026304.8004386594880695878.robh@kernel.org>
Subject: Re: [PATCH RFC 1/4] dt-bindings: soc: spacemit: add k3 syscon
 compatible


On Thu, 11 Dec 2025 09:19:41 +0800, Yixun Lan wrote:
> The SpacemiT K3 SoC clock IP is scattered over several different blocks,
> which are APBC, APBS, APMU, DCIU, MPMU, all of them are capable of
> generating clock and reset signals. APMU and MPMU have additional Power
> Domain management functionality.
> 
> Following is a brief list that shows devices managed in each block:
> 
> APBC: UART, GPIO, PWM, SPI, TIMER, I2S, IR, DR, TSEN, IPC, CAN
> APBS: various PPL clocks control
> APMU: CCI, CPU, CSI, ISP, LCD, USB, QSPI, DMA, VPU, GPU, DSI, PCIe, EMAC..
> DCID: SRAM, DMA, TCM
> MPMU: various PLL1 derived clocks, UART, WATCHDOG, I2S
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/clock/spacemit,k1-pll.yaml |   9 +-
>  .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |  13 +-
>  include/dt-bindings/clock/spacemit,k3-clocks.h     | 390 +++++++++++++++++++++
>  3 files changed, 407 insertions(+), 5 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml:14:7: [warning] wrong indentation: expected 4 but found 6 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251211-k3-clk-v1-1-8ee47c70c5bc@gentoo.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

