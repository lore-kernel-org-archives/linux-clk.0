Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D697A3BE65F
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 09:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777454306; cv=none; b=e2AIAtnLi5GpyoBEMkHQJLzfHzfbvCQJ8TQxQ5k2LYW5h19PVfIrK6pFbOlliBVub3sYMbwwowqVhZlFZLpS/kkxHn3C/3LxfIBbNJdOqNFFHemn9hajfd9VQEHDLajjVg2Oi8nj7zQlaSt3YQVYdDeuYQwklUapHA1QtMTwT1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777454306; c=relaxed/simple;
	bh=EZUtQyn7RAjCFiclJIFM3vCOLYgR7e24GC6BguHNsNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jglvsi8eBRiTO1BUXhacSfDvZB1iwThQ42kDxkRjaWhNhIf3VDwrI7le2ZLReSHhsajHwN+hqPEiQg4roG5O89Tr5JnjnRwYnkNVDngpc4fRNrQ6wQvhMBLkEQb8M56WGF/0Mw3W2IWkdZoj5o5lVCfwxqOlhg83lUPNtg05quc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nTWCpHbk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L4qc+lnn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nTWCpHbk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L4qc+lnn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8ppWo2094109
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 09:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QPOUtwKdVa5yHw5Zhp3tmvY4PY/t/8iLW9Ls+HTgOoo=; b=nTWCpHbk/e0vTViw
	vkQekcZNZI2UwzG28yVQwRStdEMyKLIXhN0vveD2bXRI3EwS85jgNJrWHUoptNki
	YxGiA7H8nCbXIknac1VC1Tht14S6PhmB7f2WZJBj9Vm50D8QIvFqrl+QpjPWC3UW
	OhWE+n2+Dtku63td0GVPAWV4vYE8i3A23yPDEBHMhwe70XdFTWmhROJoEJY3twwR
	VfV/llY1DI+mQZ/KNbYs9bCHBQkw1UhD2ylIXP20206TViNppWwSc8Oa5s/DPHvL
	Ql6GeH1uJcUdtYmMUPpa6+fi0svbGOKqEpU4lthtmMMyzNk8kMq0OzdfPHDemZca
	SGQiEg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dudh3rj5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 09:18:23 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9511f903b16so481338241.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 02:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777454303; x=1778059103; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QPOUtwKdVa5yHw5Zhp3tmvY4PY/t/8iLW9Ls+HTgOoo=;
        b=L4qc+lnnw2xUAdwY6LNA5K1ylkCvqYs1TesNDK+Vd9LGaKZ2rCuXmg5hDWVKwHbZi+
         jh1llut8ET5k6lgI7v1T8Q7azmDFZYIX38UVB4ucQrRjUBAwODOPZ/7ei/xuMfLVNJLA
         NEdAdyZysjoCq2zBVsKwvR0LUoBI14TTalUyARfAnEviD8iciX/npIocTcac45RNnaPo
         d3uehGGDjEnJUc4jLCPYIPiVl+D1A4aMVeBkmBetZPeU7iKMYEePjQy+nvdpZXhKTWRH
         H5lYSzzOboz0XV7L0awvjAyo8U9AZwrarLAEz+6jCFAg/iG89OUuHvXZkZ8tuu/1jDmR
         ZzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777454303; x=1778059103;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QPOUtwKdVa5yHw5Zhp3tmvY4PY/t/8iLW9Ls+HTgOoo=;
        b=hLJNh1eN2lNjcAG2YcncqRzn5RfeEpRspVWHrbym3ltOmRd/5yBajroQ16IIMSa6LM
         Nn06RP8xXQO4h9zheHmHoIDPPcNN0HYcADvkJfO/ZQHW2ZGPd57QpbpXxi+R+rXRbETR
         qj9SBPBCQGU0nbon5hNrIf9rLdTBmAHwVxwSOqlvX8Gi6MweaZtC58p9f+ZyDHhIyAK8
         pPlSZoE0Cz/KINE3xmvoWqvgZY4+6sVyVxuN/hNmaW0CnpEiaG5HLPLdevrfbordkI2/
         +dvaqAfEkjz+m9kCPOl/v904wLBsBjxbGZKi4eVn+szDIxGnYZ68bM8C/8Hn3b4p5nls
         TmOA==
X-Forwarded-Encrypted: i=1; AFNElJ8kjdyB0ltmHYs3K4MYVS4hNCQ4tM69gCjze6SetKC8MEHMYhW2SY+WHczzOD8j7yOdmx76ELR9AM0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+/znuWlad+bhfPKe5in1t4CdvoBtZf8NkDEp0/ZOY/7Q20Gp3
	41MVAwoxiUHtvkhVMcBW4teuOLttyFWgqKXapPs/ySOwRxpxxRc6cga2FtvOSwpSzvwDR5L8xY+
	2L/V2rEo3t2Ke+C503OcoIS66CkyCSEtB8HazSZSL3NPTRTK0BlEjhDVYVBy6F7Q=
X-Gm-Gg: AeBDievLNvgupo6cEU6XYDlIODQ2huSQQelhDWblg5EVhrZo2H1qJaAfR2Sg3wMfPMQ
	HTs47IUBx7vwck+Ejbb7egTFLtdYMNl0gbLrQzWrdTbFCcdcZnbtOE0T4C1dMuaSYaybKqh2xxj
	79vBQ7kvb8y3RrNnv+h8B7KaCAut2YfPaEtxWqgrUsVK3nGcic38W1ko74ObQ6rE2cTYZDREeBs
	BS32RJVLTdt3lq1MLXJtSQBUddSCj/nzteow3GVbKAGhVQjRQ3mqH8WqTzfPGZvptISfWOBi+ui
	jm/S0qDfbz1yyInBAtmgBj1AEmw6yAqtpjB1NBTIHbAYf+2AQ4anpjm9EegoeZoeHw0cAPagdPX
	ieXJLvv+hV0T1SkxhDCnffHYGLBkYWydlBTMrfH6xdb+NTqP2QVR8k96Whhv9nVzTeGYIPfZjzn
	TecNNKc2SCC/+MxQ==
