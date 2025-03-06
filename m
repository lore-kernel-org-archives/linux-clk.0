Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6C915E96
	for <linux-clk@vger.kernel.org>; Thu,  6 Mar 2025 12:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741265160; cv=none; b=rapuEFLofeyUQb4o0G5bSB+a99ZENRdNmK0HkisSzqVjihZ4qOg53o8r3rSTjlAxBJvp6whrGsFPB1UkffOzDxjHgmCh0o/HnyYwNNb/YRfAEPK+RC7K+2l9sQlb8tpYULM+AcBGd9hlykATJdpLaBNmSho3A/J1nUAY4Mi2i4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741265160; c=relaxed/simple;
	bh=BsuZfBy0o27rEroxO2CuiDchs3Er752NKZpUyYkv714=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZNY6OGbu48zMjAWmc7AtYNDE3HnHsTgOm46pS+iDbh8uoeduZ0cKCfOMBwEziHIzVZutqm0XXmPwl7cIk29rZerVGEGI2Y6PaX4hL9lDE/gLNsf1qNb4xl/f4gR0TxiontlDoRwwmY8Ncm/XaRAoP3Qh6aNN0qpgfhjCu6SZFsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AO/VPoA/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AO/VPoA/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5267mBI8005348
	for <linux-clk@vger.kernel.org>; Thu, 6 Mar 2025 12:45:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FK/RHL8Gonc2grMn8KNItFyJCXiEsAQ2Rp7C6pvjJfo=; b=AO/VPoA/n4MpLdaF
	2W90/k/egkeQpg6kVjPmfdjnnvJ9rgyF+P/Br+kZ5/MBpWxjjt9EYbR5fbTj8aYN
	gspxQxFntaXVOaj2a300Lt1JYBQwUa3hRBfBdRHwb7uDiLCM3nfVah46j7aVuTgk
	WadBUa44+Wq0jtN/SGhuqsoD2ceKDb+g0WkkXcR2aHDW9lp/GOjPE0ME8ZAOTevI
	yWsoQkGxfXVHujT0sZnWQb8sRd+2Kw/YvMGSzYpmHsbLcX2vkFq101KvCMDxkD1u
	w6BoL+PR2wYUJNGk75TsZF/2XLjYVZIHABy+tcS0eZXxPu58FG4MvwZYdflXhoVt
	X2EuXA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4577mx8wk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 06 Mar 2025 12:45:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c3c5833b58so18320285a.3
        for <linux-clk@vger.kernel.org>; Thu, 06 Mar 2025 04:45:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741265156; x=1741869956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FK/RHL8Gonc2grMn8KNItFyJCXiEsAQ2Rp7C6pvjJfo=;
        b=b9hnVJ7s+CeBn7W3fpgi1Rlsc8jMUNXcaOGiQrthiBG6yleWg0hfvOxlQrjCPtBaFo
         WXlSA0Y1KNNRnSz6YbseIJ5X+GEcL00eZlACq4giLPQ6YK+5jtAVICE/AAIvPUE66bK5
         FxHs55XhZpWywmoBiQH7kGEj6dd+X+YS9QaEgdklG0+HZdj5lLOePERWiHpvoCRTmOG0
         vfMJM62ggqGD/HuIA63U1JDzYc3Yq83tcDKXEFW5wAT9llLARJbUF8kbF36k54IrzJtn
         l1QVApvqXHwhApHwCOPhjif77L/muRfytXENSOBxDDEU2CQazD6y8z/ycYS2IWWzSIoj
         mh5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXUOu++prgxRP6N7fXwLdryZyUbni04EBHpTOXR4OBVp1ZeN7UiGuOm6of8pqqE5qLc22+OBKShrlc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsNvuLpLWQF6Qvhif1ehvmL+h7Uy9NRUOkPCnxSHCjRi6zTpzA
	biiKt2OcSSpN6+FNt9qEeP/3J8+QXcWlSwKj+qNK53TX9N+F7pzTI1n5MEyeoUnKG60c14JAiMu
	iNMpDaBmCHYlqCQkyvQsNnP98nkKkz6kKAU30enSdNmJQdLR8xCPL+Q+dheM=
