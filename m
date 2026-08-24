Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2AC40F8E3;
	Mon, 24 Aug 2026 12:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573911; cv=none; b=a/WBQgzo1hUmBoBBXfV6PKw5GIZ7ITq9y5S8hs0vfEkQ3OPPAT4GdozpXUtnxqJDodFnU80KnkGv847Ui2PmkoLhWgCAE73n+ipToCTyQ8hTM99W/CI33TkSXh5fXZWk+3FwJQ6PRGFRGQIhnE4OqgEbECLfZ4QPN5iSXJ3A+ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573911; c=relaxed/simple;
	bh=5HZxnhSHuAytSSJ6u/D9AiEJ0NAoNl+nQroTsvfX7Go=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ilWeJc8NHIdSabsfCeyPoz6nRNeDTEeqTrLXPjOo9eCWvme6YGmacfOu88NzWrwz0rZtMXRe0f9CczASV8rO0ydyXgTzjrf1NVah2U9IIdZuZuhg8S/NDN154e1tRdA/cFfFvgGRdaRkthRXI7tmiLj6MeZ25+sq/Z5qYnN0D9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2sPWKya; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2sPWKya"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AA41F000E9;
	Mon, 24 Aug 2026 12:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787573909;
	bh=r/qgWwOWwe7b9I7O/I8pLH2+IOF5rwcgNyrlR7/kvjM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U2sPWKya+ybozFifILrhG/LK8TB3OSC5SDRdHbCtTKLzguZzWgIT8MglNCDfpbN3M
	 FqmTNVycLHmiVN2zT9mjErpSwXYGDKYuLtvOxgIwF+QOUX0qI57uMGguRDZH2V1Ew7
	 auLYlf4iKl5pxGF4Zv1Toax6bNzcY9r69hcIO220YwYYPb19zER3cQq8zd2IoauCXL
	 6bJZ50O+pXq+BX0D26+I/u1aI8xOuY34UeMuhwB9Ya84Xr6tn0sNVdGNym87UxLBrL
	 yYFiItfckwz3NxBpVPCJP5FA9P85WgyF/cCEixRGgjnsykg1K+SmavxMIKNtUGk7HS
	 DsVy/mmaQb6nA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 20/47] clk: qcom: gcc-sdm845: Tie the CX power domain
 to controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-20-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
 <20260824-qcom-tie-cx-to-gcc-v3-20-f1205a92682b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 12:18:29 +0000
Message-Id: <20260824121829.99AA41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] The patch attempts to allow the CX power domain to power down wh=
en idle by enabling runtime PM for the GCC controller, but critical clocks =
defined in the driver will keep the controller permanently active.
- [Medium] Enabling runtime PM on a clock controller with `CLK_IS_CRITICAL`=
 clocks causes a permanent runtime PM reference leak on probe failure or dr=
iver unbind.

Pre-existing issues:
- [High] Reset operations lack runtime PM protection, leading to unpowered =
register accesses if the controller suspends.
--

--- Patch [20]: [PATCH v3 20/47] clk: qcom: gcc-sdm845: Tie the CX power do=
main to controller ---
commit c6cece4b4445a4812f7e7d75a76e3be120d33d8f
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: qcom: gcc-sdm845: Tie the CX power domain to controller

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

> diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
> index 57d54b45fa527..cde863dcf1851 100644
> --- a/drivers/clk/qcom/gcc-sdm845.c
> +++ b/drivers/clk/qcom/gcc-sdm845.c
> @@ -3959,6 +3959,7 @@ static const struct qcom_cc_desc gcc_sdm845_desc =
=3D {
>  	.num_resets =3D ARRAY_SIZE(gcc_sdm845_resets),
>  	.gdscs =3D gcc_sdm845_gdscs,
>  	.num_gdscs =3D ARRAY_SIZE(gcc_sdm845_gdscs),
> +	.use_rpm =3D true,

[Severity: Medium]
Does enabling runtime PM actually allow the controller to suspend given
the CLK_IS_CRITICAL clocks defined in this driver?

For example, gcc_camera_ahb_clk is defined with the CLK_IS_CRITICAL flag.
During clock registration, the clock framework prepares these always-on
clocks and calls pm_runtime_resume_and_get() on the provider. Since these
clocks are never unprepared, the usage count will never drop to zero,
which seems to prevent the CX power domain from ever powering down.

[Severity: Medium]
Additionally, if qcom_cc_really_probe() fails later (for instance, during
qcom_cc_icc_register), devres will clean up by calling clk_unregister().

Since clk_unregister() intentionally does not unprepare clocks, does this
leave a permanent runtime PM reference leak for any clocks marked with=20
CLK_IS_CRITICAL that were registered before the failure?

[Severity: High]
This isn't a bug introduced by this patch, but enabling runtime PM
exposes a potential crash during reset operations.

In drivers/clk/qcom/reset.c, qcom_reset_set_assert() accesses hardware
registers without taking a runtime PM reference:

qcom_reset_set_assert() {
    ...
    regmap_update_bits(rst->regmap, map->reg, mask, assert ? mask : 0);
    ...
}

If the controller successfully suspends, and a consumer driver asserts a=20
reset before explicitly preparing its clocks, will this access unpowered=20
hardware and cause a synchronous external abort?

>  };
> =20
>  static const struct of_device_id gcc_sdm845_match_table[] =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-qcom-tie-c=
x-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com?part=3D20