X-Received: by 2002:ac5:cdd7:0:b0:56f:79d2:2e62 with SMTP id 71dfb90a1353d-573a2bd45c6mr1315610e0c.1.1777454302973;
        Wed, 29 Apr 2026 02:18:22 -0700 (PDT)
X-Received: by 2002:ac5:cdd7:0:b0:56f:79d2:2e62 with SMTP id 71dfb90a1353d-573a2bd45c6mr1315607e0c.1.1777454302543;
        Wed, 29 Apr 2026 02:18:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb986113ee2sm63917166b.55.2026.04.29.02.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:18:21 -0700 (PDT)
Message-ID: <1120b76e-3c98-4f32-821f-baab667dfc38@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:18:18 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 07/11] clk: qcom: gcc-msm8939: mark Venus core
 GDSCs as hardware controlled
To: Bryan O'Donoghue <bod@kernel.org>, Erikas Bitovtas <xerikasxx@gmail.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
 <9kBbj8Jr-f6eqC6XfnJPf3gKQD-3WfzXgzl4KEVKhRZlW2_GftgFBsijqUgEvGcgmeFqPwtVquMmibHUMaR_sQ==@protonmail.internalid>
 <20260427-msm8939-venus-rfc-v3-7-288195bb7917@gmail.com>
 <0ee6bf23-17a3-4a7c-93d2-276e97cc3a14@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0ee6bf23-17a3-4a7c-93d2-276e97cc3a14@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: M8mfvEB0GGGL_c-ItIQ4WDwUrZwpyzAl
X-Authority-Analysis: v=2.4 cv=A4dc+aWG c=1 sm=1 tr=0 ts=69f1ccdf cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=2ZlRtKr-XBrgk40BSoUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: M8mfvEB0GGGL_c-ItIQ4WDwUrZwpyzAl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5MiBTYWx0ZWRfX4Yr1fN5miYzd
 +B+WyDB+LZbPeP7fyhKNw8oSFSRznUbVvuLCTYKmX7hhIobKGf066ZvYvopQttgCN1EcGQSbs+A
 /Okj+6TlsmCyGRX/7Y/CFUqF4pWoqPVtYW8lp1Co/8Nfgr9GUHYkDt09wy1Ibv1v6l64zbFsiNr
 Cq8tbuhhHzMEq6eSkIu2ZUP8eToBEe/nK5M5XYs1gi45cQO8rnx5r+Wa4s7oSvtl86ncUDitBDH
 NqYWb80A2dvTUSxwn1wTxO+gBUkhmOLvFJ3yxplQgwkMCsgnOHyI/yEj3QEoeed2sLFskPTiPiN
 nlhmANp1knZx6HolT+4DVwJLqb0QKXUwaD5D0MPkGhfCImZlGBTTPknyZLqZ7jV2nyjavlwfIB3
 63slGSWYPFcO+rzaipqm7MrhEusCM+ESSRC9HKmoAY6T+il/sL7KRO0jk6hI3AO1N1STvtsddyD
 IcutLqHdzXOu5BgfcIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290092

On 4/29/26 6:14 AM, Bryan O'Donoghue wrote:
> On 27/04/2026 18:58, Erikas Bitovtas wrote:
>> Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
>> device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
>> to these GDSCs to indicate that they are hardware controlled.
>>
>> Venus core clock cannot be enabled if Venus core GDSCs are switched off.
>> But since they are hardware controlled, they can be switched off at
>> any moment. Vote for the Venus core clock to enable it later when GDSCs
>> get turned on.
>>
>> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
>> ---
>>   drivers/clk/qcom/gcc-msm8939.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
>> index 45193b3d714b..420997b00ae0 100644
>> --- a/drivers/clk/qcom/gcc-msm8939.c
>> +++ b/drivers/clk/qcom/gcc-msm8939.c
>> @@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
>>
>>   static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>       .halt_reg = 0x4c02c,
>> +    .halt_check = BRANCH_HALT_SKIP,
>>       .clkr = {
>>           .enable_reg = 0x4c02c,
>>           .enable_mask = BIT(0),
>> @@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>
>>   static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
>>       .halt_reg = 0x4c034,
>> +    .halt_check = BRANCH_HALT_SKIP,
>>       .clkr = {
>>           .enable_reg = 0x4c034,
>>           .enable_mask = BIT(0),
>> @@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
>>       .pd = {
>>           .name = "venus_core0",
>>       },
>> +    .flags = HW_CTRL,
>>       .pwrsts = PWRSTS_OFF_ON,
>>   };
>>
>> @@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
>>       .pd = {
>>           .name = "venus_core1",
>>       },
>> +    .flags = HW_CTRL,
>>       .pwrsts = PWRSTS_OFF_ON,
>>   };
>>
>>
>> -- 
>> 2.54.0
>>
> 
> The downstream opts to put the GDSC under hw control, which is not the same thing as it being under hw control, its up to you to put it under hw control.
> 
> So you might want to be more conservative especially given you have a problem getting the encoder and decoder to run simultaneously - I might try parking this patch and then see what happens.

i.e., Bryan is asking you to replace HW_CTRL with HW_CTRL_TRIGGER

Konrad
