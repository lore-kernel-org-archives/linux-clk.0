Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460CD1BEF85
	for <linux-clk@vger.kernel.org>; Sat,  1 Feb 2025 15:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738423554; cv=none; b=nZTFMW7wF/NEUKifbIDnoO9gZNvl1aFxF7KNhub8HLTkDtNzYQaL4QV59LOXM6Ea5Rlg9MVUSCdb7tn/EOSuwOvj1DfqixVMG5oScAu+6/BThS9nGADx0fk9ehV70smvwqrzdRNksyyMkdLiggIXB/VFZuv9SVQ1XUV16qy+g1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738423554; c=relaxed/simple;
	bh=bMGJDTm54VyUfBj7wTKftvopxlIgt7SCO4Vc2DyNcws=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tX6fRnN/WVVhNrxqW/morVcjGqhXOhT8YUkAuLyKKhPGBthWgq2PI3DA6B2o0/wHMXJ4rpsM0ECG6zVr1WNaJocYPEiVoD5hWgUsIBYXj15Zsa+XBDdSFeBuIRqnYXEWcqB5LtwNeHVIji6SmJ87wOmpCRKRjiiVx8B/KQ9GqL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OK2zNtoE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OK2zNtoE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51157DAU030856
	for <linux-clk@vger.kernel.org>; Sat, 1 Feb 2025 15:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QTo9BqCjU0lGgDcCNjXdcB4Ik7PEA06CtGWxusPeac8=; b=OK2zNtoE48tp2t9i
	29afXwALvJFiG7JeIZT7oaEtSPccfrQoAOYZ1/WAn3QDsiYcIXv8jINJtKK8nNMX
	lmNInehw8n7GCV9FuelvpwjaOSts6UYFdk9i8UDcDXMUPg5nEPvS+8WYD6PRgyI7
	5ShmS3RtACLeBUSzEHVBfu+SfflKw1r/nMSDQrydMsTnUH7iJnR6oL+1tKmdW4We
	irP8FMc9oxqXNHhuZKbQ2Ych3BI5pqUWVtx2mVPdMGwiRVOaFfzcLVASdIoDbT5s
	g+1VtxpFg3sk+nf6VHiaYU+CZz2xSyKWsfVkYC5SgRn9X5s69ggvazU96EsG0XcB
	4uShcQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44hd6b12pu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 01 Feb 2025 15:25:52 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e20cb2ce4bso8930236d6.2
        for <linux-clk@vger.kernel.org>; Sat, 01 Feb 2025 07:25:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738423551; x=1739028351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QTo9BqCjU0lGgDcCNjXdcB4Ik7PEA06CtGWxusPeac8=;
        b=On585k0B49vS1T9N5N/RxfQ3flfRfB/2TGA/mDl3VgekqBELBYibJR/ylPdT2gxF58
         iHgSTOrnXOY6vTfq6PnYyfqIlqerYXy/MPXcUSpxyNcmE0k/mlYKA0yqLjf+cyYspptE
         TtY/IvMoACsmpVKKZm7NbsLXaiT+mYHiyNsBaoYBLA1rEcRffPI+6rfNGvYdEC8kN4JD
         UxM6OPPTN+U1H4jDRPMFh+TUHIzWSfJv3YGBccE2FHvY5nl51DYwuA6jk9/7s/QDlHxm
         tRM/9shGbh3ww2NRtp9Ouq1pj5Nf8BNVFlDIBAhOSo/dYORDVjzWYMqcdZd6sUqd7+dj
         t/og==
X-Forwarded-Encrypted: i=1; AJvYcCUEwBFE7wLGNfjtdYhLcv1CwmMQ9DGuUAqw1Y7LELqY+cmG10Nsb3mTUHSVIFCOD78hKjbk64UcGls=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMQ1dpUz+KASC9y2gMFuFL49EanuimoHZAAXcG97MhIbaM+rDv
	3zX0ou2XDFXGdFlpQa9HVJcybOgUW1ddUdSp4LpazjUK9EH9NM7Ba5EvCMa21Fnn8D/WNtum29p
	Ob2TvXCnYoEu69p9e3Intxrs0NjGDJHaKn0qB5+xgw/4/z3zbCk3McwSxbwQ=
