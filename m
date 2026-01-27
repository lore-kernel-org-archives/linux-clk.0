Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4386E221DB6
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 11:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769513477; cv=none; b=n6JY5bvo6l4KbFXUui+oB7+f7bXv27aCdcZo6OKjl7umBHSRiilGbKK9BxSXMyM4TbnqBwhk8w5Wa+J7AwN+eKUjaWDeLpFY4XGrl81FWjwP1+/pU+NJ/gX0glAgFyYiZuTijXcePpvwNyt8qzjmai9H8P6e8AT0zDysAF/sUCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769513477; c=relaxed/simple;
	bh=Urol0pYuPxPGC2lQX1EPUImulHMLveUGZZQ3278uW6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O+iRLfWr2iuWQsAov/RFdLPx6VUjl+x2dDaOPfrNf+TcL+1trmDifztdIwNPYA2GhhFFz4kADZR5E4acWbdWpy9NNL8KDzuPGptRjFCV8RXt6xPUFIFZCQH9pxC7tUZ0vdkd1BhhQGijQmXsk0+wBj+96bVKoz8WzUSU5H6vNkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9C+DKUG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YEgZ6MIR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9C+DKUG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YEgZ6MIR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R86n6Z620693
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 11:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hGZRYHdhTWMe6g6Ra+PVr8tG4M/ZgyWo32nxuKBhByY=; b=P9C+DKUGbD1/hbbr
	V06HODOPKujtUIiUx3QZEiL2v/BSdYRRo48jOW221M499xib8v5zVrdvy0WJ2nG/
	vxNal+012g6ZAIP+NfBgSFN3FrGdUc2WEKrgAvv7/OvhEPGt4g6uwUtRzRPjy7o6
	mWF4KhDe54/CXHbBnIO+UvaSwBVEjOKnbJ22Iq8gN/cqdLw5Y1Px7ag3Q/6olTq9
	CQXh89YwP/J5MtZO6sUjvEEp4m0j5sYT+7mb5qHCKWAYK0EZxwT4D2HV0c69DEHp
	GaogkTWyNMIYNmX0OftgbZYYuUhDp5y8Sr7AaKYKEMze7PPKlc3fGhATfpCY8Rtp
	1yv84w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjegn8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 11:31:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c53892a195so117397785a.3
        for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 03:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769513474; x=1770118274; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hGZRYHdhTWMe6g6Ra+PVr8tG4M/ZgyWo32nxuKBhByY=;
        b=YEgZ6MIRctDsb53bgpWIeFFO/6QjirXLdsT555WDtNLbJD1JcDvlPCUZHgTLamYrYT
         CZhkIK6r6PKV2/+FAotlNZxxq2Zj7fXYuBuMOM88QJbwC+fv+LZlBEiqPYgBe5Zf7o86
         SH6g/wwZY9wmjO7ddSmXPE1H2URptnp6Gfj/3SoX1tEk2ru4QqhkHK5gzKbA4i6ClsiD
         jwq5YRZsO+ISu8FjbhG9pzUAaa6+UxT5Hi2eTGFXFsxE/8TZWboQ2PYzRWmGo+jfj7ke
         H4ueQUTHwUL5SiyamxxV3w0Uoz53H8z2Xu6TE7iJAd1TzFV0bYATN+6WwJCctRfuXhA9
         4KcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769513474; x=1770118274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hGZRYHdhTWMe6g6Ra+PVr8tG4M/ZgyWo32nxuKBhByY=;
        b=OwAN0Q88gjA+YhRjZX1nuVzJQrF/+Pg2FRhwZOE6hVCDv3M2prvoSAeMrwXtpj1JeK
         O1D37bAX1ORYsOLBwGniDJuxLH81x8uDtfTb/A/42+sagAqEAm5x22fkdnrcOkxZAKYP
         vx2F4h2xrJrE1Y0lG2OADRdMMNB/Z5x5lKWdTL3iDrOyVItHyw2ziELgpM8lpwnC4YvG
         6L1vTl7Unj6p/QAdorPg+AZeftMXk9qis5SaefudTo16Ms/NL2FrTEzEIbV6Lp7XXZ1d
         OTX1zUeEoBXxM6V9YtU4RmvF93s4VV0/bVuHPpip8VSsV+bhR3dIqt6V1XjGDLfMvLo/
         IIew==
X-Forwarded-Encrypted: i=1; AJvYcCWyEt/dddXhdxXNhu1XAlePJRcQ9yhi/5rGlAdnyLlPECGBrFdo4KR/qLSj3LFvW1WredKk+Hql/bE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfUeDGowjWNCnA/cfcrHaeZC9lJqP9o3AC7HxJScg+cIHBKnPT
	PSlpyhJtjh8rffWNUjeKo8gTYPz/PbyoB/Bohg62g3dkLTDPpPlr2/aAYdHEXHbuM6o4nSWCJkX
	KqoqTLzPG8gTuRNeZEc7WDRf58GVOc1tymT/JgKw/XzabBWWzJiwyTAmvvFDspcZocr0yO2E=
