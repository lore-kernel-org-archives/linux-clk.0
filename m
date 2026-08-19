Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2529B3DA7D7;
	Wed, 19 Aug 2026 22:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787178099; cv=none; b=emOEIXaL83LWqMEILZAhzz3YgtqOs3u1ebM0XQwqustBBw4UMtvLOmEOa2hXGHTd0MEDJLUppmT+6MrsxY/c/kKIdH+Uv5TU7VbMpm6kpX2aUxKJjOT0mBYfkZw7ansj8HPnlkQpa3yBI+rjujkhm8YMGnSbP16chtWLWl8Qmn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787178099; c=relaxed/simple;
	bh=eARO++AoB+mJvW20ahggr2RinWfmmEA4m7HAHI0pHN0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SVsbZnkHn3b3dR+TVOS9Q18nebFZc0skoWU7VyBr6p7+xXFdemIRiwbqt/FyE+NUPzziDV8n/CWCboBJrdIMwwgdJH/M8CjMfU/Q+hlK1LqOMMMLR01hjvq9NSGE1wEtgOREhyxiXVu/usUPpi+SLMozx3fJ+hNra21YPhlgY24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VuTMQ0t3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VuTMQ0t3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 797DA1F000E9;
	Wed, 19 Aug 2026 22:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787178097;
	bh=ZB6ijTgeUuq9eNfTn53cUMUX/vsRRYpJirU0Vu65VWc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VuTMQ0t3FCFWTBc4RaGVnjhIGi+WVmzThn4DONDaOwUddlF2CRk5hblk/Tj+P3Vq6
	 zCbWz25e+10hJUHYSCvw7EoqWUNonchxgSPFaMAAgeUu9lQHrJMZbNdeXimCzd3oCF
	 /2/7RoHNt1R1EUkx4snKAP2a/0qx+fbgwAwvej22C2Z06GNYtg6bbvJ2ROoL+rkVH7
	 MXnx10pSDrwHjTQr1qD2GxQZOjMfAH0a7pG7Eyv/Pr76t0uR1R9wm1BxYC10dvfuRE
	 I/cixXPk0I0xVxtnBHPVfJOdfCDs4EPIMgQbCIYZG/F2mB1A4jRT7wupIP7txmMttr
	 E6CHhXbLI5caQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: clock: airoha: Document support for
 AN7583 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260819221458.30040-2-ansuelsmth@gmail.com>
References: <20260819221458.30040-1-ansuelsmth@gmail.com>
 <20260819221458.30040-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 22:21:37 +0000
Message-Id: <20260819222137.797DA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] The device tree binding defines the SCU as a reset provider but =
omits `#reset-cells` from the `required` properties list.
--

--- Patch [1]: [PATCH v6 1/3] dt-bindings: clock: airoha: Document support =
for AN7583 clock ---
commit d5f1a3bf6c2e7155e5e00666d8f07ae07a173ed5
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: clock: airoha: Document support for AN7583 clock

This commit documents support for the Airoha AN7583 clock, building upon the
EN7523 clock schema. It introduces a new requirement for airoha,chip-scu and
adds supplementary bindings for additional clock and reset lines.

> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.ya=
ml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> index eb24a5687639e..edecc635807be 100644
> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml

[ ... ]

> @@ -50,12 +51,30 @@ properties:
>      description: ID of the controller reset line
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

[Severity: Medium]
This is a pre-existing issue, but since the binding defines the SCU as a re=
set
provider and this patch adds dedicated reset definitions, should #reset-cel=
ls
be included in this global required list?=20

Without it, device tree nodes using the airoha,an7583-scu compatible string
(or other variants in this binding) that omit #reset-cells will incorrectly
pass schema validation, potentially allowing incomplete device trees to cau=
se
runtime failures in dependent drivers.

> =20
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: airoha,an7583-scu
> +
> +    then:
> +      required:
> +        - airoha,chip-scu

[Severity: Medium]
This is a pre-existing issue regarding reset providers in this file, but if
#reset-cells is not meant to be globally required for all compatibles, shou=
ld
it be added to this conditional required list specifically for
airoha,an7583-scu alongside airoha,chip-scu?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819221458.3004=
0-1-ansuelsmth@gmail.com?part=3D1
