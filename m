Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C7D3559CB
	for <linux-clk@vger.kernel.org>; Thu,  5 Feb 2026 06:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770274735; cv=none; b=eByc3YqskPwurBBffO0pd5ZEmu1f8gOvHQqtolGj4rz+M+Ec9hnUbKaY6VeHB0+akqH7KDPM05wxwF45KgXpK5u4q65dpSKMcU0uj9p1SJ9STKMAESRnuGnU2y8czRtYhZ9jI5ATHBNpPcNEIdpc0t/RYArR6Daf1/t6ek03zbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770274735; c=relaxed/simple;
	bh=OsQd4OJxQCGkeIltL4axA1jAp30tN349xP7T+sKbOro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y8HfUU+/YYyKgkPnN7eQBdS74CUMC7Ll6S0l40hurL9l37xgk9sNOm4S/AmwnRgvKMxFBALlKqC+4zzrPUNe5sAa7vq/A171PQWTrSE7JtxNVWAmhGuh7Q/t00Oo02eU8MG7Y2imbnjF/dxYw0hguJww11ICWsvTW1d2867EGvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBigeP3z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwapX/mO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBigeP3z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZwapX/mO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153e1p03246047
	for <linux-clk@vger.kernel.org>; Thu, 5 Feb 2026 06:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9OILCwQRqxb5lWB8oBCRCwBrY3BXjDnIuW6UlVeYlWE=; b=TBigeP3zNnx5XnAO
	K1k5XLjiMGNq9AWavQPALj4WrwRru2JuiGbv3mP3YVsiDKkCZnUoCwhrlSa3Kq+z
	/EFl4ftsE76iVVAZiLwpXcn+qzbLuhQBbgJgvatbAYlRsx14Jvv0NYBQvcOQE9aZ
	PUiSWJJ5XCukz5mik8RpPqcL14b2kiN1kldPgOWH0wBskA8k0X0Bq1t4i6MTeDrY
	L4cjT1coVUbiq8Ijlj9e2gJPoDMyupM/LarMwLgjzLVCDJHou2TufjGeyluEi8xU
	42d8hEHJ0ZcH0Tj9EpM+Q5o2qhTZ6cUk3tOCsto2giz6ApE/7OhZDdMGntj8nIUL
	27nS0g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4cp51jfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 05 Feb 2026 06:58:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81d9b88caf2so682450b3a.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Feb 2026 22:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770274734; x=1770879534; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9OILCwQRqxb5lWB8oBCRCwBrY3BXjDnIuW6UlVeYlWE=;
        b=ZwapX/mOirU5dGAMAz/IUyTvWV6EX0qxNdac/oRxn04toofatPHqvj/eXUBS3XK0PH
         L61jDd4AEqVu5tufsbFa6EsRMTL5genGm05SaT5FOnQBDDOVP8VgFN1qyzSOAvwQfMUv
         /ByeWOxBPF3TP1M6y2EpIlMg9Sfsf29fWKgtX3HG9ETJBwz7gVRkV7swpUz8IAGuRyuF
         +nG9nPVCJeBT5FrM5eADEm8O+ZkvWAM1e2Fxe3oh1gZ6LzLQzd/5T0NIdxvrVwNEyu7m
         EQqPVAmRBitL1dwbbaErVTpVd1JkmGappDpDhWi5J3ohALwnvOBwra4/rFaEH4TSPJNp
         eHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770274734; x=1770879534;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9OILCwQRqxb5lWB8oBCRCwBrY3BXjDnIuW6UlVeYlWE=;
        b=bI4vLtL5rgqupq5YqMuSN5KmHRRTpIPlkD7mR8H3hvtblIhHH4HNVCZAxxepFKSLsD
         7dLw0Vgv/vEqR1PL/3xW95C/1eb0rguVtTiDQNFzWunbTzB7Ji1iDGth9HDbTObiAfn5
         CWffW8NycTY+80IKeNA4GWnF4ktyH6/RzJQ+jaYS/bd1C3+pDVWAYX6YlcoB8AxYsk5Z
         9A12vW+ubrM5ZC2MeSoKwuuxaN3R6h1RBRCTsErU8QFBo/CRmIRwBiph4cn/+fOW6m4L
         9yVCJKhjP49viDLrKzBrcgBnmg+7eD1cvBYnY0tnndI8CXe3sPYdTko/JQ3sPgNzquxO
         Cn8A==
