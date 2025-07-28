Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5B3274FEE
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 18:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753727399; cv=none; b=do0HAsole9tiDqf4Khobcjh6VnPS51ypKsGDsb/YEOAiQguyBH0uoct5N7nueohZfCB0EqOMANwvzs++uv1GBNH3dr/xvrAJoY1ZauhXi3cIjtqgxSC1iBlJnjmsCyxQ7Fer2GgJXh8KFXZO4Jzo6UqisnRN9ie9LSyI0bSsmZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753727399; c=relaxed/simple;
	bh=m39t4hBEDIOE4JkV53k7vdPJAG4/pTKjuu7PU6u/wj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KLSpSYWIFO2KfX5WByXmpYlDCpohKoJCy6K3mGtOyh8vZP4aiUNsS7xV3q+rTBzdygd5a9yYD/2vR60/xV0JHhR+iHP9crkFVTwQOWoFOkolomD0sg5YEN/Fwy/fOeNLRW0QC/WfcrBjBVS1yTvfUVIiEP9Paycc/+ThMLBiGfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RxRRx4bW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RxRRx4bW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlM7e017659
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 18:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oT3tXcSx8+6IFxvzSzWBOGBoJkG+N20NCBDeHWmRh9g=; b=RxRRx4bW+XfnjtNx
	cXxPfHvYE3kKcnxdM9/MlmG8oFS37+PQ89XZIIdeXMmN9m4UyeGOIbVxbWEfKlvS
	zXbdCe+sxd7uvON5kJ5bGT5M1SfXV6Nh4gzvfEBbKHpLJwV2XUIHDEXCTdCLaTSf
	fdQU5TEs2rlvD0xvSabZilWSFqE5tszYf7KDUH92dHYXOiFYSFylsv26+GVCvruN
	oLRKd4vdPayCzglgYIxJAfQwt4ECUsESUbzoaOoEprCJjLSFPKfcxOx5cBl/kFyp
	LodkABTEXVQz+ErtotXVSkrcRoUxOYsoMI6/Op+BMlhuE7BcbMVIhZ59POVc5JPe
	jH82uw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1adhw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 18:29:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-315af0857f2so4324258a91.0
        for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 11:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753727395; x=1754332195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oT3tXcSx8+6IFxvzSzWBOGBoJkG+N20NCBDeHWmRh9g=;
        b=hhiRb/dCJWOpGSueaRNlva3Jejoo8DS2pgieSbr7fF5I4TwKGSv9aA5hWr249oVo2+
         jTqcWb9kh/ZbO4k/9Hyw2ROusz4cfGYfmS7JyP/BSjiSrRkNwVk6Mq9IroFYld0vZweb
         4LLRIa92KrUkIcmrrZnc4o6Umg8DLqJ41snLX8hFo9ZDx7uSKKwE5AIVHhP1J+Uw50wh
         hYLh6NfK9hGI8BMahv7g8kj3NxuhsyBxwEEZGKfwqaxmjfUP4SJhMB9OSvSVrHHKFCbb
         A4++P0FAMrojATuM01tZoh8CEYvIR8QIboEimBZBavQjXs6QPhCayhBz86KZySxrF28L
         70QA==
X-Forwarded-Encrypted: i=1; AJvYcCU7oYtgDFu5uuhPntliSR7Nz+scpdg6zD/b4eJQUq8cfFIoEAbJtkAQ4hxJ7HTS8HSDqyjzV4Q2ciQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO4KCxu16wOKDH9454ZnB8rurs0tkYcJdeAYjpO05zRbbjYpHs
	B17fDaV1TEtLUVPt3Ee6P5aM8B5Me3ezP9ljebejO+aGnJ7+OwF2oIrMeAlqXC8kYxGv8NwdGFq
	IOhKZHA3j89NefNdGk9aoJE8WT+ktsh4wgnMGBSuEBsHsFUwdPitv5Geyo4yMRF0=
X-Gm-Gg: ASbGncuLU/sRNIMBRvQG7P60y+cfDeF/ppmBiVQBCbJ/aGiWN0ErJ0vwjyv2POsBZO+
	qjkwK/R1tGmD393kXrAakXKyVZBBQwT1cd+3zfZ7Re4jKq12gMk29TR03Jbh8QO6H6oshsZJpnk
	G/VgeMWsuMH51Azdc8mI5amWDz6prvgYrrYwSWYIgEg1gwckLRCcVwBr+43i8FE8oib/F0oZ1sI
	GNLnmmgItkXjWvQGu8wEHXz1JgoxUv6IPoQWqt0reqElA4JGbTqrTlVMEd1qlp0PtetcRwrJau7
	o8KY+HV/UFdj0tRC6xvuMP2qGkMX/xvnKAzgiUVp6immvTdhay6T7PxvNeXpjUvCiVnlMVf+Inh
	KB04JhejP9DJnOKrNCQK+dQ==
