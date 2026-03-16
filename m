Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B211621B185
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 07:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773645402; cv=none; b=f5qRyR89NXTGwnUiEEO56W54jVJEvGH7cBLEoEsRGFcOXgNABU0VTaKlpLehjqeDzEBya2ZtviPXjV2y3UIJvvAV7aX+gTiZI545m9U6eIMms8DOoWBbDeVEUmWgsjWgNK+kJ4XVCjxfkp1UccS8tHZcaoS0ndh3JU3UwvmeGjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773645402; c=relaxed/simple;
	bh=Ttsz8q5cDNZexWmXXKaGyGp1lEELQQ1lNOBljmUtN/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hhHiIIbSBq+YDQDZaSnV36TJk4XrKrn72yMLigrY1F7g0ZsU9th8ZsUlXO2p0VVqWCNubx8dsu9clbKZJ2aGZd5SMIXhTdL2QKRL2VT8NzoegJjuW0wVwVRbyk+jDhag5FOpo5Nqs4yhpqmV7CM7MVInSRVCEsZPfBYzFTUZzYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eYA4RzvN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HniAZcmY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eYA4RzvN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HniAZcmY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64d7G662960
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 07:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2AfTd0j3qDjIpPj5+9F/8NtKQlbfzmA3Mmk2X4HiLnE=; b=eYA4RzvNicB32xuN
	g72yxltGFGSifnl3joSG+g93JglS4MYtWrfxkybyIL+ag+BnaHOXAbyAjOKA0obr
	8MSxQUbNwIvo1l4f/At4/T3Wpw9I1ZS/ro9QzQ7Xz4RK8x5Xn6+eaXxjblyg+eds
	2gtHYDCRAy9wujm2JQ+BF3aUT6jvePF5kTY5t0YkiEG5NHrgcHOD/pFYzUXR8BBy
	pMfzkJo/kz+PbyivDzZdr7KWmsmhYWtfN2TSTTse2E3kj5MdxN50mpCaWlJNMMAU
	gkUYOdSLfEbYuU+HmT7qAa2qi7puNr8k8nHLoke4N98pvhTpWCc8BddaaeasUmQ4
	gSIwKw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw043mj24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 07:16:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aebfa0af7dso273809275ad.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 00:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773645400; x=1774250200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2AfTd0j3qDjIpPj5+9F/8NtKQlbfzmA3Mmk2X4HiLnE=;
        b=HniAZcmYxrWTXuQdTyuiB4QO4D7wT3KLhoccWXXQT7DtNv12iTbYDFsozCGm5k1wX5
         AlM/ztBZDHJiAnXlC8SkzkMjpJ5tmRKAu3XzhwszbMPc6ZSmHuBUI5C5h++p+yBV3wg5
         PydcQBHvwQd5QFOLClD03XR7vjGzGZonjojuhpCPLVNKsyiigHbEm0Q+/s8by+x0JKb4
         TtYqOqCbioFnGk/lOAkklas5xmaQnVaq5I+WoF+JFi02T5xGIZdD6BuQUc7y8HmIGy80
         Qmubg6G86VF+zr5PzrqCzhxdI6VXQx9UIvvge3y1EN09LXl/bJkYkL319jTrn2GjP3+H
         E7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773645400; x=1774250200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2AfTd0j3qDjIpPj5+9F/8NtKQlbfzmA3Mmk2X4HiLnE=;
        b=Wjzy1ffggbcGOB9FoJkF+yCcazRpLYNU3r1BmU0GCcb3zQ6ulBRhqXh9v3PfMrTy2i
         p0wdzAXOrX+Vxah+jv7A5Qrzmx8dICl7/tYLeBUyU+aalTAqGQiP89U3P9ciEqU20JOk
         P9lJr4jxZDkaaV+FhVMKGZihBFeHSpzRAn4u/SLk4hhjQfcp10xf26+3CH89k0+f3sIM
         jgGCJkvLMi2vf0MrlMRuKIAp7sH847QFYQcm8PCvH/YOibC/FoNhXQ77X3LDblMD4QYZ
         Hz7CPh2+d6+yeXJ06p76LEaox4Gap1Y5yasubLa+ddzUjKskJY9k73mwFTTF+1ZYQEOb
         8wfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlhp44ZDEoOtSR088EYNZxGoWdLD4FbrsC5/ZfPflCuh/sMTVu+aS4GeiXNInVWdg5NPNGjzOvkE0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX3Qw1OHl6Maz0v3nVwWVUoVKxKr3CiDys0gi8KfS8zQPSoiZQ
	0p+MTLg1IfsKva/c065au7r3XWZ2k0etWJWF65iY6Wr/8XUZd0cFy875i1Sku8eBG/XJFfD4mAp
	y1y3M+rLofoyd8/t+XZoUi2c4xxkqiyQbRfT6fjtgPThprzzxQ5JD6y4BlmnRPy8=
