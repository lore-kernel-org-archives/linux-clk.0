Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465053126AF;
	Sat, 27 Dec 2025 11:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766834714; cv=none; b=RFAkRLfZ71psC5lmqMmUkRPkuFwhLt4djNgpOU8eK8ZmiPMKxfXvFDfVYhaqjcSzLim+WrIq34muW5EtG7yVV756E9SL0mIh4Xp0sQByy+isF6BPjgUMzq4hRIY6B2om3e0uSDymQxPwUxRZSlVlFc+/VLnUYfDgq/JgrKaHeEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766834714; c=relaxed/simple;
	bh=8kGUYYmACHqbfyv/84HV3f5JbyVZmQjIEIeVSleHFXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GkQ8k3V4KLZqYW3yzSgHrnTuO0D3NV+8fXJlg6P1pMgHaGYYu1j4B+gyQMbNyHwkjFbkxPk9tVc7G7LVUTFKBaRCiOgqPbQvS8t3uy4iRR3i4hMRxLi5uW39zVHBBtRXDsRqBcxmnoVCqo+UGMLwg4nK4Z7HjsjZiRkRSqHc2LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ukx2DgGu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ukx2DgGu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 558CFC4CEF1;
	Sat, 27 Dec 2025 11:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766834713;
	bh=8kGUYYmACHqbfyv/84HV3f5JbyVZmQjIEIeVSleHFXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ukx2DgGuJJW8VM0jkB5y54tMYE+yR5zUT5DlW3aP2nFAn36KzQ3f4p+WO1XQIJPQA
	 qKHKRR2LM3VFXPQqZWE/V4yloNs/7P4C1QBl5/dgEoO62JbyWr9IfKbBPo827bWAH2
	 RYkhchHY79Ln7No3atWXIebFoBaUYn1tylRnx5Tl2TiZ+ZPczhsTcu3ve3nelkbkjY
	 fq3K69Fpg67sgOLFegbiz7BsOikvBHxT37gp4zisUeW1C6SG5bgDG6gqqj4EGd/ZEL
	 8/gokM+Ww/KEtkhW+5cPbQH6EraPLeytne7tSUWUOmUpbE0rG7CVriMjYex1Prmj1U
	 Mh1TsMbSMSpAg==
Date: Sat, 27 Dec 2025 12:25:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@4d2.org>, Guodong Xu <guodong@riscstar.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: soc: spacemit: add k3 syscon
 compatible
Message-ID: <20251227-glaring-aromatic-raven-cbe30c@quoll>
References: <20251226-k3-clk-v3-0-602ce93bb6c3@gentoo.org>
 <20251226-k3-clk-v3-1-602ce93bb6c3@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251226-k3-clk-v3-1-602ce93bb6c3@gentoo.org>

On Fri, Dec 26, 2025 at 07:01:16PM +0800, Yixun Lan wrote:
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
> diff --git a/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml b/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
> index 06bafd68c00a..02ebbe4061e3 100644
> --- a/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
> +++ b/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
> @@ -4,14 +4,17 @@
>  $id: http://devicetree.org/schemas/clock/spacemit,k1-pll.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: SpacemiT K1 PLL
> +title: SpacemiT K1/K3 PLL
>  
>  maintainers:
>    - Haylen Chu <heylenay@4d2.org>
>  
>  properties:
>    compatible:
> -    const: spacemit,k1-pll
> +    contains:

No drop, there is no such syntax for this property, so you copied here
something completely different.

> +      enum:
> +        - spacemit,k1-pll
> +        - spacemit,k3-pll

Best regards,
Krzysztof

