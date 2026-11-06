Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970495;
	b=Bs7q54orWK3UXL/HlcgPDHcYiXH7wszKYEX9JqLVjDttkJ/K/wmbJXOeZ+vEKMU3nlBZ
	 vdfO7BAjVtsMN9jmVgp7j0dd+8aajpi9uD5D7ZmMEyBbIUX2bQJaXLAvrPMdo9gK7YiU0
	 mJEM9pQzFIHMPLe7vi9les6xJ7RK2sMk/QHzR5xdKHiVpMMB0ORkDuo41oyDuXIgbxEDb
	 KgB/RFGLGj/Db0+j4IdcEZFqZZFwMMwIDobYvRSOJsL5ZQV6iSbdM20iGrN23VuQMvFMq
	 8dT89wR4qQA52jDZsJoe3MaKCYi1j5pRwWEfTl1XQms7vrWUn3Ap1p63ll1fOxrrrbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970495;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ylMbPDGGd5glkl8VnvhGWgBEFafq5/+Hup2jgMhnue8=;
	b=zOm7D4n3h/cBQz+GMAho2O85UvlHOi1Z4XRdjn6RVZPuYtcwefCIJWB8rG+2b9CzrPCr
	 oZAoRWxlMETyxc5v/XcEBXSGoDBmH7/gM3B8ANyHazoT9rOUMH3ZT2GtZRritB8+iBItf
	 8gA1WikNYDXMCalYCuhcCvD1XsL3PNpVQHhxD0jSV5O4WuQBzwQXQNlbONYPtunYHnyhT
	 QkjcK95C1Uz6qiEE+N5cdhWma0RiWDw3Rbfe2Z+/mVQqTp3CWlzhVXRn7HdfRALHIL6ct
	 Z+9UDlKrWNPIRDTZDXXDPHHp9Bujky7ZM//YVzVHBV7Rs2todu3igbaOlFPsZc/NHjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CnUaDgmJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BAD606D801;
	Fri,  6 Nov 2026 13:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CnUaDgmJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0654F1F008A5;
	Fri,  6 Nov 2026 13:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793970494;
	bh=ylMbPDGGd5glkl8VnvhGWgBEFafq5/+Hup2jgMhnue8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CnUaDgmJWKCk5uF2vZJ+b+1GFR8bCw8adigkYfBHB77UDLGr9TcujnDe5MJ56O+wr
	 +IIs/jlfSsOSY/SdxXFtO7cOBx+zW2kk5PjxJ3u+2/B0zwDSTOEULE/9UGtqEKZoS9
	 4r3JZnJ5+9OpI+1+0PUquaPF3rU+u29jEYt83LaID4w/Z9GShtT7dksbjek/Ahak7E
	 REBFMaCKQcgxyR2Ph7zxZM/DNugnYVFkXtDWNc5yt7mW9harIlLGjtuF64V3So35ty
	 0uWvn5+UF2C2Mhoa4Qy7WY4ULRibKW7QUC4OiKsK90AOL8/NbEhhchY3yfTGGkVW1D
	 i4XWbNKr9UkFw==
Message-ID: <sashiko-outbox-201441@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: ipq5210: Add NSS clock controller
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Jie" <jie.luo@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105-qcom_ipq5210_nsscc-v1-5-d4fcb5c32b51@oss.qualcomm.com>
References: <20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com>
 <20261105-qcom_ipq5210_nsscc-v1-5-d4fcb5c32b51@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 13:08:13 +0000
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

commit 405d44391cff203718eda5567f73dbca56529ae8
Author: Luo Jie <jie.luo@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Add NSS clock controller node

This commit adds the NSS clock controller (nsscc) device tree node to
ipq5210.dtsi to provide clocks and resets for the networking hardware blocks
on IPQ5210.

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

[Severity: Medium]
Here nsscc consumes xo_board as its 24 MHz "xo" reference clock (expected by
ftbl_nss_cc_ppe_clk_src in drivers/clk/qcom/nsscc-ipq5210.c).

In arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts, the comments explain that t=
he
board XO crystal (xo_clk) can be 48 MHz, 96 MHz, or 192 MHz, which is divid=
ed
down to a fixed 48 MHz WiFi output clock (ref_48mhz_clk), and xo_board is
routed from that 48 MHz WiFi output clock divided by 2:

/*
 * The bootstrap pins for the board select the XO clock frequency that
 * supports 48 MHz, 96 MHz or 192 MHz. This setting automatically
 * enables the right dividers, to ensure the reference clock output
 * from WiFi to the CMN PLL is 48 MHz.
 */
&ref_48mhz_clk {
	clock-div =3D <1>;
	clock-mult =3D <1>;
};
...
/*
 * The frequency of xo_board is fixed to 24 MHz, which is routed
 * from WiFi output clock 48 MHz divided by 2.
 */
&xo_board {
	clock-div =3D <2>;
	clock-mult =3D <1>;
};

However, in arch/arm64/boot/dts/qcom/ipq5210.dtsi (updated in commit
6f35f463dd9a ("arm64: dts: qcom: ipq5210: Convert xo_board to fixed factor
clock")), xo_board is parented to <&xo_clk> instead of <&ref_48mhz_clk>:

		xo_board: xo-board-clk {
			compatible =3D "fixed-factor-clock";
			clocks =3D <&xo_clk>;
			#clock-cells =3D <0>;
		};

Unlike arch/arm64/boot/dts/qcom/ipq5424.dtsi (as well as ipq5332.dtsi and
ipq9574.dtsi), where xo_board uses clocks =3D <&ref_48mhz_clk>, parenting
xo_board directly to <&xo_clk> bypasses ref_48mhz_clk.

On IPQ5210 boards with a 96 MHz or 192 MHz xo_clk where xo_board uses
clock-div =3D <2>, wouldn't xo_board resolve to 48 MHz or 96 MHz instead of=
 the
expected 24 MHz for nsscc, gcc, and sdhc? Should xo_board in ipq5210.dtsi h=
ave
clocks =3D <&ref_48mhz_clk> instead of <&xo_clk>?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-qcom_ipq52=
10_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com?part=3D5
