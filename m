Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5796828D8DA
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 08:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776155227; cv=none; b=b6lkxbQnrZMaPfD2LQWse9mwDAFxrF9UsPW+NQjt4mr5j/40EV/ybGYb+JC6HEhxedaJK08LCp6vT65/XnIsoM0uaJ8o5c1qPAUcvuiteLbG2dkG99c5BWqQdPMGkDhQBJTi5aOIoizLv6B12pNUiFbLVb38boa9n7mUmxLUzZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776155227; c=relaxed/simple;
	bh=F4paP3AYrGUdXYxOVyHozv15q2PNZRMdSNaf9srxWgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JFjmuMMjcJi8WHG2yqsY8Pg3cpnnpJhqrq7opA6o+oA1rx9bLAngEXDIVMxyz43VjOHRj/dSNQ8GGosdy7Cxy2elDgnIDEGq1EfxdWSzNXU+5PPV70X7vAZvaNLQJgNotkS85n3I4MVv/iJCDghrwaLditfEIr007WAmwH31fmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kiH8ofOI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UU8HEa1U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kiH8ofOI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UU8HEa1U"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6WTK43425638
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 08:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uDT//1wLOvhRQGRYA5N8g1SyqlnI49rmAoCo4iiPEqw=; b=kiH8ofOIHJPqgGzs
	k8wLk/jOHYJ/xn6j9pHkqxc16RAhfp0kgrXWhGSt1wDKjQz+THZy/sxSiFyAiDRN
	34NLXbb3wEAJa1TlC7fc85kwViSpVTv5JdvQQLomcvHQ9yMTEnfOU/aEbqaMR0IM
	u6kuFzqajzFCIOjCEWNp/98x1xL0m8nlpK+9AFjLoJEZIyfvaf7ykhgesQL2GZ0z
	GzZvtoAYPsdEO8QMsqdVkhRbA/8qu/+pqIMKVcDZCSoaqwrS+81+SnEuYqG+jVGX
	X7mHo2gWkWyKvosVu6Pv/1wGBCC9M8IqCWFu6Pf7GjEf+E1BDRFhGikIQOiwYPW+
	tlyAfw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87f9snc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 08:27:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d56ae62e86so160096785a.0
        for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 01:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776155224; x=1776760024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uDT//1wLOvhRQGRYA5N8g1SyqlnI49rmAoCo4iiPEqw=;
        b=UU8HEa1USsEA+BcM5WyK2HtFNCuogwN7cGe5ibPgRtZEufHm2JVzTkgSW/tRt3/iyF
         aVmkJBEr8WUfzPScKRc2KvUzkkBwQB3lEFomqHX3j4+f4/YI4tPpp2/VfZbLjvAid/WQ
         2LrC7yt9y2BYHaePVCoae8tGlju2t0rwHciN0cxxSnc1z4anQN7+ZcSXhJvXe4LhIscy
         E7lvTIdLdT68ENN2D7g9uocMYmokcWDicOa119VgRfsXq8mLriBlWUlbMt7X3csY7rlL
         RAiSfG217nVrs/94ITs4gX+GIrDCFkOEjSOU8zzwbbWDhCiQVryxQHdzPENwOqKpOnZI
         qruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776155224; x=1776760024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDT//1wLOvhRQGRYA5N8g1SyqlnI49rmAoCo4iiPEqw=;
        b=VJxg/yYaImuwrMNXI+gdnwqkGEusjSJKNOfw47p/9tBKh8V/nKqOyg/3h0odFyKL6d
         NGd86CyHJn/RZN2XItSXVLp0ZqP7QLQ+9CF+pNnKVMDaPUKzsIqghKkjtaRAfx9Yr2b2
         MVakSh5Q5SvxEpgrDLpJZkOjm8w7raCOlwKq+GMedwEekPUJnbZoIuVW9PBV0rjN+atC
         GJ7+9t5GszbJEd5ARbbLGLoAbRPwYabJj4aFSR6pJjY0uZSluBel+ZBiQKe1baltxBCz
         gi1yKX11n8p80FXaztxXCehOMUNBfxqpF7JfJXAXASCCEasT88NEMzu+Zi4ZQWV3G7bs
         TdDA==
