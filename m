Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC41410D01
	for <linux-clk@vger.kernel.org>; Thu,  9 Jul 2026 12:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783598464; cv=none; b=Ed4yXUbrNX7Oid2qlOmtEcr5hHwHYJX1WKDcGb6j45SKL+HShcTNBrS3U0EudIcSIQdAMNZEsFo4MuqM43nagW5QnsoZlfNc+qNbxSZFchE5ADMtnoeyAoe1WimtDx/r4R+0G4zbjXG1rMZuD8s5HzQWsTLmyvzS3z5nhDgo0Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783598464; c=relaxed/simple;
	bh=ukjLxkiHe+tw8+6yxvy29o709TShRUnzOMu/rsFUy3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QCRikyhHPD4LWRrSRGQhdQr83nrMnvlrqg1xUWJH5/lLMwAMfa0Q0uvBST0q+0DUWp3nFpMPCBc2KMY52BryRCFIL7oujHHlF9NFyImGyXk1vUl3YNd1OVi+FIQmWBT0VFUWzIYknArYU7KXmTOp8g4l4oKOYc78gAt2B/T4asc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d2d7zpJB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YGwhyNVn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d2d7zpJB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YGwhyNVn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNEtT1716269
	for <linux-clk@vger.kernel.org>; Thu, 9 Jul 2026 12:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2zHrV0DH0mQvkMRCsEmNZ1cpcyc9t41ij1zmLU7sQ6c=; b=d2d7zpJBo1tCDGHh
	IkcsmDQ2Ica9ZhM6vu5AELdqRdB4e8BILiy8krZoWLV1TfxAIszjES89Ec2T2S9C
	J9L2I0W4fTMyEce6zjfn5W+frJwVAf7wJLQyw0AHalTc+8tIyKLB63jxLbbWtkOr
	/r80LN39AXTc5Mw/nqgp8WS6cwsW3b447bLWV2Wy99L2D+0dgNfQZ2oDUjkU/RuP
	MWKGHm/nZEzXPljgnZrJPNeD7JSEVTzR1XmeAA2YsV5MZqsBCSxnC5Gnkq05K8EG
	SLJVgQIL3W9YF7+6Xu1nUK9AlC4gZvd+vRWcn8HP9DAeSfQx6zX3ap1G6w6acFc+
	57Jpug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vunyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 12:01:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e6cb57d25so61500785a.3
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 05:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783598459; x=1784203259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2zHrV0DH0mQvkMRCsEmNZ1cpcyc9t41ij1zmLU7sQ6c=;
        b=YGwhyNVnEPtgEmARUdhz9ccpTwIt5Wiif0w3JRISu1RA1jYdxfzvbkP9B5gM/gyUMD
         d9W4Q9LlK4BgZSos6e/1BzBmsrm9OrW6ZVhvZJn423fvW42cS0bbnP6HsAzYq63NzeB5
         lZ77bHHynaad+0an4omlHA3L2IbEOuvVeeo0hTHDzZnUKO5XZo1kfYtw7bFBL4OrG1xe
         yXmpQVfvF/F935kSRJBFoGtgvemysO+DoIWN6vjJPCOsztIS+vHvYqnoe/wK/oyQNqhd
         vOdkOLYWgm3ffTpdFpTgVXTp6MtzW7XvrBZoNrSdxGmeeSjLICuuGZA0RZ+eB5QoZOIf
         k6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783598459; x=1784203259;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2zHrV0DH0mQvkMRCsEmNZ1cpcyc9t41ij1zmLU7sQ6c=;
        b=ThM/lcbKlX8H96Q2TSAN2Bqj4Gg1blhAvP3q5XVa0RqxsnPns09vCHzZAn7RtGHOpq
         C9YvOv69SSYERXGAIHedepnLs7RUkmzG1DPYRKXstZB0JlFWCv6VeTGxz2OZIg7moViG
         4cLMmg0rw97P9PUPp/uOVifJvh/JBeSFZoW0y2iNryTMgNcNDU8ryU0EEGa+Ysi14wi4
         MjG9EGcqa1Qb+Or4sxLvSuOYOzZN//8C0MmerfuFSIOikAjICTml9e9RSZUz3vKTctUS
         /BrdBud2U9rLug5/fx6Uu71DWQ7g+6jqsNQ6thfkwiolDbl2noTQN5QwgxgdVl7H9Su8
         bdWw==