X-Gm-Gg: ASbGncuD/1l2J+K6tNjysXIXB7yAk423BW+1mxX8HJE91+IQNdhYFTFpOs3olGXIGGv
	KxYZ3cnHvwaN8RYoa0WfPcOBmwnCbFRUqB+6tuUtC3g/Y4ybqPyoEgzT19b6sVGPIPT2W/FTbgc
	HlpRQjmV1af5mRnRtGe7LcAg1GThobZFuadhjKGDo+n61wgnxnRKjq/yJulvaCoqiVOu5rFCgGZ
	pMdBhz9Ijtc8dL5mVBDcRFouvEXwTc+ch+EBQ9i228yxxzVOxh78a7OGe0sOTNhBUAy7B3lxw8+
	N8+UrFHbMAcjSZdavMT83WFu7KtaXGMlqpXslShE41qUlGxKeCDT3j12d0R1A3DJSYgXtg==
X-Received: by 2002:a05:620a:400a:b0:7c0:a898:92fd with SMTP id af79cd13be357-7c3d8ed6b93mr383224985a.13.1741265155832;
        Thu, 06 Mar 2025 04:45:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwnifr+rtFdEJ8n5ks+Pxlxph16AhZEdlNsHmeChu9nXmI4OJIKeebQYhCU0Lvokc2XaQP+A==
X-Received: by 2002:a05:620a:400a:b0:7c0:a898:92fd with SMTP id af79cd13be357-7c3d8ed6b93mr383221885a.13.1741265155393;
        Thu, 06 Mar 2025 04:45:55 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae57a84sm169205e87.62.2025.03.06.04.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 04:45:54 -0800 (PST)
Message-ID: <1aa77e2e-6bb0-425c-9b5a-64092f8df9a5@oss.qualcomm.com>
Date: Thu, 6 Mar 2025 13:45:50 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] clk: qcom: common: Manage rpm, configure PLLs &
 AON clks in really probe
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
 <20250306-videocc-pll-multi-pd-voting-v2-3-0cd00612bc0e@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250306-videocc-pll-multi-pd-voting-v2-3-0cd00612bc0e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BhpdrylImrq8K53MLMA4TiitStqnVESw
X-Authority-Analysis: v=2.4 cv=cOIaskeN c=1 sm=1 tr=0 ts=67c99904 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=yHIa6xKSslqa2ziMgBoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: BhpdrylImrq8K53MLMA4TiitStqnVESw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060097

On 6.03.2025 9:55 AM, Jagadeesh Kona wrote:
> Add support for runtime power management, PLL configuration and enabling
> critical clocks in qcom_cc_really_probe() to commonize the clock
> controller probe.
> 
> The runtime power management is not required for all clock controllers,
> hence handle the rpm based on use_rpm flag in clock controller descriptor.
> Also the power domains need to be kept enabled during pll configuration,
> hence attach all required power domains prior to calling get_sync() on the
> device.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

[...]

> + * struct qcom_clk_cfg - To maintain list of clocks that needs to be
> + *                       kept ON or misc clock register settings

I have some reservations about this name, particularly since 'clk_cfg'
has already been used in the msmbus/interconnect space..

Perhaps qcom_clk_reg_settings?

> + * @offset: address offset for clock register
> + * @mask: bit mask to indicate the bits to update
> + */
> +struct qcom_clk_cfg {
> +	unsigned int offset;
> +	unsigned int mask;

"u32"

also, to expand it, we probably want "field" and "val" to replace the
calls to regmap_update_bits in some drivers

I think we may keep this /\ struct for things like:

/* Enable clock gating for MDP clocks */
regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);

while keeping a separate u32 array of branch clocks to call
qcom_branch_set_clk_en() on - we would then use 3x less memory


> +};

> +
>  struct qcom_cc_desc {
>  	const struct regmap_config *config;
>  	struct clk_regmap **clks;
> @@ -39,6 +50,11 @@ struct qcom_cc_desc {
>  	const struct qcom_icc_hws_data *icc_hws;
>  	size_t num_icc_hws;
>  	unsigned int icc_first_node_id;
> +	struct qcom_clk_cfg *clks_cfg;
> +	size_t num_clks_cfg;
> +	struct clk_alpha_pll **plls;

Some ancient or "non-standard" SoCs have non-alpha PLLs, please rename
this to something like alpha_plls


Konrad
