Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794477676;
	b=pbZRTjM100LR9lb2Hn77ROs22lIphKhDC1DDuc+InYL2qROP5DOdA+m1L2yDZbkBJ5kQ
	 5FW4WxQpwYEFPclvIOtemtKDz7cC9dJpN+PikYDM2hLlubl9z6PLs+flvT0Rg4PX+6ZiF
	 /Q7CwRZDOyJQMPfJBaB+9BliFnMbMHiuQitDV16jCdN0VzN53dywn368xhBc4zT3Lxmvi
	 NNCuMakKaziQl00Akhdrk1kaOwDAIJrGVVR5aTh40eV4bPgs4mf8pabQJfpn0ZmEQ5jYT
	 jSBTC7l7sMiy/qHm/UDb89lY+jXswfpN2dcab+jatPKXiYG/D5iYcDWMvTVPxi+oD4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794477676;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PpqV60gwAn+Zkmd7kJpiUYhBX9aIAWQFymmIndWwUdM=;
	b=WAi7a4pZvOo2Rx7ehEVYWoQAViiF+F1lrtJNuCRpIW9gRAAyjgJwizaJp0OqFB02us95
	 ZO2l4ICynlJpMMTgESorrw37+NIFesRNnoXe9n7pK82uw3cj7HnTsBPfiVAdzW/DVvsS0
	 lwCtYouJJRmPmcxMLr5Pofyy8ncGXaCEsb/zHDgKc+CplGEFk/ldF58NEREIy6HxvIAjp
	 G49cgIhBH2OjIAsSniRZc18s7Yjhpzs0LwdyeqXniTKFXxcMHWjP5ORcoxtc2OEE8qQy7
	 A4T0sZp2XjD5ZMo8QVeQXLAvGfyIW1yOup94zcrB7dyn9k0s0MAGqMam0JmIu1MMyNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="J8B/jFdP";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FA6606A321;
	Thu, 12 Nov 2026 10:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J8B/jFdP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9361B1F00A05;
	Thu, 12 Nov 2026 10:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794477675;
	bh=PpqV60gwAn+Zkmd7kJpiUYhBX9aIAWQFymmIndWwUdM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J8B/jFdPqvAo8kNlFXubDSk92o/8aSxXinBZQgeI8Mku5SxRRVSfGdr3XrT2vbq78
	 vy1orzo8/+6YJJ/a268YSFjzkbJcpdWf6KfxqvyfKecekMMclH9v0Z+HeJvXZRF5AR
	 /1g2nFPjVbreOUM9+26LeNoyPNshKBNPV6RnpkYOzSZ9+KskkpWtVDFb7WXdKDdlyp
	 8T8oFdOPwOdxMNpqT38wRbz9Pgszeigx9znLrowkIBZ1zjzwx/C4qNw3H3bB1Wd+ql
	 Y6bVW7QY7Uq7EA5t75wz/zjBw+djUs46e7nXe1SEo5tI5rBG+tNAoYbECabqOrtkhs
	 +FlZ6lPESLdVg==
Message-ID: <sashiko-outbox-210918@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: ipq5210: Add NSS clock
 controller node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Jie" <jie.luo@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261111-qcom_ipq5210_nsscc-v2-3-7e2c1dda3ed2@oss.qualcomm.com>
References: <20261111-qcom_ipq5210_nsscc-v2-0-7e2c1dda3ed2@oss.qualcomm.com>
 <20261111-qcom_ipq5210_nsscc-v2-3-7e2c1dda3ed2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 10:01:15 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: qcom: ipq5210: xo_board uses xo_clk instead of
  ref_48mhz_clk
--

commit f6342940567706c16d7408b991562c108f13f6b3
Author: Luo Jie <jie.luo@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Add NSS clock controller node

This commit adds the NSS clock controller (nsscc) device tree node to
ipq5210.dtsi to provide clocks and resets for the networking blocks.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5210.dtsi
> index 0c1ede0f73b21..11915f8eb1567 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> @@ -331,6 +331,46 @@ frame@b128000 {
>  				status =3D "disabled";
>  			};
>  		};
> +
> +		nsscc: clock-controller@39b00000 {
> +			compatible =3D "qcom,ipq5210-nsscc";
> +			reg =3D <0x0 0x39b00000 0x0 0x100000>;
> +			/*
> +			 * Note: CMN PLL output clock names below are reversed relative
> +			 * to the hardware block they feed - IPQ5210_PPE_CLK is wired to
> +			 * the NSS hardware block ("nss") and IPQ5210_NSS_CLK is wired
> +			 * to the PPE hardware block ("ppe").
> +			 */
> +			clocks =3D <&xo_board>,
> +				 <&cmn_pll IPQ5210_PPE_CLK>,

[Severity: Medium]
Should xo_board be parented to <&ref_48mhz_clk> instead of <&xo_clk>?

arch/arm64/boot/dts/qcom/ipq5210.dtsi:
		ref_48mhz_clk: ref-48mhz-clk {
			compatible =3D "fixed-factor-clock";
			clocks =3D <&xo_clk>;
			#clock-cells =3D <0>;
		};
    ...
		xo_board: xo-board-clk {
			compatible =3D "fixed-factor-clock";
			clocks =3D <&xo_clk>;
			#clock-cells =3D <0>;
		};

arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts notes that xo_clk can be
48 MHz, 96 MHz, or 192 MHz, which the WiFi block divides down to the
48 MHz ref_48mhz_clk, and that xo_board is a fixed 24 MHz clock routed
from that 48 MHz WiFi output clock divided by 2.  Because xo_board uses
<&xo_clk> as its parent instead of <&ref_48mhz_clk> (unlike
ipq5424.dtsi, ipq5332.dtsi, and ipq9574.dtsi), on boards with a 96 MHz
or 192 MHz xo_clk, xo_board will resolve to 48 MHz or 96 MHz instead of
24 MHz, supplying the wrong XO reference rate to nsscc, gcc, and sdhc.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-qcom_ipq52=
10_nsscc-v2-0-7e2c1dda3ed2@oss.qualcomm.com?part=3D3
