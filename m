Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C223CAE76
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 05:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780984036; cv=none; b=D6zLWtHvydeGe4XJQHpJNI2g7yuzj5hL12JOjQmCfmW9F88ugbhnlUGMZoob6ckQjciMpD+vYzFI1yGRrHN1FcW9HQ7RdlM3t2oc8w7oVacAaNN0rqMRf468nEMN0yydZCUYIaTP+es3oUd9cNLDVq0tlvGiq+aMSYBg2KGWt1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780984036; c=relaxed/simple;
	bh=so1zBd3nO45nJIzTPGgrERW8Lcd2s/vTZUV+2uG8ilI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T1cA3jA4XAfQO1H6L4JfmL6jw905bKq7Z6nOQ5p0JD0kNzmT30CKWNNLDarEGJxHodHX8ztaN7Da7zzwsPlNLMUnTf56QtBPIdG1nHoU7s00HrvFOOGAk84uofS78C2N5xKVeaud/5OJVBd66jAZ5QdG1bMhSRQBs2evPLfCFRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5VhKDm8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOisqx0z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5VhKDm8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MOisqx0z"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wt5u1061931
	for <linux-clk@vger.kernel.org>; Tue, 9 Jun 2026 05:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ngbOWDMjIN8EWkgDlORz4DJk7K8eQHzIas+4rhC1DVU=; b=B5VhKDm87MQusmw9
	aryygQpzC5UfGLdTFQP3AXlVg1nPZ70WRUQuR/xLLxw5/XXUVeWyj9YdVVgN2c3S
	hkAhV1TYrYpyqJ94WIr3k+xcOl0Pa56Ta1CYXrQM5477hX25T54VhOyrcMSKs6+p
	IdaJY9wOKB2meZVgwCUFoRuBFDqrpFJzeGll+wA+Lq1vUbFvzHFTeXRj5UEcm45e
	8fIyEUNf/cg2XfOnNUGP5XRBJ6jd+zMlX1/vJsg9nuUHMgzPsdS5VhTLK+OYGrp9
	NlrEZn97usI6cdIctjyAjeS+i+Ki3YgU2imXk1PWbVgOAoDvalbVwma/KpsIOOUp
	JhrBqg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4envajcbrm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 05:47:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c20f7581so55254655ad.0
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 22:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780984034; x=1781588834; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ngbOWDMjIN8EWkgDlORz4DJk7K8eQHzIas+4rhC1DVU=;
        b=MOisqx0zbgzYFbfiwn8kiCqQZFkFR6vgc1+sbmFgVZwdGuynQ6AAAhlDDYJ0zSHWj5
         EPZSCsMqmpk3PQIwonjfY9R8c11xWfwsvQa3rDTBBnYu44oaIFPp/x+JX8lZYYh1wWs8
         VoXqbJJOh8aZiNpepk/dSv5Xy1Gb+MNumPrFBlbIMOwX2XjwIRNxZVa176zsT7wOwznV
         4r0twWf9d4UgQYE7Fr5TxxaYARWSvg1HH9QpW8yHuvx6kw7aHluRK6C+my18OyVZTFED
         ZPbQAKuhsuuXcce5TaJ8D0poW3cHTV70TZ9Qe/DxWckOh8jZ7UUUQmN949UB09I98wg5
         2Dzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780984034; x=1781588834;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ngbOWDMjIN8EWkgDlORz4DJk7K8eQHzIas+4rhC1DVU=;
        b=PFgw+HVPz2WSG3OOPrd7nxSi0HaKkUSSJqCASYjJ3LgM2fFz+haUeeJESrjVNCoVZj
         wnNtMtyEr4op9EoytmLf7bDWhfutP67z0HdgSf7Uc7Tc6dqYhrIjmJa2QU28BRjuA7PZ
         LUoXC5BUyifgewakbTRbQ+hIPvwWvRYBbIPonpN1i7QhS9XJoN2DLhQDWI05LYuNQK31
         PjX9V9yzLWY9RMesR7YY4+K5XUKWf6c5AIhK8bYLjhsFs15DoGlTQStxU4jwYpqmquYi
         FpCniPJ4nug5qEv+YSzTrtxa9hav3GAv64UYr1kFRjhTvksALdugUsBLNvVWpcDMe/kj
         HZOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/hJVG5lY+BhSBXe1A80JptQapn7+30qa4j2qWj3Hbd69OeJA8zu8AY0k0Do6og35649p9vQgLqzb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLplikvvh+mDNtlDCL7EL7vf7zXN8UVdpS0gKjJhKHdtyh7BvN
	JUSBRKcKkvMnqeTcSj6uRjsAUGeAIJwR024jz54g67sFMi1ilvmA1LDltZd9Ob0myXRtOyzYYIr
	SV3AJhzvirq1UeuBn/QqtfS9+Rv8LHzIOo4gPzmeQ95A8ShXUfYKUGTnO6QW/ebo=
