Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954C239B4BB
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 11:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509594; cv=none; b=BXlDyVB9/ASJuC/6n9s/+3k8LDmJilu/saqtiFFS1RDvYIOgk8VY/F/sJpWuh0dnwtnu97yGrWFpjr59gl1OdzoNZfMz6enTvkCnFgHppWrxCrQO9F1iYJ5quUMYXzRP1m02j9lQJP+w+yGi7gn2HgsReS0oKOWKjEni9GDXMYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509594; c=relaxed/simple;
	bh=r/sZhonGWHV/OHpXFFvuNCqs54uSF0jXIm4ELTvu/1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oW5OfR+POHyUKKsLr6zOn7MH6Wy7LMDVKNeFwJLnKkBqA/96eUeNdTvUbze91kJ0ktAALBDLu4VDqT/8PEdU9UToQQSjXZnGm24nCDXkbUmnagiSEMStMiP8z5g+LhQCAg8Lpv2TZ+wpFKYjnHbPleWshP8DSYLvSmLowQoXQCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NzyVrtth; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GNjBDBtR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzyVrtth";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GNjBDBtR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6688973b2258483
	for <linux-clk@vger.kernel.org>; Wed, 8 Jul 2026 11:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jXHpkWaDOa2HwVkvOauKBx6LUJNK4axtkDnUUzFrBws=; b=NzyVrtthERY8C6/4
	g8eosxowzO7/aH4DYu07cNpjN9ZTLMZhwUtgAz8vkNBLutc+5sFxoRVey4omQe4I
	OXLPojkDmPW588QoEVf9GgYTzQfq3ZX6Ou3ujWo5fIx38Nf6WcaetygHEJnqN+aP
	MdQ6fGUqQ3ejiQWSVLNwS/wx6fQztmLTWwWKjQwirKS8Ik4dFYE6oMjYPhCgbgII
	+r/O3mISp8E4oFB935RQ+RrGb+3OVz2GPDuNfpHcvYxUsoCzyQxJzoRri0a7/TRn
	XbQfhsNkFz6lcnaE0db+c7Z7sMjMUs5kxwL60HQT56Yo5AiOKly/HMnBfOlAupXy
	cekXGg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9cswa4dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 11:19:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so926572a91.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 04:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783509590; x=1784114390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jXHpkWaDOa2HwVkvOauKBx6LUJNK4axtkDnUUzFrBws=;
        b=GNjBDBtRLwAuO+CdOR7jWfettfGny1qdUaR5xZR/64c6BcYWa7XJC3nVGv0w8I/OU1
         DkgN3jgnbDKyNgUkjZL74slJR5t4ddz1PkfE/oReYV4jPxp8e9lnrjOFLJGjDvLUHNQu
         EvXbLgTkB8jj30aL1zJijKh/6F+5NbSzSvIgq1fCcAmkOcBSHgwEEeb+gLMRY5Bn7Pm8
         J+rtycYS5BzFXyaf3LZov9ucITizQg3bGBqNE2/Z0C8gzC/Clufqku3yoi/J5Bt1Mzx0
         wEwKx1lYtBvpxtUAXibx9kmNJQ6599Pz5l7hAAaBVKQHkXsc15067mStLoznZYgSKZoC
         Reug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509590; x=1784114390;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXHpkWaDOa2HwVkvOauKBx6LUJNK4axtkDnUUzFrBws=;
        b=dD5jcZSbnZpmlZggGd8B6CMsgpSkRWBkIjLI5Zo922ITL41f3hCbGfOQG1YVKh8vBV
         0QNWP7LEApembuHjSYElfLVdufdxSlKBHFz850HPXe2ZGYi5vi+romO5NDQzeJAUCKnW
         It/YQJ3tPd1EfhHZUjJLMLPSuHp392KA0DuSOIkDs4wx92T9CoF3NxNrjJ53mDtsKjJ5
         9hkLIoRwy8XQaDW/2MVWSVuK/nzx/CzX3HSMS7resvTIITZtL7H9cz6XvxxE/26p94og
         JoOdt+s40JomjolyoGZuML+BqZnK/pBeQoFUJ/3hBjdaEFgfJSvErM2WdVg5/tbm8i4o
         c5QA==
X-Forwarded-Encrypted: i=1; AHgh+Rog33psX3vkYiTnEAsMZ8np7kReyPneW1uwU+i+h3/zOI57OTSKBuAxuzUjPFMawfGUnNR1gGZSLDw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZJlPiwM1LkJNGem1DELO4C6QSZgz5kxEvrrYuib9UowitmXUo
	/84uCgGdV86lPGCBxRf3oQhepvrYf1DpYrjMWh/ZBv3sQ4W4cBe1v5JaVOW0er2tSASPtkuaer0
	3EQaUsDe86nDDA4cc53UAjVC9Fg0GQNm86vi092Gc0bDCfBXZSSAYXAwf6n5s9ZM=
X-Gm-Gg: AfdE7cm4l9BwVdU2H05L3PPWeio+s0cJA+wRhx81UblHxgRoImCipg3SjlmOZeIzuKW
	Pkke/9MyrCBZHbJqwCfwXg0jra60fsYGaDL801CpF9RzNJIf1M/MmnWmpT9x0XZdBXFY5Wf55J3
	8w1gUNZgxCx1iX9oT6CidMMu2xJ+hn3eLr4rOdLJAB1g3veofOdFTUxjy2Wipipk+TNGL+jIlpX
	3J/WpmY7wx/4oujXOx4l0KgSnSFDi9Eun0LwJwruCTmo4RJF5fnGoRgj421Jhio7rwYoPpsT/YZ
	wWdcKib2c2EcugNwjR4hlg3ZVoqsPZQ9uD4CPjgdQm7R2yDn+v8tGe8pn7A2Xm5JjlmJRREtoyp
	fMuyyxfHD8m6snR5hnU+kG/q1oeLWgtavm4nvxDU=
