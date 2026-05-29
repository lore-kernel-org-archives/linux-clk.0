Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9513BA24F
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 09:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046611; cv=none; b=uGz39G6B2JUHxEM2KmscDJEvMCnH1MVXKw7zJqRcSeFRwhbn61j8y38HKUraXCXSS6NgLL5/B/jByGAU69O6fvi8taNhfogPPXgYUIIRDeXlZ2RdvIrRPJpPlPWcKUDaHR73K3nsyB6PezTg6WQWLcNlwJc8snN1OQmW5nke1vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046611; c=relaxed/simple;
	bh=yt9kofHtXymnCD3EaxDm9NSlVafZFb9BX3Ubc3k6d+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AZiyhwJXlN0YbRIEr1eTqh6bJPGLPQ7x5SM23KbLbXYpUrgVin/i6a/3gX6JAUkg9WDdhwPb42IBO8YwSueMQNPnnQPdS1z9sD53vqxd+sZh5KwdXnWt3t3E+4Pe9ndhx4i4hHf/FKMcfi3gMapOpqmJGwmpYstQLi9RfILRMQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=niPMPmoR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aE0ht9vv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="niPMPmoR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aE0ht9vv"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T5KNS81248198
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 09:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3zDoPS3x/Gc4pwXs4/RNUn0CZZ7DW6X64Lr58N9+UAc=; b=niPMPmoRauZBlTrv
	m8RfLSNlAgt7KOmoLDjYPPcT/w25mTt/xuN1Dfbvgj3lDJ8ayDRUpiwYU1BWjTxG
	vun7H9ateoEQNeJaxeiV5DR6SCKyr5HYUm2eZPLsfjFI6KCb1y0E8xJ0OMCxtreJ
	HhNbivdpJnvDNauPolteq+AzjNqDsC8jzD2CdOBDmByx2JrjH/zLprmfm10rLNqB
	ICbVDqr+9z0ptyQar8RZYs8+Psspol4CgU2ayJa3tylZ9ZhDFvGvbnKwnOQ/pf4Z
	NSa+CvenNiQqyfu3Jcn1U9DEttYgLpqe6amn4+khYDo9XxnGWDpZVUJb0Ecb430a
	lG9DOw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef4jj106p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 09:23:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-83cecc22d5fso7392208b3a.2
        for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 02:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780046606; x=1780651406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3zDoPS3x/Gc4pwXs4/RNUn0CZZ7DW6X64Lr58N9+UAc=;
        b=aE0ht9vvLWztZ8y0axGMIiyf+BR78iwR3CLv8tseCJ3f5Ma2jJwo4DzDcagNz1Wpap
         b6RoJBeZLH4sOY68rSvFftnXXlJwYfR7vk3JqR+lBjcV8T/5hqdl+5SlIpCaR6EsBb45
         mEYjVTjLeXG0r51TasJgJv0UIv1RxdpUDqtW3ONIZFHoVrYbKledbD+XiIDnSxFA4yM9
         AmdpbPZt1BS+DrE79O1ZR6pi55ZuoAFrgy13ees/ULxXYA+g+XSCAzPiYde6TLB7SRNA
         TRqk7vu/9+WwIbAuCKchRzFud4WEPzsPFfLyu3q0ekSV+3IgtUL80xFPkiqG245cLq0e
         x17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046606; x=1780651406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3zDoPS3x/Gc4pwXs4/RNUn0CZZ7DW6X64Lr58N9+UAc=;
        b=Z1V8BbhqhpnDFqxJYHHa0zO5HcN7GP50Z1wQYBchOq9kA9J5ipEndz5haCGcOicGx7
         Bp15+9Hd3eLi9uAMG1Go63qX26rjback0EtQP34hLw7Xm2AA91E9UwV6uZyn7nOQpLg0
         R7MNpoyKMvxL9nr1/IJeuMmrXz3pmFi5uWk6DuZRKobRmeQKYNZ46up/MGHWHWzHIBsg
         EhCk5pTf1/hp/8QDFmdGY3MCZ3dUmKXkTtGatOg5av+SXwCMH5S1fZYczYKCdj6QI1Bq
         1bJCFtcka7fGSHEfSKuzSJTyMXgPsXvvnoJVNpkERCo2j3iEQd3IGwPKMvLzWohAR90f
         AQFw==
