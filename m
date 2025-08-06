Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC39B28A1C2
	for <linux-clk@vger.kernel.org>; Wed,  6 Aug 2025 09:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754474259; cv=none; b=tD0FkFdbDqS0limsBQewOWH2KvQpWFp69z6isdBepaTIHkT+Ic5a0TUThBs6QGtP4kwxqn71sW02urVg7gojRnjGlMBT13kY3UV4ULwHvoSQ+s28DGyhHXTidSLWikf6Lh5cOWoUVhWsJ+YCw70Xsh6U0cHHMNXY6OtauQVKyBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754474259; c=relaxed/simple;
	bh=lsYFOYME95FfYHQgxD2fXes4j/sNpClVL4HShdy3UpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mMPnQmuX50ro8RUe7MKQ0Z0xAfM9F1tlymBjNG7xq/ZJpz0NwEyP6gMIUjPcSnsW/gcHXCo0gZGhIPBzsvzQQjyloWOCVRNhM6+onjaRecu9WsqYZYSEC+PAnuIJi1aBBKSCsFBc8rL/mOcSJuO2E6VnBpUCJKZlVaVJOb59G7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OsJ6d9NW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OsJ6d9NW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5765iwsE028344
	for <linux-clk@vger.kernel.org>; Wed, 6 Aug 2025 09:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IqxXBbq7cPgkYcO7MMpR2qxt2qS4qD02969cwFn8hIk=; b=OsJ6d9NWKHJkMZoa
	hswbPYW7K9UASdz9PiijZCTgAMlVGh6jlG1/CShuLCAd3YwCCmKUoXO4qtn7bJ9L
	M/N4wGTswbUQzraUQD25IqWF0JAIUIaE9zCy/VFuL3x9C8WKNOeQXjm8L92UV/5G
	QBSdlA30mx9SiuY3mdQYnlNDIExNRl2YasdrSG12Hluh3BtlXwwjPdd2yfpjCQv9
	T+TgBjbHSVOmsFPXmp81Yv1MRqVxjem/jt2wJfH9g4XZUScn4DAIe0aq7lOT7BFq
	BkgSm+MjcqfEmCXlxcwvbFwtl26XSn1k7McNKHkdp8YC5HyxfeHREY7RctRd1GI3
	QPtZEw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvxtctk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 06 Aug 2025 09:57:36 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b38d8ee46a5so759228a12.1
        for <linux-clk@vger.kernel.org>; Wed, 06 Aug 2025 02:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754474253; x=1755079053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IqxXBbq7cPgkYcO7MMpR2qxt2qS4qD02969cwFn8hIk=;
        b=ZPHkXG5hlr62ULSTYGmvpwmXC4/ZGHs0/vEyla9IC55AazaThlAB7nd/PMLQeOBzAc
         UzLxLlmtOyPdj/v9av5Bak9dCDdsaXW91eh1ereWMq2Jgqpxr9Altlnz/i32YbG3BDZQ
         2cqw+nOYbb2nvba2STFNsxKqY5iFJPMCzWQqZUE0LwRMophWGJgL4r7J9WOfQfSe+uKe
         YTO47V4bcIdinHwsbqWbQHuzJ204626JA2he/8FcL/m4IkPW1qzrbIEL07EfZEzL0ShL
         zkPFsgGSOgsmNO8defupJjGPWsd8XE9B9P45aRYfWmNQuXBUcCISAsTnGTS60UXVmuMF
         9FDg==
X-Forwarded-Encrypted: i=1; AJvYcCWcq8gQ0edg5L0cMu4liGnPCqRRK3lAwHh/H/PmnN29elGsmhJI6ebWMMTi7i0jak5BzHiyZ9yMWsc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1KAebMKuOuWIv3Rur6RvvKJI9efS1dwFKSqTMlYs0GN7p6t4R
	doEmGzLJIQc+BRihg+NeGW+s4QrKmp6woDNjYKOuuqIV5esfPPCA9d4tyALOgTaIczvMfSWkaZI
	TmIweJ9H6CSpX5o6K7iRocnmfGSN0MBoplJZG40thsf7uK0grpM1Me9cXbtaB72Y=
