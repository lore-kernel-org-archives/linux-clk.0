Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA742586E2
	for <linux-clk@vger.kernel.org>; Tue, 29 Apr 2025 19:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745953401; cv=none; b=AsBR9XxJ/6L8qG/Ox0dnPsyKA9G5GGDMnqLLlg05dMwOvQrl1j8F+8Z3dauiCmxnRU6hEjvZoSyTrh54KmyaG52ReI4Zqx/kchgVH+5CLDovIaoXovJffGVQWPSVVsJ031f2iFqJtNSqyj8TAKYbTuZd0DIDyP3I2N19PN7XpP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745953401; c=relaxed/simple;
	bh=enZuKg0Yho7LCctoR7MuGNSzlG3syPAETBOCsWhHujw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ksijM6EyAOJwd8imcK44ytABgUSgDw5TrNHAUUetxaURXJh2xJJ5k8k299P/k5HKHP+3fbxnWis9dUOb6dLRVgpmouwfQV4rdnHt699M762fDPooaYftu7Do6g9EqY1kVe8EEwyql3e/Rlag0MLiBHhwL3O7TYUtpzTYshznsYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gjMpvrBN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gjMpvrBN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9rBr0005262
	for <linux-clk@vger.kernel.org>; Tue, 29 Apr 2025 19:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SFUA+vmGXvWQaDUz0FTdKxJwrF/zWygzDZetk0yUquU=; b=gjMpvrBNaQpK7ZTM
	/lZ+msm1SX3oCVf8quRBsXx5dh/hKVK9J5Szu9lfFVWpujNcNmX02GAfoAfnclFc
	3tB8hFlbTlZ45zUcsrelRS0Puwvn0Cues542/mqCrtnE7kfBvMd0T55F5sjEqqbS
	ghNtliBZCDlrG+Ar8JTr8tlQkw/v4Fi8TI0bzMMfDm5tp3POiQG+STBNb9q+AAF/
	PTnsgIku9XFPdoV60bI3EbjWr3z+YxQxOD0pWZsU3LN/VJxg2Uma5kdsHdRyuIjY
	iXapfUQDEQraQemqlAAbW+Yd7kzlw5kSr0N/hnplH7xI3zj56hfaJfMVo2r4vJHj
	xgCNgA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsbckb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 29 Apr 2025 19:03:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-476783cbdb8so13603391cf.1
        for <linux-clk@vger.kernel.org>; Tue, 29 Apr 2025 12:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745953397; x=1746558197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SFUA+vmGXvWQaDUz0FTdKxJwrF/zWygzDZetk0yUquU=;
        b=OJjOA68MWbVuIIMDFjGBA5Sig1YCe/Sv9mH3Uqh8HBwkx/VYC3OU4lqg26vrJENAnw
         smN4gbSGfGVIh51z21v8xLGjvmA77AOKj3AyE5qU6ZxDD/i9joz0/XzaUq/nC+aasA3y
         qN0Kigc/pv89nNGX1o2RA0lrvIIikKU1mDjK1eivANyEWOa7SDe9SVulxanM5z4CQ9ju
         ASaP0s+WCTHqExXGEn70nucmsbI2VkR0LoQ+/dnEFxxSp6worhHdMFhfCBbxlg4t1LEN
         3qkPLOkzfRkN3Jalwc1kBLB8JyqWNxigkJolRvGW9mWN08R1YjomhTpDBUG8khHGmLsP
         2IDA==
X-Forwarded-Encrypted: i=1; AJvYcCWKdiCF0QACm31+t65Enl56MGWzY6UU5Aek3clL0mw0whZ32fIU+GJq/M/ol1ebwhIqawvZoazi9Co=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCwPkPqfBaxNmmX2CBuD1sPOD7WjfUbhNDyQQJ39gCZUWbOssI
	Jwp7r3a9VDM4fWci/+Gliqf9YJYHNB3ACARrWP5lbN8wYeofYVdz85IbNV8ujJKaJv2TVmjf6dN
	Oa0aofHkbRns/N2YUDXywhzHUkIAETAWS4SX+DxEGlNuIxoDmng0CJc0PkVo=
X-Gm-Gg: ASbGncud4i4f2jEOrPvOK75e6+2rJ0yw5ymSx5yQon80lmdMCedojReWCt9Tj5PlIhD
	dF2U0/a2P47r0nnTSzhExd6lv50UJGn/9ttT5MLbdFj5alFiaCEfdVnAi842c4YUYM2U55NXEIn
	9RccIGLKfSx3VU7lERfwPiDKusHOlJPoHPd71j7G+NoXIuXMLeK6mmPrFjtdKy9lLsLR0ST5YHb
	gjdr8yv/9+oW0mOw+DBAoQchR826Mo8PA/m3ev4hooWJm0CRTrq7GGv8CA/BSNKktQ/k72yADGQ
	zqLqpGZqFD/6pRMf85NQPfK/L8aU2HGb6ZgCsak6JGMG4xoXIJXGvzE7OYZvCgXG5Q==
