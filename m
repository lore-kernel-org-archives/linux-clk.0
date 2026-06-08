Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAAE4204E
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 07:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780903355; cv=none; b=XywYoL/FVxl8sXqyWyDInvADUEap92/Ecy4B25KwVkXNdF6eMeEwmzj5jNOZDBnzt9HFSq3xGm/NmvTdPMO5u5Rkff3anrxVPC65ZQddISb/LG2yzbfYglLn/PxC375k5LCl5VlFVHU+CbGCF7/V3fJGaNxim/6HgR97g1mS9ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780903355; c=relaxed/simple;
	bh=wzQNdlmjd688BGImntQtEQI1p7VVOPGkO76LyuxhkkQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=UijhIe1hcrUqbO2vkbEn/kEnd4N40+ARU9GYl5bLWxp1CGAECNsj9ocqZ7uBRc5uIJ4xi/q7DCxYwLLTlFsCTaFyYLyfKj7Sq7oa9BlQoCB0XxEF4F5nJ08Ka4h7B/Hasp5dI8crkj8IgFK52GMRHN0uOWbmZsYLwx6tyDdpmL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=lmkk+bbg; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="lmkk+bbg"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bec423a5265so623881866b.1
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 00:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1780903352; x=1781508152; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2Y0KW7oVfaQM+1Q8839F5FmCJcIAYyj3m03V5keb/Y=;
        b=lmkk+bbghZAUFFEeUTEc9xxKYh06JgUD34/92WTWO9+p75I9SZkyZucchNqDy6TiZE
         JQ2YdEIatmlO7qjFADE0Lws4uAceqAA0A1HdMZ3lJ3bflmGKjzJfxBIuyD5Fhnaf+Vkb
         6mOM9FUNIorI4UEffhJjgJ7bNPq9SiZvaZVEHOSWuzYcT2FyU3K9l/x95jEcgeDmlGfm
         Q0j0digtQ0eXlHlr04RD31STX+pZRqxnvgSqV13uDHNlsiFU4LTMOoSnKrOv0kBFT5hT
         k8eWruvTnZekI333Zz4Ye91wFBfOcFzhZfexq9okRxHPZ8FgskaNLCXiCiIC95/HGC2a
         VlgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780903352; x=1781508152;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u2Y0KW7oVfaQM+1Q8839F5FmCJcIAYyj3m03V5keb/Y=;
        b=CyKNP862A/V0I4L4nHIC8jsGsi+ADxasJF2VOptQhc/tuMRStSu2wtgkEQ5Zon7II5
         VPqNp4kurQSLD79C1xfRpAhpaJ4MguNGoMWDwl8s/4Sr3ywcYFVlob0OSVvbb8G2Pdvl
         hhz/5KEQK9yPwy/q24IJ6yVdn0Cl4cSDsFD64Ebm2bKke8N2m4yJ97d5xoESDjRvJiC5
         GtGurvFPKCkhUFJKBSbNmX/l+1QPFTAREgLeeHp5I1Ibj6P3Bj7Riid1+bpYleyT/Wpb
         7tycMUWbmjVkoJr4yyYW1wBhk5Bj5g+9xsKweoeLiPBTk01yIc7zlnfLqFNcOeeRmyTq
         D53w==
X-Forwarded-Encrypted: i=1; AFNElJ9iRzxxbYWrEQS3308KYcjzZMDCppld7TuPNIn0sAzgNWUvsEZOp7bnNoiQf3lmi302rGtH3PrurSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxslcXRvhiDHtnvcYzLuMdmCINmNlXlAFb6gTv3ilfjbYm5WFkw
	B9YlffHwRKZVD369rOzNue5KKcEJfThU4efwCrA78RVQGV11Hj9rHyfbHtvOk/zlZdI=
X-Gm-Gg: Acq92OHmEIZGgyh329ltqpD1bRKCDmy7lJhjTixjfMVnyZM3xYWlObC6gQ7oyMoyUnZ
	DT54TbJAWOt+ipt7Zwo2WMnkE5CYh0ZXkSTQOK+8GeZRAsSWAwVuDFRyuZOmNKbrVn/7c16dAJE
	/r9BTCV/Hz7YbILZL0FYHKq8axs+D/JwFjNkSDhdp2V5a0L1qT+f+Obx9SuSdFq/K13ObGUxk5t
	F6l4rpNk3xWRa5s7NjVztIVVyi/ZyMS6q1SerXXWRUYeaKw3ZQwvXdlfVGSq+XbywtsSS+WQUlb
	g4xWWkVn31KkpZXDL/RZ5Zyvw9AHpJ9dAlM6M6LGhxnDAI1g/9eUExnJydE1inhKkAejteG9YkT
	sloehqCgZQG77m8jj3nAu/WhpcgIS3Qhl3yAUwot/yBcvbYpTTFR+vqgGl0Mp2Gieqi44Vjya3c
	8ihJ66vyX0gTgyLgFFlAJYJS0SETrs9z/GxaCdUBZnbZDmC1e0WG4uBCcVm8z/T3GhgM5UFVcOV
	sh1MJs=
