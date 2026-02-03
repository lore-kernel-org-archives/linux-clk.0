Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90157395D8C
	for <linux-clk@vger.kernel.org>; Tue,  3 Feb 2026 09:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770109650; cv=none; b=FZHP/Xy+ll4rlrUeO1VdRobfTKcc/c9xe+R1zGQZHRuIkAp39qxXeZH2BuTvI5FvQDmfBa2BhIXcSxVXcAZ63UDgaT/jxdm04JB9WaJdtSTH+evDe2w2o14nv1frbDBu2u2lf7NMAsViicm1VjXQWwfg2o41VXXuGiEpYUd5+bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770109650; c=relaxed/simple;
	bh=r7zBYTBwI/33M4f7vzrEMy0LPJOX7EFtuoJ8V6TwbTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sksOgLbLEGFR12OLnqs0qF4C+nPqaUDvu7D3QCahDyCmAN5BZO/2rpkOo05ayzTnXdWQ9LyPjfW0g4Cf6wdPWkNGSoA+obb3qeoZS7Jjlsn3AcVETI0NhWIUWq7OQ4QdhhN2NeMZWskC1QqqTMQcxjdzn/E4NzHADMOl/8tcMV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nN4n160/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BRyIGOJx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nN4n160/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BRyIGOJx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6133HMnn931274
	for <linux-clk@vger.kernel.org>; Tue, 3 Feb 2026 09:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dowN0l8PG5L77f+jBzl88Eb1rukCALYcJhjeDvDYXuA=; b=nN4n160/dKBL0mzT
	LZOmEfDBC9mI5s+KCqHbYy7k9Ud8OGnovFfAeQVQuoofwILVToCBFkb6Bw1kcnpG
	mLwNq0bbvtTs1hEjRd84gmWsj0wzOKOTzW+qT23b5+1cBYlxW+zk8M/7xKC2SNDt
	1naPjJFy2R/6cyHe9/JzmciMLdH/3ktuRmOBqRhvZUHXDg4oIr/Xe+E1tmZphRnn
	bLRN1ssjO4LJR5LPkX7rf8PTH9+CPwULLU1bvyMC9lN/bU7WNEfv252eJlEX8IFp
	tmSE2iXvAGa0oQnXup9Mnd8ZP6zPH07u9BOkXXIBwkajlFQC8Ka1uJ2mug3xZv4/
	9p3MOQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c38yu0yy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 09:07:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34cc88eca7eso5556448a91.2
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 01:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770109648; x=1770714448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dowN0l8PG5L77f+jBzl88Eb1rukCALYcJhjeDvDYXuA=;
        b=BRyIGOJxODAr1Qds28i2KJ8BNZVL3s57bGDf1AEkcloQxweMcTYWgNL0/gnpUt2pYj
         5uP7Vkf4Q/Nl+QGuVniUx3GPtvvyaEzguYNR1hNu0moUA48D0tnL1QN+sE7eeFc3iDJ1
         MpdYshADh7rtRlTGRe75nQpmGCkGKBxJ/Nn3hxsYchNpoVA5IlMnXeMXOUE5yAzjZkrZ
         0DM2hDzmr5EB0QquvKJI2sxYO5JDudqPMhiT2vzaaHFrO2jagPB0d+6swRStKFzAuxzp
         v3UmkrZ0rn0ZRbAHnX4IA29s3log6fvhMNSFhlmMSuK26ppG+PFx5BW++Ah/SR1LT4nT
         0kuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770109648; x=1770714448;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dowN0l8PG5L77f+jBzl88Eb1rukCALYcJhjeDvDYXuA=;
        b=BovPDw6w1nvWFvMUMiUvuNVg1kJYNk6PE1XZjWUGE0shtDDYzSvTtcH0RPyHGK0WgC
         Lbah+mG0cpj/eNpFK4t/OmLS8JgipaRbgLmnwN34SZZQKSDsI9MaGyfIIG5mojUH41lj
         g0MH+0aEVcaHw9JraSc1havTpoY9zPZz6CSWbzvjETJ3Onm99PrYCYFUq7D6ypo1Bfav
         hCItE/+68DVaY0UK/mBkTU+KkU9WTPo3t6pE4CWcAi8gNWQaBLPhOWQYXfInqoBQFWq2
         T2FgWyyt2aBSGxQda6iIgfRxHCZdlphdGEjQUbzsf8lcxkbmckCh5KCIXKj3xKNuyUEg
         NqYw==
X-Forwarded-Encrypted: i=1; AJvYcCW6z0zyyTaI4lx7Oy0PN65GIk5pSGApNZAALShyOLqbROH7qfccGxEP8Ut4SLJYzanA8a08IsN6FCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJfkwdY5/p2QzwahLA0LQJhvsHYGMlbvZRnhIPFVB1uWE5/opp
	RApstRqVy03r7eARGKSxWrT+AbTS7g4KJ/PBsg+XFPfem3EVu8nHFS755O0fITpwLBMdOMMh3MG
	b0lvavW39O7bGnqN5WXp6pXiX9JFx7ManbKxQJxkcL4R+3svM1n+uJhDjPR44CAQ=
