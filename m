Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2A7382F01
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 08:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860445; cv=none; b=ASs2ovJFzuGwZXzLI+LSX+axgFds6J6ASzq2JS79fDI7UlAarjcLHZmlvBKLObOw0wH6tyX45OT3MCAwChtE/0mVE+bsDAl6IYpEBG+TdtDwCnzRbjYbcm2f5uweqLl4nWWb6ywaYQOE3DHEoLb5B9PG2XhCsZ+G8DjqVglaJL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860445; c=relaxed/simple;
	bh=a/gjeWvGX0wqeqMWQ7NwqlnvO3TANHHy9zGxY38C3lc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OP+CZ48UxOC9ACfuLl4ZDu6bNIOV3nwh2L0QPryhp9CsJHg1j6F/w3grMAp1dy2dA39jDW/x/YfAiX0caioemFdjati204qkTEI9XPJnrUOWbylV38UyPjE5JYNrQKHENOeRrBSKt+g93fx6l6zadYI6pp8SibRG9+kXXzCDQD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=joVVJ1ha; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQYROjJC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="joVVJ1ha";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQYROjJC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4OxXf759311
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 08:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mmqIWSC1x/lf7weeoBI4Z52pNjgwELqu38ImJz+Zie8=; b=joVVJ1ha8yNJWk9/
	gWSJClG/AGOD2SVJVQyGjSHCsIfka2WgypGw2vQH+L965V4OajREktMrB0pTom27
	QasLKv/uDs+Kdv/Pwt3DeCXsxPPT47HV/iIg/nqXVG3oRI/vNed7tajKYNbr9JN4
	8d5bxQLN1i86W5Jug2yjURlh2LcZpBIbf3uHpLA6m1R9PV85FIIxQG3BggvPncoK
	mQjl6ee3seTD2NxykcHFV4NFayknwSGurnyfvZRRPyR1D5kpvl0E+h3E2pEsklj4
	kst/V/1sEISTHG6VHPmo8AVJTLQaczgm4Sjwv8HqJr2+KnXzbK6SHZVCveRcOqF8
	maDSWg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d65xqneq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 08:47:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2d15c360so11450081cf.2
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 01:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774860442; x=1775465242; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mmqIWSC1x/lf7weeoBI4Z52pNjgwELqu38ImJz+Zie8=;
        b=DQYROjJC5xPs5aCO9IPm5oQQqCw/cxYGEnIJiS0xL+tjRdZvpRGTnF8IUB1BdKPPTG
         cNT2ZSaX08d4+0h/EwbsIDqwBkWDXuMDtzOF8dOqHVJsg9ja5IBkb8GElY8NP78F370r
         9cCE3buDDeDEnyUdYIMPuN03/VkXXyZ5wQzNmUhvpCntZB0dpq0za9SJc8e1Aqb+ADeb
         +uIf5C+6vTsJqSNszHtG5YKNTy4mIOKZ2kQFQoNUj8+4zCkQTsycsm+46FF3TErjZDzT
         uOprLkHIjGkboXFwA1B11GP+suETCtZWPTY/74xx1yjHRJBlrgEzvHfEtFwX0pxLvteA
         CXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774860442; x=1775465242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mmqIWSC1x/lf7weeoBI4Z52pNjgwELqu38ImJz+Zie8=;
        b=lZ7rL91I2rOfKz4Zycw/oQ3PSVh6syPsroDIKeZ/i53wZvSLFN5ABULFFHNO/xNcxX
         K51nvDCUW8RD5OrSfGXdYPB6qPdcrPodw57rYsiGw76KRFjv5akLsWp79Sk+Gr2+ENS5
         FczLzrL5i22FUSFkhyku6O15zWqxyUQI16dRWmCnqjkcTGPfy0uJ5Zqmw4VSTLre89Dv
         4Ch7W803pe17UeNziEY4/8dD8TSH7BskPtP2kEXkDJ1fxlg6s3goT/cOdtZZyilA0ivx
         RPRuLs9vkaKN718ye8Hp/dW6+Wxxpi8Vmp8EVYRNCvDpXQZalTDDl4J8ayQ83HYitMuh
         WjAA==
X-Forwarded-Encrypted: i=1; AJvYcCV+PZyiGNsuITaUsmBx9ynMcp/RkqIECjg9AQn+E/K+Rx/VN0qCzZuReN+oAdjj6mjyCOHLlqz6+cI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwudVUlFQSaazpX88MwC5WNlbhPriNG5Oj1cpgP/OqAvRnBVGsQ
	g7cWZdL28F9/YTCDREulrbfbfsHt2rK3d4T38FfkH515pPFVHnzdpinZschrl7a4yWmeKY550BA
	T/GzjX/bt/X60MNy7sleEA60qpaMAdg53Sg58NjODTznK0PncqAe8YIUIOYRPmUc=
