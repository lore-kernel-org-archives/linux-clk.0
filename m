Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2B91A9F97
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 12:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763384093; cv=none; b=eGy/2D9XRU6gMJkYLPj7Q+Wq2v6mWRJqJysFX2fNu71Rv4RXvUKKn5DkvDTey96ufopebzmg2wYP0qrcb+utD4U6U6AzD7lv8EgeU17WqJ2PZAC1j7Hqf66/wABkJANgdEu7ZC5u9+Wnb+Z4gc/7mmHpGIG7vyNXknS6FS1PXZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763384093; c=relaxed/simple;
	bh=kBXNd75eYkZCTjXIdgv5n267Hu1R3ZFDXntdmyuG6T0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JJAj4yz5n6Xoo1C+xj7K5tgf5bKOF/hlwjT19LU4PNs/wtKBHK9+Qt31185NznzWRE2mlUBuATxw9A2SPC6Ntjj1maimlzKyx5vKwLAW9/Xr8yCpiihDxOMqdIR583Y3RLq62NTq9XVTUHpgLSRkk9S057PfDFeEXKwrzoEu1FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RzHpu3F1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G4BxdNRW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RzHpu3F1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G4BxdNRW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHApjXX3920773
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 12:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBXNd75eYkZCTjXIdgv5n267Hu1R3ZFDXntdmyuG6T0=; b=RzHpu3F1xo0ebUxz
	YyW+a4CHMkEnHjVrYkkKMnkdFCpOVVk+Ij44b6PWIe0cBmNLNNb6MbxDC94Vy/6e
	Nid+qVSW25lVGbptoHlVJNs2mNWWRMf+aZGNB9x3rLBUcFc2Uc7baFpKUr06C8Uh
	8TjoDRS5oz4cMD8SBMguVpesVaVuIZu0Q/EsjOlgXP3Ff04AYopzPEM/0F05ek84
	5+rJjPb0k9jGQUpApNZDOtZoPbwOeBf/K3X1Mb3xBNq6CNp/GP5vJrfOvROmdp8U
	jUX89QdE4Ny8+3JMg2COJaZkgJjQo9N8i60UjUmpb+QKOwD5w59FEB/l7Wzmx2aJ
	KAY7qg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2ay8b0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 12:54:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edace8bc76so12237061cf.3
        for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 04:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763384090; x=1763988890; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kBXNd75eYkZCTjXIdgv5n267Hu1R3ZFDXntdmyuG6T0=;
        b=G4BxdNRWjRTm9Y59jQxkRlks/pKq6/vS3Y9VCtXJPXbgaO82FuxGANod61YrbjaBNV
         2Bqgm++z2SgD2LpVlLH13uIOqEF8pmskIvlNxbZJRKevmhZGQAfpRFjHxS/d/uGhP3B2
         AeHPDGHzJ7MYwRq3c2kC6CwL5JE4qbcDSHuFjTYz9lO7EIl+YSWKY/RUfORr+FaIm1eI
         GLUGW+Zv0sABnjapG0Q3+AX8/akZXLzk7YMsWfw49OR6VjCLqKebh73bHvchg6mxR2wJ
         y8Ut2EXT0ICV7Qd97167csAEsrFY2wxxDeYr2IJk6/CnTr/F5lp896BxADQiFqBjb8JK
         QeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763384090; x=1763988890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBXNd75eYkZCTjXIdgv5n267Hu1R3ZFDXntdmyuG6T0=;
        b=jlERZVOiZpNvcf7N9DY6cAxK24RpcbefDK2XabmfKDbWRykxrBfYkxWfgjuZu9+eZY
         zv6xtkniVo9r9504wbq428V0dJWn/ByARmXNYEefPtPht/N5VNGQCMty6iQQohkQAy8i
         zQk8+g6zObmaCniBUaGYKbZUQCzehGT6OcZ3N1hHlN0u50yyWgsgWxVU0rCtowH9VwDM
         32HHpYYU/NnAOWRldfgEA3Fw6OVQlkt4P1SPQons4Vs0tmkw8Mq/4By4Lnu+72Xgo7qq
         TgNngfcBEr3xLC0BHFyoszB37Xgs0abi0LgW/E8ssF2Fi7QGdF16uT05UemZ9sO4UStr
         xXyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj9LVWdstcaPrD1oA9THhKEETaRC8GGxJfTZkP/hLuZoNotXrZHE7bTWkWzlcledskCWzAPtFn8DM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEGdot0zkQk6dFEficebUBVIPKMYqHNL40p4KmbJ8BsDXRdayO
	LlY6+ul3K9xMtyHE24oLa+7saHWQohIllI24663efzNe3eBARGOMO6tlVUu3DoaUAv42mCdV8v6
	R5Zdo1KQfAPBcN4FAPsni5PuYri8a/cl9XxdkUrTQaq4VtsXoCPZFHcu+kIYf17o=