X-Received: by 2002:a17:902:f30b:b0:23f:f983:5ca1 with SMTP id d9443c01a7336-23ff9835e51mr72280485ad.12.1753727395425;
        Mon, 28 Jul 2025 11:29:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAAEQKwWNVIHaeiLUK+6MPkWiAUDHenXFMWUMIoSJAH/g0px54Std4EA5mF2F39xEpbfaLQQ==
X-Received: by 2002:a17:902:f30b:b0:23f:f983:5ca1 with SMTP id d9443c01a7336-23ff9835e51mr72280055ad.12.1753727394829;
        Mon, 28 Jul 2025 11:29:54 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fc5a9d219sm55658715ad.98.2025.07.28.11.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 11:29:52 -0700 (PDT)
Message-ID: <8399dc75-6363-4ae1-98cc-59b5b62dc8b5@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 11:29:31 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: display/msm: dp-controller: allow eDP for
 X1E8 and SA8775P
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Danila Tikhonov
 <danila@jiaxyga.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250719091445.3126775-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250719091445.3126775-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eLx3OtCS083WUeJJ0Rf-k_N-arAO5c1o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDEzNSBTYWx0ZWRfX4gCBFxhPF1QU
 OOlBLO1+B1FilCKm+x1skAfvWLTIZJA7V1N/QWwGJidnrzbf+pugMjCCVChum9LyIozy/9dot1M
 ZN4pBeMyOSiMyS9lCcOpCGfokWByw56pAq3OCzhKKuha0YurpwH+v4GpXd84lCiNM4TSJkztaXB
 x2pbjs7gyxehSn9sCDZ/RKipmtptq3Kuv1nOsG9fY7FU1iFuyw+lgWSDol3NM3bVuD/nEkzH2KB
 MZQKbD7/vkvmXAs1p8DLsKW5OsIw6V5g6RAOzuHAbc252uSOvYEIuG0lfd6sqE2GecURwimUvyf
 UeQSc+9TeFt/bafF30taJdbtrfXEjMgY3QS+NTo1S2ab6tpWn5dxgyTAKn3vCCyUyWiKCia999X
 BxOk3OmBb94wJ1kTcneGtaAVfd79Rob9ytBlmWcudIORFhTEjAQjCEOgJtUui6f8D67we690
X-Proofpoint-GUID: eLx3OtCS083WUeJJ0Rf-k_N-arAO5c1o
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=6887c1a4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=wmqSsp3ovfGiw9AtJwoA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280135



On 7/19/2025 2:14 AM, Dmitry Baryshkov wrote:
> 
> On Qualcomm SA8775P and X1E80100 the DP controller might be driving
> either a DisplayPort or a eDP sink (depending on the PHY that is tied to
> the controller). Reflect that in the schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> 
> Jessica, your X1E8 patch also triggers warnings for several X1E8-based
> laptops. Please include this patch into the series (either separately
> or, better, by squashing into your first patch).

Hey Dmitry,

Thanks for providing this patch -- I'll squash this with patch 1 and add 
your signed-off-by w/note.

Thanks,

Jessica Zhang

> 
> ---
>   .../bindings/display/msm/dp-controller.yaml   | 26 ++++++++++++++-----
>   1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 4676aa8db2f4..55e37ec74591 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -176,12 +176,26 @@ allOf:
>         properties:
>           "#sound-dai-cells": false
>       else:
> -      properties:
> -        aux-bus: false
> -        reg:
> -          minItems: 5
> -      required:
> -        - "#sound-dai-cells"
> +      if:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - qcom,sa8775p-dp
> +                - qcom,x1e80100-dp
> +      then:
> +        oneOf:
> +          - required:
> +              - aux-bus
> +          - required:
> +              - "#sound-dai-cells"
> +      else:
> +        properties:
> +          aux-bus: false
> +          reg:
> +            minItems: 5
> +        required:
> +          - "#sound-dai-cells"
>   
>   additionalProperties: false
>   

