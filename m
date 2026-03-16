Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F125833A6F8
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 09:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653707; cv=none; b=E7jThXT0MLAqsbxz4RLl4tARgoCKLoPiqKDgB8x96HhvTQdwcmRo5lfmNisyauWKJrxu6WY4ln7fkXeypY2mSORLlQYXMXyW5s5tvvR1loUM2fJRBsyn6pZXqicTb936Ju6nF1mcVcwSVYq+T2Do9yh1LLGNBEl6dHmmB3lnmdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653707; c=relaxed/simple;
	bh=4r2iMJNnjHizHuoua26v+38XXw7c1p7R6XSQ8WsVbGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dU1wZ3L+yBYB6/jMQlma2U1lgN6N6z+y8fcFbnS8w+VvWN2t10Wsv7EsZYBqzaXN4Kv3Q1qTAIg83oVi23ET/QxtFxCBNanGSwqaUOW2WqGTG5KCj2Rnt/SYKhmbMfFDXmRQOJhz1v2ruSGfihRtOsM9x6O2PEIE5C9SAEPlvCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U/PkFDeB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZTriZICZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U/PkFDeB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZTriZICZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64fOB2583364
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 09:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1B/hBs9jqGXN0SatIrrTFMFGQGJmlKhZrWp6PbywrY8=; b=U/PkFDeBlrTsKB4C
	6YsBXWqQLQNNKucxb4AjteIqyUsG8InibHHx6ZMbPsEHm3s1HGtUDQt2fukXAI/i
	V9XJXMqCRWxJ9/furxhpWWH0hrEWX1uv6n35rKXt93ceeX7jR+O2MfoivZoWdbe3
	Mktc3TXJHl6eUHdW06qqkfjP5NITEW3AznvFj1vCT0mBJhEauqWHJeVL1v2zf+5R
	848vXObuf59Ise8YjfczNFrguqYdJ/D7ge3dHodfA8iPDDUJ+Rsn+GczS/rWdrMj
	Chr3Jv0eRUZ+jQ8WyKf2NXAknettViT57x748EZ88KUQoriLMGMwBqhlQlua4dpL
	u7JHow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0eccy4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 09:35:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb485c686cso278435385a.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 02:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773653704; x=1774258504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1B/hBs9jqGXN0SatIrrTFMFGQGJmlKhZrWp6PbywrY8=;
        b=ZTriZICZAqaMAdvDiWGWDrzsripmEcJfg9YGRvmXK2uYi+bm3ZpYQTG55Qjd1lBpsK
         WD2ZDDvH4zu1YqxxOGP3+gW2XwbsQSUcmIHJrED0gK2Rv9oQPeYro7BJT8Jm/EidMX7Y
         7q+h2gf84CkVthQME1CpnPls0GzD0lk/kUgDQzeYa3siI6nd9ZwlMAtcj8awx7XVJs5O
         kqtd/0uJQbkKXZxXW/b0kNFZ/G/FeTNfgBC4C6Dbkpqbp/dZBideSQPM0GcAecbYmqc5
         lpzlRcpjDLpkA9Uto71X8Ef3OL1HhEsmB6V0Qbx8C7VQbawUrdwjlGa6C3C4duSaXojb
         kGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653704; x=1774258504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1B/hBs9jqGXN0SatIrrTFMFGQGJmlKhZrWp6PbywrY8=;
        b=g86XIGN+kUnAdMNFzyJl5NTUiIf615aAVZc2Xd4kBNNFmNKXRr5nuToXyx6G5Zsvgf
         /9FpB1fMt+V/3KrGn4FTA/uTA3ZLm1LwI+HvV5+t0Y7Zj/fPTX1LrbVV+oVI397jqwfu
         bXBIHaBaTXWpIWCOD/EwLLesVPADrROWzQtTp24LhsqDBVctVMFggiKBy5zewu/zrKqJ
         d4AMz1aRK/Dsd+BDoR2R1rnqH/3qzYDxrdRp+9d7yXgLwOQhj/HZkSfGnfky3TsBIvOC
         v8/jkwewSDlNTT84RmIzqTTUjRZT/JTbhaqn9fya7lLrlDYEVc3UoUab+3fVWz+gy2u/
         3msg==
X-Forwarded-Encrypted: i=1; AJvYcCUhx9pdDHYe+6XUIcsFulj8pkY/Tvbsa01DFWcD7c8IxOeU2d2bnM6U6j82+evE3eYAb32xDWEbHUk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd0rGxrAcyPsd3/taurPApdOkupZM5kMwm9XXzoradLo2fG0CA
	xQJZL3zZDumW9ncDe7mgWUfxrHQs6Dw/Hishusdcd3UJzXCF5qT5tfGok9gFd1vKPRj7tecGv1p
	wCx19gttIBRAvotTsqN56pRP/XVFCIhJK8f4U1iAFmT0aK6LK7kl5XL+UZjoD918=
