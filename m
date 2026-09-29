Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6968E370AE2;
	Tue, 29 Sep 2026 15:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694095; cv=none; b=aKopE8Y0Fqnbagdg/dpEuLlJHoSjG74H7kLeARVnYzdul1LyvgneZDEMxtJ0mRBaXkL2XOP/88nttsZuG3MjiuBloLjHdlQYYDTWBb/I6fLTzC3YSloH8AKBsQKWa/b+02xA7c19O9MUv0SLmSSb5Ri8wefw894/OspWO0t7Aao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694095; c=relaxed/simple;
	bh=oIgweByEhyCNqYfB02PhH06N4NYVYk8fLGrxr/CG7Uo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nJVpnJwS9hIZHJDTONfxo8/QuySUER0axzsO65Og9ypYrJL1jqfph9G1zSaoxW/1fatH0QIguxfc3DDayb2oTI+RVV79CNqgKfKydgfWguBuO4c7ahKb7SFdEX50SNzlmP4UCjP/6tSzDFBjUnJLtZAjAky5Wzk08XhEv1S84+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BGzZLE6+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BGzZLE6+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 739D91F000FF;
	Tue, 29 Sep 2026 15:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790694081;
	bh=+H3YcyG8OJ2bIV3zlCuyKiNHcsvw8ZtaNS7bjvHM3RY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BGzZLE6+WFfi5loeiJb5pCTlgeMjj3Erh05o6o9Tg4lWboplefkCNqj2QglLCQO3I
	 nzaud0j5RwJLJC3e20l0PexxdZZySF8UUE+acSyTyxgG7nWEguPKAnWsuzWDa3DtBe
	 5jmGiJQ4TPIb3+mAIWnm+Hw/hkoWxGTU5xHMB/4xSMKjcN98DBbsc89zCV49Wazv0r
	 sZbrIKmkwZFN2/f17AaWWzhtF9HLFunepJb+7aP9ac29B2vwHwyPZLDDL57anJftKK
	 mdXIWrwx1p/JN5jqp5i8VOeTwi5uAp0W728vbMwfy6xcFTJY3ludWKnOgfDioM7dAz
	 /WdmDRn7FgmYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 9/9] arm64: dts: nuvoton: ma35d1: Add LXT crystal and
 correct HXT name
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: robh@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260929-perso-ma35d1-upstream-clk-v5-9-68533e935ee4@bootlin.com>
References: <20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com>
 <20260929-perso-ma35d1-upstream-clk-v5-9-68533e935ee4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 15:01:20 +0000
Message-Id: <20260929150121.739D91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: nuvoton: DT change panics older kernels via name collision
--

commit bbea265e667383111c175f21144622719e32c1cb
Author: Miquel Raynal <miquel.raynal@bootlin.com>

arm64: dts: nuvoton: ma35d1: Add LXT crystal and correct HXT name

The clock controller takes its two crystal oscillator inputs from the
board: HXT and LXT. This commit fixes the HXT clock output name to "hxt"
instead of "clk_hxt", and adds the LXT fixed clock node.

> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64=
/boot/dts/nuvoton/ma35d1-iot-512m.dts
> index 78534d613486a..cb7d6f9ee297e 100644
> --- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
> @@ -35,7 +35,14 @@ clk_hxt: clock-hxt {
>  		compatible =3D "fixed-clock";
>  		#clock-cells =3D <0>;
>  		clock-frequency =3D <24000000>;
> -		clock-output-names =3D "clk_hxt";
> +		clock-output-names =3D "hxt";

[Severity: High]
Could this change cause a regression with older kernels?

When booting an older kernel with this newly updated Device Tree,
of_clk_init() parses the DT and registers a fixed clock named "hxt".
Later, in drivers/clk/nuvoton/clk-ma35d1.c:ma35d1_clocks_probe(), the
driver unconditionally attempts to register its own fixed clock also named
"hxt", which fails due to the name collision and returns ERR_PTR(-EEXIST):

    hws[HXT] =3D ma35d1_clk_fixed("hxt", 24000000);

The driver does not validate the pointer and passes the ERR_PTR as a parent
for derived clocks like CAPLL:

    hws[CAPLL] =3D ma35d1_reg_clk_pll(dev, CAPLL, pllmode[0], "capll",
                                    hws[HXT], clk_base + REG_CLK_PLL0CTL0);

The Common Clock Framework (CCF) then dereferences the error pointer in
clk_core_fill_parent_index(), causing a fatal kernel panic on boot.

Although another commit in this series fixes the crash for the current
kernel by avoiding the error pointer dereference, it does not prevent the
regression on older kernels. The new DT will still crash older kernels
in the wild. Is there a way to describe the hardware without causing this
name collision?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-perso-ma35=
d1-upstream-clk-v5-0-68533e935ee4@bootlin.com?part=3D9
