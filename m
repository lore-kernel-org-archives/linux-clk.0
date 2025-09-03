Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB66F2F3607
	for <linux-clk@vger.kernel.org>; Wed,  3 Sep 2025 10:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756896888; cv=none; b=HWR7xv6UA8HLsA78iUl/0zz6rkWlAPF2QnBb5KQ5LxmcJTeuqCTpCU5Zleqi3E8bKP0rX0Iou/PdWCBCHVFnj3eZKaz847UQMp8bz/ZFzH5AMdl3EHA96LFzK6ZDZRatcLhkALKVIwmnae5WC2VV8i9dthZAWugVJSNOr4/pVPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756896888; c=relaxed/simple;
	bh=Tm+ubvDpNij69TvVH7w3Pi5cDsVKJICM7WBgBpUCufU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n2Mi4EN6kY+KfTEkWL3Fj25si856M48Be+Kl+6M8qsLdBk6rIkP3eDrsqZPqjxUt4ZKIumxOvpmdgpH5GHflfGppVxGPk7cZzDXN8DwV2evwlceWhAdyu2XggjXNzMt+NOBBf5HN9fpJEpe300qlGGlzxXlO38hImNWJAjb2z4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XL9JUpZ+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XL9JUpZ+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583ASZdu024014
	for <linux-clk@vger.kernel.org>; Wed, 3 Sep 2025 10:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SN52Stku6irzzygye658oXiBDSvkmv+/53cdsuo8Qoc=; b=XL9JUpZ+VtDwPbNG
	R12bsrBYQgiEvFwu7M6IkEk0sHMwzQjPhmsvgvSX/rcv72V3Xad3TjVc4xMZFrrF
	ly+LStev01TlDrXqB3MUO8ipPdmAzrtcuQNmRAAbaeDH/pryFP357V7OITcmz8JU
	3vIpsQjTkFotg5EFcDTtAnwa1k5tvD5FVya2qjvL0oJXNtxA9FBg/eTxEQsTN6Eb
	yOTX7AI448QwROoEYzShuS5QdElPe1Yu7fjJWYMf37V9K8cW4eGYazkhN4NMIrrc
	yREXPskGTy6/7D9GWSAiCkdz57G50OTIGECgZ07VMftIU4bGD/kgJ+I530QXQiiO
	6W6O2w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush337du-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 03 Sep 2025 10:54:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-726ac3f253dso697676d6.0
        for <linux-clk@vger.kernel.org>; Wed, 03 Sep 2025 03:54:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756896884; x=1757501684;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SN52Stku6irzzygye658oXiBDSvkmv+/53cdsuo8Qoc=;
        b=E3zO1InZXCzQH8mFdIN03K5XWBXVP2OgYExCnSw79UCeHonbQM7STavFbgut0qSgc5
         fLBDnXCrp38EdnHgeFicCYHosDE2iN6s3DgbfLg1akmTyHDd/NF7UQa5OhntCgpBk6qp
         caWlL11oBO5rig2U3z8zRwmMQ5I0PWhf7/e6k092w1SHOdhhGzepQwhAWQuORoNHimiE
         64gsCNj/us7iEMVcQJVHs1GeGXPGRQhOFrug0vBk50fHqjrkAPaWvr6kKFS2lL7BM42J
         IKbnP4BDjDqWj/ZAJwx7k4IvtgR4ZKrzLAzLATpFgLxIuBT8fmKn3e+hTgRAo/0jyf4s
         /pqw==
X-Forwarded-Encrypted: i=1; AJvYcCVFPA29Q4ZUySdQROOIqIDkY78sVQHkA4L18ctKM28P57Rb+nikFrGk1cKgeZAyXvC6yW7gCxLLRRk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwieoXJjDlfzDPTOlYyr6TtTiqORQ8CfbYlVuwedSnUknKYvx8C
	GpsPk9Fbf65kM3ja6/fl+7GSTnaFp4j2agoeE9vg89KYRkp4dVp5G9wcinIY+6eFhOLRLks5UCt
	Ozu4DYPE0rkfe2x3LOPMNTTJIlM1qPXy7mNr84tPu9ZbIf0b1VN6QQ1JWgHsyDpo=
X-Gm-Gg: ASbGncsc+2+DkLt5vLxlKzjSGfmApjUct1ZeTb1BgGJJb8eVAKKIZG4S7qxhf7DaMIV
	qW+5TeMfD7oMYt8VzmOuDSO8TXpfV+2jIKoUm4n3s+qnHF1cLmO/4zsj3K/J+4wZ/Qea6i3HJKF
	ww2/lLd4l5WtCqULj31CQK7JAmYNJ68dzLFsPrZzN+Tdlc0syZaPZqQfeEFHEA4L8ykbb7/9r9j
	YK6cRDo2X6X4EX9F4fVkpzYtZZqDcy4ATUR2egtjtrq/GJg82c9/nlKC+hCPiITw6vqrOkskeHw
	/gYPIGq20m3I7nUDeR1f9AAkiUj55oi8wle+XIdnjleNQdj75vRe9haIkvL4FSygZGkylbPmTFk
	PQ4Hbr2dV7xvp6Ge1AHT0rA==