X-Gm-Gg: ASbGnctGaBqOLfW1Wwu1+1EUz/SV/vETcFKjn8AARNmzusj/uuM7dbF2nwoJpnBhKZB
	5wkpVvh0nr78qL1pQdB2b9Ede8SGqe6HkMtsG/+1gRYUL7Os64MrBv+X75aTxex4BYG9awH3CVo
	K3IIPVUW8X5nun+ozzov5m0ZxT/8lavzeyp8ycoE5HzsxtYxKimMKabZzM+svDQqvHTuW7U6hdW
	RKxrPQmr2OBMcFhXLCKWucWStXXbLI1uf/z72PS85rH/YmTpwDYWJe+Shnnx05eFlXdTibBaxMr
	dToXMdUoV0qThGlHHtn/QsoMMFGklgxje01Ss943/b+GIMgGzM5PbdW4O4Fg+cRKCYgxLBDVyIS
	mQL/CQnJQGGQy/8a8rMmcMXXpWW4spkfOB+lVxHs6hcq6WUZGMoKe5c8i
X-Received: by 2002:ac8:5fce:0:b0:4ed:6e12:f576 with SMTP id d75a77b69052e-4edf36eeebemr120343841cf.8.1763384090355;
        Mon, 17 Nov 2025 04:54:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjqmfKkBFqL6Etv5sHVLE/6tCFwHqgdZk3cJaN1Sku5aib1YY1UTiw9W7VnIi8RSeWy0oj8g==
X-Received: by 2002:ac8:5fce:0:b0:4ed:6e12:f576 with SMTP id d75a77b69052e-4edf36eeebemr120343491cf.8.1763384089956;
        Mon, 17 Nov 2025 04:54:49 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb2cfsm1062147266b.71.2025.11.17.04.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 04:54:49 -0800 (PST)
Message-ID: <f9ed0efb-33a0-481d-9d12-20f0bcaf1d62@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:54:46 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8937: add reset for display
 subsystem
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251116-mdss-resets-msm8917-msm8937-v1-0-08051386779b@mainlining.org>
 <20251116-mdss-resets-msm8917-msm8937-v1-4-08051386779b@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251116-mdss-resets-msm8917-msm8937-v1-4-08051386779b@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dL2rWeZb c=1 sm=1 tr=0 ts=691b1b1a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=G8-SSAS-OYPV6Zknk1oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: 15C0gyXgk1d8DT35o0TyBrJpcQfKKrtI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEwOSBTYWx0ZWRfX/D7nYawUYdNd
 BCGsj3bLIFCFGPAaP+R0of9m055IKtRngjEX/orkZuQ3fjAqApRGfGchKq0zZ1LbwXDiXYP+bqe
 Ytc9Z3GCB08WG0Hdw8I8zkhT9PFppbuS5icLqnPFgeCkkzZWKPv2WxpHHy9i1svz2KxMpKqeSEb
 WcI0W0ubyCZ/YPiP9OTQgJnDxvl5KokeG3xpL4rT7xEWuz/mAFcOJQks0PhfC7olVR1nKsqSi0x
 /rAg9OGJCCmyRl8faxl38t1WAcvmCPKjeowI9YdDnUdDgl178bIx/GBlW78CgvaDF2iK90bprRb
 KijDPe9aRqdDUdvQwCl1/4HC0+nMbyu64pmuWdCSoKdfWZC5h6K0B9F6pkdppTJOtoRBEnHRk/c
 AX9HXGXnTMRsaecC+kK13+ZNS0/MTA==
X-Proofpoint-ORIG-GUID: 15C0gyXgk1d8DT35o0TyBrJpcQfKKrtI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170109

On 11/16/25 11:10 PM, Barnabás Czémán wrote:
> Add reset for display subsystem, make sure it gets
> properly reset.

This sounds a little funny (and wrapped very early - usually 72c is
the norm)

> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

in any case

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
