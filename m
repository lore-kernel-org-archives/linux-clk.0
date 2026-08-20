Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AD54119F3;
	Thu, 20 Aug 2026 10:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221150; cv=none; b=PdC5f8Sc4CKuvGjBXKomENhwIVgDoWf6N8O8vma8lgNJLSI0AjsHk3Dln2Uoj1OtIWNife+prwJqh3xlYTvI9Pl5/Wi/3bU7X9jpaLIXBfhOEMh1pSPSi6BV+nXAgw8Z6b+zD66kBjyy/6u/6hUhVkktIUtePDZk3/FcCABqRWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221150; c=relaxed/simple;
	bh=zP5Np+o1UfWbv6bNeyO9EMrxm1bwbxI5QGvjtQBGAGs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cpueFaiaZt3z+/GcUA6cZ711cAsGpnUBT6v+GvNqa2+apKPzVFvAUBN9tz8qBBQ57dgnsob+BAiZ8nnHe0JcTDDhsSOLEEWq94+iNxnpeP8zOtwGZIQVbBUC+7ALmrfckurDlL9ymPcmiB1t0wk+m/aDRnrEIOGExb+C4BIsi60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZW38ANP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZW38ANP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925311F000E9;
	Thu, 20 Aug 2026 10:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787221143;
	bh=Ibw2sIwM3N4npx2gBLh9F3BpPh0jJd6QrUg3Cd9I0Qo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HZW38ANPkAZPf++ae6tGBcmnj1cw9xt965gLscLLLTqkuWFl/DRt8BJakqtrDQtJ7
	 /CInkCi6jmG2RalhT6ZnqtY9Fw19itBH6YzjSxVfNwsZgVDhG4FLEukz1Kb0hj8Q2b
	 Zrc8D6XmzvWpvOdSYlSwySnFqhVKEtjFqZs9YbASUImIYgoq9F+nnBJM7VgAoYgxYk
	 5UtYCFUml9XcsaO6VHk0B+A/qkCPeYJ9o3opi/Hnnxr7/jhtgrUJBANMLHQeVwSWKy
	 aNle4NCS+IPlE+6cM71ipvnjddw5hO2SgQDJ+QA/xOZES5BZKpFj3cSWSWs4BTEsRC
	 TVEmEzT22dIow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/16] arm64: dts: qcom: sm8350: Add GCC CX power
 domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-10-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
 <20260820-qcom-tie-cx-to-gcc-v2-10-e67ea30d8b7b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 10:19:03 +0000
Message-Id: <20260820101903.925311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing 'power-domains' declaration in the qcom,gcc-sm8350.yaml dev=
ice tree binding schema.
--

--- Patch [10]: [PATCH v2 10/16] arm64: dts: qcom: sm8350: Add GCC CX power=
 domain ---
commit da0614dca1afbc3aae13d37f6ec085e9fcaa4394
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: sm8350: Add GCC CX power domain

This commit updates the sm8350 devicetree to add the RPMh CX power domain
reference to the GCC clock controller node. This allows votes from GCC GDSC
consumers to properly propagate to RPMh CX.

> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/q=
com/sm8350.dtsi
> index 32b47f5ec1f67..84012a407c4be 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -699,6 +699,7 @@ gcc: clock-controller@100000 {
>  				 <&ufs_mem_phy 2>,
>  				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
>  				 <0>;
> +			power-domains =3D <&rpmhpd RPMHPD_CX>;

[Severity: Low]
Should this new property also be declared in the corresponding device tree
binding schema?

Looking at Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml,
adding the power-domains property to the devicetree node without explicitly
listing it in the binding schema's properties block can leave it unconstrai=
ned
and trigger an undocumented property warning during dtbs_check.

>  		};
> =20
>  		ipcc: mailbox@408000 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-qcom-tie-c=
x-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com?part=3D10
