Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DDE3D1CA4
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 13:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774875998; cv=none; b=ghlfxL7ldFXjmOQtsLGDr8mvBzCGTtAibBJpCtIjWttTiolEapdYkmY3nzfyABETM3bBvUSnU1XbSguKtCFm/hSvtfkArFg73/DKFGC3RXDmkvz2Md8/tS+r64TYPblBdVofBB231GgarMzeACI0tusm7ACxJ34xrX7dbJKQfZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774875998; c=relaxed/simple;
	bh=hnJBIkRTxb/pEx74u11pPM/34htrB6sS8kh15oW/cOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OvPxXKj8zEydamFZOtVHoOQqWfsGFFCTeLO9zxCDMvble7+dWI2+bsGGNanewkV8DaFYr1k2JlAiaCYKIWDSmkWjWsNRFEJtHqdUZlj6/EDRJEZMYEMuSWzZvRYffcYDvjUDqO7eZe3U7DpMTzky7ZQEnC2QhZ69WgEj8TUlom8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZTQeaf/b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YhDjsbje; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZTQeaf/b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YhDjsbje"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9nN4P3722208
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 13:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/IOBEa7GFyVDrfJ8sYt5+s+/t7ENB46SJEYFrDxrvCM=; b=ZTQeaf/bytoCSzFg
	EDH8gepEfMTHNA3ea5/l/Z00vj10jB0GWj/hak8WZ2+LJeykTE127InAgZiMx8GO
	XzS+nfcvuaPOcQSDV/SozA0cdn7P0iTCyazjW3u+in77R91Vp1YhT0ur9yrYylGA
	xTtTJH2szq98RqFxdWwzcUbh5AdSzfj6Oh2WLltinAPul7VqEGoEu9DTevdoSnzU
	G7Nu0ewwB0ISQNtX33XcF9XfT8fOiKcE3hVaBq5iYhS0xATgA6sbe5cZvXmLyTAL
	k10JtG8qp5qG3CD+Cbo58BxEgqrev9YdFl1OYWZEo+XALFovMpnZlEif36TQeUYG
	zyjM3A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7pvmrrd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 13:06:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24cd2e2b3so16634655ad.0
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 06:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774875995; x=1775480795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/IOBEa7GFyVDrfJ8sYt5+s+/t7ENB46SJEYFrDxrvCM=;
        b=YhDjsbjezdf3fxam6BiBLP++RxXrsTzOmepg+0XLIXdPd7ELztaTZcdshqvrmTU9Sg
         iwXWuRwTpbRdiyw92dyKW6B4bZmHLQYrM5Pn+WQuzLP5HVIFHzdumRwxrOzJBM8nKTzr
         yZk+T3e0MAOukxogwC5Hu9T6Ub3fuC6AT0rPDd+cJ1FnNV5EQOpW9Vu9KDi6CXyFepbE
         MQZDhRcqynRYoAo/+85pIATD/dvDTgI4kjiN1Xw2qNn/K1qF+hz5nUx5UhJ065MDPSjC
         LCcMcdUrGIYwEGkkSCKcZTs0yrgD6ayV0gmXwsJ9WJ/8ScSuEyhTA64MZRVCYFoEPZGN
         GcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774875995; x=1775480795;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/IOBEa7GFyVDrfJ8sYt5+s+/t7ENB46SJEYFrDxrvCM=;
        b=rT8vtJsY5lpoACuwz79947CJVRI+SLeVA++V8ltrTB4TMKb649/WoTL+iL1T49ooNM
         TdkBamXH7QDgEF6B+fpDrQRc8/3C3FrZox0ojnqaTsB3be8BDK/fnOQjmMn8OC9fF8xs
         BVa3WfIcQcuhslW8fQBdEYKDIF11vB5/3CP+lsld1WeQk09Q5yZ5iGVsPhU6I66MuDgg
         Rbi5TNjFynbH/Fdsx3voDqxPR9fQRIF8+y4LYL07q3Q6LrU8+OvIbe1anao3+Q/Zjdlo
         cc5/NT8htoRpJkmLWe7LnnbJvtaM6304+g0iqPXR4bJ6I+xu2epm8vah3qKpv7DpN9Qn
         x+Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXLw3aZqFuelHokbUG5Yk0Es+zHj0cibM99niVMCqbenyaLX7Ul+KyJDDOafoK9EN+dCK8S4GS9rNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfDEjqUA38T4vvtnc1dh3YqcgB7CFQ3Ih8nr6jm4rDvm45oK/w
	j8KpAemmKRczbS8lDAHdnOjlaf72KvK73nnyV2QirE7YanxCkXL03zycvDRW2+o/8jjboM9p6uY
	tQjLlBM3ixuNaUzrd5hMML1OKtwhGoZ9vZkMQyUisM22WqxcxTuo4izz1U6lnulQ=
