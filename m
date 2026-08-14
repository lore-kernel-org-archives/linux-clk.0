Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1C046EF74;
	Fri, 14 Aug 2026 13:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786712482; cv=none; b=oFnWVHxrhdt2piraaICKseWY92bIJOSQjk+mmBU0JYTCRIvvvwoHTIrXasWMTcWQF2pmnse4FBFnvPm8C2EamJ866S06JH2JKP4l0+MxNBXvZ7uogFjt3lqDZmjKw1P6gU2hm+4tf1mZg6TR5+yXQnKPeaDsdNu3XcNlkr3XIow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786712482; c=relaxed/simple;
	bh=4zMpBJR0hdAYTnEO01sFFpDBV3iSSK32OhXBloGTAEc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ivj6UoYNeX5EUZjJgxwxWiTeO0cPxrmoqh2P9M8nIKsGe+GfF4OylVLM+OAYHj3LHWv4ekQaQtYLe1Kc+YwihcjZQMdIvw8LxIZvk0EEtCbrCgg5sw6jXZXXttJLgfMzOuTuj8IBaJImYSfwgXkbhl62QcdzRKmSTA84EJTXyVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dkvwo2+C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dkvwo2+C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3401F000E9;
	Fri, 14 Aug 2026 13:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786712481;
	bh=BCTfdS96UWeFY22MvThP1GUwvzfAf9FKvVx6O5DTzKE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dkvwo2+CjYdqC7rPbzwITHD9t5Zu//qJmqgCUlkMRD1L9+Nr3AAz9p+P7bIaigINT
	 KehUqOsAuwvDjSp32HM8gC95pxRKSDK9vnskAGg7MQyzSIb7cvCHHYKmvRXzsgHIs3
	 9D0kmEouozAOT541qM0IM9VqIU6WJggdfalpHRMMjfDrxZWNWueMstsy3Jq04+5GPQ
	 sKQlUo5IwFaJP4vymKaJxwHBTgcRkhHVbW9KzUGrzIzm0zRztvAksjFtLj1YKz7RFV
	 jEOs+q/GIZdu7Xzv0fHjENkO1RCXk1PI4bNpAG0OA/7XBMcHCh6ErwIBtXTTKSkJJD
	 Mdlm1U6iavRJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 11/12] arm64: dts: qcom: ipq5210: Add CMN PLL device
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Jie" <jie.luo@oss.qualcomm.com>
Cc: robh@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-11-21c3db378611@oss.qualcomm.com>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-11-21c3db378611@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 13:01:20 +0000
Message-Id: <20260814130120.BD3401F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Device Tree node overrides by label are not sorted alphabetically i=
n `ipq5210-rdp504.dts`.
--

--- Patch [11]: [PATCH v3 11/12] arm64: dts: qcom: ipq5210: Add CMN PLL dev=
ice node ---
commit 0ce1f4dcc02ba914d9905f5b322a335147cf2ae6
Author: Luo Jie <jie.luo@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Add CMN PLL device node

This commit adds the CMN PLL node for enabling output clocks to the
networking hardware blocks on IPQ5210 devices. The reference clock
is routed from XO to the CMN PLL through the WiFi block.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boo=
t/dts/qcom/ipq5210-rdp504.dts
> index 941f866ecfe95..7410d092814e5 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
> @@ -74,6 +74,21 @@ &uart1 {
>  	status =3D "okay";
>  };
> =20
> +/*
> + * The bootstrap pins for the board select the XO clock frequency that
> + * supports 48 MHZ, 96 MHZ or 192 MHZ. This setting automatically
> + * enables the right dividers, to ensure the reference clock output
> + * from WiFi to the CMN PLL is 48 MHZ.
> + */
> +&ref_48mhz_clk {

[Severity: Low]
This isn't a bug, but should the device tree node overrides be sorted
alphabetically by label?

It looks like &ref_48mhz_clk is placed after &uart1. Placing it earlier
in the file would maintain the standard alphabetical ordering expected in
Qualcomm device tree files.

> +	clock-div =3D <1>;
> +	clock-mult =3D <1>;
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814-qcom_ipq52=
10_cmnpll-v3-0-21c3db378611@oss.qualcomm.com?part=3D11
