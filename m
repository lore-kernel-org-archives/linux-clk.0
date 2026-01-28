Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E8E2FD697
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 10:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769596018; cv=none; b=WBszMTpl2VQUlUhzhw11Lu+9/ceSaEHz2ibkrCEfzfTGiZXm+ShgJ89EmNvAry8aYNxSr2vWiITpmlOuNCAGT300JYn3AiF6V1g28P23hxwPT72OIYv+ScAVYrOjk+DpahevGE1jKe0Nd09sVsNtOg5DztykEB8fTAIHOez3b+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769596018; c=relaxed/simple;
	bh=Imfj4iTgQ95yP4Qat4djxcT+jyDZxygR8oV4n1WRUwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s+EV0noEEyTOryyjNHVKi/QyktP+u05ESzuHYaRuURujM/s4ZFqL4L4HC71qhJRYoswCcjS70r1W0cHsVUgV5oqgb1TURlqefQ45wLsyFHoT9I6gJZs3d/uzSVUxfgaFoSv2CjAHEM8MRnZhiXVtP4YkLD5LLDkdl3hS3fNXUuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HO3mc43+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kGEfkLqK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HO3mc43+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kGEfkLqK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S924K71406339
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 10:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eD0aQjQxqkMyhCgn2ts5UcBjgfEIq6adVpGl4zx4qlc=; b=HO3mc43+Ae5ux/pM
	eZZBun4mrKy9eS3gUKMF7Xn856bTmIwc9v3gHS34HNpZ36mcrdyPvKXdCzfbwzkN
	atChW+uLBKKvkG+SKg1VgN/rf4MKzeYg4Lnvz09gZE9mSMvSauf4fl4AAibQ7xfQ
	EBBHPzFUmDC5fX60Kt2PJKzplCTEI7B/YDRbM8Do3zlMWmTlYAV91uyCSv1ZowNG
	ZXm++pIjCQT1tnDcGfUfnu3EmKL9Td/zbi+lhfw4l4sveszXWqLmqxVIfoGPvKfL
	oLUyO1MZvD19YvfTDJTilnCyRxYJ/gagDrWcGWwxhparwDltEpR/Rjy3iYMsP1Yf
	WA803w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by4dytcrt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 10:26:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c533f07450so184155285a.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 02:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769596014; x=1770200814; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eD0aQjQxqkMyhCgn2ts5UcBjgfEIq6adVpGl4zx4qlc=;
        b=kGEfkLqKmD9lobcFlv48NUCPDpVeBM8nrTkueN/Tzf805Z4HTpdkh/IAzFr5d1VZy0
         SQMTHrkYxlGfIl+6RBs3rfUieJ0SMWamx3bW+5AHy1QzhpTKqqrv5ADL2JkmL+vhUwkL
         3IRLtMjySL7XVSz3Eed9PF9IdUw5YKFvh0a9qTx1hQOuPnWUCoiFryVfir4jz0CPjSbo
         xm6yxr8vUuQJjn+fSO67thdoaqBOP06Gp2Gy1n0qJErAkSlL2CciWEwn8q7B1xbpmN+r
         N6/Gf17eJh0s0FEqlBSP2bw7WARHiol4jB3MHdjiUMbVhxcMQLgOLp0n9gnfO9zFiXzl
         zl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769596014; x=1770200814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eD0aQjQxqkMyhCgn2ts5UcBjgfEIq6adVpGl4zx4qlc=;
        b=kOFOr9S66R633NNfIkKtX/03FJa+OYRfmay5SM2urT1ucNo2CGRLBjnEo8azRXH/jd
         LmmERBysuvaD3ILRr5DET5pgYsvSlAV6V2tZK0EH9IBBA858PdW6AVNun5W6raIHKp0q
         M0cS69wQZbAoYq6bTbXTiIB/zf/9lZCjnmBX3YyAd41ZjV+AQMKn8fK5TiYBQSqcPGpO
         dLRsEIHUJRhFtnjwWIT7WvX772TLhxSSQm1RFJjCzllal+EHjFi7LU21yoCebTApX4gt
         mE3YpXf//RAFinSOqN017O+sLIhAC22JMS5OmBf3/zNh4laRU7uGGEAtiGUb1heMdGWR
         pf1g==
X-Forwarded-Encrypted: i=1; AJvYcCUM+0cZLzr2nF8PfT8S8XPZvxdvnl1CTKfmHthYIi1vXK831sDqBAypohEnyoPdlJoFh0Q8pjeSrow=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi447Y7CO4NOU6mV0vDv6MKp0TMIcrLpgelmZqXV4G4RtnMem7
	oR954yJNhb2f3S3GitTzBjHob8SUhg1SgO6Qo+2xdYsezGCbPqHoN6UNrN/1R3ZHCHKA7NiPWH+
	rBZ4hswZ9tjMsOZnBW+Mw82zjkcw/0j6GXR4TfHcQsI7BI6waqCwIB76Oq48HNWA=
X-Gm-Gg: AZuq6aJm3wSnvMtw5C4OETvX+/o6IYbe30hAydK2W909tAAQ1rElHTdE6MHZZSyrq5C
	MkkCZ5Ouc6cEgdXUh1WFH/Tj2mPDC+KVa77bvumAN3kXCQw7Ov1aA4OmjDVPDz1fuulna3JU6q1
	FTKRwH2AplREraXqXaI+gjt3GNFJRrnJBnUWDirfXEvzAfX+aDkvNc9ebjz1OSAnTq5tBpZ3SHE
	VlFlcXXYwvdbIYY5Pq0wJjFO1qAGyWKLZ5RcEGMjU4454CJWE1rV4wjb+q3yAkx8rz4FihsWQLu
	h8/EN+wT2xw/Zi37gpCdXqF/aVY72nO+97oAxzQzcN/qK1t3mFZscc+INoozcLEuiETylEDyFEA
	fAxd7kgWXI210i2IjvPXsqN8dGLIWN++uRDefh03ST7ste5jEfh4VeXux/REmfptQfOM=
