Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47C35478D
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 07:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779692807; cv=none; b=UtDwNS7Xf0DywFgZDy0sGzYrNMwQ0DDkTiuEMi02I7ol2tNE5kDvjS9hHaoDuDgmwCO/3/qZ7h4M4/CvZti74xKZYM6Ic59ZTHyUUluKZSFfEvMTd/aEjGubbL3WUl+2NOJWU8NVaZ98Ci65oOrdcY7gNqzDssn2aELda4rwbJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779692807; c=relaxed/simple;
	bh=m9oogMcTFdVycGrltx0hH1QPpPdlBZgo0o40YOuoCZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i/Q35bSAx5BmIY5qELqjAxSW/QMk80ohr72cmCotNWLX4w3+xP/LsMOl1lDj49eiGT/r1oR3pe5rzoU+e/+QV5LRyP/OCL9XIqF7G+/iOheHfj+ite5ySPgb1vbEW6Tj+UBFXe66IibTmtTrWt35Js/J8R5IAGjOV13KIZBQfV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VBavmqBT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=INTU6Wr5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VBavmqBT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="INTU6Wr5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OMtahK1962821
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 07:06:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PztoOF4NbfiDG8yee7TktqGlOi6z/P5gJ41vD8fwEK4=; b=VBavmqBTPXTLJHsp
	avOpVTI8iw/wpN/3SASQZA+myXg1PGacSa+Yt4zGJVE7AohDiFaOROFdsro4jMYN
	AB/csJYymjpLHlVpQYjQFMpjVIEgiVxmeCLIUNtc7yECkatsAn+0rU6Opn93TEtL
	FtBkD0q9Fxwy/Jt8NxDE6f1lAGLVyGsuNur5CfWxOu8bR6j5gyc3+ehjV0N2m3Im
	haV+xzYQDIrD5cvPedQKacRVBszRIO8d7wMpXVXV3IHbT+qjqRvqMLbeq1UfuPKR
	fUTefWeQSE+v/7bs3X3vvkG9W72rlyWLDWyNh0ZXibqOs6l88u7sWBAE6KrEGypr
	ImupaQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb3jgwk6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 07:06:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa6c3a77cso5376196b3a.3
        for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 00:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779692804; x=1780297604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PztoOF4NbfiDG8yee7TktqGlOi6z/P5gJ41vD8fwEK4=;
        b=INTU6Wr5BglVY5o9dHdNwgM5WamnYaT3F9se/vzYHNAZOC4y3LbQYYC+LTUUAdn1Ax
         RWFEHQoAEHUvW0OeZrhOxZj8jtXJxclfTclO8fgN4TN9gL6BpSI5R+JJsme9sm9ZXD/C
         Sa/BfGohL52LIW51t3TeLpP5fTeaKJeriZ2waE71+kIksUdhJFTbq34wmxyImm98pw7B
         l3DwOzU/MnTQRan9ZajnslXt0si4q222sFfyIvzpydLI2fwGNbH+HOtdb9AGx1fgNC+4
         gPCQghGk9EPU4mmy5il33c/z3pEbMvP0wheFt6OG0p9UmlHlhYae/TVVLyRqns7JWwOH
         mn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779692804; x=1780297604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PztoOF4NbfiDG8yee7TktqGlOi6z/P5gJ41vD8fwEK4=;
        b=G1UmQY+20Q5Ro0u4ZSB8obXIzVFLHDY2C1nEvVGNbrH1j1NGKFGRtC7LGaMQKE+H6e
         qwttlNRjWbmmn7hATmIfKVd9NlXDn3D7zd5mTRVaIKRfxUpv2UdivLzkObfC5m8GAdxh
         uQQo8E9186Vy95xq0Zz74rLeym12rf1h0RqdiTH0oBElHqSqGsW8rF3lHeq5t95rULw4
         m6pNXSHbQnLxpJ/QZ9oOnuOkdjHHlbhzRL840xFQjIy/vTe0weertwzqi8R5/63dkMIA
         ucaFYPkOp/6YaBXa0ZooefgP2NIjAgxrj+z/g2p26O7aMNXMkYsLlquvOpYw+PfqC93S
         Bdfg==
