Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECF13CF670;
	Thu, 30 Jul 2026 08:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785400479; cv=none; b=rJe38j+7+/8LCZr15KX1WK0MM1yOoANaR3GaenKfiNYPLZeFwDLF8+nEiOh5uu+6LA2fZSD+oflfvcIZdiW1QLSqOPJ98IvYQci6aUg9dM99IIm/6+l9sbk4cyu/3Ys3G4Pjy95eajQ9y7Q2q5bUG/1UClL6GVn0A9/fqVn3TXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785400479; c=relaxed/simple;
	bh=De0gQlELGrLm32l2TpJstemPd5DiPvzZcCrDG5s1Zj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NU4gQAodo+QwA8YzvA+bQIFY8dq3I/gK7U70fnvhFhqkNeukz8ORqbUZQkHnu0nRrjYKbgUdttBLcNpRP8O9CoPncOcAhNIv/1eBu6wZS1IT2xlmtB7yNQRjMGziFrT1lZLDkYj7R28fH1KCPWUvRLeI/m+58e/KvMWJI9qutpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRvIBjW/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HRvIBjW/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8CF1F000E9;
	Thu, 30 Jul 2026 08:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785400474;
	bh=9vZEGCpRAyQ1lYwDLn0Kz7DAWtHYOLS6RlF/eTt/9pI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HRvIBjW/Z3cwoSoJao1pDIOuvORcw2OJylnuO/y2qbAT7dEafDOdeDDdu65xicPiv
	 BLj9+la1KZZMsvYVUeKixIR1Ef10sGtK4uv1rtnB8UxsJY7H5twlwXvUnZssYvvhWn
	 pHekOqRdzG/rQSFmvSz+WHsJW6FLNdR6WXnlFZ07OX+jTuO5+7k07zcdHZqYFgWtZy
	 vsePlrBK1YJqosRovbBqNMMiuzc2pYqLzxuygf3NH1oa6Oar6FWju47i9vg4LPreRI
	 YlSglDMMzba55UvouH7jQPbP+u6K1LUfIB6Hw3i83Ms2IKQ5z4fcT2EcTTW9TI+Yty
	 D8IdbDrcyDwcA==
Date: Thu, 30 Jul 2026 10:34:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
Cc: sboyd@kernel.org, andersson@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, robh@kernel.org, mturquette@baylibre.com, 
	mike.tipton@oss.qualcomm.com, linux-clk@vger.kernel.org, konrad.dybcio@oss.qualcomm.com, 
	linux-kernel@vger.kernel.org, taniya.das@oss.qualcomm.com, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add Hawi GPU clock
 controllers
Message-ID: <20260730-sapphire-mackerel-of-fertility-c0e3da@quoll>
References: <20260726-gpucc-hawi-v1-0-224e7884cf9a@oss.qualcomm.com>
 <20260726-gpucc-hawi-v1-1-224e7884cf9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260726-gpucc-hawi-v1-1-224e7884cf9a@oss.qualcomm.com>

On Sun, Jul 26, 2026 at 10:49:53PM -0700, Dongfang Zhao wrote:
> Add the device tree binding and clock, reset and power-domain IDs for the
> Hawi graphics clock controller. This lets Hawi device trees describe the
> GPU clocks, resets and power domains, and lets dtbs_check validate those
> nodes.
> 
> Add the qcom,hawi-gxclkctl compatible for the Hawi GX clock controller,
> using qcom,kaanapali-gxclkctl as the fallback because the register layout
> is identical.
> 
> Signed-off-by: Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,hawi-gpucc.yaml | 78 ++++++++++++++++++++++
>  .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    | 22 +++---
>  include/dt-bindings/clock/qcom,hawi-gpucc.h        | 47 +++++++++++++
>  3 files changed, 139 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,hawi-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,hawi-gpucc.yaml
> new file mode 100644
> index 000000000000..3ba6e4d212ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,hawi-gpucc.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,hawi-gpucc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Graphics Clock & Reset Controller on Hawi
> +
> +maintainers:
> +  - Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
> +
> +description: |
> +  Qualcomm graphics clock control module provides the clocks, resets and power
> +  domains on Qualcomm SoCs.
> +
> +  See also: include/dt-bindings/clock/qcom,hawi-gpucc.h
> +
> +properties:
> +  compatible:
> +    const: qcom,hawi-gpucc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: GPLL0 main branch source
> +      - description: GPLL0 div branch source
> +
> +  power-domains:
> +    items:
> +      - description: A phandle to the CX power-domain
> +      - description: A phandle to the MX power-domain

First MX, then CX, to keep with existing GPUCC.

> +      - description: A phandle to the GMXC power-domain
> +
> +  required-opps:
> +    items:
> +      - description: A phandle to an OPP node describing CX performance points
> +      - description: A phandle to an OPP node describing MX performance points

Same here and: s/A phandle to an OPP node describing//

> +      - description: A phandle to an OPP node describing GMXC performance points
> +
> +required:
> +  - compatible
> +  - clocks
> +  - power-domains
> +  - required-opps
> +  - '#power-domain-cells'

Best regards,
Krzysztof

