Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437828;
	b=lnIjKe6i/pOd9e37BxoYpe8/HF3vb3O4MGzSGPqFur58ww3Ov4KH8eF9F/UIkuiGQS4J
	 F9JYEP0V1ZpD3MWrcnZx5SQSS1svCoe+bnmsW+NblKYq8Sg+29jkDe0TCrePt3RdlNYvc
	 cWNCl/SA7cXGPipwC9tFpWq7r4KTYBa8wr/hqP1CZzw/YyJCVY7O+tnbRrucmph+1Ff22
	 Of6S3nZQigVxlUvyLrBT27PK1zmab+CCMN7iFDa7kZ4uXC6HQF5vS6tCDgLZasI+yvSFc
	 YP+FK+rXhwttCbDvv0VN85jZ18nRaJfQddmDVmXjVRC54EFi0SSHDQ9Rg4xuuRarNKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437828;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jar3Sv4TK/TH1BdHMGPIcdy7IiFCOBmOQWc2yi3p2Dk=;
	b=NQ3TczDDZom2hOBpobt8Ig+2g0W8WD7BrZkcApccmqCLrOkq/+UH7rN5+/pE2ntG5PsY
	 H4MokEKR4kKS0J0oW9SCskxFG7uZ7WMB7CnUFRbYrzjRDtvcFdd7W7hDauQ7vE1/S4ptm
	 +Ehw7Vu7H7LeKwNZu+mGhIKT1cCMcNh3PdTRhN9Gzol+1uLtBWQnPTLzPsFOFeObJkUBd
	 DwcNe4SdR+G8dTtsPHC7cChcQLG4akJozK1f2OntVNmMFG0inCriVygWS79c2H0Fgi+Z4
	 yaWRW7eNHIa1ZRYY049s6DnZwPuQhN7Sm8EeolmMQGQ4NcHLAfevvsOm8Kn01zZ0y+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NbpxE00L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4597C606A31A;
	Mon, 23 Nov 2026 12:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NbpxE00L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BBB31F000C0;
	Mon, 23 Nov 2026 12:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795437827;
	bh=jar3Sv4TK/TH1BdHMGPIcdy7IiFCOBmOQWc2yi3p2Dk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NbpxE00LU3SGrQaU1K1WcvdL6XwpUMfLOJgtFZmkSQKPVbVIY4LXGtN/x/56TDBUx
	 DyKpIw+poY4+cB8sjQPV/6m9ccXf69sCbJbfklfArv3sgy+hj7yYqAdui6iWkNDDBm
	 c26n0xrx+MdymuPNXaZEd3u5dGJ6XXPHWSI5dqOiqkKMKM5wrZ04VWKIO00/kg38Vs
	 8fxW23ZAAQEjdlqgB/yHiU0DQbWCquNnUAP3WvDGAfP+IpNS6Vca0qkLs0R8/n9ymK
	 7gmp/sqHemVp6qLWvfM9qJEZXFB9KRxYetiLiNFf8RaQIdptNr7GvGDGgO0J6cWj1B
	 +lZpDyO9ab4rA==
Message-ID: <sashiko-outbox-229241@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/7] media: dt-bindings: media: i2c: add Samsung
 S5K5E8
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hikmah Gumelar" <hikmahgumelar@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261123123546.152162-3-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-3-hikmahgumelar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 12:43:45 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] dt-bindings: media: i2c: invalid $id and $schema URIs in
  samsung,s5k5e8.yaml
- [Medium] dt-bindings: media: i2c: 0-based CSI-2 data-lanes in
  samsung,s5k5e8.yaml
--

commit b55315d405d591f8eee7ad684f3b49e1f2a7e7c2
Author: Hikmah Gumelar <hikmahgumelar@gmail.com>

media: dt-bindings: media: i2c: add Samsung S5K5E8

This commit adds a Devicetree binding schema for the Samsung S5K5E8
5-megapixel MIPI CSI-2 CMOS image sensor.

> diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.y=
aml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
> new file mode 100644
> index 0000000000000..0e440209c3fd2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org
> +$schema: http://devicetree.org

[Severity: Medium]
Are $id and $schema truncated here?  Running dt_binding_check fails unless
$id is http://devicetree.org/schemas/media/i2c/samsung,s5k5e8.yaml# and
$schema is http://devicetree.org/meta-schemas/core.yaml#.

[ ... ]

> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            items:
> +              - const: 0
> +              - const: 1

[Severity: Medium]
Should data-lanes use 1-based physical lane indices (1 and 2) here and in
the example below?

Per video-interfaces.yaml and v4l2_fwnode_endpoint_parse_csi2_bus(),
physical lane 0 on a MIPI CSI-2 D-PHY bus is the clock lane by default and
data lanes are 1-indexed, so data-lanes =3D <0 1> assigns physical lane 0 to
both the clock lane and data lane 0 while rejecting valid <1 2> endpoints.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123123546.1521=
62-1-hikmahgumelar@gmail.com?part=3D2