X-Gm-Gg: AZuq6aKrDpU9DRRlk9EPeJaXxAvAzUcczIu0fWfcDlIKsdV1wvSUdRAvLuxMdrV+4FV
	Ltkj6sQOxXn2BVRZ+0Uo9poOdOPXcIJyEy9tmNCrMcKqXmt9Mv8qlEivQ+xJa8vhAM/xIr68p//
	XUjpKkyZ1nSvYA6i/WWdLX0XTHyt+ZX0C1CGXB7y+LzMTxhp2uRJ1aK50zPTO6NVxMb5Y7D0eLF
	9qGNsPWE3vtYajRkuVti9jIIV9vOcxmDewpdrY2Ii56Z7btDWU1Rsw7YAMy1ryaGQKE6Gxy4JkQ
	FSe9hOgTDwHV9a4wIPy6aDZd/FX6dDESt1h9DJTdQUZVRcp9Um8sDzxUZmIAEh4l2o5uzL+08pF
	nRdXrSLZ9uGWUkkS6XF7PA4HipJHyzlhm9DzwPEQVYQcP
X-Received: by 2002:a17:902:b949:b0:2a8:7827:bb32 with SMTP id d9443c01a7336-2a8d96a17c3mr95175005ad.15.1770109648065;
        Tue, 03 Feb 2026 01:07:28 -0800 (PST)
X-Received: by 2002:a17:902:b949:b0:2a8:7827:bb32 with SMTP id d9443c01a7336-2a8d96a17c3mr95174665ad.15.1770109647553;
        Tue, 03 Feb 2026 01:07:27 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b414071sm160847725ad.29.2026.02.03.01.07.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:07:27 -0800 (PST)
Message-ID: <95d2ad4e-082d-b399-3a35-99fd6a3e78c1@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 14:37:16 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: sort out Iris power domains
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
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <20260201-iris-venus-fix-sm8250-v2-7-6f40d2605c89@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-7-6f40d2605c89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3MiBTYWx0ZWRfXyxXnU1uZ4MWb
 ER8HtlMNeO2um6o7M5sNJt1N+ShlS0iHTpzUGJLgUTlvOqJ7Devhtg8F73ohzsW8ttu6H2s3GT9
 91NgVfjQpyxLU0UmhtPQMfj7aykim5ItzPQcrJEr/pA4Uco8jbPo1ItmbQK0/TYlH50U/96PV+o
 V9TDngv3AfusF+2FmLH2Wb7TqGQvkVcTST3vg/uk8BHo6vNpW/4YQ2WIzMvhnZUg23MYqadRn6n
 mxp2Xss23rCNq3pvQGLE5IxqWD+jbXkwIGuUdRqqw5c+byh/keArta4wUa/rheFAh6ZKbtKJgno
 G1r5vHNoWPGQYcvDzjzhd7OctDfHOjafei9IeCE8pUstUtTkEh92P3HN79HNbPsIghjRXDD/ntL
 0uiYwJZkgJyDQcvG7PTm2QHt0muZv8hHd5XJUd5V6Qb5FBqINMKGjpQvM6GiuGuGLJY0KDVGvB8
 p338LvtTW8PiJAH6CDw==
X-Proofpoint-ORIG-GUID: JRbSCUnC3VYo-_x75X0B4H3p0A72kqnG
X-Proofpoint-GUID: JRbSCUnC3VYo-_x75X0B4H3p0A72kqnG
X-Authority-Analysis: v=2.4 cv=UKTQ3Sfy c=1 sm=1 tr=0 ts=6981bad0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KaDJ12nNnFZpivlZOL4A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030072



On 2/1/2026 4:19 PM, Dmitry Baryshkov wrote:
> On SM8250 Iris core requires two power rails to function, MX (for PLLs)
> and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
> qcom: sm8250: Add venus DT node") added only MX power rail, but,
> strangely enough, using MMCX voltage levels.
> 
> Add MMCX domain together with the (more correct) MX OPP levels.
> 
> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 980d6e894b9d..531470506809 100644
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
> +					required-opps = <&rpmhpd_opp_low_svs>,

should be rpmhpd_opp_svs for MX for PLL to get voted to 720000000.

> +							<&rpmhpd_opp_low_svs>;
>  				};
>  
>  				opp-1014000000 {
>  					opp-hz = /bits/ 64 <1014000000>;
> -					required-opps = <&rpmhpd_opp_svs>;
> +					required-opps = <&rpmhpd_opp_low_svs>,

should be rpmhpd_opp_svs for MX

> +							<&rpmhpd_opp_svs>;
>  				};
>  
>  				opp-1098000000 {
>  					opp-hz = /bits/ 64 <1098000000>;
> -					required-opps = <&rpmhpd_opp_svs_l1>;
> +					required-opps = <&rpmhpd_opp_svs>,

should be rpmhpd_opp_svs_l1 for MX, SVS can only go upto 1066.

> +							<&rpmhpd_opp_svs_l1>;
>  				};
>  
>  				opp-1332000000 {
>  					opp-hz = /bits/ 64 <1332000000>;
> -					required-opps = <&rpmhpd_opp_nom>;
> +					required-opps = <&rpmhpd_opp_svs>,

should be rpmhpd_opp_svs_l1 for MX, which can go upto 1500.

Thanks,
Dikshita
> +							<&rpmhpd_opp_nom>;
>  				};
>  			};
>  		};
> 
