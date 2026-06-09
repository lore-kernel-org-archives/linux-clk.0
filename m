Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9953C942C
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 06:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780984842; cv=none; b=HZs26zYSH6HVgVFx6Wt1khM642744G22OKr9c9vFk6/fXIxyuytw2Dg1XNKIJqL82urDBucjFJsEhZNuAUWBoA/Pn4o60DluUJiCufch3k4NVBUMvx2ATjAQqGIWrFyt7aFkzZQkAzq3IN4BVMJXiDyyTTK27wKpi5uRfUlUz0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780984842; c=relaxed/simple;
	bh=XCFNabTCGm6+aNwyq3Zcm8Kst3gcwPvZSnxtnxvQNXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cJ/OI8L54dNE1NzGB/HzUOpCH7B6NGfVflYnVBVXiyMHr6BET4TEjhYi/xc14akjC8yr9AzI9OIQQ50lpA+rsUNtZLZnDT/5vfiSIjRB6p0VaPUL4rCsqW0ZgrOBtGjSINOcoV+DJ5M2c8aY7KJ+M/zceMwVUMH9d9F39LPmn6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FFgkSY37; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FrVJrGi0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FFgkSY37";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FrVJrGi0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wron1400138
	for <linux-clk@vger.kernel.org>; Tue, 9 Jun 2026 06:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBhl3HDQ4JqBELbVnf8aJYjqulp5nH2X2j4Fgm26b8U=; b=FFgkSY375OwDfE1J
	239NMY4mRzvvsDK3bk9JhCC5S9vJyLJDJY24NWDN9VRUXRMfYoY1mknbA4gu7e6u
	s/P2LIdkrL6ofyKGIOfcJ6h4Hrn8rECC85kjAklSca8Pur+H7G//XLk0zc0K8WmO
	SXXrR53MtOXnakOZC24ptUtjGhiFJ7yC6fnFZsQykOIQJlFaioqvWZyvDlCVJh1O
	HydCipFy8lkJ7GNSifxf25ktnZdS2dIDkkgWzJsdKuhdrUcNZIf1hozyJ0mMjRJ3
	MvqBku46CCK7Qc8AGkHzrjXeTWHMzIGZotiSf1k4f9iBaRr7ZOol6nyPNsr8/Dq5
	SE9fsA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enx2rv06w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 06:00:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d99181eaaso7056226a91.3
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 23:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780984839; x=1781589639; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KBhl3HDQ4JqBELbVnf8aJYjqulp5nH2X2j4Fgm26b8U=;
        b=FrVJrGi0Y3yekaHSoBwQSnLULgU5uFGzKNZsLBn/vF3M2l9V78/gQ8ZnKT4xvkfDnx
         ymaTPjmJv2GV3N8ZlJ+5XqEw5z0LUDUqNxO8vAvCifowSG9tg6rnjbMqnY2hlQZ7gd1J
         hh/yRjwCSm0zLBqHUoTkq60XNAFwo6z0LiFrbFv2lE2lNEYr13pN5EKYlIXR4jUlInms
         mlM7M+GiE030HrBbA71nTiwxTaIcohngYiKlkR60VlOeG2FJtRNYu0ykkT69Tb0QzxI0
         mRWC4xWQW3EiZhe2UrE7g+7FBIEfp+TlmZGowcXv05Pur+i+ne6LznrP6fsWoUWGI1mE
         Eczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780984839; x=1781589639;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBhl3HDQ4JqBELbVnf8aJYjqulp5nH2X2j4Fgm26b8U=;
        b=O+nmE6wdLWwMYSj00JX/Kwv6HIQDRk7BzVzZPxXNPWgfYviZk1H5UQaJswEnAyHFfu
         MwraHlETMFj2/sdBhYPcDPBATYx+UluhIbdTePxz+WOSMnR4aZ9be7ssXk6rXkt3E6Ni
         i/zmUa2xcfWADb3fA27Jk/aHLhGauqQEOM+5U+z8Tso5tAk7sTkWDVN2+l69n2XssynC
         6JJ+/5SgbDyWZE7+N7HTi78cnpL4U7G+/qp/dzqitnntlDrQgWbTI2oF3yCMb8yZxnWZ
         M7s6GTZMGcTmPhwRSX7yrq+QNXJ6drrqQZ81rbhyHPW5O+1kJTuSQAmR/4ilCZOg217G
         Xi2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+d/ijfSkBMwXlgRZXs231prKI7py0qyNXePxt16GgmdA+/fP+F5uCzhszhLIa1nbwMl0XL2sOS8/c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZhn87RV1JChCtDHL7+jg8hCvERLg2fN7yebu4wbeaAzsCsv7p
	PmhhMNcbcvTr6lhOXnTqFYLNZ3kOBoSXsTRhepzH7r4Ne8cKBgKyq520jhyh3inrlfbEn6QGOeL
	AY3FJoAD3xqbyd2ENus1uh31oGHRrWYBkLJHaSoE5S7+pE09syEKOW77J6+j8rVQ=
