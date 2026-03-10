Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D6739936A
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 13:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148958; cv=none; b=sRtGSCxhhYxBzwDUd9rbTooc3xcU3/jgf+OY8lHoFTgWN/ym/Hg0H5Un1K2UUW0MxtzkDItX2F0w4wjYRBpzwIlUZpcCdZ0NOU3kbIQiLrb8/pgQMNRn+ZcqTztxDorP1fGVfKq9miXfZNUC+iVAZ4EhwDjrFhSSmbIyqXtR0Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148958; c=relaxed/simple;
	bh=aFXkttyidZ3E5rhvNe/MitI91YYrfWU30YdEHGUC4DA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l7O6grNVnH8pyvOyBRAeOrTPLZOUTxcu+QyHWKWeoeXkNvGYQiCp7Ne/EUZw/v97t9fFI+8S0MoHZ3XaeGWcutS20XeW3gnj+X5Z/CBAN9AENiOubvp+WJWTHwV6aHo/kPqUwk4sXTi52XTw6V85SjzUzL7HDs4DgCieHz/MSxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bz/hlp8y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AcZ/WbWp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bz/hlp8y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AcZ/WbWp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACafS41503512
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 13:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mSPtImOmRAQp7Kt62S2wn+SalsHspQ26Dxc4l6EJ8Wo=; b=bz/hlp8ydtixW8M9
	Dpx5pQnq/B6i5+v7eDqobQ1gnp6C3HUmgohDHRrlRFsG9ccTIHUZMNtTnIHjrOTN
	NuwZCGsqYMpxIPsD4BZQIYMKlI8imC0uLGlc/6Dc1dNwzr+49PH8UGXMRTiCU4UQ
	wL4IAsmkoul+a29xT4q+L21Wgncixjl+18F9V3VwdDRrcBq2RlV3hKS6aDFDafAo
	WuH262fgdFNr7OuoDfo5rm/lz4VszhC/nT5MLwmBo0K9ADrABTp1HW8kOaRcUfsG
	CeXbEyH0tNoTlLmCnppIwrvE5AIEaWdhubGhfUB/1btZVhNnqw7QHr6Gaz1phkDK
	1UJfOA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctdf8hnab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 13:22:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb50dfd542so872571385a.0
        for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 06:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773148956; x=1773753756; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mSPtImOmRAQp7Kt62S2wn+SalsHspQ26Dxc4l6EJ8Wo=;
        b=AcZ/WbWpj7PsbtsQlAQiXNOD1EUV5f4SJzD6EEheZg9w3CSzBgQJmrIjhryDBwHWeR
         aKC+1rOleY7YLn2b/UkZJWwUK1tJEtTW4uxP7lJ3eCLoQHSz226Rs9TCheVn6tF1Q8R0
         nBhOV2Bi5HENpRmGrPRt4SZ4oRLZuQjkZLPzYxBKbaXswG0Gy2rP75yg+pjN23vaJI7X
         MNViHb3kB72ybiD2sUFaDi2UFGaiILEn0t+6YqcW2tJs4ZK56Vly62v19NBByikRiH+x
         nTj15ckiAbEU2hUPgIZIit4Ofg5Mr3qH1ShX4cF/P5QgJwaVLEpZ5fkk8/1AryL9Ukpq
         5ZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773148956; x=1773753756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mSPtImOmRAQp7Kt62S2wn+SalsHspQ26Dxc4l6EJ8Wo=;
        b=iHfgLuP1BUlAHbcPSYQij8FWUMEwCE5eU+CC4eWwVJii8IlDmvwy49mZLxrAsM3y8U
         z6u9sW85O2f8qn1D1dv4RgWQdhlscvaMf+UdV8k8uXyHg9Gresz10r6Yca8tGDdku8x6
         384u6GIwvxbnsWHQWw8uVoZtLgT+TxnDLqIlnG2l7hP3oFVBoqNY41ALJC6S1t/Gb3Op
         ddOCeOSW/f46RwCk1yIlAIhWW7VKkU9fIXi+7VH21oHsxV3objG8zgfdvbhBmMah4Mue
         Aa/jT634ACGuxy6FvSOgpCCQNq3iLtrq/7LylUFX1D4+s957/GdiN0utEdkGpQZ3gxJV
         3m3A==
X-Forwarded-Encrypted: i=1; AJvYcCUMmSifyz/IXPyO0Gb0T5fSr0YScTQOmeLw7dtg5mf4EXbEY3w6Nls0lrF4PZX1nFBdXonKk60ijzM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTyzA1MxV1rAnE4iuUacQsSJghi/Ts5xlaCeCJiCIQnIVezFQK
	lqYx7gQXfR6VGGtM6Eji5VHxTt1NbkS0jMO+gj9ZN9QSb5R3MkAUaEFuqlz6/4sM+OsBIsdhnsd
	oDX8Orr1Z/yCF1acD7ozMqONbJV+TBQ27KwjGDvpipgNGsM9U1YhQM6nx5z6vDWQ=
