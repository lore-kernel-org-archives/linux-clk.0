Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C32F3AEF53
	for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 10:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776076144; cv=none; b=e9kh8wkXcPVx4WgvWQvqhfkuvCzlb+kqxvgH8CDENIBQDGC/la0XEklAmiDSqHP7yDVOLZlGrGzrFl3QmA1KBL7lBKzHO70KmFcVfbiKVOZqli1qfLK85JfKoXAFaFJVrpiofDW2Io0OvYC931hIB4TbK5Psu0Ngq6ux0pKZoO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776076144; c=relaxed/simple;
	bh=u3L1PTzy2C7qGKOYNE8yAm34IQNtT+AVKQJ6RiAisxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UW9pncK3cb69o7yumXl06DehQq/LWXffQCfe2pXiJIEHbO5S3qf/eSuVsvNoPgZJEcz9fPaRWuNEFUK9kKUKzVtBvMs+7QRwl8ZeVvbXrvT8CYYgRzUzyUSMJqrraEPBNMBpLIdr5kv414kkom6W+2ecAickaUKqKgUKI80y7iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RW+VsOXT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AEP9b96M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RW+VsOXT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AEP9b96M"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D525XE3830533
	for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 10:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n4ewFZ3aK7j24D5NUXT1ZovwIzdroV2PCl++QjZ/FJk=; b=RW+VsOXTbA5Enz7j
	ibq+ySlhRmiDxXVl+9A6DdfBMJCQ5jKL+alTGkW5rLRngqnMBvKmHZo1yjeNHGLv
	gEvBoBMvmOjk4M8mt5MlN6YAYbY9bkNXwlJ+XuehcdGbnE4Ju8W4eAlSNo8kjEJ2
	jpfKr/VEhZlmqmejOJiiVE/SafWWuZc6wkkvm7kCioB5VNuc3eqIia25ekK9vgEQ
	UONC+cr8jT67/QXljP1vYi3607vZnaHAmxO9fEBAV/dbcsq4o215zSPbHDJx/5al
	rDYJ4w2zyNLPrVSlJ1u02+aF6bgFnplh1TttlQrX/5LZ8dJDtFkFBZdaihCIqY5d
	TLkxXg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfew04vx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 10:29:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b2955cc1eso6311371cf.2
        for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 03:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776076141; x=1776680941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n4ewFZ3aK7j24D5NUXT1ZovwIzdroV2PCl++QjZ/FJk=;
        b=AEP9b96Mgj03MG6S60qqktUxdxkAMaF2Jtf4nB6X9DBPVlnGCan7YlgXLluJ3ZlAeT
         9NR3Ukhtjs2XnRRLwPX35vac4NTdL+UITzgFud7ZCq7rSdow95XRYiVOWTIFFYsBMgQa
         g/AxOqJNdCd4sDVzk54/8FdlLnJcrmy4ECYKFqvB2M57cwt0tP8PeLqrHSvrembfl8G9
         JU8shQ1v3ZyVddYQwj15RZjRSKjP505VLDPsNEeIpfZh6IdbV9EmW9YUCrgtYyaFBlUP
         yUs9jA4nBcX+ggzg2Cq2X5jTZPMKyEVUoogBGM7cRkWA2gbB0ZBknxJXqiPVfhYytLRE
         s6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776076141; x=1776680941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n4ewFZ3aK7j24D5NUXT1ZovwIzdroV2PCl++QjZ/FJk=;
        b=WQmZbSt5rtr+NIcEIX738LnrPtX0AmqRzlSeK86r9vCqf+XFyNGZX7pUNxSExumQgQ
         tDw31fvsToga0uQS98/gsBPknF1Mtev0xydhvFUEswnPRSpLVdQErjZx4JbfaBervW+u
         B6cv7Vb/nvxAgOFvLTGmsTS5u+kEy4MLAASZtlJ6VWha8spfSJvbwPiHitPef1KHiKBF
         SGyEfG2Nh7Nz1sYWhhX1jRY0YH6IJ5oxNcinNTkUYvsnws9udYlMXlN9LTgJD9HbE2OM
         x2JjUBCfLSasXQNvzSH8a18z6TsG8if6WJuIxb5boPWsMp19bFEVSV7oREjEH84sSK8v
         nrKg==
X-Forwarded-Encrypted: i=1; AFNElJ+Z/m9A/nusWyZFQx/oQxukkMdMTx9wycBGD0c730AaF17I3tqbRAjYzaN+90XkmM4ryMtVQT5uSg8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmTRgnckedH7YPjqD2nQt86qe9+ihjvPtBYzDDo69MorFVVcSk
	9V3fS3ylpY9i4WZCL/6Q2FZ/Y8HNlwrXry1fUhqgq44bWGU6xy5NrjjrBma6UPtqbmvGE1xqj/s
	C6VqcE5Ns6YfhCjjnC0MbjyOZY8gia2XdQMzhm6y4ag4J8wNfIY0OZ4UdmWPxoYI=