X-Gm-Gg: ASbGncuTshF284Mj5Yn2uaQ+ehFRqQOsl5qx84mdXjbdsxqTv3sbdRjBmGcjT8bb6hU
	GBRtuFaS+DmhGMpnIli3jBAzBSww9K7cBLBdoEUsGVQNJa86GAx3js0Gm+JR8Y9g1eiJgrtXXJ6
	ArRCDr1iiew4t2OWgWyICmiedUeztnik45Wlr+lYbJkFjdyPIDDDNTbirg3dbSD5mCAuwFYEPI+
	vg46grAahSbcFb4lTKlohShCl0w+Ni0FzNTeWRSf/OvuR7Oqau8dIe+AUn9q6+fo3I7DAD66/xV
	jl/5KRXE0N7uIR9hwP7q9y59HVSlgIIPBkuK4FZKqVIRIYa452E7rsnINNg=
X-Received: by 2002:a05:620a:f06:b0:7b6:c6f8:1d28 with SMTP id af79cd13be357-7c00982326cmr615950685a.0.1738423551041;
        Sat, 01 Feb 2025 07:25:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+tJvZOzHO9zhecnDoqQOoZhgTADi8PoLz0JR/IpfJMQZr3zy8CewISFLd+BDfgFAdPVutwA==
X-Received: by 2002:a05:620a:f06:b0:7b6:c6f8:1d28 with SMTP id af79cd13be357-7c00982326cmr615947785a.0.1738423550579;
        Sat, 01 Feb 2025 07:25:50 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47cf924sm457818666b.69.2025.02.01.07.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 07:25:50 -0800 (PST)
Message-ID: <6c8bb178-1758-4b73-bbaf-8572dc1216d3@oss.qualcomm.com>
Date: Sat, 1 Feb 2025 16:25:47 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: apss-ipq5424: Add ipq5424 apss clock
 controller
To: Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, ilia.lin@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20250127093128.2611247-1-quic_srichara@quicinc.com>
 <20250127093128.2611247-3-quic_srichara@quicinc.com>
 <47f7553d-74a2-4da0-a64c-cc49a2170efb@oss.qualcomm.com>
 <123a324c-561a-4081-be43-8d8ed0662acc@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <123a324c-561a-4081-be43-8d8ed0662acc@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YwXvmPj4IJm3AklTIX9R8YagLsyOT8Y-
X-Proofpoint-ORIG-GUID: YwXvmPj4IJm3AklTIX9R8YagLsyOT8Y-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-01_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502010134

On 30.01.2025 11:03 AM, Sricharan Ramabadhran wrote:
> 
> 
> On 1/28/2025 5:29 PM, Konrad Dybcio wrote:
>> On 27.01.2025 10:31 AM, Sricharan R wrote:
>>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>>
>>> CPU on Qualcomm ipq5424 is clocked by huayra PLL with RCG support.
>>> Add support for the APSS PLL, RCG and clock enable for ipq5424.
>>> The PLL, RCG register space are clubbed. Hence adding new APSS driver
>>> for both PLL and RCG/CBC control. Also the L3 cache has a separate pll
>>> and needs to be scaled along with the CPU.
>>>
>>> Co-developed-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>> ---

[...]

>>> +    clk_alpha_pll_configure(&ipq5424_l3_pll, regmap, &l3_pll_config);
>>> +
>>> +    clk_alpha_pll_configure(&ipq5424_apss_pll, regmap, &apss_pll_config);
>>> +
>>> +    ret = qcom_cc_really_probe(dev, &apss_ipq5424_desc, regmap);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    dev_dbg(&pdev->dev, "Registered APSS & L3 clock provider\n");
>>> +
>>> +    apss_ipq5424_cfg->dev = dev;
>>> +    apss_ipq5424_cfg->hw = &apss_silver_clk_src.clkr.hw;
>>> +    apss_ipq5424_cfg->cpu_clk_notifier.notifier_call = cpu_clk_notifier_fn;
>>> +
>>> +    apss_ipq5424_cfg->l3_clk = clk_hw_get_clk(&l3_core_clk.clkr.hw, "l3_clk");
>>> +    if (IS_ERR(apss_ipq5424_cfg->l3_clk)) {
>>> +        dev_err(&pdev->dev, "Failed to get L3 clk, %ld\n",
>>> +            PTR_ERR(apss_ipq5424_cfg->l3_clk));
>>> +        return PTR_ERR(apss_ipq5424_cfg->l3_clk);
>>> +    }
>>
>> Now that you'll use OPP, you can drop all this getting.. maybe even the
>> apss_ipq5424_cfg struct could be let go
> 
> ok, is the suggestion here to use devm_pm_opp_set_config ?

Since what you tried to do here is binding CPU and L3 frequencies together,
yeah, we can just scale two clocks from OPP.

On some newer platforms using the epss-l3 driver, or on msm8996 with a more
complex setup, we expose the L3 voter as an interconnect, but here it would
seem that we directly control the clock that feeds it.

Konrad
