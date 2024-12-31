Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95987346D;
	Tue, 31 Dec 2024 08:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735633049; cv=none; b=GCLqVMB+OUaOHpCGXzsd56QgGuCH/jSoBP0IHiH5Lup6hwFJRNhY6BdMaKgPdHBb9STQuAGMmoCFNHHRhQ4dHbufk1NAJeU+PODVO6Szeklf/iGHW0GBoQgbIuDI96TIHuJ/8nZOCPvDnkQbMykj5zzRD5MZODMY7JDPzwyq/qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735633049; c=relaxed/simple;
	bh=kbMTbTtbxHLpkGNlEYFpF04MyVp36hZw1CCgo9MGAjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fCqeot7AJoA83aoEQWPQkfK+Gnm/t9P+DQTCKU7mJQ7W72ly2EBHaFwuMEDQ4zPgD0aAr3qp88gL2vz8qpXWiLZC7TCukPcgsTh0xI2qSkZWNBhDl/1BexaQJ1BnSXKt0gdjLBFIwECIF9uIk81NuXk1As/MEaEWaHxBv5SZUCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8TjVJfH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8TjVJfH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1187AC4CED6;
	Tue, 31 Dec 2024 08:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735633047;
	bh=kbMTbTtbxHLpkGNlEYFpF04MyVp36hZw1CCgo9MGAjg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C8TjVJfHTXWwoYFWmypZnLSa6eTGKnvE+bOxER5AfHqKg++0WF309n5ZdINPwfVi3
	 5mKf+LXtYTym66EneicdH1UYo/WX671+V16zTnVV85j1svMSryDiQ2ybhnZTUc4UZ8
	 2iS5YyO1kUaq7U70jWWT90ybbFMFoOpEmv8z6SFvieCNLAfyQvdzojwbGSanysI9AC
	 4qycU9w+hFDK3IDKRXXsRlASydheL7p5B9TOdebxCDAyjo6XhFg3R0F0WAsrEREhpy
	 Y7MRBONfBz6iS5Vn/TQnJWAiYZc2AsJIZdgPRPXlICA2aK5/GSQKYpEy4qN+VG1end
	 wmvRm4DvllvMQ==
Message-ID: <8f662cd8-19cf-4ae3-8cb6-668781eebb4b@kernel.org>
Date: Tue, 31 Dec 2024 09:17:22 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-binding: clock: cs2600: Add support for the
 CS2600
To: Paul Handrigan <paulha@opensource.cirrus.com>, linux-clk@vger.kernel.org,
 sboyd@kernel.org, mturquette@baylibre.com, devicetree@vger.kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
Cc: patches@opensource.cirrus.com
References: <20241230221246.3927158-1-paulha@opensource.cirrus.com>
 <20241230221246.3927158-2-paulha@opensource.cirrus.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241230221246.3927158-2-paulha@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/12/2024 23:12, Paul Handrigan wrote:
> Add device tree support for the Cirrus Logic CS2600 clock
> device.
> 
> Signed-off-by: Paul Handrigan <paulha@opensource.cirrus.com>

I was wondering why this is not picked up by my filters... now I now:
wrong subject prefix. It's dt-bindings.

> ---
>  .../bindings/clock/cirrus,cs2600.yaml         | 99 +++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
> new file mode 100644
> index 000000000000..c6f216e45791
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/cirrus,cs2600.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cirrus Logic Fractional-N Clock Synthesizer & Clock Multiplier
> +
> +maintainers:
> +  - Paul Handrigan <paulha@opensource.cirrus.com>
> +  - patches@opensource.cirrus.com>
> +
> +description:
> +  The CS2600 is a system-clocking device that enables frequency synthesis and
> +  clock generation from a stable timing reference clock. The device can
> +  generate low-jitter clocks from a noisy clock reference at frequencies
> +  as low as 50 Hz. The device has two potental clock inputs (xti and clk_in)
> +  where xti can either be a crystal or a constant refclk and the clk_in. The
> +  device can have either xti, clk_in, or both as a clock input depending on
> +  the usecase. It also has three possible outputs CLK_OUT, BCLK_OUT, and
> +  FSYNC_OUT.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cirrus,cs2600
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2

This does not match clock-names. Missing minItems. I already commented
on this last time. Implement all comments I asked for.

> +
> +  clock-names:
> +    items:
> +      enum:
> +        - xti
> +        - clk_in
> +    minItems: 1
> +    maxItems: 2
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  vdd-supply:
> +    description: Power Supply
> +
> +  clock-output-names:
> +    maxItems: 3
> +    description: Names for CLK_OUT, BCLK_OUT and FSYNC_OUT clocks.
> +
> +  cirrus,aux-output-source:
> +    description:
> +      Specifies the function of the auxiliary output pin with "phase_unlock"
> +      to indicate the input and output clocks are not in phase, "freq_unlock"
> +      to indicate the PLL is unlocked, and "no_clkin" to indicate the clock on
> +      the clk_in pin is not present.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum:
> +      - phase_unock # Sets output pin to indicate PHASE_UNLOCK
> +      - freq_unlock # Sets output pin to indicate FREQ_UNLOCK
> +      - no_clkin # Sets output pin to indicate NO_CLKIN

Drop comments, you just repeated the value. If you want to add comment,
say something different than the value is saying.


Best regards,
Krzysztof