X-Forwarded-Encrypted: i=1; AFNElJ+g231qGDOz9tdnAiXrB4ea7sOdFcZCoxjCmdDMGQkS/QJCRVe5DZkwGcdpUo0xFwfxtwUg8px+7uc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNcuc8foZfElg4hT/mwrZx69fhR7u5mW9QHVi/PKVhUt9JoNkC
	HyBJZvgTnPXP2tn5cNDr7TJVGX2w4lbHYOpztFU6j+o0KmEzmnhI7AmL9R3VNB+jKUq8p2nW2+w
	v7ong26mD3xJdyTuQFgVk7VQ9tyJTDtqeJ4Ix09Zo02LNShf1D7G+7ccEPPSmSlk=
X-Gm-Gg: Acq92OHmRqs2prcjrfypmPZHfmnC7JkmQK2I5hHSNZ1TwQ/gTDkiqoho9I0N2B3xSNC
	1EsVc5MqaiW8PaaWJjB5D1VRS0VB3WDArkVZqEZnGGJrJqZCflzVIQ25lKjGabKgq/m+L2Xs8Pq
	rKybFsSw5Hq4RvlObgKz103bvjGZ1tn4wZyPk9i46+5sqpUe+dH7Q3dyoNYrE+JNUB7kDSRHOg6
	tDAQ82p1bS4Z4JXx1Y7KI20Cicdddu7zpc6KBlY2/E52Xpxn/ju4qVnBxHQD2sg480M+p2oeifG
	FF0zJ4RQsJpWUC9USaIMEiElaDviS3MZGzg4lxxgUsAtSfgxkUu0ulosU67+4K3ntqxZCr382fG
	XJHP35k2T7Jyar+uViLB5ygNouSpjI4U64HTiOkRxyK8EX7DaOAoeIXe+qZgQdck=
X-Received: by 2002:a05:6a00:22c6:b0:836:900e:8743 with SMTP id d2e1a72fcca58-8415f35d58amr13665916b3a.36.1779692803476;
        Mon, 25 May 2026 00:06:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:22c6:b0:836:900e:8743 with SMTP id d2e1a72fcca58-8415f35d58amr13665874b3a.36.1779692802978;
        Mon, 25 May 2026 00:06:42 -0700 (PDT)
Received: from [10.218.5.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fbb66bsm8423647b3a.45.2026.05.25.00.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 00:06:42 -0700 (PDT)
Message-ID: <66335474-d600-45ab-9ac6-e946f24142c8@oss.qualcomm.com>
Date: Mon, 25 May 2026 12:36:36 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] clk: qcom: camcc-glymur: Add camera clock
 controller driver
To: Bryan O'Donoghue <bod@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
 <20260517-glymur_camcc-v4-2-9d00acffdbf7@oss.qualcomm.com>
 <8bd4365e-0171-425c-9738-0b186047cb15@kernel.org>
 <upcLoSPzJejUNhFiNYlTVH4d8Sh_Pv2o9OZfXsY-CMCDKw19_ci2gL9B3ZwqL1hV1pQeQMLDL8tNLbPzs0JIIg==@protonmail.internalid>
 <2a496bdf-4728-47b9-84ba-063712a6e5b6@oss.qualcomm.com>
 <0a197b43-a672-4849-91c7-6e5bfe3175f7@kernel.org>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <0a197b43-a672-4849-91c7-6e5bfe3175f7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: n6_lbeCsb4kKk8AbqR6N0BSByO7VHNy7
