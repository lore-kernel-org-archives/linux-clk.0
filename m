Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9B6417BCA;
	Mon, 24 Aug 2026 12:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787574308; cv=none; b=PZyag/ZJiEitj3I+its8Cqe7jHWqoI0uAohokrumUsQ6VayxNFixes/2d4Qrua+UBTCWbP/lTSCbReB40til34i61u+5dvbmUfl0u4LwmxG+VbZB9NoK2UWrtqqmFLBQX1Pyg96RkXmrjAhHIxblPhO9+nbuiBtvJT1EdmYB84E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787574308; c=relaxed/simple;
	bh=krsovJKnypKO6RFyuVgShJttVlWl6caFAnb2hr+xi90=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZcCLNaXGy/8GvIjFAFfWq2n4hSFjs5A5O0Sp3e7e0lCOXe2LTbvdY6a9CvNsFA8DMS08CxFFFLEYxSRRY0M5JtscLo6iR4H0gQYaphxWGR+hJRlCn/iuNSlLjRENu/mmmaelfL97Wj8NI7b/7+ekmCBNZBxTODbt2v/QiiphU0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GEBMBfeu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GEBMBfeu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A071F000E9;
	Mon, 24 Aug 2026 12:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787574306;
	bh=eyXQyOdDOlN1YJmTqNSTpLWEhATxiNwNdayFm6TiMjw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GEBMBfeuBIF2F/byDC4G7irjCeE4frraMLwMhrGhomsvAkoe09ADBoZ1HLjzN53Tj
	 0gwrd+bfT0ikOhrinpa2ntHYBKxYrJHfz5oTY8Mq4fMfaESiJCde6yW0k8iqZyA1gu
	 sURSduWfES37ILkET/ruCEC2FrEwylXlYbyX5oN2H174diyOCKpQOW+fAQ4+379KhI
	 ngLaoGUmeb4cSUajx6Rz7YeTZ93VHFNCOZSbx5PtaVbxJG9tCeITT7+cdCAJTkAgGp
	 tY3Nq9Ne112Z8hpQlF6pTMibsJXGBGGk/A3r9pTBPpYD3l6ntZl0CBBtRzwDe+hw2a
	 g1A6FOVUdyoAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 12/47] clk: qcom: gcc-qcs615: Tie the CX power domain
 to controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-12-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
 <20260824-qcom-tie-cx-to-gcc-v3-12-f1205a92682b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 12:25:05 +0000
Message-Id: <20260824122505.B0A071F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The CLK_IS_CRITICAL flags on gcc_cpuss_ahb_clk and gcc_sys_noc_cpu=
ss_ahb_clk permanently hold a runtime PM reference on the GCC controller, p=
reventing the CX domain from ever powering down.
--

--- Patch [12]: [PATCH v3 12/47] clk: qcom: gcc-qcs615: Tie the CX power do=
main to controller ---
commit 4f409a8e397d7df1fcb5c05bdd3d11eaa2987e04
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: qcom: gcc-qcs615: Tie the CX power domain to controller
   =20
Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

> diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
> index 57f8c80c6f324..601c81c844505 100644
> --- a/drivers/clk/qcom/gcc-qcs615.c
> +++ b/drivers/clk/qcom/gcc-qcs615.c
> @@ -2967,6 +2967,7 @@ static const struct qcom_cc_desc gcc_qcs615_desc =
=3D {
>  	.resets =3D gcc_qcs615_resets,
>  	.num_resets =3D ARRAY_SIZE(gcc_qcs615_resets),
>  	.gdscs =3D gcc_qcs615_gdscs,
> +	.use_rpm =3D true,

[Severity: High]
The commit message states this allows CX to be powered down once all
consumers have released their clocks. Will the CX domain actually be able to
power down?

Looking at gcc_cpuss_ahb_clk and gcc_sys_noc_cpuss_ahb_clk in this driver,
they are both marked with CLK_IS_CRITICAL.

When the clock framework prepares critical clocks during initialization,
clk_core_prepare() calls clk_pm_runtime_get(), which increments the runtime=
 PM
usage count for the GCC controller. Since critical clocks are never unprepa=
red,
this reference is never dropped.

Will these critical clocks permanently hold the runtime PM usage count above
zero, preventing the GCC controller from ever entering runtime suspend and
keeping the CX domain powered on indefinitely?

>  	.num_gdscs =3D ARRAY_SIZE(gcc_qcs615_gdscs),
>  };
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-qcom-tie-c=
x-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com?part=3D12