X-Received: by 2002:ac8:7fc1:0:b0:476:66fb:4df4 with SMTP id d75a77b69052e-489c0ecd9b5mr1232991cf.0.1745953397411;
        Tue, 29 Apr 2025 12:03:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4oXGFJFE688jinn7yYFdRyAJwph4UBQHGatqnUkCpVJYykMoY8ucb0lhtaDPLXOThnrZHrQ==
X-Received: by 2002:ac8:7fc1:0:b0:476:66fb:4df4 with SMTP id d75a77b69052e-489c0ecd9b5mr1232631cf.0.1745953396777;
        Tue, 29 Apr 2025 12:03:16 -0700 (PDT)
Received: from [192.168.65.43] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6aebasm813646966b.128.2025.04.29.12.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 12:03:16 -0700 (PDT)
Message-ID: <1a49959a-9f76-40ee-b221-c049ebc2bb09@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 21:03:13 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add Qualcomm SC8180X Camera clock
 controller
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250422-sc8180x-camcc-support-v1-0-691614d13f06@quicinc.com>
 <20250422-sc8180x-camcc-support-v1-1-691614d13f06@quicinc.com>
 <a4149ac8-7e47-48a9-84ef-42aa367d014e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a4149ac8-7e47-48a9-84ef-42aa367d014e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDE0MCBTYWx0ZWRfX7KtY0nf9kSFt De+8ib1RtLRrW7W06yk0Rh5Q+CA2+6Sk6QWGxFUrknP0tFEEE/7YiNTcDODoA5Ue7SmyMVSnP2F LjfXnf+Kadahwlv8WPDu5IO7aJHxDdOvJpKZQZNkF2cl4emt+9o2onDFLs2MDbRksImU7+Oxb5q
 jeqneKqt+RjmjrfTlx7sh5Cs9D3HYtZWvxVQ5YPa7+ak9Uvqk4TWBKzIlIfEuQoCqJ19glJ9dNq B8JeYvrRzzdqiw9G79Ri5vRrZhSW6gL2E2vWoPuL6qSzSwqmJh+irmHBUhn8RG9qUPRRbChNpbw Qe0pxrhzg1lOr0xPV+oImfRY5iU7LNgdikXE2rV7oZhIxQ9mNZPYzB13Jn/x9+uiiSeNpMeU4Xg
 CRyiLn66tbE46BD2c6VcqiqAtmSW7AfiilB6esjGFwQuontWoSUOn9jYZJvc4g/TONXw1/r4
X-Proofpoint-GUID: ogjvy7UJFuKDJjuGG1X32rS62o8QSq5o
X-Proofpoint-ORIG-GUID: ogjvy7UJFuKDJjuGG1X32rS62o8QSq5o
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=68112276 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=CIINWzuxR8hvsKXtIHkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290140

On 4/26/25 4:03 PM, Vladimir Zapolskiy wrote:
> On 4/22/25 08:42, Satya Priya Kakitapalli wrote:
>> Add device tree bindings for the camera clock controller on
>> Qualcomm SC8180X platform.
>>
>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> ---
>>   .../bindings/clock/qcom,sc8180x-camcc.yaml         |  65 ++++++++
>>   include/dt-bindings/clock/qcom,sc8180x-camcc.h     | 181 +++++++++++++++++++++
>>   2 files changed, 246 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..b17f40ee53a3002b2942869d60773dbecd764134
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml
>> @@ -0,0 +1,65 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,sc8180x-camcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Camera Clock & Reset Controller on SC8180X
>> +
>> +maintainers:
>> +  - Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> +
>> +description: |
>> +  Qualcomm camera clock control module provides the clocks, resets and
>> +  power domains on SC8180X.
>> +
>> +  See also: include/dt-bindings/clock/qcom,sc8180x-camcc.h
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sc8180x-camcc
>> +
>> +  clocks:
>> +    items:
>> +      - description: Board XO source
> 
> From sc8180x_rpmh_clocks[] in clk/qcom/clk-rpmh.c I get that there is
> RPMH_CXO_CLK_A clock also, shall it be added to this list then?

_AO only makes sense for CPU-XYZ clocks which (almost?) exclusively reside
in gcc, and most of the time they aren't even necessary to describe in Linux

I'm not sure there's anything in CAM_CC that would benefit from it

XO_A is in the end the same physical clock as XO (or at least used to be)
except it places a vote in RPMh such that the harwdare takes care of gating
it upon cpuss suspend entry


> 
> If yes, and taking into account Konrad's ask for GCC_CAMERA_AHB_CLK, it
> implies that the new dt bindings can be omitted, instead please consider
> to add the 'qcom,sc8180x-camcc' compatible into qcom,sa8775p-camcc.yaml.
> 
> However still there is a difference, qcom,sa8775p-camcc and qcom,qcs8300-camcc
> does not contain 'required-opps' property, it might be an omission over
> there though, please double check it. The ultimate goal would be to get
> a shorter list of different camcc dt bindings.


for required-opps see:

https://lore.kernel.org/linux-arm-msm/44dad3b5-ea3d-47db-8aca-8f67294fced9@quicinc.com/

Konrad
