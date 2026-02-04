Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50B734CFCB
	for <linux-clk@vger.kernel.org>; Wed,  4 Feb 2026 17:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770227322; cv=none; b=ObQJ0dYEn5A9/rWqmu28IFtqWj6KAgygf3l/vBd9Fz9jGPy95PHLGIrOCz7lbtaz5HJpigd+fchXS3hqLS0jXGVoP3Sl7I8dk54j9EBCVC47xtoqCUvl6hGzANKW4wpL9A2MoN7wq0GAy9icqxxkjtEUfXPIDFcVKGtBqHhENAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770227322; c=relaxed/simple;
	bh=FY5KOFwV2EFk53S9AZ3IAoLzrRowA5qsX+UJsphMmGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CDYkcxBRf+so7sZxLPbIY0X7Du18b6bzPoGIdxglRrhpDeP4+UZ+WyX3beDcgAktiUCS17ShiFUIXfybigDrk3mFiSmG+cMiuK4BFu2bwo1jnZQQeyHLF7cg68SThbUBfCyRFEKiR/a/SrLPXpl6jnzGzEIK/3J1kgX+ldyKX5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LqootmT5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eyD6Djpq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LqootmT5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eyD6Djpq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614EGJ9f926293
	for <linux-clk@vger.kernel.org>; Wed, 4 Feb 2026 17:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	teCTZ2u4pLkxbNo7nhxx4Z5y7v1VUqnsATNaJkSMoa4=; b=LqootmT5y0JQ3I44
	LczW4Qitg0GR05D4cQCa9USib4K5ODFH8j0gHa0GvGhGrfPl44kDeA01y3yiV7aS
	jXjmASeQQwWzCzv0P/z18CBVg0jBXrBmDNcA6nzR9N3z+eyqxfNblXqT9WtxEl+4
	B+KuxCmDI/bRJSD1nyot5ToBtFqgJvcYoNeJW57X0grm8jC/WlT1E4CCwsdjEE91
	4ySI7WMPNS+QftIcOuE//9XAp/Vva71DjxTf/gcFgnTFwp9M0ot1KuM0NmfNdojv
	2VhMZTux1H1LqbHj4GrpNZbKmSE9bFYUW3ywLc8kgjSuVKTdNwCWzkNFPbaRG4ep
	7kVVjA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c47qv8r70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Feb 2026 17:48:41 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8232bde979bso57340b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Feb 2026 09:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770227320; x=1770832120; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=teCTZ2u4pLkxbNo7nhxx4Z5y7v1VUqnsATNaJkSMoa4=;
        b=eyD6DjpqlPUcYiCQ8Pk9QdpTIZLCNfxxObEdp4iGc5ZiZyLBk6rNhLKag7E2OAYxoE
         UtrW8ZL2lGyhGoedTFz+n6I+BQH62u7pioFCsltHyIclzjpQ3ZpAqjhTYIP1h2DxQysR
         y8oZuaEBhhxil4RxbStAta0EYsjwPtThylRk8//1tCsBxfCyPhqTH4GmGr1yPpT/+6b6
         qD80yfiRnhHduh5Uxm4mF6kBJVI61PDXyu2YLPIki3CEMGRPss1fcU7Uq6gVeWSdMVUo
         PvdZ1CupW126rNCVlNwc+v1msy1OsXaZLkqa/jcQTqGzpXzYyHgne+SDdsvlhKNUhbQ1
         eeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770227320; x=1770832120;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=teCTZ2u4pLkxbNo7nhxx4Z5y7v1VUqnsATNaJkSMoa4=;
        b=WigTnjiqNnf56f0m75l6SsKDslwuaAdpm4M4A/e+YcxBwW2J4UAylcpZ1bgeCJ5h5c
         gkKzds7OUaHUYfnJJPHsRuy8jwZWJVNZUGChXUT8esnETFNcfRcJaFAU0f5IGyjewhOt
         TlhhT9aVxZ5gvDBkggJ3y0IiF7RAG6WeSGWLbRBi07MQgnquNV18NeJX7R5+ORndJSot
         /ViVUcW1rpE1TDlNb+psEM/OoDh+BxhAvRJ0CDbtuuK/8UJOTkULoqv1y6vCKfTLetix
         uJblLwmdNN9ozwPEp0W86JtEmwcd9EJzknrAgjoCkwjTWrJyvw9SOH2ks66UmJ0+mTLg
         nRxg==
X-Forwarded-Encrypted: i=1; AJvYcCVb76To4UQYtzAgWqHpaqBQD99YjpQdRUJx9Dqw3UanojdrGi47FQnxL8reB4Wv3xWNixsjKmRwPtg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU4OoAEuQ1wkFdHXNe0Il8BejQPTV0LcXICMB9pv2SAj5lbkHr
	YCA65tpfn6dE3GtnaRJE2Rh25KSp3fOHGdcIGx3SX4siqBH271fxTTABrpBpm7M30MqFNJisaSp
	fWC6P8ryMJe14rdXsxrsNFPWVZIjDW2wo9HSYUhLgd+mEouR3Xos8uCYv0wQqG2I=