X-Gm-Gg: AeBDietksj554UXH1jrRQjeUNY2m38olvsCWmtyl6zwCXwZwXxmxZ+DVzAe0V4pZF+8
	1NQKaMh7Hy2QWNZDBtx68VpNMs7MdXNnm0wr3zka3uLSRRxp/0yZY/RJNXLe03vVVU4WGX+DXbY
	TmBGg4DjVYim6/KfG0zvdHd+GyTMc99rbmVTZeE7ejMG2xTa3koSGeg2tIYxWHYPFC7WOxhdSqW
	7PBVVV2qMRlKiunc9TxUtcpvzFRsazOeVK90hOGj9rvxHoo95IaNs+ThDUrlGvZ/RlfDruLL7fs
	A9RaSq6/xx/G0oy8vgmiZiHSzbCB7wgn6dYHCHwLGHjU0C4V+v28xZzt62HcWsXSfxW+fswCupI
	ahGb5b1zBlo92bUbC8tSG2+8V/45oTAgGvK2Wq9scqxMznAZU3Xj64NII+3e85sMh9rxF1Pj9Ku
	lGe8M=
X-Received: by 2002:a05:622a:2d4:b0:509:47e2:9df3 with SMTP id d75a77b69052e-50dd7cd3df5mr132001671cf.1.1776076141046;
        Mon, 13 Apr 2026 03:29:01 -0700 (PDT)
X-Received: by 2002:a05:622a:2d4:b0:509:47e2:9df3 with SMTP id d75a77b69052e-50dd7cd3df5mr132001421cf.1.1776076140587;
        Mon, 13 Apr 2026 03:29:00 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd88c9sm308377666b.23.2026.04.13.03.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 03:28:59 -0700 (PDT)
Message-ID: <e321f7dc-4053-4a4d-a0e3-40c3a8fc0fd8@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 12:28:57 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm845: Add missing MDSS reset
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260217-sdm845-hdk-v1-3-866f1965fef7@oss.qualcomm.com>
 <590f75c2-6418-4d39-ba7e-589acdf98786@oss.qualcomm.com>
 <e43d5bb2-bdbf-4439-933e-36591dcfd3c1@ixit.cz>
 <9405b67b-9e08-472d-a937-38c038fdf73a@oss.qualcomm.com>
 <ljser6u4fd5qc4lxxde77igtxz6ertbeucsg6s3zbwlykfowpj@yf7h6tqh6cik>
 <9b4cb352-d1ed-402d-a55d-cce2d2fe1eed@oss.qualcomm.com>
 <t5akkkyyv5yebjmowvqu3nnweu5hz47tagdzv3ifzqwlgib2v2@5jugyaiav5wn>
 <8cd9693d-9ec0-4173-bcca-786915b5c4cc@ixit.cz>
 <xbbaffnmi6z5ohzw3p4m6ox75gasgc3nw5cf6yo7h3td2bmsrb@px2mntm74rhb>
 <5b45a40d-54a6-40b5-b4b6-eac344827dc9@oss.qualcomm.com>
 <cm7cowdic42qziuwpe22b2yuakg2k5lqcdnfs3mspvbvprnbto@6kxucxrbnsc6>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cm7cowdic42qziuwpe22b2yuakg2k5lqcdnfs3mspvbvprnbto@6kxucxrbnsc6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEwMyBTYWx0ZWRfXz6lWvXb/BuB8
 lnFxsFfmSzIgJSQssvuGFzVRNV9WCiTSMX8A+E0nMcQz/hlkANq9Wo2rPTDRnM3TCkP1bnxdb0g
 ZKoSXTZJ8RcigOnKfKIkkCmRz4lH8NfK5ZVkwxCFwpN2jSzdU7viciWCfo28DvawylQOgX/IlOP
 Zr4Zt+v7ou1ktN2B78/x66xttcnIxD+JTBSnIROqbC4Jvwg2O3fnV4vvcrQ1utZ9U21jS9iTyXJ
 oZ2tMElSFZJbov8midtnGEvoKawP2iAC+PTvZLh908jGQu42FunfeStSfrINzjHsjTx6bC4EkKL
 fuvVOtN9FB5Vdl93gxl3D9X1KOUSEifjRJg7xEpJzIIyAo9ahjHFnQdPIox03Z6YAHg8q9TVPLs
 H68dYMYcob8dCI4X8odMNaHLaNne1j7odNDyQrZuubNr9fAcoJedH/Wq+uTUFMI1rA04xoGeZef
 QMnIx1/ZUw8N6qS4nhA==
