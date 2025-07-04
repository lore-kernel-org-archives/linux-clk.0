Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034CE299954
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 15:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751642703; cv=none; b=cGuPAA4ZBQHbV7hScNnhJxBPzf+NIqjhMcQrhRYCtzBs/hA11+nRZypextKp+i2FuDOwpHwDbxo5hYAXXdMP3phE6HxDhX/UUbnYfT0YmogyLu/iuc2IiwYmdfsrzH8E6GTMCMPqA/91AsXfgfC+UKctVKA6l1YUfv3giuNzR38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751642703; c=relaxed/simple;
	bh=4+t9XeVok2CNNwq8+4fTqhuZ5vwv/14UGzpJiaIIxL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YYMo5BOVxwD6dzuUCtqXhnX/a9ynl+XI6fXPGNPl7cknJbSEX3bYCM08hvTq7Hy9RLpMLMRKOjf5ZKrggzh83+iU412tHeHLZy556q60N/PjTpe35gyKUaaHKivB1qc528Ji4McXfpZCKiwtdaSSKHK99OAhpAQ5/Vfg5xibzE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xvethSmZ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xvethSmZ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso592816f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 08:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751642700; x=1752247500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ex3KxNtMtSZ/VdrbXkChoGhTiQNqhVU1db+WMbI9p8M=;
        b=xvethSmZlvBbj0Iwf55DsEOkXGJYBKk7O2C4xgcbOSZMXTF7dIZ8LiRiSpY3thzJfB
         UyNP4JS/UP3eyGfZRiFrDIInMzkChkFrAMowEx7QIc02mwUGqdX0PL5KwPSUjipRO5N2
         RXZeU5+1dqHGfy+b+klDvS5oxGXJQnd9Ww6e0S8rZ3FzwjW9PT9Cj4kEZQPobZrva1In
         cLQTLBG1kQy+6aPEKeXxOO40N+5tNScJJ20L3b/jEOak12iOKl3AaLP0EraIWrwmWHTz
         2lgapNFX2YorJjn5Z2HnF7TJXwwmm2j35UnWIXOrEjOonleVZduu5O6w2RsCoqRxAehX
         L5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642700; x=1752247500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ex3KxNtMtSZ/VdrbXkChoGhTiQNqhVU1db+WMbI9p8M=;
        b=ZgApL+wqjRaQq8R6j46cA0i8SWtkzLDHMQqlb5U8HBXmP1H8771w9YMx9fN326bwc5
         sb/iK9fqnC9yz/AlH4ahKPcSqBBYilw+ZhaDtL9C8+xVRZsTUJADvgp12J9orXKVakLc
         OolGp9z9GYSif89bD5bTjf9gRO5cacykovD/sRkGfvARa/VcxPE6STU7fynHDjegai0J
         N+WqFbCgvkPqJtcJlnVdXQMLPR5D5iZeubudGavuXNlOLS8XthCSXpOq+mBMml85251i
         0fzQPdHzi6dwllIuEMPVGZEsK0BTPnv8k4sDkN7QlB2QC5kgv7HKOAfFOCUrnk6V4cJM
         AaoA==
X-Forwarded-Encrypted: i=1; AJvYcCWCjQVwEEuRz5jg4HSeSXsKiLRXcjLRAcOcpGzI3B5nUkZBv4je+2Of1qtHxwBPMj9+ry765RUHf/w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt7T0yhAyhNMQvPr49CTr7+iLzRKeMMoUByJNipUOAA7QO6UyG
	VBiqazPP2R5kNWr8nkpVeeXh0HK1UTSzGzuz7iCqGafCIBbbTiu9veGxadhWOiCZLtodzwPq8YA
	84dFnQ/U=
X-Gm-Gg: ASbGncvobfndvRTlPk5TpX+oo/J8vtb7yTzU7/GnfxdFXJ3C/gNNg2jH88S2hABOPH3
	CBel3Oy6lzXpOcWej1PM3SnzK1+IeskyyEI4JBcLEivOrDHT05uq8ubMi6u69ZXJVsVMVHtoAMb
	KM+cFeg+b/kxE58HjydM6uTVCNkkZtcpPdQ5D1XVo6sh3rVseD0jefqll8kRZlyz39ykkvX3loV
	ZiX1v4aVLvOixgTvbZLMbrhNV98iog2/xf50f9WhW8eHVLUoao84auKSEh9S03UoWIg/rJw/K94
	Qny6Hfb4li2T/NB2x1yhWABH0ePszErj20Ff7wsmYsyOu+XeYFxxTYYkAGoAQU+zi0q4xN0MlXp
	zCsCy5AkquwGpiK1kOgVfn8/j4X4dqcvCEvTKIlU=
