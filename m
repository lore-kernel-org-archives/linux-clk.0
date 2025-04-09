Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F31323A562
	for <linux-clk@vger.kernel.org>; Wed,  9 Apr 2025 08:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744187918; cv=none; b=fI/8HrgkLb5jN/s5385F7pxy1oQCHzdTO09d7jv+FosibflIQxZiOi6f+WCScIV1oeoHfXMHuGEvdfkqgxNTpBDiqct/xyl/+LeXR3ja4fcqJew6Z6G8aD/xcpZysNI0AqRsSvF0jdOFwSVmwwm/fk+SYKdhkEii9jlY7ClnAMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744187918; c=relaxed/simple;
	bh=4d7r93CFGXUsgYwAKRgAOyiDxMOHLB27bOOTVYjroZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rK6kSzCJzkMmi4nO1iq4BlNeGNFED9jkbnUXbJy7RgZuiQEwAAg500ORIGZn9O/xzNiavOuweGX5T2DtqwQFKKGtU6Z86OkJlWOd8FavZe6aFEEJ2gxPhxba94CXlgto6+eQ6IfmMwydoqdDC5IygXSgHZgs701xI7/dsUvfmQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VdOCdPAx; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VdOCdPAx"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2254e0b4b79so81101075ad.2
        for <linux-clk@vger.kernel.org>; Wed, 09 Apr 2025 01:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744187916; x=1744792716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PMDTcY+QSM6bxbtbqX/RPBUWVkAI5eV/38uSVpSo7Us=;
        b=VdOCdPAxcmFMusPSeEOAfYyoj6ZVysyJQSWxQ4cx+LsvNWbwQBfl95wtU+x3iGY9LK
         dMGi8I/cTL0co+PNthNBPCCZX81K9OSy8JtHbmawnmVq2TtKPYhXCRa3cPY3yHN34VIg
         x9qDPqGFlpoRcQEHHQTs47sT20k7S0el/W1d/wSBb1ZdFl190Apz/8WaD8ep+GSBY8VO
         z5Vtf5Ww3Xf8PPovlkucbJz3Uom1JkHvkTpxaBfP4IxSpV7aKsztA8BoyfdJUA3ixeAe
         w61C8fbBgsh6uelYcuBtfTaaucX2p2m5xy53cQzorw26akh16eunEaV6xjemmFcp1Toi
         yZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744187916; x=1744792716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMDTcY+QSM6bxbtbqX/RPBUWVkAI5eV/38uSVpSo7Us=;
        b=ez9UtM2vcxQQuZjyoUv+ENAMzyThOhKFS+oIkxG0B07iQr+/3s0BqieHeMxs0R+Yv1
         hOQvZtKMM/Zu07Lf3lQTta+xfHLpZVH630LJvczpj6aRNrdU1bl3BbkvCaghWsMwWEeF
         yhUnCv9ReahI1qEQ+jUZfqRlXGLFQ6fhvuLamoQdNHUz8I8EhVpKcQwEM8cxl10r4XQd
         YNuZiBCNWGhKhIuhSWoQFV/K00/a00BefKTNk4JZqytkysc/dpTLHL/gJao4zzgclkJu
         5kUFCt8nZyqmA2BxihaYzbpICUDJJZ4L4vBIVYr9VmkBBIfqoj0mjqv2uhYk0alRmKdL
         PkjA==
X-Forwarded-Encrypted: i=1; AJvYcCUK0boBpK2Am3kcjE0blX2ToQgl3gx0V+ys9zf0gRIFXj/cCrG7/6DbUUF2vXySpsLzqmpg5iElljQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2Aek7IOcP7d2/zl/RwTrVOtPqFh+QS7/r9/FlatgCepwmdNCy
	j9XfXwzfMqQuRqOIE7ksLEbOdS9Z1FWbkB0nSwuWhAcJJdLxzISpbGfFformJjE=
X-Gm-Gg: ASbGncsBypDbKNZmchBh931/FOPD+bL3zFG9EC0bR4AglRd3C46bqHkgCQnIbOyv7PF
	woKdYNeadjNk//zWfjjefJEvMq9kpXJ1YwH/r4QRCyXaenTZ8v51bICQYrVuZw+tb4BS/Gq8wjN
	SBhcx3EkSiyKUrCB9C7N+DI99fSpwfz04gs8BimlYpzIy2n630f+9k9+iTSfIaazy3ObVfJyLNW
	fa+jrt07bEsCM2pn/Jd0pZwFK3upcDua6nn96OrFBnyjaIsYDf9IP4uQykbOUwSxMBXkSlVIxHN
	HoKB4epxeddJZquLS2SAUJYIAjbg72J8hXu5HDDgc5b86VC28jXuN0n+i7yM0hI/NPZkdxHwAYo
	G
X-Google-Smtp-Source: AGHT+IEnaBnd+8JGTNcFE07Pg5u5VCMhvHVH3KD5tf25RaR94ALuGFeb4d5WTs/AGgKbGWudmVdJQg==
X-Received: by 2002:a17:903:2310:b0:227:e709:f71 with SMTP id d9443c01a7336-22ac29b41d7mr36476575ad.29.1744187915879;
        Wed, 09 Apr 2025 01:38:35 -0700 (PDT)
