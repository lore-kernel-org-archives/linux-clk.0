Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A1135E53C
	for <linux-clk@vger.kernel.org>; Wed, 17 Dec 2025 13:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765977671; cv=none; b=giKQ+4zEeKhMPwtN726gdtwmETZ8mSPSUkGNtHDVs6JR4RhbpxtTGqQrMb7AbMexhMlmmDeIhi7mOzBrYgwnfEsg4PuYjaMz7CXowGb5x6pZq5T0yHDRrS7WtLVpS5Ndwi9EQcqokNxChkdQr5GhQsS9tUkNN0XH9PtdaVRUaTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765977671; c=relaxed/simple;
	bh=PrMJYNtWuDLiGCMX+bzXs0NDArAg0Prs6L+iwEdRe3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RvCIrK9LSiCxUf2MFgoT/r5Vvg7A4Y/+82+R9A1r9QD5ULyHj1SYzEYIHBgUeUkxdoEEKb0cN4yZQh5i0q8dZkY16fKvhAoYGYLkVOR4N5RqVUh+DmXAe5BxyOCY/uBxysQZnNsARs3ldl6r1hdD6G1J2j3zRLYQLN6BNcvHBBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hCIYQNOE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IimxU8ri; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hCIYQNOE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IimxU8ri"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCL6HP2042892
	for <linux-clk@vger.kernel.org>; Wed, 17 Dec 2025 13:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lCgdcjNrFq+Gv500NOkHLy1Wj5bbep0Yb+KxC2CLZCI=; b=hCIYQNOESCXFCU6p
	YKEuFyRLxurXofKMTnPM6vkrbSDP2L3maLCCXacWh8c1Fp+lv6QLnho7LJI4kLtA
	TCRYYz6KahCduqLm91Q6aREt2D6HZPsl6L48A0exhuX/zheING3fQuxrFaCsdu2f
	2IKc7PE3sNcDETH0g4EwJ/jRMStJGKPfiKWYK5MTq+s2ECFmlVXG6w7fKPWd29X1
	3bnbrL+N0Yy9qxZKZTkNM1Y9OrxhU5KpOtawmTJZHSZ4P2YiahJnWHgpnOMK/xKR
	BD6KYtzZhmAdLiAaywOEIS37pOxhmM6b4fp8fPRYikTo6Mlji7K8m+dES/le2eDh
	51rEbg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fj1tgsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 17 Dec 2025 13:21:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f34b9ab702so3065981cf.3
        for <linux-clk@vger.kernel.org>; Wed, 17 Dec 2025 05:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765977668; x=1766582468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lCgdcjNrFq+Gv500NOkHLy1Wj5bbep0Yb+KxC2CLZCI=;
        b=IimxU8rife7fHu1RtRxHL/uagIMP68hqpguNpWRUQC/mbOu5iyjwfCh4ogm7z9n336
         NaMblpROYraC7qgV4mXFTwjfv2lTuQw+ko7/d83ebhwQbkyan+WrxlwO31xPyCpYWiN7
         DAtyD3XByEmev3q477369PLIfJDOjbi9YQFT5AY/MsdjbrkzR6I7ExKXQ9A0V4WartxU
         Y6W0IqV40RoZSSMTDM8hfaXgWxaLFDFDEduxzFvptlDj/S/Q/xpvVZFDX3yDKlPCoe9i
         jd4ql/CteQQrDh+YiYC13GSXpsjP7U3R3NUznjcyeCStt/Tp9307HFMmyTdkWRZ3dsHb
         kVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765977668; x=1766582468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lCgdcjNrFq+Gv500NOkHLy1Wj5bbep0Yb+KxC2CLZCI=;
        b=X4odtVInYZ/2YjAifCKIymeaUHhEvvVCesv8oWZnYVtRwFPY6dTAFoGBLiJOOwkDL4
         +MqMg6fLxXsV0rNdqZ5mNs2EEECAPkLDfJ6wJGmSJ6x4a/EkrJVSLC/bFweVY+KF6Wz1
         c0ADId5OEglQpfEq2Lr1Z4eR1xy7r4NB7P9W550HmQGUEW/BsYiYGX1n4SjiRw/G4qhO
         XjIIgxye++UEvmkjEMjNZ03E5fb87VJjOlBT8iWj2KE0GLjmZaOvPsufAMFD81i0Dhvf
         dXHbhFEZPHik3Tt2KE9qEL3ZH0TH9r2oJfiYXjJ/i+1HZAXqaWU4Wrz0odCoJbS+qz/p
         153A==
X-Forwarded-Encrypted: i=1; AJvYcCVa95QVSvjfrS1/9HQ3IVldDzQ7Pp/XJgrz24RzoHhOWsan25hR/Fbn13t2Z92GhBp/SYrZyF28W7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsVcIwZcWHcDmOTvyTQxetU8OJ1JsvSOn6bFJW+90+tJeCAv2Y
	ssZiNuWqq0R8+LuNesSS6uQqEAUq6kwFKKC9IyJktAsIB6QPsyHRWOM3JUQUVpdEHVWznIPxKV2
	PnVIRD2OnxiqsK7Yc1oUOkrXqu7q64Kzvgb+J/HZcH4uOIprTSNZyTeKK3dBEccc=
