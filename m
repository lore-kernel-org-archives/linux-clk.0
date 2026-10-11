Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569CC361977;
	Sun, 11 Oct 2026 18:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791745126; cv=none; b=P76mvir3DPZmlA/3sAI0Bnd7zQwv1TltMsnX7YU7byHv8tCfA/JCkhfi73KI6BKU8Gd/YRSiHRf2FOkTtQgWtkt1H8oJCHINpZlm479QLxqYtdSzwjbIk3qLmDtElTzHgvdsNd8yHCh9uOj9a90ITJN1+Ut7MocZm2PDWc5tIVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791745126; c=relaxed/simple;
	bh=UHei6ecy9aLQYFTuqfCtDO3gRTzdpWg0FiiIVUEhx8I=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Hjaw0PN4N726RgJ3ublMyj27ltPsq/w24Gf9+tbQORYaNst7lDdbd65Vixs0Wa3KwjbuZQ99/iTZ+dBuU0lFBm/twyLNzz+yXfOUiUgPlR6nM2v+pe4IxzGhI4L+oV2BblYkb/nwtu3S4QBPnjUpT4+4Kw9wSTxNOYu5uRlK46M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=alpnbYw7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="alpnbYw7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89111F0089B;
	Sun, 11 Oct 2026 18:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791745124;
	bh=LVh6XfZ88KkiLjw4PzN+/CbUIAKz56Ln+kykw6wlKaE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=alpnbYw7FwbhoahJK2Z4OFliXy65NVws2f3Dxm6bmL6Lfw3HOgaElQNA0zUp+Uwd3
	 ddjpaDf2td3bB4GG9HSvAmY2TYeCEo9J3kEth1PSTParsV/R0bh+Hsf6nEtQ6GsEx/
	 JsP1l2truxiifTTI9CvVvL5kjfLVcgMSHfkg+6qWCsqAQkrIQjXAgZ84aVNRi2wb93
	 ocSgmfTzRRQcnrDBkh8L5SVH9rn/FF/o9Ne+bGYvgaL8RpOzclus+z0bYL8HLxxGCT
	 dWVyFGaWY3crh7S+RVxyPbmq/CB1jBV0FK+qcWRD2YXH2q+uVeN53F5eESiSb0Am+v
	 Icl+pKmtunJbg==
Message-ID: <sashiko-outbox-167390@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/3] dt-bindings: clock: airoha: Document support for
 AN7583 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20261011185238.52229-2-ansuelsmth@gmail.com>
References: <20261011185238.52229-1-ansuelsmth@gmail.com>
 <20261011185238.52229-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 18:58:44 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: missing #reset-cells and #phy-cells in required lis=
t for airoha,an7583-scu
--

commit b497053fb215eaf3701184549f44bdc802e880bc
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: clock: airoha: Document support for AN7583 clock

Document support for Airoha AN7583 clock. This is based on the EN7523
clock schema with the new requirement of the airoha,chip-scu property.

> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.ya=
ml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> index fc37786ac7ed8..8b94113d00ab7 100644
> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
[ ... ]
> @@ -57,12 +58,34 @@ properties:
>        available serdes port.
>      const: 1
> =20
> +  airoha,chip-scu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the Chip SCU providing the registers required
> +      for configuring the PCIe related clocks and resets.
> +
>  required:
>    - compatible
>    - reg
>    - '#clock-cells'
> =20
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: airoha,an7583-scu
> +
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 1
> +
> +      required:
> +        - airoha,chip-scu

[Severity: Medium]
Since the airoha,an7583-scu variant acts as a reset and PHY provider, should
#reset-cells and #phy-cells be included in this required list?

Without these in the required list, device trees lacking these properties
will pass dt_binding_check validation but could cause runtime failures for
dependent consumer drivers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011185238.5222=
9-1-ansuelsmth@gmail.com?part=3D1
