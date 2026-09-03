Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF2D3EB104
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 11:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433634; cv=none; b=u4EK1/ZveOyE6laG27nMZpjm38ewXUiHqSyQpChYPkTfNP4klT+JowiHoz8If+uEeFF3XY/NsGnWyqIO1FB9QR4QA4WQlQkxdJoJWOBlnGM5NvTtbuOfyg2fyQ0mBQ/qGaqQS7n5wsAIpXRuvQEag7YtsrLXGyjxdTlIOVjhOco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433634; c=relaxed/simple;
	bh=NafIAQ81wpuFc5oV6yH6QTWWdlTU+hZVW0S+P7GkiA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lbxG7kTL2qN29uxNGgpfkeh7GYiiLheCdRsfODm8OYHO3mIrRljC5yJs+u9/nwcGRQZFgE3gFH1mW3I+wr5rzUx+4Pyk58W/+oKvzwpK703apuDieu96teeF2o5YkMBa7d3SA1ysxjOex6xy9CTlFkmSNHVbbX26e+4lqMV+8HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EidnkHMA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UOVRWH3Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EidnkHMA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UOVRWH3Q"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHFt7327177
	for <linux-clk@vger.kernel.org>; Thu, 3 Sep 2026 11:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fIpSBKc7MRCRPHbtt20r1Axt6vCl6+OJnyJy0IXMvxY=; b=EidnkHMAPsdB4QP7
	FkR0lQ64bL/aHq3EYituSzKiEPWAmOhFkgiwYR2MY+6IEx8VYQ1UunvOTFH5IfCn
	Oin+LTAQ3rzTUBqbSWIXgyMLDW0x/zCyCNtntkncfPNy1YFpiJmMcQoudkjz1sNk
	eO21JBxbfgsbgXyKnBYdMz8xcn8xPqmvwOQqkR8S7pO9ygyTRCp6udW+Tq8WaJ7D
	vQd+qwW5sIqaOqsq+YoMWhxrhA1I5X1PasntOLh7zCPxz3eS0HRcE8oFRwk7Xz3Y
	uvaVCLmWKgO2ODYHYz7dUGR3To3qcE3W9UsdvyRfuHDfRhhpeP/e/wsf3sY/Y3qx
	rYi48Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekgwkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 11:07:10 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-789eb1bdd79so86127137.2
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 04:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788433630; x=1789038430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fIpSBKc7MRCRPHbtt20r1Axt6vCl6+OJnyJy0IXMvxY=;
        b=UOVRWH3QXToA0I3msNHOePp9aVE6JSlOL53oBYKrIKCkE4uBJ9buT2W92Vd63ZKFxi
         jbu67OSchRKXOUpXwRM9qc8KyRAgKDthKE3MIhRpQaMz4Z8Fn31mzTh9ZK8dMqwfYZPM
         q/qUuqLMYQfBF/1G3l3lC4I+mIPkG2P0kt9yPpoSENQuBQCnQ/1jWi8GiuwLNB35hxb9
         GAGiRcLR6Pm1sW3KkbZ5nIOpdLnKsiuhTAEVsK4Afhc7bmzZhEU+tG9ujakO+iKgWzsf
         eWyz3JSnOf9RayKlrWzb3kGI8cKM6Kihc3eo3+VxVxcRXdBMgPa1Qr15I1jJo/d4BU95
         i9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788433630; x=1789038430;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fIpSBKc7MRCRPHbtt20r1Axt6vCl6+OJnyJy0IXMvxY=;
        b=X2sqWLTTuao/TG9hAtZRTX1iN6ahlvYy6N6tDOeY7HHj1VT7p59ns6jiJ2vC9vl1/X
         aRbeamBVAbXlLg9ZsPSWi8k8PaHGgivmVuzrHjW17vPvsOTCC5zOoxSK9M6wBnz+8oiu
         M5bFhkarpdrZ73qt0qhbKbVOzqDmmwYCrcqBFUl12SAaXXku9zrVa8bA75aZIhvVINuS
         io14m3M/0G5NNxVwU+5ghUbhWW4E+/tyJX6m5wdMrk6rXEL31irCbyJtZbfrP9/U0aWS
         fiGli5ZGNO0WlJhPXaEcpgcxKCM1Ayj8Dkgww8LJS3hsWjTlirTrIqFbin2m5jy4HasL
         m09w==
