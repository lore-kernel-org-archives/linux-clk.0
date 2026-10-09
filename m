Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7601247207D;
	Fri,  9 Oct 2026 07:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530091; cv=none; b=ZxaiU0S3eqaNulCUYTFyN7LLRDNH0QZCZIW6cSoOdEwI3onSqvTFqZofBEpcsPGcoznGeA+wva1ASxxNh85+EF9M50JgT3mJx8ZcBt8NTTlykaz3nWvA9+Io6QF3Tj9AcclVsJfIj+8EzQCfJNVIzfD951PlNHv7cVeB1OCXt54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530091; c=relaxed/simple;
	bh=x+8W1o5iZDCBupsgJB3lFuWHobzYAATxT41tVh4ICck=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=DEPBPQ49UBcM1fjRmm5Py8W0SnwgoahWE8TleTiG7C66be9+PWHhu4ycDH68kwnjnSPtIMriZPkk/FN/nIfgy5HMRof94ZsexZUmHYC6bKLO0mrM/jTL5P7sDgulsQgVbOlsPbznrEqFK6NLYull+4qLFC+98RjKr45C7Z8nAoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J7CCJyoh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J7CCJyoh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB1A61F000FF;
	Fri,  9 Oct 2026 07:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791530090;
	bh=Hd2krHgbG00KRkAofUP5NXgFZrqY28aMU+kwhWJNQEk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J7CCJyohYE5rsJBZXtsSPq4B5Aj5l7n0BrdXOoNhPVVNt12WeSM/tCHhqr8qGYQgr
	 7QsRjLLE2NgIwaKjrTr81X8LFnXkpNAiymzCx8vk5Yf5evopdYEpzwGvpImCuTkrwg
	 cOW5VsujVbgbvYp2MUxD6mqAXS2vF0LN3QpmYVkLIwKbWdJb6f7oUkQtgkbF0oKcnF
	 ahNNopnOblL1nI3XSkg0QcC2C0OmSrQmf/0g1/71Yx+FKPGdz64tYuV1C3SlhQAzwj
	 7gvH2CwQ7zktq7XPZMXPkJ4B89uKKhTD13c+aPyPC6PU4Subq7KS0Bn6p4lj7BZlWE
	 sM8S16UdXcM2A==
Message-ID: <sashiko-outbox-164985@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/3] dt-bindings: clock: airoha: Document support for
 AN7583 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261009070725.13196-2-ansuelsmth@gmail.com>
References: <20261009070725.13196-1-ansuelsmth@gmail.com>
 <20261009070725.13196-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 07:14:49 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dt-bindings: missing #reset-cells required constraint for an7583-scu
- [Low] dt-bindings: semantic mismatch in airoha,chip-scu property descript=
ion
--

commit c28c3ce960f1267fadf690b955c513b03dbd1a46
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: clock: airoha: Document support for AN7583 clock

Document support for the Airoha AN7583 clock. This is based on the EN7523
clock schema with the new requirement of the "airoha,chip-scu" phandle.
The patch also adds additional bindings for clock and reset lines.

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

[Severity: Low]
Is this description accurate regarding PCIe configuration?

The commit message states that the Chip SCU provides access to some clock
gates and rates, while the SCU provides registers for resets and PCIe clock=
s.

This description attributes PCIe clocks and resets to the Chip SCU rather
than the main SCU. Could this description be updated to match the hardware
architecture outlined in the commit message?

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

[Severity: Low]
Does this new compatible string also need to require #reset-cells?

The patch introduces dedicated reset line definitions in
include/dt-bindings/reset/airoha,an7583-reset.h, indicating this variant ac=
ts
as a reset provider.

When a hardware variant acts as a provider, the corresponding standard
cell-count property should be explicitly added to the required list.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009070725.1319=
6-1-ansuelsmth@gmail.com?part=3D1