X-Gm-Gg: Acq92OE4L6LnDFoYfuU+BFjvZG+LSqgaWl/S9hYfYCGRm8UnvpA9X4OaoJ+3xCi5K5R
	msvkooKdU4k1PfmbWg0eJGGP778rX9jPyO3KH8xaaKpFz69eQ4xWMdSjDdFkfb4UZNSZUALKE/a
	rv+shH/ck48JHquNSEnCgcUaiu+pDpYlQoRuUT/dw+IYBIui+4b5uPaLgeGnLoWFS4jo5+py+eR
	h5v/6QoZCwsvgaotfTQnW2FP5wtwYimYrkjSywbijh/6EB83ftFDJJxK4v/ukOg/NXSN72hRLtZ
	B4urFBiXPTIru3/gb72nxADetfP5IMfGraAmzJjA3X+C+ZAyYo3DbEAcs7X2dn0KhJMUJJZCZYM
	ndNq8k+5X608uvq135AnwI7A39ootxNAX6tROOjADRv63qRDv6FqTWEfdd7BTRGje
X-Received: by 2002:a17:90b:6c3:b0:36d:b9c5:e8f6 with SMTP id 98e67ed59e1d1-370f0481909mr21011692a91.19.1780984838788;
        Mon, 08 Jun 2026 23:00:38 -0700 (PDT)
X-Received: by 2002:a17:90b:6c3:b0:36d:b9c5:e8f6 with SMTP id 98e67ed59e1d1-370f0481909mr21011660a91.19.1780984838305;
        Mon, 08 Jun 2026 23:00:38 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f710ee4f3sm18653141a91.13.2026.06.08.23.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 23:00:37 -0700 (PDT)
Message-ID: <400ff1d9-1d58-880c-8004-271bd7023831@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:30:27 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sm8250: sort out Iris power
 domains
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
 <20260604-iris-venus-fix-sm8250-v7-1-7bd2f0e5bae8@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260604-iris-venus-fix-sm8250-v7-1-7bd2f0e5bae8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: G1qx_aA0ENsj3bqzQSgykVy4WZYcNhtw
X-Proofpoint-ORIG-GUID: G1qx_aA0ENsj3bqzQSgykVy4WZYcNhtw
X-Authority-Analysis: v=2.4 cv=JdqMa0KV c=1 sm=1 tr=0 ts=6a27ac08 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tk4UjENVHhTGfG5vr0AA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA1MyBTYWx0ZWRfX77mPaCrpRRRO
 G7lvTPYHWJLtJI3iypd8MvDt4wbVOib22n659OnXrTFzsKjNnOtUnwPvdivq3SEoq+bCj+68ztm
 CMoDkW6EyxLCfLSLh+dL0rQ3137aJVE/btCr+/c+GQiZbZoPyMuuURczP6OEK9v1hLJxaMST9Ar
 SFoFgQOgHITx64aNlroGIlnyCTLOEXXEaAW3fIN1+Hp7bmdSwPLdzvZK2a/4fBunSHmqDv/3T2F
 pGY/Hx80U1HPJ1bLXSn4y77JSMdwfkd7wcftoL0SmxRBHCxwJHOfIMSKHN0Qx65ToDfbzsLgTRr
 HA2kRLPeTGUMLi7+nXetdbMypEIPSM2U67D+0spBkWyyVcsaaEkYO1L9OkvUm5VGoguNVrA/+Mf
 Jls6HWxd78qGXz3QWEYELhjCao88FV20m22+xmat6Ms+gwtgoyWhPOcP9Fc4x4X/otVeNris/RC
 cQKNaL9fbIWYFmr+oDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090053


On 6/4/2026 9:52 PM, Dmitry Baryshkov wrote:
> On SM8250 Iris core requires two power rails to function, MX (for PLLs)
> and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
> qcom: sm8250: Add venus DT node") added only MX power rail, but omitted
> MMCX voltage levels.
>
> Add MMCX domain to the Iris device node.
>
> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 7076720413ab..6150380795b8 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4326,8 +4326,12 @@ venus: video-codec@aa00000 {
>  			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>  			power-domains = <&videocc MVS0C_GDSC>,
>  					<&videocc MVS0_GDSC>,
> -					<&rpmhpd RPMHPD_MX>;
> -			power-domain-names = "venus", "vcodec0", "mx";
> +					<&rpmhpd RPMHPD_MX>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			power-domain-names = "venus",
> +					     "vcodec0",
> +					     "mx",
> +					     "mmcx";

With this change in place, the backwards compatibility for the incomplete
SM8250 ABI which was merged from v5 in this series, which handles the return
value of devm_pm_domain_attach_list(), will never be hit right? If so, we can
remove that piece of code from the driver.

https://lore.kernel.org/all/20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com/

>  			operating-points-v2 = <&venus_opp_table>;
>  
>  			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> @@ -4353,22 +4357,26 @@ venus_opp_table: opp-table {
>  
>  				opp-720000000 {
>  					opp-hz = /bits/ 64 <720000000>;
> -					required-opps = <&rpmhpd_opp_low_svs>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_low_svs>;
>  				};
>  
>  				opp-1014000000 {
>  					opp-hz = /bits/ 64 <1014000000>;
> -					required-opps = <&rpmhpd_opp_svs>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_svs>;
>  				};
>  
>  				opp-1098000000 {
>  					opp-hz = /bits/ 64 <1098000000>;
> -					required-opps = <&rpmhpd_opp_svs_l1>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
>  				};
>  
>  				opp-1332000000 {
>  					opp-hz = /bits/ 64 <1332000000>;
> -					required-opps = <&rpmhpd_opp_nom>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_nom>;
>  				};
>  			};
>  		};
>
