Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AE03BF694
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 09:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046640; cv=none; b=NgIuZs2DAHRNsvEV4dMs2Gnqv+RF4ua5DUFoyA+7ZLEu4OzE39YEi8MQA5ArrUD3r205pJJMK29ORw9e/72A3CZn9XTcnghz+N/Rtpv4/6U/eEp38hjerr3VWnw9w3bCspYLfhnSRUS1n+mxaBLA21VWkqCfAyIOvjjaynbxiJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046640; c=relaxed/simple;
	bh=7WwBKS1M/wBUf4arKHMkA5omOSnWFfX2YFWcPtGUqkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=khHDdiQwc4QwSzePi4dITEFPgj5IICOyYmwJP1PGug4MfI1wBxke3mRhGBLtXPftocAHccV0+YSzOxa0mVhOg6P+3IdASpW6+UxsfwuHPxRuwTw4d6OS4pjXxk6fsJY0ONmu4i5oy7QnJ+2DJ6eVrB7FuDyHsL+faXzbUTPf9Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HBmZbytB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VW5SAnLX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HBmZbytB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VW5SAnLX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6Rgq73252762
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 09:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4lpeQPgTrvIhavHW0wtw/TbA0KBZFSR5xGJTjRObwYk=; b=HBmZbytBWouh+G3M
	kfq81FvTag64vH5+gVxDqV2kO1C+0H8gqFmDj1puKQV2JZ3JGLoZcct4iijKZvrX
	IolpGUXnBNausQDraXQbhrVjinGE9wgiPtsSC6MDvO/KUFu3em5qLi9+iug+uK62
	nZ3TCpdzqGe/rTen0M1e+l2Z4FpVi74itdMpkyLqGQbXDLVklYfxQjV2YjhsSTUl
	pOSgjTy7HXk3jh2WM/Lrwf7qZlztH1wmE61Dw627D4pEVfGthy0eEqnPydZjbiba
	L91Vb9McL78SPFNqJ207ftoEQ16YmRnqaOebWffNEkcATCTLznQ7fPM2SoKpixke
	s7PiXg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eespn3r2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 09:23:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36ba24fcd46so1037708a91.3
        for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 02:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780046633; x=1780651433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4lpeQPgTrvIhavHW0wtw/TbA0KBZFSR5xGJTjRObwYk=;
        b=VW5SAnLXa5jgCUttO6/J9ocQgTM81r2OBecDnxWFBVVG6URWUPNBiHEW/iv2b6K7zp
         AxjNzmbL/a9dpq8bJbK7PQXSu2h7KcPtP+JHH0Do4tj7EsweyNGJ9RR+nvK78eslW6g9
         kTcg4wnrazUz8LNEiM+fIFVhU+jY3cSZYffKn4rosPtFfFkkWPhKACWRgo6XHCTAk2mn
         BJTRTKUoWWtVhljcC6TKW5faIe07Fu+OLSi/NyGN2XbUQ0LsRfgZoPFNBpkwmpQBGePV
         zz7nNag3QgTMWnlu7kAHMj2/fiYdPFuiwy0DeVbx8m/4DD5M/NEy497xIihuYDVEgkul
         3d/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046633; x=1780651433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4lpeQPgTrvIhavHW0wtw/TbA0KBZFSR5xGJTjRObwYk=;
        b=ic48pQWuMGB1TyGs2rwNO0eIBcQyVBbun7DgvajrH9kJFTrnGAF6RU3Kef9ovypMed
         Npa8xZ+TUyoAOZzR1qT2uwiPNJrTr4et+e3S19bWP2yHkui+ZKz2asSwzmAYXpwGfCIT
         pXdSZQ0hQoU6EOHsGb47AkmOR7SgP4WqFLdrLOUBM20SEwCFWLw+gJ2eYmByTzMfpKzz
         8TI2/7FoJnIDBjkh2lob7TCU43eFqrl6IVaPobC+QMhDAMYXpexVrh4zyfh5MoICdMeJ
         DDyVnlZM+wZ5jrigA2htHR4xFLrlf7zncbl0SrcgOc6tmq1vVR7jdd3lxLybG72L/R46
         Jxjg==
X-Forwarded-Encrypted: i=1; AFNElJ9JJA+GMGxmMyY4h+pX5E+9ws9zYLSwj/+g3UOVbrWATE6oNBeeCTXN6LppGrEpOsAn55g8pasuKQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQZsQ0lPdTYYXdW7gx74LpAqW6E4Vbm5vpZv3+LtGQ3bAiA/m7
	FucgkBnkVN+M52YyQFfTpCnUV9Cu8b800DdIRP59QGpNiDP4yCQrM5kevsHQD+0I+IutBRFXp9G
	ibQfiqvKeCzDxlBORSEBEUYBmO/TO04GeenOscDVpmMKb4iZhzUKxU7MXu9ifY2c=
