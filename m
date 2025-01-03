Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0753E1F9EAB
	for <linux-clk@vger.kernel.org>; Fri,  3 Jan 2025 12:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735907277; cv=none; b=gKfQDsY7xMZltb/fVLH1Jn/ofeF/IE1eQtJP2nR5d4WzmIaOwLay8AR5HCKL19xpBDY72YohP3GGeqhY03vFXtHpE1ojVNS95RCGMdilaseE+H0dWWrKt7zafwW+44CPwO7TdLuMlu4H8TaQ4sF0HYrhfm/znXacrMG6g2EM5qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735907277; c=relaxed/simple;
	bh=Pqwl7N6kCzQ/hrkxhcYrmAOFRMM56Ip/rYR6bmxRT3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G4NL+ORsSI97/aaid+IiLFBwyKeZr7l5MYQGUK+RvgxMHYFNrCTMCkKSGXWOVOYZO58ct9fBoZRxnP1bpY9q3yWs+HoYKId/P8RJefQz9Nz1heKcmlX8INez7JVoHeCN9u6BdmizlJHvctraKgm71ay3jUzk16flGICPf8th7Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3bKE+H/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N3bKE+H/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5037G0RB011625
	for <linux-clk@vger.kernel.org>; Fri, 3 Jan 2025 12:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QdbJ1dOWvgh+OgR4NwZE+j5YlKJamHg+xsDrOvj8Qik=; b=N3bKE+H/u8PRNQb7
	C88AV19SPgf8adrEUgxVI0CN4QPjJXgH2zwKEINlA6GrU/WpuFleQyD+YMHgKGEt
	kBkuXz36JyDyvscC2WeVjZ5TJIfqerz5v4EifdhermbvhdJE6N0mSbmrvyUBcfmc
	OPu2dAb6vtAprnjO5aiE93jtBNdNHoVz/9vUrZsYkLZQ5s805ezeU71fBUCKsPmA
	+lfTsurWNJshXatDRTAkex16q0Odj+V2j7Nb9vU3G7VXYZkYqV2HwhY9/fyHukq2
	FCAGWqNwt+b+tSAo3cNEvLuP5CaKRxkwI9LP4aEB+mpxsBAfQ/sihfFTOOe/Iw/U
	azGUlg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xbbp0mxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Jan 2025 12:27:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b70df784cdso71966785a.2
        for <linux-clk@vger.kernel.org>; Fri, 03 Jan 2025 04:27:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735907273; x=1736512073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QdbJ1dOWvgh+OgR4NwZE+j5YlKJamHg+xsDrOvj8Qik=;
        b=VmxDCawfbiVw9zURzv1W0wCDUKGVk3RvVwBvCXjWKe6YKOV8ZoK7urhcjt9mTE6TWq
         ddOm2GA10Shq3cFAqztrtbN1MNrGYgLdK9hYOwFrKxiDibaj4YmY3OgPTK2EfD1uE8m/
         vEXfBEWn22BOW/8i7im7M22LYwuco3YkgilWN2eae3k858XF2B6wqCTSKzV2UOmrvIes
         Xdb1wh6df+U2Dl6HTri1U8KwePVGbaEc3fEjfBPw00f3l9zgD92d7RiBVQ8gM3qLVLXU
         FZyHgwpnMKN67rmUPJ6nYbgAdTTCfD8EOG6tYkd5Iu3dHVXzwRLMV7L3u6a6kC9HywuK
         H15A==
X-Forwarded-Encrypted: i=1; AJvYcCWchicqLXaUkmN6J2UcOB3q5HkXIYHEyGpLu38jyC/VZHlmt5v8AyEKaCQwJLFxaBV4rLpEHgeKfgg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR6FI/YgRfaYMAgkDEfgWxZPhQAY5pWFwc+DNp2D8jLuYae61n
	6iG7ZgwBf/aMW1Oc+fCh3CzbpW599l/xYu5OGoTcmrR+xRR8aAJeKa312TdUeCzFCdjy9yYMNOr
	zMzJhFdLutSeQHLnTAMDTBn0UijZJMG5+idizwjwXlqwAOGISjhFNnmMlshI=
X-Gm-Gg: ASbGncvqnbqX1pJ57XfFgC+cjw+q62IwNEMIBpfVLrPDO71cAzHT7fhogkMZyQK4Vkz
	cSSvZ5h7FPyVJ14q7EVdkr3KI1AqGtECHTI70ZOKtHmnJtbBtYP3NP36Ek+hee9zRcMAn+douQs
	hP42X99ksWjK5LuaGm6GOkYiPOVHPOHxAfgHbbOYucPKhBxhnET7yADHvlYqlsZgVap36CeYhRu
	Px/r4kI1Q8DTQhTGSBys2yZb/5GnHPem7lBhJK+NDrTIA9sPEYLhAZPIwlF2E2QKL5fstEyNSGK
	syZhlYqCnu96SD8ON3Mb/x533sNydvILJ8o=
X-Received: by 2002:a05:6214:4007:b0:6da:dbf0:9645 with SMTP id 6a1803df08f44-6dd23317478mr274820776d6.3.1735907273055;
        Fri, 03 Jan 2025 04:27:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH15Wpx7u9V/hOQ08GkSp0Y5O0301pekMRgSHOKCQeCdUs50MNnQM9AG6NcnIA0Lbk63M/OqQ==
X-Received: by 2002:a05:6214:4007:b0:6da:dbf0:9645 with SMTP id 6a1803df08f44-6dd23317478mr274820606d6.3.1735907272677;
        Fri, 03 Jan 2025 04:27:52 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e898689sm1875427466b.78.2025.01.03.04.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 04:27:52 -0800 (PST)
Message-ID: <c94ce3c4-5b8f-4d7c-8acd-afab63306018@oss.qualcomm.com>
Date: Fri, 3 Jan 2025 13:27:48 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] arm64: dts: qcom: Add CMN PLL node for IPQ9574 SoC
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
        quic_suruchia@quicinc.com, quic_pavir@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
References: <20250103-qcom_ipq_cmnpll-v8-0-c89fb4d4849d@quicinc.com>
 <20250103-qcom_ipq_cmnpll-v8-4-c89fb4d4849d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250103-qcom_ipq_cmnpll-v8-4-c89fb4d4849d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: trSq-ysDuxu71mQ6hl-Jrbfwrkj139sl
X-Proofpoint-GUID: trSq-ysDuxu71mQ6hl-Jrbfwrkj139sl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 impostorscore=0 adultscore=0 mlxlogscore=987
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030110

On 3.01.2025 8:31 AM, Luo Jie wrote:
> The CMN PLL clock controller allows selection of an input clock rate
> from a defined set of input clock rates. It in-turn supplies fixed
> rate output clocks to the hardware blocks that provide the ethernet
> functions such as PPE (Packet Process Engine) and connected switch or
> PHY, and to GCC.
> 
> The reference clock of CMN PLL is routed from XO to the CMN PLL through
> the internal WiFi block.
> .XO (48 MHZ or 96 MHZ)-->WiFi (multiplier/divider)-->48 MHZ to CMN PLL.
> 
> The reference input clock from WiFi to CMN PLL is fully controlled by
> the bootstrap pins which select the XO frequency (48 MHZ or 96 MHZ).
> Based on this frequency, the divider in the internal Wi-Fi block is
> automatically configured by hardware (1 for 48 MHZ, 2 for 96 MHZ), to
> ensure output clock to CMN PLL is 48 MHZ.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
