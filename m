Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A16747CA88;
	Mon, 12 Oct 2026 12:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806822; cv=none; b=eeVVm9YWcShasNHW/RW1uoGitpHkV4EhIhhmWomIcYyA02Aov6bLDaCYMXylecxSbMpvAhepOjUy1AqKn9/TGTuPOy1nJ7QhU6ssPkPcGZ9113mMOpCqJcaLUFR0FWvai55A1krrDeMMX/hlgsS4UK3ibcDwgrcrhPxp20fbGjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806822; c=relaxed/simple;
	bh=6xcV5AmorJyeP0TtnIp/ohTMeBq3FiOCi3QVrliUakY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=SpaPk1nU46IRhmKi/evjcLmWtzvaCOKQQuoDlur42qMxQ08091BTW6pgt34RDl6d/IbPD//c7leg2dVzRnjSrrSR/fsaEbx+OXcgtdMCuS6yMrme2pUbe/q8CVyoayxr05tSunN0k0cB1hSOZNRbJHtVk3Yq4jrNWzVcf7C4LiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aj6IhpFe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aj6IhpFe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9F21F0089B;
	Mon, 12 Oct 2026 12:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791806817;
	bh=PpLC6yl0M6B3rREN/r8tW5bFW8cxK8ETKA150T1yeBE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aj6IhpFei3c8vlTe9llfGW1ncOZCbJTXr3v0p0BuBpiNYtPb/s1SnD4SuoEm2woYl
	 7xizqkzCAzbyb94afLlFprUltah44PcYA/LkTCZGhfBQxxvfYj5JAsTUdiKICewaLC
	 z71hP6Tqf5k7NVLC2Db3sTtLyOAfaKBxPykmyV1QcRkQcMaiC5metY6qQ1qPNZb94G
	 N/h2PyNcRndfx4a6wIXWf3FzBWAju82Zig59ICqedi5KDFDOAfiD5pRJHrJduh71Fs
	 p8v4ve+1T4nJC+f/1UPQ0igNWneDuGGcWxMCsz6s78iBALRvMgrk4SKDQj7sLeVT2e
	 +6DzCaA2lOzHg==
Message-ID: <sashiko-outbox-168066@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/3] dt-bindings: clock: airoha: Document support for
 AN7583 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20261012115954.92718-2-ansuelsmth@gmail.com>
References: <20261012115954.92718-1-ansuelsmth@gmail.com>
 <20261012115954.92718-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 12:06:57 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: missing #reset-cells and #phy-cells in required pro=
perties for airoha,an7583-scu
--

commit 538a7c87406554f4bcd77061661b7f96dc72a786
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: clock: airoha: Document support for AN7583 clock

This commit documents support for the Airoha AN7583 clock, based on the
EN7523 schema. It adds the airoha,chip-scu phandle to make the separation
of SCU and chip SCU registers explicit, and introduces bindings for new
clock and reset lines.

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
Does this list of required properties for the airoha,an7583-scu variant need
to include '#reset-cells' and '#phy-cells'?

Since this variant functions as a reset provider and permits PHY serdes
selection, omitting these from the required properties in this conditional
block could allow incomplete device tree nodes to pass schema validation.

> +
> +    else:
> +      properties:
> +        airoha,chip-scu: false
> +
>    - if:
>        properties:
>          compatible:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012115954.9271=
8-1-ansuelsmth@gmail.com?part=3D1
