Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B92538F949
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 07:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780903978; cv=none; b=ukpKnUVF7LqPxCHknp2qQflP/y3r2bKtJKe1RbqWqwMXq7Nokh9zQEzQ0QtLC+Q/TC0SLEQCcsdWdr4k5RG4SWxKm2mGvQ2J+1Jm5fBsFtDZiYZxQNNEyG4ZzNknxFGwRu2aPufY3woiD4QqGEDIe2CCvlQNZi54zKS5IVbKP1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780903978; c=relaxed/simple;
	bh=XMHyOQHx6WIm/tuQ1tglv5lWCjfTXh95qCF2ldK+bKM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Ycvg6gvx1IoI19XJorfJ9UKY/5Imd0CksimaYtsGmxq7FLHHgJ9/VGQeK6XxXtSXFLKWyeR0dAxvR34XMWIk8VC2eooAY+UVG/dehX49MrmMoOdJxM5PPPaS8cCdjNVv+i0ngh7941UzMxSJRIZMMUaQiu24vglWuxpNwt8OyQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=wGFcigS3; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="wGFcigS3"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bf84a2b2077so6419366b.2
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 00:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1780903975; x=1781508775; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5e4yVKORIbgcZMiPjlqQS5Msk7HSGQTKiassh3VqtIA=;
        b=wGFcigS3B+FXukYWVi5TuZg0Iuo6fSbyAfy6NUHUuTyKi3aZ5s5eNx9ncKP3Jjj8qt
         8i1LY9nXLim4RY+BzxCPdSXverYy2XgfIB4EfVKT6B4X/3vKM3K2FZS+gRBkP1euC3BZ
         zGJ2tfn/wD1yVYyWbv/zeVMxld81oyJjV0K0MR8o/vGEekpoivOuxBgs4QjJlPkm1qlv
         Rsqz9h21+KSR+WkU8nwsdA5YnNKdSGYjnzE2q5gS5mVJp7VNQxmYzdgBbofcDQuZwvbO
         b99N69rEUw/T4Sb9GPoWywQgTWJ6HmTdtNeca54HsiJT4ZZx/FIvFqLlJAiczzl7xdFT
         ab9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780903975; x=1781508775;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5e4yVKORIbgcZMiPjlqQS5Msk7HSGQTKiassh3VqtIA=;
        b=L828K+zSNiBhFfbZ6HMQ2bH0dXZlZSSCxGAYmVcjzp1PvoOHMhRDekT83vXniBl7Lt
         B2T9oaVtix2qdlEmCS2SuWUOdKWDJTAL3Y5yheGAFPB1UuCrnSpwTCUfzGj8qQXX506m
         EKgm7+CsFPu46k5/Ixo8T925fBQUIdo9sCg3RkzddwlQuui5Vwv4+6++1z1lwiD3dGNO
         cqOCIqmOsQt3/+P+yMuE9SIefF+UzPC53K/BDJ+MR6AzEXJvuIjGSCyofhDd5J8XbfPH
         p8d5e/WI4WNwXMlsZpuISP6NKdT8VAZUKYbqV2Lyw8aKSZ/R+Zy8dHtBGxi9OrWh+1T4
         0aUA==
X-Forwarded-Encrypted: i=1; AFNElJ+dhy8jO1AzH/+hz+i5oaRgfpyisKgOxuS0sQ7KfCCGj5xsZdRb/8WldZ1ARJN47BvYzBB3Od8l77k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwUa0S1xdDqRPPm09UKoNLp+dG16EYJhnUYHGi2hf0i0quX4u1
	aQrJ0VUFvxzCGxbyiyOCDMAW2aGjixNNkLOVnAjHeJgFpT81AuiQFtMopelMNGTM9Ds=
X-Gm-Gg: Acq92OEdJQ4RgOl9j3188TvnVxLDbxzz0+attzpw4yfxaVzLhS29RUMBiUth7wqgUou
	VGZ0vyp3KlaQy5xEOBZ2nZchUU70AgiVL5Pepu5y7OV8o/ADr0i4Y4hpnPt8nItg6195+YHU6sI
	n2I9vPtk9OZHKafHMFsCYM6JhXUa3cd+uBfmpjcF5qXrvoH8+OUXMCeTTIvoFPmk9D5so5Bn9s0
	YGhy9pNAl2zaVZNaUJItsASqMMGJkfYSlaglfSFWYrsN/yPfn6uL0aySHNoDoS3SlrlQZQ7TW+j
	ZBVme4pqihv0VZ6scGNQxc2+uR/p7GMGjBC7DDjt5ZVK0dfC42ydzNXBEvx+RKS1jCtMKfU02lx
	u56uYzdS10eIJ0od9Sb+DsYvWugwX3LYJE5YcyFaCRaMoYcrndc1qPXaHCkw7e3BETZYeiKQ5oJ
	FPSKfrUtViNpliIlBMvgV+fxa3WAl0TDRjeirSNXglB+YfPniS9qSA95RhoT74Q8TPJphVUdvcx
	zrk2NY=
X-Received: by 2002:a17:907:3f20:b0:bdf:8e2a:1092 with SMTP id a640c23a62f3a-bf370e639e5mr722825866b.3.1780903975340;
        Mon, 08 Jun 2026 00:32:55 -0700 (PDT)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051d82a31sm831571366b.19.2026.06.08.00.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 00:32:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 09:32:54 +0200
