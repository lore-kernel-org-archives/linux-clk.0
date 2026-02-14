Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724D330BB83
	for <linux-clk@vger.kernel.org>; Sat, 14 Feb 2026 20:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771102698; cv=none; b=A049zOL7Mw1TQg6vqJehp4Akfp9nA7gdBD8XN//6AJ9e+bVBpgOJ4qGItCjfd3iJwFTafzHSARVqmDbvpopfUShY+sLqFR5VDlcKVmrjKq6Stv4JbwGsc/3opAFVuveWh7GAagOFanLd8be/Aqg+IP5aYTfAxraFVnICfaLkfS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771102698; c=relaxed/simple;
	bh=BCRaekG0mPRDTxYs/HAC7EfkWLL90vi4F1TR8Vw8prQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lwKIC0610YGFD4+Uo1L860mTcnwpbFgGXJQL/W3EZOCsbqbUvY7VawpUB6ROB5VQV3aeoBMjXc8+HaAMHb1Rfg/3Xa570Vr6qOSZPXwe54rLujKQ1De7BMwKux7xASnDRaI48t0p1lbkCWW/EcqwR1P6NwPTK6+xbwiniBJOfoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=EJS9fNsf; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="EJS9fNsf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1771102681; x=1771361881;
	bh=sxr61V8XNLfdiPJHCCBrXGD1CfZlEt7pH7ytXuYehjs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=EJS9fNsfAWiozXrIhF49dOoEcdCHU7MKfZjfPab0vXYsVHuarc3w8dJCnvXsRBjvn
	 IbwuijpFtgc1FXy8Or8gpzmc3+/XXSCN0azvsoOjnsceY12HFXRb9NWwTpWeUEnQ5m
	 ErqG85kbZ5jdkRDxgwTxOlFUtPC/81V7m52VGqC/1aRqVxcW1kjr0pa/5s5k//H5dt
	 ClUcB4Hla18ztWAzrAaTzWrhpd7PU0FpUW82z/xHQmTSCYaeFQ/w4jnSsDEo/XTpx5
	 vTnI/TrHYcH/Vn8PKjm5wPnoswg/rOxl2r56UP2axUn/msYxpDEd6ODgPGtcNNOGaV
	 uhPjXwZ7p/w4A==
Date: Sat, 14 Feb 2026 20:57:57 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Harry Austen <hpausten@protonmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: xilinx: add description of user monitor interrupt
Message-ID: <NptKiK70heOFOIj9x6tz-gtS1m7ueBoa3SNCijidv1yeFPpt9OAPd-LTgBUbrEfAA2u3DTJHzlUDjv17fuddIPZ4m2YEZ1dTaMQuiXDGkD0=@protonmail.com>
In-Reply-To: <20260214-daffy-roadrunner-of-inquire-babdce@quoll>
References: <20260214180933.42143-1-hpausten@protonmail.com> <20260214180933.42143-2-hpausten@protonmail.com> <20260214-daffy-roadrunner-of-inquire-babdce@quoll>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: 8f085b10f653e4932cb790b844da8b3a2cfb1a13
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Saturday, 14 February 2026 at 20:40, Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> On Sat, Feb 14, 2026 at 06:10:16PM +0000, Harry Austen wrote:
> > This Xilinx clocking wizard IP core outputs this interrupt signal to
> > indicate when one of the four optional user clock inputs is either
> > stopped, overruns, underruns or glitches.
> >
> > This functionality was only added from version 6.0 onwards, so restrict
> > it to particular compatible strings.
> >
> > Signed-off-by: Harry Austen <hpausten@protonmail.com>
> > ---
> > v3 -> v4: Slight rework and rebase, removing Krzysztof's R-b tag
>=20
> What exactly changed that you removed the tag? Rebase is not a reason.
> You MUST be here specific about the reason, otherwise why would I like
> to review if next time any rebase and slight rework will drop my tag?

Sorry, good point. By _rework_ I mean that I have removed the allOf. I will
be more specific next time.

>=20
>=20
> > v2 -> v3: Add Krzysztof's R-b tag
> > v1 -> v2: Fix binding errors by moving interrupts up front, restrict la=
ter
> >
> >  .../bindings/clock/xlnx,clocking-wizard.yaml  | 24 ++++++++++++++++++-
> >  1 file changed, 23 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wiza=
rd.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> > index b497c28e8094f..7688601f1f31b 100644
> > --- a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> > +++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> > @@ -38,6 +38,14 @@ properties:
> >        - const: clk_in1
> >        - const: s_axi_aclk
> >
> > +  interrupts:
> > +    items:
> > +      - description: user clock monitor interrupt
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: monitor
> > +
> >    xlnx,static-config:
> >      $ref: /schemas/types.yaml#/definitions/flag
> >      description:
> > @@ -66,12 +74,24 @@ required:
> >    - xlnx,speed-grade
> >    - xlnx,nr-outputs
> >
> > +if:
>=20
> Why isn't this in allOf? Code is fine, but why changing it?

There is only a single if condition, so the allOf is not required. Removed
for simplicity and reduced indentation.

>=20
> Best regards,
> Krzysztof
>=20
>=20

Thanks for the review!
Harry
