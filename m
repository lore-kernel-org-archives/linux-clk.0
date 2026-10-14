Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D760C50B8DB;
	Wed, 14 Oct 2026 16:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995649; cv=none; b=A/HrWYvqwrbiT0gh133nglz62RVYlp5dBDvZTtO5Y0bu9TNQzL+/8eWqah0mlTcCz9jx33UYni8PTloOJUoP0iWC7Wl8uNis1iO0pSZ85VHqEj1hIupHiJ1NetvXXeWdmgolUSi1HG/PoeIV6A4UWyLCKS1zModU32qNR9Zbskw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995649; c=relaxed/simple;
	bh=jn4CQif+qouCMe1gSc5hPsS/weJmIodZq1mhHp3VqZI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Ede2ooDDNhbGL51F2h6Mm7x2DhMboR0bnuY7b96KS6K2+/tC9wNXFc1f1fKDCyz9el9AEMftVgLxH490/jA/Y8h17gcCZtxqcrPSgY9XWLmcgVzI8RkvaT2Sap+wirOCuh5BNQaz/d56zVxnbEcvAwOskcSW+NjxFIfN6I3z0x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gl5tFEUG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gl5tFEUG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241CF1F000C4;
	Wed, 14 Oct 2026 16:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791995648;
	bh=y1oqGte81QPkuu3Nzh/KYdoOan/7YE75ei9LVzMCaRg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gl5tFEUGljMWk1XHidANSkZjbppuzB0ONJmoBWzo2w5WQUqAPCj7r9GJsVxEFM54L
	 djij+SKw8DMrbll25e9oeSnqo02J6ExbWh3jNCnQJYVPtR1x8lnzzkn6589Hf/RrCS
	 pTRqRU4hxpEgbmux98Wa843RkloFSQrUbVjk4s5Y4m1+XlKmkh+02AbVrKoa+KUFTS
	 A9ALliIusrm2Z89jsLtmytD7TzyRDkKmO5dwcL1qWBdkMov95BtNb37h+yfpRyfSkY
	 9JGy2oaHDzWt4mgBfWFcnx9qQeyq2CUrH1/ZCRJMoDhWvSTgASxBRuxRvkw2mzATT0
	 Sy2kP1fCGvJ3A==
Message-ID: <sashiko-outbox-171536@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sdm845-hdk: add display card
 overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-sdm845-hdk-v2-5-6d0b4b42f267@oss.qualcomm.com>
References: <20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com>
 <20261014-sdm845-hdk-v2-5-6d0b4b42f267@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 16:34:07 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: qcom: sdm845-hdk: missing mode select line configuration
--

commit 054d071f82b9427b1a9e8eba69c5018761cb4d20
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

arm64: dts: qcom: sdm845-hdk: add display card overlay

This commit adds a device tree overlay for the SDM845 HDK to support a
Truly NT36850 WQHD dual-DSI panel.

> diff --git a/arch/arm64/boot/dts/qcom/sdm845-hdk-display-card.dtso b/arch=
/arm64/boot/dts/qcom/sdm845-hdk-display-card.dtso
> new file mode 100644
> index 0000000000000..1022ab096170f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-hdk-display-card.dtso
[ ... ]
> +&tlmm {
> +	disp0_reset_n_active: disp0-reset-n-active-state {
> +		pins =3D "gpio6";
> +		function =3D "gpio";
> +		drive-strength =3D <8>;
> +		bias-disable;
> +	};
> +
> +	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
> +		pins =3D "gpio6";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-pull-down;
> +	};
> +
> +	mdp_vsync: mdp-vsync-state {
> +		pins =3D "gpio10";
> +		function =3D "mdp_vsync";
> +		drive-strength =3D <2>;
> +		bias-pull-down;
> +	};
> +};

[Severity: Medium]
The commit message states "the mode select line driven low for the dual
port mode", but does the &tlmm node actually configure this?

There doesn't appear to be a gpio-hog definition or other configuration
here to statically drive the mode select line low. Without it, might the
dual-DSI panel fail to initialize correctly if the hardware defaults
to the single port mode?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-sdm845-hdk=
-v2-0-6d0b4b42f267@oss.qualcomm.com?part=3D5
