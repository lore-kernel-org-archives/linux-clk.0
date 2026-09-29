Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9292E3B38BC
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 08:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670384; cv=none; b=s3K2NvMcsDHgOBO2U0ZCtuj8PV7U/nm1Ez7DkFBquZp7rRSQJnGkThpL2tkRuN6+eZf6RtpdyQl+ZWeXLGCjt0+OG6szON8rNvo+zffJLD+z/f9EYBUZT/l02E2o5g4RHodvZElAde+wts3P8Z95kQAaAPLytTPqMyXMtNzypHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670384; c=relaxed/simple;
	bh=O1UPrahGCevcQyrI6uYwBLnwz8VUW6bBv/tVqUPIrIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sPWFUd2oNzbA1F6XWk6iJEOARUIm342VRHx42VxLmsMa7kaH3swAwpL7eLzBIOunbJObULJrCqqF1mkySl373wU5E5Dmc54keBeP+PdO4UE4yEzjMgrhiDu+7U39W3PuJ9caTy573Z9OWKKwyJiJD5WZPqvfVGgRYErZR5kyxXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EKzxBWNY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E/QmrS0U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EKzxBWNY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E/QmrS0U"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7TZBq760481
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 08:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lj57R/YmZD/4Sj5RKNgxE3jSaNf76h7dCY8rZUL46zs=; b=EKzxBWNYBMtLcPz7
	/BCQFrhl/ke8baY6roWkO8tR1LgkVy12Oz+pbm5PPTZrtoJMYn5d8StPqA5bPB6j
	+ncyNGLBE2iCUSB44/2QawwYIdfKvvU5g3VX8g92PwP6/tnWGqi4oL37Z9coJpyz
	DwE3ehJ94WzN+ylUwxKIhrqAcZFUE2hvI8A18xRSxa3Oow6N3hIVPXqdLHss1MQ9
	CA+bH83x0q4njg+AgY2qVZKwl5RTHrqiR5I4UTFBdcus0PFRtVza76E0VNi6TdIv
	kn9l0UXeQqoY16o7j/GsOumaLFULZH+3kLUVagI6aicugHbKCz95N7w60M8wYTLI
	qc+5OA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyw03k0qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 08:26:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c29d85d0dso40149685a.0
        for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 01:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790670381; x=1791275181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lj57R/YmZD/4Sj5RKNgxE3jSaNf76h7dCY8rZUL46zs=;
        b=E/QmrS0UGJZpE8+nZzc9yD3+1Tslgv6qUybVteGi0JbPnUnhrCP3oypMy1MvSlBY/e
         FTrq68fjm7J76XGQawOYITlxFooWBj0DytmW234VbKpW8C+GIuPWdB8eVgHjDzfZS+AO
         hmXS7vVy1YE2KO7xEXmVAfBTFyb9e5+GU2LhxKBTowaZ0EIJ3nxUueXbHfwuJRS4lxBF
         5xy+WI4sh6g61i4Sdcv6ry1xzdtFklLiVAC/Ehz/ZsIcyViPNfI8m1HsJM3rMzQLBU+4
         +y2AFDmSxsExNbKJR5vHgDPnmJWFv9m9yN2MWwF+xP08PZlcTUpTw506qjzFAsWLZ7nm
         O3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790670381; x=1791275181;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lj57R/YmZD/4Sj5RKNgxE3jSaNf76h7dCY8rZUL46zs=;
        b=SwiUdeOHVRpU3umWSrjTPbt6dQqTlORn1BmjDhPblygAzGE0bYESQ9zgrZRVe1niic
         U0pu0zQNwQVsJgcoiU6tP2ieL240kdCO/EI5teLewd1r187oAB/ULuh05h0e90RrALfA
         ExAKMxhGjpqnpqCDQCSgLMzEhEEgncxa0opisE5ED9zqX2xvNCeNO/4xFQAoHZ/BHXRl
         8xB1KJyiCiNBs+huhuGS6Q7DoYSJP7d6QkmMVBnDgpI6iuGk6ci795KKGIP9FLlF6P2P
         3Z6Gu3aGO406pTzGNc4EQSm6EEAFARhy9M5Ds1oxse3y9XeYBt91cOC46/Bx42A1vX0E
         W0OA==
X-Forwarded-Encrypted: i=1; AKwUvByp4DCImLf/F+E1SoMOhv/ZGotve9QJHhZn8anw4wPb8N9lc40Qwbzb91vnHiqD9J+iHIq4oMTghx0=@vger.kernel.org
X-Gm-Message-State: AFuF++kpWY/HiikwYb19uSWOm7G8NhyTeL4qR66nbEkZ6x+kTPVuB9Mt
	tZejVSi9pXNu++J/ch9el3b38av5ScbxE/2Ik1gAm9CtkotVTIzFVpu1miqApGDi0pk4rADkmOn
	qFI0/3KtWrUm4ehGQFQLuO24SrmD4bLikD9f1rejxHvQOxItiaAb8DI5ZXrbOvvU=
