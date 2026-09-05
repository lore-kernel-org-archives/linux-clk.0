Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E322137C11F;
	Sat,  5 Sep 2026 21:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788643791; cv=none; b=Ou9CdqTQwe8D8laZp+F1iH/aDQ7tXxHZa71/wHlOYqg+OenSCNva+giADHWDM42afJAWODMwSABjlR+MvCJiyFHLSy155VVc4HPYQk/prUAkEI4Cx23SxlQ2Ud0ZeLU+ViERVe3fANt2GJazMmsJe3kCOwIdP1R1Vzfh4JOGaZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788643791; c=relaxed/simple;
	bh=oWN/H6WGVeieFyQse2VGvlEfCGOvTutfFggRgCsaW+M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XnyhnhNdtp2XBLSrfVpT7/mx1f0vWlTms032KKf6KceCnT2JImYCzSJF5A/jE3/vjoAo8m9AKa4mbzUPf7JioWlGGr4T3FoIw0yf1J01Qt6UAfWkNgqcD3+6P73gPrBFW6MpZoxpSc26NUWEpcyFLm3AYyGlJ10eIS8Rx62hfsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m/uD53/l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m/uD53/l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3141F00A3A;
	Sat,  5 Sep 2026 21:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788643789;
	bh=l1dHl5U7sG1Abfgi5k3wl/3LuQXs9UUnD31mJJDslvg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m/uD53/lqmCk5Lsn1RJOluWf/oy/AJBjSHY+9KOlPA9GjoeasLDHed4W/txXDIYFZ
	 R23GmWWB+myUm1PXWaEY570e9JW3IMn/iRQJV0M4kH1j7S0wSuct4rIhHwbDIuTxUI
	 viZB0c5qHdHn+w5Mafb2BxM1EKtdScdk5lS+WaViWF4jV+yIoh199HcdQcwQXcOpE8
	 rGI6qqmHtiAk6D1JYw9S67nGlKG1A626ffwUFA6KKP4HC3ZUVR1Usyjc+J3H82HcMc
	 0/YVrAS0npeu9UPqKAtYyZhfHWklHfA50wXzkKmrUd/e6FZ/jakPIcBSYbzPzjv2K7
	 Vn55FSN28GKWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dt-bindings: clock: ti,dm816-fapll-clock: Convert to
 DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260906-ti-fapll-clock-v3-1-b0ded340c62b@gmail.com>
References: <20260906-ti-fapll-clock-v3-1-b0ded340c62b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2026 21:29:48 +0000
Message-Id: <20260905212949.3E3141F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing parentheses around addition causes an under-allocation of =
the `clks` array, leading to a heap buffer overflow.
- [High] Missing bounds check on `output_instance` read from the device tre=
e before using it as an array index.
- [High] Incorrect `clk_num` tracking breaks clock retrieval for sparse or =
failed outputs.
--

commit df6f3e72211e7dd6f2410f0f3ef1e36b9dec0028
Author: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: dt-bindings: clock: ti,dm816-fapll-clock: Convert to DT schema

This commit converts the Texas Instruments DM816 FAPLL clock binding from
plain text to YAML DT schema. It strictly enforces #clock-cells =3D <1> and
adds clock-indices and clock-output-names as required properties based on
driver requirements.

Link: https://lore.kernel.org/r/20260717-ti-fapll-clock-v1-1-1b684cb2543b@g=
mail.com

> diff --git a/Documentation/devicetree/bindings/clock/ti/ti,dm816-fapll-cl=
ock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,dm816-fapll-clock.=
yaml
> new file mode 100644
> index 0000000000000..423b7405e398e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti/ti,dm816-fapll-clock.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/ti/ti,dm816-fapll-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#

[Severity: High]
This is a pre-existing issue, but I noticed a potential memory allocation
problem in the corresponding driver code when looking at the DT conversion.

In drivers/clk/ti/fapll.c:ti_fapll_setup(), there is an under-allocation
due to missing parentheses around the addition:

	fd->outputs.clks =3D kzalloc(sizeof(struct clk *) *
				   MAX_FAPLL_OUTPUTS + 1,
				   GFP_KERNEL);

The expression sizeof(struct clk *) * MAX_FAPLL_OUTPUTS + 1 evaluates to
57 bytes on a 64-bit architecture, but the code populates the array up to
index 7, which requires 64 bytes. Does this cause an out-of-bounds write
that corrupts adjacent heap memory when the driver probes?

[ ... ]

> +  clock-indices:
> +    description:
> +      Maps child synthesizers to physical indices 1-7. Index 0 is physic=
ally
> +      reserved for the Master PLL.
> +    minItems: 1
> +    maxItems: 7
> +    items:
> +      minimum: 1
> +      maximum: 7

[Severity: High]
This isn't a bug introduced by this patch, but there is a lack of bounds
checking on the device tree values read for this property.

In drivers/clk/ti/fapll.c:ti_fapll_setup(), output_instance is read from the
clock-indices property and used immediately for memory offsets and array
indexing:

		if (of_property_read_u32_index(node, "clock-indices", i,
					       &output_instance))
			output_instance =3D i;

		freq =3D fd->base + (output_instance * 8);

and later:
		fd->outputs.clks[output_instance] =3D synth_clk;

If a malformed device tree provides an index larger than MAX_FAPLL_OUTPUTS,
could this cause an out-of-bounds heap read and write?

[Severity: High]
This is a pre-existing issue, but it could interact poorly with sparse
clock-indices from the device tree.

In drivers/clk/ti/fapll.c:ti_fapll_setup(), clk_num is incremented
sequentially for each successfully registered clock:

		fd->outputs.clks[output_instance] =3D synth_clk;
		fd->outputs.clk_num++;

Because of_clk_src_onecell_get() uses clk_num as the array size bound, if
the device tree defines sparse clock-indices or if a clock fails to registe=
r,
clk_num will be smaller than the highest registered output_instance index.
Will this cause valid clocks at higher indices to be rejected and become
inaccessible to consumers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-ti-fapll-c=
lock-v3-1-b0ded340c62b@gmail.com?part=3D1