X-Forwarded-Encrypted: i=1; AFNElJ9Eoy0iu5dejnUbljJFJhlh87KQOr5tjMsuqUoadyY87x+Fri1xMLtp6j3nYkT3K116FZYQ3pDufAA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy9ZO3Ms5xtd/rxO96IJSktngeLtz2KsSdtXyZMjjGIvFSpkCh
	alR7C0EXBStQ27fHieNpCkjwK1ZunWSMehMNgRURWBfegikXzv4EudehKQ7BSKm3gnAprOWeL4d
	KdIiQiCMDitiEpzGtE5wcIaSDtXSNqSA0ke5g4RJtHCYySwD/1QXEA2oGGt4ziME=
X-Gm-Gg: Acq92OGxKyQR+mpiq17vetdj2UDuP54p5Aybc29Onukew0Yy6MhENi0CIWTRSFf6VXo
	x/cqJRGBndGqkHFwsP/banZP3s9HpYXauucr+s6E9z71fRKLO9JgnUB11TKlYEFQVoSNfLVDFfy
	3R01xqZbCzuclvmao/DmgAtUlfoMHAu6PkgBf5cUJt19EtHCCtX7XZe7qrr3YL7rYBOOV0WpZEP
	LJeDWDpMG9sjz495LqXQXmUWZeL+ySglwM/1x61Wtwj+7Kb06kVvTUEJvjSoi/7QR0DjVo8HmRw
	7IQu1LGVFtZYmT29mMbWwOGeWgUdeNIV02iLsTeFEXsBVJ1sBKqnlIJ+FmX8nCUZ7odUQVezNnk
	fk895NhamakHY+gZu75SR+hvwgPGoBCLhKZVsFIQkVLDM1hKWxv8EAb00soYRJw==
X-Received: by 2002:a05:6a00:1742:b0:81f:9b4c:81c0 with SMTP id d2e1a72fcca58-84212d2ca6cmr2156395b3a.41.1780046606405;
        Fri, 29 May 2026 02:23:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:1742:b0:81f:9b4c:81c0 with SMTP id d2e1a72fcca58-84212d2ca6cmr2156359b3a.41.1780046605769;
        Fri, 29 May 2026 02:23:25 -0700 (PDT)