X-Gm-Gg: AYBFou2qGXaMFlZ32m076Bat+DrWIRMMqZfeHfhZYIMxr4p5QjSZSCCwKARNe0ZakJr
	biNdouho9X48TqeskN/Gt8zIuYEOJFD98B6Ld0tC0PWIoEESXfn+LwjgX4/kn6k4quzqm5ZEHvf
	jvaymv8qmfn8lllWRANS2v2eG8Xb9u8axgNGfFib2F+Lu8Oazr6ZpnSDJKpgUNohGCSCtwz/d/o
	cO0U/YvcaMsUv/7WLSxIODyOlmZef9C4HeE/nWk9jGHh+7sn85rR2e2ySZL0s70gIEEcA9rJZsG
	rlAislS/YdEZgr4LRnuz9j/hA1FLntLdM11h+MFJf0TbtlvsV1UAzmqawY+DOCcIYyIa/hksRYo
	9Y62eI8wGpa6YTH8x2FZ9Sg==
X-Received: by 2002:a05:620a:468f:b0:93b:c6ec:780d with SMTP id af79cd13be357-93c43dd5b7emr2345656685a.5.1790670380790;
        Tue, 29 Sep 2026 01:26:20 -0700 (PDT)
X-Received: by 2002:a05:620a:468f:b0:93b:c6ec:780d with SMTP id af79cd13be357-93c43dd5b7emr2345654185a.5.1790670380282;
        Tue, 29 Sep 2026 01:26:20 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6acb9057d20sm380135a12.32.2026.09.29.01.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 01:26:19 -0700 (PDT)
Message-ID: <c341b7ab-fc59-4234-a25f-715035fc1779@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 10:26:15 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
 <97fd5a30-9469-482b-be0c-0ed6da6424e8@oss.qualcomm.com>
 <5a55edf8-bbcd-4e2e-aa08-c9b62e527a43@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5a55edf8-bbcd-4e2e-aa08-c9b62e527a43@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzMyBTYWx0ZWRfX4XFMyY8UnWJr
 e7IQre7bogAZmNUxfb4LdUlk/cy+Kbl4OreeuC6CxI1FopzFEiNbZdq1VyTFubzqKZ2UN80jtX7
 oOA9LBCCGGifWrklfgjKx/dIDZZbqKE=
X-Authority-Analysis: v=2.4 cv=SIbXx+vH c=1 sm=1 tr=0 ts=6abb762d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=-jS8umMHsOJWnNsN0pIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzMyBTYWx0ZWRfX/LfshOhC3tKP
 UBiJDsZWAd1ZTwDIj0cO7iK9A49HvSdADYXU/+FVKphzIq7tVMELye9EYEASa7lfx0/kqf9JARN
 msvExTzOvJQpsUOkYzcmXaAqeEUp7ElkzeWN6SRh/IKVTZwyEnupU67htDEWXRE49oyYaPupzGW
 UIGdlsqzPjWwIOvF2RPC0+GxPE8G0pSFYCqNaLjn32RMX3WIFAgecCE1gjPzgEhb4iqWVokJPge
 9K1RUNcqyVHmbgJTwfFk6/2oUr0+uHiEXOo89C7X5TO0zw0ehFqdJ+YCHmpQqibuU0TAAcmCFfN
 X9UcRwOl0a/FzO9t2XzdRf7DIEj6iwR1sf4VtIAf3nMs0HXwsgXK6iTwOQqBRJ1VeTce5ca/zLn
 10C21MF6qoTSuwgq4SE1FgwxsORy0CMJXmgb7DJKwVZYGvyc21x4cdTwjDFzTlHibHssxprStIo
 rzqQGGIIUaBuAOiSN0A==
X-Proofpoint-GUID: 2nk51d1SAoFDRwIq1nF1OSnZSUlomxzU
X-Proofpoint-ORIG-GUID: 2nk51d1SAoFDRwIq1nF1OSnZSUlomxzU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290033

On 9/29/26 8:59 AM, Hardeep Sharma wrote:
> 
> On 9/3/2026 4:27 PM, Konrad Dybcio wrote:
>> On 8/27/26 7:51 PM, Hardeep Sharma wrote:
>>> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
>>> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.

[...]

>>> +            ranges = <0x0 0x0 0x0 0x0 0x1000000>;
>> likewise here, you don't need to precisely limit this.
>>
>> Konrad
> 
> Hi Konrad
> 
> Here I cannot use ranges;
> 
> An empty ranges; only works when the child node uses the same number of address and size cells as its parent. That can't happen here:
>   - The binding fixes qup0 at 2/2. qcom,geni-se.yaml requires #address-cells and #size-cells to be 2.

Fix the binding please

Konrad

>   - soc is 1/1. It uses 1 cell for addresses and sizes, like the other 32-bit Qualcomm SoCs.
> 
> Best Wishes
> 
> Hardeep Sharma
