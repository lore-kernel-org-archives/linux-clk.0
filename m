Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60872F5316
	for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 11:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758885281; cv=none; b=vFaT3n0j2QnLSYZFtrPdIN5BbRcVYB9ytJ/lmhXhvhLAKfBMJZ9k8HtT8NqWpg41Md2+1sjWyoIY1lU2I+d+bETbgIOYWkobcQviTWiYBGRIXf/8eUtM567L8DPO8cEu4xX0sBar0uTO6l54VGtEbI/Gw3HY1ISJOAC6E+bfD4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758885281; c=relaxed/simple;
	bh=iDSw11pyqhbkgwpWYT4ZdIm+jKHusW8fE0X5DlrCeps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ebChi8oBV3HRq0MqL6iSYyZpzX058OXWu/UJMqq3STaB8lX3d14IaSp6kr8ouJ6RGr2sOw1dXvTfBtcy0vFnsze4MWz1cSltbe+ygtmaIXyuVEUT64qM1FGVwcoAW5GmlzGVEZTgLNn8VL3Sd9OO7h4H6sn14tBQCBpRE3W+bSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HM+TxST6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HM+TxST6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vcYZ009669
	for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 11:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v+mnnPyYM8R/xd6RV1KS2fBetyQnGZ7XuXS5A/9vnvA=; b=HM+TxST67Rpp7mdH
	8aW6xAI6VB8Ar3P4jmTQbwZAaj5FTztaFpXnrVr0r7k+7fXvt/DP93az8OLYOc87
	m0DCiP61MsORkID1E10nl98bf3F5+CUFtwpwjW5O/VZsI287MzG493CW8KUP8MRv
	MkXsCRuWcOygkl3R/Ej3xxdFzrntteW3H5Ej6p8RxebkfMlq6CMcEst09K2wLRv0
	TFLeCDAh9iefz9zqOyIKwqXJX5zzo2SVo24KHsI99dWZfM3CK/MBmwN2jD6GfSRV
	uTFo+QHkzwELffMv6fJ+gfjyU4NH62c4Euk3NAxSt+eD8nIktF8ab3MXYFnWoG0F
	Sq6ODA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0vtm8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 11:14:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-82b15c1dca8so79648285a.1
        for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 04:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758885278; x=1759490078;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v+mnnPyYM8R/xd6RV1KS2fBetyQnGZ7XuXS5A/9vnvA=;
        b=TcZjXCoM5hMHOyVXs8/lXxJr77DqRWqP1JSUfxoRKq30JyhHShNW5kRIuk8wp/oOYd
         ErKzFaV2Jq0LHvbDigsE1KZQKnDgYMfhlhCD/AeQABQKYk0WeocpmgA52rE9PRZijy2P
         rR3wBE3PozXcoXgPwmZWyFtHA4Ph/6JCWYp/rFKRPXA33OyT+YcgxymbejnCMldmwGAz
         fzfrw9bspoDM9ppurQdeOrcQl0JUJCnVpNTI3ePrJ8vDS6zd13lwDhE/8bxoU2HifSFf
         zJtZY7yuNuL9j0WJ1jwp8eVfT785QF9SIgo+02VYIawONYfW8G9OhbbBDzbcIC1GH7vY
         hucw==
X-Forwarded-Encrypted: i=1; AJvYcCWFI1YVesOz3egYl0bbOMPUtvIW6cXdoDVTLYDt/1zWt/GzLHKCep17yUEcy9c8m1Gy51d8uK5hVrc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSFftzg1Ds51z8+pWZmL+3lipLM6zkQiqs9bIU4Zyh7U7ZeMMB
	KXSBPLsb59o++ExDsta4XhA9GXArrjZ7mjQM8e+wCzQ7vJIF/ovvqydpBzLEeUR96Fj1cPXPDJR
	eyYhrEeiEhqS+KAUT/NQLdbkanZ3I4C2dunvSBK4qpSIBY43rpYivpg4whoR4sSQ=
