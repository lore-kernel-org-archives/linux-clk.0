Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9E1139579
	for <linux-clk@vger.kernel.org>; Thu,  4 Dec 2025 06:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764831115; cv=none; b=WnoOAqMEYrBA/PxejTpXynkPFBmtWLzzWQ94UcF8rPGGk69CXkTt76GLV1zc2x3IdiVfCbkyYaVW6VxQ3V9KMK38kSKCW09pn5CYlgpA45U7dKSpU9UuXRD01zRiV4KQnSRzzlxoOptqFfLmCEmt3OXxBJR61u4ujkdxOwxwxy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764831115; c=relaxed/simple;
	bh=KT2QYR2wXHJ2g64QXkiAxDnQTrNBOsJcBtPqzT2t4EU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T1cxjo5UUYfGWTIXvchFuQ/3REqSCzA1ghNemprLAm9tDZM9XrlHrw69I3lBEZJyuiT71UQVrhUnha01fqD8UOIMnzstCFgPDxNlqY2gvi+PJba6mcXTM3KMD2cTJsWXcu4dfkvVNCgFh9Yto+KPCYgJ6y2A7txgZ/RobjxZsW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F8kdsRl5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fZj7Y/Ak; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F8kdsRl5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fZj7Y/Ak"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B468kB9512164
	for <linux-clk@vger.kernel.org>; Thu, 4 Dec 2025 06:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SwIvTqC0vtcEcT4pWezqNiZK3gnYXhecWCg8UTidylM=; b=F8kdsRl5LEWN6Tn1
	5FHZaLrLxQxo6Ra1PVUCwutZw95KlEYi7QFYpdKATUS2mFCN4XjCHExVsRsnEb44
	JC+qVhYS/ltNcipCo0tQwqtYXCRp6tmmJlX6IIQ8kuAUl9Sjfm58JFlcubu6EgzZ
	w9yovQTDhluuYULnJAkhHXIgwKct8Im6KmyCRfHS46zLONINXS+CCReEGa4tlz8u
	6vvdPDaWaFvOfBXArh7m2ZqQmqn4tHMjUmKgjDW0i7n1z+wpcnXkwRrYzCW5bixI
	b+i48exmM7ddaX3CnAPIldhqGYxsCD3Qesban++Vq9HMGzJcdgKfAJoFGk/IH7bL
	HNjuog==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atrppj970-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 04 Dec 2025 06:51:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297f48e81b8so10089725ad.0
        for <linux-clk@vger.kernel.org>; Wed, 03 Dec 2025 22:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764831113; x=1765435913; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SwIvTqC0vtcEcT4pWezqNiZK3gnYXhecWCg8UTidylM=;
        b=fZj7Y/Ak96pqEEPk00NzlcMs6BSUJCryfLrb4BHhorAuZuzF0cBSHY57FqujQWSxRi
         hN8ifA1f/n+jgdiu27991I98jqP7bYknReUa9jC4G4y2NogA69R3GP35XJp6+GbAvcrT
         3Yuj7hNu6L0zIquZBcYLtD/BNoRZiGd1aOkrFo18GlTBdHqM5IaEtBCj2Sx9ykAdvFhg
         PKTw9JzJ3Wg+DndyWkovaC63AXvFTrRpZhf8i8Uh1C9RTMGkhf+Nfnebhcr8kYQfBDBG
         FwNhBWXBuwtYlqLKU04Bta06ZVFpoo0zm5RONhPTsZSysbVDaJggI7hDev8GD2zj859d
         EhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764831113; x=1765435913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SwIvTqC0vtcEcT4pWezqNiZK3gnYXhecWCg8UTidylM=;
        b=VFQLmoLjQMAdIKnmgXrrZ9Kwna7DTrELo5l0sWAWDMEYdPHEtYVAEbiV+KW03pKmBv
         HyHrVi9AkT8OhyDXEY2/mljgHPiAtiCFxzFEzGta8m2+ZBOcBKVuE9fHbmcCZA0y6U7M
         zOOkLo/5/1Wtknhs1u8zLLLLy2owaG8SMNssxlRQsEwdXYfB8ZyegKpeW6xYBnY7zDIa
         f1sb+qyNtNKN42VTkLk+12TVISzvW70rpYuJWGDlLKZTJ7EVJTQNpfL3agO78kbAxBTk
         ddr303+tg6DCDt5IZocugLPE/vLvsEsn0xsk0BNSdlk/3nShELjfqHFccAlAUhNm6Wl8
         ZfyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWphD3JKxwgdai0nkeEk0y1ZJPvXcgSSUSGhICPBoLt3MOoOEjj2SvOXXbO0P9ytzhdjKh93Js1bSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCJ12HAjugVjro+RZqSnLPLVXpK+TKqvxpKt95XFMOP5QoeyLh
	7zKAQfIsHgZeTfTZUrNW8WtVkbvY+5nfRpSNgGFneYGRhYBCemy/ObZ4Ad5h6w3UEZhHYVURHgc
	5JV88JZXpvhX/SQxix0lmqLuWYisH+yKGpMwFsmVIp20HwqEfO5Qob92vc9ceDFE=
