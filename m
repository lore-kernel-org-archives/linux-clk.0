Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970494;
	b=b563tQe7r9+DvrP/6YEuWyHEJLxj95HUXcu4YWcYHSbPokJZuGbtZ8alllRvE5Z3nXXH
	 dOetVSH6+otcyQZy3OUjHpPmP8Q2LeRciHS7fUvEN+1ZudT8ubpypVDoyIXKsggSpV+8R
	 vsjStVXjhD8Iozr8eBzcJqWaOn+82rteSEb9ABP5HG5duNsZ4ddBvCU7poUWAErQ5jMCu
	 GOjn0yxEg1k3GgM48KuXsPQR3kwIFmloH7F+EmcYuSfwxul6iHP+KomqB4FA1SAp5kR4I
	 cNac7ljCRB9nJJYfDFRcr4vXYeZs3j3zQct5eBUlmluDquV2V1QJclIA8tr5vQD2sFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970494;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=88MFnW5CQX7DrSGCAbp3oJlbo9Ck68x3g6pfV/Ba49g=;
	b=lX3MCzIX3Up997iZkpQ5LtJ/WeSN7v/vYnkEI/HbAMYcxr8HSwB4k3LfC38141E5hPiK
	 Ap0TmUkkAAgkeCvWSiTGDjuNfLVR4HX/J0L0DtDdqvHsWA1dgr5TnTEtyTJnqpHENj7Er
	 DQg0E5RwkWVkGodsaM+7nXRDHyAenYmK/SnT0v2Zddw24UwI9GPLXcEthSYXMuTkV/Q6v
	 ozCbb9OPkv4g5WH01ycFKEQOVWP12F3WjrcRnn6k6NrOkhbd3z06NDuNilAIbZwLDcGd8
	 d0gwuHaClDphsC3fpfvrjdwXhCgMdulguFxgFJoe48374kHmoMo4X6A7Rs+Iz8+PidA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VHSell+a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FCC606A330;
	Fri,  6 Nov 2026 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VHSell+a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D6461F008A2;
	Fri,  6 Nov 2026 13:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793970493;
	bh=88MFnW5CQX7DrSGCAbp3oJlbo9Ck68x3g6pfV/Ba49g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VHSell+aUkzCqMxmmlfl24iPFP0mOWsRXiDI3APT3N9OeBk6yX/LuoooQ0jkn8deA
	 SmXPeEghRH/nEXCkleYNliUYjeRqA+gJETEeoYjN50hbrE0bBF4ufYvlfIZN0QkN9I
	 uiqnQg2Vng36RJMC/cpyD02/YACRoN5kSMY27OObBxxuZtyAKS881S1ae6DvP7AHBd
	 +nJzUzzY4lrQBVQ/qgw7L2APl/eSX6hJ9bQxpEvFCmW5kP+xMFMoHyx5usIBD1DWDz
	 hUkLQACsJSB2DDqArZw3xJJlR37r6pPsy2ZEzaC6KAHKovuBg2hwvH5LPG0q8ANAxF
	 l9KybLkWCwjiA==
Message-ID: <sashiko-outbox-201440@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Update IPQ5210 xo_board to use
 fixed factor clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Jie" <jie.luo@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105-qcom_ipq5210_nsscc-v1-4-d4fcb5c32b51@oss.qualcomm.com>
References: <20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com>
 <20261105-qcom_ipq5210_nsscc-v1-4-d4fcb5c32b51@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 13:08:12 +0000
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

commit 6f35f463dd9af9e90cdf14e9597dae99779f246f
Author: Luo Jie <jie.luo@oss.qualcomm.com>

arm64: dts: qcom: Update IPQ5210 xo_board to use fixed factor clock

This commit converts the IPQ5210 xo_board clock from a fixed-clock to a
fixed-factor-clock dividing its parent clock by 2 to produce 24 MHz.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boo=
t/dts/qcom/ipq5210-rdp504.dts
> index 61a53361138b1..519307c6b61e5 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
> @@ -85,8 +85,13 @@ &uart1 {
>  	status =3D "okay";
>  };
> =20
> +/*
> + * The frequency of xo_board is fixed to 24 MHz, which is routed
> + * from WiFi output clock 48 MHz divided by 2.
> + */
>  &xo_board {
> -	clock-frequency =3D <24000000>;
> +	clock-div =3D <2>;
> +	clock-mult =3D <1>;
>  };
> =20
>  &xo_clk {
> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5210.dtsi
> index 52d851a0dc2b7..0c1ede0f73b21 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> @@ -26,7 +26,8 @@ sleep_clk: sleep-clk {
>  		};
> =20
>  		xo_board: xo-board-clk {
> -			compatible =3D "fixed-clock";
> +			compatible =3D "fixed-factor-clock";
> +			clocks =3D <&xo_clk>;

[Severity: Medium]
Should xo_board use <&ref_48mhz_clk> as its parent clock instead of
<&xo_clk>?

Both the commit message and the comment in ipq5210-rdp504.dts state that
xo_board is fixed to 24 MHz and routed from the 48 MHz WiFi output clock
(which is also the reference clock of the CMN PLL) divided by 2.

In ipq5210.dtsi and ipq5210-rdp504.dts, xo_clk represents the external board
crystal (which can be 48 MHz, 96 MHz, or 192 MHz depending on board
bootstrap pins), whereas ref_48mhz_clk represents the 48 MHz WiFi output
clock routed to cmn_pll:

arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts:
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

arch/arm64/boot/dts/qcom/ipq5210.dtsi:
		cmn_pll: clock-controller@9b000 {
			compatible =3D "qcom,ipq5210-cmn-pll";
			reg =3D <0x0 0x0009b000 0x0 0x800>;
			clocks =3D <&ref_48mhz_clk>,

With clocks =3D <&xo_clk> and a fixed factor of 1/2, wouldn't xo_board and =
its
downstream consumers (gcc, sdhc, and nsscc) evaluate to 48 MHz or 96 MHz
instead of 24 MHz on IPQ5210 boards strapped for a 96 MHz or 192 MHz xo_clk?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-qcom_ipq52=
10_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com?part=3D4
