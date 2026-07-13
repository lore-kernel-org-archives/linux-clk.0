Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18993F482D
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 12:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783945910; cv=none; b=HuuE8REv9muTRfDDVNcxYxtKU/i6BvPOagjB9CY1TvN7lusbBhPX3th2eF1mJburaSzdir2DviWepiugf07pfrTvGUAC4MWyxMocIKWW0lZXQbfXYEQ8rlycjz3493og566QHBsEVv8JrIsKqlja4fvkYZeG/T6Nd69dLJciGVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783945910; c=relaxed/simple;
	bh=wu624yQ1PRaJUjpRWvM2rsbHe7MgA4pQVrLJfB0H3UA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o3hYBNql8InVKCGbpygSd2PBhRITn42mnX+QQbtk4EaNqo0ukL54VdHp7B+qddpByX2ggSl/ncS2AIVI7GysH+l0ZRytsvOuoVjhi2sCJhwsYnk4hSqzzOjtdZe+o/ycJHdo8JATOVkdJwvyvnQpxgmr0JHnwy3N+R2vXG/mf2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cYyAQ6qQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cfvlcx2z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cYyAQ6qQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cfvlcx2z"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCFJvB1506647
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 12:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jGmSMXv/KbmYATXnM5e7h99Egu0wD40XZ6vSJoVNLvg=; b=cYyAQ6qQrXeI+F6E
	zvy2Z9pMjmmBTVbzypB0rHbtJfZMoVI1MCldEB6BvTlgJUnmtcyoMWLvXsAxoAq7
	oeRUG6Hcq2YbeTNMQkd1n02IjRcJQN0pjcW9Mbb8XRG0A83k92mV4y3uqFmAyNeo
	IjL2Z1+tuRXJhx/d73wtUbU0XFteZ7I7MVfxIS/in+ZFul8FkPqQhoIXHMvSKfpz
	oc0KP6pckMinsqrKxMTt+5c05aOPn5MPYOp1oyd8TLmnho5THIwZVjkq+qOsrwuW
	ABDaSiR+ipMyRUp3RTPscPPbPevpz9ms9AuCVIJaGaYjAnOToqoCL/XBmwvNrRsW
	3urHHQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwda0ndr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 12:31:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c19493ac2so43799321cf.1
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 05:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783945908; x=1784550708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jGmSMXv/KbmYATXnM5e7h99Egu0wD40XZ6vSJoVNLvg=;
        b=Cfvlcx2zCOJxSYaqhQzoy+sdviAIdLy+dWlghPVh+RbSBChFq/NcgvleLTzy7B+H3R
         ZIQW+exsQsPxFQUKj7jN0E8YlDBVupYuVP7V2aQYCbpOEcIvp8FRO5TroijSEwHVOw8i
         iadfib7yctwZ2QG9V4ru4lMoJusrf0UCIsX543AuGmWR1M9rXI8LpBtuV/IpRfKn+rxB
         Wk+NPhiIfOSQhwCXAf8ZIvF46oyjDhhP4yFiAEoW3iBu6BPiU2Q+/HCqyJNOF8Iqs9g7
         p1zBSJLumBaGGUFG6KP9MXio4PRYAG98YWcQ+pG+lOcHbdkdyjE0/jcO3aUS1tbMF4ZE
         UKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783945908; x=1784550708;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jGmSMXv/KbmYATXnM5e7h99Egu0wD40XZ6vSJoVNLvg=;
        b=p6YaDJDJBtEn+vTkPdgIZOQLikkdIieVmCFdee6XcK8YHSZG20/vScjACQOHRbQPGR
         SiBoFB+tX556vCvLGPC/nAqL41vX1OnvFOTNug7hIxKPaC42cDx6lhdW7Wjgd3FjmaiZ
         UX5Yjln2S1AwycnduN/lTVWm6jSa9EUPj1Ytph4u76j/Nu8bUS2AuMGSfq3yzKomcU8P
         rx2lg3aaRLXlEa2zAZRpjKQIfR5DAX8adtkoVzuBmmLmITIYctyBuVFlRC6uKeg9rM4V
         OQXNY2RTy4z62daFaRjeL1JO4qgiK83m1XzdVpkrbdGNz5y6WPjewPsRKKFzDAtFxM3c
         LASQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+dDHenTxneHawxh+qmPtejSBr5Hjxyfqo4dBGF4vmNMGIiZRdiZVyrEuH1//5CpBHP1H+hJZH7qw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWT9Z4+rydY0LEe267uV3VR+M+ANtXWRUds3G1sJj94tJnJM2K
	Tq5ioXtda+h2yhsdM5Wg6/NVsHAdl7C6n2L0M2C6+nblqTqPs9iAkgDabOflQlNqs1P/zZM1ojM
	jrHt3wYOIaWBPLBNj4k52AwzgKUnlFZwMayE1R0g7NYhBTsevLHnUesAVprckTcA=