X-Gm-Gg: ATEYQzzfSxc9qjpQIzBSQ+4J7XX9kuqmr9GW5FCoqazOU3dgEEEKd52WxAsnFg0jlkF
	BPQtHGBKFsoUp6tOEuDibBcqyD8w5cb5x7IgV0nhdA1GxGZTRiGTyM6pHF1D1FUPwKWELSnzkEX
	qoOs+MX4JTduQJz2hLeJPK25VH7bI0mbv23QHCmfnAl+r8MGfJa9nAP+plmWnezpTuFTi3sZopQ
	PxpPQ3L/QAovcML9msVdSUuOGL3eZ8tQ8GdqA1J5qIt/KzlqJUSwRF7FQKWCt6K0CwiUoNiJDtO
	sfUSYeqSSzMcePa2i9xFJzJnCGdzZQRDlOLSz8Bgk9F3aH7QTikLcPfoR8qhAj0Q4+0CupD0RTs
	QggQZ4UqXxAt1sQBu38+5+gkxFBjfaC9moKrUBN9/FtmaoimbZoCJfQ==
X-Received: by 2002:a17:902:d2ca:b0:2b0:5968:a6d5 with SMTP id d9443c01a7336-2b0cdc2165fmr113600765ad.18.1774875995493;
        Mon, 30 Mar 2026 06:06:35 -0700 (PDT)
X-Received: by 2002:a17:902:d2ca:b0:2b0:5968:a6d5 with SMTP id d9443c01a7336-2b0cdc2165fmr113600345ad.18.1774875994884;
        Mon, 30 Mar 2026 06:06:34 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24267397bsm88213025ad.27.2026.03.30.06.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 06:06:34 -0700 (PDT)
Message-ID: <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 18:36:24 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com>
 <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0z5ZRCMr07sswetSEC2l5VMXtaooj6tc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwMiBTYWx0ZWRfX6dI2BnmanAFX
 F6jBpBiO+DrTTRNzp0pQTuH2NGetpaJiK/lImrfqy/XkDahL/FNPS6y8GvUKb1wh5QSV90JaVne
 91JDS6HvIAhcq9UBElF455JsGrSeNx68yHxANTahmBtAzEnFsgbXXxmYW/JS7Vdgv2348tc2qgi
 SBc+tHsVui9sZquXX7TiVD14kNt52Y+sq1BThGnCQmZstS6evzGuXxSWP5cGwRLgwW7c277vTuY
 6qKIsT/Jnc553R7fUcLQGZ2Oe8Oc8yWeWXvxI2Kynd5ZL4FQGQ7aNVdrmxqcyoxjXpLoRHM+4B+
 hEassOW+HNtNocTCt6wUCzoV7jTe3yvOFpJhX4qr8TZKvB6GITrIgpdhRluz6Qnrc244F6NzqlQ
 tJvLPPctJ+cD3zrFSYjEhfEgzH5x3MT2SuiI+I4OSTRu3E8RVmM1CljIbG52iF6GW83tOBpld6k
 4GKoY3wa6kyRu1jhmKA==
X-Proofpoint-ORIG-GUID: 0z5ZRCMr07sswetSEC2l5VMXtaooj6tc
X-Authority-Analysis: v=2.4 cv=S9rUAYsP c=1 sm=1 tr=0 ts=69ca755c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=5/Y9Gi2N1OwmQbPtUd2E/A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=PIOu0JlNxAVOzX5nUJ4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300102



On 3/30/2026 4:45 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 30, 2026 at 10:55:02AM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 2/9/2026 7:02 AM, Dmitry Baryshkov wrote:
>>> On SM8250 most of the video clocks are powered by the MMCX domain, while
>>> the PLL is powered on by the MX domain. Extend the driver to support
>>> scaling both power domains, while keeping compatibility with the
>>> existing DTs, which define only the MX domain.
>>>
>>> Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
>>> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>  drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
>>>  drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
>>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>>> index df8e6bf9430e..aa71f7f53ee3 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>>> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[] = {
>>>  
>>>  static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
>>>  
>>> -static const char * const sm8250_opp_pd_table[] = { "mx" };
>>> +static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
>>>  
>>>  static const struct platform_clk_data sm8250_clk_table[] = {
>>>  	{IRIS_AXI_CLK,  "iface"        },
>>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>>> index 7b612ad37e4f..74ec81e3d622 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>>> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_core *core)
>>>  		return ret;
>>>  
>>>  	ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
>>> +	/* backwards compatibility for incomplete ABI SM8250 */
>>> +	if (ret == -ENODEV &&
>>> +	    of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venus")) {
>>> +		iris_opp_pd_data.num_pd_names--;
>>> +		ret = devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data,
>>> +						 &core->opp_pmdomain_tbl);
>>> +	}
>>>  	if (ret < 0)
>>>  		return ret;
>>>  
>>>
>>
>> Hitting below compilation error on latest kernel
>>
>> drivers/media/platform/qcom/iris/iris_probe.c: In function
>> ‘iris_init_power_domains’:
>> drivers/media/platform/qcom/iris/iris_probe.c:71:46: error: decrement of
>> read-only member ‘num_pd_names’
>>    71 |                 iris_opp_pd_data.num_pd_names--;
> 
> See commit 7ad7f43e568b ("pmdomain: de-constify fields struct
> dev_pm_domain_attach_data")

Ack, Thanks!

Regards,
Dikshita
> 
>>
>> Could you please check and fix.
>>
>> Thanks,
>> Dikshita
> 
