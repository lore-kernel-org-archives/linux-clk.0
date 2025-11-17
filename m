Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01108259CB9
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 12:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763381875; cv=none; b=NYlwie2NturYLeun0CM8fLBDCMof8APaUZ++xVD3RAZcVy6ZQZL5prtEwhLkNImoVlueo0EUwMpsKrppLSRBjl/7l/Rd2SHaIAFCFwZZaUAQaz/2MhG6BjMUkItwCQ9ZD6h4K06c6i9J0YdY5cW6lJiYPRwAfI1Owf2bjmJfAuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763381875; c=relaxed/simple;
	bh=IrgtLqlGGVjEzW+WJHI2/2f6uAkIPVkL0cGzY+IXApk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AELj1+g3x4MqQjr0/Pekppgy5iZahDV8JL2590WiGic+BM2oRrYtfA9r9o14LMwMDuKzLJDUN1J3yGLhDrXhb7AbG6r/lG/lJd1L2qcNTtACfARtgprx0skAdW+yby7oXvwpEnTxFaPDVd5wZ1LeepH+SFdGICKwWOa3rIOWaB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UPNavtyC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pz3tcILG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UPNavtyC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pz3tcILG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHBdEii3318441
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 12:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kOssYp9IR5bSzooHWmQsQCCHXQc/n4leNi0bBhT2X2A=; b=UPNavtyCkoBmfG8Y
	kV8DGkfb3EHZhHlLswDD+U5E8DWfq4IuPenvQ3eNyIS4xAwNkMyC0csy3d99wthY
	G8fiOXqKCNbCQ8X2sfZEL89ImxymQLCUAiRdJgi44PaePSvzZz+/fBJLDz+d7Fe/
	Zen8bPlK184ahZdvk7VCQD1WmWxg8X8nhRqNFJHtGVqAbbW5zZHuNT4OXcI2Hqcg
	LJsAPe8l40xCFn2u2YxenRkNmAfFfYtwTP7QNrByTw5XoXUXI3aEyWwNz1dm5DqI
	fAMHVMWStbY91geTwyPNsB4xxvf+i4zj71+1k6FqnAXHC3AHPkTCn6tAelcXximS
	6FPAvQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejm5cngq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 12:17:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8800460ca8dso18550836d6.3
        for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 04:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763381872; x=1763986672; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kOssYp9IR5bSzooHWmQsQCCHXQc/n4leNi0bBhT2X2A=;
        b=Pz3tcILGiT4ss1GW96UtEIhP2ML2U+XLSo8n8UnJ7rvSGYdc/eB/m6eXJ1nmVX7+fw
         PD3+PAnGLqPHjvWOUW3lF+dacYQUJ5VEaDpZL/m8K5OFl1EaBG3B/RMoOFo7XFJGqRQX
         IbWzxbGyiCWLJqfegebNDlLpAkP15v4Owuh+GgUkfjWW7GbMHXZ+ID5GZ3lB55CVlMNT
         H6vmAIiBpgLEjyLnZdTWGkkZDa3S36V4u5VBF4ggD4riM06Gv3lHsRQjFLNmRaVYlouU
         EjS1Oj1I8vrC6yGuzQC2mLdBe6mWNGxehrklCktf9y/HbY9FvAogrxiyP8tYHuavlTqK
         Fqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763381872; x=1763986672;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kOssYp9IR5bSzooHWmQsQCCHXQc/n4leNi0bBhT2X2A=;
        b=axj3xM7FEkFN7hKF29w1wvARZn5zEG5MBEi2mDbS8NtRO+XFMR5o2+5REWhoFL6NJk
         An8PP43ej+XznQ9zZ1qTNxpj6WYDPYn2Nxn2ywBteSpaREfshWcSoga7ps2w3+qCZg/F
         kIivUcwXgu71im06Q3u8zaTDLISYp8Z8S8LBSdZZxZZ8+KG06KklUn/BfvGKTKOmY3uJ
         4eXMCXCEZJHAtrPOnWyV3+6V4Fxs+HqiNRRVDzcrSheUZywVkvJmnxQSOhQJDCKOL8MC
         TUcxASCtOZRzk2gr/8ouYWN1bPz0nuCPL8XxdxVfJlmujeUl04QsmY8fwJ1C8PjoR9CO
         OZ+A==
X-Forwarded-Encrypted: i=1; AJvYcCVzpO4TPX3wsLtZz929CAFvII8QMAydrulHAbYUlLsQyiLUHMTt4U2EyphZicnM605LvlggkNp59uo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6pXl9FuPTj1CSLpjuaW90XIrPmGvnpn3x1BLUPlUpwxeASkOS
	tLFRZ//bLikI0eWaEI3S2jWhw0Ue5eaH0uaLAXHY0atznBvXKZ2PlQSy0tNogOQWYLJ4vL4NVmh
	/aASjoMIu2NpUFNmlFJJBAgDJrI9nHMSPibRhfpPpDAa3ZgFfGApk69TfN/1aoFc=
