Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCDD37B41F;
	Wed, 14 Jan 2026 08:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768380389; cv=none; b=f1N3kzUZIYHovpmpYrXaiNDZJhdNrtFybzpv0aMLJeC4sHWuQIPrJYJLmWUCwBSAoZx2TTulNMzoWZkOXyMhod8fmNayutjZTuwSuhHjseMjes1B+QWIbZsCC4p/Hid0zNG16VmrhtLTzG7AcXy49uxsmXfW+HqopVBHPI7EH5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768380389; c=relaxed/simple;
	bh=6Ll8Ht/Fca12qE3DQR7uKG2qN0tG9al50MTY6YzyiNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RgtfzeX3Kpc2h5aTecQ0idm9t8rWbyX5DGXmJ/YV3zMktGmadPRNTvSJ0gSELDn4ddop3C6FQt8xxivpcOhUV5WXes3w7UBD3206zJlWsLFuRdCk32/sd5kFV+zbdKKYzXHDqbA2EpUTcJYML7rJhhnmNQSoABfN1hN8HHevGV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L8sdU4rE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L8sdU4rE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB8CC16AAE;
	Wed, 14 Jan 2026 08:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768380388;
	bh=6Ll8Ht/Fca12qE3DQR7uKG2qN0tG9al50MTY6YzyiNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L8sdU4rERV3HgeN+UlGaW74UIy6dT6PzFnFULdYmUw3h6glG7TLZ0xMmHBxbMGAya
	 BtMvNceoDkCBqWebmHnKNpzCfu2kJiiwH7pmT2Z4MuikuQqr2Dk3cNy8s+4udGfAuM
	 tvg2KpunjOy4AoLR4XWNhM0vZ2BYGVFgfTvR5Yz3GMMdn+dMB7yhGJYFU6CM9QLRId
	 8zkx4CfhtvEC5kaZojtbGXL8Su7KYkfvMmiRbG7ByY8XFSdVqLHIsWqMDiiEhGGijT
	 sTm+mc2KKN2fdp33eCsb/ue05x+YL5R/O7nuMIvigqvf8HKQJwiH2fymkIj4KU9y8y
	 yGX+4hNOIRUFA==
Date: Wed, 14 Jan 2026 09:46:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, cylee12@realtek.com, 
	jyanchou@realtek.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, james.tai@realtek.com, cy.huang@realtek.com, 
	stanley_chang@realtek.com
Subject: Re: [PATCH v2 1/9] dt-bindings: clock: Add Realtek RTD1625 Clock &
 Reset Controller
Message-ID: <20260114-nice-quick-salmon-cace2f@quoll>
References: <20260113112333.821-1-eleanor.lin@realtek.com>
 <20260113112333.821-2-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260113112333.821-2-eleanor.lin@realtek.com>

On Tue, Jan 13, 2026 at 07:23:24PM +0800, Yu-Chun Lin wrote:
> Add DT binding schema for Realtek RTD1625 clock and reset controller
> 
> Co-developed-by: Cheng-Yu Lee <cylee12@realtek.com>
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v2:
> - Added missing Co-developed-by tag.
> - Shortened binding description.
> - Updated MAINTAINERS entry (BINDINGS -> DRIVERS).
> - Moved software variables to driver.
> ---
>  .../bindings/clock/realtek,rtd1625-clk.yaml   |  51 ++++++
>  MAINTAINERS                                   |   9 +
>  .../dt-bindings/clock/realtek,rtd1625-clk.h   | 164 ++++++++++++++++++
>  3 files changed, 224 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.yaml
>  create mode 100644 include/dt-bindings/clock/realtek,rtd1625-clk.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.yaml b/Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.yaml
> new file mode 100644
> index 000000000000..26ec7d68b991
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/realtek,rtd1625-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek RTD1625 Clock & Reset Controller
> +
> +maintainers:
> +  - Yu-Chun Lin <eleanor.lin@realtek.com>
> +
> +description: |
> +  The Realtek RTD1625 Clock Controller manages and distributes clock
> +  signals to various controllers and implements a Reset Controller for the
> +  SoC peripherals.
> +
> +  Clocks are referenced by unique identifiers, which are defined as
> +  preprocessor macros in dt-bindings/clock/realtek,rtd1625-clk.h.

Full path needed.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - realtek,rtd1625-crt-clk
> +      - realtek,rtd1625-iso-clk
> +      - realtek,rtd1625-iso-s-clk
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@98000000 {
> +      compatible = "realtek,rtd1625-crt-clk";
> +      reg = <98000000 0x1000>;
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 12f49de7fe03..66c0f4924c1e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21968,6 +21968,15 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/net/dsa/realtek.yaml
>  F:	drivers/net/dsa/realtek/*
>  
> +REALTEK SOC CLOCK AND RESET DRIVERS
> +M:	Cheng-Yu Lee <cylee12@realtek.com>

Just to clarify, because sometimes people add here authors not actual
maintainers, this is a list of active maintainers, so reviewing in
the future will be from both of you.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

