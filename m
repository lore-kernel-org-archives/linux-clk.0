Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83F2218AA0
	for <linux-clk@vger.kernel.org>; Wed,  6 Aug 2025 10:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754474648; cv=none; b=pUwH16iY8jo9W3L6Ttq60+ah1ZtZ8xoR6uAMvGZ3XaQPbTodqJgq8nifN76nvX7liHIbTa0iU0aI/eCk7qlpuxbuAxVCIEE8mac5IPb+wRMUvbQViGyp6IFY4h2EtmnlZkS+4d844kq3zcoU/7/aTtHckZCtWqrBT3GM1FTtYAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754474648; c=relaxed/simple;
	bh=Nfg8ZV5S9dd/rRMBz2rWxYkRdNNUygm0/QvzT0BF+uQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HriZ4totkCmUzYLJFafF4HDgeK2eSoMUaMPePGAoyPfDmoxPXa4Yc19CI3yy99yk/WZ8GRHa9xoRpTKqB0iQi+xxkNiu9eeBslYT1qi8YB5c4hq3A5GPJIKTgMkm9W0zrpOsugI6URUhfj1BgJ8L8Ek0mizq8Z6tIrkAa/C5XoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5UKKG95; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5UKKG95"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5769ekq3032245
	for <linux-clk@vger.kernel.org>; Wed, 6 Aug 2025 10:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oH0wyHvL/nCeJrABEE6IBIqEp4r0L7EIKpUAEvO9+wo=; b=o5UKKG95Q5yUM+mz
	NZuWdcHD3OvOB4UZ5PNhLVK9C404h6tZmbkL70mxsguk7R4Ir5vlDlyHDDmdm/DS
	sWd0viLicRTNFVKGiZn/2FsdgTDK8OhVy7G4PjL0qjVhW8i/X4BD7mKUnF5dopvM
	PKydHHasD6GYBGESX506yd0I4VtR7KN3sSS72jFBj5QrG1p1HdGzgvKUupadUnd7
	2sSrUb+f4udAd7DMwQYwZCjtm4x5Hj9NCljepjBwyxADM2FymZtbQq1AUk5rK2Nc
	UeASzRfcErIfFE5ManV+p1sJYUh0JI8i9oypzgF+Ipt2pKY4EFDxm9unwEhsDbwP
	8bqfLQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw2tcq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 06 Aug 2025 10:04:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b07de45deaso2211121cf.3
        for <linux-clk@vger.kernel.org>; Wed, 06 Aug 2025 03:04:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754474645; x=1755079445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oH0wyHvL/nCeJrABEE6IBIqEp4r0L7EIKpUAEvO9+wo=;
        b=QDSftXOcYr4p06+3mLjNQPls2RNjC1FuVP6gp0MPWSlkRgLnwWGN77cerxwP00pYlZ
         HsTK3ui9ZNnMRlCzmix0oVrf9JDNnpM8coz/X/zdTrtJ9wxij9B9S9faJDFYsma4V8Mm
         GTnltjVtJhUknwPKaQvkv4gU8TjtlF9cir7Cym0SvNWlTEJ5q2seTXO6H4uv9x41Dcir
         0fmcJNEO5ulpX2x3f+uhNeJmfTHenc4mt47SJw1wwMCJJUhIYYJEO5N6N5M1cV09MCCt
         7dTQF34keLn62jj6ZHjmoBFp75WMCtguiByf+XxI5+UunxeLYWCjYD1loVTkF7x+Q7KO
         m/UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTOg26FhMOKJ1GxLOvFABNQlhj3VGLeIC1dWMREnOLVUqP+PVHH+G7/4HkKiUUyBnD4xBpiNkEDUA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8tKTj8lS+haP0jnLgmbNGWMIUw867NZII3QsFC1F0TJ4jOA7+
	4N1xThXyPH31Hxkzm4pEvifEnPCtxDe/TLMFL3ctiXb4TB8xvwGm5/bH7hyTZnaSMUoPjf3Wssl
	9yOEBKJZHRLmm+6HkVHD95z1XXn6wPXgp9fqMQTcxTJ75eatl57+P0HUFB94xZ60=
X-Gm-Gg: ASbGncv0Z2z5bndL5opMMMkYsGgNWhd9HFe4LsFop4nfBkMfUavzfPL9/JvIjQTrDb0
	SOAt9Au+KS1vNe4c5HVJPftTs4KsQ3Agpj+Cm+vphd3W4fgHufPMXOO6HvoBV76mCdJ7AnTNiaJ
	hDqpYWbY9kStZXoRhqCjvzMnQ9ICj98AE2R8vDvpGqnzeppgPN4Ldl0DTThYWmDGIEriYfHDHIs
	77b0OfQrJgD8EYH358XrKmiITNCPlx5T0mSn+NsOsKN9LI8AJVi7IxBjV0OBjqUMruxGWwbbEPs
	l5gYYYkwe3untCAe0D6WAzrHcHRyzq7J+3vZ6W0+sv5wak4alUwmc0fBMyrw/fr3UMtRbh/TSLx
	9lkrxxevmy+FdQnUnbg==
X-Received: by 2002:ac8:5888:0:b0:4b0:8a0b:5dc1 with SMTP id d75a77b69052e-4b09141c634mr13322111cf.7.1754474644626;
        Wed, 06 Aug 2025 03:04:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCC204sGp2lAh4JdpyVcbNWgkbVjvoq6ZF9ArXM/l5nXMta/9k4mQLlGTUdhT1lX3+nZ0M8Q==
X-Received: by 2002:ac8:5888:0:b0:4b0:8a0b:5dc1 with SMTP id d75a77b69052e-4b09141c634mr13321711cf.7.1754474643981;
        Wed, 06 Aug 2025 03:04:03 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af994cbb883sm86231066b.28.2025.08.06.03.04.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 03:04:03 -0700 (PDT)