X-Forwarded-Encrypted: i=1; AJvYcCUV3YP9iiIXkXDjDc+5TZDDT7UGXaS8ron4+8BYeAZp7VBxzH8ikmsEmTP68cTHd/X+9iPvp/8dtuY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXW9Q7hv7BvbrlD16XY4aRJ1VfFfw1nrq5gR9MNIB1RVSX6zDy
	hLw4X7KNkNMXHQrz9+uZjTsJs0rKLud838e4T8gmcDmFIlZUnpgTwSqG1q/+Fed8L5V1zz5wM5I
	8gnmTxfxRAdu6avxHAzQP6KjFrqDa9iRJywPH/pVjZJWc58pNGz7nhrLpfhreXrA=
X-Gm-Gg: AZuq6aKCplxzOJMP7C96vTUTZl6z8kYez2GQ+xogJLWR6w3kbrJhmAr5KFzm5Sj5/2o
	bVvAdpy0otxR3ZEizdOw6tFM8qGDA225ZD1tbwfEZV/Qgqb0Y8Eo6kbH0yC7U2yufYKeAg6DtoP
	0fHZ6DimdBD+qhLKUi/N8YXd2eVciweSJpMqiw4mUZcpd5ny9fte80GxwWTaVHGqBcEo1uuqlP0
	XM22yGQTPiZzxjf96OULUKz6DGpsLxBjglFUOneE05m7v5jILFplyASxR/IeNM/sDGcIJ5NyHbc
	DxfFZvtBKuTDvuBjWZWJzkqj8c26SCPkOYCENrvA5+pGghV0qkhApTksX+xAnNuaDiAvUFKKN34
	GfhkdHwmibJ3Qqg5lsp/DHDDr8KQ1Vuu/KZGdGUIaTC4SPQ==
X-Received: by 2002:a05:6a00:2d27:b0:821:8ea4:480e with SMTP id d2e1a72fcca58-8241c19cff1mr5281564b3a.10.1770274734033;
        Wed, 04 Feb 2026 22:58:54 -0800 (PST)
X-Received: by 2002:a05:6a00:2d27:b0:821:8ea4:480e with SMTP id d2e1a72fcca58-8241c19cff1mr5281523b3a.10.1770274733498;
        Wed, 04 Feb 2026 22:58:53 -0800 (PST)
Received: from [10.204.101.146] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d163865sm5163450b3a.9.2026.02.04.22.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 22:58:52 -0800 (PST)
Message-ID: <3209b0f8-618b-8de1-95f3-e1bc533ba933@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 12:28:42 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 6/7] arm64: dts: qcom: sm8250: sort out Iris power
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
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
 <20260204-iris-venus-fix-sm8250-v3-6-70fa68e57f96@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260204-iris-venus-fix-sm8250-v3-6-70fa68e57f96@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Oc2VzxTY c=1 sm=1 tr=0 ts=69843fae cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KaDJ12nNnFZpivlZOL4A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: NF83GZ2EpH4aYMxy69kUkw5tmVANpw-T
X-Proofpoint-GUID: NF83GZ2EpH4aYMxy69kUkw5tmVANpw-T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA0OCBTYWx0ZWRfX480ec1CuZ3CD
 gGNCs7ieh6mhxgU/sxfq508z24ru9I4VUbPv58YwO0f8xeL3hwFZmagQsRhvcQb3joziHO6j22H
 vZXVnp7Auh3Ni06tb4h3ghCT/l0dpmzK0r/n2SCHXxb6iaII05v0I9Ny4oT3ZBtoC/ww1AHb/p+
 Kpi54RuJ8gcfOiyH38mN8K3rAVjpjTOala5P2Opq5nlWvuKzVI4fuKHhFKB6awG6LcAttNECUVB
 ppm3524JiVjFRbSRYH5oHHalZnjHz7dYVQxFptJkUvcmJZAFHAmc/bIRFNlgqxBoyoKnZNxu+km
 4tUPUB3izrQ6w6nc6L7bds1+yvZUedJZMkNESQD8Rv2reZIpO6TslRVe5r4vbzLc6WhG7IWpC1j
 GZ9cLpt+YVrVszYV9xYMtazAMuG/Oqq/m2NlnowUPtYvrWj6ru6Rp/m2x/xNiiDMBEVRvMWjRoM
 mBWZJfK3xqO/5muBlAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050048



On 2/4/2026 6:29 AM, Dmitry Baryshkov wrote:
> On SM8250 Iris core requires two power rails to function, MX (for PLLs)
> and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
> qcom: sm8250: Add venus DT node") added only MX power rail, but,
> strangely enough, using MMCX voltage levels.
> 
> Add MMCX domain together with the (more correct) MX OPP levels.
> 
> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 980d6e894b9d..d8be5c1add1b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4321,8 +4321,12 @@ venus: video-codec@aa00000 {
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
>  			operating-points-v2 = <&venus_opp_table>;
>  
>  			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> @@ -4348,22 +4352,26 @@ venus_opp_table: opp-table {
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

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita
