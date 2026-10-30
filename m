Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359447;
	b=Drb9fMYjFt7DEalywKUXtkw+9OvKk/PQ1UXZOIP+9QG4HHzE2GylpnoT06ak4gs3lCwY
	 NfLXd+mb2RbGBgatOCQ6QHF3AFdDBmtXZEInh4Z5W8lIghX7SArKTKfIuQ34fc6YhvSPP
	 rMRS17fisEKrgIAMzToFhPUQ0iM3A4JJ3+trRNBIKuOwx04xzDzCfxmBzqslG8+imLrWx
	 Dpt/kM4AHxhfR36qkYc+D5E6FDkbQgVUAXTefKlY/enWX7zf95MW+h1jsz82IIPw9XRkx
	 OQnFDkeKiS/XHrTh1Jqyn4OWivDhKH7bF1FSVWI81qPMK00n3iFZ7WAAE3pPeCTMb+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359447;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=batD5VdW88T/18mgZ0vW+xFtqqRPwtJw+1uYjSTAfvg=;
	b=OLQyFAeHTkcSbTLfH+I7PY2fGbVIgVt+q7l6csBNI4AY6q2oaJPSLOZS1bEe99mE2M9o
	 CeURC3v4LL5mIGdPyKIY19tBbn+8yaqbz01tlAzu7czA4MT7cBgCJxYZ8uTppu+7uUI+k
	 rad1PQnf+zXSaEaM0kXQsxAoZlLVk42m3MpBZSIB14qWZodZLLCt+1MMAwoqtSftSIOl8
	 1EmgZf0JN56+Ay7qMdT4b4UZBDSprkIw1mq6mLTkdAR2dTb87u5EvHYuktaAOOPKFsBkI
	 dMEJoooVHYyk967wLsagXdZjZRNhVMtUo1kooN7+Yt/vLug7JJ7Dr9g9WkZj8hOLVEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UAbYgCfp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3A9606A31F;
	Fri, 30 Oct 2026 11:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UAbYgCfp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2879F1F000C1;
	Fri, 30 Oct 2026 11:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793359447;
	bh=batD5VdW88T/18mgZ0vW+xFtqqRPwtJw+1uYjSTAfvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UAbYgCfpFGcpaiGD8+RH0ecmg27j9/x8okMXUjlmytAKSYKt+x/tJngtwaCk16+0v
	 Id/t6SqMt097czvY+oAqq7MZ38dsXTQekJ1q3tszw3uep+UpX3TWQsws+y9Xnk1PZ8
	 aS3cC3JtHs0GqhX/dNnKBpZODA0hUorKcMaI8mrajeS6W0MY+8vbmtqDPRMeyf1Kvy
	 smZtxDKFkh6NiF7e58uXouFp85Tpzbq24iglQeT6ip13Z4saBkYee8gfvw6p1PfG1f
	 n8eirEqX3GHOA9vv8JgWmHoCAwZflTXDtLmZ/m746MPxaFTz1L2VCkV0SATCSNd5CF
	 E0kcl33uUVB2A==
Date: Fri, 30 Oct 2026 12:24:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, letux-kernel@openphoenux.org, 
	kernel@pyra-handheld.com, Paul Boddie <paul@boddie.org.uk>
Subject: Re: [PATCH 1/4] dt-bindings: clock: Add Ingenic X1600 CGU bindings
Message-ID: <20261030-dandelion-mushroom-of-tranquility-1b04bd@quoll>
References: <cover.1792955907.git.hns@goldelico.com>
 <13abd95aaab56ce5c9dc565db7f0198162b0c166.1792955907.git.hns@goldelico.com>
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
In-Reply-To: <13abd95aaab56ce5c9dc565db7f0198162b0c166.1792955907.git.hns@goldelico.com>

On Sun, Oct 25, 2026 at 08:18:24PM +0100, H. Nikolaus Schaller wrote:
> Add the device tree bindings and the clock ID definitions for the
> Clock Generation Unit (CGU) of the Ingenic X1600 SoC.
> 
> The clock layout features specific I2S handling. To properly support
> the I2S controllers on the X1600 without relying on complex compound
> dividers that are not yet natively supported by the drivers, split
> the structures to explicitly describe the additional I2S divider
> fields. This design accounts for the current driver limitations
> regarding division encoding while matching the hardware's internal
> gating architecture.
> 
> Furthermore, introduce dedicated I2S0 RX and TX clock definitions to
> allow independent and precise routing for I2S stream usage.
> 
> Co-developed-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Co-developed-by: H. Nikolaus Schaller <hns@goldelico.com>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  .../bindings/clock/ingenic,cgu.yaml           |  2 +
>  include/dt-bindings/clock/ingenic,x1600-cgu.h | 64 +++++++++++++++++++
>  2 files changed, 66 insertions(+)
>  create mode 100644 include/dt-bindings/clock/ingenic,x1600-cgu.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml b/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
> index 509df06b9c9d8..c622131c5c49b 100644
> --- a/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
> +++ b/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
> @@ -28,6 +28,7 @@ select:
>            - ingenic,jz4770-cgu
>            - ingenic,jz4780-cgu
>            - ingenic,x1000-cgu
> +          - ingenic,x1600-cgu
>            - ingenic,x1830-cgu
>    required:
>      - compatible
> @@ -58,6 +59,7 @@ properties:
>            - ingenic,jz4770-cgu
>            - ingenic,jz4780-cgu
>            - ingenic,x1000-cgu
> +          - ingenic,x1600-cgu
>            - ingenic,x1830-cgu
>        - const: simple-mfd
>      minItems: 1
> diff --git a/include/dt-bindings/clock/ingenic,x1600-cgu.h b/include/dt-bindings/clock/ingenic,x1600-cgu.h
> new file mode 100644
> index 0000000000000..a0001a63a6b54
> --- /dev/null
> +++ b/include/dt-bindings/clock/ingenic,x1600-cgu.h
> @@ -0,0 +1,64 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * This header provides clock numbers for the ingenic,x1600-cgu DT binding.
> + *
> + * They are roughly ordered as:
> + *   - external clocks
> + *   - PLLs
> + *   - muxes/dividers in the order they appear in the x1600 programmers manual
> + *   - gates in order of their bit in the CLKGR* registers
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_X1600_CGU_H__
> +#define __DT_BINDINGS_CLOCK_X1600_CGU_H__
> +
> +/*
> + * beware of unwritten rules:
> + * - list must start with 0
> + * - list must not have "holes"

Please drop this, no need for individual souces to document standard
rules. If you think documentation misses them, then please update
writing-bindings doc.

If this is driver requirement, then please fix your driver not to impose
such rules, although these two particularly are fine rules.

> + * - all clock parents must have lower number than a clock itself so that
> + *   parents are initialized before
> + */

Best regards,
Krzysztof

