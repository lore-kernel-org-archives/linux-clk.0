Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EFE270EAE
	for <linux-clk@vger.kernel.org>; Fri,  8 Aug 2025 09:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754646880; cv=none; b=JWHGJL2ohiNDfvkX69QX8a96V4Gw9Z2tnk3V9nojDYM3N4b7qwhTvvNrFkPEH4UGC44ZvwmK4ClHhwGDlE1pNTG9LEdGTc2EKy2oQ4MogsCsrVtb/4Ups0O6sZcfMwaQl4JGJkMQCBdu//HErhmzBohEXwcWdqaJ2LmQaqAH1sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754646880; c=relaxed/simple;
	bh=IZewFj/uk0R0C1cmRQpY3xYNslex4bPpK5Xu4ZFWs0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=To07fL+H5USRUzO/oyEu5ijmTRY759fOAaEBH6UzXCdl1Tus/MMnszDIQQWxvGrMPGU9C/8M+cFGVOYbvCbRNT+1SlRqVQZOIDgnq7HllEb2/dJzYNGZraaoa/I+covZ3GN0dCXkQPBY+qK1AVvxeaRvQ6fvS/UzHhJTTSlLUc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Enr9R5U2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Enr9R5U2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5787Nkv9032599
	for <linux-clk@vger.kernel.org>; Fri, 8 Aug 2025 09:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VrNxZb2huOQDxcBDq9vEBgeyKvEis3Dpfn3A/mVFAjo=; b=Enr9R5U2jRHG/1qY
	xAwRbjDa/z93bN5wnZuSo9+Q5AetTe/yAjx1+te4u6hunpJ571wpZ+l6y7ddlm1V
	R6ADxwPfgeA2tkVCa1r219C3D8YjrOV9nmcRAcM7ZYTROBbeEo5pLlBwEQIL8zmN
	0NdM7WVOdLfXnLz1SilT59rTLCu2XtBhtsXk9EE36X7hlrTnhelZt9hE3gKKe4g8
	sfnYAET2bhPs7t0dahEqafyhROtHuM8kUVuJbDTzIV5+1nfLhNaCcNlVEaOK24bi
	5mQQpC1IqGcLH7R/C8MjPpC2BTap5UyuC1PM6ESTA4L31S9aDQgYI5mLp/FwieFT
	hCCjDw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw39hn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 08 Aug 2025 09:54:35 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b423dcff27aso3479709a12.0
        for <linux-clk@vger.kernel.org>; Fri, 08 Aug 2025 02:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754646874; x=1755251674;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VrNxZb2huOQDxcBDq9vEBgeyKvEis3Dpfn3A/mVFAjo=;
        b=CqeKvAysyr1CvPJNQbWImZnw3v828rX3K68cO75y90O5Tm0RKtoZpbAJj9Zt0xYoWh
         DGIZP2B5a0rz9isi005Q3RBZ34QuhgEXcIb5pyH7sn9JvturT1Elzniku8fhYXhFmcf8
         4ajvtO56dwCTXITLlRbfwDbNC/3EFCFTm6ChqXPHkjR5u0yHYb8jcMBxN9hDaiJCHHuY
         FYI9wKjNVGsPCueXNo2eU78N8FVLvm16UAn6Ts6Rn5uFujkxdaZdQDU2mjVBaSqu/QDV
         NZjARHUIshuELhpCqbgmXkdR/Bpy9TO5P3YlkAEkYQzVxSM94S10bShMVEJebtjPvcT5
         A/Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUYz9WDCM/ST+ZBT+9pC9hGx2XKTuLSeXiSeY/gTzy/Hzl70bmfEVS8y7DC5FOMxoUDplTOer7Pbqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSIdfnXidm5jt/j5gqjhBampkusOnkX9i//GdLYB1QOWe5nmQE
	2lScLW+xM1XpX1j33zLMbQihf2eWJs9xzbCtGy5CB33fKStlbnTRxnmigNLv4m5IMgBJ34rNWPQ
	noGvmG45GQgEAJrGmcDgDHWdzDaMVAsQdPZQO4hWSE/UKVHa+TydIRfWp5pLCxWE=