X-Gm-Gg: ASbGnctpoyZCtFUNKLft+fU496OXdjMW1GwFdCvyF7z0SAttf0F4NY5pdyxJc61jwFT
	NkPgEja6TiOrsEjxrMqVoUWfmzbO+KhU8ObiZ2vXTtO6Bm1Fsxm1nOvQy3FTAc9l2P8u20UbcND
	1C4TU70lgveuO2gO7rttZLtcrgyx2RSuGx34qzcMfoKaoR0OiTtD2KfEAMoEc9+Y1dJEh9sC5RJ
	PW2Md3cTGApGDkDTCzG02n4lhT1GuVLLNNwMQEbP5bD589GzVYoioY9dVqhbWlWRrCI096FRnTR
	LnKOiPT55iDEaVyOhikdpcT9WlBgYO6Cu6ARE0PbovpoVN5hKVOGOTdeLSnhmkeYHJM=
X-Received: by 2002:a05:6a21:9989:b0:240:1132:6ff with SMTP id adf61e73a8af0-2403193f793mr4134197637.7.1754474253325;
        Wed, 06 Aug 2025 02:57:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvOm29N4CcerImZ0VqJXj8dtUuBPdLJmLmcso/logCxwkr3fV34DG4P2Oi7ic0GJV//FM8EA==
X-Received: by 2002:a05:6a21:9989:b0:240:1132:6ff with SMTP id adf61e73a8af0-2403193f793mr4134150637.7.1754474252843;
        Wed, 06 Aug 2025 02:57:32 -0700 (PDT)
Received: from [10.217.216.26] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bac0b57sm13036378a12.31.2025.08.06.02.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 02:57:32 -0700 (PDT)
Message-ID: <5d75904a-05f5-4cee-9ff3-821b692f6a6f@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 15:27:26 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] dt-bindings: clock: qcom: Document the Glymur TCSR
 Clock Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-2-227cfe5c8ef4@oss.qualcomm.com>
 <20250730-mottled-myrtle-bull-3ae03c@kuoka>
 <9cb06263-2a61-4acd-a9cc-157abb832d62@oss.qualcomm.com>
 <48610dd9-16c0-48ec-9997-2de9e0f7b3b6@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <48610dd9-16c0-48ec-9997-2de9e0f7b3b6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX6WjuDdcpGQfs
 ZfD8GwykEsg5275NYqZmT/SQBusggO7054OFqz6aqLNYuT+4cBFcVyDLYYbKSWFUiqmdSb0rQIR
 Kl5bRt1/l8EIIXuBNETNFb5BZWvD+KfMxQgAnfTwJWK5VLkgwg0AegB16lk2DGvRcGQ3oJlqqRq
 ZF6ZjDDLpogAZkZUp0hOSXsr06czNd7SuUryBte5cwNU7EFIZpUd/94ptnqC4W6/gi77iG4GgSt
 SFMV2l6dZxzaVcyLs96nzxM3oiKE7X7k33dzUyzQlmrHh1PLPVo9G4Va9J9MF62njRgFrj3i3KP
 HkExa6i6FBELvMl4HQjbkmZO5NxanwQgfJGVRzOSk5noA+Vyp3+g7KiVNrQO4aAy+MBJdOOF19l
 KNvuELJA
X-Proofpoint-ORIG-GUID: AhYPanNDESBrkOsPPOHl1Q0iODkcwxlD
X-Proofpoint-GUID: AhYPanNDESBrkOsPPOHl1Q0iODkcwxlD
X-Authority-Analysis: v=2.4 cv=U5WSDfru c=1 sm=1 tr=0 ts=68932710 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=xJKRXGaZASgMo-ZfVxMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060009



On 8/1/2025 2:40 PM, Krzysztof Kozlowski wrote:
> On 01/08/2025 06:14, Taniya Das wrote:
>>
>>
>> On 7/30/2025 12:47 PM, Krzysztof Kozlowski wrote:
>>> On Tue, Jul 29, 2025 at 11:12:36AM +0530, Taniya Das wrote:
>>>> Add bindings documentation for the Glymur TCSR Clock Controller.
>>>
>>> Same question as for v1, what is Glymur?
>>
>> Glymur is the Qualcomm's next gen compute SoC.
> 
> Explain it in at least one commit msg, not in reply to me.
> 

Yes, I will explain it in my next patchset.

>>
>>>
>>> Where is any DTS using this (or explanation of lack of DTS)?
>>>
>>
>> Krzysztof, the DTS will be posted separately once the driver and
>> bindings are reviewed.
> 
> Hm? That's not what I was told thus I ask. I am sure that above is not
> true, but if you insist and put it that way it is incorrect. You cannot
> send DTS because you wait with drivers to be reviewed. We want to see
> entire picture.
> 

Sorry for the confusion, Krzysztof. What I meant to convey is that we
plan to post the DTS after the public announcement of the SoC, which is
expected to happen within the next couple of months. In the meantime,
we’re hoping to get the code reviewed.

-- 
Thanks,
Taniya Das