Received: from [192.168.1.2] ([117.192.250.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214affe29sm1240298b3a.3.2026.05.29.02.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:23:25 -0700 (PDT)
Message-ID: <8b911846-1001-4c20-908d-1384cc81e30b@oss.qualcomm.com>
Date: Fri, 29 May 2026 14:52:39 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] clk: qcom: gcc-qcm2290: Drop modelling of critical
 clocks
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
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-1-953f246a0fbb@oss.qualcomm.com>
 <ro6xcalsh5vwsyxi4jyyk4iebmg2p626aqw5zobbfjj5noui6r@hsjyhdko2aca>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <ro6xcalsh5vwsyxi4jyyk4iebmg2p626aqw5zobbfjj5noui6r@hsjyhdko2aca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA5MiBTYWx0ZWRfX8I6Bn2XJWXJP
 fZx///20YirANKvj1COkIxVcIIHrkLgVM0SD4QHmzOJ2nZCqIGwWX6Rm4PHrOoJRWGiuBWKOhEp
 YmCHDMLviDGcEWEwTyPLlV6nUYk7SvlFt5tDC0liI3w95zMRpyzfZyKEM6l174CNIvlD11JcxHK
 TjlRAAcGYcYZfS03LXkkAgg55ipTn5bC3kciE0BVNpmcqpMq2eZdNlB9HzRBIslbdXyfte54oWg
 BfoE258p3VyxRFvwVbP6EK/GiWSPd11AeruGcHjO0j+pohgQ3kbmR0pcbf2nWae6ybY/nP3UOX/
 jtDHteHZe7kwoSMiHv384MPtizzgzlrf+xXZeEBai54sPKph3LzvEaFC11rAfaV8X/4D3NNJLII
 EqlJkAb4y/2bv9GjMrJzDeNIYQz9gx+UB2oBRQc5SKOvnA3v2FYa1BVDXqdy595O23Vlv3McJcb
 YIFFlt8BE26NNWvgdyw==
X-Proofpoint-ORIG-GUID: _fSx7vfKjWTcMal7xVfdd7BFU4e5SyTW
X-Authority-Analysis: v=2.4 cv=Tt7WQjXh c=1 sm=1 tr=0 ts=6a195b0f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=MYhr4v4WboA43l5+MyccHQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=RHQwGL2yU_3FcdO5I0oA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: _fSx7vfKjWTcMal7xVfdd7BFU4e5SyTW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290092



On 28-05-2026 06:52 pm, Dmitry Baryshkov wrote:
> On Thu, May 28, 2026 at 03:37:02PM +0530, Imran Shaik wrote:
>> Drop the modelling of critical GCC clocks on QCM2290 SoC, and keep them
>> enabled from probe as per the latest convention. This helps to drop the
>> pm_clk handling in QCM2290 GPUCC driver, and the same can be re-used for
>> Shikra SoC.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/gcc-qcm2290.c | 153 +++--------------------------------------
>>   1 file changed, 11 insertions(+), 142 deletions(-)
>>
>> @@ -2012,19 +1936,6 @@ static struct clk_branch gcc_gpu_gpll0_div_clk_src = {
>>   	},
>>   };
>>   
>> -static struct clk_branch gcc_gpu_iref_clk = {
>> -	.halt_reg = 0x36100,
>> -	.halt_check = BRANCH_HALT_DELAY,
>> -	.clkr = {
>> -		.enable_reg = 0x36100,
>> -		.enable_mask = BIT(0),
>> -		.hw.init = &(struct clk_init_data){
>> -			.name = "gcc_gpu_iref_clk",
>> -			.ops = &clk_branch2_ops,
>> -		},
>> -	},
>> -};
> 
> This clock is not critical. Why is it being dropped?
> 
>> -
>>   static struct clk_branch gcc_gpu_memnoc_gfx_clk = {
>>   	.halt_reg = 0x3600c,
>>   	.halt_check = BRANCH_VOTED,
>> @@ -2605,21 +2500,6 @@ static struct clk_branch gcc_venus_ctl_axi_clk = {
>>   	},
>>   };
>>   
>> -static struct clk_branch gcc_video_ahb_clk = {
>> -	.halt_reg = 0x17004,
>> -	.halt_check = BRANCH_HALT,
>> -	.hwcg_reg = 0x17004,
>> -	.hwcg_bit = 1,
>> -	.clkr = {
>> -		.enable_reg = 0x17004,
>> -		.enable_mask = BIT(0),
>> -		.hw.init = &(struct clk_init_data){
>> -			.name = "gcc_video_ahb_clk",
>> -			.ops = &clk_branch2_ops,
> 
> This clock isn't marked as CRITICAL, why is it being dropped?
> 
>> -		},
>> -	},
>> -};
>> -
>>   static struct clk_branch gcc_video_axi0_clk = {
>>   	.halt_reg = 0x1701c,
>>   	.halt_check = BRANCH_HALT,
>> @@ -2686,19 +2566,6 @@ static struct clk_branch gcc_video_venus_ctl_clk = {
>>   	},
>>   };
>>   
>> -static struct clk_branch gcc_video_xo_clk = {
>> -	.halt_reg = 0x17024,
>> -	.halt_check = BRANCH_HALT,
>> -	.clkr = {
>> -		.enable_reg = 0x17024,
>> -		.enable_mask = BIT(0),
>> -		.hw.init = &(struct clk_init_data){
>> -			.name = "gcc_video_xo_clk",
>> -			.ops = &clk_branch2_ops,
> 
> This clock isn't marked as CRITICAL, why is it being dropped?
> 

The above clocks also should have been marked as CRITICAL. Not sure why 
those are not marked in the QCM2290. Since we are updating the critical 
clock set, moving all the required clocks to the critical list in line 
with the latest conventions.

>> -		},
>> -	},
>> -};
>> -
>>   static struct gdsc gcc_camss_top_gdsc = {
>>   	.gdscr = 0x58004,
>>   	.pd = {
>> @@ -2990,6 +2848,17 @@ static int gcc_qcm2290_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		return ret;
>>   
>> +	/* Keep some clocks always-on */
>> +	qcom_branch_set_clk_en(regmap, 0x17008); /* GCC_CAMERA_AHB_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x17028); /* GCC_CAMERA_XO_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x1700c); /* GCC_DISP_AHB_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x1702c); /* GCC_DISP_XO_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x36004); /* GCC_GPU_CFG_AHB_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x36100); /* GCC_GPU_IREF_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x79004); /* GCC_SYS_NOC_CPUSS_AHB_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x17004); /* GCC_VIDEO_AHB_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x17024); /* GCC_VIDEO_XO_CLK */
> 
> If you are chancing the driver, why are you not using .clk_cbcrs?
> 

Sure, will add these to .clk_cbcrs in next series.

Thanks,
Imran

>> +
>>   	clk_alpha_pll_configure(&gpll10, regmap, &gpll10_config);
>>   	clk_alpha_pll_configure(&gpll11, regmap, &gpll11_config);
>>   	clk_alpha_pll_configure(&gpll8, regmap, &gpll8_config);
>>
>> -- 
>> 2.34.1
>>
> 

