Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2627360753
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 18:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773857529; cv=none; b=A6Ktnxk+NlyJ0q6yfM9KhviSarGP1p24cDf9lW2e5MC6aPPryZwj/TOZnFc3yMnMUb83Q/GGaQBeh5ncm80wxFUCWjiQQ4NBwkVCdIgMmvcTqXLq0W1ZNuLD+QAXFG9SgzwU7sHlWb0Ki60mP8yeMA/6499X9zVWsbT9Iro1Ujw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773857529; c=relaxed/simple;
	bh=AvpiGxvavjN6CMkDGekeBWr26O5+mruHopbv9LKEW2s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=hBE3jpz4mK/hkZ+RZ1aZL7+U36WxcM4jQ6StlbPqWgPpvD02LFhxl+/IVYQXHGvEKl6hLAdXWk8ZYDmaY6yrUsAb43dOzQatIxJOce1lDWQ0gDBOg9PHk0zR0pAue+vG660FIR+BjOneVzmRh0Tichmifcv84FZi/jbuzSgyKuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X5dqzScf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fVAXVUUE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X5dqzScf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fVAXVUUE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IH1Iqj3414698
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 18:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bfG7RL/BcrgyAT1igZMvNMLVT4y27kMw61RURRVQq10=; b=X5dqzScfYWiUyNK4
	UDqOonk3xfIKfIEdaY/KAQ7kaH373n9CdZdFtco7xPkZesPoIrR0rdC6H28IHzkf
	0IJtoKaeUyohJ6fZhhRleX2A92vctmfD+6IeVKxmCBhHMzm5WFKs73r2wkkzRC13
	RuIuTdGDoq2GX4MPJ1vRtkPs56k615DdwXgqUJWhPawU7D8wgn/Qq3Ms7GAxx0p+
	aepzK6dYgKIwDQP7SmV+sbbdIXU33EsR4cTU1sHXpuB5xUE4iDDj1C6eNUF+7RJc
	f1zyJA7vOZsRvd85c29Gaehs1vEmcuxrlrwOjWtFBOlU+czBKrTGWRA1NYCNCE1L
	Gj792A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0032g9aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 18:12:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091782ab06so9836241cf.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773857527; x=1774462327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bfG7RL/BcrgyAT1igZMvNMLVT4y27kMw61RURRVQq10=;
        b=fVAXVUUE+I4AZ8pQcGmMBuS7VVN3DgnPKXMPa46TZwi17BXc1JlSfvQGM0xMNJlWQe
         XSvfkWX6hzmR8ocb87nVd3TOb75qyAfjpKVFRkQlgLcWNmYeQHHXCi7w7+8XTLiJ/j6d
         GTyELtWv0h4PhfpBhx9QHNIPxtDbkTgv5TnszajawXVxdTGCF1zrz7v7nUETIfqDO5eM
         YSyX0Tlafr49PaG/vbGi9rLuFOVbhdLOe/peblBwJMvqOXGCbl+/TKU4Wz4VUgCQdOM+
         6EKmXZlMzFI4be7u7E9/kK2be+OE2qZmI3hRiCRyYKatddbZ06SybKk91YVy5gkRhUlo
         v70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773857527; x=1774462327;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfG7RL/BcrgyAT1igZMvNMLVT4y27kMw61RURRVQq10=;
        b=jNc3IlQuYLQPSZQLt8sgHkv6X065KBs/kTTldzzaMXfZ4QefZ1i+UVqXrPAYorLdHS
         HmjW6gOMDjYx9srvNjZd8Gbv6F2MPSMfMg2x8a8AyZ769BKt+Q183q1ihoooM+Ch3DwS
         hAmbAyvty804oBxcB2UZ9+1mkuane3uEAGY2f06mzJcl49Xrk4J7V1SxUXrq/jK0FhgY
         afB9IncxQ+LXgMLRoFdu0tdMWGjf/AT7fCUNby0gTAjDtdWS93KyjCg0bCjAy15ez14Z
         jFBpLJlQgJrV7sHuKGu01SP5CtNLQRA6h5l1v3UfMiHNSr+kpm87o7z1YZ4xtZC7kZGQ
         J6uA==
X-Forwarded-Encrypted: i=1; AJvYcCVuJdhhK3K379XjZXYqTLKRZpH4epHFeBNSfO+s8T3fz0O+gZVBWOpTc0k2liTMPxz9dNQCd3fN8dY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfA79oAas0TwLOI2bd9rRzMwrnJc8iKYo1NltO2f4TdrrzZAnU
	FepmEPWCV6tv3DqM5rPhQxdMqDJQ3ge4tjfQbvtnQfJ0KPU/p05Y0db3Zn9DYUpl8uumNW9Z0ry
	OIEqIj6RtSRQ52rP0ikFffr8ASEtR2CRF8g2M8NgQV0x2SgNOvkxPPckADr/xzBI=