X-Forwarded-Encrypted: i=1; AHgh+RoG84vFQEdP88z7zDhVpZQXFtlD8rqIl1u5ZyugR9N0m8zb8XX6U4Ri62AMKNbHBVo8FuGAxa59vlo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjM7y6BRuRU8NNdmmitMNavJc8qzj5KS7jArGmtuTRKDk4g6aK
	DZzvxHS24iT8tR8nIF9IGNZ4rKS38HQJNn/x66Y7/jF7X34yWchIKckNH0ugmGi6z36Ft04JF+U
	0no8vBlRdapNRnjA9qIzLMWTsOgFkt4OSlhbpMHEfQubveUusYh6rQVPRUJVmF3I=
X-Gm-Gg: AfdE7ckXj3XUUUZI3PghCozfQTuqqz/p0lhH8lp9XaKZrkLj3ppZzP3MXyVRDZBfctO
	VjEsa7eiYlQs66+H+WjbG99ZaeA30edslgkMsNYG77lVGjFVpeCUOXQAM8sTdmnYUrGEjtj/VnR
	ao/oqbAz2UWj3cNQMYWS91SyO53fQkVy9w7Qgrgs8A2cHmrp/a2Fyx/183+QD6qsqu4pJNm7I7c
	9nSjRYbBV/nDaJ/Gs76gD8Uhn8pI20bTtEaRDFI11e6bMW7nfWFHB0ZyODEqGnd98nKRGImKZPh
	9uR91r/vc5hEvt7tPEHWTy/IpLst+sOpgm8uXBN/W0oys4UkfaCeL58vY7/VcCVrV+Xqff1xRFJ
	rMUIvRG3PoTWr+vNYjQQJB3IA1Byw3tyMKKU=
X-Received: by 2002:a05:620a:8813:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92ed764b013mr297579785a.0.1783598459327;
        Thu, 09 Jul 2026 05:00:59 -0700 (PDT)
X-Received: by 2002:a05:620a:8813:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92ed764b013mr297572385a.0.1783598458706;
        Thu, 09 Jul 2026 05:00:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bb94c782sm381852466b.40.2026.07.09.05.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 05:00:57 -0700 (PDT)
Message-ID: <71576059-b5cd-401e-b4b0-c1784f24ba46@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 14:00:54 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WJXqR9AW4ArGQh5eO4nDxB1tgChOlQC0
X-Proofpoint-ORIG-GUID: WJXqR9AW4ArGQh5eO4nDxB1tgChOlQC0
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4f8d7c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=tlOuMNSg9W14aln77gIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDExNSBTYWx0ZWRfX4qYiIM+QiTs3
 XBs89r/KJQqaBxCQLZA38aI4zwtVDRA0Jya71H2I+12pntYSVT5MDWYXQZ9B/RAa5g9sMgALZrX
 QJ6V+Uu6pN3U+A2bjZrEU2fmjSVTeFWVoSp4/S3EaGhAYfnGKbCkdBFywSRO68w7GOmoJ9/fxVP
 IaUYm2MmPDPi+Zdv4J2+7n0wfov5n014z2dM3T8tX/jNlxnJbCZmFohlFJC8B6exoSkaHThQBam
 XUtdtarddD9ArRQSR+mCN6fs+sp7Z8Rg9Y2rBAE9pPeLipLNiaL2WDjlye3GDfiJ3cOnB59NDdH
 5E3dqAXU2czj8RshAlFNbG7wTIhpY26hlD1Od2+KYeOHWU7vB1yUNUzgfbPfCjI666tzM4FC2km
 IRoo5uuC5v7BOzkb/BrYSWY5YqtnynyR+G+etl+XbMzV4r3oERPG47dVkCKYQ22vK2kRmtfKGhw
 1JxB13Vq4sMXpfbrSTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDExNSBTYWx0ZWRfX16EQsjgqR9GF
 mRZg3EaHhHVCBocU4KqVZTRL+asWXrCZCBAXhcxw949jNIwZiZ03DmLvero04JMX6dwLU9SKRd1
 0oGRSrokNDl8ueBllIUFJKLScYe01eA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090115

On 7/8/26 8:25 PM, Imran Shaik wrote:
> Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
> CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
> differs across Shikra variants based on Audio subsystem enablement as
> follows:
> - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
> are required to be supported on HLOS.
> - CQS variant: The QAIF driver runs on the Modem, and required clocks are
> handled on Modem, so from HLOS only resets are needed.
> - IQS variant: no soundwire codes, hence no clocks/resets are needed.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

For the sake of simplification, can the resets be enabled
globally by default?

Konrad
