Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613406;
	b=rn1UP1+k3RN8YId4HtnW1QWExF9VkjLlhCL1RFdVCv1MSGuCYQG//0JQqRS13wnfqDAW
	 mEAXClozSOuz3Q4MTSmRseVwD1Bdt9nYQM/SCh1xVsfRuWcmpbGHA3N9vmg8918WC41uu
	 UgogQyPLhGf562LDoQtrrjJJMFpxdG+a4W+6BTncnEc9dyHD+eeeCdq+F7FjDD5GkOpHw
	 5H9yAABFP+ZLShQ/CMrtHYhRqODmBcK7WLhZIzKEANIz40eshF3+9TrG+hUAQhPPKPder
	 ArWMkm5piEjC9cuk62M85B8M+SHgFShfstXmnn9CLy91lBzoliRCz9A/uqwHZEoBSpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613406;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=smDMy6su2v5TRuoxvIhH6UcIUozCziMfy5Wm2BlMQwM=;
	b=Mzy9c7OTRkg/gmLZfWhotD0sA6GcH4oMyQ26OppRnTXdluHbHkvoyJMw87H43qnzjR5j
	 xhpOSiwL+6QySunqZyqASDez/TJmnKoYDw9ULMlJw0U4vkqVD+Kc6K5C2KCqtJ1oFx4w3
	 GXp4vz2Zc3WiJGxPgxDcfFEZGlvjaBj4smbBYkPNLxb9lDEg6I3E8/lSDEUYEN89Dp83m
	 xrgIICQSAbjLcMDfxJdohgiO6dwCrfPde0+I57lk0XH20FpBO4lOAdFcEck9SXwwVXfdg
	 TGJ5r5SZaeNIp0IsheVMbXAvz6oj08NegXKISQwnaeBZLxzohKyDrZjy9YnQ8YQV3ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F6sKIbB1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dF7U4VqU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB53606A335
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 13:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EB53606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F6sKIbB1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dF7U4VqU
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mLNn555411
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 13:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	smDMy6su2v5TRuoxvIhH6UcIUozCziMfy5Wm2BlMQwM=; b=F6sKIbB1nsAton51
	paC/HxwfC9i0kGF1D9KX0zAFIRfCWqW2aeJh9oyVLl0UnKGQcq3kwi+qrTkjRXko
	zuy7pubBK6K7yvaqsAVvB1Lpu7Fu0BMJrnCf6lJ4/ZPteXflK8hoOttyeCZbkk4G
	9BQ1YFw6tsrIilIRMmFEdGgX1ZFihlDneueV0zmo919xxM/HU7rnLLWvwBvhDGTl
	26VgkQeU4UtPIsekC9HB9IIu5SQJfE3WDZMGxAetqDZFxeYV9EAGeIlq9RbIpjAf
	0HgZwofUi6zcUB3xXDdYGCh5WMRYq6bNDo0eOJy2UClk4BjnSZ1BK/xVVSP7jCy3
	N0wVyg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvns0kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 13:30:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94975041698so1444261185a.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 05:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795613404; x=1796218204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=smDMy6su2v5TRuoxvIhH6UcIUozCziMfy5Wm2BlMQwM=;
        b=dF7U4VqUeXP89S/oo+7JKc7+IRUJEeScod58I4v9l/XRffoYx/uBuVa62RIhf8XOsB
         3tzjZBCqUyHD3P1/KheTIPn0m1XbkRj3Pk8a55CRcy+lFuCVua2Jf8VJcYSnv4G0zSRK
         bIqCvOH7ceLXVsM4lLH6CPr9LXcR78bWU3D835505iEBXx6/ilHrPuY4ShyHOmk5b//V
         w9kaWNtWe2bBA7mRbNvqU6UU2bEOL1jTLDLy5BjIrhWFziaofRjWa1GUtXWsaoNWBKy8
         q9WpJtCi61vHchhGTRxaSpXvJshgVKqs1EHhCr7uA1jYvdbh5O/A+pgzcSTWdFLAOAAY
         1qMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795613404; x=1796218204;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=smDMy6su2v5TRuoxvIhH6UcIUozCziMfy5Wm2BlMQwM=;
        b=fdQWNnFiJV2Sl0yDWfIyBQuJyRHwo8SwtRBSn04GQgMO54lMt7JonzAelyQwgRjrVd
         6zt1FquzI2BTKhbX3qqWKAhAVcIZEAwPuJsYbPhWJDg5gB7vyIEOyhmLdMh8q0/88LTu
         SK36iKXlIa8rzhJ+oNJ0i4QGBo5mhUXVxBXwpvrvgkOlxK+zCs/PP/OQi603D4XgVI0e
         kK2qDIShKEUEboGBrLo4VUVDx62RfgkvT+FkAcUXtl69miE7lgVD2wKf4k3r1T69tuy8
         KlYe15XtLoaqYmpYGZviTYzo5veya7BhtgiuOppMelT/x7kb63lVOP23Ly+OMpmmN2Gf
         m2ew==
X-Forwarded-Encrypted: i=1; AL+hErH3z0nL6Be+st4CWRGbMUDuyd8zV/+ixYpLBr8Ok/gEz+KziiwAvPCLPCEuuU2ANhiSB8LIiiqhV+o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fD/bHESg4JnuzUxrP31OJgzoMCYPMtyUbfyq3ek/Bl+Ywz+J8
	YO6tlIGTpnNdnpmTTDEzGdsnfvYDe9E9cT+nVtv+QqV7JhPziswV2y12kCMruwhK5MevLG9E+3v
	Ajha57jhatTDYAXea892sgdt+440L0yz7G+D3a2wM2sdsoUkvrH5nudGWV1zupKU=