X-Gm-Gg: ATEYQzzehNkBP7ai6zc2a9oH4UGM5D5xv5wSlQ4Tv7Qx/7iGqVddGSYjNkE5AnkHdCN
	oYLBrHPZYmD2S2wny7ZYMKqvXTHp1UFwNx5n6I6Vji01JEX3653UVV4lowggtFJ8JL7XxSntvzy
	51jaquweliIzgVXXjbbHVruUZPX0eXE5kc10mQz/FkgPkMlseb6q65772GGHUv2Lo9g0rY/4gza
	foc6xw7m5zG0oqsWCGA7PExsutFFHdne/VvRX4w1nXnzyT18Nj09/APkbXzZJWw2xFYArir3OaU
	pR80frJuXoV3E3bmDobGMB/OZlglVvIFRd7GtcwpEwMH0CPnWbqCpnPMzC86eWOjvfrOQvDNByr
	cjJhbpS4QkHGLy3r/zZ6fP2+PWX3hS6LSs8XsnQJrlp4ORH13m8KKesl3Ew3cR/zVQg==
X-Received: by 2002:a17:902:dad0:b0:2ae:57e2:9b32 with SMTP id d9443c01a7336-2aeca9b8bcbmr127501925ad.8.1773645400333;
        Mon, 16 Mar 2026 00:16:40 -0700 (PDT)
X-Received: by 2002:a17:902:dad0:b0:2ae:57e2:9b32 with SMTP id d9443c01a7336-2aeca9b8bcbmr127501515ad.8.1773645399849;
        Mon, 16 Mar 2026 00:16:39 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b05d95796asm9603665ad.52.2026.03.16.00.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 00:16:39 -0700 (PDT)
Message-ID: <a8e08742-c6e3-4b62-a97b-bc2ff26f03e4@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 12:46:32 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: clock: add Qualcomm IPQ5210 GCC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-1-fe857d68d698@oss.qualcomm.com>
 <20260313-demonic-ludicrous-lionfish-fbbce0@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260313-demonic-ludicrous-lionfish-fbbce0@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA1NCBTYWx0ZWRfX/gcq3y0qP5+y
 T4p6M3V12yldXczL7gaiWFL580KjPzt+qLZiXyLd9bbE9hNWMrrg+GzWtH7TwZM//Tbn0SCuVdK
 v4DyD7QFNjaOh7mJLcXy4cP3biFuc6fN63KFkyYXi3vVqnuARfT6ShuzngQ7Qwedylc0Dne/IDJ
 888jJtvqOhbGlbni7Essvg+bRkIBLfoOJcr64yI/ROILcMN51WfWzsD3iTMkY39b7s1RaKL2ddw
 3A8RXZ3/CWharH9Y9pWQS618oajf/0WMEspa9pEP3dFxeZ/YpZGEsdqTsRom9AolU/fOaRGPSGU
 fG7GCWg6XSmdIls6Vtxv2ARKfJPknQUbS5PDvKGS4v1Z4TCOumZGPwxpTI3zPlGDVYqfisjFdrz
 7Qmee0RGG5/4j7nJSy/r0HBAE8HKI9kKOtl6twGRoQdVOErCGpEyO4mTL9NlFHl/2WDbshgjVjn
 3vIi4Ud2OwZWT5YN+pQ==
X-Proofpoint-GUID: V1-y7RJopSO8X0Z8ITdiCx32732M2wAZ
X-Authority-Analysis: v=2.4 cv=fLs0HJae c=1 sm=1 tr=0 ts=69b7ae58 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pmxRcdgLKSYvSCRR0ycA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: V1-y7RJopSO8X0Z8ITdiCx32732M2wAZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160054


On 3/13/2026 6:52 PM, Krzysztof Kozlowski wrote:
> On Wed, Mar 11, 2026 at 03:15:43PM +0530, Kathiravan Thirumoorthy wrote:
>> Add binding for the Qualcomm IPQ5210 Global Clock Controller.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   .../bindings/clock/qcom,ipq5210-gcc.yaml           |  62 ++++++++++
>>   include/dt-bindings/clock/qcom,ipq5210-gcc.h       | 126 ++++++++++++++++++++
>>   include/dt-bindings/reset/qcom,ipq5210-gcc.h       | 127 +++++++++++++++++++++
>>   3 files changed, 315 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq5210-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq5210-gcc.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..aeb5d9a3f8322d5d36d2fd19a1d23b275efc34b3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq5210-gcc.yaml
>> @@ -0,0 +1,62 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,ipq5210-gcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Global Clock & Reset Controller on IPQ5210
>> +
>> +maintainers:
>> +  - Bjorn Andersson <andersson@kernel.org>
>> +  - Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> +
>> +description: |
>> +  Qualcomm global clock control module provides the clocks, resets and power
>> +  domains on IPQ5210
>> +
>> +  See also::
> Just a single ':'


Ack.


>
>> +    include/dt-bindings/clock/qcom,ipq5210-gcc.h
>> +    include/dt-bindings/reset/qcom,ipq5210-gcc.h
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


Thanks!


>
> Best regards,
> Krzysztof
>
