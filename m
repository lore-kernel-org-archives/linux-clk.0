Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B963639EF10
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 07:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533341; cv=none; b=VEW2isQboOFsElFw1dYkqCgiRmXfFpDX1VLluKEQDCgm7fJYPzaxsK65g47xmV8bxtZH34dLT0Y1GcghDRxtcHIQ7rthK9AzK/XVZ5doRz2G4HTAotxwHDhePbLDQxIjL8Dd633ToyQvDFavtQmCPU9miD8EkHtH3b/0FjxuxSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533341; c=relaxed/simple;
	bh=943u9tGah9fZKkBwSz2vWV6zvES2zNY+ugxae7nl5oY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mrLz/SyJCth60DHMqPvS5cKE3nMqazbv083gaITrcFrPa2d7hM3EtsQmE6+OZA9Uia9MO92F9Wim2D//TC3BTy/zc7YuIfYkTb0y7lHSrzA/8iVoGE2571zg6wk0Zgwa4ILhDlwdG0sZix5YpJNoqiXJSehfPFXYY7oaiG+/3Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qOpWjSls; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qOpWjSls"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d7645adbdso344705f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 00:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777533338; x=1778138138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VmRymc3GPUbLGGqxDSkazp7UPTgnpwv2CEs1VA6yd2g=;
        b=qOpWjSlshHfX2QfWoTTjkcCTyIqnQYo5T6I8dnS5wKZOZG91IPvbBHH5p7naasmH6N
         7MN6PJePxwV8U69lrB+ch3lvFOMOSycneyiLh68PV+fcznyoI8FFC6aLj06nitOI20JT
         tZRgxL3XplTq1dJA/OQq2pwhFCBZpO29JmxxK5FtpojsaOAStm02C/bkJpenwo9UjAO1
         dgdCcI/vhAX9F3KKIYHIgQe9/pMJQckGI0vhXAxEGUxBpGsuByGhBVaaHo5D5W6bs2oh
         t6W0cnkLZXM+l5S53mkbdwnKRQHnvV9oQNsMgaJWVxhia7/0cFE8bXRQv5t4fjbYuJba
         nzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777533338; x=1778138138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmRymc3GPUbLGGqxDSkazp7UPTgnpwv2CEs1VA6yd2g=;
        b=Zuj+IRC0Rf4oTbDhFT9x8NSWJuZrFwcJkfgdKAJwdK9dCNN2/Ys+AW+OTQUDt/oRDK
         MUshPiCe1xnSjAhkARsXzvWffnyMqyAuY0tBhlx6rHhVyySkFmXN3cWRg9jAt+ttNh6L
         vSl5TVGfaxnWQmEzOzE68OfMtA9uzpuDfwDgS6WSqfJE6CCm849v7tv6WMCNoI7hHsHU
         60uSvZu77+wIJM2UWI2rIGhG7zzEPrcJVwT4O+Srn65ZIMau1BXiCVk6yozV/2XDEqqP
         jzOH4PcJpyt6tUgV6EeoNEZsOzNyhEFN0azAWutS/MHPBSSKScpPOzWTyqbWY1FfgfPZ
         3qYg==
X-Forwarded-Encrypted: i=1; AFNElJ+x5LKhimb+PkPNTA65GklfZPpuX7JuC6Qmq1XwfgEUFRmIU8ezoe3Qb3MC1fJiXWNT5H2V1zo74cQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl+T+mrGbDIheO0ViEt4qHChUl269Vvn6P4BVPoOYP+vzqzYXi
	uG0lXh9aXXRMB2Mio+nG/JZn5BIn4kzCk5CiBNePwlzatD0y4IyKdo4I8h9s4BJxm50=
X-Gm-Gg: AeBDiespSXrg5Kwtxe+PprgaDE8EBG2o979QksxnOfl0DMGGwjG1TXtvPBJbcygWqtw
	DI9awgaRoQgMqoHMrQTDBAcj+1IL3JnshItvJI4eeIxn6LesfNDD7KpM3VhdoLVxywPSoMYqI42
	N8Ta9IrAUjz/A6Os4t0G/Sn6VB/hl36wFJQS03wzWhLmDBnFutT1eYwJrCyicu/aBbnb9+8z/m0
	oc4wy3FUBp+DLMavz1LGzkQCVM5yqjkC+r//4+OSfQysA2Er4IJVuc05O9YZxNh/U6da38Qrs18
	6l7s3iuNiOKJzM/31XFqv++Z73uX2RvFw8LntaMGa8Dv0UHOsGXkP20AF5ondzH6WXneRR0v88t
	O842CqSAjXZJYQNzXjer3/ETGIbACECNrtUu9OBSbMQee5ELVryrFT6G75NKLnaWrfqTwOVwmCT
	IpONh9w+v2dksURu/w/bbKw/bHzEpQu+mKVJwWHEV9XLsA7DLk
X-Received: by 2002:a5d:5f82:0:b0:43d:2be:e54 with SMTP id ffacd0b85a97d-449403a9bb7mr2449221f8f.39.1777533337875;
        Thu, 30 Apr 2026 00:15:37 -0700 (PDT)
Received: from [192.168.42.159] ([83.240.169.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7217c56sm10970745f8f.20.2026.04.30.00.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 00:15:37 -0700 (PDT)
Message-ID: <749460c6-2111-4729-a5f1-711d674bacfb@linaro.org>
Date: Thu, 30 Apr 2026 08:15:33 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: glymur: Add camera clock
 controller support
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
 <20260429-glymur_camcc-v2-3-0c3fd1977869@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260429-glymur_camcc-v2-3-0c3fd1977869@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/04/2026 15:14, Jagadeesh Kona wrote:
> Add support for camera clock controller for camera clients to
> be able to request for camera clocks on Glymur SoC's.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index f23cf81ddb77a4138deeb4e00dd8b316930a2feb..8e2a872988d1c3d97506856e2e5325646db59746 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -4163,6 +4163,22 @@ usb_mp: usb@a400000 {
>   			status = "disabled";
>   		};
>   
> +		camcc: clock-controller@ade0000 {
> +			compatible = "qcom,glymur-camcc";
> +			reg = <0x0 0x0ade0000 0x0 0x20000>;
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>,
> +				 <&sleep_clk>;
> +			power-domains = <&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>   		mdss: display-subsystem@ae00000 {
>   			compatible = "qcom,glymur-mdss";
>   			reg = <0x0 0x0ae00000 0x0 0x1000>;
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