X-Gm-Gg: ATEYQzzTlxRGXDra427OeSGt0Q/z5yWOCWR3Wyzh3K4+LMy/I/njf+NrKJS86b2Wh0w
	r1BQe7MUo9xvF+eA/VSL7PcN/VOFS63bCB4ia8l0H9j4waI8KpwYKf8w4yLO4W2vMOl3SEYddzj
	dCzfC9xzHs5AiUQYXx4cIZfl7mn2/AmchlfSmdEDpXWiJIeRKfkj4qZ3a8kRPA0vgiNblixdjKU
	b8AI/RJUmFDVTDn7OtcVZBGMkZnaWrFRo3ci+Alfzvv0r2MUJyXkwZrQ7/Lad3MKYC/bWdbrWxb
	S973gjnAn4W8uexwDeQyNYQclIbXGIQFxtbVI8eL2+E3BbSaw4+QReGjX54hV6360154314mnKd
	P5t2kX6SREh0Lm8WcpHXtuMdBijPiZzjNtqERLFKCAMQO8i52P7tEsXdSl393RfA2EWkU2sh3ou
	5GDII=
X-Received: by 2002:a05:620a:1903:b0:8cb:1c69:b7e9 with SMTP id af79cd13be357-8cd6d42cb58mr1412800485a.5.1773148955817;
        Tue, 10 Mar 2026 06:22:35 -0700 (PDT)
X-Received: by 2002:a05:620a:1903:b0:8cb:1c69:b7e9 with SMTP id af79cd13be357-8cd6d42cb58mr1412794085a.5.1773148955295;
        Tue, 10 Mar 2026 06:22:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6629f7cbc78sm1453211a12.17.2026.03.10.06.22.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:22:33 -0700 (PDT)
Message-ID: <5ce56237-1a57-4dc0-99f5-c6c813875e08@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:22:31 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom: document the Fillmore
 Global Clock Controller
To: Aelin Reidel <aelin@mainlining.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@mainlining.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260308-fillmore-clks-v1-0-976d9a6bebe7@mainlining.org>
 <20260308-fillmore-clks-v1-1-976d9a6bebe7@mainlining.org>
 <20260309-quirky-heavy-armadillo-9f92bc@quoll>
 <386d5f66-1f22-42dc-9696-05b1e54d7577@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <386d5f66-1f22-42dc-9696-05b1e54d7577@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNyBTYWx0ZWRfX7zgPaCAnusmc
 Q6DRbOqgmgo4sxBvlP0fbWcN0lKtTEhp+6ChvFtZHALD9aRumCSzJ0NgoPxjZ5UCd8QWJtRTMRi
 CiXkW7b8LFlqOPwaB1ipDcpCtnMQCQDvpX79DO2cUEc2QdPPgC/X7UiebnHQh9koYPIf1d4laSl
 mNZdNw1augXOkXTNa01RHrGmiZGP6eBTFP8fb0fuSBR9zGd4wBqA7usohuT6dRXoLey/m/C9GJP
 4Bk4M6/LUzLz8T2OWdfS263G1LKUYzA0CD6e7dmghpqtLUGcXyPLKNAq6VAQSU/x470jha1hFI9
 03f4yr+KwmQkO5vf0ahIvRCnvovMWpcvHcYjV9VkOpUioQdU54E8fV17g6/h6TQkRLppUsuslhJ
 stuyKi+1og+ahczA2MWGFEdcTuoCL9C+yZTRumAXBmXXDNMUWYmGLpKjyx2yZkSUl0Xs8F0oiCH
 Wb4TGAicyiWTHe4X4wg==
X-Proofpoint-ORIG-GUID: 8XDVol-MJd8HfMhMnfaiokWHkdeUqwae
X-Proofpoint-GUID: 8XDVol-MJd8HfMhMnfaiokWHkdeUqwae
X-Authority-Analysis: v=2.4 cv=b+W/I9Gx c=1 sm=1 tr=0 ts=69b01b1c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=OuZLqq7tAAAA:8 a=kGAoTktFa5V21D_EptYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100117

On 3/9/26 3:56 PM, Aelin Reidel wrote:
> On 3/9/26 8:38 AM, Krzysztof Kozlowski wrote:
>> On Sun, Mar 08, 2026 at 01:39:27AM +0100, Aelin Reidel wrote:
>>> Add bindings documentation for the Fillmore (e.g. SM7450) Global Clock
>>> Controller.
>>>
>>> Signed-off-by: Aelin Reidel <aelin@mainlining.org>
>>> ---
>>>  .../bindings/clock/qcom,fillmore-gcc.yaml          |  60 +++++++
>>>  include/dt-bindings/clock/qcom,fillmore-gcc.h      | 195 +++++++++++++++++++++
>>>  2 files changed, 255 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,fillmore-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,fillmore-gcc.yaml
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..0eb12a52968edc7961681f0e965b4d6da0858b9c
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/qcom,fillmore-gcc.yaml
>>> @@ -0,0 +1,60 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/clock/qcom,fillmore-gcc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm Global Clock & Reset Controller on Fillmore
>>> +
>>> +maintainers:
>>> +  - Aelin Reidel <aelin@mainlining.org>
>>> +
>>> +description: |
>>> +  Qualcomm global clock control module provides the clocks, resets and power
>>> +  domains on Fillmore.
>>> +
>>> +  See also: include/dt-bindings/clock/qcom,fillmore-gcc.h
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,fillmore-gcc
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: Board XO source
>>> +      - description: Sleep clock source
>>> +      - description: PCIE 0 Pipe clock source
>>
>> Aer you sure there is no PCIE 1? Because I would be dissapointed if it
>> is being added later. With PCIE 1 clock this would be basically Milos
>> GCC.
>>
>> Best regards,
>> Krzysztof
> 
> Yes, there is no PCIE 1. Fillmore has only PCIE 0, which is used for WiFi/BT
> and is Gen 3 1-lane.

I concur

Konrad
