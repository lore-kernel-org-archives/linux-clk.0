Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F2B3B2D24;
	Wed,  9 Sep 2026 09:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944412; cv=none; b=LXoReJEiqNhYrc/6piukn2KSBtiueqvuftkg+V6519OI3xomwWc8BWQHZ5/f8LGm75N3m4S2QfvQEHK2SCu+EO/f4XIVEkJsvch3SeMVLroYNff9WqWNuWul/JxUwk5RCHvbrj5A2sZLTtgDN/1pIHRcBefAoH7Sw0aT7L2glB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944412; c=relaxed/simple;
	bh=QK6DoJTCPuDhdUcaMpYDLVcqaEUsxFFzgWBPTSBQBnM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OtT4EQY53QJN+eXFI/cSG1LSpWtI+2Hni9NIt7VJZVhtGtOyCq4O2xnXu/Urh91F0gpx/o4HzFc5kH0uXeIgG0bozC5cSgM8Z04rwGFgK9iINjQPYg5pQXzZ4uiM0ASeAi0mNvMk5ZJbrPUwHmx0lOx8/phqC0X5MGnVfs54h5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=STVzzx5d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="STVzzx5d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973671F00A3A;
	Wed,  9 Sep 2026 09:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788944410;
	bh=71nHG/y6nnFBX15E/RJAcpcwDtE/6Cwt2y/wNoaiYMY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=STVzzx5d4lk77KK5NhhD3J3gsrloEaUWXuAbEy4ya7lT4N6OUkAsgqGiOv8+KSdu0
	 O3dgrs085Lw8hi+aRCBweTsaCGRYSeVJP/XXCbavurG7k6wA+OWrr0F/Y1zerqSFtE
	 AyciX0yV7WArVBY2ryssxhNBSNKua44OgdyL82oFyLGztirEeyMzL20GTBbrAANbjN
	 Z2cToFfx94rtrG5RcOZKalOelYKXTGo4Jfxt3Sc4f4dHJ1uQrKB4q68flUte8D1/sQ
	 3wN8MtZ5GH+IR30h/2zwL5kUX8xi4c+n1wf4yXHXzi1ap7pbjvajkSVF1Py0CSD8oM
	 K169HUas+BvBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: clock: add TI CDCE6214 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sascha Hauer" <s.hauer@pengutronix.de>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260909-clk-cdce6214-v8-1-4dfa355c1f65@pengutronix.de>
References: <20260909-clk-cdce6214-v8-0-4dfa355c1f65@pengutronix.de>
 <20260909-clk-cdce6214-v8-1-4dfa355c1f65@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 09:00:10 +0000
Message-Id: <20260909090010.973671F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] Conditional constraints in the 'allOf' block target the non-exis=
tent property 'io-standard' instead of 'ti,io-standard', bypassing validati=
on.
- [Low] The description for 'ti,cmosp-mode' incorrectly refers to 'CMOSN ou=
tput' and contains typos.
- [Low] The 'ti,cmosp-mode' and 'ti,cmosn-mode' properties lack a minimum c=
onstraint, incorrectly allowing the value 0.
- [Low] The 'clock-names' property incorrectly permits an array with duplic=
ate clock names (e.g., ['secref', 'secref']).
--

commit 3a564f8b01873582c4ee765638671ebe3d3d19b4
Author: Sascha Hauer <s.hauer@pengutronix.de>

dt-bindings: clock: add TI CDCE6214 binding
   =20
Add device tree binding for the CDCE6214, an Ultra-Low Power Clock
Generator With One PLL, Four Differential Outputs, Two Inputs, and
Internal EEPROM.

> diff --git a/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml b/D=
ocumentation/devicetree/bindings/clock/ti,cdce6214.yaml
> new file mode 100644
> index 0000000000000..4a9c9155894af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
[ ... ]
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - enum: [ priref, secref ]
> +      - const: secref

[Severity: Low]
Could this allow the clock-names array to have duplicate entries like
"secref", "secref"? Should the first item be restricted to just priref
to prevent defining the same physical clock reference twice?

[ ... ]
> +          ti,cmosp-mode:
> +            description: |
> +              Driving mode for CMOSN output:
> +              1: Low Polarity
> +              2: High Polrity
> +              3: Disable

[Severity: Low]
There appear to be a couple of typos in this description. It refers to
CMOSN output instead of CMOSP, and Polrity instead of Polarity.

> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            maximum: 3

[Severity: Low]
Since this references uint32 with a maximum of 3, does it inadvertently
allow 0 as a valid state?

According to the description and the driver header, 0 is not a valid
mode. Would it be better to use an enum of [1, 2, 3] or define a
minimum of 1?

> +
> +          ti,cmosn-mode:
> +            description: |
> +              Driving mode for CMOSN output:
> +              1: Low Polarity
> +              2: High Polrity
> +              3: Disable
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            maximum: 3

[Severity: Low]
Similarly, does this property need a minimum constraint to prevent 0
from passing schema validation?

[ ... ]
> +        allOf:
> +          - if:
> +              properties:
> +                pins:
> +                  contains:
> +                    const: priref
> +            then:
> +              properties:
> +                io-standard:
> +                  enum: [ 1, 5 ]

[Severity: Medium]
Do these constraints target the non-existent property io-standard instead
of ti,io-standard?

If so, an invalid ti,io-standard value in a device tree might erroneously
pass schema validation because the constraints aren't applied to it.
This pattern appears in the subsequent conditional blocks as well.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-clk-cdce62=
14-v8-0-4dfa355c1f65@pengutronix.de?part=3D1
