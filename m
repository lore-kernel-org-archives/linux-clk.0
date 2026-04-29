Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D82C2472AF
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 04:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777435295; cv=none; b=jC9yNtgG3KoCSLoC5rfZDCrI0BJTUWic7Ya+3oXazLgbwxWkic3AQfUvYHgFEPRHjhmGNzI7jw/btG3tBTkbkTKdbYF6iQMq9uWchZaSeMv544J1pW8MHyfGdtCiRqsuSWGy19xiN6wcBKuTO5fpkaEzt7VxJHexff3PKHea0eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777435295; c=relaxed/simple;
	bh=wWwq+KhbkFxgwgPt7dPMwgoRpN9PMBmSkiRZgZ9cims=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=akbGbTnW56PiK8C7UwK4MQR96A3JX3su3aB5+4RNzbehpVh7FS7pdyQle44KgaNu8iV2iXAkDZyEVqGhkDtKhHYT0KClEKGwkJHjlyDavwpeiGhd6NIfOpy5hpouYzURU/JWcC3uiE01I+hIbK4/9r8n+yLz0LSybhsm+o0yvh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VNkjBacD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I6iq3i0g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VNkjBacD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I6iq3i0g"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T1Qwd23705148
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 04:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J+RvcmLbtjwmDSQmjg5NMkpveSVejzGuW6m1WWEJaTo=; b=VNkjBacDR2+5SsTA
	DQ5OZnYg9M86d7YfqDCjOj5haxJvONLqxvzHG65jiYtdIZs4yYHYK5LYeyxHufXp
	Oj0vO5+SkHBNd/3xAXEtK+3O1tto6utfHc4/7cu3tDSqyzFizPcJIUlR5aHVvBVt
	iW08qhcTHk4hFh79Sn1XVtpS3EqDysblJhR3dKfd9uu7Pk4FX25wAyMavGLXnjGW
	8t5foEo+CRyoGY8Iu2hZF0ruz79LHi8i31Tp+boT5RiDHqOOob/PjVLlvbwnhZwQ
	tpoE9cougmQculqK9Jm2YloGCqncLVwJiV6lm70yVckhtgVpZD0pA2JR/9ICuMXw
	/LswJw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttxhbhap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 04:01:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa7c6699fso13997687b3a.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 21:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777435292; x=1778040092; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J+RvcmLbtjwmDSQmjg5NMkpveSVejzGuW6m1WWEJaTo=;
        b=I6iq3i0gtFUPnbc1+WMkTGmXMGWvoQ7aPc88loRzS2/qpxYh4p3T+qxKA4WXEoh6ls
         4zSwDiadqQun1Hf/wHYjr8D2Gd2troGwE4ffr0EjR0NXAeMp26Jf4Tm72iIMDskW0qew
         sYl+SAbWRB6Ox+qqOjPhJewLaTQHNFCYAIOtXxgB48ESVAVcZkJaeJyW3+QYR/Z6t/UM
         eZone7AYy3AIiOaKxDE56pnB4zG4m7SxCdLzjXqXvhHDmWcwEo4M6nCKcbRQFc1bNjJf
         WGahWBanFsXJdmxrSHrmSqTjX+NbQUv7RIVtNvaJCGR0RcEOy0dpVnLHKNuNPsQBTlGO
         QYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777435292; x=1778040092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+RvcmLbtjwmDSQmjg5NMkpveSVejzGuW6m1WWEJaTo=;
        b=lbOwPHEWhSjcap16xoCPSLtP+dnay2C0hydeVQSkxtg62mluEAc4CfmLgT9OJ9voRk
         BKaB7NCz1nFFxPc+epwFE7KuAjWSLGyzkL4pZLigJAMOOh2mHkN8dgpr4UCZLSPUbB1S
         pV5bpMU/6JQJCDZBCcE0KSvXopaOKrmTsaYffbZAgbHunAX+cuezRj/lebRqi8Ov1YCE
         Q8I6fNt9YaxKqzx8Eb6ZYJzJay9SrYoSPU/+arWvczfXyfpmiLI3hcpBggg2ofOW0M8f
         ZkmGrSGJ1HmRnXES6oTdVtzTo2fvkUZdUKzJz6wNBWpSHJ66ihhlLLn8/V3LmNe5C07x
         X1pQ==
X-Forwarded-Encrypted: i=1; AFNElJ+77WSBh++gNpg8ZUR20UwPLU7JZY8yjaXNxW/0l5dloYhIzHotRciLp9iVZKXDOH6iirsiatClcv8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx63v17sF1IfDoDBcFgzA7KjW3Do3KXlkQ3jDT/6tCXhSbPy/yB
	gWV4vYLDndc5aMfO43xkolv/zjU3+sKS6xUk5eQABV3+4DnuF5y1L1syordyZN3H/vhtCrI1JkG
	X1uUC6rNzgv7UhRjG7bcKzrMWC38/b35E3j5FEyEZLECM5eC2LCzxg4trPkLf8FU=