Message-ID: <9e3b4706-c61a-4d69-be84-a5b6fc90eb35@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 12:04:00 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] clk: qcom: Add TCSR clock driver for Glymur
To: Taniya Das <taniya.das@oss.qualcomm.com>, Abel Vesa <abel.vesa@linaro.org>
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c2f39786-5780-4124-9e41-6971428aa267@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vbz3PEp9 c=1 sm=1 tr=0 ts=68932895 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=pLAVxPC-hiG7cL8D95sA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: k0-uKySF6bDBhPLHQo1P90bLN9jz4Zry
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfXxYZkOpK6MejG
 4Kz6rp6pZhclvak7Rg6TuhqKcdayIE1wKb63OmTXzPeHOsTHlZl8WxFJLeQ/w0pceXppnn4T6a8
 0iwMOFR8uscIpz9vSrfrfH56S13jC8l8CQpX6HHxAS3kmQwUvquZ3EN/uih6OhoQ4JcUbbJZ2qa
 mEEYYRUhxKcIUqgG28eGDV2GVpCyX8UOAVjp8ytvJo5I5M0b0Lpxd7/9DI+3mGUa3JtxjXwYHri
 YJiylZajJg/anZrGXa66fXvn72Kd6IsEJ4EHV2SIl6rqcqFSkZAWIJGFuqoOMGtLwerundkP/8O
 tbpePHRaTaGVGkQVXoiVGIUQ2kLrSzaC8n6QCqL6ldhUazMC+PxdkQG44KJ427K4q7a/XGQlfP0
 J4WMvhuy
X-Proofpoint-GUID: k0-uKySF6bDBhPLHQo1P90bLN9jz4Zry
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008

On 8/4/25 4:21 PM, Taniya Das wrote:
> 
> 
> On 8/4/2025 6:40 PM, Konrad Dybcio wrote:
>> On 8/4/25 11:00 AM, Taniya Das wrote:
>>>
>>>
>>> On 8/1/2025 5:24 PM, Konrad Dybcio wrote:
>>>> On 8/1/25 7:31 AM, Abel Vesa wrote:
>>>>> On 25-08-01 10:02:15, Taniya Das wrote:
>>>>>>
>>>>>>
>>>>>> On 7/30/2025 4:55 PM, Abel Vesa wrote:
>>>>>>> On 25-07-29 11:12:37, Taniya Das wrote:
>>>>>>>> Add a clock driver for the TCSR clock controller found on Glymur, which
>>>>>>>> provides refclks for PCIE, USB, and UFS.
>>>>>>>>
>>>>>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>  drivers/clk/qcom/Kconfig         |   8 ++
>>>>>>>>  drivers/clk/qcom/Makefile        |   1 +
>>>>>>>>  drivers/clk/qcom/tcsrcc-glymur.c | 257 +++++++++++++++++++++++++++++++++++++++
>>>>>>>>  3 files changed, 266 insertions(+)
>>>>>>>>
>>>>>>>
>>>>>>> [...]
>>>>>>>
>>>>>>>> +
>>>>>>>> +static struct clk_branch tcsr_edp_clkref_en = {
>>>>>>>> +	.halt_reg = 0x1c,
>>>>>>>> +	.halt_check = BRANCH_HALT_DELAY,
>>>>>>>> +	.clkr = {
>>>>>>>> +		.enable_reg = 0x1c,
>>>>>>>> +		.enable_mask = BIT(0),
>>>>>>>> +		.hw.init = &(const struct clk_init_data) {
>>>>>>>> +			.name = "tcsr_edp_clkref_en",
>>>>>>>> +			.ops = &clk_branch2_ops,
>>>>>>>
>>>>>>> As discussed off-list, these clocks need to have the bi_tcxo as parent.
>>>>>>>
>>>>>>> Otherwise, as far as the CCF is concerned these clocks will have rate 0,
>>>>>>> which is obviously not the case.
>>>>>>>
>>>>>>> Bringing this here since there is a disconnect between X Elite and
>>>>>>> Glymur w.r.t this now.
>>>>>>
>>>>>>
>>>>>> The ref clocks are not required to be have a parent of bi_tcxo as these
>>>>>> ideally can be left enabled(as a subsystem requirement) even if HLOS
>>>>>> (APSS) goes to suspend. With the bi_tcxo parent the ARC vote from
>>>>>> HLOS/APSS will not allow APSS to collapse.
>>>>>
>>>>> Is there a scenario where the APSS is collapsed and still the ref clock
>>>>> needs to stay enabled ? Sorry, this doesn't make sense to me.
>>>>
>>>> MDSS is capable of displaying things from a buffer when the CPU is off,
>>>> AFAICU
>>>>
>>>> We can do CXO_AO instead to have it auto-collapse if it's just Linux
>>>> requesting it to stay on, I think.
>>>>
>>>
>>> Thanks Konrad for adding the display use case.
>>> Abel, we earlier also had some PCIe, USB use cases where we had to leave
>>> the ref clocks ON and APSS could collapse.
>>
>> XO votes will prevent CX collapse, not APSS collapse. CX also powers
>> USB and PCIe so that only makes sense.
>>
>> I think it's fair to just stick XO as the parent of every refclock
>> today and think about the what-ifs (such as the mdss case I mentioned
>> above) later - especially since we have no infra to take full advantage
>> of it today (non-APSS RSCs etc.)
>>
> 
> When ref clock have been part of GCC, then also they didn't have any xo
> as the parent, similar design we kept when it was moved to TCSR as well.

Perhaps we've been running on luck (i.e. XO votes being cast through
another device / clock as a second order effect) all this time.. I'd
happily move towards formal correctness.

Konrad