X-Gm-Gg: AfdE7cl6qSUX0TQTDFxmwNqkox0qBB1qB2t748XP1yepNjLRDmyW/JUSIK0o8hBBDVu
	ZIEFX+VavuVTwRCfmPvGOR5zerFLvwDgZt6/O2TcXX7+W6+82V3zTSeH1YloPF/oTDIV7xCBX/W
	mRlHBp9sh5nbJAmCfXu81lK53YwSwVBhVPgGNBO9/yZnxxfkMUWkEp+BZKPuUhmpOZjwT0smYYD
	aoj65ccCmvYhOBh5fk/TwfoEf1X9s0eGh4BOTCjsuVAxyB4fysmCr4s/tzzUJNhWPjd99vcm0PS
	6EWwd3me9oKyDBTnturGkjt839CB5FnOT0xZuNwaktydC9h3fynzN1oPTwxVxi2VZlsQf5ChdvY
	l59St2Cni+HUzD7X3WZebpUqJdWPggtTH2j9Bbg==
X-Received: by 2002:a05:622a:1195:b0:51c:93b:4f1c with SMTP id d75a77b69052e-51cbf1fd6b7mr81467111cf.43.1783945908073;
        Mon, 13 Jul 2026 05:31:48 -0700 (PDT)
X-Received: by 2002:a05:622a:1195:b0:51c:93b:4f1c with SMTP id d75a77b69052e-51cbf1fd6b7mr81466271cf.43.1783945906795;
        Mon, 13 Jul 2026 05:31:46 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa635dsm2861932e87.62.2026.07.13.05.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 05:31:45 -0700 (PDT)
Message-ID: <b9540345-63c5-4da2-b761-cf1aafa8286f@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 18:01:34 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <71576059-b5cd-401e-b4b0-c1784f24ba46@oss.qualcomm.com>
 <81ac9bcb-65c8-4cd5-bc54-c350f24d06a8@oss.qualcomm.com>
 <cb9b3fd5-e63f-4367-8fba-cd3cd11fedf8@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <cb9b3fd5-e63f-4367-8fba-cd3cd11fedf8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzMCBTYWx0ZWRfX2rJ2zdd+ey0T
 gdcZXDsy8NY2bYUnsZJHcVP/nCMlkD4AP1iETBWYizmYXdS14bHQT1yJBaXGsUGy+S09BV3IP27
 BY7fdaRSk2e7dJFh+k7COD7Hx9PXouU=
X-Authority-Analysis: v=2.4 cv=cNbQdFeN c=1 sm=1 tr=0 ts=6a54dab4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-Cfwf-izUa4NwULDX60A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 57KpVw6GLGvhm0rmAcxKxbsA1F8FTgbw
X-Proofpoint-ORIG-GUID: 57KpVw6GLGvhm0rmAcxKxbsA1F8FTgbw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzMCBTYWx0ZWRfXyjV9UxpJDZBK
 dkflxbuzOF6uLaepAFSQAN2ZoP0DvhBsdFpEne7s6ApRK2hNhxBC3oBdy05J6bhpygu+lP3Mxmr
 6Q0aH9c52/zZODe0QrTgVo3DzomaW5erYIq/WUCkQ6ED3w3vbbFscf4UvlAtGAkjJlq/Vpu4oMz
 bxwwVLvIH9JOm818e551NEM53B++/mcJXMgzLMcNOjKWO1bc2s4rVkiO+ounRhE4lPdVQU4F9lT
 qNb4R4R+zE19R+OOnKVlsihAHvGm58FBvmJOwdjqK64QiMey8Er/x2fmsfGLkx1aPJbQDKOboUx
 56HoMUZpKFuVpplFYfk7qyHxyRc2EECWnM3p3iPss/0pC/wB/Tv7yBGTCTtNuzkbWQ7TEl8RvLF
 cRvbyxnwqNOaStdFBgvb4M48ykJHzFcxz4czDvuEZRkliYqXGDQcfuIuSYtJ3kSJMYsIkiWiNTA
 7DbcpYXRdBO6JkwE9HA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130130



On 13-07-2026 05:44 pm, Konrad Dybcio wrote:
> On 7/13/26 2:07 PM, Imran Shaik wrote:
>>
>>
>> On 09-07-2026 05:30 pm, Konrad Dybcio wrote:
>>> On 7/8/26 8:25 PM, Imran Shaik wrote:
>>>> Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
>>>> CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
>>>> differs across Shikra variants based on Audio subsystem enablement as
>>>> follows:
>>>> - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
>>>> are required to be supported on HLOS.
>>>> - CQS variant: The QAIF driver runs on the Modem, and required clocks are
>>>> handled on Modem, so from HLOS only resets are needed.
>>>> - IQS variant: no soundwire codes, hence no clocks/resets are needed.
>>>>
>>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>>> ---
>>>
>>> For the sake of simplification, can the resets be enabled
>>> globally by default?
>>>
>>
>> By default (PoR), those resets are under HW control. For audio use cases, software desserts/asserts for switching to SW control. Hence, these cannot be enabled globally by default.
> 
> What does enabling the provider node have to do with changing the
> state of the resources?
> 

My bad, I interpreted it in wrong way.

We have IQS variant, where we don't have the soundwire codes, and hence 
the respective clocks/resets are not required to be supported. Due to 
this, I have kept the status disabled, and enabling only where it is 
required.

> FWIW there's nothing like reset_sync_state
> 

Sure, I can keep the audiocore_csr node enabled by default.

> Konrad