X-Gm-Gg: Acq92OG1IXElrgnlvBw/LABj9D3jl30LaHqifN8kXUKtGckoNXrJh5R3CPQDRuUVFhH
	e11VKJOc8yPwXyZu1REnRVghS6yymrmMtcH6xRje6qJTCdtXLSHUYEytoXs2bdupJ8p0NmcyqOT
	HWG/YKiHiE3yJjMx7Dj7Hg3edjJ+qi8rTMFwclnl0BLidwT7E+tTDroE82We9LJfMvodWpdPE+N
	erJ/iAdbqpugBd83PMtbP3RmTlxF1+ORcSH3vt0glZ32KFLJd4xA/yd1Xxvb83dLSRjtKE1JU6m
	YV6lkXsrK9dDZqLK777Cwp5VL7UQoKn/NR8tAYiZ6Zz90Wh46D66/4ZDrN5Er1OLcl0/TJMRC6+
	wr4BrWpd2I7+H7GO0iyIR8NdTvDR+GpvKZ+Z5SG8H4hu5S3cZC1Y+MiJ39+Kljw==
X-Received: by 2002:a17:902:cf03:b0:2bf:25a4:b6d8 with SMTP id d9443c01a7336-2bf25a4b7c9mr14838405ad.10.1780046633401;
        Fri, 29 May 2026 02:23:53 -0700 (PDT)
X-Received: by 2002:a17:902:cf03:b0:2bf:25a4:b6d8 with SMTP id d9443c01a7336-2bf25a4b7c9mr14838075ad.10.1780046632888;
        Fri, 29 May 2026 02:23:52 -0700 (PDT)