X-Received: by 2002:a05:620a:4448:b0:8be:6733:92b1 with SMTP id af79cd13be357-8c714a7e659mr123180985a.0.1769596014157;
        Wed, 28 Jan 2026 02:26:54 -0800 (PST)
X-Received: by 2002:a05:620a:4448:b0:8be:6733:92b1 with SMTP id af79cd13be357-8c714a7e659mr123177685a.0.1769596013601;
        Wed, 28 Jan 2026 02:26:53 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2e0868sm107030666b.58.2026.01.28.02.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 02:26:52 -0800 (PST)
Message-ID: <bb715bfb-0f6f-47e3-b8bd-6592dad824ac@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 11:26:49 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: clock: qcom: Add X1P42100 video clock
 controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-1-b23de57df5ba@oss.qualcomm.com>
 <fxzm4767ged6hikpblsnh3xzec4qm7dzyfnds7m2ljedhj6n46@zkm7zxz3oo73>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fxzm4767ged6hikpblsnh3xzec4qm7dzyfnds7m2ljedhj6n46@zkm7zxz3oo73>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XqT3+FF9 c=1 sm=1 tr=0 ts=6979e46f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6d1n1Ba-E67CpG4V2ygA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: F_gimlqZnrVef_Q5aTBIhLq6f9TgUzLY
X-Proofpoint-ORIG-GUID: F_gimlqZnrVef_Q5aTBIhLq6f9TgUzLY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA4NSBTYWx0ZWRfX3U3NvdRwnUJj
 SeMK1iAt6+wVqKX7O3x1YcHc7jzVEy0ISC2BIcwauKHMFPPs3Jm+eopl+ayIR/UdGxDddRsa5uP
 ury2yldmUF+p9A4I1e+AwRMNurdXCPU0dF9j15BIprlaX5WgWBaBsu30UCQxwFS9LZjeV+JMCRn
 cWZjY7LMFRjfe43UU5H7WFJhs9LKWreOiEAczKC35X0o4zzLTGIDbMtjUo1gRmTwvHg3nBw1+oL
 dfAxl7JtH2v6Lp5fZ2UYOzDoXbkzH7bh/MgF5CgYMjERaDwePp0qhlewDsOFBOAv/rvROX9ekTD
 IWtpWKTbzKUwDJY/cazIFQtf9cg7r7WEriOnjQcjsqBKNdvMGcEVLpzrqTaz06wBEpiPhBbO9pH
 cpzfkJYpH65Sx4cF4e2+Y6tPqooQhKR8KtUrT7fz69tCwuGsx2pg+zesK2AoTmZeA/T8YuiP6Wo
 YKGyamWxwDtiuL9fH9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280085

On 1/27/26 9:34 PM, Dmitry Baryshkov wrote:
> On Wed, Jan 28, 2026 at 12:56:32AM +0530, Jagadeesh Kona wrote:
>> X1P42100 video clock controller has most clocks same as SM8650,
>> but it also has few additional clocks and resets. Add device
>> tree bindings for the video clock controller on Qualcomm
>> X1P42100 platform by defining these additional clocks and resets
>> on top of SM8650.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,sm8450-videocc.yaml         |  2 ++
>>  include/dt-bindings/clock/qcom,x1p42100-videocc.h   | 21 +++++++++++++++++++++
>>  2 files changed, 23 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> index e6beebd6a36ee1ce213a816f60df8a76fa5c44d6..e8bf3fcad3fabc4f3b7e8e692c6c634d1aed9605 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> @@ -30,6 +30,7 @@ properties:
>>        - qcom,sm8650-videocc
>>        - qcom,sm8750-videocc
>>        - qcom,x1e80100-videocc
>> +      - qcom,x1p42100-videocc
>>  
>>    clocks:
>>      items:
>> @@ -67,6 +68,7 @@ allOf:
>>                - qcom,sm8450-videocc
>>                - qcom,sm8550-videocc
>>                - qcom,sm8750-videocc
>> +              - qcom,x1p42100-videocc
>>      then:
>>        required:
>>          - required-opps
>> diff --git a/include/dt-bindings/clock/qcom,x1p42100-videocc.h b/include/dt-bindings/clock/qcom,x1p42100-videocc.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..eb6c9b7264f8cbced7cfa0001903238ffa168431
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,x1p42100-videocc.h
>> @@ -0,0 +1,21 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_X1P42100_H
>> +#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_X1P42100_H
>> +
>> +#include "qcom,sm8650-videocc.h"
>> +
>> +/* X1P42100 introduces below new clocks and resets compared to SM8650 */
> 
> And then someone introduces new clocks or resets into SM8650 bindings
> and this gets busted. Please extend the existing header.

This is funny..

$ rg sm8450-videocc.h arch/ -l
arch/arm64/boot/dts/qcom/hamoa.dtsi
arch/arm64/boot/dts/qcom/sm8550.dtsi
arch/arm64/boot/dts/qcom/sm8450.dtsi

$ rg sm8450-videocc.h drivers/ -l
drivers/clk/qcom/videocc-sm8450.c

hmm! :)

Checking further, we have videocc-sm8550.c catering:

        { .compatible = "qcom,sm8550-videocc" },
        { .compatible = "qcom,sm8650-videocc" },
        { .compatible = "qcom,x1e80100-videocc" },

and including qcom,sm8*6*50-videocc.h

BUT it doesn't end there

qcom,sm8650-videocc.h starts with #include "qcom,sm8450-videocc.h"

So it's quite a matryoshka..

Konrad