X-Gm-Gg: AY/fxX5BCWUzlWrd3A89gu1SjvvoyJSsaAXVSnSFlmdXqqOsS/zpLIo4x6WsHVCE2et
	FbwAmgN6cU4tfGeI5Djw8Qn/uS5dezrzrQhBlndu4ctA7wQii1cUxa8w9lcTeJisDBg3nWwDUv4
	522/RWGYUtM4RnmPsoVTae6sHMnW2EYvzgvUoGfRS5pcEb7A8LASbyH+DDZkMaw+oXtVl0rF0+j
	JlgL8FXAYzM7sMTmN/Lm7TZ3BojwAgnNSUL8fYV82FVTHgaJGOZly+gdoJ/HarmhV28O0kufH1f
	qTeW+41kX7th/jPnkTcURtIHLAxqthGMXrfaQ7iCHFLXoeFISGjn/uLqnUFUsKM1no1x7pBheDT
	eYxyXm9cSCnlHUS7NuY2wYMx2GmQzPC0GByYu7jNZMqiyOG479lOypaO/l1HzOr93KQ==
X-Received: by 2002:a05:622a:1191:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4f1d04b1b70mr183152841cf.1.1765977667840;
        Wed, 17 Dec 2025 05:21:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsGyEI9MqyBXHu9MJGYHVWFgi9POwUHY6EBl4git78m54J9h05gobTJiMeDB2CkmGRH8oTkQ==
X-Received: by 2002:a05:622a:1191:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4f1d04b1b70mr183152181cf.1.1765977667204;
        Wed, 17 Dec 2025 05:21:07 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa5d0b20sm1997438666b.64.2025.12.17.05.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 05:21:06 -0800 (PST)
Message-ID: <ca118faf-3451-4b83-9074-82bc5e1f731e@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 14:21:03 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] dt-bindings: clock: qcom: document the Kaanapali
 GPU Clock Controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-7-fb44e78f300b@oss.qualcomm.com>
 <20251126-elated-stoic-scorpion-25b630@kuoka>
 <de44560d-4ed8-41fe-be7b-56412b933a8c@oss.qualcomm.com>
 <fbe39eac-7c92-4a08-bafb-31e5c51a0613@kernel.org>
 <503f445e-0d12-407d-bc77-f48ad335639b@oss.qualcomm.com>
 <e8bdb176-b6fb-4dd2-8b5b-9da8073fa915@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e8bdb176-b6fb-4dd2-8b5b-9da8073fa915@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwMyBTYWx0ZWRfX6J3F/4HlRJn6
 a0a/J+YY3IJ5mSAF7CVdy7Vo1PWGt3bKEX+wnSMFJPyvwHAK6ws3XDi+nhgX1U5dSrcEhczO8jr
 8aglsADHBhI2Tb5Raofdr9cEzG87Z5pouFrntQaPmFGO2SIJOGQpum5Cj4igRVIxbma3xBzccqj
 erBbq2dthzJIv+SHGQcZMzLGpz9ulNoIvLIxv4SwuesQXQQmYNBfl2QCJVXf23WS2gLAS+KLyDL
 BnBCe/xwzhHEpA4VyzwD4iGb+Vto33UESSOpBzrV7j1O3+KfRQBy48CSj3ECARNdpKNQVzQo3Gj
 zbUMalZiqRDutWKXOii4JXn0da5j88fNo87fPeafMVV9X62LerH/jKOI3YT2lYVZFg6No6s0SAq
 0H/sJIbVOEgeQmC2BVzYbdkYPH+2JQ==
X-Proofpoint-ORIG-GUID: oi_mQ9--oimtPLH0iM-6reSMVgfw0SD9
X-Proofpoint-GUID: oi_mQ9--oimtPLH0iM-6reSMVgfw0SD9
X-Authority-Analysis: v=2.4 cv=edgwvrEH c=1 sm=1 tr=0 ts=6942ae44 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=37dNUGJFtcrBIb5saPwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170103

On 12/17/25 11:09 AM, Krzysztof Kozlowski wrote:
> On 17/12/2025 10:32, Taniya Das wrote:
>>>>
>>>> We would like to leverage the existing common clock driver(GDSC) code to
>>>
>>> Fix the driver code if it cannot handle other cells. Your drivers do not
>>> matter for choices made in bindings.
>>>
>>
>> As it is still a clock controller from hardware design and in SW I will
>> be map the entire hardware region and this way this clock controller
>> will also be aligned to the existing clock controllers and keep the
>> #power-domain-cells = <1> as other CCs.
> 
> I don't see how this resolves my comment.

Spanning the entire 0x6000-long block will remove your worry about this
description only being 2-register-wide

This block provides more than one GDSC - although again, not all of them
need/should be accessed by Linux. I suppose just enumerating the "extra"
ones in bindings will be a good enough compromise?

Konrad