X-Gm-Gg: AeBDievrmgXQ6HfYv1H7SLA7VMQ2UHtrwgh0YR+30osMHX7VSOnx2km6psP3yMeV93F
	pKdo7E5cyQFGIOzMUx7hOnf6Q/fHwkHAynNWLx89hb1890tzEPd85ra+rHNwWa11T/Kwd/Gy3Bl
	hSJqL9oC1y7anuhjJg0BxFWyh1RlWUb6PTUX65PCuvtLfSz/HAzGtzGfme5ilPuxgS4DxKaAX45
	ZIG7/0Sw1h0+fxaZIU+P0e8Gk9UE6Pqk0H6UKwkb4xcIWyy1KCMcED4BdKXbG6YVWEdVy/YjZJC
	SYuGRVGH7Uqxf2EgXAkBZkH8QmUIu82BZm3NakRIYOH8PcM0af+thl3JSW5Du5Grz3Q4sm1nz98
	QrAW5xInrPE1e7h8dko6yrFJPyJpRW/bbYtAZAPx4+6MWoX+uQ3kZSmMqSAbUAHbLg2z8d05FpQ
	==
X-Received: by 2002:a05:6a00:3989:b0:82f:8a29:e3b4 with SMTP id d2e1a72fcca58-834ddc9558amr5619409b3a.50.1777435291988;
        Tue, 28 Apr 2026 21:01:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:3989:b0:82f:8a29:e3b4 with SMTP id d2e1a72fcca58-834ddc9558amr5619381b3a.50.1777435291564;
        Tue, 28 Apr 2026 21:01:31 -0700 (PDT)
Received: from [10.48.22.70] ([27.60.165.40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed6debacsm550349b3a.33.2026.04.28.21.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 21:01:31 -0700 (PDT)
Message-ID: <6a2a4766-2dd8-4da0-a180-0c8ce3dc8d8a@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 09:31:24 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: qcom: add Global Clock controller (GCC) driver
 for IPQ9650 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
 <20260415-ipq9650_boot_to_shell-v1-2-b37eb4c3a1d1@oss.qualcomm.com>
 <6ca50a86-0b2a-4eb1-8873-cb80f893174d@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <6ca50a86-0b2a-4eb1-8873-cb80f893174d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAzNCBTYWx0ZWRfXwsqIJfq0ugxx
 JRxnvY6Hv6H0SpmN06bhelvFASo14Rl8tCJ9wRodwiafyLNBlEGiO1WbtHpEJDl+h3Z9XbMxmIW
 9GcG6rRzNXn6mcTgrM4AaJWs/tPA0d3cxBrlUhlL5EuRTbFh9t1aXKUE/aHz8O07S2pEWxCeYe4
 HMRtWYMNYuJxW/MQANg3wIUxrExkh2XxknthWd43wynR6wZnXKMOTB1CNkcnt2A686cu3xUnqhy
 3XUCJnAkyvEZh9sma1zyNjehZJG7ZyfALKlktVLMfGJBYA4m+r02k4Ps1AX++WvwzHmPr94I1sN
 ruYOWXzUhcr7mw65CypRCP7R7NQcBTofMn5muoR6Ea+7TDcBEECn5pHk6VSBaxW+1AE7AD27J3x
 N9a4MBrA57Wu/FLmYGDnd/Vj4oGd2xHoSp2V084YOdU82RD86E+6X+EKQiwdaXMX7ARBkXetgvK
 cUkiT/H3MJSbW/6mKEg==
X-Authority-Analysis: v=2.4 cv=Uu5T8ewB c=1 sm=1 tr=0 ts=69f1829d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=XvYZRKXU5Z7yJT35SDuk6Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=aBoApAjKkzgGVCnEwe8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: ltj2uk9xTLGr2B82BkwNkwHMrINcX10G
X-Proofpoint-GUID: ltj2uk9xTLGr2B82BkwNkwHMrINcX10G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290034


On 4/24/2026 5:00 PM, Konrad Dybcio wrote:
> On 4/15/26 3:33 PM, Kathiravan Thirumoorthy wrote:
>> Add support for the global clock controller found on IPQ9650 SoC.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
> [...]
>
>> +static struct clk_rcg2 gcc_pcnoc_bfdcd_clk_src = {
>> +	.cmd_rcgr = 0x31004,
>> +	.mnd_width = 0,
>> +	.hid_width = 5,
>> +	.parent_map = gcc_parent_map_0,
>> +	.freq_tbl = ftbl_gcc_pcnoc_bfdcd_clk_src,
>> +	.clkr.hw.init = &(const struct clk_init_data) {
>> +		.name = "gcc_pcnoc_bfdcd_clk_src",
>> +		.parent_data = gcc_parent_data_0,
>> +		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>> +		/*
>> +		 * There are no consumers for this source in kernel yet,
>> +		 * (will be added soon), so the clock framework
>> +		 * disables this source. But some of the clocks
>> +		 * initialized by boot loaders uses this source. So we
>> +		 * need to keep this clock ON. Add the
>> +		 * CLK_IGNORE_UNUSED flag so the clock will not be
>> +		 * disabled. Once the consumer in kernel is added, we
>> +		 * can get rid of this flag.
>> +		 */
>> +		.flags = CLK_IS_CRITICAL,
> I think this clock is normally governed by RPM.. is there RPM/H on this
> platform? (doc access still pending..)

There is no RPM in this SoC.

> If not, what's your plan for this? icc-clk?

USB and PCIe clocks uses this source. So once those peripheral supports 
are landed, we can get rid off this.

>
> Konrad
