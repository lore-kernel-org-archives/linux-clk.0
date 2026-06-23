Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3523D3008
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 11:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212601; cv=none; b=Bqtk5dioHsCJ6dTRL7+zxXcVNVgHn4B86nMZPSDboB+SQ+6oouRaclUtkHclDBURB0N2o6xorNKWU0Ru8fYFviQhrqKGDnqVIwlXx9pca9YaAxcNmRX9fG5gb0lG9/viclmOMTHOAUN/o+2zJSE1ZskUSZ5fgGlPMnq6JfKKoPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212601; c=relaxed/simple;
	bh=0nT9hdNPje/aGUFGC9AidrWMm4oZfR7I8Iq44grMgSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m9//IpMQvl+NZZieQjofXl6w40oXyKflx+wzVdmqOx7vkI8ujdM010Agsp+NYpskqc+zf7wm1FKFy/Zxr+Wj00bMufNKIOpf0d2kPFT4UQf7ylpnpaFB9tb/fgNpDZUDVxELY4vnWcd9AG01fLb6RhK1qj/Hxr4Uq2y0iMqWjR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RVdCAvqE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hMZets2F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RVdCAvqE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hMZets2F"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsPIc3962317
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 11:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F8pQ7+KpbTQISYSQqbM73wZKxkqVf5wMyvX6KaoXFwg=; b=RVdCAvqEWeUN4sA6
	aJ7cAuzKkdlxrFrS5DnO2V36dnxYfoJl/dCrO2ZBhDHzppUXsiW/EafB4FPhDLEU
	J23HzHeoWxl53kCfsQkJuGqtEJkQYQfFnTg4zopVtIeAiZMLpfPfsQ/AtTobEv/r
	7L/SyN/EeZst+NGmPFfCJQnBjRELF4F8eHU6ymokW7+gpc5J48T3pCqw8pBpTn0R
	IPipluNIN20IrrX5fSns78Msa9fw3XP8DtAM7n5JlN+aLf8muGNGg76UG3litXLW
	CqoGPbtW0MSzUREcqcocvNzswkTl9IfEg4daeEjlGCH7h7TihD7dfhjNc9kdr3oW
	wdbJmw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr9yr535-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 11:03:18 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c5a5133221so45157137.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 04:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782212598; x=1782817398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8pQ7+KpbTQISYSQqbM73wZKxkqVf5wMyvX6KaoXFwg=;
        b=hMZets2FSsZp7uinJpmtp9nK4DEAaeqxpryfUSfvqpVisg2hSBoDM9VL286iCvTYFt
         2JkXYy/GPCZsvV5QPbABC3Pq6ZCIQ8e170CdJjsqjeE3/AEwN6Jmsxg1MZdQCrNoq47i
         JPZGBQUlXRkMvMXxrrF7qkOSuNXp/SkkdnoBNbp6+yJsRdGw8FhA8w7rQ4/QflW0k64H
         NInsxPJcekp3cUuf6KUrN+Yx37LxC8DyfjiMiAojujyd9bjhg0ehKNEjHJXVB/zaLAGh
         J2kauL8g2JSx2H2SXFSUSGi8xn5oTTxRtV2q32jCMkb7KN6pWO7GodWI38ckZWBuXFT4
         /KMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212598; x=1782817398;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8pQ7+KpbTQISYSQqbM73wZKxkqVf5wMyvX6KaoXFwg=;
        b=cTyUTIoEn51ejssNsFim7Q0Ex0uIQt9ig26P/LfLQ7v622dsMkULSRJ0tzWw2iNYuq
         MNsJub62ifAXzUL4gQ28C3WgL/bCLJVxUg7vWjGN1oa5Q8z9rCEsug9rliK2P3x3wjmg
         d9A4t8Y4W/9bNOPxsPmPN+eMbOL3bC7ybvgBf3EIh0r7vlEFnY2LrO7kPZf0bWSOWUjY
         ANC1ZBUB7G+JHw5W5mLKtG8wGY3xkOEBLQQcUiBxsxepFh6GlkYAKQazrhT2qubIhG8H
         /PnGwDGvJ2UWeYP1gcBWIg6s028HjkGK+lSpTq25a2w34Ph/k8iIrBj9vGK7ZhD1Q+As
         2yDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/2RWkmp/OES5qpTniM0jy4VxWxwPKtA+K/LktE6L0Vc2g4w4lRbhqnHg0rDm1EVsn0EnjJ/jgFcsY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWyZT9O8QC39kcB+w7HTb011nNi54OYFNF/GHL88iW2sVJVeqp
	cfaFPHf0Wd3J1YPvD1RgQRLU3Epv82Q9gkLc7T3BpXry1lCzxkVbn4U5lrj0qenm5jNUtA2TkP2
	Oq6z1TGsEvoBLAQSfIGV0ni5iU24kljQz9WqrVoqygoWO3hA5iS2tmn/NIpDXhjQ=
