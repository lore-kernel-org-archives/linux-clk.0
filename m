Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54B738C42B;
	Mon, 21 Sep 2026 06:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973830; cv=none; b=tXWsTLiGmlROAhGF4Jq/jnvkihI8+ziQLChD+TOjoQEjW/+fN7OgcgWEE6Hx5l/xcgyHgNJM8B+6GQuI0zkZzKSvqeaZQwKC+i8vdTyrxPgCDNVn50gUI5Q/QQkJIT+Ddrg+qianE1h01pmOqhl+F9tqFwx/VN27G2P2JDXN+TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973830; c=relaxed/simple;
	bh=CXFJbRC+nzuTU9a6q2fa9gwm+Qt2sdsEggWJouk/6Fk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OLhZEd9uxvTSgn0BYa8VNrxULdREySx+1l+9A0p09Xs+IO39ELWjQcjJuvgxIJQRN5/nUvcndN0iikYpLfG9B5gPhhgzPuEUbudOumfa8AL81V4jc7T8OjT/Dl1bAWQEGQpNKBMS2Q+DcgUIqdvKQlzIQTYnVzPoDjU8vHOE4i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l0D4b3r3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l0D4b3r3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B961F00893;
	Mon, 21 Sep 2026 06:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789973828;
	bh=a8R6V9Q9SSjLO+COwPo2iSXt//vhPYHieF6hv/MLGWc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l0D4b3r3NJ8Qsi0S4+K53X9by2ET5WV4F14zEAsRA6uQutTc5a9M+4LkmOBG026u7
	 eLOY+cIUY+mYGkqOhzYi/24OAMByPB6vWOefg1X4sXnZenOdC0WY4ldzAslPPVymf5
	 Y4h4LC9wG6m8EnuxfxPYuNGl4dAyP/mB67jQf4pC7454EBVdimSu6DUDx/ENOt6csd
	 Flr+T3m2G+RKSXRtZdv4Tsb43C5BT20VTbmIbF9RW2uoQmBI1tIKdiGhYR9QjvaibE
	 1V07PpwswYvNVEAYY11bImLA1wMCzWmh2+eCF1fXe+/Q47IYOnl5gzQSXHuQCMzd6A
	 YpiiQOlVtFtjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/2] dt-bindings: clock: add TI CDCE6214 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sascha Hauer" <s.hauer@pengutronix.de>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260921-clk-cdce6214-v9-1-f2ea74fd38a2@pengutronix.de>
References: <20260921-clk-cdce6214-v9-0-f2ea74fd38a2@pengutronix.de>
 <20260921-clk-cdce6214-v9-1-f2ea74fd38a2@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 06:57:08 +0000
Message-Id: <20260921065708.72B961F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: invalid additionalProperties with $ref rejects inhe=
rited properties
--

commit 666b5411b0002edaa523fde47133ad3f08a2f5b5
Author: Sascha Hauer <s.hauer@pengutronix.de>

dt-bindings: clock: add TI CDCE6214 binding

This commit adds a device tree binding for the TI CDCE6214 clock generator.
It defines properties for clocks, pins, and specific IO configurations.

> diff --git a/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml b/D=
ocumentation/devicetree/bindings/clock/ti,cdce6214.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml

[ ... ]

> +patternProperties:
> +  '-pins$':
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '^conf':
> +        type: object
> +        additionalProperties: false
> +        $ref: /schemas/pinctrl/pincfg-node.yaml#

[Severity: Medium]
Will this additionalProperties restriction reject the properties inherited =
from
the $ref schema?

In JSON Schema semantics, additionalProperties only considers the properties
explicitly enumerated in the local properties block. It does not evaluate
properties brought in by a $ref.=20

Because of this, any attempt to use standard pinctrl properties in a device=
 tree
will trigger a validation failure, as the local schema forcefully rejects t=
hem.

Should this use unevaluatedProperties: false instead to allow the standard
properties from pincfg-node.yaml to be evaluated properly?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-clk-cdce62=
14-v9-0-f2ea74fd38a2@pengutronix.de?part=3D1
