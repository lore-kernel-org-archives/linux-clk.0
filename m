Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F3F239E9D
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 08:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763366497; cv=none; b=iQrBIwBP7XrFp06DCgb5FyjKFYgZlfaW8ay//kUb8VvnMnfr3WSlBkaw/tp/tcdsigwTKSqfjF+LPQAtlctt9Xm7gnyzJNYFjln9+GvyMVt6cUugaGxwkSj8B15ShM+GtVFjN5JuM/y1OSOS3DYQOIfisgGQ8ElqMz5Ua7mnshI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763366497; c=relaxed/simple;
	bh=m8TyZMzMFKsLEA+eFRfomBl6F+Zx5UFP11C+DoDotbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hP+v2QUsBpfgvQTrMaWF30Hl1YBF1gKGOLBYCoadjCN+Lvhly4tCDaFai9eL9Oc+/EPzFEhIC3BsioB7ik6AjM/6so2GOOmnCMmygtuBOWwsdVs+rP6eLMzTj2yXvJmudXHJqAw6A/5KCm/EcxYOHydkqiw1f9YdFVAquvYpKeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kjilAvEL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZO3USTim; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kjilAvEL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZO3USTim"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4oLme2687254
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 08:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kilptx1QH/kWpSVpOyWmVmBzj38jY8riz5Mji4LvU3s=; b=kjilAvEL24eCv6/W
	zKKECHMEspml5qhrrViGx4Cs/6t+hoIbSOpGcf3WLUFNSEefeq/gLXQjhCiZiytp
	8UKqyP7V7TvkT+NlDkGrcCvhcaUeJ5nfzfmLpoVAjnZdDijfdYcTlDn4fQcWqmMl
	lNXmRdLO7Jl2HXta4AjBC0eJR50o0ddgILdllvvIox8KBvRi6f16xny+n2/kSLQs
	tYhUTrofl+F4zMAK5aHJJvEB0Pecg+zLLuGqsBBAYQN8P+9il7JwS3KAy/bMe9Wo
	9VWN68pV/NYY/8r9ywxC9Lnokn7bf0gtDuP4DdzRpAqeuSjKmZBZ0Vul5826yPWb
	FzKLxw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejt5btmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 08:01:34 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b9ef46df43so3770187b3a.1
        for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 00:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763366494; x=1763971294; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kilptx1QH/kWpSVpOyWmVmBzj38jY8riz5Mji4LvU3s=;
        b=ZO3USTimQFCyH5Gq+z15eq3ate9FnUaSVDFGOCeEgVK5PwVLVH+jwS16MGQaYBHpX1
         P8j1Q/env5o3TN9lUxEZunCDHrkGjSMbDV57mnL7CImaS5fLTXYJCq6T+hxPqQfCiPCN
         qVBTEGOUA/d2XXE427tgzRNs5YsnYqZGhCW8khB2QO+1Zi9iGdMDdWPccr+spCVsyrHp
         P+/z9OUePegRNwVsVr1/Ugvl7/vyZ9Rh48c8S7mKRvzREnOAbS0mk2bKdgBBVhvsOdUe
         awa+/+TqThlKW8KSHHdyHHaodhuyMHIZX6lSljlMtmOCkHrLGm78j7wQCMMbxD502rou
         tVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763366494; x=1763971294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kilptx1QH/kWpSVpOyWmVmBzj38jY8riz5Mji4LvU3s=;
        b=TntcKm5i3HEDL23xkYb1NFkGTlgbA+FffJO7mQo3IyZHl4VBcf8C+sFPoZTr8i5KCQ
         sciJP84tbHgHGQkRp7VQ8GCSFPi5rfBHvEXOGFtLCXFsTqLlaXz5N0IN1c/+IxtpLkdI
         u+jTiEn5KUHwg0QmTGafTMnhKH+EnR6EeKXSMqFRvdTc29w93dYUvX2hJRbDAskpuJXa
         odiFxRHF5gKpLJcP9mQKjRD6lv2EE9J4DZtuoSBhfdSxz879mqpb39wbI82gpECj/0c5
         zryu60TGV52PjhhKd0unUpeAEA+B9MNRbws9xDfHA/2Cv32upo53slKw1N4O5AgpS7hj
         GcBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuN9/fZgdAqJunGL9gTphRql020KJ/42S3gGPkckskb4XHg0YYGw/ejWpMBOM+LPd8aFLN7VkEcuc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy99xbNAxHRNgG4wVrTFFlgR46HjuKoFOXwbPjlBhis1p+cMw7z
	K09ptaGx0WIrmmFjaMuQe510sioZE9j+w1AF5xw2iRRD1pJ4gX5WGf/Ic7AEB8mgy5mq+No1/Np
	ARehoRteFrB5TJ/6sNOh0jiLxzCl/fKwozMc1VHjkMKou9ISLZLcKg3WNhBNxcdk=
