Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795268434;
	b=kPbFOxCMYg7MygOegiSTOD7HT1PdXFmF+jaIYd5C2jNBkq0wH1T/or+tpgfs0QkBNsvF
	 QuJJ/oPQ8UtaVSL54vNwsvYak4yFyuTReCfCLDJdjXg30HyAWGWVbZn5lzv9+wUFkeJgI
	 jMSgZuoD3fRQAHwfo2Qj0yVA4wceEiRrKKBeBs+WfnO0fEMmYwuclzsmi4OiE/S/LrQah
	 uYQe6ruFkNYLRASLIidhaQ8q9MjsV0LFXBAXBFi9J3/TPuqMPes4JdQgeD+QwlU7gr4u8
	 dnobtGSqHQ7TyWZFDKxxxqsY+uXlJC6q3I9jR3iU9RLjEEY6/7P9w3T8043kZXdi+Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795268434;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SNED2kHG5zbFoBa3MiRPei5fh+vsklz8ofpIyyU04zg=;
	b=5sB5kgl+r1HWY0QN0PLNuYSsrfKhsFDWy7Hg/Wp/bkzsZXw8oO2e99/W9x7THfzq4B7I
	 yapoyNjxOL8x5TU9s5fJe7HwbyljqbZabT6ZfvggSdXBd3JiSnOwh5x/ROnN2Y6HEevVo
	 v2+GbuhNmkSMSvNLLVP9T1LRfla6gpK+yBHhXhOyXSOz9be2iquBBdCLGmyAPXM2Jxsc3
	 qVc+3uuAL93OLYlAYXgK7CPC7R4Yt0xaLRZC1y4S7n/tvqYKlNDD9b5jc5y1kku/v/w81
	 BpP4MwqSnnVL4iCDQc4CdfkM/dBJocxcAKGgT3F4jXJb7nu1KV82LATM930UFZ5u2lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LuWGIFdx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECF3606A331;
	Sat, 21 Nov 2026 13:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LuWGIFdx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B321F000C0;
	Sat, 21 Nov 2026 13:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795268433;
	bh=SNED2kHG5zbFoBa3MiRPei5fh+vsklz8ofpIyyU04zg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LuWGIFdxixEo4fZNzrjNCW4j1gXjyY9j6WpIRyyFYUy4lO/rwIdrd3wFZnArRR3YK
	 B4R9HVA2Xk4FCY1Q08Eqa5rEcv4++SRiUX+JZOpPWxZ6IweOY/7il+qPOaLCOAQT0q
	 BbVp9R5GGHXnxZrihKVA/+L4ZxT0fPW67QLoo2fihamtZ0cbnvD4jdUIpq7aFVofxj
	 I59oAvfR0SOoyiJ/cwQt5MV3rlvAtCBOEKih0dvReedZmtRZSm8F91B/I6Mfedjuoc
	 7juH+1NzCW3zlAyl1brmwDm+Vbk9wdMQ3/HXqvT/ZQ0dI4P0+gHrIZI5h5ElaAY8iz
	 pUvVVGK/pxuJg==
Message-ID: <sashiko-outbox-227078@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 1/2] dt-bindings: clock: Add gpio-enabled-clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vyacheslav Yurkov" <V.Yurkov.EXT@bruker.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261121-feature-clock-guard-v11-1-00c633a667a2@bruker.com>
References: <20261121-feature-clock-guard-v11-0-00c633a667a2@bruker.com>
 <20261121-feature-clock-guard-v11-1-00c633a667a2@bruker.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 13:40:33 +0000
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

commit 4240011b2e1aa7ee82ec94b5068bdebeb6cd0095
Author: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

dt-bindings: clock: Add gpio-enabled-clock

This commit adds a Devicetree binding schema for a clock that passes its
parent rate through unchanged and reports its enabled state via a GPIO.

> diff --git a/Documentation/devicetree/bindings/clock/gpio-enabled-clock.y=
aml b/Documentation/devicetree/bindings/clock/gpio-enabled-clock.yaml
> new file mode 100644
> index 0000000000000..4861c87ae5e0d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/gpio-enabled-clock.yaml
> @@ -0,0 +1,55 @@
[ ... ]
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
hardware property?  How long software polls a GPIO (as opposed to waiting
on an interrupt or describing a hardware stabilization time) is a driver
detail, and the 10 to 1000 us bounds prevent clock sources with lock
times outside that window from passing schema validation.

Also, requiring a parent clocks phandle on a separate pass-through node
forces a single clock generator with a status or lock GPIO to be split
across two Devicetree nodes.

> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - clocks
> +  - clock-output-names
> +  - enabled-gpios

[Severity: Low]
Should clock-output-names be optional here?  Because #clock-cells is 0,
this node provides a single clock output that consumers reference
directly by phandle, and sibling single-output clock bindings leave
clock-output-names optional so the clock name can default to the node
name.

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

[Severity: Low]
This isn't a bug, but properties lists clocks before #clock-cells, while
required and the example node list #clock-cells before clocks.  Keeping
clocks before #clock-cells across all three sections matches canonical
property ordering and sibling bindings such as gpio-gate-clock.yaml.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121-feature-cl=
ock-guard-v11-0-00c633a667a2@bruker.com?part=3D1
