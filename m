Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB5E346E4E;
	Fri,  5 Jun 2026 09:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780651469; cv=none; b=czCy+0PotyHxAGqXRfkXLNjpnH0pePXOYGuqNktyCVO/pdypIwy0Fqw3LJQgkA3bri4JluPv93Kscpr16628UPwwWwU7tGrXnFu+oyOYIruWbXxOp0whiRi0zzvZGZLDxBiB/iFE4ZFBNZxXkzXLDVHNcVBacUwfbg/8bDBuDWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780651469; c=relaxed/simple;
	bh=gM2UWa7/uzeOvrvC001j48atEJd8OHs/yz8Mk+Xx3P8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lUOelR43b5Y7vNKAFUwwjUDYvDk2Z0sZtwdjP2AOGMZgs01Cd52Ot8xJ6J8/sKRAV9/MQGclMZSGXsLuS+IuMCKYRZx3nI4HoNFgkMYgBNB18IPh166qggSJSg3whsuIV5OHLrYaguVn/cnhmWlV18CbJ7qnybBeiYDOkJksGeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=osK+X5j9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="osK+X5j9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E411A1F00893;
	Fri,  5 Jun 2026 09:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780651468;
	bh=kgp+/h4QmDMqtLCE1Y/k0cVkhXW2cBE4H6XqM6EAxrQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=osK+X5j9wl/8jlopXvzZEshpgKE7tl/vlNHdFLMt3jRVXUwb1QD9liFa1VbmqN/y4
	 uH/GsW1o/KKHGxWyay9NXrQiSVzAUq0+RMfTsc6fOPv8wj0GEZIPn714C2GA8GEAhE
	 YKmG/C0bQpPQ4N6L0+okdFS5UKMD340S/+JYtG821P5+wVt3qVquY7DxPeA3n2ZU6V
	 k83M0QaCM2WKeCYlSc+2nhJ1GvotyZ9fzc4nfBD49sz7hOYqHIxXGYJgz+wvKLhnDm
	 2SMx6KExhKDJ/VlUXFMLM0xFeOhgjzOOaBogjaHVyqxrhNEc5K5pkdJj1LtlWHq9zD
	 Z4hH5o6fkAE4Q==
Message-ID: <6c87641d-d505-44ff-a994-eeabf55f4c73@kernel.org>
Date: Fri, 5 Jun 2026 11:24:21 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] dt-bindings: clock: cix,sky1-audss-clock: add
 audss clock controller
To: joakim.zhang@cixtech.com, mturquette@baylibre.com, sboyd@kernel.org,
 bmasney@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, gary.yang@cixtech.com
Cc: cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260605032225.523669-1-joakim.zhang@cixtech.com>
 <20260605032225.523669-4-joakim.zhang@cixtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260605032225.523669-4-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/06/2026 05:22, joakim.zhang@cixtech.com wrote:
> +description: |
> +  Clock provider for the Cix Sky1 audio subsystem (AUDSS).
> +
> +  This node is a child of a cix,sky1-audss-system-control MFD/syscon node
> +  (see cix,sky1-system-control.yaml). It does not have a reg property; clock
> +  mux, divider and gate fields are accessed through the parent register block.
> +
> +  Software reset lines for AUDSS blocks are exposed on the parent syscon via
> +  #reset-cells. Reset indices are defined in
> +  include/dt-bindings/reset/cix,sky1-audss-system-control.h.
> +
> +  Six SoC-level reference clocks listed in clocks/clock-names feed the AUDSS
> +  clock tree. The provider exposes the internal AUDSS clocks to other devices
> +  via #clock-cells; indices are defined in cix,sky1-audss.h.
> +
> +properties:
> +  compatible:
> +    const: cix,sky1-audss-clock
> +
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      Clock indices are defined in include/dt-bindings/clock/cix,sky1-audss.h.
> +
> +  clocks:
> +    minItems: 6

Drop

> +    maxItems: 6
> +    description:
> +      Six SoC-level audio reference clocks that feed the audio subsystem,
> +      in the same order as clock-names.
> +
> +  clock-names:
> +    items:
> +      - const: audio_clk0
> +      - const: audio_clk1
> +      - const: audio_clk2
> +      - const: audio_clk3
> +      - const: audio_clk4
> +      - const: audio_clk5

Pretty pointless names. Names matching indexes have no benefits, drop
all of them and instead list items in "clocks" with description.

> +
> +  resets:
> +    maxItems: 1
> +    description: Audio subsystem NoC (or bus) reset line.
> +
> +  power-domains:
> +    maxItems: 1
> +    description: Audio subsystem power domain.

So the clock part has power domain but reset part does not? This is odd.
Especially that parent is audss (right?) and here you describe that this
is audss poer domain.

Same question about resets.

> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> +  - clocks
> +  - clock-names
> +  - resets
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/cix,sky1.h>
> +    #include <dt-bindings/reset/cix,sky1-audss-system-control.h>
> +    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
> +
> +    audss_syscon: system-controller@7110000 {
> +        compatible = "cix,sky1-audss-system-control", "simple-mfd", "syscon";
> +        reg = <0x7110000 0x10000>;
> +        #reset-cells = <1>;

Drop parent node.

> +
> +        audss_clk: clock-controller {
> +            compatible = "cix,sky1-audss-clock";
> +            power-domains = <&smc_devpd 0>;
> +            #clock-cells = <1>;
> +            clocks = <&scmi_clk CLK_TREE_AUDIO_CLK0>, <&scmi_clk CLK_TREE_AUDIO_CLK1>,
> +                     <&scmi_clk CLK_TREE_AUDIO_CLK2>, <&scmi_clk CLK_TREE_AUDIO_CLK3>,
> +                     <&scmi_clk CLK_TREE_AUDIO_CLK4>, <&scmi_clk CLK_TREE_AUDIO_CLK5>;
> +            clock-names = "audio_clk0", "audio_clk1", "audio_clk2",
> +                          "audio_clk3", "audio_clk4", "audio_clk5";
> +            resets = <&src SKY1_AUDIO_HIFI5_NOC_RESET_N>;
> +        };
> +    };



> +#define CLK_MCLK4		40
> +
> +#define AUDSS_MAX_CLKS		41

Drop


Best regards,
Krzysztof