Received: from [192.168.1.2] ([117.192.250.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c5c772sm11927515ad.84.2026.05.29.02.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:23:52 -0700 (PDT)
Message-ID: <937bc3b3-bd38-4df4-bee9-c68e83de3ff6@oss.qualcomm.com>
Date: Fri, 29 May 2026 14:53:45 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] clk: qcom: dispcc-qcm2290: Add support for
 Qualcomm Shikra DISPCC
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
 <20260528-shikra-dispcc-gpucc-v2-4-953f246a0fbb@oss.qualcomm.com>
 <qumelrcom3wxzgcibou6vmw2jc5tushr4z2tvmudflgpiqin7w@raf436u5gksb>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <qumelrcom3wxzgcibou6vmw2jc5tushr4z2tvmudflgpiqin7w@raf436u5gksb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cyB3K00MEbv1uX4gvqfn9mr_R6-MjwD1
X-Proofpoint-ORIG-GUID: cyB3K00MEbv1uX4gvqfn9mr_R6-MjwD1
X-Authority-Analysis: v=2.4 cv=auOCzyZV c=1 sm=1 tr=0 ts=6a195b2a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=MYhr4v4WboA43l5+MyccHQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=M2yKb8xwfWg0M4Fo7NUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA5MiBTYWx0ZWRfX3vSAG1nUh3Rf
 2dp6gNWV2HVQ9NjZ7EtP6URSjvdPnnnqncuFhAnVBwmRCLjzrFuckGov5D4Vl/lhtDpkDSTxdMp
 nhy8/c5Kriq66JZkvXseN4Bgtvon6/1hQ82hxbHnPA04YfUvUooIpEaLOelm67+4v9zW34HBx3u
 5fD0wikMDrF0hzu8DNFyJDMVgVJUmclvj5i4JRq+7nM0p6CxL1CGhbo7t2DHBVMObzeRbQraQdj
 b3EPGwIksdjQQGmkl9m6apeBsif8pY4aU1Le+e4qh1cqv/7nl7CMb0QYi34tonh3RQ98eO66l+E
 K4dpwEa1EvM+rDUOgoXQF0y644TLQAWvbT1wmyhUDMLKgB87L0teVHfXA5GU5P+VDm1gw825xP3
 CXsmJ0sZrYbT8cFWVvWYgTkeEEMkmvY/mfYXoyr6BPVCtYjAqPBlp58xafUShgVSsUOOWgvgV9R
 1ByTxE+ydTGhywpSbqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290092



On 28-05-2026 07:12 pm, Dmitry Baryshkov wrote:
> On Thu, May 28, 2026 at 03:37:05PM +0530, Imran Shaik wrote:
>> The Qualcomm Shikra Display clock controller reuses the QCM2290 DISPCC,
>> but has minor differences. Update the parent data of mdss ahb/mdp clocks
>> accordingly to the hardware clock plan and correct the GDSC *_wait_val and
>> flags which are applicable for both QCM2290 and Shikra SoC, and add the
>> support for DSI1 PHY source.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/dispcc-qcm2290.c | 18 +++++++++++++-----
>>   1 file changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
>> index 6d88d067337fa132114b0d8666931b449f86de17..19c997f3fe9f197d2c252a9dd1e8169947200f5f 100644
>> --- a/drivers/clk/qcom/dispcc-qcm2290.c
>> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
>> @@ -2,6 +2,7 @@
>>   /*
>>    * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>>    * Copyright (c) 2021, Linaro Ltd.
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>    */
>>   
>>   #include <linux/clk-provider.h>
>> @@ -32,6 +33,8 @@ enum {
>>   	P_GPLL0_OUT_DIV,
>>   	P_GPLL0_OUT_MAIN,
>>   	P_SLEEP_CLK,
>> +	P_DSI1_PHY_PLL_OUT_BYTECLK,
>> +	P_DSI1_PHY_PLL_OUT_DSICLK,
>>   };
>>   
>>   static const struct pll_vco spark_vco[] = {
>> @@ -84,7 +87,7 @@ static const struct clk_parent_data disp_cc_parent_data_1[] = {
>>   
>>   static const struct parent_map disp_cc_parent_map_2[] = {
>>   	{ P_BI_TCXO_AO, 0 },
>> -	{ P_GPLL0_OUT_DIV, 4 },
>> +	{ P_GPLL0_OUT_MAIN, 4 },
> 
> Why?
> 
>>   };
>>   
>>   static const struct clk_parent_data disp_cc_parent_data_2[] = {
>> @@ -101,17 +104,19 @@ static const struct parent_map disp_cc_parent_map_3[] = {
>>   static const struct clk_parent_data disp_cc_parent_data_3[] = {
>>   	{ .fw_name = "bi_tcxo" },
>>   	{ .hw = &disp_cc_pll0.clkr.hw },
>> -	{ .fw_name = "gcc_disp_gpll0_clk_src" },
>> +	{ .fw_name = "gcc_disp_gpll0_div_clk_src" },
> 
> Do you realize that this is an undocumented ABI chance?
> 
>>   };
>>   
>>   static const struct parent_map disp_cc_parent_map_4[] = {
>>   	{ P_BI_TCXO, 0 },
>>   	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
>> +	{ P_DSI1_PHY_PLL_OUT_DSICLK, 2 },
>>   };
>>   
>>   static const struct clk_parent_data disp_cc_parent_data_4[] = {
>>   	{ .fw_name = "bi_tcxo" },
>>   	{ .fw_name = "dsi0_phy_pll_out_dsiclk" },
>> +	{ .fw_name = "dsi1_phy_pll_out_dsiclk" },
>>   };
>>   
>>   static const struct parent_map disp_cc_parent_map_5[] = {
>> @@ -153,8 +158,8 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
>>   
>>   static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
>>   	F(19200000, P_BI_TCXO_AO, 1, 0, 0),
>> -	F(37500000, P_GPLL0_OUT_DIV, 8, 0, 0),
>> -	F(75000000, P_GPLL0_OUT_DIV, 4, 0, 0),
>> +	F(37500000, P_GPLL0_OUT_MAIN, 8, 0, 0),
>> +	F(75000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
> 
> Why? It's not mentioned in the commit message.
> 

As per the HW clock plan, the ahb(parent_*_2)/mdp(parent_*_3) clock RCG 
parent must be GPLL0_OUT_MAIN (gcc_disp_gpll0_div_clk_src). Updated them 
accordingly and mentioned the same in the commit text below:

"Update the parent data of mdss ahb/mdp clocks accordingly to the 
hardware clock plan"

Will move these to indices approach, and add in a separate commit as you 
mentioned in the other patch comment.

>>   	{ }
>>   };
>>   
>> @@ -450,11 +455,14 @@ static const struct qcom_reset_map disp_cc_qcm2290_resets[] = {
>>   
>>   static struct gdsc mdss_gdsc = {
>>   	.gdscr = 0x3000,
>> +	.en_rest_wait_val = 0x2,
>> +	.en_few_wait_val = 0x2,
>> +	.clk_dis_wait_val = 0xf,
>>   	.pd = {
>>   		.name = "mdss_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> -	.flags = HW_CTRL,
>> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> 
> And this also needs explanation.
> 

Sure, will add these GDSC fixes in separate commit in next series.

Thanks,
Imran

>>   };
> 