X-Proofpoint-ORIG-GUID: n6_lbeCsb4kKk8AbqR6N0BSByO7VHNy7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA2OSBTYWx0ZWRfX/c4cpb34ZvX8
 Bwbq8Ch3OTpI7ex4fbanYXV2+j+blfaG+d3ALTI+FBPvkWhPYimhXxq9X9yVrNyIGoRCkT5+wig
 4RSFQc487bt7Xh3D9LvwmmI80+ldjNhYy39VPwoGGBD1gU4tkuxcSJg6mMS6A6a2LnlhAfR4P28
 GcTSp3jMi/7vPbhkH14iFlYITH/c/P22ilWL7hqErDwtvQnY1J6C1hgeRko8DWMqRWmK3bK9htA
 //fJPIcK9FR8PHb3pP6bz2AozF4ACOyLH1sH+NTKczB+5L/CWE/M+fL6INZX519+2RzrFLNtGRB
 yxtCZy4YQ7/R/v/G3lkqJfiQA+Lgl3yTQ7eI2zdx80CAXDM5qwYXzXbzAagDYZZ+IKhQklr/oZz
 /aPzcOOpWmXuDdVE9v0+vYs3TtiMWcboYLcf/HbBP9oJViLxesidr5nCMq0ZM+R+RdfXjb0c4K0
 puJtiXsRKHmJ93BQCtA==
X-Authority-Analysis: v=2.4 cv=Do9mPm/+ c=1 sm=1 tr=0 ts=6a13f504 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tk3pCZAdYsx0TBu0sJAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250069



On 5/18/2026 5:51 PM, Bryan O'Donoghue wrote:
> On 18/05/2026 11:23, Jagadeesh Kona wrote:
>>
>>
>> On 5/18/2026 1:05 PM, Bryan O'Donoghue wrote:
>>> On 17/05/2026 18:33, Jagadeesh Kona wrote:
>>>> +/* 1200.0 MHz Configuration */
>>>> +static const struct alpha_pll_config cam_cc_pll0_config = {
>>>> +    .l = 0x3e,
>>>> +    .alpha = 0x8000,
>>>> +    .config_ctl_val = 0x25c400e7,
>>>> +    .config_ctl_hi_val = 0x0a8060e0,
>>>> +    .config_ctl_hi1_val = 0xf51dea20,
>>>> +    .user_ctl_val = 0x00008408,
>>>> +    .user_ctl_hi_val = 0x00000002,
>>>> +};
>>>
>>> I'll again push back on these magic numbers.
>>>
>>> At the very least you should be mentioning in the cover letter log why you _aren't_ making that change.
>>>
>>> Just reposting and hoping it slips by the person making the comment isn't too cool.
>>>
>>> Why can't qcom update the python? script that generates this code to enumerate fields instead of magic numbers here ?
>>>
>>> I get you don't want to do it but, just ignoring the review feedback is no OK.
>>>
>>> What gives ?
>>>
>>
>> Hi Bryan,
>>
>> I haven't ignored your comments & already responded to your earlier comment on why the bit fields are not
>> defined. Most of these values are static settings we get from PLL HW team and we program them only once
>> as is during bootup and are never reused again anywhere from PLL code, so these bits are not defined.
>>
>> Please find the earlier responses for your comments below:
>> https://lore.kernel.org/all/b92a2cbb-fe8d-4378-aa02-d91e2e4dfff4@oss.qualcomm.com/
>> https://lore.kernel.org/all/009ecdbb-2297-44eb-862d-233e3290691c@oss.qualcomm.com/
>>
>> Thanks,
>> Jagadeesh
> 
> That's not in your overview letter so generally I'd advise to include things like "did X because Y" - "didn't do Q because Z" anyway, how does it make a difference if the values are static ?
> 
> They are no less magic numbers that way.
> 
> What exactly is the resistance to defining the bits ?
> 
> I'll state again - when a vendor is submitting something upstream where that vendor 100% controls their own documentation - there's no reason at all to be presenting magic hex numbers - even more the case with generated code.
> 
> Just update the script to enumerate the bit fields, I honestly don't get the aversion.
> 

Hi Bryan,

There’s no standard interface for these bits, and bit definitions/fields vary across PLL types.
So, common macros aren’t feasible and would need redefinitions per controller. Since these bits
are not reused elsewhere, IMO directly using values from the hardware documentation keeps the
implementation simpler, avoids unnecessary abstraction, and makes debugging—through direct
comparison with the hardware spec easier.

Thanks,
Jagadeesh

