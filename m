Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516502;
	b=m7q3v2T8oJB4Iab3IVGQ7AKqPG1knARe57vx0RGnXwO8WvqSHecxwC5ul7xZk/Rcp1Iy
	 RYBccjJLtdleheFmtr3csGQEcH14NN+w37tsRT9fxr1VIhSXXYN9TiH7E+SVOd33tyD52
	 OTVdNVwLOLMnJ/9KBy0EUcNOvyWpkwtEtCeD42GF8Q/VPAa4zQbLx0F0hBWFL8HR+uUXx
	 cL4WVH5zgTUHq8pEYonQlFx1qsRJpBybsWHp4z0iymyV5f2uIxgu0bVxtfdUYald83dpw
	 ksvGEYpDYBBwAIOqoJBWTUfAyZGtOSJoI0WtdWDpTOn18zGUZpBksUBRRleJfGDobhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516502;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IYL3DP0dtMwZDKYtVoaap9VrILSL4kQHPFjN3mRk7os=;
	b=TZA+7Bq/Flx25jpwsJtp4h5DaqfnGcgnm6a3532aQQjc+RsELO0mDfxDWe9DBsqR2+hZ
	 6CCDO6CNeVPxRsSS73QHlZ2imNfG4WgV0ec9PZcmdk4uv+/nviVFRBDIbazjCbGI2lc5+
	 k8gmI0x+EvWQ6duLGdqOUFZMZeglLnLpMyEyiu9MfvBRR6Xc5HBOAlOyar/v0fM29BXIA
	 B4cM6AfI3qfVUzHcmJt1GBoVmV3sdHB6k/Nt2E5PQ4N8IL2hcmofDMQSkrXf7W1SEW4Co
	 NcSY1ypfuSXWfU1lSPFldcceYgL70vzkg2c1qKyAb/5mX9AKbND6p2FMPPsndiYYJjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZBZph021;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D0E606A337;
	Tue, 24 Nov 2026 10:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZBZph021
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 042491F000E6;
	Tue, 24 Nov 2026 10:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795516502;
	bh=IYL3DP0dtMwZDKYtVoaap9VrILSL4kQHPFjN3mRk7os=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZBZph021kepc7wBz0CpIkeXp6eA4YD9lFUKVJww0tpZeGDICVGXE8IzSLl3yLUsau
	 6Bc119u/N2rS7b0oGHbnVsVvl/OPvEGW5AMSWCdhStZMmc9lXMbebSr29J7j9NvVAJ
	 zXGZM1KehFQ9i5e1nTAlPSENKsIp/1CvFIJI6NLku4T+yWopw2u6G1tkzen4PHj+ZX
	 8BfldLXMKSmAC7PZAlIGuSFF+mGQlfIad92Azp21w1oHuc2DB9HwKD+1UTzU80MVSp
	 8mvIYBKw+rmwteKXhAYr6pHyjtuzqKKVaO3Fi9SZ3poCuitDaD/jw9VqVqULfja6o1
	 gE7x+Zpc6WB4Q==
Message-ID: <sashiko-outbox-230967@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: clock: Add Netrani RPMh clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: SignKirigami <prcups@krgm.moe>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-netrani-clock-v1-v1-3-ce10cedbfa4b@krgm.moe>
References: <20261124-netrani-clock-v1-v1-0-ce10cedbfa4b@krgm.moe>
 <20261124-netrani-clock-v1-v1-3-ce10cedbfa4b@krgm.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 10:35:01 +0000
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
- [Low] dt-bindings: clock: qcom,rpmhcc: unnecessary netrani-only
  required block
--

commit 90f4f65f950487160a6d6bc71de56ed2ff1f0843
Author: SignKirigami <prcups@krgm.moe>

dt-bindings: clock: Add Netrani RPMh clocks

This commit adds the qcom,netrani-rpmh-clk compatible to the Qualcomm RPMh
clock controller binding and requires clocks and clock-names for it.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/D=
ocumentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> index 5c9b653bc2aa5..6ab049ba4b6f9 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> @@ -24,6 +24,7 @@ properties:
>            - qcom,kaanapali-rpmh-clk
>            - qcom,kuno-rpmh-clk
>            - qcom,milos-rpmh-clk
> +          - qcom,netrani-rpmh-clk
>            - qcom,nord-rpmh-clk
>            - qcom,qcs615-rpmh-clk
>            - qcom,qdu1000-rpmh-clk
> @@ -68,6 +69,16 @@ required:
>    - compatible
>    - '#clock-cells'
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: qcom,netrani-rpmh-clk
> +    then:
> +      required:
> +        - clocks
> +        - clock-names
> +
>  additionalProperties: false
> =20
>  examples:

[Severity: Low]
Why does this allOf conditional require clocks and clock-names only for
qcom,netrani-rpmh-clk?

Every SoC in drivers/clk/qcom/clk-rpmh.c uses __DEFINE_CLK_RPMH, which
parents all non-BCM resource clocks to the xo input clock, and every
existing qcom,*-rpmh-clk node in the tree already provides clocks and
clock-names =3D "xo".  Either drop the per-compatible allOf block or move
clocks and clock-names to the top-level required list.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-netrani-cl=
ock-v1-v1-0-ce10cedbfa4b@krgm.moe?part=3D3