X-Gm-Gg: AZuq6aIL3UACxo+dl3nzBr08mGbgN9DMEhNi0F0bzbCkxnl9EL5CiBAHPFEYhacXl2v
	y8nDx9qCd4pWYxdihkbELNrIaJFF0xRfZR8nHCQQ7cFFGy5YwFknWgIPNJlA6SI2N6e00zxU6GF
	1GdiMFMelBFgPFkP2z4boSWBzhjkoQRLr+Wbmubt3ER/X9+iPIuWnl72e54tJ0G9HaK/6u4LzBe
	NzosjWr4b/ssfQCsxc6L1IJYIwwsubSHAVaxiLfgGiOwHzKx7JN/W2JU8r2wXnywrKVLhUcrNg6
	agjQ4pBz4KDYjOAp17ZYFxm6VcSdqN1ZOUBHBsFzVBa2RTfezTwH4bdEXMRH8kklKY+ER9d5xtA
	ylsJPl6qN6gNVX6TZDmx9z7gU24td7IAPNIyyrWFIONYT
X-Received: by 2002:a05:6a00:3e01:b0:81a:74e5:a4cf with SMTP id d2e1a72fcca58-8241c19e37dmr3356507b3a.11.1770227320389;
        Wed, 04 Feb 2026 09:48:40 -0800 (PST)
X-Received: by 2002:a05:6a00:3e01:b0:81a:74e5:a4cf with SMTP id d2e1a72fcca58-8241c19e37dmr3356489b3a.11.1770227319922;
        Wed, 04 Feb 2026 09:48:39 -0800 (PST)
Received: from [192.168.0.103] ([124.123.178.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d4b8c8dsm2974606b3a.69.2026.02.04.09.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 09:48:39 -0800 (PST)
Message-ID: <838b9868-dd6f-4264-8947-d56f5a781946@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 23:18:31 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: clock: qcom: Add X1P42100 video clock
 controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-1-b23de57df5ba@oss.qualcomm.com>
 <82c6750d-8fa7-4837-b537-8fc6df9841a2@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <82c6750d-8fa7-4837-b537-8fc6df9841a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GaEaXAXL c=1 sm=1 tr=0 ts=69838679 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=2H5/5ZkxJs/wMzWGxXwROQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BjO1pcXgz56rAAoD9qIA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: I1A-0OlztU5IcO85fJmuNOQ_GU-4B-8L
X-Proofpoint-ORIG-GUID: I1A-0OlztU5IcO85fJmuNOQ_GU-4B-8L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEzNSBTYWx0ZWRfX2JekH6cs4h1R
 YepESCNBbqTyuMqhcHxKjhkASXmuBlGdcshZ8YsA5cxnKm8FCYPmGmu2ry32LShiFIgjsfPo3vc
 tcLcrMSikjmaPDxfsvKP9smRm+jn84l7fq/84/XR8xk9ZwMgmp3ndHRJpphKIuc4vLw6su3sS2S
 DFSgQMx1JYv6gABZlQ9GKtDLVTKDW4jhPKSxFElbRhP9OV4FEhC3JjHMCRnSuhdGn6OiLUJMori
 APt3mlC/RRUgPRPaweWEBzLWn/Y2LCLMMfAiGP6EKyKaZVGel/n9ZFUBMOfNjl33IlNDM7mYiWZ
 AtUV4++qEitbJSLVrqNx0N5u7lpWTkU0Wtf+8YB60crGYR/KoiA8VICa8dyPrP0L8n5rHMGna63
 URCZ1hhIkg1GCCPeZ/Skm3rtNla7t3qvdjIc1+hjd1gZLFBJtggtnc4ypEAUf63qnrIq13gTzi/
 SZB4zf/P9zFt45WmJ9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040135



On 1/28/2026 3:38 PM, Konrad Dybcio wrote:
> On 1/27/26 8:26 PM, Jagadeesh Kona wrote:
>> X1P42100 video clock controller has most clocks same as SM8650,
>> but it also has few additional clocks and resets. Add device
>> tree bindings for the video clock controller on Qualcomm
>> X1P42100 platform by defining these additional clocks and resets
>> on top of SM8650.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +#include "qcom,sm8650-videocc.h"
>> +
>> +/* X1P42100 introduces below new clocks and resets compared to SM8650 */
>> +
>> +/* VIDEO_CC clocks */
>> +#define VIDEO_CC_MVS0_BSE_CLK					17
>> +#define VIDEO_CC_MVS0_BSE_CLK_SRC				18
>> +#define VIDEO_CC_MVS0_BSE_DIV4_DIV_CLK_SRC			19
> 
> I checked a number of platforms and the _BSE clocks are only present on
> Purwa, without any explanation in the corresponding docs.
> 
> What are they used for?
> 

These clocks are used to drive Bin stream engine, which is a sub-block of
video codec HW, which seems to be present only on Purwa.

Thanks,
Jagadeesh