X-Gm-Gg: AZuq6aIq47lvr5lqpLwseVACcbE8G3ke+jLiKT6VxNk8+XRLgx8ljK4bVTElr7XLLBg
	kKIaJ7lk5XgDTJjykId3a/9ZOp70rzYbXrwFaM4jnmEPM3Wiqr8WsrJihUw5RIXbb3/pyULgMwF
	4S23RAlDcuN05A+DBS9Zb7fNAA6A4WqNGEFqIY8AcFPQlEkYHCoCP1mt5Ne6jdMf+IcqcNtGfPV
	iHeiUgI/qBkLnp1ZSjoHJxaS6bOj8w4PF8mKsGcpLkG2ona5Twj91DyL0LFWrKcGoyPxPKzDqPp
	rU5UcQ9ZRT8ICHDTNrEYBC0rE6ESg0saUCQdjc4BQolU5V5x5wpdtSwwPt2QpGT1IAu+B/8gQQY
	Lle4o26lpZ6JcHw/iCU5SOIxOPWf6mHRF6qs3HUMa91zdfAc/E+q6+zIOaisUlghH9AU=
X-Received: by 2002:a05:620a:f12:b0:8c6:d3a7:3d1e with SMTP id af79cd13be357-8c70b7413acmr114751685a.0.1769513474365;
        Tue, 27 Jan 2026 03:31:14 -0800 (PST)
X-Received: by 2002:a05:620a:f12:b0:8c6:d3a7:3d1e with SMTP id af79cd13be357-8c70b7413acmr114749085a.0.1769513473873;
        Tue, 27 Jan 2026 03:31:13 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8877581a03sm634706866b.43.2026.01.27.03.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 03:31:13 -0800 (PST)
Message-ID: <df4f1934-7366-4ded-bc8d-73189769d967@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 12:31:10 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Add support for GPUCC and GXCLK for Glymur
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260127-glymur_gpucc-v1-0-547334c81ba2@oss.qualcomm.com>
 <20260127-glymur_gpucc-v1-2-547334c81ba2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260127-glymur_gpucc-v1-2-547334c81ba2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5NCBTYWx0ZWRfXxdb6jtFK26LA
 REccgehI9qCZzxvqV4BqclRUvBE/7yeDh7R+Lt3SAk65scPnHqfGYzugTE8VOpIShYwrJtSiMSF
 kC0V36wEvAG1j8KXU/MQpMPTcloIrzFp2OJcjPPj4FUa6gW7sRm2ENUNCko6IVHeXelx8YpaVGx
 RwLW5UkYpT0pRh5lZVbNybQ/KfdlRoFqWaqsuzxHP70xwXHl8SOpEgNdmGDIF9tV3p/weZ4Ztk9
 5bcpIlBPkn6Lol8hohQ3ctQ11EPt7djeLWP6VzCpSwiCXhZqtLs1PVcV3cgpRDU7JSwIrmPrdtA
 8Cku3SMyC0tzGeAyF6xU6l2KxA0UgJwej8lCMdnj7r5hFgkskuSZU1SaSCYQ4Kh94vwoKTYvak7
 wDbf1cJog1RMrH28ssSNP7O3bIxCObDP/RPyuHR2OHIMiFmkLkKKNQeSTdVqXka8t/ai8sNE3Em
 fd+RG5mwTsr88J8VwHA==
X-Authority-Analysis: v=2.4 cv=Qelrf8bv c=1 sm=1 tr=0 ts=6978a203 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=91OgtvA7_0Jf-gwRHFQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: gyZjHfO1iKVo5L_EY8r_ygwuey_nILko
X-Proofpoint-GUID: gyZjHfO1iKVo5L_EY8r_ygwuey_nILko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270094

On 1/27/26 8:15 AM, Taniya Das wrote:
> Support the graphics clock controller for Glymur for Graphics SW
> driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
> block dedicated to managing clocks for the GPU subsystem on GX power
> domain. The GX clock controller driver manages only the GX GDSC and the
> rest of the resources of the controller are managed by the firmware.
> 
> Update the compatible for Graphics GX Clock Controller for Glymur as the
> GX clock controller is a reuse of the Kaanapali driver.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]

> diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
> index c209ce5fe4f003aabefd4421eb4f5662e257912a..3ee512f34967f1b165fdc5481bb28e1dadee133d 100644
> --- a/drivers/clk/qcom/gxclkctl-kaanapali.c
> +++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
> @@ -52,6 +52,7 @@ static const struct qcom_cc_desc gx_clkctl_kaanapali_desc = {
>  };
>  
>  static const struct of_device_id gx_clkctl_kaanapali_match_table[] = {
> +	{ .compatible = "qcom,glymur-gxclkctl" },
>  	{ .compatible = "qcom,kaanapali-gxclkctl" },

I'm not sure this is correct - there's an extra GDSC on one of them

Konrad
