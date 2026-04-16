Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0D738A2A4
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 08:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776328218; cv=none; b=QumgsCLVfAmvToOL43/6TNH4OnRGMMqHhN+Vyi8cw2VULmdb1FSE632JT/fQhOo7sKboceIUWcvXbVDSzwD3hKUC9iAo3wWR+gqV8G9fNEtq352I/KQAGpPjNtSqbZCEeZ1QTaDdlmHBcCtocLo9iu9emg+ZZRa5bByHHVfY1xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776328218; c=relaxed/simple;
	bh=Jlqk2OBF0M11bCApSjgrDAFc6rP/EToC2kPMBBcfHd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j+FfWwWPxCldd10fBz95Mh0hQKjhx/v1L4jjem1IDx6xgHPCWc2TIc/82SOEJyuvNbYP5vETGayyJUa+pToSV9X8AsMapsB0F2xUmdRNeav66h0mjxuXWCeL5OGRz6WgrbCsfU65Xdv1xop4u6OQtIAoRbIAC6RkTwMtSk+AEZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZN7eN/0D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JhhbT1HS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZN7eN/0D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JhhbT1HS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G1VOPx3089099
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 08:30:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0NOY+XDWE2V4k2vSltcsyiU3hAomE8uf48R1x87M59E=; b=ZN7eN/0D99EX7snM
	Be1KeV3EY0QqPUGe9gn/E2D1eeBv0IxpEz0+uviPc3g2YLTlWrY1XZWyZKAwjaEw
	P70TjLFGjYkY/SgBCXnw1BJhGUmLyIiCq54BliIKf1L7zmGR4z7/rOvcU1uzcAFd
	OYXzO0YvU728C1T9C7SweJn+At90PAWfb5yg+uRVlklkAvocCvSO3JWAMS/QCQE9
	URlvCf8KnGKCS6GPySi/SISexkfxErsT9F3fYARymvRnLVJjIVxVhD2TxvWS9mlH
	FnW2jHMYclab/vUHaEj8s2KcE2ribFdICfCpm1lY+9ITdmUlm4qNYv9QfGos8IEO
	pI2tUQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djp6a96rf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 08:30:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8acaea1ff11so8920166d6.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 01:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776328216; x=1776933016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0NOY+XDWE2V4k2vSltcsyiU3hAomE8uf48R1x87M59E=;
        b=JhhbT1HSDmr1odNh5ReoLHBuBxKUzR+qARvlQID/luJL61vEKg8DfeQrM3Jhmr5MQF
         MrIx8OVHkLwzUt9JsIwmCnIG8NT/SWaECbsrEaorRtcJ7tKA8mwzjnJadVDIi+Z1bJkE
         3JxigF52FYKNoAknYFION3FGrTUZD7hZy5WcTZcq3C93b2cRAc+T3EBsyuyvgHXm7oZ3
         0bcNRq5uDgzMptBkEwr64xzqtfdcIezj95lq1OVrbxQD031kSQ1ktg7uDju3J9giWzxd
         BvBeexbbzju46DMs7hTI4wtzGO/mQg0gOOt+lc7siPn6n4g3BJp9a/ntIokyVpe+MqOp
         iIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776328216; x=1776933016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0NOY+XDWE2V4k2vSltcsyiU3hAomE8uf48R1x87M59E=;
        b=GvPYyM+dpxYjayigzi2bijiVbSlqvuGvmKs4jTr6ruuqFEe31JCHHZ1ZZ3IyDHy80J
         7HzHXa5MXkQDHQGkCiqI5t8I0ZjByiVMworSTzsg2Jxnmi4FzsqeQQDrh8qoaGsXzu27
         zHxN13fBUg18nhwoQ2czzsn/vcdvBn63HB91fAImW031pM67YkAq5T5Ll3m2WL4/SzDs
         TTKwYsiHS3HCxokV1YcxUICqPUDkhP1tRR25Q1Z9rQyzLPFbTVjlzqO1H0NRnZaaLwBC
         +69YFa2S2BtP7cVjU0P17EZC6o6vBjkcHHC8kpSbB/4EerB2Xcc4MiC5KWHyFEkC82ZJ
         NOtw==
X-Forwarded-Encrypted: i=1; AFNElJ/g0enxvgt47iRUn++kBMut3/PXF8xWmhKIGVvUHA/GxhWN20gSJaYLQpETaoIVG2inAy1chORDEbw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC/A1A5TuJSDVU3e5fcc9Y2/IMQeAOiu4s0pO9n/IBmrBJOe1s
	xpuWuPvZuM8ftHNmHtPZSw1yb1dy2UKBEz6vAtMjhmDvduIDlX/3iLkKBE59yMh+z0RnAWfBdvv
	IBxaVlpVpkN6U+7NtEg/Wm5its/JCA13YIIpJlA6cnoFx/+jK9z1STITl0JmmHzk=
