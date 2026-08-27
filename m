Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC4440EB91;
	Thu, 27 Aug 2026 09:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787824343; cv=none; b=gJ+Fl+HrtcUxaI0WcV4II96qQlGDTHaaPc091eICqvL8xB2E1zSaZl6Bxbz+EFmjHUtbW2PBPSJO52AgIR09kkOi67BmrWiwQ6Mqv524WcCP6VLTL3rLQecUoYvYt5Hm/6tCpmnd8heNNaaq1DBhIEaF3NTUIpndypwMLClqFXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787824343; c=relaxed/simple;
	bh=HksSdvlUfR7hhbe5RrJY19bzCuQihgkb3cxoVmjocPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qFbiYD4vccwNVRjgbYFbV8T2C6ajnwc+f/jBHyVqmBCywxW9R6qDRvqxrI9IMAgUXMr9bpVB0ACPoya0gArrReMH5+9M0aWlt/fFYrANASQVgJ08xehQ0oYPAxG9vYBqCQxNcKmlI+BUEg31xC6bfNNW2YlEcCr1j8oqEqQzVLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BleKSS4F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BleKSS4F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286691F000E9;
	Thu, 27 Aug 2026 09:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787824337;
	bh=drbRyLN3wK3pHMtqRBM9QPBa4lVPgiYhMn2XsBFKhVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BleKSS4FCkM0Tax5Dkf4TbR1GRkKocoGCvIBzlqjuRWJYl2OIoC2yBepgWxZN1VCd
	 7uaRkzx1ResP867m2urRoXymgI2DMHoT+vfbdJ8pXqsnCzjvaUMZlGHW1caJzwMjsQ
	 5iykDOOAnhMoKSIXryOUXF9wCnpG0rDgqdqazKm8xSwU0XW4CCJxyiLfdDcE90xcA7
	 NmALUe70Q+NFq/XM4p7KFr7FyjYkp4giZmhHjWtOuxW8eqij7aokXgU4qIVLBf732e
	 Gpb3a6SFS855FXEWN6+jyPccFXklHYhFls/hDnIW7dHU0PRBNyNzlmX/NcWIXc7Zw0
	 hIMx8prGtl63g==
Date: Thu, 27 Aug 2026 11:52:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: clock: airoha: Document support for
 AN7583 clock
Message-ID: <20260827-expert-ruby-grasshopper-954aa2@quoll>
References: <20260819221458.30040-1-ansuelsmth@gmail.com>
 <20260819221458.30040-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260819221458.30040-2-ansuelsmth@gmail.com>

On Thu, Aug 20, 2026 at 12:14:54AM +0200, Christian Marangi wrote:
> Document support for Airoha AN7583 clock. This is based on the EN7523
> clock schema with the new requirement of the "airoha,chip-scu".
> 
> Add additional binding for additional clock and reset lines.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/clock/airoha,en7523-scu.yaml     | 20 ++++++
>  include/dt-bindings/clock/en7523-clk.h        |  3 +
>  .../dt-bindings/reset/airoha,an7583-reset.h   | 65 +++++++++++++++++++
>  3 files changed, 88 insertions(+)
>  create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> index eb24a5687639..edecc635807b 100644
> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> @@ -30,6 +30,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - airoha,an7583-scu
>            - airoha,en7523-scu
>            - airoha,en7581-scu
>            - econet,en751221-scu
> @@ -50,12 +51,30 @@ properties:
>      description: ID of the controller reset line
>      const: 1
>  
> +  airoha,chip-scu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the Chip SCU providing the registers required
> +      for configuring the PCIe related clocks and resets.

This is the clock provider. Clock provider should not be accessing
registers of other device to configure its clocks. Either you
misrepresented clock hierarchy or devices.

I did search for DTS to try to understand the big pictuer - nothing, no
results, no upstream submission to Linux kernel.

Best regards,
Krzysztof