X-Proofpoint-GUID: 9xgdu9mRpohtqUJmYAGzFDKWkFPYy3DW
X-Authority-Analysis: v=2.4 cv=AofeGu9P c=1 sm=1 tr=0 ts=69dcc56d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=SXzkmgPmAAAA:8 a=VwQbUJbxAAAA:8 a=GlKLo3LhAl51aJ-GqygA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=EWLf6cg6Bh5aS0AxDgDu:22
X-Proofpoint-ORIG-GUID: 9xgdu9mRpohtqUJmYAGzFDKWkFPYy3DW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130103

On 4/12/26 2:41 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 10, 2026 at 10:55:53AM +0200, Konrad Dybcio wrote:
>> On 4/9/26 11:24 PM, Dmitry Baryshkov wrote:
>>> On Thu, Apr 09, 2026 at 10:38:15PM +0200, David Heidelberg wrote:
>>>> On 18/02/2026 16:59, Dmitry Baryshkov wrote:
>>>>> On Wed, Feb 18, 2026 at 03:28:01PM +0100, Konrad Dybcio wrote:
>>>>>>
>>>>>>
>>>>>> On 18-Feb-26 12:58, Dmitry Baryshkov wrote:
>>>>>>> On Wed, Feb 18, 2026 at 12:24:26PM +0100, Konrad Dybcio wrote:
>>>>>>>> On 2/18/26 12:18 PM, David Heidelberg wrote:
>>>>>>>>> On 18/02/2026 11:30, Konrad Dybcio wrote:
>>>>>>>>>> On 2/17/26 10:20 PM, Dmitry Baryshkov wrote:
>>>>>>>>>>> From: David Heidelberg <david@ixit.cz>
>>>>>>>>>>>
>>>>>>>>>>> If the OS does not support recovering the state left by the
>>>>>>>>>>> bootloader it needs a way to reset display hardware, so that it can
>>>>>>>>>>> start from a clean state. Add a reference to the relevant reset.
>>>>>>>>>>
>>>>>>>>>> This is not the relevant reset
>>>>>>>>>>
>>>>>>>>>> You want MDSS_CORE_BCR @ 0xaf0_2000
>>>>>>>>>
>>>>>>>>> Thanks, I prepared the fixes [1].
>>>>>>>>>
>>>>>>>>> I'll try to test it if it's not breaking anything for us and send as v2 of [2].
>>>>>>>>>
>>>>>>>>> David
>>>>>>>>>
>>>>>>>>> [1] https://codeberg.org/sdm845/linux/commits/branch/b4/mdss-reset
>>>>>>>>> [2] https://patchwork.kernel.org/project/linux-arm-msm/patch/20260112-mdss-reset-v1-1-af7c572204d3@ixit.cz/
>>>>>>>>
>>>>>>>> Please don't alter the contents of dt-bindings, it really doesn't matter
>>>>>>>> if on sdm845 it's reset0 or reset1, that's why we define them in the first
>>>>>>>> place
>>>>>>>
>>>>>>> I dpn't think that will pass. Current reset is defined as RSCC, we can't
>>>>>>> change that to CORE behind the scene. I'd prefer David's approach.
>>>>>>
>>>>>> Back when I replied, David had a patch that removed the current RSCC
>>>>>> reset definition in dt-bindings (at index 0) and re-used that index
>>>>>> for CORE, putting RSCC at index 1. Perhaps it's better to link to
>>>>>> specific commits when making comments, note to self :P
>>>>>
>>>>> Yes, I saw the commit having two resets. Anyway, as we saw, it doesn't
>>>>> work.
>>>>
>>>> So, finally I spent "so much effort" (read throwing it at LLM) looking at:
>>>>
>>>> arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
>>>> iova=0x9d4bb500, fsynr=0x170021, cbfrsynra=0xc88, cb=11
>>>> arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0xc88
>>>> arm-smmu 15000000.iommu: FSYNR0 = 00170021 [S1CBNDX=23 PNU PLVL=1]
>>>
>>> [...]
>>>
>>>>
>>>> These (or very similar warnings) are around sdm845 definitely 6.19+ /
>>>> linux-next kernels for some time, but pretty harmless.
>>>>
>>>> LLM suggested multiple fixes, but when presenting possibility of
>>>> implementing mdss reset it found it as most preferable [1].
>>>>
>>>> Adding MDSS reset would most likely solve it. It's not critical, but not
>>>> nice to see many red lines in the dmesg.
>>>>
>>>> Is there something I could experiment with to get closer to have proper MDSS reset?
>>>
>>> I don't have a sensible solution at this point. We tried using the MDSS
>>> reset on several SDM845 devices, but they just reset. So... I don't have
>>> any possible solution.
>>
>> The older context talks about altering the existing dt-bindings values
>> and now we're at hardware (mis)behaving? What is the issue here?
> 
> The HDK and DB845c reset if I try touching MDSS core reset.

And David, does that also happen on your other boards?

Konrad