X-Gm-Gg: AeBDietQBL53sQcVNBJFUCPzXRSbmPW3jVu8e0wb05E2ji5sRVoDZSDpmXaYOQDkAFk
	+QkhyYPkaWc3ZfbMe6sFjhy42sEAiLt+K8bicP6QRc8+BmRapVYd1mTTjNLg7TWbqYIhDCOP9IR
	Yg33MD9DGjrwhmJh3+5VNzEA7LofJX4nEhPqrV0dorXij+ETDMWtMxE2UmqVEEjjSrv7iPF9VFg
	t2o5IWtjzj1Zc7N2Si6+TeqsteBXzsHs8n5Mp5htmGCMSdxYF5hEFE2+2xYXPwnbFShehZTf86R
	7wwk1YWC08WFFZaqmXjyVsgbnZlx5WuROx10Ix+ltJ8DgxbdjXW4HmsldJAIehzmKyrG5sh7yF+
	M7FuBpYjnW2aXs/Dj1ZIEzfDfVkdR4aH6rTzKhwZ/tFXbPc1g+ZxqEQ/vx9SGKmOADa/+zi9Fa5
	PSX8VY4iwmsZmlLw==
X-Received: by 2002:a05:6214:cc8:b0:8ac:a0f4:5aa0 with SMTP id 6a1803df08f44-8af6b75ecd0mr15811606d6.8.1776328215663;
        Thu, 16 Apr 2026 01:30:15 -0700 (PDT)
X-Received: by 2002:a05:6214:cc8:b0:8ac:a0f4:5aa0 with SMTP id 6a1803df08f44-8af6b75ecd0mr15810876d6.8.1776328215088;
        Thu, 16 Apr 2026 01:30:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba17341b9b6sm141901766b.2.2026.04.16.01.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 01:30:13 -0700 (PDT)
Message-ID: <357baf04-44ed-4d79-896e-16b7063fbbee@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 10:30:11 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: Add defaults for desired arm64 drivers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com>
 <20260416-clk-qcom-defaults-v1-3-579e75c4cfe5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-clk-qcom-defaults-v1-3-579e75c4cfe5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Q7dcWWfqHRxV_G9HrCa_rF9LvuenpIjo
X-Authority-Analysis: v=2.4 cv=NuvhtcdJ c=1 sm=1 tr=0 ts=69e09e18 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=G14gXSJJWdPwksqYDHwA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: Q7dcWWfqHRxV_G9HrCa_rF9LvuenpIjo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA3OCBTYWx0ZWRfX6GTr7Z9RO8tX
 cniVqasC7cgZupFitARsTHBQrTKqo4ZRs3WZ/qDOgTeV+/OSDD5CCfSE9XTTEeFmCzAx75+GjjF
 gtu5c6QBBXLvvwed3Z/9Yww6kxVoOfiBdqee5NvtYE+deuWWXmqTrS8fEUx0iVI+WZ0zmohe41y
 e4JIjwhrEetoOkE0n3dwGnBreEn8g943YxsVPlbmw1jsGjOANhsC+xUnniG1mxUXjkKwu8ETzhy
 ViGVt4542JP03gsZsEK890tBziAniixn1FeqjKyG/1B2j65irpIkhqxcnjZMpYwTJ4XVFrPQj9/
 TivpfADBtq+Vp9B3FEyoUlr2V6n1j66su+8sNYXdEnNlFeZStaytwC/JAaWr6M3FpMGv4YOYbDY
 I6RYQmX3d86gSwYsnkIO38CDd27MQkbVxD8fN2b40jbw15npxAbHMoQXKjD8J8FtF4SqI7dEvkZ
 vaAwd7fYWQw0a+00RSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160078

On 4/16/26 10:10 AM, Krzysztof Kozlowski wrote:
> Clock controller drivers are essential for booting up SoCs and are not
> really optional for a given platform.  Kernel should not ask users
> choice of drivers when that choice is obvious and known to the
> developers that answer should be 'yes' or 'module'.
> 
> Enable drivers for upstreamed or being upstreamed SoCs, which are not
> yed enabled in defconfig: Glymur, Nord, SC7180, SC8180X, SC8280XP,
> SC7280, QDU1000, SM4450, SM7150, SM8150, SM8450, SM6125, SM6375.  Note
> that main GCC clock controller drivers are usually already enabled for
> these.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

[...]

>  	tristate "Nord Global Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
>  	select QCOM_GDSC
> +	default ARCH_QCOM
>  	help
>  	  Support for the global clock controller on Nord devices.
>  	  Say Y if you want to use peripheral devices such as UART,

So Nord GCC is "desired", but Kaanapali GCC is "important"? ;)

In any case, as far as I'm concerned patches 2 and 3 could be one

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