X-Gm-Gg: ASbGnct4oYEEEY+lO3HEFHNGsQWhZ7uSg4inCw1NIZLXfnD3v7U4O9AlC2H5OB8kEDh
	WsU2GxJGZUEd8pYWbKMkdKlPzpwQcOsK8R7lcZTA9p4OENg+nDOYI3XgrVuuLUM6qxkN5r1yn9h
	2ZVEC/qqJJciNKPPChL2RxCTBIAgjVWB05warirUdv+fW6YoxYjHaJkAnSChT0tRPFVB21EflK9
	wMFXfbw6SipeDHUzhf3OQdrdastj54vn+qzWmQynkF8Y4rFaHozzGt3rP64M3m0ChcG9LzPybym
	HDXhR6f2Tt8127dWCrlTebK8F7yqvTT7FKLvwtEZYB2s+6L2hvv5Ebis/L3TFuaVZaD2HnHnsov
	g5wp9QEVmjwmzoyqsH3+HDiP91K4oegDWrs+i9k5Dr1IsDVEC2fFEfL3E
X-Received: by 2002:a05:622a:7892:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4ee13678a9emr46875681cf.5.1763381872257;
        Mon, 17 Nov 2025 04:17:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOHsMBY+vmfDDv0UFrDPhqHGh/pmvHwB4CxFSVYk9Ucz8EIShxdHNzm13AJ1olvUMCVmZ4pg==
X-Received: by 2002:a05:622a:7892:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4ee13678a9emr46875401cf.5.1763381871805;
        Mon, 17 Nov 2025 04:17:51 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3d8294sm10047574a12.3.2025.11.17.04.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 04:17:51 -0800 (PST)
Message-ID: <8faa0c8e-6f21-4025-bbdf-d4ec18eb7628@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:17:48 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: gcc: Add support for Global Clock
 controller found on MSM8940
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lanik <daniilt971@gmail.com>
References: <20251116-gcc-msm8940-sdm439-v1-0-7c0dc89c922c@mainlining.org>
 <20251116-gcc-msm8940-sdm439-v1-2-7c0dc89c922c@mainlining.org>
 <793d5039-0506-4104-b4ce-64bfa3cc00eb@oss.qualcomm.com>
 <5C7A10CF-910E-448A-8BFD-F2A46782D3B9@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5C7A10CF-910E-448A-8BFD-F2A46782D3B9@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEwNCBTYWx0ZWRfX5VMhTqtqCohd
 fb3Zh5GLZKj9edFsx8q5zF5Po80Zz/cL5VldY3m9SoRSYDADlcw+5ET3gMp7YN0B4xUax1krgyF
 GS1uHMfOj14kwcIsC8g3q+iEWb+g20lPOeE4DbolGnQcOSzbQy93/rxme7FwipAKNdN8bFZhcU/
 edVDVQ7PWxpdaxjy1x8pYfom8OrgTMoopA+zvpkJuVUNWNpb+dAzHvrJpWOyoV+JXBmW5DqYc2T
 xSvLXpgw5Xw5EIZZw8Rny2QMj/u7iDXyMO45kLGHkT8+V/nLZYAwZKU96BjbyLVLkzNpGmiFPJW
 Fxnr3C/hMg/KRG8NBjxKep1U8mM0bP2mY3tZkfvrJj1hpD5krhhq6QnKwBa/OPMfRZWftcLGuct
 l9UqCwvp2gQeujy6d9kuyWWJ/hfiZw==
X-Proofpoint-GUID: IyxsgiFI79gOPyy-FLoXrmTlTklK21Bt
X-Proofpoint-ORIG-GUID: IyxsgiFI79gOPyy-FLoXrmTlTklK21Bt
X-Authority-Analysis: v=2.4 cv=Pb7yRyhd c=1 sm=1 tr=0 ts=691b1271 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nxAZbQHxNLXoYmXW_74A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170104

On 11/17/25 9:51 AM, Barnabás Czémán wrote:
> 
> 
> On 17 November 2025 09:03:53 CET, Taniya Das <taniya.das@oss.qualcomm.com> wrote:
>>
>>
>> On 11/17/2025 3:05 AM, Barnabás Czémán wrote:
>>>  
>>> +static struct clk_branch gcc_ipa_tbu_clk = {
>>> +	.halt_reg = 0x120a0,
>>> +	.halt_check = BRANCH_VOTED,
>>> +	.clkr = {
>>> +		.enable_reg = 0x4500c,
>>> +		.enable_mask = BIT(16),
>>> +		.hw.init = &(struct clk_init_data){
>>> +			.name = "gcc_ipa_tbu_clk",
>>> +			.ops = &clk_branch2_ops,
>>> +		},
>>> +	},
>>> +};
>>> +
>>
>> Is the TBU clock used on 8940 by a SMMU driver?
> As far as I know no MSM8940 is using same smmu driver and bindings like MSM8937.

On msm8939, the clock needed to be turned on for the GPU SMMU

See 5bc1cf1466f6 ("iommu/qcom: add optional 'tbu' clock for TLB invalidate")

Konrad