X-Gm-Gg: ATEYQzxRE/GoGBJlgVyUE6JIcWBNZfktPnW5Jb8Eac1T/fYUQ+0U3kF+g4R7LbzWDkv
	ToIEQgTb329It2jzj5YaecePz9oIGrkelU0p+8Eg7dwag+BvHO7fDsWAJuMMfJC1AMNenxz4nQy
	UKCFXu+oiKUbyCik81IODMXkqcZgc4S5KuuvxEISy+U14jP+mMxtGkB/DO+reu7DaETb2B8vFnp
	AgaaT64qRDeaegBmZR1nbIvXo8vpaXvWKTCG0Zna3oW7X0RHlRu3JXmnG9IAL+H516fxevkKShH
	s2dsrwORJYotbhwCAIr9ar1Ll+efNz7nJLNJu3JzyDFApmNo9e6UNPvImdPky42D/HtBMKKALE+
	x+kFN4sgVcgVKJS+AUN9RyPTtPGcx0FhJKw5W/teQ1afAMgi6qeL/h4ARyzCZH/IOXAEThpDr4G
	SSHv0=
X-Received: by 2002:a05:620a:290e:b0:8c9:eee0:dba6 with SMTP id af79cd13be357-8cdb5b7617bmr1232410685a.7.1773653704206;
        Mon, 16 Mar 2026 02:35:04 -0700 (PDT)
X-Received: by 2002:a05:620a:290e:b0:8c9:eee0:dba6 with SMTP id af79cd13be357-8cdb5b7617bmr1232407785a.7.1773653703814;
        Mon, 16 Mar 2026 02:35:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97cb0d2df2sm45121166b.54.2026.03.16.02.35.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:35:02 -0700 (PDT)
Message-ID: <6679e85c-4eef-480f-882b-c64f8d0eb1b7@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:34:59 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm64: dts: qcom: add IPQ5210 SoC and rdp504 board
 support
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
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
        Guru Das Srinagesh <linux@gurudas.dev>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-8-fe857d68d698@oss.qualcomm.com>
 <6e33daf1-bb90-47d8-955c-12ccdd30ebce@oss.qualcomm.com>
 <84f1407d-62c6-4ec2-8976-eabe66c74728@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <84f1407d-62c6-4ec2-8976-eabe66c74728@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Co6yUk8XVZhnMttmNaRYWnMSxgcIAhBi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MyBTYWx0ZWRfX9ExHTklFYVCG
 Q0ujNCM73sVdC4cSsY0Qr21db+BSqHI/ABX9P8AfW0JffnGqzJWmYFTxEg+5ECm0RC2LuZkIYIT
 eo4XIXahwBjYGi76aBmYCbCwIHTvO8joY13voiWm1e39nOPgWq1YMRRcpI8SgwfaOtHlXmFFc3a
 GUGfceq0eNY0Bu9BbLcA7xCTTvuKNv6W7VWhsvJZc+v7YgE9flZKsBrjWdMNoPrnLmBx96xDZx5
 IXAsK/CVC+LzeN+X89IwONGLzdzaqx06nwAYLEy7yDIFQPZS0v/UhXXbaSqapSaNaVcGQH2g63s
 P1rA1cOglS0/lnRg3oHLx7qrxpkBWMx4rHH9EFrbizBUlV7vx/ctmnV6yTAbP09CNmGGj4sPZA0
 QZd6Mw4wB0Q9+/RyhF1kF+zhSu5gDe0011RDwIp8n7vS95yxLISUF3+wPLy2wppEA3Gsg7SgrO1
 PrJMuL0QplvTbyumGgw==
X-Proofpoint-ORIG-GUID: Co6yUk8XVZhnMttmNaRYWnMSxgcIAhBi
X-Authority-Analysis: v=2.4 cv=BqqQAIX5 c=1 sm=1 tr=0 ts=69b7cec9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=4Zt3pBCKRviRSeEyxVwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160073

On 3/16/26 10:03 AM, Kathiravan Thirumoorthy wrote:
> 
> On 3/13/2026 6:18 PM, Konrad Dybcio wrote:
>> On 3/11/26 10:45 AM, Kathiravan Thirumoorthy wrote:
>>> Add initial device tree support for the Qualcomm IPQ5210 SoC and
>>> rdp504 board.
>>>
>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>> ---

[...]

>>> +    firmware {
>>> +        optee {
>>> +            compatible = "linaro,optee-tz";
>>> +            method = "smc";
>>> +        };
>>> +
>>> +        scm {
>>> +            compatible = "qcom,scm-ipq5210", "qcom,scm";
>>> +        };
>> OP-TEE *and* SCM? What does the former do?
> 
> For OP-TEE, we have use cases like getting the random numbers, remoteproc PAS and few others.
> 
> For SCM, setting the download mode is one typical example where OP-TEE doesn't come into picture.
> 
> Please let me know if this helps.

I think it does, but it's odd that OPTEE wouldn't handle both

fwiw +Sumit is poking at OSS firmware for other platforms and may be
interested

Konrad