X-Gm-Gg: ATEYQzwT5Pl7QruF3o0EXDwqNppLbbgNdS0fdJlJQun0IeUJH8KCzqzV5t8YtlkVKwD
	qziMWIGNmiG86x3/sTqV1gFNFKLAC8NUpDsbennity+RCoEQ+NSKLzuQhRiawPido409pIU2dk8
	vcYDT2r20ZmGxqCFLIvHPXpKtVYUacXZUvkQ72Jhuj2GPQDu7kUjcTYAXO42NzM8ffCrto2FXZo
	wxoePqrqcE8iP3rlGmucEkDe88miMdOFgWFtkdEIIk0C5p0paw/WhmMFoQOKjdkKuSxKNsoHmM3
	cmca5SZliqzl7tYCWJy+abnWZn2BNxHWgw8oKpEKj1t7EswNvcZhfN/ytwi+ZobXYfl9Nex2J25
	OnJ2lCMr5Fwi2poLyFX7ZAnOWp29yj1TccSTsUeyCC4Cow0eE
X-Received: by 2002:ac8:5f4d:0:b0:509:2877:eea9 with SMTP id d75a77b69052e-50b14863deemr57038531cf.43.1773857526957;
        Wed, 18 Mar 2026 11:12:06 -0700 (PDT)
X-Received: by 2002:ac8:5f4d:0:b0:509:2877:eea9 with SMTP id d75a77b69052e-50b14863deemr57038041cf.43.1773857526507;
        Wed, 18 Mar 2026 11:12:06 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4b838c1sm25175935e9.13.2026.03.18.11.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 11:12:05 -0700 (PDT)
Message-ID: <fa2f6219-3cd9-4f30-bc12-aed03c68340d@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 19:12:03 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: qcom,eliza-dispcc: Add Eliza
 SoC display CC
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com>
 <20260318-clk-qcom-dispcc-eliza-v2-1-8c05581168d1@oss.qualcomm.com>
 <cd63e6e4-e8c5-4c26-b929-cf47e9b58250@oss.qualcomm.com>
 <1e46f412-aedf-488a-993c-3470ad50aa92@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <1e46f412-aedf-488a-993c-3470ad50aa92@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CfJ1MsG6CScugfr10WGcYrQ7IL_Abd9i
X-Proofpoint-GUID: CfJ1MsG6CScugfr10WGcYrQ7IL_Abd9i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDE1NSBTYWx0ZWRfX4TX4EoJZ62EP
 aWVQsExs/50lerKmQfAygRiBOPxasvlqyqevlWMwDN0+fNiHP9Wx4caGOweIhTwSIMRbeGwd6j6
 wztdaIUpl1UVpY5oJxgjbOkkEKurl+j+2jIvBAVYU1wnwqQgPJUFlyQ6PYWIoW52gObHhWBcqKQ
 Ah7+b5aqXTRBfwSIe21HPr68r0BBSpMmgrXRHI5Qtt7ECP/fg8mJdv4q+CQBAUDhty5cXTL3vN7
 Xy4ozeDc6L4ciJlQrQ2fRiEBH0Nu4cNgRGaCtkkmr6mPAVStcAHP69c+8ABDDPl5r0w87JZJLpK
 CPM0vmAV61ws300vYHGTHQw49qELynKjuenr5k1c4uhagKPdU9XMT8HbBexeRZ3thxibJAnh7Cg
 Vg1V3HrrKPHlWo6/IofZUataGsseCe3sznJVw3BZ0tv/Z+BUBoPIjwWebQToTvITKfxOAhA94pX
 ySl770kXCjjb82aMU7Q==
X-Authority-Analysis: v=2.4 cv=WO9yn3sR c=1 sm=1 tr=0 ts=69baeaf7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bFbsAXeepE7vyIqeo-8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180155

On 18/03/2026 19:10, Krzysztof Kozlowski wrote:
> On 18/03/2026 18:09, Taniya Das wrote:
>>
>>
>> On 3/18/2026 4:09 PM, Krzysztof Kozlowski wrote:
>>> +  power-domains:
>>> +    items:
>>> +      - description: MMCX power domain
>>> +
>>> +  required-opps:
>>> +    items:
>>> +      - description: MMCX performance point
>>> +
>>
>> Eliza, does not have MMCX rail, it is all connected to CX.
>>
> 
> I will just drop the comments then, it's pointless to list single entry
> regardless which domain it is and it only stalls patch acceptance.

And as you pointed out here, please also fix the same in your patchset.

Best regards,
Krzysztof