X-Received: by 2002:a17:907:2718:b0:bea:f4e0:c7b9 with SMTP id a640c23a62f3a-bf370d638ccmr493709066b.19.1780903349716;
        Mon, 08 Jun 2026 00:22:29 -0700 (PDT)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05176fd20sm838285766b.7.2026.06.08.00.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 00:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 09:22:28 +0200
Message-Id: <DJ3HJRYX3CJG.JURHJ0YAMA4W@fairphone.com>
Cc: "Ajit Pandey" <ajit.pandey@oss.qualcomm.com>, "Imran Shaik"
 <imran.shaik@oss.qualcomm.com>, "Jagadeesh Kona"
 <jagadeesh.kona@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <netdev@vger.kernel.org>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add gp_mn pin state for GP M/N
 clock output
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
 <20260602-pdm_clk_gp_mnd_v1-v1-4-1522662b6c53@oss.qualcomm.com>
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-4-1522662b6c53@oss.qualcomm.com>

On Tue Jun 2, 2026 at 5:21 PM CEST, Taniya Das wrote:
> Add pinctrl states for the GP M/N divider clock output pin across
> multiple Qualcomm SoCs:
>
>   wire it to the GP M/N clock controller node via pinctrl-0.
> - kodiak (sa8775p): Add gp_mn_active state on gpio35 (gp_mn function).

kodiak (sc7280) - this should be gpio60?

> - lemans (sa8775p): Add gp_mn_active state on gpio35 (gp_mn function).
> - monaco (qcs8300): Add gp_mn_active state on gpio32 (gp_mn function).
>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 7 +++++++
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 7 +++++++
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 7 +++++++
>  3 files changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/q=
com/kodiak.dtsi
> index fa540d8c2615dc02d941eb16bc7253204c2750bd..1ff9e1598d00429c03b2bcae4=
1fa370ab2c892bd 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -5908,6 +5908,13 @@ edp_hot_plug_det: edp-hot-plug-det-state {
>  				function =3D "edp_hot";
>  			};
> =20
> +			gp_mn_active: gp_mn_active-state {
> +				pins =3D "gpio35";

gpio60?

I still find it incredible that the QCM6490 datasheet (80-20659-1 Rev.
AJ) doesn't even mention this functionality on GPIO_60.. I wonder what
else is hidden on these SoCs.

Regards
Luca

> +				function =3D "gp_mn";
> +				drive-strength =3D <2>;
> +				bias-disable;
> +			};
> +
>  			mi2s0_data0: mi2s0-data0-state {
>  				pins =3D "gpio98";
>  				function =3D "mi2s0_data0";
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index 353a6e6fd3acb22ef228bee340212b8b2c300957..19f8cf4e15482947f60491880=
50c370340afaead 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -6022,6 +6022,13 @@ dp1_hot_plug_det: dp1-hot-plug-det-state {
>  				bias-disable;
>  			};
> =20
> +			gp_mn_active: gp_mn_active-state {
> +				pins =3D "gpio35";
> +				function =3D "gp_mn";
> +				drive-strength =3D <2>;
> +				bias-disable;
> +			};
> +
>  			hs0_mi2s_active: hs0-mi2s-active-state {
>  				pins =3D "gpio114", "gpio115", "gpio116", "gpio117";
>  				function =3D "hs0_mi2s";
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index e4c8466f941bdba04f99b988fd7bf5afd926b31d..ebe5889daa5300efa7857314e=
9170d7d2fc33ef7 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -6433,6 +6433,13 @@ dp_hot_plug_det: dp-hot-plug-det-state {
>  				bias-disable;
>  			};
> =20
> +			gp_mn_active: gp_mn_active-state {
> +				pins =3D "gpio32";
> +				function =3D "gp_mn";
> +				drive-strength =3D <2>;
> +				bias-disable;
> +			};
> +
>  			hs0_mi2s_active: hs0-mi2s-active-state {
>  				pins =3D "gpio106", "gpio107", "gpio108", "gpio109";
>  				function =3D "hs0_mi2s";

