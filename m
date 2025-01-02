Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609BA8F66
	for <linux-clk@vger.kernel.org>; Thu,  2 Jan 2025 17:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735840166; cv=none; b=ecPq5GB9IYhcYoqUBMAhDvEYxxtArigEOh+QaL/1scvra27sLO5OfX2mzarP1pNS8alF2ezBAlgDTxsiXx6pcOjefSqQv08fZT/lMn9hYiRI1vWQ26iAVJL9j0XQqNGXIk001lEIlA4chTZrBmmS768G9lgmqxdmIICIzUunBcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735840166; c=relaxed/simple;
	bh=Z/tG/88HIGz5gjPu4kyJ/DOR5P0Ck6oNEbyOlAxiXDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XINXNLX8Le9XLNHt/PHBucchNHnT4a12ufhsRcODliC/+c2vCDLaec1opFAnFaiZlJk5y+OHk86f7AJUU+qc+EvmhUgPE0/bkGxqR1lsEWKp/jODzgwFD75KQwkWy5+x73SBDLk4p0H34H2CCz5qWRWjCEcXW/u7LhvtUJuBLFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a+YGCiwR; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a+YGCiwR"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385e44a1a2dso1364924f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 02 Jan 2025 09:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735840162; x=1736444962; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BQzXpHKZ38XKWlPQGVkN7bjW5ZJ+69jWQ4BQJv2lDvg=;
        b=a+YGCiwRbn5iHIsV8dhkahpMTxOIgmh9nOd9j2wKcC5KW+eaKMaP9G4Ka1NmJ/xQiB
         /Hs6W34lcgZIBiE5rNd51k8Nk8kM3wq9sSo5/clWiCWPBj/Fdmn9lOLTrUX2+sI5FKRq
         0Jn7iZlTpmrcMR5agmYd0BTzQEj0pw8XU1hv3PCSVWdHOCUtFj4F97gviWygCOY5az3M
         ka0O1xc5b+ORXo4S8TaLdgkXHfS+PU2ejAGiw8Rrc1dU74ETTNaFmB7FT1dCi8lCNKIH
         QVHLLak2X4GYXxKT2ZuBDGVUyKuXApB+EQZM5ggq0zJrNnG7uXECnXi4HCpBtLIm45mJ
         G4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735840162; x=1736444962;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BQzXpHKZ38XKWlPQGVkN7bjW5ZJ+69jWQ4BQJv2lDvg=;
        b=TG3e8O1KPheF7xEDnAofuH4GhrMLywiQm7ZuEKi16LcxVfHes4zWALUIGdn4Kl8v9q
         8jTtO+DqPqKTH4hhI7ycjd3E7LAutHU+qO64H+lKcLBPc6qs1OCg6mDOtfO7CTGqgi2Z
         qHAiTDLs19PsOZz/XI52q8bv5wQQ7yRr4Qx4qNAgOU3R6fbL8XFD3DAIfztbUizrRCCR
         4GhxlYXE2gTi2gUyOTBV1jTznoxHBLAB2vFZm4PbmZQq/OJcnYMW9/fw50IyzLyQ2qz0
         vzNcSNm613aByqLD7ZZ9vvQ4uPibIgFlkb9tfOT4wQZ85OfdsGcgqHIsmvG6p8mCaHl7
         c/yA==
X-Forwarded-Encrypted: i=1; AJvYcCXqjzgHgQkc+yHygZh177PWyVCZOo9FDQRla393dgFHQniYC1lzNT28pyg50xv1dD6yHhsMw0UWELc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9+Tjm4y9bw38ENHyp9S2tdv2ec5cj8syYMIvbGXM+4pcZ/zWj
	9/CtAdv1S9+ZhzvVwiZGb9ZFUcXssOilUkuvveqV4MqZUuqoOgIyfx+7NzKjxi0=
X-Gm-Gg: ASbGncuoXayrw5+JrVXGCdWzIVA+zusjnLEyhSUe/A9inPrm+WzqC8Nu3YBfMcY3gGB
	M651i+NwyqPROhKO81+edhNXuPJmKJkOVf69mKAGFNNBAaVFsZf9eObRTaoDmHxLeDs2QI1RW1A
	fVoRzu9fJUfLohTFUWS2+xPk7TO9xxZ0/UsKnxUTjKkV+Sn28BIRB557JEoN/y7s8bp5HnAxYeq
	MrWSRb6pMLUMs7OUsAg25DW1E0Rh592WmD8/wvwBs0PuIn/HNvxtcRxPfzysbEnrKEYbsoI
X-Google-Smtp-Source: AGHT+IEMAMwuukkLzGiPQ39+VlqPA5uci/lVeQvAMvSYKotrXDL7vVyhPBdae/AizKHwtC9ADf4SVA==
X-Received: by 2002:adf:9d84:0:b0:385:ed78:e17d with SMTP id ffacd0b85a97d-38a2213dfc3mr11989392f8f.0.1735840161715;
        Thu, 02 Jan 2025 09:49:21 -0800 (PST)
Received: from [172.16.0.204] ([79.164.49.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8474b6sm38703730f8f.51.2025.01.02.09.49.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 09:49:21 -0800 (PST)
Message-ID: <28db1605-e9b9-4b44-8af3-9b7abf0e83a2@linaro.org>
Date: Thu, 2 Jan 2025 19:49:17 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-0-cb66d55d20cc@linaro.org>
 <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-4-cb66d55d20cc@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-4-cb66d55d20cc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan.

On 1/2/25 18:32, Bryan O'Donoghue wrote:
> Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
> of previous CAMCC blocks with the exception of having two required
> power-domains not just one.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index c18b99765c25c901b3d0a3fbaddc320c0a8c1716..5c7b0c048d41a4ba3d74bbf77216ad09b652ed30 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -5,6 +5,7 @@
>   
>   #include <dt-bindings/clock/qcom,rpmh.h>
>   #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
> +#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>   #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
>   #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>   #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
> @@ -4647,6 +4648,21 @@ usb_1_ss1_dwc3_ss: endpoint {
>   			};
>   		};
>   
> +		camcc: clock-controller@ade0000 {
> +			compatible = "qcom,x1e80100-camcc";
> +			reg = <0 0x0ade0000 0 0x20000>;
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&bi_tcxo_div2>,
> +				 <&bi_tcxo_ao_div2>,
> +				 <&sleep_clk>;
> +			power-domains = <&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>   		mdss: display-subsystem@ae00000 {
>   			compatible = "qcom,x1e80100-mdss";
>   			reg = <0 0x0ae00000 0 0x1000>;
> 

Looks good, thank you.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir
