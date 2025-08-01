Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6B016A956
	for <linux-clk@vger.kernel.org>; Fri,  1 Aug 2025 04:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754022744; cv=none; b=Pa9kawIdGBmWJqSKnsXY0jko81mzOE3cFewCFfbYWul9HRdXqi5OmpNajLXJQO3bM8cR12ZOsXWpRHNJrR55laC8yZnX/kekpzZqnrAydmwUoQFOSxFK6Vb18TLzSQ7Q0Eb1SOAv1fMKkQMbMhkKi9aPe2jMlHd/FIL6BdB6cTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754022744; c=relaxed/simple;
	bh=PZsepC5GNtWag35e7sBw+U/csrG/NR/QT3fy/e+DqFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QrUt2UG1JF0o74SA+xCwikPHYtGF2XT7syf5Rs9EQDCZUmw4s1kIat4gwCLZ7jdIVDXf1zgzYk3B3P7Lc2Ivd8XEFBZeVxWFVZj9z1GoZpbg+HtCOlPyY4NcafoeYYLiM/6WFKic3Qk2d+WvPGnwcJUt2FJdQvmVnXWo52XDd10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XKX6tpEM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKX6tpEM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56VJpSkQ013642
	for <linux-clk@vger.kernel.org>; Fri, 1 Aug 2025 04:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLNJqEgg1Sd977O4ZU1RM/AYukW1berh1aTC8vgdSTk=; b=XKX6tpEMGRmJEt+C
	Yb0ngEYWNu8aWh6UUdfsCiRY92x1HMtIWMWf7TFYLvEoApCqdQ8UDJ3z34PE144b
	8aiiXA27565LWgiSDCHVsCy7mh0+SQQFQj0V+rxk7v4hC065eu+nwjTmlYj/pf8D
	pWC+IsEmQhCvPj77urRTg1Erju7LBFb5fpmSsWGdYEjh445dhsFasrFqsvla8JQH
	jvsUi3d7UWGSAep8yBo7aAdBetI6x0RO9sd/PbqbQc6B7uOp/9EUlgWGpH49uzC7
	AJZT6kLd6tbtew96Td6X4XPegkqnV+88JVoL9WpxvlfmFPQ2ZHP0KzYq0l8MkLBT
	TTkEFg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2t7v9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 01 Aug 2025 04:32:21 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4226c60a38so688811a12.1
        for <linux-clk@vger.kernel.org>; Thu, 31 Jul 2025 21:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754022740; x=1754627540;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yLNJqEgg1Sd977O4ZU1RM/AYukW1berh1aTC8vgdSTk=;
        b=uYVTwLuktNpt++b4fSxTm3o3bX4cFYm7XBeRMZbNAdMKuDuOctGHdUcR7GDbMrAzjR
         C1ux7TsrQXj9w/CD1w6eMXn0slcj0biuhdJ5Uh5rksWn1b9vL3ghYxVlVeEwJXwGaJWB
         WvWbp5Ah5KMMQxCWiUNANtsMeI5xgXTARKvWq7npL8dPEmIcXlRvLOdGHqDzfj/Nq40g
         YVnfSfW35R1ocOe65BSP3XZ4U0gnimthxCime0SVrEorgT8s0RV1y53+7uqPn8DHsQmO
         0d7QeRM57GfELmAHSrRGf3kxShpkiMl9JXvH4J5U/3ObFn+ygINbEgvI3ck5E1RVlRWf
         jQBg==
X-Forwarded-Encrypted: i=1; AJvYcCVpzXMqubQ8lL8bxFzKrOe7zRPfcVbKwiQBj30XyMbdPVfAsqVtPb9pFUfCmyxbs0r0oMIAhzJ6qUg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzg7MneAWKao0Va2tqb8sNeWJu84hoJnWQay3mRqtjHk84zEH7
	UfiaJjvxuR6t2CDjDuCSJqb9ficWrpoaEKVNmG4OBV68mJMk8fsAILoGZ50Xp/Pak6p0N/sJIn/
	YCvTlYIyVNMFCYxLUx7lC7+QVwwAjfSk8ak84v2V5IItBs6REfPiQFpV3XfLks24=
X-Gm-Gg: ASbGncsPmztGkV5QF+fgGQhGHIboVzp+NVPa4qSK2IhJJTTTrOsjVaARK0on2KVqAyU
	EdoiXtbDbDzgmTYjW3pfaGerTosrqNUOM+d4/izqK3ljyLg7LA1Kff1mMBYp2orLzN50IMKVjHV
	ld0vTDgSC4R+1hJl1vz1urpCN6q9WBWOhPDcSWke4B+qnLtmFfSf32wLoOwJ7/65aZr8+1N606u
	rB4df3reMF+M3QbN5MS5A52DXb+GdYc8ZzT9P1Oe7CAFUWYA7dUHc+4xIErnRNH65bseor51MXT
	W4wdDVQjunpqyBht3v50aGicphEfl9w/380KbhLWCGdBBOmQ1p+auEVQEY8nVNL1wgY=
X-Received: by 2002:a05:6a21:998b:b0:21a:da01:e0cf with SMTP id adf61e73a8af0-23dc0e32c0dmr19142846637.22.1754022740365;
        Thu, 31 Jul 2025 21:32:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyRx/Pl7BjdxFzVTQWc6hVw7LnXbmjumZvBjBAl4aA+8La5UD8cNfMne03gb7c1tgo+RC+vA==
X-Received: by 2002:a05:6a21:998b:b0:21a:da01:e0cf with SMTP id adf61e73a8af0-23dc0e32c0dmr19142810637.22.1754022739991;
        Thu, 31 Jul 2025 21:32:19 -0700 (PDT)
Received: from [10.217.216.26] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbcd00sm2994293b3a.60.2025.07.31.21.32.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 21:32:19 -0700 (PDT)
Message-ID: <784545d0-2173-4a8b-9d5d-bee11226351e@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 10:02:15 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] clk: qcom: Add TCSR clock driver for Glymur
To: Abel Vesa <abel.vesa@linaro.org>
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
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <aIoBFeo00PPZncCs@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: O-mxwA5duWxvl7igbAJy2xHy5cPyjysd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDAyOCBTYWx0ZWRfX6WGph9JrN8N4
 H9N/cgCiVXP6Qu4OYkjzbuqC+vubzhwP6FfeE3b4Uc7VFxji9sm7Eovl1Pg13hkHLD37kgITxsk
 yceJweHFVH/C+WHTAln/+adkIgeNrGbWhzGN2TYVmUCTYfPcnMy83HqxodKraphD1vsLlWM/HHr
 pdfp0kJR7yPJsPz8H0RxYNFdiSrNo2sDnLZ8J3RwrT/boE92wOHk4vEWBprtgotuRtEhe24N/vW
 YGX2Jr6C9+EHjZOM69vnv/UIpNyWdOxbtPJbX6Wtaqr7K3L65o7I/Fh0U+0jqxnjqBasgVxgsN9
 V29lvTihA+e4AiyL3KpXit/LXwW9Uj3Id2mYCeSD8bRnbfDWV310ToMzOXrhUytOCM6uBBjTxEX
 RIaCQy+ClP2cy88ZpRMPN4bAQ3bpo27CoueWgcBSvktBodhcV/p12lM0Y7TsD5RDrTmAsBIZ
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=688c4355 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=ai6KDVl1yJewkkMvyeoA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: O-mxwA5duWxvl7igbAJy2xHy5cPyjysd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_04,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010028



On 7/30/2025 4:55 PM, Abel Vesa wrote:
> On 25-07-29 11:12:37, Taniya Das wrote:
>> Add a clock driver for the TCSR clock controller found on Glymur, which
>> provides refclks for PCIE, USB, and UFS.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/Kconfig         |   8 ++
>>  drivers/clk/qcom/Makefile        |   1 +
>>  drivers/clk/qcom/tcsrcc-glymur.c | 257 +++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 266 insertions(+)
>>
> 
> [...]
> 
>> +
>> +static struct clk_branch tcsr_edp_clkref_en = {
>> +	.halt_reg = 0x1c,
>> +	.halt_check = BRANCH_HALT_DELAY,
>> +	.clkr = {
>> +		.enable_reg = 0x1c,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "tcsr_edp_clkref_en",
>> +			.ops = &clk_branch2_ops,
> 
> As discussed off-list, these clocks need to have the bi_tcxo as parent.
> 
> Otherwise, as far as the CCF is concerned these clocks will have rate 0,
> which is obviously not the case.
> 
> Bringing this here since there is a disconnect between X Elite and
> Glymur w.r.t this now.


The ref clocks are not required to be have a parent of bi_tcxo as these
ideally can be left enabled(as a subsystem requirement) even if HLOS
(APSS) goes to suspend. With the bi_tcxo parent the ARC vote from
HLOS/APSS will not allow APSS to collapse.

If any consumers needs the clock rate, the driver should take the
BI_TCXO handle.


-- 
Thanks,
Taniya Das

