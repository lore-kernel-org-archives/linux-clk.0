Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0292EB856;
	Wed, 19 Aug 2026 13:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144638; cv=none; b=V+R4BaggPxiX4ZQlJB00Dh7leHJpez/1IznalxP/LXsemljioT9LhW0pU0K3AwnV0fDEeGQcVHYVQotjFrtEAzsp1Mf3J42rDKxPVjUteyM4pSFF4CNcwYuw1D7+O3Z0aSmyVHFwULJ05oaTLJWwgh083XM61EAbg+Df+xen4nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144638; c=relaxed/simple;
	bh=EmtKjy9fKcy47UQKFVz9QnEIa8tPRnJMS1YNzEC33Pc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ScunFCpzlXsWCL2C76dAeuHF1AYQfuKpc+zMCK2ffOiw+Ty0lpiZ4hdEz+qXNPAVjJPhB7B/2axLwpK+oJr/vSaTRqNFX3JeY6FaIG+IY55fs5SytczX5sZzG50jbBVfmV12Dt7Bg8lMJBYplIalTDmq5p7MO7U8G13+d+cmTPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gzl5psVT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gzl5psVT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D3461F000E9;
	Wed, 19 Aug 2026 13:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787144636;
	bh=uii8O7KCRN3qZKzj50uvw3P5wxJKVUqhtSkZWmnKAzo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gzl5psVTRfAek3N8h6G9dAinotQqI2UzqbSZZCEm+kRJhX2qgtlkbTHhD01AZz2MT
	 ssxwkglRpgD0V5zxe4IPdlyML9SNLDHOhptsKwb+ldMaLtzPnMg0jMFZsnE4t65H7P
	 kKbVfVkPqhePZea17+pgSLP5Hfb0WI8WgW38J6qlO9X5PtTgXnKp/HhEFKsJ2juJtw
	 mfvvkx+hHMQjHMVXEGvecP2MI7pahkac86FSZqUYeWea0HrZygefH5pdnGI+k7uYat
	 99AXPFnRxaW1Ua7AZJ/lKMpQFnV/9msPicPW3lnKj4UGHJt5/kc+Gz+aLLs8QJSDlE
	 4fnN0K4Bi02hw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/16] arm64: dts: qcom: sm8550: Add GCC CX power domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-12-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-12-840034124e73@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 13:03:55 +0000
Message-Id: <20260819130356.4D3461F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Adding `power-domains` to the `qcom,sm8550-gcc` device tree node wi=
thout updating the corresponding YAML binding causes a `dtbs_check` validat=
ion warning.
--

--- Patch [12]: [PATCH 12/16] arm64: dts: qcom: sm8550: Add GCC CX power do=
main ---
commit fbc80a89d2b6530024ab43fff461d5268dfeb3c4
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: sm8550: Add GCC CX power domain

This commit adds a reference to the RPMh CX power domain for the GCC node
on SM8550. This ensures that consumer votes propagate properly.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/q=
com/sm8550.dtsi
> index 0e701e709235c..7137efb453467 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -1195,6 +1195,7 @@ gcc: clock-controller@100000 {
>  				 <&ufs_mem_phy 1>,
>  				 <&ufs_mem_phy 2>,
>  				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
> +			power-domains =3D <&rpmhpd RPMHPD_CX>;

[Severity: Low]
Does this change require a corresponding update to the device tree bindings
YAML schema for qcom,sm8550-gcc?

Adding the power-domains property here without documenting it in the binding
schema will cause a dtbs_check validation warning.

>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-qcom-tie-c=
x-to-gcc-v1-0-840034124e73@oss.qualcomm.com?part=3D12