X-Forwarded-Encrypted: i=1; AKwUvByekQT0TJQlwg9DvBZaohT/ddx67YygHIkRZU6UJupkYXukhacLpDM0E1/7ofCveuUPg4t4eECBvac=@vger.kernel.org
X-Gm-Message-State: AFuF++kFlXanM+UU02F8Tdkuk7C9sk79IU2+y3EPZL14J7D8N6uOAYQW
	sjozb/4n1Xnt2btYwDIbVvJq8pFtTvDpCtxF6mEe+3tn+2W+lPb7FUH5qbVYf4NRuoDi7+WxxcE
	n/Cin/5LyZ/Rge67yTLxhVkSSD63L0MEQfWSxSvLcY0U3thoiSOXCEJiw55AvPjY=
X-Gm-Gg: AYBFou0J6WWq6Ouep7h3lSPCeLQxoqku+xCHLInKlB0m9YGX//mEGorLF7z5Mo1IWfN
	PzkNthSDWbMyCqwDFwplQOSrQLLsQREV8xvNE0WmS6GcKpU4NzUE3VdZ+OBdWnV+3FeD0h8QN/g
	G0JTo2lS4locSEUgpv8FjZXR9DPJrWeuZPNMViRPnkGMgTqGE+8JcjDhjTw+wVRCYSrpLew5StD
	sgLEcjBaOAvAno51ZWkRU5CLHm5OwTCjA+xkajsJzZKSi03uqZiXyN3caNUewehRgebZkBGKeKF
	ek1HJnTD+ZeWYZ2V6DOK7ySxTjDlUUWFAlOiQ9qtQQDwRMWf659FNVBWL0QRHHDfFrVC863pKE8
	qvJazfpdRdTNr4F/VJa8HDg==
X-Received: by 2002:a05:6102:534e:b0:789:3f43:6458 with SMTP id ada2fe7eead31-78a1f255064mr1639233137.0.1788433630341;
        Thu, 03 Sep 2026 04:07:10 -0700 (PDT)
X-Received: by 2002:a05:6102:534e:b0:789:3f43:6458 with SMTP id ada2fe7eead31-78a1f255064mr1639203137.0.1788433629819;
        Thu, 03 Sep 2026 04:07:09 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f419e965sm83877466b.25.2026.09.03.04.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:07:09 -0700 (PDT)
Message-ID: <04faafd4-037d-40d2-a79d-6d128b194692@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:07:05 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: b0BZQvSmsw0TMR-Xw-RwQtZ-Gjo2vZVK
X-Proofpoint-GUID: b0BZQvSmsw0TMR-Xw-RwQtZ-Gjo2vZVK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfX1iDios7jQwS/
 ONGfO1n9ohbRztPare0ICQSHdjmuWq89x9XSKNfZryWzrItlc2qnasgzM3BFa6xP62fnXGMKjRf
 l/1IFkyyRPDQ3wRTk/HcX9l0ZaSZcP+BU4TglzdELPObWBKzOKYBqfWqC7anqHonah0B9Oivuwi
 vusP9qDUMbO9pp7HSwuMl5f5QZBf8pW/HEEPkqgthfRNrdI5EvA5OkiwxPAWoyyFCsTGGG5ghuR
 d9BoxLLJvUcRZTjgumm/r3kt443ocfU410kZGm3xrRv71lJvFPO9rWSjhWHETkyHgEOezeMKxST
 Gs/VgMmCjrINUXRsA2rqEuhysdDbU+ZipIxa/iHIvSCOXpxab+IqrdUtSFuFE0RCHupf/6TEwSf
 3/fISfU7sNhsaONzNRZlT/YeymudaaOmO6KAxEyt3/ttPT83NTfM+YgBMmhGgI9Hx7k1HDSy/Gi
 z/n5XUMGp4nLYDBw8yw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfXxUXReQgdJpXV
 J22PUWLWT+4kl8S3rIFbmItdv8D5JFYyfwrH0ausxCupxW/QkovzIwxNVgeQN8BTxO4pRgozwzv
 O6iT+8CRnFw5awJoghgPZ1YpC0QRObQ=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a9954df cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=OHs8NuuX1ptjo3lIKY8A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030096

On 8/27/26 7:51 PM, Hardeep Sharma wrote:
> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> 
> Peripherals included in this initial set:
>   - Single Cortex-A7 CPU with PSCI idle states
>   - RPMh RSC with clock controller, power domains, and BCM voter
>   - GCC (Global Clock Controller)
>   - TLMM pin controller (110 GPIOs)
>   - Interconnect (aggre-noc, cnoc-main)
>   - GENI UART console (QUP SE3)
>   - SMEM, hardware spinlocks (TCSR mutex)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

[...]

GPT found the following:

> +		tlmm: pinctrl@f000000 {
> +			compatible = "qcom,kuno-tlmm";
> +			reg = <0x0f000000 0x400000>;
> +			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&tlmm 0 0 110>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;

This needs wakeup-parent = <&pdc>;

Konrad
