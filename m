Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F197114F9D6
	for <linux-clk@vger.kernel.org>; Fri,  1 Aug 2025 11:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754049271; cv=none; b=aBdlO/lX5pW1Nxpf+aCEjAD2VzNMThuSmh6pf1HJHQ/viIjWFJ4Vcb+Lu8sCGig/+o50WRO6k2mofuYDr/4k7EBKNOKarjUCjD9vPvQ3/b6qxd08nhHrC147sD63A6HKS1fUC7u9dAkSPp6t12xM+6rmv2cBsWp8UQ00lAhDkj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754049271; c=relaxed/simple;
	bh=L1ffq+YnAjiE6H9FN6/GOqUbgu3aX3Qw0xclYiGdav0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wm7xqJOITdT+zwi0yo2avqiOv+yZKohRp0jHYBkBOu5EmFi85mxiV5VGfgKGVkWIYjDHH46kxXplrYwTgV3CwRALT+aDAeIijTFLCLSYNo3iRk2tRx+d2nPLyqtEBEtnmSAHdVTmSH0xHlK6L81dKJk5JtivPk3cv2eA2M1/eIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jp/hcV3q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jp/hcV3q"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5718heD9018840
	for <linux-clk@vger.kernel.org>; Fri, 1 Aug 2025 11:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y0yAyctewBGcrkhnpcRUCf+/nTscTMEDN7WOB2NFG1k=; b=Jp/hcV3qVABDrEwv
	WDncH6TBNkGa64/U7vm+13+Z/WyxPjKJMzJNHKHOcYsi/iVnshw+P6XueQPQTSvj
	JxD1bPC+L2URM7wjdGd2cFKPLJr4hsqJo3llLkwuvkGuwB4BPz/Vi7DvJd0tQThw
	8Vo1Evho5Xa4eFoMfQuIY3jYXAhwgDHPVbp5XGh8VXdey0N7rbtSFTruAGPPhGhc
	2SY2lwxv5HcS1iMpBl+M8vv+au3hBrggXhoim/EvWP8CnbRUoJWjn7qGwCha7dfe
	SFNBLsrlfSLZeRD+FWD7hp9P6Zx20v25Q5Vec6fZj7NQBj6wu9RTWqblzLim5CRK
	uG1xrg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qdabmc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 01 Aug 2025 11:54:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ab3f1d1571so4582021cf.3
        for <linux-clk@vger.kernel.org>; Fri, 01 Aug 2025 04:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754049268; x=1754654068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y0yAyctewBGcrkhnpcRUCf+/nTscTMEDN7WOB2NFG1k=;
        b=pBMNRvggvMkVarOo/iR9HcaC/nL+Xp3jfm4C6Swnk2lmkWWbIgJ68Uk5dA/j55H5rX
         fHv+L5Ja8LLMDe4WE18YlsQzRZTiftPlRioLkBjUjW9pwZHCqjYC0G6wVSgcewy2C9T/
         B9INgi+A0lu2z078nVYE65cW1kjmodibgd5eY9EFGjqhuoiFh4BokZsG8dJNSe1gFLho
         MNaEdgQq1yakqJAiEFFei1MY1oMeVHJh5OZTihqmeGgL0kp9WRKN7+FzNBn/WcGgIocH
         cQb5qHA3enQKb0YR0fZaDy7KFyBnWf8cGtv8C+/kItvXtQcSo6KfGXw/+vs/x1U3jUw9
         smnA==
X-Forwarded-Encrypted: i=1; AJvYcCXgN2cIyQfmYJoecOy71YN5gLEBu0Pr7uobJXCMiF2G4JpMQdTnKK8A/UJ0ilV0vW76P3HeWomNoso=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR+3+R0zcQmWGpaLxJXgT816ja92JtDaybHY/FtLe7UBVV4DAB
	d0pbbo+SbZa47m+hSCatOtnkzX9BPSbv5DAcO74u39VUQIAflckTDTuhK4kpFpX4e+ym9pyAcsI
	B1GMJdB5Hkhj9ZgR/Grz6onYFefKpsGRBAR57ECEZv2j4Z5IfJ66TWgZ1tLxwn0g=
X-Gm-Gg: ASbGncs3dBzEFDQkH6T5PIsivseJzqSzcst+1sU8exIZzOoGaIcq32aaNWgXvSqUFr4
	geHm280gZWZaxnvVZrlOhCTm5JoY2vZk8w+k2QIv16fdKYMLTfQ9qB3bwKY5LrqtbQdaB9s+XHy
	PYoFTL7ZoFHFPXhu7nHOww9lGsOT75h02E/pkOAXQx1kY04lYGNdjuF8YPUP6Snz6m+W/ELwlg/
	Hg+fGRRjSQu9Xuu5Td4Rto5tKyiEkpRImOl+KIx3D586HKgo6lJsVny0bCF4dwebTyWQTyM7mBe
	LKSP/ctIoEa238Z1+CBRsfINd61JrB8fRpV0vE/jdp2AbwNAYYfsTEwPrYJjfpzOBS6KRX2AwQQ
	vgO1v49bI2S2I0uBdwA==
