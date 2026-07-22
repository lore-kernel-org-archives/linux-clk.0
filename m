Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF18E233941
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 05:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784697163; cv=none; b=OX1fchrngLFQavlx3lf0pnMZg8pvdOT5wlH613mXIGV4KUbsHFQ8MBJYrfV8d6kd3YUN3p1bqw0vOcwxFclDyepc6lv4x3lUeAYqJCWsFbpx7Xuf3F7i9GZM+3e3v9vet7LFas2BRHPCj+2m/dDQUsI0s3zhX/hPAf9nRZB8K9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784697163; c=relaxed/simple;
	bh=+PIv0zwvDK7Dtbw1NzJOdvZU98UCOcchphiEw93P0mM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NSlf3Iqcd23MH5d5k1NXxzOQlSNVnlDfEp81z9mHXmPCIawSUq7KWH+Cdgm7D4vokSW7o58F+hFXdfFZj46TiFcqcZJyvCJn57FEpYZz5a9uAUV0YEyAZuhT47M2ec8j6nW4eCodTtzcNOnUWN1J7V9jbBNS4QvKGTFQFZIM9wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L8fhP/Dz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ofdzer1u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L8fhP/Dz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ofdzer1u"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53t9i4027579
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 05:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oxfo1suLB+uzJXkAtKHEBljNDBF2FOJJ9F91Ccszb5g=; b=L8fhP/DzzjI+4mig
	f6yDPP96K2hL9htjwPruMMxRjoq+Ib1UytQ6sZ42PottOlu2coc0WLo++cSBv+Ow
	Tf5pfW4RzCKXSG64+BZA6sVUYEXR7hNZ2Vf6sqqtWERqXl1seW5TXiErGotIe2sD
	5YstWsP6TCn9idoSltCOY3+2GpmRafADmaPqxQmTkK7ce6tdgxCov0HSqqj0bDBs
	kfL1xpiZdhOp+dRHuvF/DlwXkicCYfUtFWrLWT6j3UuZtFcy3Qemz6uuWDwv2fJG
	P57/G2fa4ULpXkY5LC0V4GqijO3KvPzOn9ydfMV8z0m9jihO1cngi8v+Cqcaiwdp
	ieB8uA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bsbk4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 05:12:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84870e7f498so12605046b3a.3
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 22:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784697161; x=1785301961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxfo1suLB+uzJXkAtKHEBljNDBF2FOJJ9F91Ccszb5g=;
        b=Ofdzer1u+7nSSbRrP2+2K/0FH4hEe0eAJqGxcDS9xgVhNvcmMTFPWfSTk/I6dQbGST
         oBy4462QvOOaDOgCZKXfnuTIhCgbBue/DcYTLecCkSsNrok6fplz0WeDfS0vJZN1NL4W
         0/xDdoZRug3yvinGaiRWvU9MmuIbEDraxLMHBrui6EUCnZybQUxzsZAbH2ZBaEeNQN1S
         sAJr4YihDp6p6t3+FIgzqOBbbnAMgzJkEsLv6P5rO1qF78CsnV/IFpny4pIsp6xNBdSd
         kTbuyrT+yA+e5AjPUCP95BbK84F50oswIFo8p4wtbgxCFluvNPRxVO/EmEfEAf0HcCe4
         j28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784697161; x=1785301961;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxfo1suLB+uzJXkAtKHEBljNDBF2FOJJ9F91Ccszb5g=;
        b=YEs03Une6SUB2l9+TqOBqjAeWGJvsAWo6h1MxXOcI6BL9DYp1fKmVdIb+LZGAn70l+
         wvp1oLq2RWmh9TD+IiygAbNojrl5j7sGFdiMrJPQ9GRdODvyhhmP/uT4BBIKgMcHNCHD
         usHOVstMXtKxbfkLEvQ5oO+g/XJ9DTlSFAkmdJ+IzKYC5MZxeqvSNs968PipJ6OnXDCE
         3WlCGoASx6g52GZAGXtn7ycRNGyUaxW+T01abaYsw/r+yTjQX2Oc2CW39AAjQ9c5hnUJ
         tza7BxYDMM2ILWKUXNSMG1jsvcw8YBnj34TYuUbV+K2LWr73oYtlUo37E8qqLMwGPRQ6
         AVZg==
X-Forwarded-Encrypted: i=1; AHgh+RoubdI3BchuC04Z7+Y9sOewIl03OB7TBnT6AFRhxti2oivUY8m3Ul8Kq+FoFG7J0/t0AO5l7ln0P6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJmeho28Io1HD0ffe3NWvfJt+AapGXNcqzjUvL8OEGO9rQXW/r
	Q1eLocBFHyOnC6yl6r++46ycegoLLuAN78vc86RgVzWU1hDCnbfln6HlnW33QAJzf5ZBgLwrMs6
	BujZWxrXbQj4UusrOaHd5Zrqu+oBqSU0cox+oL08gUsnZlced5WfU22kS9wVEmPQ=