X-Gm-Gg: ASbGnct1kyITq/dZng4XxNpQuOwxE0ZgvqVZN4nv4jRxMAgePSu7S5Qd/TvBwVecXaj
	kFANZeJ4IdX49hLAq0aAT00kWbtYFvzUtVDunaM580UzV1bV5W/Gu3usTiDhbplc4H9scFxXa1v
	2b1osqupYyI7ud1QpPqDCqTrVPQTu1eSZSsrMggMqG7DvXEvGJw6M/Dvo/plk1Uc0u5ISdSP8im
	QzjVqSTg0cRR2RgV7cfNYVwBsBW2LiANs3UkpKhejMjMzzZ/ipTwL98gnNqoec+Ux0+xuBmgehV
	fs5+TstGHuL8Om/9ihesmuKtJJyQFhcpggTPC0nPZoU43GhcV8Ke2Zx3JCkjFwwxKcGT/wFhRVE
	ctOqP1JNzgAOTl7nTgJF+dyMMSs4=
X-Received: by 2002:a05:6a00:94fc:b0:7b9:ef46:ec61 with SMTP id d2e1a72fcca58-7ba3c17daa3mr13854372b3a.26.1763366494210;
        Mon, 17 Nov 2025 00:01:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBdLbpnzKDV9hIMEpdaxA39q23sH+vsg+cb1I8VQ+nGm4zb3iUFdG2Egpb4alDgbDppA9i0g==
X-Received: by 2002:a05:6a00:94fc:b0:7b9:ef46:ec61 with SMTP id d2e1a72fcca58-7ba3c17daa3mr13854321b3a.26.1763366493701;
        Mon, 17 Nov 2025 00:01:33 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7bedbb2a1d2sm3412353b3a.41.2025.11.17.00.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 00:01:33 -0800 (PST)
Message-ID: <a407c485-3651-45c0-bfa5-164bfdf8d55b@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:31:28 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: gcc-msm8917: Add missing MDSS reset
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
References: <20251116-mdss-resets-msm8917-msm8937-v1-0-08051386779b@mainlining.org>
 <20251116-mdss-resets-msm8917-msm8937-v1-2-08051386779b@mainlining.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251116-mdss-resets-msm8917-msm8937-v1-2-08051386779b@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LqmfC3dc c=1 sm=1 tr=0 ts=691ad65e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=E0pASI8uq2uS-7dJItoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: 3Kf9s9V7VR7Fj_pCjLtP4db-hoCK8g1e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA2NyBTYWx0ZWRfXy6LcZXZBnHUC
 tpXrHk/SEmBQrCUyEKItckfIkrdERpTtSydjFoMlwAK0W4MMEEdoUC2bxe3c3f1zMKHM/Z7U6d0
 rRYFhr9tWtZbkM3sPErssySoZM8F2TXBbWGzsGF2vSupHNNQf4dD+dO6I2kvae/VpAXU7SGEc58
 x9gbY+2l+x6MyOOcz34ZGkgCkIPU1e8zgwXCPa98K5PekG+EEl/NM17cBbD1gaSPP23WJTfsi2j
 ll7w9C5aF/+Mi+a9k93HKhrWIhJxbksmK/r4EesggmSIOHG0CDKtFn7ejxb8LSYjMDjoKg8bbvW
 Rrtx3mzshYzlhvthh59qGMsrVuSz0bRF+kpFALfuo2O1bt6SpxwJBnEzENCwz+FJ7UyEYaLp2eW
 9bHwi0BQM7ua4JQLQyffknYdUGydyQ==
X-Proofpoint-GUID: 3Kf9s9V7VR7Fj_pCjLtP4db-hoCK8g1e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170067



On 11/17/2025 3:40 AM, Barnabás Czémán wrote:
> From: Barnabás Czémán <trabarni@gmail.com>
> 
> Add missing MDSS reset can be found on MSM8917 and MSM8937.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  drivers/clk/qcom/gcc-msm8917.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8917.c b/drivers/clk/qcom/gcc-msm8917.c
> index 0a1aa623cd49..248fa0fd86f5 100644
> --- a/drivers/clk/qcom/gcc-msm8917.c
> +++ b/drivers/clk/qcom/gcc-msm8917.c
> @@ -3770,6 +3770,7 @@ static const struct qcom_reset_map gcc_msm8917_resets[] = {
>  	[GCC_QUSB2_PHY_BCR]		= { 0x4103c },
>  	[GCC_USB_HS_BCR]		= { 0x41000 },
>  	[GCC_USB2_HS_PHY_ONLY_BCR]	= { 0x41034 },
> +	[GCC_MDSS_BCR]			= { 0x4d074 },

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

>  };
>  
>  static const struct regmap_config gcc_msm8917_regmap_config = {
> 

-- 
Thanks,
Taniya Das

