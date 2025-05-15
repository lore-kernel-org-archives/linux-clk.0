Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C034219A8B
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323316; cv=none; b=WcMaUU1wISFGKWxrHuTSW/bkBUtONO33wWuyg74IxLXpAQ3szgUdJYFEKml1DH+himkW4eHObl4/uCcqm3cW8gY0pdoo4NHYFJJFYdr3lvLRtwA4FyTTDbvl5AGua4M3010I/9mr2wA8CFhTSHm1BfJixEdTIe4BKPqgpR0/beY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323316; c=relaxed/simple;
	bh=kfGaaBcF/LpH0NxWWC3HOK/nOecylao8k87Fg+vGGyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cs6QorwbZLQ0BgXUQkxcRAc1gRvcwptgzv6LypSxCL889vTKMZ5aHButdRMq4u4FFHI3Yu7q2axA8hs55atbvjLt/X6sQoR/ATjDIl+b7iZ2PJx2Op9J7SCMjaUqMGw/uxx++1u/DsbfkoCpxuunp/3r5DGivqbHNeXFh4bakuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iKyYfYrA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iKyYfYrA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFDS1001792
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rkzw4ciboicJeZhZaEWOlIlR5gsZ0yhn2FRwPUQB6/Q=; b=iKyYfYrAhhVKhXlH
	0ie2Jwxsfttl0cU9duToLuEyfa4fsQ5utrlIZoOY7O6D7SSpd/rAT6tHip/pVmE1
	1/w4a9C/3ySPrRb/ylT9A8t+CjY92JJAxlxKYGkSNn7IcBadH32lVNr6q0csilhi
	SAPhGUBEgdA6pzyQFz27CdyAlNcZa7Epa6i+U6NR7Q8ukKKtWuil4YuKrei97AM2
	9Plu95Ab+1XJ6TOjuQVcKjHaHGu0yRyYm3kBQqotFiQUtoXVdeRVL/xmzFIGBXQM
	JpAdcy8vvq8Jr8Egc9Hx2+01w2q6dttz/DKrr99C9QxnTp5OiYQbkBYaDC4L4nML
	TA8dTw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcrejkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:35:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f2c8929757so3143316d6.3
        for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 08:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323313; x=1747928113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rkzw4ciboicJeZhZaEWOlIlR5gsZ0yhn2FRwPUQB6/Q=;
        b=psawHpUXm2tvBRNUR3z3OOI+YTJaFtM3ISjmftAbZhcqcBGx2ZXRwbwE0O6z/DQS32
         lkdhZupl4dbbo+xYeCOYDxkX+6AeAL7snitp0BPHPLOPd85o2LJoSnPtcj13NkwxBsX2
         ibZsk/kIGDbaQmExbZdM6E0OHgyludUXdC9cO6cYq4VVSIuR3f2uflTsbrsqHwylaf0R
         HqSkElIvQnWscP2QIHXk8CVJq6ipgodPp2YPx2ub3uyOL9zTfVVeXGdUEdMRn5sGRD20
         9XqGlpV5TZOjendzwe+t3jmXIOkSMcfRRuZBS8hnpbdB576W66PM2pCsM8Z6og/eoCxY
         8/Sw==
X-Forwarded-Encrypted: i=1; AJvYcCX26ot2qTz9AB0l5GsAxfDMzrEKQXNgjqqKjyjPzH6VlGk+rLOFaWtguiMvBJhmvWAO6m36eKo8mWw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuasDxhQtUtrD/zs1ce5fxgs9bI13fI4x3Ld4pbVyAHQ0JwUvO
	o17Nwie4NStdXvD6/IdGJt+1GuEzwinkV2LbZTmkXwl9BfmgTGZwBYeWMA0g67lU0IwWGtLl1ot
	EWFrlp4QenvlP52heLL90q5+P8lItsDte/K9ivB6xWy2PFj2P3MzaZBM/SfI=
X-Gm-Gg: ASbGncvn+JuhEdkQazpLg7PURId6AS95uVV9D20+KvtHjEStDjlqQuNciR8/q1yA12b
	kK0QMos2Up9NSUKG5pYvV/xYY1L/H8kmguSLXGO6/fHke2Pbv3JCyDY/G/LghBtrlHQ+R4jTJcg
	+5wMQ2UTs6cpSjIEZJsEBmATLTEtDVM3PwApxCSExiCrktNLWY2bifLl91J6eMIeBqO+k2uiRIp
	3MJ3T5hEZgQeezqcBwhZCnXPUkJWl6lep331gt330OrGj5bvxF3cQnU25rgyBYtQJG6S2dv4H1t
	0y42aNKaULT13l0q8+YjnPEbxUeTRgF54jHgk+KlwK8J0ETCbfSYdf2fyLyrxaoV2w==
X-Received: by 2002:a05:620a:260c:b0:7c7:5384:fa53 with SMTP id af79cd13be357-7cd287e57c4mr484442785a.6.1747323312976;
        Thu, 15 May 2025 08:35:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO0nTwZv8sYoSfNAmuJqERfG93omVD06XD7BfB9gDj2RWpLvTBvCuoS4cTPigbW+p4ywQfCA==
X-Received: by 2002:a05:620a:260c:b0:7c7:5384:fa53 with SMTP id af79cd13be357-7cd287e57c4mr484439985a.6.1747323312255;
        Thu, 15 May 2025 08:35:12 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e637dsm6880a12.43.2025.05.15.08.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:35:11 -0700 (PDT)
Message-ID: <d98231be-3805-41ab-bcbc-5f6b6cfdac5b@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:35:09 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/18] arm64: dts: qcom: sm8450: Additionally manage
 MXC power domain in camcc
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-16-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-16-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kJcmNOXILxAJfugPzvqkKtHLZwVMrSRD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NCBTYWx0ZWRfX+ESmDcGfMwqo
 +orjwocF6C+RKaOIlR18xdPBDOASSEx+1LicwpINTTuMdeKgUkvJUlSuwePxF3msc0l7NAnhnxp
 XpigMmqXCbrkSIylNtMSmU/IhuCDpkSHExsMJ+FeXr3AYms9RtVYt2WQ9j3UZ4a+6S9+V7AymgW
 Daj9KX9wFJTPNOx29CuBvRDPhWvoXASy1/07NZfRz3R+Q7NrTzwoQ92r5CNhyThJgQ09lH67ytZ
 dDWmPgG2M6njvwrp/kv03R4wErY2+qsO2ZZ4bIr1CtbtUuk5QgF6HZOQ/ht/VnrKrATZlmbnTQC
 w7JziXNmft7WG1TIFnGm+tL0BznKZ9MM5nJGykW1E4cL1GPvMBpVJx4eksTCYDLiWtxZ6/josP6
 vka2WozWSeJoSxn3scCvGsQIRR/VZ8nHFQzYa7+AKso2exrDBo2Ml9CpcSB4s0KRyR3gRslj
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=682609b1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=9_CkSsT5FSWxdIVEpLUA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: kJcmNOXILxAJfugPzvqkKtHLZwVMrSRD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=660 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150154

On 5/14/25 9:09 PM, Jagadeesh Kona wrote:
> Camcc requires both MMCX and MXC rails to be powered ON to configure
> the camera PLLs on SM8450 platform. Hence add MXC power domain to
> camcc node on SM8450.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