X-Gm-Gg: ASbGnctXwb151heQXD+8MBssgTk7ux2pSrRAgYLaOOgT6tprnkZ0wpdtwKS/g2LKzgd
	fEiAyWU+ywUZj2BxlSO3aSH4YYI9V5X3YEcgjnDdNkIcsssxj4PYcjSFnjOlWBgU5hC8CPvEHOV
	ZktH48mKlOZY/hwQXP58t1pU7Z06utaNCj1dUntdK5/RR5qKS2g1r60DPKh36MzO4TCumUAFgSo
	1doJCC1nRgGib+jZEBU9PCMHgOmWyh21GryfvrPI9im3Xy7F3RKfLdx/2G8ybaocYzKOvow0prY
	qMWte5WUnON1a2IUxIK+IQY+Tnsq+iIq2Qga+Ud7hv/nSxJvdXsaKh7lSLtdDzg/VRPl
X-Received: by 2002:a05:6a20:6a25:b0:238:351a:6442 with SMTP id adf61e73a8af0-2405522ee22mr3230464637.45.1754646873873;
        Fri, 08 Aug 2025 02:54:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMdPYl8Hb5De2uaasmqy64rhr2pYi2WZQYfw282Gwlr2/RoFYRSAeOW9+wrqhGxbXy2C32XQ==
X-Received: by 2002:a05:6a20:6a25:b0:238:351a:6442 with SMTP id adf61e73a8af0-2405522ee22mr3230442637.45.1754646873431;
        Fri, 08 Aug 2025 02:54:33 -0700 (PDT)
Received: from [10.217.217.159] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce6f6fesm19918035b3a.26.2025.08.08.02.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 02:54:33 -0700 (PDT)
Message-ID: <d8c5a4f1-a867-46b6-8519-81c0eba37501@oss.qualcomm.com>
Date: Fri, 8 Aug 2025 15:24:27 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] clk: qcom: Add TCSR clock driver for Glymur
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>
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
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-3-227cfe5c8ef4@oss.qualcomm.com>
 <aIoBFeo00PPZncCs@linaro.org>
 <784545d0-2173-4a8b-9d5d-bee11226351e@oss.qualcomm.com>
 <aIxRKHKdBHDefDs2@linaro.org>
 <d2c17575-f188-4154-bb63-e0b1b89d8100@oss.qualcomm.com>
 <b2f219d6-d441-45d0-a168-b2cdbc01b852@oss.qualcomm.com>
 <3fc425fd-39fa-4efc-bc98-da86a88bfb1a@oss.qualcomm.com>
 <c2f39786-5780-4124-9e41-6971428aa267@oss.qualcomm.com>
 <9e3b4706-c61a-4d69-be84-a5b6fc90eb35@oss.qualcomm.com>
 <462b4010-fd79-4682-b9d2-31ffdd53b75a@oss.qualcomm.com>
 <ffbd9302-75f1-4148-881a-767fa413c825@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <ffbd9302-75f1-4148-881a-767fa413c825@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX5DQQ9PUAZlt0
 XVFCXifPsPwzAy6Y5g4oP9gxq1bzMRujk9dta2UTJ3qM3pfi4GoTFLEHzJkjhUr4fZ6SWFxo9JB
 CiNInYbhW1Qj4wRvD/Rti8cePh0dKc2MN4YxZ1/Al4RxuLYRinR7M5RrgpYayraqeTKPhW0J0Ek
 6snmQ83OYQ1vornSsdaSYiPxrgxtuCl3k2LP1NnZ36HqiiXLUsCPhyTZRgtb2P8ZL8hUE03ot7R
 xUBKfeJF1m8PJmXgZ96cDAADObqtVZ/c73c2ThxtJQXgAtzxvuimzXKOypKEW/2CufltWMaT4kw
 Ps21mKlXJIPIhSt+SaKjVXhy/UW6fNclVpPRzvjK0tcRpB49ynYS1oiAs0IfKFD3NkIXVRV1VAh
 VJvJZ8lt
X-Authority-Analysis: v=2.4 cv=J8Cq7BnS c=1 sm=1 tr=0 ts=6895c95b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=zhkC1EFh2bCrlkiyJb0A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: sXdCBLPc7ymGphyykcTutDkJoz4DTnO_
X-Proofpoint-ORIG-GUID: sXdCBLPc7ymGphyykcTutDkJoz4DTnO_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008



