Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267491;
	b=LJNFEBOWDTb5oYVnQwASnY/w1lFDxmceLT0zkaVHd/f3RaYfrQy/yfcBLoJbn15Y1oiM
	 jKT1QmaMPX2m+Q+ycrCFD3TR4ZKUGG7j3pQ2Z3aZPYJpvPBouVhaRONFE2gf589doA3DJ
	 MipiPz/zkqcpkOTxYwrxUrYZmwpLsRyZpNYKRPTetEckm/PTYrlzd6f+c/hgLbCKAWBSv
	 mL77LXc9a/8BfN8JEFemTSclRqo5GfAZV0kWZ12o3MTsV0DYn3KNRPYjmmZuTLfa5aBLG
	 Bsg6TvPhXVPiuUB4knwCOYw35LBEKDOW2yIPRzxFZqwQr1GnHVpBuKzhUoQZJE5YNLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267491;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8zkScy1Dlfj4/xifhixFlls0kOJlric8JVhwitFLmDc=;
	b=yPYbnxqvWs8BoDiHAK66Ws8MEfywROAhnHEtRdGpC33mPBVC0ez0g4GkWPzunGdWogUm
	 eMcN9UYSCyuiyOZ1cUGz84AmFIUutTgNn5IekPgVcM+dKRTzIUTaBk9d7fMo02leKuLlI
	 XYwKEA8OUOzbyCK+m5sAuEUtueTuVPiauPr9cT1kv5uD3pDU2oV4wsMnDw3v3kglL38IR
	 16thEmbolUadlzCTWEMuzxELzzja/lFGZCoAUyKPmDvIN4wD59I6zP043HThIjeN4qT4m
	 dhaIYnwMG9KSpa4QIzBPZZtyHlMJDzXhtIykUtSU0UGW7IcQrjoI+wZ9/4/dQMpB5KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SKqS13V9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084C7606A320;
	Sat, 21 Nov 2026 13:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SKqS13V9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9CA1F000C4;
	Sat, 21 Nov 2026 13:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795267490;
	bh=8zkScy1Dlfj4/xifhixFlls0kOJlric8JVhwitFLmDc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SKqS13V9GXrJoz68zYPXfYYRR1Jx49T8+iwyw4SEtIfaJkCmgJHSjd10iP0idLSpc
	 c4Tiymjf+nCYC9C1lEAtKSJA8dTTc2B7Ia0GyhkEA+1o7jY/H2KNkFPGG937iX9gyq
	 E+ClBKtQLKHIZepLa1uw5d3RzF1vIXC+cc/9M47UUHzdSyS2HbUwmyiu5V+Np6EgNR
	 mUKJrI/Vyd9BXEyTYcgnStBJ2418DKjfnbJvq3rQPDe0JGeKnE5iPSYn8EyZEoKDuA
	 TKJPJmNCEmpT0MhY56IvVAh5iWWdUcusuw/Njyw38VIT5KAzkCsRabxDEfwlY1Orqs
	 AcNEeWuE+tLfA==
Message-ID: <sashiko-outbox-227069@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 1/2] dt-bindings: clock: Add gpio-enabled-clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vyacheslav Yurkov" <V.Yurkov.EXT@bruker.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261121-feature-clock-guard-v10-1-5d449739bb8c@bruker.com>
References: <20261121-feature-clock-guard-v10-0-5d449739bb8c@bruker.com>
 <20261121-feature-clock-guard-v10-1-5d449739bb8c@bruker.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 13:24:50 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] dt-bindings: clock: poll-timeout-us encodes software policy
  and bounds
- [Low] dt-bindings: clock: clock-output-names required for
  single-output clock
- [Low] dt-bindings: clock: inconsistent property order in
  gpio-enabled-clock
--

commit af456b3694509e900f2e04e650b48e34c1d34c06
Author: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

dt-bindings: clock: Add gpio-enabled-clock

This commit adds a Device Tree binding schema for a clock that passes its
parent clock rate through and reports its enabled state via a GPIO line.

> diff --git a/Documentation/devicetree/bindings/clock/gpio-enabled-clock.y=
aml b/Documentation/devicetree/bindings/clock/gpio-enabled-clock.yaml
> new file mode 100644
> index 0000000000000..76c1425931d28
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/gpio-enabled-clock.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/gpio-enabled-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO Enabled Clock
> +
> +maintainers:
> +  - Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> +
> +properties:
> +  compatible:
> +    const: gpio-enabled-clock
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  clock-output-names:
> +    maxItems: 1
> +
> +  enabled-gpios:
> +    description: GPIO that indicates whether the clock is enabled or dis=
abled.
> +    maxItems: 1
> +
> +  poll-timeout-us:
> +    description: Timeout in microseconds for waiting for a GPIO signal.
> +    default: 10
> +    minimum: 10
> +    maximum: 1000

[Severity: Medium]
Does poll-timeout-us encode OS driver polling policy rather than a
hardware property?  How long a consumer polls a GPIO (as opposed to
waiting on a GPIO interrupt or describing a hardware lock or startup
time) is software policy, and bounding it to 10..1000 us rejects
hardware clocks and PLLs whose stabilization time falls outside that
window.

Also, should the status GPIO be described directly on the clock provider
node rather than requiring a parent clocks property on a separate
pass-through wrapper node?  Modelling this as a wrapper forces a single
hardware clock source with a lock GPIO to be split across two Device
Tree nodes.

> +
> +required:
> +  - compatible
> +  - clocks
> +  - "#clock-cells"
> +  - enabled-gpios
> +  - clock-output-names

[Severity: Low]
Should clock-output-names be optional here?  Because #clock-cells is 0,
consumers reference this single-output clock provider directly by
phandle and the clock name can fall back to the Device Tree node name,
matching other single-output clock bindings such as fixed-clock.yaml and
gpio-gate-clock.yaml.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    clock {
> +        compatible =3D "gpio-enabled-clock";
> +        #clock-cells =3D <0>;
> +        clocks =3D <&pll>;
> +        clock-output-names =3D "gpio-enabled-clock";
> +        enabled-gpios =3D <&gpio0 4 GPIO_ACTIVE_HIGH>;
> +        poll-timeout-us =3D <20>;
> +    };

[Severity: Low]
This isn't a bug, but the property order differs across properties,
required, and examples: required lists enabled-gpios before
clock-output-names, while the example lists #clock-cells before clocks.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121-feature-cl=
ock-guard-v10-0-5d449739bb8c@bruker.com?part=3D1
