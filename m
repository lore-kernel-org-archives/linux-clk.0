Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCB42494F5
	for <linux-clk@vger.kernel.org>; Tue, 27 May 2025 11:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748344775; cv=none; b=L+LOHhEhtdhXBGAhL5dMrLZpiSIVMWOJXuTxG9OZmlwFe2jGrEPYSc0X3qBtVjMt2pDb9O0FId4o762/B+n4X93eWjDYb6TomcW/7URtUfyG6iwr73GTrUQPnEkQFLRQeX2ym5uq99c+0kr6K0N4tx0zzX9NS+q391ezEqqa8Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748344775; c=relaxed/simple;
	bh=19feJZZTbb+km5oSmqKqxCaJrNvkXHMQEj7v3RsRCgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qla9eIH5sYkNWqdxjq9hd7o/NuTbUvfRvPHauby36Jq6fy/DdEjoGBsPK7fIxu+0jCpNh0W/0MT8SavCWThS7Dfs0fHUY3FrgRjAxBZaglAxanU0LtrlUtL0d+LePpDhaCFiyFSY5EJduBVwAZgfBONbwD0FLY8ag/PhKMEsuu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJUp31k+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJUp31k+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RAVnrb001972
	for <linux-clk@vger.kernel.org>; Tue, 27 May 2025 11:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sGGnr2Cf6uz/5zgl9H9llVxN13njxFiPARnslx3OyQY=; b=IJUp31k+8iZ8fZ75
	0IwkgnNKcfWG8ZX6uBxvXyY1Pmba9MTgMyJ9hqR/1Gcp+7OmWHv9LA8JhHQdA7i3
	0aP3cvkaobNyLO6lUXfZI/r5rOmMnNC/Kk4VIT7VLVcFNxBQNaWwqTUs1p6XoQXu
	IkRafdp2EyegDVWCus8pQ8A/XQAfHuBaonnhptNyzYVipO5H13DaAsEqum0kSqCE
	S9gCjy/EmPKtHuvimd1LZxt4GPWzAXaZ8NGenBMk9FQtlRDoAVv8iw9IKr4P63V0
	0KwSVQQfRuSO+4HlfdQGBD5BkolkRSTbb8/iuv3xdX0bX/NX11e5MtPohfZTLmUE
	AS6T4g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u549emq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 May 2025 11:19:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5530c2e01so34257285a.0
        for <linux-clk@vger.kernel.org>; Tue, 27 May 2025 04:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748344771; x=1748949571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sGGnr2Cf6uz/5zgl9H9llVxN13njxFiPARnslx3OyQY=;
        b=JPRqPBJzXjl/tHAUKZsFIKsNlZdS1uFAhoVCbhhb24i9yiMQ03xYGrHMNrcO+53Yli
         Jqdh8zSaLvCl+4Lm8nNflTYuDRyaN+3b7fFu4r4RInppA6T+yZ3OHxWKeh+iA0RJQ9XH
         P9BqQXIwQ4HkerbvIpHV0O3oDL8EfObvJFw1RM26QwKLMgBNNy6oeVKvmBHt+MqfuQl1
         WBSl/SCVx+995oFv1Drg+YK572IpVopEhIPw5VYobQcPRm1zxkynQ3zDEyGQKh9hRpKO
         fJmHO+/jQHi0JfmeVgFBkD98RVIGtHP4UZ4mFAtYEjacSJgX2Jp9qJAUgzwEdWmttv7k
         RFug==
X-Forwarded-Encrypted: i=1; AJvYcCXONg0H3r/aYzGjRC4AE4WJanLzgIBJXPeUn4pTd3rWdTOc3lir/9ZcNSyzmQue7YEpVyMldMrNDLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjYBbRMUkJnMydMgd/9P1kRS1tAKCFM0IEif/LthFDnZj9b/dX
	H21i/0VmfcE3Ag1UM4uWcF6OjvXrhvtv642piUrfqP7T6TvBXBe11o0eTwRC+aAQJE3SlJTTJFA
	Pr5Y20RgtdNgSR4bDmidLYGLnpTH/Raw7gHUofTEuSoYBaWWVE8HYZKesHk80ICY=
X-Gm-Gg: ASbGnctT9WjszqvazanxgEzpfgt1le5/1HvSdniTbTLzqVtc2CBqw9G7bv0JU2aCVK1
	MEAc48PMgRw5RMu6/ToRpDRIwwef4AHWkllVSX0XR8+fFh3Ny4u5NjkVfBB93rajGqElK6kN9TD
	BcbcwRlpv5OfclJ7Gh4WmtGE1GVxCamz31TZSggZadj9M+Bs2AtjsXYniTowsuUKrw+YwQtW/i6
	WOL8+g3aMm2GzzuNXm0UAGlrFAULDSvSHbRRI0P3QQwzAxBm08dA2bDI3XyNHzs6alhGg9/gaxp
	5+je5IcBjUfUeM+4ozdA5LBD0UIsjdsKV45UgINq6UH6DGNVFetsn1xiG3xXslEiYg==
X-Received: by 2002:a05:6214:2124:b0:6f8:e438:6a31 with SMTP id 6a1803df08f44-6fa9d38a281mr84868816d6.9.1748344770682;
        Tue, 27 May 2025 04:19:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVX0YQa52wzPt5zotLH02+4Oq1iIQcnbNqEa0aCHbsQCwGP7XhMmeQ5L88JOR1OO1b3BhmMA==