X-Received: by 2002:ac8:7f8f:0:b0:494:b722:141a with SMTP id d75a77b69052e-4aedbc28da8mr7053061cf.13.1754049268007;
        Fri, 01 Aug 2025 04:54:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCLWAyERKRPjTr99qlj++Pgz2FeFXYlRWohtNL2x48UgquA0olCovFHymfIyPzxvQjxQn5kA==
X-Received: by 2002:ac8:7f8f:0:b0:494:b722:141a with SMTP id d75a77b69052e-4aedbc28da8mr7052851cf.13.1754049267571;
        Fri, 01 Aug 2025 04:54:27 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c10asm277886566b.116.2025.08.01.04.54.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 04:54:26 -0700 (PDT)
Message-ID: <d2c17575-f188-4154-bb63-e0b1b89d8100@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 13:54:23 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] clk: qcom: Add TCSR clock driver for Glymur
To: Abel Vesa <abel.vesa@linaro.org>, Taniya Das <taniya.das@oss.qualcomm.com>
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aIxRKHKdBHDefDs2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bOGdvIJy4w58v2H9sEIAHL5NSBikR4VB
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=688caaf4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=pJtBvqx0UPjT60PkLbkA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: bOGdvIJy4w58v2H9sEIAHL5NSBikR4VB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA4NyBTYWx0ZWRfXzNsidyA0q0mI
 xTjsJRNwReF3qS7mrn4oJumvUhAue0ChXEvxS4dgzfRN2sfLOzR9oWSqbvmE8WSHW/N3tktLtFt
 hYWLr+r0PJXzpcchs3a/Ms0YLA1NjB0KoUegHq7/nptGiW8qc/Yg0GK/qihuvrjcGy12OAH0Pdj
 Zbip2HiHfO7JNYb4AufzDLSauKZ1+z022vXTkuuU2AoJppDmUkrSAVaPLWWnLyfl0+DWdotGxRE
 8D8McTCSUk1XlVFdix9ivrUgDZIlAL/tV/RdtCYIu5gCUuPUQ3lIBGrM3VjZI1RcFysI/k5N+yP
 7XSh/Oj9d7ktfcxdZxD4TNsHGhYpAqTcjL2or2m2P3W0buqVIVFBdhijjw5rhF8tLJp/0BnENMd
 vZ5HeI6500hF0NJLuHlxG+4aaZxQ9W/hCSdTdC5ivD4ZmiyFr2IlrcKrZJ6uw4LDDDsCbTqP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_03,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010087

On 8/1/25 7:31 AM, Abel Vesa wrote:
> On 25-08-01 10:02:15, Taniya Das wrote:
>>
>>
>> On 7/30/2025 4:55 PM, Abel Vesa wrote:
>>> On 25-07-29 11:12:37, Taniya Das wrote:
>>>> Add a clock driver for the TCSR clock controller found on Glymur, which
>>>> provides refclks for PCIE, USB, and UFS.
>>>>
>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>> ---
>>>>  drivers/clk/qcom/Kconfig         |   8 ++
>>>>  drivers/clk/qcom/Makefile        |   1 +
>>>>  drivers/clk/qcom/tcsrcc-glymur.c | 257 +++++++++++++++++++++++++++++++++++++++
>>>>  3 files changed, 266 insertions(+)
>>>>
>>>
>>> [...]
>>>
>>>> +
>>>> +static struct clk_branch tcsr_edp_clkref_en = {
>>>> +	.halt_reg = 0x1c,
>>>> +	.halt_check = BRANCH_HALT_DELAY,
>>>> +	.clkr = {
>>>> +		.enable_reg = 0x1c,
>>>> +		.enable_mask = BIT(0),
>>>> +		.hw.init = &(const struct clk_init_data) {
>>>> +			.name = "tcsr_edp_clkref_en",
>>>> +			.ops = &clk_branch2_ops,
>>>
>>> As discussed off-list, these clocks need to have the bi_tcxo as parent.
>>>
>>> Otherwise, as far as the CCF is concerned these clocks will have rate 0,
>>> which is obviously not the case.
>>>
>>> Bringing this here since there is a disconnect between X Elite and
>>> Glymur w.r.t this now.
>>
>>
>> The ref clocks are not required to be have a parent of bi_tcxo as these
>> ideally can be left enabled(as a subsystem requirement) even if HLOS
>> (APSS) goes to suspend. With the bi_tcxo parent the ARC vote from
>> HLOS/APSS will not allow APSS to collapse.
> 
> Is there a scenario where the APSS is collapsed and still the ref clock
> needs to stay enabled ? Sorry, this doesn't make sense to me.

MDSS is capable of displaying things from a buffer when the CPU is off,
AFAICU

We can do CXO_AO instead to have it auto-collapse if it's just Linux
requesting it to stay on, I think.

Konrad