X-Forwarded-Encrypted: i=1; AFNElJ+trfSjCJTMeLSJl4Fpirfb5R8UeWGGgx4NKq24Wp04GNFcTZ93Y1j4HgfAgf1SyGnF8xGUbL1+pfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpTe87MLFizMKgfM8JcyZmUDpu7arUBiiyBgmp1XfmMUl8Z4DF
	C4S1ImQO2CgVcBjOeHV4mvI0GXfk8NwcZggHWhjQtOmkMaX3FxjupZQ1av+ufRVrISEo+Zj8Ugy
	JhJ/WYScflzItLbXOTgSE8YknxZxZVbSzL5Tf14b0nTwVVT7KZI2V7P3eNvTFIGA=
X-Gm-Gg: AeBDiesj8Tjo1PRBY+7eXg2kWIZHcMSSrRddpmeMJC6qOWND7UCkIuO/Dxy5hL0UKaR
	kag/mxvZ/GlBf354D2ajQZRSqslnE1Ginam2fpOivJS/Nmu7I4O1PnYAFmDd8HY3/3Y92DTT/6Y
	0kR/NSdXYoaHSpdkz/VuKl+N7v2r+I6BVx3hp2MFNwajzVNMMhsssfLmdblJ7TVJXHUZEew7RIy
	O2eVBaAxToJ1OYNei1ZDeyGSYnl2b5RiSUMgqcVvL7+8D1BBkTmQ4Y/wgB40Ee3NuPTZhc9do8P
	S6Momgpst8SxIkaYgCu0yRZiacbHrHOvBcW9mGGfJS4brGaIFyLZBm/gaRTJAAYZHzOLAsBgZOm
	OzRDMX+xiGVDf6GAcRxGHdE1/opSeUoiyZN6QO729v4NzRBwOc7f3VM7Fj8DOTFj9qXAgC73LZK
	0k3TW2a58K5iBWlQ==
X-Received: by 2002:a05:620a:1a0c:b0:8cf:dbad:263 with SMTP id af79cd13be357-8ddd00a8658mr1644298085a.7.1776155223936;
        Tue, 14 Apr 2026 01:27:03 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0c:b0:8cf:dbad:263 with SMTP id af79cd13be357-8ddd00a8658mr1644295985a.7.1776155223432;
        Tue, 14 Apr 2026 01:27:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67070815d27sm2847759a12.24.2026.04.14.01.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:27:02 -0700 (PDT)
Message-ID: <fac86ab0-6479-422e-a9ae-27d643767a94@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:27:00 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: clk-rpmh: Make all VRMs optional by
 default
To: Alexander Koskovich <akoskovich@pm.me>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260412-clk-rpmh-vrm-opt-v1-0-37c890c420ff@pm.me>
 <20260412-clk-rpmh-vrm-opt-v1-2-37c890c420ff@pm.me>
 <4dafae66-1ef1-404c-854c-b72d3313f5af@oss.qualcomm.com>
 <70GGl_MdOrdjIh3ZXqqz5y2NU0HwZ-HIZIzhglTAIpsyiFeyFKqDUUQe8f-krzLSzirMGLjlDsk2YK3-Qo5c7XGqv8qq6NK5F_UCPdt_hqE=@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <70GGl_MdOrdjIh3ZXqqz5y2NU0HwZ-HIZIzhglTAIpsyiFeyFKqDUUQe8f-krzLSzirMGLjlDsk2YK3-Qo5c7XGqv8qq6NK5F_UCPdt_hqE=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3OCBTYWx0ZWRfX6rHAy8WjWUGZ
 j34Qe+qYeMNNX6kOxn1djL2uHuDOXNHxmwWY3DgcFhe1uHuVH24nBLQfinuSfuwbzr5c96I28SE
 7hmmhwRoR5Q9Vvk2S4aM03FELhuW/KGkMBMA3kilXtiM4eI3J9oABVfOEZS5p0MT5eqHpdTpGTH
 rgsKRzEJbEgJa9D9aQC2SpfNvf5ql01+jgImnKfEPC7VAgZU69lSbKyAcGoMAE4CV5EkJORjR2m
 +clRjhft2pOODFN7DkiosoDrDiIPzp5MpPStsck5HBLTVZNoULHuYVKyENCpUS2aKFoUtx3NJhO
 fRSlWqF8wAbJ9oRSaa4y3FXpatI7LoFGVoTXV2tx5iSwO2zK+3Rr8sfutOgzOYFTVopv0alm9Dl
 bxfJ9Vyy/+vTXqI/IBQnsb17Y/cC0DP7Hv/dK85AXqan0VqTAkRCbr4TlUpghfxIyPkDAsoiAnE
 io6LtJ0pg/Fmi8p7v+g==
