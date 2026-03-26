Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ED6333439;
	Thu, 26 Mar 2026 07:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774510410; cv=none; b=GNI+2BQFIqUeMvmYRAsYnCyKZpexmB3p8MlzwhIENvtuc+zKFuvtck+4rqw63T56oHP8SZf7wU0vF8FtoITJB8KVhwaQP2XvTX3LJJdeyvmmRo3S9qdQc2+Y02/JrxBiKUOS105ikmofCvcEdk66U7cixkeEx4u23RvTHsfw8hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774510410; c=relaxed/simple;
	bh=vKu/5H10rhdAPVui5WZj9IHM8sTyiXH3kOdeAaLHtng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAFn9xGWvtZ/vuKKzPQabP/u71UJAcSuACNYepngu3IYhdT9+LX6aeAecUmsn2573mBVL7kncVUuCrRvxnj0Tu7JnXLzznBWGaMuxdKJAL96m3NudrC4srybM5Daj/1lT+dKB9798L02zXDYwhrZmu64wdW5qNH0lcNOSAfrJ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mnGjesEU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mnGjesEU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA35DC116C6;
	Thu, 26 Mar 2026 07:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774510410;
	bh=vKu/5H10rhdAPVui5WZj9IHM8sTyiXH3kOdeAaLHtng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mnGjesEUZ8w47cpjwFazrR3Kl/k/ON8Wmq+x+MszIGA/nI/oNIyv8C3QCJR3/wXnp
	 WU0JYDdS3aiQFL+Si2rzc90Fm5YWa8YDkOsh86wEV/+13v2is/S5R3N0UAXNlKko4Q
	 KRDMH783yTRGclCiLSSOs3b1l8xHpeV6eFtAsv7raYqGZ+Qv3ifJNWMHghpEBethSi
	 767egn+PxlKjgb+jzPZ8jMo32WQgRH04y44o4s+BINQb+a9rHop93t4g++DFO9vjYn
	 DbKIKR3kTr33dCH52XRj+2cyqGEtxk4Q27OtNQ3eRNFQCPYS1uL38lxoHZ4Hb2982D
	 osbr8h/GEsOdQ==
Date: Thu, 26 Mar 2026 08:33:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v11 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
Message-ID: <20260326-curly-loose-silkworm-283a3f@quoll>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-1-5b93415be6dd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-1-5b93415be6dd@linaro.org>

On Thu, Mar 26, 2026 at 01:28:29AM +0000, Bryan O'Donoghue wrote:
> Add optional PHY handle definitions. This will allow for supporting both
> legacy PHY definitions as well as supporting the optional new handle based
> approach.
> 
> Drop the legacy high-level 0p8 and 1p2 supplies as required, each PHY has
> its own individual rails. The old binding is still valid but with
> individual nodes we define the rails in the CSIPHY sub-nodes.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/media/qcom,x1e80100-camss.yaml        | 33 ++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 2d1662ef522b7..c17b9757b2c86 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -39,6 +39,14 @@ properties:
>        - const: vfe_lite0
>        - const: vfe_lite1
>  
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2
> +
> +  ranges: true
> +
>    clocks:
>      maxItems: 29
>  
> @@ -126,6 +134,16 @@ properties:
>      description:
>        1.2V supply to a PHY.
>  
> +  phys:
> +    maxItems: 4
> +
> +  phy-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy4
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
> @@ -158,6 +176,14 @@ properties:
>              required:
>                - data-lanes
>  
> +patternProperties:
> +  "^phy@[0-9a-f]+$":

Use consistent quotes, either " or '

> +    $ref: /schemas/phy/qcom,x1e80100-csi2-phy.yaml
> +    unevaluatedProperties: false
> +
> +  "^opp-table(-.*)?$":

Look at other code - this is just opp-table in properties.

> +    type: object
> +
>  required:
>    - compatible
>    - reg
> @@ -171,8 +197,6 @@ required:
>    - iommus
>    - power-domains
>    - power-domain-names
> -  - vdd-csiphy-0p8-supply
> -  - vdd-csiphy-1p2-supply
>    - ports
>  
>  additionalProperties: false
> @@ -184,6 +208,7 @@ examples:
>      #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>      #include <dt-bindings/interconnect/qcom,icc.h>
>      #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
> +    #include <dt-bindings/phy/phy.h>

Unused?

>      #include <dt-bindings/power/qcom-rpmpd.h>
>  
>      soc {
> @@ -229,6 +254,10 @@ examples:
>                          "vfe_lite0",
>                          "vfe_lite1";
>  
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +            ranges;

opp-table, phys, phy-names and further also child node.


Best regards,
Krzysztof