X-Received: by 2002:a17:90b:258f:b0:37f:bfcf:fdfb with SMTP id 98e67ed59e1d1-3892db5376emr1958264a91.8.1783509590027;
        Wed, 08 Jul 2026 04:19:50 -0700 (PDT)
X-Received: by 2002:a17:90b:258f:b0:37f:bfcf:fdfb with SMTP id 98e67ed59e1d1-3892db5376emr1958242a91.8.1783509589584;
        Wed, 08 Jul 2026 04:19:49 -0700 (PDT)
Received: from [10.92.199.168] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d2585f34sm2632880a91.17.2026.07.08.04.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:19:49 -0700 (PDT)
Message-ID: <87c50f60-23d5-4987-a521-347614b2f596@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 16:49:42 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/19] clk: qcom: qcm2290: Set POLL_CFG_GDSCR flag for
 DISPCC and GPUCC GDSCs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-9-cc13826d4d5a@oss.qualcomm.com>
 <e3s42sg5lxb6e54dbd5wyvdgtcakolt5assoa4ukqtgkgus366@4uzp27sftrkm>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <e3s42sg5lxb6e54dbd5wyvdgtcakolt5assoa4ukqtgkgus366@4uzp27sftrkm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: r2TDuWmoYIrgnDPFBn0rw-5amfKmIoLO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX2kBiRdH5r77/
 jWFQohAyFrs3vUd/3DKcZcLojPWB9lmd/EOHAPFmzo2YyueXE38xsfd+bpxapGJAD74gaMNDwx4
 JF/6XkTGo1znzvxqA5aLOlCz9ub+cpc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfXzLvjWv5o/Wze
 J2Wl1zWsJ58MvWgKk4vgrj5d7WiqjSNkTKRiK6MfWlf9ne8mIfqce7CEnwR8fTvKsGAx1BOz/o9
 A/m5oIxdrxPznMaO4RjmYFcxrL5C/9LdVistHXetBbODD7rGxOGWmsCcge86l3xISA0OfMc4/d7
 RdSwOpU6XmhSvOIWuIkv1ZIk4MZ3ULFCRbxCcvCIHIsPHNPe/R/6ULLMI9sxW1fn8zxiMkxT9rM
 x8ZF7UJSxWYX00YEMy/z89inhHjZVkD8mZnuvWt8961QV0eHhPHodGZ2yGHfKjtrUxanj/zuuLh
 pHx8pL1CqeLHEqmiFta7AyQ3lYm/NmL2kDNnlKkR44ShDFwH4NqovXcXbRmv8hi4MktPdNVMNl7
 7QB1rofKon6CZ4OAyvffor4GVRVb/oT8HQ33Svjlqa+yBn72IdwY3y+0WZ1KUWWVJiHL8ExG0zQ
 Dg7FU4GiTk3QKFN8zog==
X-Authority-Analysis: v=2.4 cv=HaYkiCE8 c=1 sm=1 tr=0 ts=6a4e3256 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Nhb7zu4WCAlJpChbyQcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: r2TDuWmoYIrgnDPFBn0rw-5amfKmIoLO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080110



On 04-07-2026 05:48 am, Dmitry Baryshkov wrote:
> On Fri, Jul 03, 2026 at 12:01:31AM +0530, Imran Shaik wrote:
>> On some targets, the GDSCR status bit may not reflect the actual state of
> 
> Which targets? This is all about Agatti.
> 

This is applicable to the latest targets. I will update the commit text 
here to mention Agatti specifically.

Thanks,
Imran

>> the GDSC, instead the power on/off bits in CFG_GDSCR must be polled to
>> determine the GDSC state correctly. Set POLL_CFG_GDSCR flag for the QCM2290
>> MDSS GDSC and GPUCC GX GDSC to ensure the correct GDSC status. This is not
>> applicable for GPUCC CX GDSC, which relies on gds_hw_ctrl status.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
>>   drivers/clk/qcom/gpucc-qcm2290.c  | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
>> index 89a6cdd26217381cd44a515766363cf94d0aaeeb..6ee074555099ab72106cfae7c21adbd1b4a0fdac 100644
>> --- a/drivers/clk/qcom/dispcc-qcm2290.c
>> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
>> @@ -467,7 +467,7 @@ static struct gdsc mdss_gdsc = {
>>   		.name = "mdss_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> -	.flags = HW_CTRL_TRIGGER,
>> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>>   };
>>   
>>   static struct gdsc *disp_cc_qcm2290_gdscs[] = {
>> diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
>> index 66dea9d2a0e519dfc64d977ef107b5c875da3869..3b130f69bb93898ce49654f2366851a7c1c94524 100644
>> --- a/drivers/clk/qcom/gpucc-qcm2290.c
>> +++ b/drivers/clk/qcom/gpucc-qcm2290.c
>> @@ -313,7 +313,7 @@ static struct gdsc gpu_gx_gdsc = {
>>   	},
>>   	.parent = &gpu_cx_gdsc.pd,
>>   	.pwrsts = PWRSTS_OFF_ON,
>> -	.flags = CLAMP_IO | AON_RESET | SW_RESET,
>> +	.flags = POLL_CFG_GDSCR | CLAMP_IO | AON_RESET | SW_RESET,
>>   };
>>   
>>   static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {
>>
>> -- 
>> 2.34.1
>>
> 

