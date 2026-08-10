Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2460D3537E8;
	Mon, 10 Aug 2026 16:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786377679; cv=none; b=c1opM/0BgvNV80PwRn8EMrSZKJJc9TZSJ9/zvu3Q0FYq5IbIparSl0WUa2PJk64wbrv+GIC60mgrsuuCGA3sHLZ/atP8R5TMlfPbKFVUusIoq/mB8v5oitgqi6bCl9Q8QSzsvt1P0IgC3+UU4FzzpIb16JNWbWgNsGuVv+KlhTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786377679; c=relaxed/simple;
	bh=2HSvQ+v6rSRuc/zWnGcrfgCGro7b3aXOD2roSw5bdy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJZqLiCCXIjT9nTf+skI/wUUIkZ7iUDbqiEpxZ7pH7CKvu2yNVa3TWjJWeQBuiGGDDqI//iMhwSJwDZ4SksTFtCL48vN1wQI8BO/TAnMgxayfMP6t2QQ7hXEmEOgqPOhlrqDA9hrtGQsHBf5WAIy1s0Yl6sWMT9/PVh158hzM4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fW8vCksw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fW8vCksw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793231F000E9;
	Mon, 10 Aug 2026 16:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786377677;
	bh=vVmEXGlxyo8HmfxP5o2mLGAutJkJplb4KUoippNL1SM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fW8vCkswnjolX/O4Uyin4HoBMxxz+Pfb9E9JGWLR13Rqrm45COz7bdyzPPMzOIdrB
	 DEzong/+980YhyNyZ9dIagS6fAJ/4/3VjlZr3Q5ewTiDLg/NagkH5JS21UQSCySk0z
	 p6Lptdck3XbkjdztsSvTmpu+w/ixmfPyN4OraxVpmBP0s4SrgtN+DKW61hR5hGW8PN
	 sJ7I1BD4rVEm7s479ktCI4VfhIviRLUqq1JLFtt/eQT84d2e+ar8BRgrcY0vqKrLjG
	 ox8VEUSwqYAgO7wWY7XGdAZVQBe+oEZxYELqnI9InuYIAGL4QjmRSRCwt9GbBhTLBs
	 nDavxorN5yWzA==
Date: Mon, 10 Aug 2026 11:01:13 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: sarath.ganapathiraju@oss.qualcomm.com
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, prasad.kumpatla@oss.qualcomm.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: clock: qcom: Add LPASS VA CSR
 HeartBeat pulse clock
Message-ID: <ann0rJhd0T6x9iLG@baldur>
References: <20260806-master-20260805-sync-v5-0-0ff42e9b6431@oss.qualcomm.com>
 <20260806-master-20260805-sync-v5-1-0ff42e9b6431@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-master-20260805-sync-v5-1-0ff42e9b6431@oss.qualcomm.com>

On Thu, Aug 06, 2026 at 08:21:36PM +0530, Sarath Ganapathiraju via B4 Relay wrote:
> From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> 
> Add a binding for the Qualcomm LPASS VA CSR rate generator node that
> exposes the lpass_heartbeat_pulse clock on hawi.

Hawi is a proper noun, so it should always be written with capital 'H'.

> 
> The HeartBeat Pulse (also known as RateGen Pulse) synchronizes the
> start of the DMAs and Codec Interfaces for the audio usecase and can
> serve as a periodic wakeup source for the DSP.
> 
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,hawi-lpass-va-csr.yaml     | 51 ++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,hawi-lpass-va-csr.yaml b/Documentation/devicetree/bindings/clock/qcom,hawi-lpass-va-csr.yaml
> new file mode 100644
> index 000000000000..9935173d8bee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,hawi-lpass-va-csr.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,hawi-lpass-va-csr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm LPASS VA CSR heartbeat pulse clock provider
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> +  - Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> +
> +description:
> +  The LPASS (Low Power Audio Subsystem) VA CSR block contains a rate
> +  generator that produces a periodic HeartBeat Pulse, also known as
> +  the RateGen Pulse. This pulse synchronizes the start of DMAs and
> +  Codec Interfaces for audio usecases and can serve as a periodic
> +  wakeup source for the DSP.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,hawi-lpass-va-csr
> +
> +  reg:
> +    maxItems: 1
> +    description: Address and size of the rate generator registers within
> +      the VA CSR block.
> +
> +  "#clock-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      clock-controller@7eed000 {
> +        compatible = "qcom,hawi-lpass-va-csr";
> +        reg = <0x0 0x07eed000 0x0 0x14>;

The two 0x0 cells are just there in the normal dtsi because we need
address- and size-cells of 2. But you don't need that in your example.

If you change this to <0x07eed000 0x14> you can drop the
address/size-cells and the whole soc {} level from the example.


That said, is this really a 20 byte large IP-block? Or is this part of
some larger function? Will we have overlapping/conflicting mappings of
this block?

Regards,
Bjorn

> +        #clock-cells = <0>;
> +      };
> +    };
> 
> -- 
> 2.34.1
> 
> 
