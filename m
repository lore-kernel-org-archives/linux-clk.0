Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836143AEF5F;
	Mon, 13 Apr 2026 09:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776070965; cv=none; b=sVC3FraFybUfLdADyNN3+OBQk9nw/3o7h0AM+2DzZ/qFGaXMNRDBiCitFdWbvRi0KqbustkVvx4BZIo8Sx+AS4gjKK/ED0OVbpYdqI/R+kN0gdJnZo+qqSfZNRGIg1kedEpLu8vbM1tgUPKgJXSmQfykhjmA2YLWL3Ys+DAFOOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776070965; c=relaxed/simple;
	bh=j+JO5oFC27vn/GCPwh7TNfq9kdb55nYUVTjp5DqxJ2Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kUDt5Gb/O+tzNJ8RGKpMLDrhhoZsNRGY2DGUfvrkpenkzapXSz/yhtAdTx4VYH3mDszuJi69gnwelmgGuexbIT1F5xJjdHX70x10aiOyaakNeQhCdhHxISuTJhmiRWjJm/yIJHf+VVfx6M64zY6Nf8zSkUOfzBmeHLyPjqjgbCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=pYHekFyz; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="pYHekFyz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776070955; x=1776330155;
	bh=6EQRubzM/AEv/VEDmB/opI5btdLEqW8vPuWMbSbjnOA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=pYHekFyzUJPxthK7/Tyn6rBiRl+p+fftG15CaXMJYLZ647IZveBXF+dDQtagT6mTw
	 eP2zg1P5y2sheRqDpvb5eLzzGqdbsw+mhGZRcBsPBvwOniW5iYlhMjcOQebNYFNg7N
	 1T2ebxF0FcyhfNUult07dGVu4SvKu0DElaKJwK4X/yOha5g3TlFiZe682IN5Sl1Qo3
	 +a4dH+pjOJM7j7Cfanpwdyr0zhTQluh5QPCpFJgIE163Qbu7DFp3O/03gKHeOfm2O6
	 mHK2qhh9EFeA21UXDo2YtcPiQ8gOFfbed7YxTlt+63BxafrvP0cjmOLeBgwmSfEj6o
	 UJ9b6O9p2eHKg==
Date: Mon, 13 Apr 2026 09:02:29 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: clk-rpmh: Make all VRMs optional by default
Message-ID: <70GGl_MdOrdjIh3ZXqqz5y2NU0HwZ-HIZIzhglTAIpsyiFeyFKqDUUQe8f-krzLSzirMGLjlDsk2YK3-Qo5c7XGqv8qq6NK5F_UCPdt_hqE=@pm.me>
In-Reply-To: <4dafae66-1ef1-404c-854c-b72d3313f5af@oss.qualcomm.com>
References: <20260412-clk-rpmh-vrm-opt-v1-0-37c890c420ff@pm.me> <20260412-clk-rpmh-vrm-opt-v1-2-37c890c420ff@pm.me> <4dafae66-1ef1-404c-854c-b72d3313f5af@oss.qualcomm.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: cc886b61da04f91ef81616e8137762c195ea0593
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, April 13th, 2026 at 4:48 AM, Konrad Dybcio <konrad.dybcio@oss.qu=
alcomm.com> wrote:

> On 4/12/26 5:30 PM, Alexander Koskovich wrote:
> > Some VRMs aren't present on all boards, so mark them as optional. This
> > prevents probe failures on boards where not all VRMs are present.
> >
> > This mirrors the downstream approach for this issue.
> >
> > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> > ---
>=20
> [...]
>=20
> > @@ -976,6 +982,11 @@ static int clk_rpmh_probe(struct platform_device *=
pdev)
> >  =09=09rpmh_clk =3D to_clk_rpmh(hw_clks[i]);
> >  =09=09res_addr =3D cmd_db_read_addr(rpmh_clk->res_name);
> >  =09=09if (!res_addr) {
> > +=09=09=09hw_clks[i] =3D NULL;
> > +
> > +=09=09=09if (rpmh_clk->optional)
> > +=09=09=09=09continue;
>=20
> if (rpmh_clk->offset =3D=3D CLK_RPMH_VRM_EN_OFFSET)?
>=20
> That would let you drop the rest of the patch.
>=20
> This also needs some additional background.. I would assume this comes fr=
om
> a slightly different HW (PMIC) configuration
>=20
> Could you please do `grep ^ /sys/kernel/debug/qcom_socinfo/*`, (perhaps
> censoring your serial number)?

/sys/kernel/debug/qcom_socinfo/accessory_chip:0
/sys/kernel/debug/qcom_socinfo/boot_cluster:0
/sys/kernel/debug/qcom_socinfo/boot_core:0
/sys/kernel/debug/qcom_socinfo/build_id:
/sys/kernel/debug/qcom_socinfo/chip_family:0x0000009f
/sys/kernel/debug/qcom_socinfo/chip_id:SM7750
/sys/kernel/debug/qcom_socinfo/feature_code:2
/sys/kernel/debug/qcom_socinfo/foundry_id:1
/sys/kernel/debug/qcom_socinfo/hardware_platform:11
/sys/kernel/debug/qcom_socinfo/hardware_platform_subtype:0
/sys/kernel/debug/qcom_socinfo/info_fmt:0x00000016
/sys/kernel/debug/qcom_socinfo/ncluster_array_offset:228
/sys/kernel/debug/qcom_socinfo/nmodem_supported:4294967295
/sys/kernel/debug/qcom_socinfo/nproduct_id:1135
/sys/kernel/debug/qcom_socinfo/nsubset_parts_array_offset:232
/sys/kernel/debug/qcom_socinfo/num_clusters:1
/sys/kernel/debug/qcom_socinfo/num_func_clusters:1
/sys/kernel/debug/qcom_socinfo/num_subset_parts:20
/sys/kernel/debug/qcom_socinfo/oem_variant:0
/sys/kernel/debug/qcom_socinfo/pcode:1
/sys/kernel/debug/qcom_socinfo/platform_version:65536
/sys/kernel/debug/qcom_socinfo/pmic_die_rev:2.1
/sys/kernel/debug/qcom_socinfo/pmic_model:PMK8550
/sys/kernel/debug/qcom_socinfo/pmic_model_array:PMK8550 2.1
/sys/kernel/debug/qcom_socinfo/pmic_model_array:PM7550 1.1
/sys/kernel/debug/qcom_socinfo/pmic_model_array:PM8550VS 2.0
/sys/kernel/debug/qcom_socinfo/pmic_model_array:PM8550VS 2.0
/sys/kernel/debug/qcom_socinfo/pmic_model_array:unknown (90)
/sys/kernel/debug/qcom_socinfo/pmic_model_array:PMR735D 2.0
/sys/kernel/debug/qcom_socinfo/raw_device_family:0x0000000a
/sys/kernel/debug/qcom_socinfo/raw_device_number:0x0000001d
/sys/kernel/debug/qcom_socinfo/raw_package_type:0
/sys/kernel/debug/qcom_socinfo/raw_version:0

>=20
> Konrad
> 