X-Gm-Gg: ASbGnctlYvVbve7tTMyG3KfAAfM9ZFLQwfXlJMpile1MfowveD+b4BTTPiyehSsIxn8
	N/0Q8n8elz288YwzWYPpOz80QCVTFe9TMWfY68x1xBeAjW1QlRHkqrSj4vHq9Uklpx6p8RkVFMq
	HGHTVx9lHm07yepGzV94B0fvqilcSMSEOjkDi+CBBUXpbbxQ5HSeVxhw3UtkOx76WrlqTQ4iG+t
	Y22gMzxnt5F1ASt6HJZViea/4yPf0soEkxmTfXFqw5ftvtYgUGpIxPV8Cafxh0hHG51I4QLtCpf
	bkb9PTaIiFjMC9SoTDXwrqlFHcFobi9CnfgyNl7HMmgG1psURBXkHMME0lfnKgKenU3RswAvafk
	PontbCjYT2qgIAjR6IfXL2KbiuE7BVXPJOuuY/w==
X-Received: by 2002:a17:902:f544:b0:297:eb3c:51ed with SMTP id d9443c01a7336-29d9ed0b4fbmr26080685ad.16.1764831113142;
        Wed, 03 Dec 2025 22:51:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEK/6jD4CnU7c208zP0SLAeyIoeJRxRQ14N6apIAj0JxvDPjIPkL429Mbb2KAq5S0NdCutI0g==
X-Received: by 2002:a17:902:f544:b0:297:eb3c:51ed with SMTP id d9443c01a7336-29d9ed0b4fbmr26080225ad.16.1764831112660;
        Wed, 03 Dec 2025 22:51:52 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4d3b5dsm9082855ad.40.2025.12.03.22.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 22:51:52 -0800 (PST)
Message-ID: <db8a9c71-8400-46f2-892a-a9a8adcd8dd0@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 12:21:45 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] clk: qcom: Add support for VideoCC driver for
 Kaanapali
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-10-fb44e78f300b@oss.qualcomm.com>
 <850c172d-66e0-4d28-903d-fbcef7ad7444@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <850c172d-66e0-4d28-903d-fbcef7ad7444@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: D4jcA84wHJFROBP0fjsrmBL05QG98Mpo
X-Proofpoint-GUID: D4jcA84wHJFROBP0fjsrmBL05QG98Mpo
X-Authority-Analysis: v=2.4 cv=L+YQguT8 c=1 sm=1 tr=0 ts=69312f89 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6AvYVb4XUzzG-8MtstsA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA1NCBTYWx0ZWRfX63hAQLdktQCi
 /VSqPCmr56HjFJNXSIVRHEBIXyuYH1iAefhV8sSci6JcRP7Sz5Dnm/7vZJXrkwQ3FE9+9NHp1li
 BqVPNv05RuTCMe8rjzVOPSTEl6Hc0k+wkEp5C62PHZ3iRsgnFTKSsd9j7H0Y3SEQHzTryq0uSAB
 zdX2EKofXljrmoEqZwoSPCRGTce2IQ7N5oZvB82ONunnHc1yAF1XfzddZQilsA017KO/94clH2a
 5vzxcNfEATLnjNCqq+u4PHdMktYmau4dcxbiv6lCa6nB8fVVcvsg6wdrjDVbAH7JZW76TI3tarK
 FkCYehbATwtnPgwwqdK/FUhBOVE+Xed9kTI53DwgH2VmaqdLNl7jnaL1baGJFDugKKSukTGpnKC
 pi/rr9kdmSjgxLSy2mC8CsCeXvrM4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040054



On 12/1/2025 6:45 PM, Konrad Dybcio wrote:
> On 11/25/25 6:45 PM, Taniya Das wrote:
>> Enable Kaanapali video clock driver for video SW to be able to control
>> the clocks from the Video SW driver.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static struct clk_mem_branch video_cc_mvs0_freerun_clk = {
>> +	.mem_enable_reg = 0x80E4,
>> +	.mem_ack_reg =  0x80E4,
> 
> hex must be lowercase
> 

Sure, will fix this.

>> +	.mem_enable_mask = BIT(3),
>> +	.mem_enable_ack_mask = 0xc00,
> 
> GENMASK(11, 10)
> 

will fix this as well.

>> +	.mem_enable_invert = true,
>> +	.branch = {
>> +		.halt_reg = 0x80e0,
>> +		.halt_check = BRANCH_HALT,
>> +		.clkr = {
>> +			.enable_reg = 0x80e0,
>> +			.enable_mask = BIT(0),
>> +			.hw.init = &(const struct clk_init_data) {
>> +				.name = "video_cc_mvs0_freerun_clk",
>> +				.parent_hws = (const struct clk_hw*[]) {
>> +					&video_cc_mvs0_clk_src.clkr.hw,
>> +				},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +			},
> 
> The indentation is a little malformed 
> 

will check this and fix.

> 
>> +static void clk_kaanapali_regs_configure(struct device *dev, struct regmap *regmap)
>> +{
>> +	/*
>> +	 * Enable clk_on sync for MVS0 and VPP clocks via VIDEO_CC_SPARE1
>> +	 * during core reset by default.
>> +	 */
>> +	regmap_update_bits(regmap, 0x9f24, BIT(0), BIT(0));
> 
> regmap_set_bits()
> 

Will replace with the new API.

> lgtm otherwise
> 
> Konrad

-- 
Thanks,
Taniya Das