X-Gm-Gg: AZFdTZcm9El7dobnmk2MXe19BiF7+0jgN60b3f4FIR1WDItv8miPfWknIjdx5zLnbnS
	0M7BtT+qtFjlzcqWzzvgBxDgjIX7OAwVPQckRUeX7tJQrjRyxiXpjxzj75+2Egg7t5gwar+CQKA
	ytzJgrWZYRiZ0WkIiuS9IbV1wGXVBdcsKjb4Yc4JSwPvrob/SVAPLzCTBMOXQ8ZsVjdBFdhIUN5
	TXRRKFlkdlPTXJwSHumYFOZumhePXmLOMstTtWUoO6GaxasLeIucbk/sODUllS1Pj8upQwuQ9EY
	7beJDgc/kNSw3LMsBhpFT0F3mAHe6By/g6H+MBEbWG9EMZlhc2s69dTup+x7rCeKn32McId1Nj7
	QGeA+92VczZplf9gEcwNTndtQsKNrW1eXMSyV+lqlibOh/scR7ZmScjbNlrwMP0obwWAv5+tXzK
	pqhDw2WA4jLS9eesJmfi9RJA4aqw6QEpvSGpYhHWU=
X-Received: by 2002:a05:620a:1727:b0:949:8109:67e7 with SMTP id af79cd13be357-949b3815a51mr3328608385a.36.1795613404403;
        Wed, 25 Nov 2026 05:30:04 -0800 (PST)
X-Received: by 2002:a05:620a:1727:b0:949:8109:67e7 with SMTP id af79cd13be357-949b3815a51mr3328600785a.36.1795613403766;
        Wed, 25 Nov 2026 05:30:03 -0800 (PST)
Received: from [192.168.1.27] (83.31.98.241.ipv4.supernova.orange.pl. [83.31.98.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm519677145e9.15.2026.11.25.05.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 05:30:02 -0800 (PST)
Message-ID: <f9190246-ea4a-4dde-9ef7-e29cbf6c5908@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:30:00 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
 <c4509c17-2c67-4f76-899d-548edc47069c@oss.qualcomm.com>
 <b10fa9da-39e1-4bfe-8c09-cc1d5cc007f4@oss.qualcomm.com>
 <786351d0-c7a6-4ebe-bae3-0c81ec20b833@oss.qualcomm.com>
 <c8e53787-adee-4fe6-8a8c-66fab28bbedc@oss.qualcomm.com>
 <403d0d8d-85f0-405a-a26a-54040272aeba@oss.qualcomm.com>
 <4276402c-9fa4-4bcb-99a2-4556ec59f3d2@oss.qualcomm.com>
 <ac7db1b5-ae9d-43c6-b553-ffeccc50e1b6@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ac7db1b5-ae9d-43c6-b553-ffeccc50e1b6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfX8/kO3CuGQMiJ
 337TrSPhgvayJ60ogSrcet2ORuL4fkNRKgC4iQEPuXcKBPz6RuwqyTlkL79ez5jXqqa80SlKNnX
 lGOxbz/EInmvqY9mOrxRaDRwto9pWxfngQG32Y/AkL3sXc7g41hkkg8Jn8jbtYFHiVsNgX7BuBv
 KOUfGLdXkb/DBGMxxaxSVlSRhXVoOYYqy0y6V1PbTsWDkqfX8dJLWzKafehbEfKFH3LkRkNKDRp
 Y4j1N9pAbCG58KSUVKPSWn6ovFiIFz/8wVmeonr1rucVMQFkYebBr6GGeWqTf7wtC1Pb/quq8Vv
 3syhu+sIM0uQeQahhQvu7ICZiaPyTvb57Mmj/JcFxADKKGFGxqhIjzWvz/0ShGKKowaNmWEo50T
 sp3/z0V81Znly12eHHwnZOadF4nGIbg3ur00mMx4+gSRrRoLTT8hjx7SztQEjUvulLtvwjssTYU
 X6M1Ba3PnnUXjRK6NXg==
X-Proofpoint-ORIG-GUID: B85M9EejeHjlv8JuzOB6FyAac4ht0TGJ
X-Proofpoint-GUID: B85M9EejeHjlv8JuzOB6FyAac4ht0TGJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfX/DYITVdPPmG3
 Rn2fNCR5Dsaxo3MAvD69uy5NkjPn0jKCPkGmFMpSTWvehZXAMFNDEjrseN/gjKXEy3ILkZZ+OIC
 1jhy4bHd93S+Hvs3NATuHsiytGER3EQ=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06e2dd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ivW4MigAevuCEqTxTIunpQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=ks9rPHZIzW2PBVneSSAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250053

On 25/11/2026 12:14, Konrad Dybcio wrote:
> On 11/25/26 12:05 PM, Krzysztof Kozlowski wrote:
>> On 25/11/2026 12:03, Konrad Dybcio wrote:
>>>>
>>>> True, not ABI in meaning something agreed between DTS and driver, but
>>>> the values are used by bootloader, DTS and the driver, so I would just
>>>> leave them as is. I rather care about not growing this for newer platforms.
>>>
>>> Right, but they are compared against a hardware readout of a
>>> well-defined value, not against made-up indices (i.e. these are
>>> not bindings). I really don't like this ending up with 2 files
>>> doing the same thing.
>>
>> Not two files doing the same, but one for legacy and one for new.
>>
>> OK, let's drop the bindings, but then what do you put into the drivers?
>> Hard-coded values duplicating another hard-coded values from DTS header?
> 
> Or we can have the defines live in include/soc/?

Then DTS cannot use them...

Best regards,
Krzysztof