X-Gm-Gg: ASbGncsQivB2hRQ9OliS4rz7Pl4xGt9k/5RhpKUVHJPHD3wLldUs9GcqyOdSvfhSuwu
	XsIWMEFsWZOXMP0EWMOqjYYfBmlq8A9D9UYoa+XEWZc2sCR5vmTuxPr5acR5wcti47weHZnaYgW
	bG/CnjkhBpWLvHzGyFdoJLFK2IZPyHiAHUtYAiJ/ytuor0HfIgQB6/jx80OdKBrjfk7XW2+aFjA
	TcvOb5CjOhvuqoP4aLHODOz+ZhYxPWFYb4TLgcm1KCMjBVBnSrlCelb7Gbb1p9go0cERBZ0w9Fi
	wrr2vVxYH+pY1gkE7fKcw7Iv6NSzKi9Wk/WhA0DeFZ/dhCGL5GYIUzq5ocNdiXTWwbVSO6hos4+
	Zw8vHMES/d/nuVH1XFw9y2g==
X-Received: by 2002:a0c:c785:0:b0:801:2595:d05d with SMTP id 6a1803df08f44-8012595d527mr37523756d6.3.1758885277681;
        Fri, 26 Sep 2025 04:14:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVyVqDH56Rhc9V37bZmDRMzW77b/9dCZm0TB6JT1QzTWqi62x3w727VCI3OQtYuS6z3lWFeA==
X-Received: by 2002:a0c:c785:0:b0:801:2595:d05d with SMTP id 6a1803df08f44-8012595d527mr37523606d6.3.1758885277246;
        Fri, 26 Sep 2025 04:14:37 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629badsm2664309a12.9.2025.09.26.04.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 04:14:35 -0700 (PDT)
Message-ID: <4777e507-c329-4c22-a45f-099fc57e31e8@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 13:14:32 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: qcom: Add SM8750 video clock
 controller
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250829-sm8750-videocc-v2-v2-0-4517a5300e41@oss.qualcomm.com>
 <EAIobHjo8rM1e0LwqDqaUllC0qjV5ElMMhk6KgT1oNnFt_-k7ctM2_6kym9OjEtse5o4pOFM7yCkXgrSGRZhuw==@protonmail.internalid>
 <20250829-sm8750-videocc-v2-v2-2-4517a5300e41@oss.qualcomm.com>
 <d965949c-a7a0-43df-9bf1-c1232fc7e38e@linaro.org>
 <555039f9-a168-4a9c-b45c-d4583c553bc9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <555039f9-a168-4a9c-b45c-d4583c553bc9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DzdpT9-FPvHbe7SnW1aWzkHdS4oV6OdR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX7OrCmGymp12Q
 im8ZJrP0GjbBqwjgI8wQKWHbWi2cujn/UNVceE5XetzgmTqxLx9w+tYnq23AmDzaz3e6kJ+FyUE
 1TzqN2hN+7/9rblWDtecuNKw95aQgRZxNtQftDWJ7gSU170SUOXG+JmkT1vfBmqvvlI7QGE96ep
 p6Fsg91TvfQ4PbM+PpQfIhdqgYvAhj9jA/qh6Z6pGru9qAuYED1KOO1GeGhAuflj7/87pS2ZFBk
 N/KYqfcZYzYGu/gPd039hosBw6P/nYgtDZcgEWDTK3kj9aTLU/Y94SLnPSmVprhgfPlKW4cBxyP
 rxTOJ1G1NODbWpUgXakvfBcPZUXgdcTNMYol35JD+Qxj4ilZ5UMNyBBu6YiVrC+TkgD5mN6vC5Q
 yrD8p/gOu+6EnDG1sDUcPtarb94KQw==
X-Authority-Analysis: v=2.4 cv=OstCCi/t c=1 sm=1 tr=0 ts=68d6759e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=pvYLOa8aNrQGL8lVqOcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: DzdpT9-FPvHbe7SnW1aWzkHdS4oV6OdR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509250171

On 9/26/25 11:18 AM, Taniya Das wrote:
> 
> 
> On 9/15/2025 4:28 PM, Bryan O'Donoghue wrote:
>> On 29/08/2025 11:15, Taniya Das wrote:
>>> Add compatible string for SM8750 video clock controller and the bindings
>>> for SM8750 Qualcomm SoC.
>>>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>>> ---

[...]

>>>   properties:
>>>     compatible:
>>> @@ -25,6 +26,7 @@ properties:
>>>         - qcom,sm8475-videocc
>>>         - qcom,sm8550-videocc
>>>         - qcom,sm8650-videocc
>>> +      - qcom,sm8750-videocc
>>
>> Shouldn't this be qcom,pakala-videocc now ?
>>
> 
> As of now, Bryan, all of Pakala is using the SM8750. We can migrate
> everything together to maintain consistency.

We settled on keeping new compatibles numerical for already-numerical
platforms (except board compatibles where all the fuss was / as it makes
sense)

Konrad