Message-Id: <DJ3HRRGJZN8F.3UNOV86ZOB47B@fairphone.com>
Cc: "Ajit Pandey" <ajit.pandey@oss.qualcomm.com>, "Imran Shaik"
 <imran.shaik@oss.qualcomm.com>, "Jagadeesh Kona"
 <jagadeesh.kona@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <netdev@vger.kernel.org>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Add GP M/N clock controller node
 for SA8775P and QCS8300
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Taniya Das" <taniya.das@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Linus Walleij"
 <linusw@kernel.org>, "Richard Cochran" <richardcochran@gmail.com>, "Konrad
 Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-5-1522662b6c53@oss.qualcomm.com>
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-5-1522662b6c53@oss.qualcomm.com>

Hi Taniya,

On Tue Jun 2, 2026 at 5:21 PM CEST, Taniya Das wrote:
> Add the GP M/N divider clock controller node at 0x088d3000 to the
> SA8775P (kodiak, lemans) and QCS8300 (monaco) SoC device trees.
>
> The node uses the qcom,clk-gp-mnd compatible, is clocked by the PDM
> XO4 and AHB clocks from GCC, and exposes a single clock output
> (gp_mn_clk) on the dedicated gp_mn pin mux function. The XO4 clock
> is pre-assigned to 4.8 MHz (XO/4).
>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 14 ++++++++++++++
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 14 ++++++++++++++
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 14 ++++++++++++++
>  3 files changed, 42 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/q=
com/kodiak.dtsi
> index 1ff9e1598d00429c03b2bcae41fa370ab2c892bd..cbc13ac37f8aeb0b1071ad060=
9ec11e829d2c798 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -4412,6 +4412,20 @@ usb2_role_switch: endpoint {
>  			};
>  		};
> =20
> +		gp_mn: clock-controller@88d3000 {
> +			compatible =3D "qcom,clk-gp-mnd";
> +			reg =3D <0x0 0x088d3000 0x0 0xc>;
> +			clocks =3D <&gcc GCC_PDM_XO4_CLK>,
> +				 <&gcc GCC_PDM_AHB_CLK>;
> +			clock-names =3D "pdm_clk", "ahb_clk";
> +			clock-output-names =3D "gp_mn_clk";
> +			#clock-cells =3D <0>;
> +			pinctrl-names =3D "active";
> +			pinctrl-0 =3D <&gp_mn_active>;
> +			assigned-clocks =3D <&gcc GCC_PDM_XO4_CLK>;
> +			assigned-clock-rates =3D <4800000>;
> +		};

Am I missing something, or would this just configure gpio60 for all
boards for this clock controller output? On QCM6490 Fairphone 5 this pin
is connected to FP_3P3_EN, so it's definitely not unused.

Maybe disable them by default and let the board enable it, if it wants
to make use of this clock?

Regards
Luca

> +
>  		qspi: spi@88dc000 {
>  			compatible =3D "qcom,sc7280-qspi", "qcom,qspi-v1";
>  			reg =3D <0 0x088dc000 0 0x1000>;
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index 19f8cf4e15482947f6049188050c370340afaead..d192f92a896bb13017abdf820=
62e8305aab3e5d5 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -4353,6 +4353,20 @@ opp-384000000 {
>  			};
>  		};
> =20
> +		gp_mn: clock-controller@88d3000 {
> +			compatible =3D "qcom,clk-gp-mnd";
> +			reg =3D <0x0 0x088d3000 0x0 0xc>;
> +			clocks =3D <&gcc GCC_PDM_XO4_CLK>,
> +				 <&gcc GCC_PDM_AHB_CLK>;
> +			clock-names =3D "pdm_clk", "ahb_clk";
> +			clock-output-names =3D "gp_mn_clk";
> +			#clock-cells =3D <0>;
> +			pinctrl-names =3D "active";
> +			pinctrl-0 =3D <&gp_mn_active>;
> +			assigned-clocks =3D <&gcc GCC_PDM_XO4_CLK>;
> +			assigned-clock-rates =3D <4800000>;
> +		};
> +
>  		usb_0_hsphy: phy@88e4000 {
>  			compatible =3D "qcom,sa8775p-usb-hs-phy",
>  				     "qcom,usb-snps-hs-5nm-phy";
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index ebe5889daa5300efa7857314e9170d7d2fc33ef7..f6c5ec38c7491b7a16ebfb853=
f8af88bdf1f0db3 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -4867,6 +4867,20 @@ opp-384000000 {
>  			};
>  		};
> =20
> +		gp_mn: clock-controller@88d3000 {
> +			compatible =3D "qcom,clk-gp-mnd";
> +			reg =3D <0x0 0x088d3000 0x0 0xc>;
> +			clocks =3D <&gcc GCC_PDM_XO4_CLK>,
> +				 <&gcc GCC_PDM_AHB_CLK>;
> +			clock-names =3D "pdm_clk", "ahb_clk";
> +			clock-output-names =3D "gp_mn_clk";
> +			#clock-cells =3D <0>;
> +			pinctrl-names =3D "active";
> +			pinctrl-0 =3D <&gp_mn_active>;
> +			assigned-clocks =3D <&gcc GCC_PDM_XO4_CLK>;
> +			assigned-clock-rates =3D <4800000>;
> +		};
> +
>  		usb_1_hsphy: phy@8904000 {
>  			compatible =3D "qcom,qcs8300-usb-hs-phy",
>  				     "qcom,usb-snps-hs-7nm-phy";