X-Gm-Gg: ATEYQzw32hKiwRL1jBfx7bjoBqWV6IRWTkgFRsPmVSMA3iUWB56L0fsgRTK7oFG+LSA
	PMgw+c386J3mR5entOCFgh7IMJlYe+r+FnjbGOzOLLAHb9wPTBa+dJ4RMmo6lfzaEX6OhxAgcfN
	jPCbOzudmGRirWZlM19MKZUMtIs0tPSEIvZcqPrux0KoacfSVCYe1m9rXZpmW79NkFQ+7eMdbf2
	RCAlHWDXg7a0ZaN9niMB0Ni6IYp7o4uHxmGbxOhZPWfGRjQ9vGaL/BwSxkFhSCmO8MJg6FQoUy1
	61xhFpRHtG4kYcalHTQ6I4cffp8c3KKnwJIAiDPBwUnjMJJsn/hwBMdSn/q0hnfaUIHVus+itjW
	GW6zX5O6YUHz30e9Nyy0GHylgOz9YTUWCtAqI4v1h1U/dhLSRvlat7Oyh9indJGCCQr8diFHpNa
	PqS3s=
X-Received: by 2002:ac8:5fd3:0:b0:50b:1e21:1733 with SMTP id d75a77b69052e-50ba3828617mr122311841cf.3.1774860442437;
        Mon, 30 Mar 2026 01:47:22 -0700 (PDT)
X-Received: by 2002:ac8:5fd3:0:b0:50b:1e21:1733 with SMTP id d75a77b69052e-50ba3828617mr122311691cf.3.1774860442008;
        Mon, 30 Mar 2026 01:47:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a6744sm244747566b.30.2026.03.30.01.47.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 01:47:21 -0700 (PDT)
Message-ID: <d8998aca-b808-4239-992a-42cc780724c4@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:47:18 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add missing power-domains
 property
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-0-f14a22c73fe9@oss.qualcomm.com>
 <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-1-f14a22c73fe9@oss.qualcomm.com>
 <fb5a1d45-822a-4894-bf89-026164491935@kernel.org>
 <szijgc6icwkzlssrxa5ceawgzaq73jo6lei6yubaxltbw64x5t@ru6x7a32igji>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <szijgc6icwkzlssrxa5ceawgzaq73jo6lei6yubaxltbw64x5t@ru6x7a32igji>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: b0voqxv_9jpqGKB8zV_QKd_WSurF6DYs
X-Proofpoint-GUID: b0voqxv_9jpqGKB8zV_QKd_WSurF6DYs
X-Authority-Analysis: v=2.4 cv=evLSD4pX c=1 sm=1 tr=0 ts=69ca389b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=d7CWpT17vCKXtNJQOZ8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2OCBTYWx0ZWRfXwAz/bM8Xa2Xd
 FBmCcMeX/XAHnD1kHO/Q7zLCzlOYtidWlqUZVbX9kcuRfU7pQwDT7egcVi+cGSaLCrDUqQHK6nG
 /sbkeRevImCItoclRTThOBBKSvXbrXPnEp0VZCD8GPQwI67V/IgNnT/vsbbb8BpNWLvWIXKOJTU
 LokLiFQ0CKymNrWsiWZSv6dMQdcICZEQ9jcxByInBqgAvlx+KoLVhUD3cdfq1vCasI1zWWNrUeK
 Pm5h4TxWAfi43EIn4HAd0Y/3dH7Ioesg10WLeNajYg459QGCGDYd/2zjTaMu+0qKWH7qcbi8NIX
 3aRZKwXb98ZVP6sUkrlTVQAnTvXLTgRUanAOt5CKLNbTjNR5EsjxcMk51p0nCl+ZQQSZ+GxX3LQ
 8AxyX4m7k50r8uZUPhYWKSc9c80LFguozAkmu1cmaRsQbM+TJvCFhj5BZ0zYpWe9H2Ql3xUJeh8
 sBID7rNNwfgW5UC+4WQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300068

On 3/27/26 2:45 PM, Abel Vesa wrote:
> On 26-03-27 14:37:17, Krzysztof Kozlowski wrote:
>> On 27/03/2026 13:13, Abel Vesa wrote:
>>> In order for the GCC votes on the GDSCs it provides to be propagated
>>> to CX, CX needs to be declared as power domain of the GCC.
>>
>> I assume this is true for Milos, not only Eliza.
> 
> My understanding of it is that this is true for all platforms.

I think we once had

required:
  - power-domains

in some common include, but that expectation fell apart as IPQ/router
platforms without RPM/RPMH started coming up. Maybe splitting gcc.yaml
into gcc.yaml and gcc-no-rpm.yaml or something could be useful to ensure
this common constraint

Konrad