Received: from dev-linux (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c9db26sm6261735ad.140.2025.04.09.01.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:38:35 -0700 (PDT)
Date: Wed, 9 Apr 2025 01:38:32 -0700
From: Sukrut Bellary <sbellary@baylibre.com>
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: clock: ti: Convert fixed-factor-clock
 to yaml
Message-ID: <Z/YyCGHrd3AEjNRb@dev-linux>
References: <20250404014500.2789830-1-sbellary@baylibre.com>
 <20250404014500.2789830-4-sbellary@baylibre.com>
 <20250404194046.GA167370-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404194046.GA167370-robh@kernel.org>

On Fri, Apr 04, 2025 at 02:40:46PM -0500, Rob Herring wrote:
> On Thu, Apr 03, 2025 at 06:44:59PM -0700, Sukrut Bellary wrote:
> > Convert TI fixed-factor-clock binding to yaml.
> > 
> > This uses the ti,autoidle.yaml for clock autoidle support.
> > Clean up the example to meet the current standards.
> > 
> > Add the creator of the original binding as a maintainer.
> > 
> > Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
> > ---
> >  .../bindings/clock/ti/fixed-factor-clock.txt  | 42 ----------
> >  .../clock/ti/ti,fixed-factor-clock.yaml       | 77 +++++++++++++++++++
> >  2 files changed, 77 insertions(+), 42 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/clock/ti/fixed-factor-clock.txt
> >  create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,fixed-factor-clock.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/ti/fixed-factor-clock.txt b/Documentation/devicetree/bindings/clock/ti/fixed-factor-clock.txt
> > deleted file mode 100644
> > index dc69477b6e98..000000000000
> > --- a/Documentation/devicetree/bindings/clock/ti/fixed-factor-clock.txt
> > +++ /dev/null
> > @@ -1,42 +0,0 @@
> > -Binding for TI fixed factor rate clock sources.
> > -
> > -This binding uses the common clock binding[1], and also uses the autoidle
> > -support from TI autoidle clock [2].
> > -
> > -[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> > -[2] Documentation/devicetree/bindings/clock/ti/autoidle.txt
> > -
> > -Required properties:
> > -- compatible : shall be "ti,fixed-factor-clock".
> > -- #clock-cells : from common clock binding; shall be set to 0.
> > -- ti,clock-div: fixed divider.
> > -- ti,clock-mult: fixed multiplier.
> > -- clocks: parent clock.
> > -
> > -Optional properties:
> > -- clock-output-names : from common clock binding.
> > -- ti,autoidle-shift: bit shift of the autoidle enable bit for the clock,
> > -  see [2]
> > -- reg: offset for the autoidle register of this clock, see [2]
> > -- ti,invert-autoidle-bit: autoidle is enabled by setting the bit to 0, see [2]
> > -- ti,set-rate-parent: clk_set_rate is propagated to parent
> > -
> > -Example:
> > -	clock {
> > -		compatible = "ti,fixed-factor-clock";
> > -		clocks = <&parentclk>;
> > -		#clock-cells = <0>;
> > -		ti,clock-div = <2>;
> > -		ti,clock-mult = <1>;
> > -	};
> > -
> > -	dpll_usb_clkdcoldo_ck: dpll_usb_clkdcoldo_ck {
> > -		#clock-cells = <0>;
> > -		compatible = "ti,fixed-factor-clock";
> > -		clocks = <&dpll_usb_ck>;
> > -		ti,clock-div = <1>;
> > -		ti,autoidle-shift = <8>;
> > -		reg = <0x01b4>;
> > -		ti,clock-mult = <1>;
> > -		ti,invert-autoidle-bit;
> > -	};
> > diff --git a/Documentation/devicetree/bindings/clock/ti/ti,fixed-factor-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,fixed-factor-clock.yaml
> > new file mode 100644
> > index 000000000000..f597aedbad05
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/ti/ti,fixed-factor-clock.yaml
> > @@ -0,0 +1,77 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/ti/ti,fixed-factor-clock.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: TI fixed factor rate clock sources
> > +
> > +maintainers:
> > +  - Tero Kristo <kristo@kernel.org>
> > +  - Sukrut Bellary <sbellary@baylibre.com>
> > +
> > +description: |
> 
> Don't need '|'.
> 
> > +  This consists of a divider and a multiplier used to generate
> > +  a fixed rate clock. This also uses the autoidle support from
> > +  TI autoidle clock.
> > +
> > +allOf:
> > +  - $ref: /schemas/clock/ti/ti,autoidle.yaml#
> 
> You can drop '/schemas/clock/ti/'
> 
> > +
> > +properties:
> > +  compatible:
> > +    const: ti,fixed-factor-clock
> > +
> > +  "#clock-cells":
> > +    const: 0
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  ti,clock-div:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Fixed divider
> 
> Constraints?
> 
> > +
> > +  ti,clock-mult:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Fixed multiplier
> 
> Constraints?
> 
> > +
> > +  clocks:
> 
>        maxItems: 1
> 
> > +    description:
> > +      Link to phandle of parent clock.
> 
> Drop the description
> 
> > +
> > +  clock-output-names:
> 
>        maxItems: 1
> 
> > +    description:
> > +      From common clock binding
> 
> Drop

Thanks for the review.
I will fix all of the above issues.

> > +
> > +  ti,set-rate-parent:
> > +    description:
> > +      Propagate to parent clock
> > +    type: boolean
> > +
> > +required:
> > +  - compatible
> > +  - clocks
> > +  - "#clock-cells"
> > +  - ti,clock-mult
> > +  - ti,clock-div
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    bus{
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        clock@1b4 {
> > +            compatible = "ti,fixed-factor-clock";
> > +            reg = <0x1b4>;
> > +            clocks = <&dpll_usb_ck>;
> > +            #clock-cells = <0>;
> > +            ti,clock-mult = <1>;
> > +            ti,clock-div = <1>;
> > +            ti,autoidle-shift = <8>;
> > +            ti,invert-autoidle-bit;
> > +        };
> > +    };
> > -- 
> > 2.34.1
> > 
