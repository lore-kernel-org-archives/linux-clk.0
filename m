Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9CD416855;
	Mon, 24 Aug 2026 12:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787574155; cv=none; b=owdYe4RABPVeydY0Ikji3io1+8fvta3dFY+BARtlNUB6ovjAjAPN1yJJZ3iZaZ27WKyK9r9YI4m/SSa1X8U+EcXJstPOvk3LMOo8YWrosITj/Xiqhk6FjWVL5q1rVOe1mUe86cmJ2WS3dc5lI1mdeEUwFtpmpY3YBZH9yykSmSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787574155; c=relaxed/simple;
	bh=xkwor4uCH5+w4J7hmElltk8ITkpl7EF0QbX6ERXb+cI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kXKpVjFSiF6NuMTTMaPqZ7YF3PyVUr/A+sHpmJYOMevkiO+OSyMrbs6gAlt0fnJ43tMbymUBwR7C5p9hSpRSYWK+VnXwoKdFVwiM5Q/MN1f9/Oo1jg4otWTC9kj61+PeaTx4RMfHmNPRehXJZ1FRE2KxG04p9Ohv1o/PNvaDeF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dc/UDxtI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dc/UDxtI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4166A1F00A3D;
	Mon, 24 Aug 2026 12:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787574153;
	bh=CcKmrm8WwpxVB3RAL5L/JKHhCZjV/eky7ta3W8nxdf8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dc/UDxtIZXPsI3/7h3aF27QPMejnN7j8hHzAwnw4qF7kaeBr54EVpP6V9Z/hVA5UO
	 Me03anEB/Ja0zHwSEXFc0P6CkgvzNXuJuY8FntTNv91ReKo/7spUDdZg+SnkvRA6Cp
	 OmzD/5OQ0cP7NLg+162vPHbjuJ+bxmy3PaDO1DmnS1k9FP1J+RN4scD6912uUBzhi6
	 ZYyHWeqOpPyUdl7N5MxuWPZfqkfg6w5i8aOWmEzgZSfWfAgDJko8ov4gMnGV9BBNwf
	 IGDW/DZkelPd9x69tm2UPGt4b7WtScdtJHaVMhYvyFQLTJsqOwhcy0RypXYDKExN4C
	 EbgeKZ2E6bAew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 17/47] clk: qcom: gcc-sc7180: Tie the CX power domain
 to controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-17-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
 <20260824-qcom-tie-cx-to-gcc-v3-17-f1205a92682b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 12:22:32 +0000
Message-Id: <20260824122233.4166A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Enabling runtime PM on the gcc-sc7180 controller fails to allow =
the CX power domain to power down because CLK_IS_CRITICAL clocks hold perma=
nent PM runtime references.
- [Medium] Manual register configurations performed in probe() will be perm=
anently lost if the CX power domain successfully powers down.
--

--- Patch [17]: [PATCH v3 17/47] clk: qcom: gcc-sc7180: Tie the CX power do=
main to controller ---
commit bda4bbdc6882e3eeb0fc4bbaf2482c52d18aab7d
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: qcom: gcc-sc7180: Tie the CX power domain to controller
   =20
Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

> diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
> index 4a49ad7a9e5be..f3a245470a4de 100644
> --- a/drivers/clk/qcom/gcc-sc7180.c
> +++ b/drivers/clk/qcom/gcc-sc7180.c
> @@ -2418,6 +2418,7 @@ static const struct qcom_cc_desc gcc_sc7180_desc =
=3D {
>  	.num_resets =3D ARRAY_SIZE(gcc_sc7180_resets),
>  	.gdscs =3D gcc_sc7180_gdscs,
>  	.num_gdscs =3D ARRAY_SIZE(gcc_sc7180_gdscs),
> +	.use_rpm =3D true,

[Severity: Medium]
Will the CX power domain actually be able to power down?

The Common Clock Framework automatically prepares clocks marked with
CLK_IS_CRITICAL during initialization, such as gcc_cpuss_ahb_clk:

drivers/clk/qcom/gcc-sc7180.c:gcc_cpuss_ahb_clk {
    ...
			.flags =3D CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
    ...
}

Preparing these clocks calls clk_pm_runtime_get(), which increments the
runtime PM usage counter of the GCC provider device. Since critical clocks
are never unprepared, this reference is never dropped.

Does this prevent the controller's usage count from ever reaching zero?

[Severity: Medium]
If the controller does manage to runtime suspend and the CX power domain
powers off, will the manual register configurations performed in
gcc_sc7180_probe() be lost?

For example:

drivers/clk/qcom/gcc-sc7180.c:gcc_sc7180_probe() {
    ...
	regmap_update_bits(regmap, 0x09ffc, 0x3, 0x3);
	regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
    ...
}

Because gcc_sc7180_driver lacks dev_pm_ops with a runtime_resume callback
to restore these settings, and does not use a regcache, will the controller
resume in an uninitialized default state?

>  };
> =20
>  static const struct of_device_id gcc_sc7180_match_table[] =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-qcom-tie-c=
x-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com?part=3D17