X-Received: by 2002:a05:6214:2124:b0:6f8:e438:6a31 with SMTP id 6a1803df08f44-6fa9d38a281mr84868616d6.9.1748344770315;
        Tue, 27 May 2025 04:19:30 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6049fe0e94fsm3125097a12.26.2025.05.27.04.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 04:19:29 -0700 (PDT)
Message-ID: <99fd4103-97e0-486d-9e6c-66c8adb70b3b@oss.qualcomm.com>
Date: Tue, 27 May 2025 13:19:26 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: qcom: gcc-ipq5018: fix GE PHY reset
To: George Moussalem <george.moussalem@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
 <20250525-ipq5018-ge-phy-v1-2-ddab8854e253@outlook.com>
 <337068fa-adc2-478e-8f3f-ec93af0bb1c6@oss.qualcomm.com>
 <DS7PR19MB8883BE13166F7CD5DCA777DB9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DS7PR19MB8883BE13166F7CD5DCA777DB9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JjNsIZFNZtDCrFCybcjG5CnNVQMJ00dL
X-Authority-Analysis: v=2.4 cv=E9nNpbdl c=1 sm=1 tr=0 ts=68359fc3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=qC_FGOx9AAAA:8 a=UqCG9HQmAAAA:8
 a=2jJET5DcvFRXXXsR3agA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5MiBTYWx0ZWRfX9LP8vMuJv8YX
 Op9z88T9XyY/p9gxvT/01QY/p6N8ErV33LzELtgmb2N/WIEJlajn0/LxVe84wnCgF5FhZdhQPF+
 X1UbKx75mnM0vEGaLKU/vTMejhR4oxA8gJikZdz3IQGOV2HsJjlsbYCwFuB2FRZa3Sgr5Gbsk/J
 JwRrfPQRwng8Qd39esiYCY+QirxyQAkb79zMzur0ti2lXCRWxEqlsSlnpbdlc2u6i0s4DmK/I1u
 DCLpQ/9mkLRfjZ2fSjyGOvjKTbwXKXm1NYRNHvnFoBMkZQCFEvgAFMQ2bc9CjyMnFN//C4F4ie9
 Sz1/sYdnX0yH5j4l7z/nqoKFob8mch7/r3UkgnW3ueXBZrPI5cs3R4+NQi0PxxCmfPYMGPL/rnY
 tpj2T17pRwgfVy0PVQs/ZttHnMvd4LzwCdNT3YQMGi73bQ3A9203O0qhKwhKIXT3gQ81SuBu
X-Proofpoint-ORIG-GUID: JjNsIZFNZtDCrFCybcjG5CnNVQMJ00dL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270092

On 5/27/25 1:14 PM, George Moussalem wrote:
> Hi Konrad,
> 
> On 5/27/25 15:00, Konrad Dybcio wrote:
>> On 5/25/25 7:56 PM, George Moussalem via B4 Relay wrote:
>>> From: George Moussalem <george.moussalem@outlook.com>
>>>
>>> The MISC reset is supposed to trigger a resets across the MDC, DSP, and
>>> RX & TX clocks of the IPQ5018 internal GE PHY. So let's set the bitmask
>>> of the reset definition accordingly in the GCC as per the downstream
>>> driver.
>>>
>>> Link: https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/commit/00743c3e82fa87cba4460e7a2ba32f473a9ce932
>>>
>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>> ---
>>>   drivers/clk/qcom/gcc-ipq5018.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
>>> index 70f5dcb96700f55da1fb19fc893d22350a7e63bf..02d6f08f389f24eccc961b9a4271288c6b635bbc 100644
>>> --- a/drivers/clk/qcom/gcc-ipq5018.c
>>> +++ b/drivers/clk/qcom/gcc-ipq5018.c
>>> @@ -3660,7 +3660,7 @@ static const struct qcom_reset_map gcc_ipq5018_resets[] = {
>>>       [GCC_WCSS_AXI_S_ARES] = { 0x59008, 6 },
>>>       [GCC_WCSS_Q6_BCR] = { 0x18004, 0 },
>>>       [GCC_WCSSAON_RESET] = { 0x59010, 0},
>>> -    [GCC_GEPHY_MISC_ARES] = { 0x56004, 0 },
>>> +    [GCC_GEPHY_MISC_ARES] = { 0x56004, .bitmask = 0xf },
>>
>> The computer tells me there aren't any bits beyond this mask..
>>
>> Does this actually fix anything?
> 
> The mask is documented in the referenced downstream driver and allows for consolidating:
> 
> resets = <&gcc GCC_GEPHY_MDC_SW_ARES>,
>      <&gcc GCC_GEPHY_DSP_HW_ARES>,
>      <&gcc GCC_GEPHY_RX_ARES>,
>      <&gcc GCC_GEPHY_TX_ARES>;
> to:
> 
> resets = <&gcc GCC_MISC_ARES>;
> 
> to conform to this bindings restriction in ethernet-phy.yaml
> 
>   resets:
>     maxItems: 1
> 
> Effectively, there's no functional change. So we can also list all the resets in the device tree, whatever is preferred.

+ Kathiravan

are there any recommendations from the hw team on which one to use?
As far as I can tell, the _MISC one simply pulls all the aforementioned
resets, like George described.. it seems weird that it would be designed
like this

Konrad
