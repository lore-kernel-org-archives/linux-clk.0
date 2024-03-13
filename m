Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B000225CD
	for <linux-clk@vger.kernel.org>; Wed, 13 Mar 2024 19:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710357404; cv=none; b=aYep4P7mFG7fGKJelXhK7esSUschTIppAtIA+PfuRU2CUNFkLPBZgFhvPz7/JKjgOt+E6LVwnoOiQ/2IGjqSWuD1XjGwH8ugK3gst4/87Hp6zU8G8X9PEXgQoQyq/vpTPtj83olYN8Ql44TjxmlMBQSg/zyuqx8hSc8GY9RGwSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710357404; c=relaxed/simple;
	bh=m4KPPUj/LPNlflg1pckaoyEc6VURIxmSzIkFnMsSQfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GpdzmZUNVjqQHcc1Gzv9WMJ6AHVgQlm0an5ZYkQpAZgB6O4LU6lmKZdjBW00D5053+qgB1y64hacLJPcdHPVHJrrDvb+lrFQvbKOUt/CSNUEtaj6IihwW8FtiWB97t1m2621SpnE05T0cWvM9zjiG3Y8thOCdtTgFH73AEYtqJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xbc5I1y6; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xbc5I1y6"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dcbcea9c261so91952276.3
        for <linux-clk@vger.kernel.org>; Wed, 13 Mar 2024 12:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710357402; x=1710962202; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xvlDSWo+A7vodGITM/kTc7PRJIQ2/gEr0xBeu2xtrlo=;
        b=xbc5I1y6r6sQ+pICTeQWv+d7/7J2pCZIGTJr/kUOnd2TZnLKpmY4j4WF+Zi6rBYWK9
         jAR7zIerVo6NEg6zf94uS3/zH+r4ZfNxHdjiI5/fzJS7H1xakk4Zb0tYMF/ZZYcFhQN4
         EXkXZV2GRNW4ZoueHxCiIcRrwzAHJLTdOWTjfwqQWSXFf9XJQAoH1yWUE1dfXQXH9drH
         5bqwodZ9H2FnzaAt43T5y/fmmhRhhv+oNKGG5AsT/K0Cw/DOLgnOC26ZyTsCyzFfI39S
         JubmydrAuG24jgD7Y0+z68cUnMyp6xoKRTmDIS2zZyaR7uG0zgHe8hEz76MfvpfrVclb
         OMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710357402; x=1710962202;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xvlDSWo+A7vodGITM/kTc7PRJIQ2/gEr0xBeu2xtrlo=;
        b=hmX2YYRu37eYnpUP6G9gofzuvyq7OrNU+M8z8qSto6JTr3XbZ59jwQAv9s8qFR1W+/
         GcmDASqtYRBdojfiVzVfKWofW978bYGZBHtXoXQ0VxjB5GLSrNVXp15p8MOZ5d8deqir
         DSJPe+ZtY2JM2GL6dYmAbSfHX4oLrDu3jAojsK89gPURE2lRciNeKGG5wpEIKZkYLp8v
         jAoFNSUXrhQMLoHfPYvbsjs3n73O0MuxmXLuskkTkJ4G7KOEFUJKP31CGB5KRtSBZaca
         6DI2m33i1BbpqBPy45sAMU/IgI271jpP3VoVjSl8LAwK3r6GfjzSeZdtBRgUW6m9C51V
         oAPg==
X-Forwarded-Encrypted: i=1; AJvYcCWkIhqr/5OmmnR50cDSUgz3fe9z6fXOMzh5TYRhicSjei8FwSSjxcTp7Kf5XWkkMnTvV/PMJHqTOLpi3jrGt5YHeT7vFM9RDXI2
X-Gm-Message-State: AOJu0Yz9o5e7+LWH7WJucXrpwwRJ5aGuAX8VA+g8hpwz6N0DVuM+sHvo
	s1CiCUwFnXI2VCJar+J/y8EQFFdpcD9tbhw8LNBt0P+LBRyvzqPz01JifHC0wiQah1IOM4ORLz/
	YyhB4XaXs5aK8uLOdkUg6GK3x0nKUEBlwtvqVYg==
X-Google-Smtp-Source: AGHT+IEduUHtt74VENoCnyr89b+JuexyutgMvD8JlfHuxsB6QwCU4z2b/0JpvtHhUtME9mQB30djjdIHm/gROlYYTEE=
X-Received: by 2002:a25:f621:0:b0:dd1:4908:7a91 with SMTP id
 t33-20020a25f621000000b00dd149087a91mr3207599ybd.49.1710357402201; Wed, 13
 Mar 2024 12:16:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240313-videocc-sm8150-dt-node-v1-0-ae8ec3c822c2@quicinc.com> <20240313-videocc-sm8150-dt-node-v1-3-ae8ec3c822c2@quicinc.com>
In-Reply-To: <20240313-videocc-sm8150-dt-node-v1-3-ae8ec3c822c2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Mar 2024 21:16:34 +0200
Message-ID: <CAA8EJprrrSTLBoLGMSJw3g9BEcL6y+To1tr65b+AzNz01MgjTg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8150: Add video clock controller node
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Mar 2024 at 13:11, Satya Priya Kakitapalli
<quic_skakitap@quicinc.com> wrote:
>
> Add device node for video clock controller on Qualcomm
> SM8150 platform.
>
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8155p.dtsi |  4 ++++
>  arch/arm64/boot/dts/qcom/sm8150.dtsi  | 13 +++++++++++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sa8155p.dtsi b/arch/arm64/boot/dts/qcom/sa8155p.dtsi
> index ffb7ab695213..9e70effc72e1 100644
> --- a/arch/arm64/boot/dts/qcom/sa8155p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8155p.dtsi
> @@ -38,3 +38,7 @@ &rpmhpd {
>          */
>         compatible = "qcom,sa8155p-rpmhpd";
>  };
> +
> +&videocc {
> +       power-domains = <&rpmhpd SA8155P_CX>;
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index a35c0852b5a1..6573c907d7e2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -14,6 +14,7 @@
>  #include <dt-bindings/clock/qcom,dispcc-sm8150.h>
>  #include <dt-bindings/clock/qcom,gcc-sm8150.h>
>  #include <dt-bindings/clock/qcom,gpucc-sm8150.h>
> +#include <dt-bindings/clock/qcom,videocc-sm8150.h>
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
>  #include <dt-bindings/interconnect/qcom,sm8150.h>
>  #include <dt-bindings/thermal/thermal.h>
> @@ -3715,6 +3716,18 @@ usb_2_dwc3: usb@a800000 {
>                         };
>                 };
>
> +               videocc: clock-controller@ab00000 {
> +                       compatible = "qcom,sm8150-videocc";
> +                       reg = <0 0x0ab00000 0 0x10000>;
> +                       clocks = <&rpmhcc RPMH_CXO_CLK>,
> +                                <&gcc GCC_VIDEO_AHB_CLK>;
> +                       power-domains = <&rpmhpd SM8150_MMCX>;
> +                       required-opps = <&rpmhpd_opp_low_svs>;

Should not be necessary anymore.

> +                       #clock-cells = <1>;
> +                       #reset-cells = <1>;
> +                       #power-domain-cells = <1>;
> +               };
> +
>                 camnoc_virt: interconnect@ac00000 {
>                         compatible = "qcom,sm8150-camnoc-virt";
>                         reg = <0 0x0ac00000 0 0x1000>;
>
> --
> 2.25.1
>
>


-- 
With best wishes
Dmitry
