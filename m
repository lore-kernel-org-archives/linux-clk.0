Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E9A411FBE;
	Mon, 24 Aug 2026 12:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573296; cv=none; b=QHj4vzpuKkF6nxN/JMzfA8Ncw+c3URORd+PvFTYocdkpkna65M9X/uw11GRUXY+Jqr+9dECyrvF4WsTw61oxaCKIhl30alpjEoQ0IIGVbjBZPN2D6G34wipY7CIlhm3kQI5PGQ8kvfKdhEvnD4IVMIrqdr16/jJWlNfkiXuxn0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573296; c=relaxed/simple;
	bh=UxzYee5uqZctT/lK1V9L5P0zStyUYJd2juUKNdq7gzc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J905ZdqF+mom1VJV+t6Ho6RdMxlXiItDBE1DkGNMmZVcJOLJarXbEfAO7q+IwJlKz8LZZWq47A/QDz+LYjuVGygRNKKZSKvJFs8LyvT0yQJwQyeKg834/XR67VmjNIZ6wIaCHwateUUmq6R5izkZZv0J6UPIiGNNNyw8jV44ruA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fBFpk7ED; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fBFpk7ED"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56DE71F000E9;
	Mon, 24 Aug 2026 12:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787573294;
	bh=BJNw/A7EJwUq7bjWoPqgdPyCYyihqIFj3DcMwf70Gio=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fBFpk7EDJSgt/Rv3Rb62PsFOxN+Ztgr71OxC+eKQS7wQRCT+3gQkaZzgxGP8TFH2r
	 9IturorovmfkfMnwgICA5lQ6MaQ8DiyDeTRSsF1MV4YRveler1XJRtixlkJSia4YvK
	 jbqnK2BckHzZR2ihzHCz8uGqF2ieJUT7Y2qdJlKJ2nB9bUShqroELP00qbUXo/RAgz
	 ozDXP8DsAxzhh433JKk8HRuHvqEDeQigcGmTXrJeNzUxWGRqgjh6V5rIk37ZeJEvsB
	 hXVBu7xSAYy7nNbYd7BvhPFk0tnl/IPb7b9rcF9cONOXMZNr9SRX6BBL1YAzYsq0vt
	 jfWVsEqMjysaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/47] dt-bindings: clock: qcom: sm8550-gcc: Add CX
 power domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-7-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
 <20260824-qcom-tie-cx-to-gcc-v3-7-f1205a92682b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 12:08:13 +0000
Message-Id: <20260824120814.56DE71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Making `power-domains` unconditionally `required` breaks schema bac=
kwards compatibility for existing Device Trees.
- [Low] Inconsistent indentation in the YAML example node.
--

--- Patch [7]: [PATCH v3 07/47] dt-bindings: clock: qcom: sm8550-gcc: Add C=
X power domain ---
commit 6ec2187de5227c13379772ac36b81930a158c612
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

dt-bindings: clock: qcom: sm8550-gcc: Add CX power domain

This commit adds the CX power domain to the SM8550 GCC binding so the provi=
der
can describe the dependency in devicetree. It also updates the required
properties list and adds the property to the example.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml=
 b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
> index c4e9b9bb63f51..26b78bd0afe6b 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
[ ... ]
> @@ -31,9 +31,15 @@ properties:
[ ... ]
>  required:
>    - compatible
>    - clocks
> +  - power-domains

[Severity: Low]
Does making power-domains unconditionally required here break schema valida=
tion
for older devicetrees that were created before this property was introduced?

>    - '#power-domain-cells'
> =20
>  allOf:
[ ... ]
> @@ -55,6 +62,7 @@ examples:
>                 <&ufs_mem_phy 1>,
>                 <&ufs_mem_phy 2>,
>                 <&usb_1_qmpphy>;
> +       power-domains =3D <&rpmhpd RPMHPD_CX>;

[Severity: Low]
This isn't a bug, but the indentation here uses 7 spaces whereas the surrou=
nding
properties use 6. Should this be aligned to match the rest of the example n=
ode?

>        #clock-cells =3D <1>;
>        #reset-cells =3D <1>;
>        #power-domain-cells =3D <1>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-qcom-tie-c=
x-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com?part=3D7
