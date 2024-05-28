Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C92171E75
	for <linux-clk@vger.kernel.org>; Tue, 28 May 2024 13:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716902141; cv=none; b=uamIdTQ43cPLHCwypfq7sOi7DIURH7ec72iD9rq8rcdXJ1wOm4LMHJvqSHOcbE0R9acTJh0oIj2aVKrOLwkTd4rlhaPbVgbxks6Lnhfs8gfeUAr31moj0UwOi9TJnF/pJi14BfPJhK1N7ygALnmDyUq3AnOOpRTmNuBMBbg31OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716902141; c=relaxed/simple;
	bh=W8rsp0hIJDoaTw74OfM1FzmRlw3RaFmbHAOMyh1H54c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q24u4U3Saq9aO0ZbQU2uWInirQH8YuZ0oiIXqQ+wqMqNfU+uhMBWhftTxHN4GJ7gsu/0LU4N/eHuvDqf3yFruqU97QsHMYJ8ewmhSVTq3xU4Pd3GkwcUITdjE1Tklp99l5Cp+2PfpW9Se9eoChYLzgoUdk3sI8+piZINlbPDL68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mUa47vvR; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mUa47vvR"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5295f201979so922265e87.2
        for <linux-clk@vger.kernel.org>; Tue, 28 May 2024 06:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716902138; x=1717506938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xF2kMY/CazZCXxebEUXZ6YdaITOFmvfz1QcsXi8uJ9Y=;
        b=mUa47vvRO1rMfPRumtnVxrmvY1wFAkfhB5ULhkQfYPUHNPqCJ6jo8yT4LW4ydBioUX
         5yr2DmVTdgIcXPIoIFIQ9Sr+yclIO7wz35FuydNigR8JWTInedAjz9a/T1Qby3Yq5a4J
         gJFg2Xz9qgAuK37wrZZGoj93vplnliWwPyrp+fiV3wE09edac3lsFUpLpu46dojabvhX
         3KF0yuwxQBMbTBBzX3X7BXvMAea+hmeydMhfk638dwc6edHhzEFq9kti0JQwEAAkm85O
         LsVuaQXv3krXjKaCChnC6T9/AuRcgPypsdK22PoxS+pTZu/JwvldErLkaJR7pBWSjvdi
         U1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716902138; x=1717506938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xF2kMY/CazZCXxebEUXZ6YdaITOFmvfz1QcsXi8uJ9Y=;
        b=oeYMQdj6fc9qHx0Z940sJd9S6N/0Jzcd2xOYDYHjQeZI3u1ia9AV1y1157MoBBCM3H
         hc2k+4XEKT0s/R31HGiYXjwuDt8397oYO6nFf9h3T5pzjC8yXWL7UjeUepu2cK7TU62B
         Rom/wjoiUq7EiY/Wd0l3Qsi/REarjJWS65VRsww70EUjnQSOWFgxs8Ug7MsCWjoQVOuh
         xyFklhMkROk8e+v13XStzjer5wO7zcqK1LqVDzx3DsEuEYODOvDpn2kd8jR07Nh/GS8t
         lQeZ/nxjo0/NTJA8BUKv268NqtNe5+2sXOs9e0lKDyw+yu3PDeGv8FsRtH5JO9p5QSD7
         +EEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXlmXL2R5kXN5U9TskVcb6x80oBashrOSLeLZU5U65ICNHlCEZf6Rq6+iksLKkIPy4RfMKezfyl9+9gnX/2wnbxbjZSYtIEqOV
X-Gm-Message-State: AOJu0Yx2g/LtvruGWPnKR0vvdEPLBVx08hVPt7P+fW+YgEIPvaGaqaoY
	A6Ku8dAl6DExVSS/3/bXEI/6J2Z7v7Q+T8+ST0ZKwYHmQ3Hm6bPq5OWn0F99Sg4=
X-Google-Smtp-Source: AGHT+IEGJg0lwsc4FV394tWh6c0UAiTx5nk9yvMZiPrFY66fKx8DLB2YTgxL/4Q3j3UXk2bBjpoHVw==
X-Received: by 2002:ac2:5a09:0:b0:51f:5853:14e3 with SMTP id 2adb3069b0e04-529647d8360mr7061052e87.25.1716902137987;
        Tue, 28 May 2024 06:15:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529711fa92fsm956807e87.263.2024.05.28.06.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 06:15:37 -0700 (PDT)
Date: Tue, 28 May 2024 16:15:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ajit Pandey <quic_ajipan@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: Re: [PATCH V3 8/8] arm64: dts: qcom: sm4450: add camera, display and
 gpu clock controller
Message-ID: <rlpiuzfhjzssp2bt7bbltn2hoofw2oxga7q4tl26qs5ctvjl24@boejq5zyqmfo>
References: <20240528114254.3147988-1-quic_ajipan@quicinc.com>
 <20240528114254.3147988-9-quic_ajipan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528114254.3147988-9-quic_ajipan@quicinc.com>

On Tue, May 28, 2024 at 05:12:54PM +0530, Ajit Pandey wrote:
> Add device node for camera, display and graphics clock controller on
> Qualcomm SM4450 platform.
> 
> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm4450.dtsi | 38 ++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm4450.dtsi b/arch/arm64/boot/dts/qcom/sm4450.dtsi
> index 8d75c4f9731c..ef448e13b8a0 100644
> --- a/arch/arm64/boot/dts/qcom/sm4450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm4450.dtsi
> @@ -4,7 +4,10 @@
>   */
>  
>  #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sm4450-camcc.h>
> +#include <dt-bindings/clock/qcom,sm4450-dispcc.h>
>  #include <dt-bindings/clock/qcom,sm4450-gcc.h>
> +#include <dt-bindings/clock/qcom,sm4450-gpucc.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> @@ -388,6 +391,41 @@ gcc: clock-controller@100000 {
>  				 <0>;
>  		};
>  
> +		gpucc: clock-controller@3d90000 {
> +			compatible = "qcom,sm4450-gpucc";
> +			reg = <0 0x3d90000 0 0xa000>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
> +				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		camcc: clock-controller@ade0000 {
> +			compatible = "qcom,sm4450-camcc";
> +			reg = <0x0 0xade0000 0x0 0x20000>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_CAMERA_AHB_CLK>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};

Please keep all the nodes sorted using the device address.

> +
> +		dispcc: clock-controller@af00000 {
> +			compatible = "qcom,sm4450-dispcc";
> +			reg = <0 0x0af00000 0 0x20000>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>,
> +				 <&gcc GCC_DISP_AHB_CLK>,
> +				 <&sleep_clk>,
> +				 <0>,
> +				 <0>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		qupv3_id_0: geniqup@ac0000 {
>  			compatible = "qcom,geni-se-qup";
>  			reg = <0x0 0x00ac0000 0x0 0x2000>;
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
