Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5102264C7;
	Mon,  3 Aug 2026 21:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785793862; cv=none; b=MjyQN/c7f1PYLQR5xnI8FxJ8h/Z51A/RUMjll75pChsagShALFJUozHDLwX42Em5Oc6rHwi35uyswVKRfRqaVLmp1waQSd5PcltMUX856PAcACctLRxy8ckx0Yan30MssWVqky3LQtCfBysKk6uVHsa8Z05A4ZzCv6XOAzhsZKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785793862; c=relaxed/simple;
	bh=zpHQ0icqyDBjgiK1oDNMGEjpggztPui8Qra0SOdy7BE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/NoRtlmF0KGNXagZ/wblu+OlT4bhSg4W3ThQgNNStOzhD1MKzH6GqhvyHKLBXby4JoSs9lH4kP8I3p8HXA3VZW1LyReZJEy3viHAYBSu0sQkdW6DPq1Xx5YA2euJU4fhccOvSwdeoVF0F5NhwXlFtWptZ7FwJNfKmzGxtAqggQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oSeCpLWa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oSeCpLWa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14F7C1F000E9;
	Mon,  3 Aug 2026 21:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785793860;
	bh=CYVTO77JKdixFTwe5auLV+AQitaj1TKmfvI7QlU3U18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oSeCpLWa9LLSKWMX90sLvZWRaqXGHaa3Yqazrcd/Cyj3Fvrs+iXjOQKcJAYSdbWci
	 S+ZwRk8YPLFcn0MBAQYxkRbRnYOA+3nLAp0lA5ps/F1gIxbG5xNukzg4cTgjcQhQWM
	 IKYEcYDKBL4BGmub+MjlYQ/0jGnsnG/aLilyroIVTDiebJEly8DvdneFv8C4f/oybu
	 CCw0sa8yTUyoVdcVMnxv48mp7rRVjnbq/su4kt2xRiMnpm13ULBM9ZVcFkax9GLceD
	 IEQxaOPAmrMK5ojOcBjG/zpVk3dnNl9LmA9nhRJNb3kE3zoIi0CznXJQ1m0YjWj20l
	 jFnpVQSm/DEMQ==
Date: Mon, 3 Aug 2026 16:50:59 -0500
From: Rob Herring <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com,
	simona.toaca@nxp.com
Subject: Re: [PATCH] dt-bindings: clock: ti,DM814x-ADPLL: Convert to DT schema
Message-ID: <20260803215059.GA638187-robh@kernel.org>
References: <20260726-ti-adpll-v1-1-86f6fc936507@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726-ti-adpll-v1-1-86f6fc936507@gmail.com>

On Sun, Jul 26, 2026 at 12:17:47AM +0530, Bhargav Joshi wrote:
> Convert the Texas Instruments DM814x ADPLL clock binding to DT schema
> format. Add 'clock-output-names' as required which was missing in
> legacy binding, as the driver (clk-adpll.c) mandates it and fails
> probing if it is missing.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../devicetree/bindings/clock/ti/adpll.txt         |  39 --------
>  .../bindings/clock/ti/ti,dm814-adpll-clock.yaml    | 108 +++++++++++++++++++++
>  2 files changed, 108 insertions(+), 39 deletions(-)

> diff --git a/Documentation/devicetree/bindings/clock/ti/ti,dm814-adpll-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,dm814-adpll-clock.yaml
> new file mode 100644
> index 000000000000..7f551dfca030
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti/ti,dm814-adpll-clock.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/ti/ti,dm814-adpll-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments DM814x ADPLL Clock
> +
> +maintainers:
> +  - Tony Lindgren <tony@atomide.com>
> +
> +description:
> +  The ADPLL is a register-mapped clock generator found on TI DM814x SoCs. It
> +  provides multiple output clocks from two or three selectable input clocks and
> +  three to four children.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,dm814-adpll-s-clock
> +      - ti,dm814-adpll-lj-clock
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 3
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 3
> +
> +  clock-output-names:
> +    minItems: 3
> +    maxItems: 4
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +  - clocks
> +  - clock-output-names
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: ti,dm814-adpll-s-clock
> +then:
> +  properties:
> +    clocks:
> +      minItems: 3
> +    clock-names:
> +      items:
> +        - const: clkinp
> +        - const: clkinpulow
> +        - const: clkinphif

This can move to the top level and just 'minItems: 3' here.

> +    clock-output-names:
> +      items:
> +        - description: dcoclkldo
> +        - description: clkout
> +        - description: clkoutx2
> +        - description: clkouthif

You don't have to document the clock-output-names.

> +else:
> +  properties:
> +    clocks:
> +      maxItems: 2
> +    clock-names:
> +      items:
> +        - const: clkinp
> +        - const: clkinpulow

And just 'maxItems: 2' here.

> +    clock-output-names:
> +      items:
> +        - description: dcoclkldo
> +        - description: clkout
> +        - description: clkoutldo

And drop. Or maybe just 'maxItems: 3'

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    adpll@40 {
> +        compatible = "ti,dm814-adpll-s-clock";
> +        reg = <0x40 0x40>;
> +        #clock-cells = <1>;
> +        clocks = <&devosc_ck &devosc_ck &devosc_ck>;
> +        clock-names = "clkinp", "clkinpulow", "clkinphif";
> +        clock-output-names = "481c5040.adpll.dcoclkldo",
> +                             "481c5040.adpll.clkout",
> +                             "481c5040.adpll.clkoutx2",
> +                             "481c5040.adpll.clkouthif";
> +    };
> +
> +  - |
> +    adpll@80 {
> +        compatible = "ti,dm814-adpll-lj-clock";
> +        reg = <0x80 0x30>;
> +        #clock-cells = <1>;
> +        clocks = <&devosc_ck &devosc_ck>;
> +        clock-names = "clkinp", "clkinpulow";
> +        clock-output-names = "481c5080.adpll.dcoclkldo",
> +                             "481c5080.adpll.clkout",
> +                             "481c5080.adpll.clkoutldo";
> +    };

One example is enough.