On 8/7/2025 6:37 PM, Konrad Dybcio wrote:
> On 8/6/25 12:21 PM, Taniya Das wrote:
>>
>>
>> On 8/6/2025 3:34 PM, Konrad Dybcio wrote:
>>> On 8/4/25 4:21 PM, Taniya Das wrote:
>>>>
>>>>
>>>> On 8/4/2025 6:40 PM, Konrad Dybcio wrote:
>>>>> On 8/4/25 11:00 AM, Taniya Das wrote:
>>>>>>
>>>>>>
>>>>>> On 8/1/2025 5:24 PM, Konrad Dybcio wrote:
>>>>>>> On 8/1/25 7:31 AM, Abel Vesa wrote:
>>>>>>>> On 25-08-01 10:02:15, Taniya Das wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 7/30/2025 4:55 PM, Abel Vesa wrote:
>>>>>>>>>> On 25-07-29 11:12:37, Taniya Das wrote:
>>>>>>>>>>> Add a clock driver for the TCSR clock controller found on Glymur, which
>>>>>>>>>>> provides refclks for PCIE, USB, and UFS.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>>>>>>>>> ---
>>>>>>>>>>>  drivers/clk/qcom/Kconfig         |   8 ++
>>>>>>>>>>>  drivers/clk/qcom/Makefile        |   1 +
>>>>>>>>>>>  drivers/clk/qcom/tcsrcc-glymur.c | 257 +++++++++++++++++++++++++++++++++++++++
>>>>>>>>>>>  3 files changed, 266 insertions(+)
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> [...]
>>>>>>>>>>
>>>>>>>>>>> +
>>>>>>>>>>> +static struct clk_branch tcsr_edp_clkref_en = {
>>>>>>>>>>> +	.halt_reg = 0x1c,
>>>>>>>>>>> +	.halt_check = BRANCH_HALT_DELAY,
>>>>>>>>>>> +	.clkr = {
>>>>>>>>>>> +		.enable_reg = 0x1c,
>>>>>>>>>>> +		.enable_mask = BIT(0),
>>>>>>>>>>> +		.hw.init = &(const struct clk_init_data) {
>>>>>>>>>>> +			.name = "tcsr_edp_clkref_en",
>>>>>>>>>>> +			.ops = &clk_branch2_ops,
>>>>>>>>>>
>>>>>>>>>> As discussed off-list, these clocks need to have the bi_tcxo as parent.
>>>>>>>>>>
>>>>>>>>>> Otherwise, as far as the CCF is concerned these clocks will have rate 0,
>>>>>>>>>> which is obviously not the case.
>>>>>>>>>>
>>>>>>>>>> Bringing this here since there is a disconnect between X Elite and
>>>>>>>>>> Glymur w.r.t this now.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> The ref clocks are not required to be have a parent of bi_tcxo as these
>>>>>>>>> ideally can be left enabled(as a subsystem requirement) even if HLOS
>>>>>>>>> (APSS) goes to suspend. With the bi_tcxo parent the ARC vote from
>>>>>>>>> HLOS/APSS will not allow APSS to collapse.
>>>>>>>>
>>>>>>>> Is there a scenario where the APSS is collapsed and still the ref clock
>>>>>>>> needs to stay enabled ? Sorry, this doesn't make sense to me.
>>>>>>>
>>>>>>> MDSS is capable of displaying things from a buffer when the CPU is off,
>>>>>>> AFAICU
>>>>>>>
>>>>>>> We can do CXO_AO instead to have it auto-collapse if it's just Linux
>>>>>>> requesting it to stay on, I think.
>>>>>>>
>>>>>>
>>>>>> Thanks Konrad for adding the display use case.
>>>>>> Abel, we earlier also had some PCIe, USB use cases where we had to leave
>>>>>> the ref clocks ON and APSS could collapse.
>>>>>
>>>>> XO votes will prevent CX collapse, not APSS collapse. CX also powers
>>>>> USB and PCIe so that only makes sense.
>>>>>
>>>>> I think it's fair to just stick XO as the parent of every refclock
>>>>> today and think about the what-ifs (such as the mdss case I mentioned
>>>>> above) later - especially since we have no infra to take full advantage
>>>>> of it today (non-APSS RSCs etc.)
>>>>>
>>>>
>>>> When ref clock have been part of GCC, then also they didn't have any xo
>>>> as the parent, similar design we kept when it was moved to TCSR as well.
>>>
>>> Perhaps we've been running on luck (i.e. XO votes being cast through
>>> another device / clock as a second order effect) all this time.. I'd
>>> happily move towards formal correctness.
>>>
>>
>> I would like to stay with no XO linkage to TCSR. Any driver has specific
>> XO requirement should vote for the rpmhcc XO or XO_AO.
> 
> Every driver has an XO requirement, as we happen not to have any
> other crystals onboard.. The clock plan says that these refclks
> are direct children of XO too
> 

The refclocks are just not the direct XO, there could be other source as
well. But I am okay to add the XO parent if it helps the use case on X
Elite and then following use cases on Glymur. I will add the XO parent
in the next patchset.

-- 
Thanks,
Taniya Das