X-Received: by 2002:ad4:5743:0:b0:707:4eab:2b5e with SMTP id 6a1803df08f44-70fa1d92d30mr148150716d6.4.1756896884452;
        Wed, 03 Sep 2025 03:54:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEetDZkFBnEZJ/kKVop60xaty004rw6FYmAAfEqO0MuEDwRglU3hRd6MaQX/oR3QxdMGUb85g==
X-Received: by 2002:ad4:5743:0:b0:707:4eab:2b5e with SMTP id 6a1803df08f44-70fa1d92d30mr148150266d6.4.1756896883912;
        Wed, 03 Sep 2025 03:54:43 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61ded4749aesm7462141a12.32.2025.09.03.03.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 03:54:43 -0700 (PDT)
Message-ID: <6083a6b2-c5cc-41f0-8026-e022f2f4eb38@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 12:54:38 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/7] arm64: dts: qcom: Add initial support for MSM8937
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org, Dang Huynh <danct12@riseup.net>
References: <20250831-msm8937-v8-0-b7dcd63caaac@mainlining.org>
 <20250831-msm8937-v8-5-b7dcd63caaac@mainlining.org>
 <67aa2a1a-3adf-4c97-a7b8-865b5ca3b17e@oss.qualcomm.com>
 <EA8D417C-9B17-4AA0-A448-316F8904AF90@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <EA8D417C-9B17-4AA0-A448-316F8904AF90@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX2V8j0HMvBWn1
 nwtCddLzXcy4zHR3f7enWo82pO93V5Angn99ix6fT1WLHTuAHMbwHhaEl1U6kMBYoTmi9WYdtJm
 +LrVdcC4x3AXyK3TqPy/A1M1HnNvjEJU5/bu5VRhe0QijuY7BtPycEIH46VWOFWD6kKoGmG1Lfb
 reEG7znbLlwIGgc+kM4ZqJKDfRhmnN51+GJEFtph/DwPJJ5Jtfx6uhHpniyx6tCvoTEXB20BC75
 HCGEJXDegMtX2yEGUMBt5PRs37su6COgOZh9cSyWfJiOVzNDs4fOdaovGzXAD75T+ih9BhSajZ4
 0JJlMRN7wCGcrwq8LA9CLsg/gaiUP+6bVjN6EnZn2K77HVd0SZbw++bpcfM3MJFhNwaFGwOoVOF
 k/sFmK2F
X-Proofpoint-ORIG-GUID: StLE110_IZggYrHHU7pUf0qNxvlgxGec
X-Proofpoint-GUID: StLE110_IZggYrHHU7pUf0qNxvlgxGec
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b81e75 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=bBqXziUQAAAA:8
 a=OuZLqq7tAAAA:8 a=G6GrHqeLqaT2Jh2KzrsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=BjKv_IHbNJvPKzgot4uq:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032

On 9/3/25 12:47 PM, Barnabás Czémán wrote:
> 
> 
> On 3 September 2025 12:42:38 CEST, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 8/31/25 2:29 PM, Barnabás Czémán wrote:
>>> From: Dang Huynh <danct12@riseup.net>
>>>
>>> Add initial support for MSM8937 SoC.
>>>
>>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>>> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>
>> [...]
>>
>>> +		qfprom: qfprom@a4000 {
>>> +			compatible = "qcom,msm8937-qfprom", "qcom,qfprom";
>>> +			reg = <0x000a4000 0x1000>;
>>
>> here you reserve 0x1000 for the qfprom
>>
>> [...]
>>
>>> +			gpu_speed_bin: gpu-speed-bin@601b {
>>> +				reg = <0x601b 0x1>;
>>
>> and here you make way for OOB accesses
> Ack
>>
>> Make qfprom length 0x3000 with the current base and the gpu
>> speed bin should be at base+0x201b, I *think* (the docs aren't
>> super clear on that)
>>
>> [...]
>>
>>> +		mdss: display-subsystem@1a00000 {
>>> +			compatible = "qcom,mdss";
>>> +			reg = <0x01a00000 0x1000>,
>>> +			      <0x01ab0000 0x1040>;
>>
>> In v5, I pointed out the size of vbif should be 0x3000.. and the random
> Where 0x3000 is come from downstream is using 0x1040 for vbif.

Hardware documentation.

Konrad
