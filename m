Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322016;
	b=cxr3LZlN6sJe2969DrwNkqMSt1n/o1kDRYQ/W2hxtQW6MHm72bfaj/T2q8E6jeGm7/hH
	 fPvOcljo9O4miX29KEVs9v0DY0hGlbGVrscDmlLzpEGuaOO4/QZizCEdqODjsXDWXW2uJ
	 6UMtqv5XRXmlHbFBwhy2kidl8S4rhAv/aBIfejK7qqy1ot7EQP/aII8Ypi3MzeTmOik1l
	 jYLPAbzTotOutcEJqiwVWB6BjvTNdQDh3VstAk94t4CoCKPFG12mkQr2i1bJJWSFm8H0L
	 NTwluz5TWsFcjFTpCRFS6zap+XnGkEDnOjWl2UJ8dPzNgUJEfE1ug4Es0GlejUSzrCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322016;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ahpMbNRu+oaU/D+J9CQu8q3KW+PhWHMWtw7yeScr5x4=;
	b=dPSUpRJyLvYVciBwTRRhCyoJscIBQewBlxRc2/Ozb9juurTrkZ0zoCqxI98eHrBtn1by
	 pRVct2OLpP6nEgdauPNKySjlMQe/becg+Ayc5TY/cu0sIhQ2nlnIz3ACjCazFEEzGVvI0
	 fDP4HTPS4gjVDuzgNGqwxsRAmbbhMq2bhvfnd+3m9fozm02PjrDdfW9I8za9vO+eLsylF
	 rCNsk7PqsAMz7AR/l/rXR0YdugNYSa8k4jVvgRGowaHH/BSOEIqp9nB5wCuiu7OLOH41A
	 6q0zfPzyn4pGvcZj/EGDTA4Fl4amowFWKLE3+jaj0az8r1EnATQBQvobPMpgV2RICfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iSSgWphG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AD660A2631;
	Tue, 10 Nov 2026 14:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iSSgWphG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFDFD1F008A3;
	Tue, 10 Nov 2026 14:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794322015;
	bh=ahpMbNRu+oaU/D+J9CQu8q3KW+PhWHMWtw7yeScr5x4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iSSgWphGAZzZqhQ+c0Be8QZCxHpeK6wmtxK+Sstue5s6HPrFgpFkwJz4UlYxj7bgx
	 DmLBVqgbHYgz0bBLBML2qsLjY8ev3tyts5RizUgZ6GZkqxDCb2mvJzQGJ/3EVvnv1N
	 LJe5x1LGUGpYgV68dzspFycDUXaXpyIQuOhDux66FbI4BlKd7sRsAFeUWV+066WEkZ
	 DqIs3yj7LZPDEX9YK4EJ/QsgSrQVEy58z9dDZMdFWTlCmTqVxJoQgm6/5BHGGrVtSN
	 QadY7MBdF0ceyycMMf68yDiAcXNYMkljlC5NDkXV8fQ15HZ62NIKgiqOFph2KR9iIO
	 QYQpqtXmvF2/A==
Message-ID: <sashiko-outbox-207210@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 5/7] dt-bindings: clock: nxp,imx95-blk-ctl: Add LDB
 bridge child node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261110-dcif-upstreaming-v11-5-9e13c85ae0d8@oss.nxp.com>
References: <20261110-dcif-upstreaming-v11-0-9e13c85ae0d8@oss.nxp.com>
 <20261110-dcif-upstreaming-v11-5-9e13c85ae0d8@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 14:46:54 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: clock: nxp,imx95-blk-ctl: split variant schemas
  with subnodes
--

commit 40c5ccb540e5f895cb96974a17da3a21e1ed5c2d
Author: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

dt-bindings: clock: nxp,imx95-blk-ctl: Add LDB bridge child node

This commit adds a bridge child node pattern to the nxp,imx95-blk-ctl
binding schema for nxp,imx94-lvds-csr to support LVDS Display Bridge
controllers.

> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.ya=
ml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index fbbf1b3f17904..c2aeb434a8102 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> @@ -51,6 +51,10 @@ patternProperties:
>      $ref: /schemas/media/fsl,imx95-csi-formatter.yaml#
>      unevaluatedProperties: false
> =20
> +  '^bridge@[0-9a-f]+$':
> +    type: object
> +    $ref: /schemas/display/bridge/fsl,ldb.yaml#
> +
>  required:
>    - compatible
>    - reg
> @@ -63,7 +67,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: nxp,imx95-camera-csr
> +            enum:
> +              - nxp,imx94-lvds-csr
> +              - nxp,imx95-camera-csr
>      then:
>        required:
>          - '#address-cells'
> @@ -72,8 +78,24 @@ allOf:
>        properties:
>          '#address-cells': false
>          '#size-cells': false
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              const: nxp,imx95-camera-csr
> +    then:
>        patternProperties:
>          '^formatter@[0-9a-f]+$': false
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              const: nxp,imx94-lvds-csr
> +    then:
> +      patternProperties:
> +        '^bridge@[0-9a-f]+$': false
> =20
>  additionalProperties: false

[Severity: Low]
This isn't a bug, but would it be cleaner to split CSR variants that have
subnodes (such as nxp,imx94-lvds-csr and nxp,imx95-camera-csr) into
separate binding schemas, similar to nxp,imx95-display-master-csr.yaml?

Adding a second variant-specific child node pattern to
nxp,imx95-blk-ctl.yaml requires three separate per-compatible if-then
blocks in allOf to toggle #address-cells, #size-cells, formatter@[0-9a-f]+,
and bridge@[0-9a-f]+ across unrelated CSR blocks.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-dcif-upstr=
eaming-v11-0-9e13c85ae0d8@oss.nxp.com?part=3D5