X-Google-Smtp-Source: AGHT+IFbHQUJNEaUtYuoiAKnpxKSTUdx7Of+p6cxehImAaw+BY4hOH0GpPbuuowaAwyAR0v3kXlQMw==
X-Received: by 2002:a05:6000:4210:b0:3a5:2beb:7493 with SMTP id ffacd0b85a97d-3b4964c8b9emr2778414f8f.9.1751642700293;
        Fri, 04 Jul 2025 08:25:00 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b9651dsm2780455f8f.65.2025.07.04.08.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 08:24:59 -0700 (PDT)
Message-ID: <f1c4240d-a601-454b-9cc3-88ed8becb490@linaro.org>
Date: Fri, 4 Jul 2025 16:24:58 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] clk: qcom: videocc-sm8550: Add separate frequency
 tables for X1E80100
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Johan Hovold <johan@kernel.org>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
 <20250701-x1e-videocc-v1-3-785d393be502@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250701-x1e-videocc-v1-3-785d393be502@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2025 18:28, Stephan Gerhold wrote:
> X1E80100 videocc is identical to the one in SM8550, aside from slightly
> different recommended PLL frequencies. Add the separate frequency tables
> for that and apply them if the qcom,x1e80100-videocc compatible is used.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   drivers/clk/qcom/Kconfig          |  2 +-
>   drivers/clk/qcom/videocc-sm8550.c | 29 +++++++++++++++++++++++++++++
>   2 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 26752bd79f508612347ce79fd3693359d4dd656d..53bbdbe0725bd1b37ecd4c6b15b0d31676d9f548 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -1394,7 +1394,7 @@ config SM_VIDEOCC_8550
>   	select QCOM_GDSC
>   	help
>   	  Support for the video clock controller on Qualcomm Technologies, Inc.
> -	  SM8550 or SM8650 devices.
> +	  SM8550 or SM8650 or X1E80100 devices.
>   	  Say Y if you want to support video devices and functionality such as
>   	  video encode/decode.
>   
> diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
> index 3e5891b43ee404edc6c99bbf8f2583cb44df9e37..32a6505abe265472de4059c4a048f731fdbf1dfe 100644
> --- a/drivers/clk/qcom/videocc-sm8550.c
> +++ b/drivers/clk/qcom/videocc-sm8550.c
> @@ -145,6 +145,16 @@ static const struct freq_tbl ftbl_video_cc_mvs0_clk_src_sm8650[] = {
>   	{ }
>   };
>   
> +static const struct freq_tbl ftbl_video_cc_mvs0_clk_src_x1e80100[] = {
> +	F(576000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(720000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(1014000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(1098000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(1332000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(1443000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	{ }
> +};
> +
>   static struct clk_rcg2 video_cc_mvs0_clk_src = {
>   	.cmd_rcgr = 0x8000,
>   	.mnd_width = 0,
> @@ -177,6 +187,15 @@ static const struct freq_tbl ftbl_video_cc_mvs1_clk_src_sm8650[] = {
>   	{ }
>   };
>   
> +static const struct freq_tbl ftbl_video_cc_mvs1_clk_src_x1e80100[] = {
> +	F(840000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
> +	F(1050000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
> +	F(1350000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
> +	F(1500000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
> +	F(1650000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
> +	{ }
> +};
> +
>   static struct clk_rcg2 video_cc_mvs1_clk_src = {
>   	.cmd_rcgr = 0x8018,
>   	.mnd_width = 0,
> @@ -559,12 +578,22 @@ static const struct qcom_cc_desc video_cc_sm8550_desc = {
>   static const struct of_device_id video_cc_sm8550_match_table[] = {
>   	{ .compatible = "qcom,sm8550-videocc" },
>   	{ .compatible = "qcom,sm8650-videocc" },
> +	{ .compatible = "qcom,x1e80100-videocc" },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, video_cc_sm8550_match_table);
>   
>   static int video_cc_sm8550_probe(struct platform_device *pdev)
>   {
> +	if (of_device_is_compatible(pdev->dev.of_node, "qcom,x1e80100-videocc")) {
> +		video_cc_pll0_config.l = 0x1e;
> +		video_cc_pll0_config.alpha = 0x0000;
> +		video_cc_pll1_config.l = 0x2b;
> +		video_cc_pll1_config.alpha = 0xc000;
> +		video_cc_mvs0_clk_src.freq_tbl = ftbl_video_cc_mvs0_clk_src_x1e80100;
> +		video_cc_mvs1_clk_src.freq_tbl = ftbl_video_cc_mvs1_clk_src_x1e80100;
> +	}
> +
>   	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8650-videocc")) {
>   		video_cc_pll0_config.l = 0x1e;
>   		video_cc_pll0_config.alpha = 0xa000;
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