X-Gm-Gg: AfdE7cmA6mNfambSLPIvy8mjtyFyBIV5bvUsDWLUvZ9fO6yx7lE6QLraO3v0wmGf42/
	HQRzNDqgSeLbdT/yjri3OgvzZ8JCt7kz20JS2MeGT8LKxcHTXfWydtei5NJv3Ed+mFMed3UCNhB
	gPM5NoXq6RVRHOS/NBBPdCKjf6nCq4BnN6D0FSjAC9Op9jcG4I3XlBNXIwZlRtpPaW16zTz1W7X
	PInH1yQNl5MpHOoi6mTmGRhk471lQewF6F7fgvALXvFHJwWinGI3tg6/df9kx/yFoAze8XAr4yf
	uP5M7YS9KdJuFUa4RnAgS146eGgAgWdUHWBbc4LuRJN4vlBbP/RXec7ANY61UB1pCn+k7XcaANS
	8cQRkUSzZhn07IZE0xQqCRVmGxmiC3GBLwZs=
X-Received: by 2002:a05:6102:e12:b0:637:30f8:5cd5 with SMTP id ada2fe7eead31-72b172a99fcmr2725511137.8.1782212598343;
        Tue, 23 Jun 2026 04:03:18 -0700 (PDT)
X-Received: by 2002:a05:6102:e12:b0:637:30f8:5cd5 with SMTP id ada2fe7eead31-72b172a99fcmr2725475137.8.1782212597845;
        Tue, 23 Jun 2026 04:03:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b86de31sm4303377a12.12.2026.06.23.04.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:03:16 -0700 (PDT)
Message-ID: <6123a923-21dd-4f69-9ac5-02165963027c@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:03:12 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8450: Remove unneeded reserved
 memory nodes
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-2-37e2ee8df9da@proton.me>
 <e1e492ab-884e-442b-8410-cc100c54fd5f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e1e492ab-884e-442b-8410-cc100c54fd5f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JYSMa0KV c=1 sm=1 tr=0 ts=6a3a67f7 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=qh3hvowi6R8gCIqNXE0A:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: oZCOXELb-PqCtWxDs8_6XvBPbfIizm9H
X-Proofpoint-ORIG-GUID: oZCOXELb-PqCtWxDs8_6XvBPbfIizm9H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5MCBTYWx0ZWRfX33chLzcFEku+
 1TqtFXPCzsgVRY+N/XlP5QGmeghWJhFoDQBR7tMQhI0nJy5Bcvm51fiMsIZmhKENS+m1Xs+HOUX
 Pn2tH1iONtOQsQbQNcgALjUS5sovshgNhlKt/JETtJzlEcBfBylemNwmq9+PCdQEC/86k8J+CXI
 cLB2ONicQdWqcRzbYxvyVl8IjC6shZlafEsn370T0Ifr/s41GwedzysKQatMLOtu4IaoBsYvtow
 OjBnGVNf76GGRuiEC56g24ckhrdbqlob5QCMXCsaJYKVV03ExgvCAMLOzOND9MN+XYcO6cs9pO9
 ANcqwvo8+1xrMWqcgW22vYn+pqvvTWTy29z8lxiUpF3CFaBngVKl6fTB42I9veTbDeSiTurbS6T
 Dg8x8yFgvAxKw+73s65CfEOLGVDXJiXTMO2AGVNrdrQ8WRVzErnNlIDufDZFzolQFENZrliTkqY
 LlAT/F3i8jPtF6GQyFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5MCBTYWx0ZWRfX7GHUcx6uzFpD
 RoTW7E/KfHk+hPe5iINTEI85M/Qwk47kyFM1CK1FETRiD2uYD7YWRkk6ewyL0pHIY7x7o/wkhdn
 GnRk650ENe/hs4wLNu38kp0dzyEW5P0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230090

On 6/23/26 1:02 PM, Konrad Dybcio wrote:
> On 6/23/26 2:54 AM, Esteban Urrutia via B4 Relay wrote:
>> From: Esteban Urrutia <esteuwu@proton.me>
>>
>> These nodes are not present on downstream device trees and only take
>> memory away from the AP.
>> No crashes occur without these nodes, so remove them.
>>
>> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 15 ---------------
>>  1 file changed, 15 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> index 56cb6e959e4e..e34e3c05bf74 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> @@ -752,11 +752,6 @@ oem_vm_mem: memory@bb000000 {
>>  			no-map;
>>  		};
>>  
>> -		mte_mem: memory@c0000000 {
>> -			reg = <0x0 0xc0000000 0x0 0x20000000>;
>> -			no-map;
>> -		};
> 
> This is mentioned in the memory map description, but is not part
> of it.
> 
> I booted up a 8450 HDK and it doesn't even have MTE, so it's
> probably valid

i.e. it doesn't report MTE to Linux. I don't know if it's Gunyah
trapping it.

Konrad