X-Gm-Gg: AR+sD11afkRD0aKEQ88w4DIMO3R+tzm7C/zO3Dq66NymJwwS02YbxqeLEKCHbBbGUAL
	vSypLpdp/YTJ6H+6oAP4QpZuBDUU+C7ovWG/qBiEVPeAH5J3nhb9Z/uF+iTjbV+K2FerixRArW1
	2kv8nqHZ7jwdt232sL7vvQ94ou41eH6aDttf8ox1Pf0HgbXZyWUGKQT13hCwgTauLuoF089HKQ8
	tXZ0r74WzwgoYV0/wYfd/dN//41sb7miF7CWYat2J8d+3Nm/N2n84AlA7pNOxS9CAnKNj5BLP6G
	k3HYpPp3z410dHlR0qSqjLfBvvYObgYVhzBau3temGqLrdKndvB7VI3/5x0z/gMfr2srCkdvZXL
	swgJMJ46NcsGmSzvc0L/UE4LRlc8=
X-Received: by 2002:a05:6a00:21d2:b0:846:8b22:4933 with SMTP id d2e1a72fcca58-84c29333c94mr20107646b3a.17.1784697161198;
        Tue, 21 Jul 2026 22:12:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:21d2:b0:846:8b22:4933 with SMTP id d2e1a72fcca58-84c29333c94mr20107612b3a.17.1784697160756;
        Tue, 21 Jul 2026 22:12:40 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e1728566dsm701761b3a.18.2026.07.21.22.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 22:12:40 -0700 (PDT)
Message-ID: <7c7448fb-085f-40eb-a471-9ed81c55973c@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 10:42:06 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: clock: qcom: Add Qualcomm Shikra
 AudioCoreCC and AudioCoreCSR
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-2-b320d822cdd0@oss.qualcomm.com>
 <20260717135608.GA476084-robh@kernel.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260717135608.GA476084-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: D8QC-326LM9hYcTlcb20bPY-KOuI7Djg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA0NSBTYWx0ZWRfX6Ww7q32V7ffm
 QEXSWV2jbaMCa07hgwmdZMCxyRP0PjySQBgPu+QqwKoh1vhflp4jWnDylAWuDecnBSzeN4Qahcx
 G1Bo7V4Y9MDuTj6qimsurcLOCwWYrXgozjjokfOB5l0t+JIACVgg7xoQiaF2pkAQ5Jc0aWT2Wkg
 zvqaJwlRxdmVHjfm8fNzxtG2o6J4ln+2vF9bmBrpyhNFM8YCEAC1MJSkVkGYWZQQjGDUdzc3HcJ
 EHapklil3vKL+ZTrMXlMelPz3lqZcpEIVz1j/fB4S9b9QmTZvMajnaNaXIHCSREXVndOsrcmM87
 5/HRWZv/r1F4Zi5jJDVKzWCb1oAC46JTOI0HUvCntbJF7IHPL/yrmSRq3mBI6mbnU6k6+aDAuRE
 vBnKhONNQ+pJlElu8roSrLT7ayOtrjlL7gI0MlAM7GM49fTu5ezGrO1CXyRDO6ZWej0YTBvgvsB
 bjkTLqaqA3OQbc4MpTw==
X-Proofpoint-GUID: D8QC-326LM9hYcTlcb20bPY-KOuI7Djg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA0NSBTYWx0ZWRfX2n8dalPXwJl+
 Yvwdn36BcMdq65H5FXMLEQcjh1QY9MqgEkQPPz0X9qpm5kJdjcU3q5v+CeUPBSalZbZob3B3xnQ
 RokcKJw+lsbvtCaXrMiVeTYlPCqy14k=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a605149 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=fkvVebzWtNyKPa1jhH4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220045



On 17-07-2026 07:26 pm, Rob Herring wrote:
> On Wed, Jul 08, 2026 at 11:55:06PM +0530, Imran Shaik wrote:
>> Add device tree bindings for the Audio Core Clock Controller (AudioCoreCC)
>> that provides clocks and Audio Core CSR that provides resets on Qualcomm
>> Shikra SoC.
> 
> This should be 2 schema docs. They share very little.
> 

Sure, I will split them into separate schemas and post the next version.

Thanks,
Imran

>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   .../bindings/clock/qcom,shikra-audiocorecc.yaml    | 90 ++++++++++++++++++++++
>>   .../dt-bindings/clock/qcom,shikra-audiocorecc.h    | 49 ++++++++++++
>>   2 files changed, 139 insertions(+)

