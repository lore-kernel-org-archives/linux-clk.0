Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6CC49738E
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 07:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396573; cv=none; b=RGDDYDtGAYiCtKTXCUY7Zdpuzsyf7zfp2nyp1Ge9ELrjnv4I7jPeSraYdmZExXJQXQcy6VUnMfm3KBlPqri26dMeoGbvZriDjAK1yMOC7RJXb5eCPGIWtA1LcWvIyrxNaR4U4g+4/gkkAmVpt2flMjCsPlxqzLFd5qi1KH1wz90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396573; c=relaxed/simple;
	bh=Mbao0ZUjMArL77rKoYJadFYD4YkJZ1UAMvZ/S7jtPkk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ucT05ITJw9J/y95AD+YnrE5LEvXCYJo+nlhMLxM/UthW277S62msTsLsdTM82zXTUgGDkGf18oddtbMo5RVxMHPMSNqsYxYARlowP2/AmLGVwq21Zewlv22OSNbwbuR19E8RefXOoxbpqGS1uvoe8o4ES3a+k0a5HYJn8YLUNyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MrTqI4gS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MrTqI4gS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 572B81F000CE
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 07:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792396571;
	bh=2g+tZ3f/tKxpVgTAphkVP/7LRjo/1vbZL5IP2et9URU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=MrTqI4gSfn6hl3if2Bca56O29VVkYqMLZ2O3spZnYjiKGJxAbVKJ6ErywrOOuRKYP
	 RV0L5XnweD20MyPreSC3BRCR7KEJnuWJ4FaTC6XiGEYwFL7W4CH5W2fW07/WSmTSz+
	 X0DMDTx2SFcnNLjXqOg9RqbjPW/EueTsdhXXlHAm/Qkp1IM/zl+eMXQJb73xHNo4uW
	 YFoo89ZauWsQh2rM+pR7eVKELdL5RvobfUuOqnn1eIqtdj+B5kYwQveg8AZhemIYpM
	 g8jZipWTtn1rJQmO566ZCaJiGdxO3s5lg951gwuNII9BsxyQstxZIKXd6KN28SxA4t
	 MLstE5qCNgolg==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab30b3212aso8336961fa.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 00:56:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBznJxpMEstbDgkUECelPy2mgbDFO+l6koxVYPz84j9CHm2RKne5TSNsZDRGP4mG1K+faYxVGaAn94I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLekfFPY5yUaj0+niCpSsgx6G69eU4tB+xi9V6c8CPH5um+6bLA
	pYFJTemPiA0ggCFI5/hKvYXYsKgc6FUo5zsqFGPkcSca25jRVEbwtXADozW3ERldDCvFN+LMkkH
	B/YfAOFqMlDNinTd6FIlbXCzqzI/ZxazyTXl0kFytOw==
X-Received: by 2002:a05:651c:324e:b0:3ab:1525:60ac with SMTP id
 38308e7fff4ca-3ab28f4910dmr15090981fa.1.1792396570080; Mon, 19 Oct 2026
 00:56:10 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 00:56:08 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 00:56:08 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261017045817.1506961-5-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261017045817.1506961-1-shengchao.guo@oss.qualcomm.com> <20261017045817.1506961-5-shengchao.guo@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 00:56:08 -0700
X-Gmail-Original-Message-ID: <CAMRc=McnjCvLG68rczsWG3kzbEgUK0OELXiJjru_dycZ7j4Z-Q@mail.gmail.com>
X-Gm-Features: AclHuK-cdAoXx0Pik_dUpFzW1Ov91tKFmHPIE62Ca6MoBV3RbxO84t0yIsH9VdI
Message-ID: <CAMRc=McnjCvLG68rczsWG3kzbEgUK0OELXiJjru_dycZ7j4Z-Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: nord: Fix videocc clock inputs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Oct 2026 06:58:17 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> The video clock controller binding describes three clock inputs for
> Nord: the board XO, the active-only board XO and the 32 kHz sleep clock.
> The videocc node instead passes the board XO and NW_GCC_VIDEO_AHB_CLK,
> which is not an input of the controller.
>
> Pass bi_tcxo_ao_div2 and the board sleep clock in place of the AHB
> clock. No functional change, NW_GCC_VIDEO_AHB_CLK is kept always on by
> the NW GCC driver.
>
> Assisted-by: LLM
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> index 1ab7d9bc3cfe..62d14be55839 100644
> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> @@ -886,7 +886,8 @@ videocc: clock-controller@aaf0000 {
>  		compatible = "qcom,nord-videocc";
>  		reg = <0x0 0x0aaf0000 0x0 0x10000>;
>  		clocks = <&bi_tcxo_div2>,
> -			 <&nwgcc NW_GCC_VIDEO_AHB_CLK>;
> +			 <&bi_tcxo_ao_div2>,
> +			 <&sleep_clk>;
>  		power-domains = <&rpmhpd RPMHPD_MMCX>,
>  				<&rpmhpd RPMHPD_MXC>;
>  		required-opps = <&rpmhpd_opp_low_svs>,
> --
> 2.43.0
>
>

Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