X-Gm-Gg: Acq92OFMMmM0vWdGEtLsiNhTfNgwo/j7hWMQ/v96vF5EqI/26mmObiA+vKfw8gSE8zw
	oXpv51LY1B7qY5VT6T4w+yM0r2jxCbbs5Kg1rqbDSFIqGVUhIkl3KakeFWdluHmq4P/mE9WBkWV
	J7ugUegRGSAb5/xMSCkkJ2SSjc10KNx7tmDfJyglPRiusIRrG+Coz0bdXCsIWNEKZEF/kD92Ahj
	ruCUosLxMBTNLPH7HFPFtRRaxxZvIz/YY+jT15BAMYSGmJIWN7nmNfHC1VSMwTy4gwZxTKh7asP
	xqPLztxgl6vGOnZNYtlNiNcpvd4bBG5ChUZrFzh2/cH3RC/+IuG9PtTm4Wj59He+mDhG1QTm7fW
	PNYiYlZ5znIyOYaW6ehhWZSkcyoL5orNEa4uQLrKziHPep+1dB17WaWEdphIfvIx4
X-Received: by 2002:a17:902:e848:b0:2c0:b6c7:2273 with SMTP id d9443c01a7336-2c1e79e29ebmr222076605ad.3.1780984033347;
        Mon, 08 Jun 2026 22:47:13 -0700 (PDT)
X-Received: by 2002:a17:902:e848:b0:2c0:b6c7:2273 with SMTP id d9443c01a7336-2c1e79e29ebmr222076015ad.3.1780984032810;
        Mon, 08 Jun 2026 22:47:12 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664950aesm192056405ad.69.2026.06.08.22.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 22:47:12 -0700 (PDT)
Message-ID: <44671f38-88d0-55f1-0a54-3997f37c5a60@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:17:01 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: sm8250: correct frequencies in
 the Iris OPP table
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
 <20260604-iris-venus-fix-sm8250-v7-2-7bd2f0e5bae8@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260604-iris-venus-fix-sm8250-v7-2-7bd2f0e5bae8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Tcr4wdUkSavRWX56sPfrvGIFE4xpSMtg
X-Authority-Analysis: v=2.4 cv=eo3vCIpX c=1 sm=1 tr=0 ts=6a27a8e2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=2OYgVc-5B2WHko4x-TYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Tcr4wdUkSavRWX56sPfrvGIFE4xpSMtg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA1MSBTYWx0ZWRfX0BAsF3DMdUpK
 bgmg7D4LiTGPhK3c9SU7CVO7qeT+Pciwb2dxwawpXhFev/MCfuuF9LC3/LUss5TfDqaiJjDE6l2
 5Ip8gsCibTiC1wMk1d7YJk/0ef6C9gy4YuSQeHt4e70jGzX0x1dQpPlIVWEsNzcTA+DLx+EMSTw
 voAZaU4Nh/F5JPDqYpIx6A1sCfsZh3OR+0ESI5UfwCtdIJyByBfhIrq0OviiIc+Onhcr4aYHuwL
 XAFsFAcqVWODyZZcrKlTwjyOnuII4U3y3BQ4b24JQt4jgFGblOngv1hXySQZlI2dXwSjsPFYIJq
 4ovbqYVirXpyvsOiMl1FNzNWc9PbsZwdbG12f8hmTr02wULDxAum+Z3ehyuSgCLV+xV1Wyq5IXf
 WwmFcxUcv+4EliZdnSQIxlAIdx3+mH4fXtHwLA7sJE5YzWrPxVq49yjKayHjPC/C0pFXeI2iQcB
 lttBC4repmfXv/lxI0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090051


On 6/4/2026 9:52 PM, Dmitry Baryshkov wrote:
> The OPP table for the Iris core is wrong, it copies the VDD table from
> the downstream kernel, but that table is written for the
> video_cc_mvs0_clk_src, while the upstream uses video_cc_mvs0_clk for OPP
> rate setting (which is clk_src divided by 3). Specify correct
> frequencies in the OPP table.
>
> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 6150380795b8..f6044bfaef87 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4355,26 +4355,26 @@ venus: video-codec@aa00000 {
>  			venus_opp_table: opp-table {
>  				compatible = "operating-points-v2";
>  
> -				opp-720000000 {
> -					opp-hz = /bits/ 64 <720000000>;
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000>;
>  					required-opps = <&rpmhpd_opp_svs>,
>  							<&rpmhpd_opp_low_svs>;
>  				};
>  
> -				opp-1014000000 {
> -					opp-hz = /bits/ 64 <1014000000>;
> +				opp-338000000 {
> +					opp-hz = /bits/ 64 <338000000>;
>  					required-opps = <&rpmhpd_opp_svs>,
>  							<&rpmhpd_opp_svs>;
>  				};
>  
> -				opp-1098000000 {
> -					opp-hz = /bits/ 64 <1098000000>;
> +				opp-366000000 {
> +					opp-hz = /bits/ 64 <366000000>;
>  					required-opps = <&rpmhpd_opp_svs_l1>,
>  							<&rpmhpd_opp_svs_l1>;
>  				};
>  
> -				opp-1332000000 {
> -					opp-hz = /bits/ 64 <1332000000>;
> +				opp-444000000 {
> +					opp-hz = /bits/ 64 <444000000>;
>  					required-opps = <&rpmhpd_opp_svs_l1>,
>  							<&rpmhpd_opp_nom>;
>  				};

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

