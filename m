Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934462222CC;
	Wed,  1 Jul 2026 06:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782888538; cv=none; b=E6+3EphH2zdk43EYkgtZ03r4eUvi0Yz1mBlbwa5h2JcPSV9ecfNxeoyfIIddts8/rhGmfPuQSnFrFdAmKlISvxF+c+VQzQDTnLwqJQnKC9A78Iv+FhXRB9Wz5doC+DfpbR3yT+ldatKoBhZw4oDroF8UgkqhXxGAHIbXBYV3vr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782888538; c=relaxed/simple;
	bh=O8ok//vkUpJ8IC0w58gonWcEwAQiZ3Sr18Cml5A6zN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jigstR1j44Y9+niNLLA1fMwA/9tN8E80XmuCQSKKiaMzX62576Kw132TxAZuQ7QTDBOEF6SVSyxAsqj7abYi86NL++Bc2kB916Z5jzo0FllBTsebJWKetbfro+cWZIf8MaKO3CGyfNz6GlUSc+KQvCKT8y41EPeFaSYfsxAl9aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c2VoM09+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c2VoM09+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153F91F000E9;
	Wed,  1 Jul 2026 06:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782888537;
	bh=qqxjSfdNptRpMmnYEFCOxj743R+/l3YLArLI7MNlECg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c2VoM09+A49PImIpp8iIVPTzA7pRP8dBNVaXjrbkPsCv1QLkjb338Us4egdCxuyyF
	 yxcut5idanoVL0t1ozdHhAIhZK1y3hsR/RyWI7COiXg7Eg3plu8YN9Tl6irKEmwyH4
	 2ylYeq4MvW4z9kpews/s1XXcJHZprIRdMNZPL4BZfnF6BJl3dLr6aY0bMlZ4JvXKw8
	 hkFS1FVX0PyvtHvsT3HlnKPN6tqR9cgCsB/Mr/9pdsAYfVHw36V7ARrNoWUYPxmNLD
	 kZa4csVVZY9DKokf2pcSsTpODUEDF52STT6lN4VvXOM5t9ZqdKMaVMKXXBm8iU9pho
	 NV3U2ulcZtskQ==
Date: Wed, 1 Jul 2026 08:48:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com
Subject: Re: [PATCH v6 1/3] dt-bindings: clock: cs2600: Add support for the
 CS2600
Message-ID: <20260701-optimal-honest-earthworm-db18cf@quoll>
References: <20260630155549.824059-1-rf@opensource.cirrus.com>
 <20260630155549.824059-2-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630155549.824059-2-rf@opensource.cirrus.com>

On Tue, Jun 30, 2026 at 04:55:47PM +0100, Richard Fitzgerald wrote:
> From: Paul Handrigan <paulha@opensource.cirrus.com>
> 
> Add device tree schema for the Cirrus Logic CS2600 clock generator.
> 
> The majority of the schema is typical clock, power and I2C
> properties.
> 
> Passes dt_binding_check:
> make dt_binding_check DT_SCHEMA_FILES=clock/cirrus,cs2600.yaml
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>   CHKDT   ./Documentation/devicetree/bindings
>   LINT    ./Documentation/devicetree/bindings
>   STYLE   ./Documentation/devicetree/bindings
>   DTEX    Documentation/devicetree/bindings/clock/cirrus,cs2600.example.dts
>   DTC [C] Documentation/devicetree/bindings/clock/cirrus,cs2600.example.dtb

Why is this in the commit msg? What is its purpose? Do you see any of
this in any commits?


> 
> Signed-off-by: Paul Handrigan <paulha@opensource.cirrus.com>
> Co-developed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
> 
> Changes in V6:
> - Fixed clock naming in descriptions to match datasheet.
> - Fixed clock-names property values to match datasheet names.
> 
> - Added cirrus,internal-oscillator boolean to flag that the internal
>   oscillator is the clock source. Previously the driver inferred this
>   if clock-names did not contain "ref_clk_in", but this made it difficult
>   to enforce dts correctness because there was no way to tell whether
>   ref_clk_in was intentionally or accidentally missing.
> 
> - Changed the cirrus,clock-mode enum property into two booleans, since
>   effectively it was two separate features masquerading as an enum:
>   - cirrus,smart-mode present to enable smart mode.
>   - cirrus,smart-mode-clkin-only to enable a feature where the output will
>     be suppressed until both input clocks are present.
> 
> - Changes to cirrus,aux-output-source property:
>     - Renamed to cirrus,aux1-output-source because it's for the AUX1 pin.
>     - Added more options.
>     - Renamed the "no_clkin" option to "clkin_missing".
>     - Reformatted the description as a list instead of one long sentence.
> 
> - Changed clock-names from an enum to an ordered list of const.
>   This implicitly ensures ref_clk_in is always required.
> 
> - Added properties to invert bclk and fsync outputs.
> - Added property cirrus,fsync-duty-cycles.
> - Added #clock-cells and vdd-supply to the list of required properies.
> - Rewritten description description section.
> - Reordered the property list to put common properties before custom
>   cirrus properties.
> - Added more examples.
> - Added header file to define the clock indexes for DT consumers of the
>   CS2600 clocks.
> 
>  Note:
>  V5 was Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>  but I haven't carried this forward because the changes in V6 are large.

Dropping my tag is right thing to do, but making significant changes to
hardware at v6 is very odd. Bindings represent here the hardware, so how
is that v5 had one view of hardware and the next revision rewrites it
completely.

Probably answer - v5 was heavily incomplete - but we do ask to make it
complete in the first place (see writing bindings), so all my previous
review was waste of time.

This will wait for review.

> +examples:
> +  - |
> +    /* Smart mode */
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      clock-controller@2c {
> +        compatible = "cirrus,cs2600";
> +        reg = <0x2c>;
> +        #clock-cells = <1>;
> +        clocks = <&xtl_clk>, <&sync_clock>;
> +        clock-names = "ref_clk_in", "clk_in";
> +        vdd-supply = <&vreg>;
> +        cirrus,smart-mode;
> +      };
> +    };
> +

Two examples max.

Best regards,
Krzysztof