X-Authority-Analysis: v=2.4 cv=DaYnbPtW c=1 sm=1 tr=0 ts=69ddfa59 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=HsagrseOr4lGoIFxeuAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: XekgDNBOSgc6Qf_k9eXE8eU7Vl3Mkwht
X-Proofpoint-ORIG-GUID: XekgDNBOSgc6Qf_k9eXE8eU7Vl3Mkwht
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140078

On 4/13/26 11:02 AM, Alexander Koskovich wrote:
> On Monday, April 13th, 2026 at 4:48 AM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 4/12/26 5:30 PM, Alexander Koskovich wrote:
>>> Some VRMs aren't present on all boards, so mark them as optional. This
>>> prevents probe failures on boards where not all VRMs are present.
>>>
>>> This mirrors the downstream approach for this issue.
>>>
>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>>> ---
>>
>> [...]
>>
>>> @@ -976,6 +982,11 @@ static int clk_rpmh_probe(struct platform_device *pdev)
>>>  		rpmh_clk = to_clk_rpmh(hw_clks[i]);
>>>  		res_addr = cmd_db_read_addr(rpmh_clk->res_name);
>>>  		if (!res_addr) {
>>> +			hw_clks[i] = NULL;
>>> +
>>> +			if (rpmh_clk->optional)
>>> +				continue;
>>
>> if (rpmh_clk->offset == CLK_RPMH_VRM_EN_OFFSET)?
>>
>> That would let you drop the rest of the patch.
>>
>> This also needs some additional background.. I would assume this comes from
>> a slightly different HW (PMIC) configuration
>>
>> Could you please do `grep ^ /sys/kernel/debug/qcom_socinfo/*`, (perhaps
>> censoring your serial number)?
> 
> /sys/kernel/debug/qcom_socinfo/accessory_chip:0
> /sys/kernel/debug/qcom_socinfo/boot_cluster:0
> /sys/kernel/debug/qcom_socinfo/boot_core:0
> /sys/kernel/debug/qcom_socinfo/build_id:
> /sys/kernel/debug/qcom_socinfo/chip_family:0x0000009f
> /sys/kernel/debug/qcom_socinfo/chip_id:SM7750
> /sys/kernel/debug/qcom_socinfo/feature_code:2
> /sys/kernel/debug/qcom_socinfo/foundry_id:1
> /sys/kernel/debug/qcom_socinfo/hardware_platform:11
> /sys/kernel/debug/qcom_socinfo/hardware_platform_subtype:0
> /sys/kernel/debug/qcom_socinfo/info_fmt:0x00000016
> /sys/kernel/debug/qcom_socinfo/ncluster_array_offset:228
> /sys/kernel/debug/qcom_socinfo/nmodem_supported:4294967295
> /sys/kernel/debug/qcom_socinfo/nproduct_id:1135
> /sys/kernel/debug/qcom_socinfo/nsubset_parts_array_offset:232
> /sys/kernel/debug/qcom_socinfo/num_clusters:1
> /sys/kernel/debug/qcom_socinfo/num_func_clusters:1
> /sys/kernel/debug/qcom_socinfo/num_subset_parts:20
> /sys/kernel/debug/qcom_socinfo/oem_variant:0
> /sys/kernel/debug/qcom_socinfo/pcode:1
> /sys/kernel/debug/qcom_socinfo/platform_version:65536
> /sys/kernel/debug/qcom_socinfo/pmic_die_rev:2.1
> /sys/kernel/debug/qcom_socinfo/pmic_model:PMK8550
> /sys/kernel/debug/qcom_socinfo/pmic_model_array:PMK8550 2.1
> /sys/kernel/debug/qcom_socinfo/pmic_model_array:PM7550 1.1
> /sys/kernel/debug/qcom_socinfo/pmic_model_array:PM8550VS 2.0
> /sys/kernel/debug/qcom_socinfo/pmic_model_array:PM8550VS 2.0
> /sys/kernel/debug/qcom_socinfo/pmic_model_array:unknown (90)
> /sys/kernel/debug/qcom_socinfo/pmic_model_array:PMR735D 2.0

So you have:

your phone	vs	Abel's Eliza-MTP

PMK8550			PMK8550
PM7550			PM7550
PM8550VS		PM8550VS
PM8550VS		PM8550VS
PMIV0102 (90)		PM7550BA	[!]
PMR735D			PMR735D
			PM8010		[!]
			PM8010		[!]

And hence the difference, makes sense

Konrad
