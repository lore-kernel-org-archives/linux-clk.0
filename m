Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB3815E8B
	for <linux-clk@vger.kernel.org>; Mon,  4 Aug 2025 12:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754310286; cv=none; b=onR9TJkV0w/Cva4KD06ytqdD4ITbj3hiXJYpAN3n5pNSmYZTkFq+snCinHj2AYItfPZhGa1TQHZFTaog7vpPSvsnzHK2WqYjRodG7ZiDr8tFwkyK12GPXbPygKTbh4Qz131DfosGdwm6WM3GBNRJEuDsPVLiKB4uPvB69H/aPxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754310286; c=relaxed/simple;
	bh=X6OB+y3v7wjXgZyMvUtX1QmaETTwv0OrP/MFdJ4tRaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=saltCuO4eqeTGCuSuZrrMDoedWqbDQmuP57o1sd5AyOdA1MaRzGsh2plff4/DcNqx/sACp5yi9hRX9YPHdfvaByKlk24r8RMtXTJ11jh70L8bFePISdjJHmRZMCrTT+aB+aAq8e0cHcE2LuqOFB/XG4VJXOWZGEWYExUfTMdc7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+dEfGu+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+dEfGu+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5749G910023370
	for <linux-clk@vger.kernel.org>; Mon, 4 Aug 2025 12:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V7q+KzrML4Aj2hTJom5AvJd1j16yraW+cQX6AncDhrc=; b=S+dEfGu+Xvo2PSL8
	sx++OpYqhWZhQYK2w+Jt7kWzii0uNuWEIaGCZLJvn2m0YJ9LhsIPyrr95b7NPlY8
	fcsr7jL6N9Un/DKhPN8pCT/WP/Rv6YMnwHMLzkSL8X1DovWhHMAsM6tPPWeFOftU
	e3AN+MIHk1VpfVDU0BHeSeml0fjNgt/jn5uX3cADrXjrAzqMG37r/P2xxdgQOpOg
	tHVLDuLtJPVTtkGJqNd2kpadPzTpXKN8/eayVmh6i5ArjhfiQCAUy54Y19WbNZjU
	aRNhGD184na1y6nTdwyxFp4Bab1tdENR7VGvTvAwpo8wWy29ZTWFiU5MumNPcc6x
	0ZbG7g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489a0m4vfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 04 Aug 2025 12:24:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7092a001573so11000986d6.2
        for <linux-clk@vger.kernel.org>; Mon, 04 Aug 2025 05:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754310282; x=1754915082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V7q+KzrML4Aj2hTJom5AvJd1j16yraW+cQX6AncDhrc=;
        b=GUmOstNuO0lMQ8+44HS/3xxeWogg0r752tIIHDzTjhWlrRECKGJD5DRL5yON5y6tI4
         G1pSfWVPGlKo92MQj8gP+zeY4j7aozOTtFO9WxrHMYSM1cxlETpsOYLBn/lvlpVshmCU
         39+oToNo7j8RKF3xdAM3eHKwyMwtfMSZR/7ZhkeuthKkrWMrHTO4dKq1Mete8dFCf1T7
         l3pIUv5QDtS3b4s+DgVCtZOLrX9Gw5/XchJwY/rMQmLaNLwQTJf5mRToslEaoLUerOof
         kqH57NkdCRw/bVm2e7YQ1AKO+9KjK9gVLrG77oP3vyP2bC2Ly/eQEiYW2tdeBZ510tCI
         HHyw==
X-Forwarded-Encrypted: i=1; AJvYcCVk6ncaUAbkH+Scr8CFrHgvMUAWZ+izbfqg6Wcvh6TwadSBo87rdGEpPRivNPBKka3Kxm4YndMjcN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSir/zzr1z8GCdBUN40PXeANRkWb3S4M2LL1q4GfUpnjJOay/P
	RTrzeMvLG0nIYlOeLYKEUW0Vv/C0NmZJqf5HinwBk3kc394H4C4HsrQMjKKWqeRgpeg/4NLeAx4
	0YI7A/Rd0trio25w7D4PMeIj5/p9n4E30sruWVOAbZFtLQn1FYVEud028vjgnkeQ=
X-Gm-Gg: ASbGncsWyMHU3djweNU9nHJwRs3IBCEMO72+OWncc+RsF/yM2VG0+5FR32RDlYtFFDJ
	erLUZk9N3yt6NPDm0Qr/G6EBQiI42P4HgvvAIwkBGYNnRPgfuaaqj8GJyWbOakbp/JtWZZTzOkd
	crnVNvkiNHdORu59hfTUnwgcm1vbuILsNmSzKiISyoUNsmJHX6Y/h19o7HFTloq7nb5juKfYqJj
	59vjf1zZyju0M+7lH3V2FatK2Tr4VglxAP3ndD4U4XyvDTkuBPaOIwDtrvksaOnGvhM+vY8pOGg
	RvpKvXcxZ89FKwwGvL6bXa5PJySXb3/ORzgA6xNvVm43j94L2O21G5yG9kMK4AZP80r37RiKbV4
	E+MCU9z1jZvoAvnh8Cg==
X-Received: by 2002:a05:620a:3705:b0:7e6:81d9:359a with SMTP id af79cd13be357-7e696361fc9mr598165885a.9.1754310281981;
        Mon, 04 Aug 2025 05:24:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmi/HcIwoXXkI8woIdhi4ceFmLxFr8bFlUqDHXyyyLGKaBXdFINx4NRwp0ys6ezcnFAInnrw==
X-Received: by 2002:a05:620a:3705:b0:7e6:81d9:359a with SMTP id af79cd13be357-7e696361fc9mr598164285a.9.1754310281537;
        Mon, 04 Aug 2025 05:24:41 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0763d8sm736128266b.2.2025.08.04.05.24.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 05:24:41 -0700 (PDT)
Message-ID: <93fc49a1-ce8f-447a-9208-251e74d4bf88@oss.qualcomm.com>
Date: Mon, 4 Aug 2025 14:24:37 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] clk: qcom: apss-ipq5424: Add ipq5424 apss clock
 controller
To: Varadarajan Narayanan <quic_varada@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, ilia.lin@kernel.org,
        djakov@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Md Sadre Alam <quic_mdalam@quicinc.com>
References: <20250804112041.845135-1-quic_varada@quicinc.com>
 <20250804112041.845135-3-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250804112041.845135-3-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JOM7s9Kb c=1 sm=1 tr=0 ts=6890a68b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=276k8YKwey--yEOqDJUA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ohF1a22_BpBFTHQ-JpAOLQ0kR3dfvf1U
X-Proofpoint-ORIG-GUID: ohF1a22_BpBFTHQ-JpAOLQ0kR3dfvf1U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA2OCBTYWx0ZWRfX0l3ix9mb5vtl
 9EtGC9TWwPlDJmHWZnlgtcb3YCx8nJwXhjlmbQZOk7NI++v+iCWiD7Zx0Sp05bGJX3pYlViXlM0
 wZCjOuwBA0W69DCgupkZcqKmVI7hi/UomZS0APSM71rT8V2I81xuQA8EqF7IWg4VJLh0QClcm46
 N6gZIZ4GVoVI8UIjOMKfRyyI+xCq47vQBAwgwS7iTfeQ2wf3U/myX2+u4UVXXvR3S0lbxsfuABU
 wrb9No7xH3wYyDRKJ19MHYtZc9yeG/AYAg8fnAgMekI1S1YltmFWL4LAkuvaOiAzmdF32h/O/Fp
 QgV8vBoAIUGr+cem/L3bTIQuyJvrgZsyPCU23CE6dFiIS3z2ejxog4uGtoN/HeKR/wKIRafvADc
 BqQaVwt1UDZS8THJDj88hwASnmd/oq1mInn2KZY8f4mx6GjOt2Er0R+ZNAefKUQx9oOvl9pJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040068

On 8/4/25 1:20 PM, Varadarajan Narayanan wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> CPU on Qualcomm ipq5424 is clocked by huayra PLL with RCG support.
> Add support for the APSS PLL, RCG and clock enable for ipq5424.
> The PLL, RCG register space are clubbed. Hence adding new APSS driver
> for both PLL and RCG/CBC control. Also the L3 cache has a separate pll
> and needs to be scaled along with the CPU and is modeled as an ICC clock.
> 
> Co-developed-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> [ Removed clock notifier, moved L3 pll to icc-clk, used existing
> alpha pll structure ]
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

[...]

> +static struct clk_alpha_pll ipq5424_apss_pll = {
> +	.offset = 0x0,
> +	.config = &apss_pll_config,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_HUAYRA_2290],
> +	.flags = SUPPORTS_DYNAMIC_UPDATE,
> +	.clkr = {
> +		.enable_reg = 0x0,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "apss_pll",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_XO,
> +			},
> +			.parent_names = (const char *[]){ "xo-board-clk"},

Parent_data and parent_names are mutually exclusive

[...]

> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_huayra_ops,
> +		},
> +	},
> +};
> +
> +static const struct clk_parent_data parents_apss_silver_clk_src[] = {
> +	{ .index = DT_XO },
> +	{ .index = DT_CLK_REF },
> +	{ .hw = &ipq5424_apss_pll.clkr.hw },
> +};

You use indices here /\

[...]

But not here \/


> +static struct clk_alpha_pll ipq5424_l3_pll = {
> +	.offset = 0x10000,
> +	.config = &l3_pll_config,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_HUAYRA_2290],
> +	.flags = SUPPORTS_DYNAMIC_UPDATE,
> +	.clkr = {
> +		.enable_reg = 0x0,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "l3_pll",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.fw_name = "xo-board-clk",
> +			},
> +			.parent_names = (const char *[]){ "xo-board-clk"},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_huayra_ops,
> +		},
> +	},
> +};
> +
> +static const struct clk_parent_data parents_l3_clk_src[] = {
> +	{ .fw_name = "xo-board-clk" },
> +	{ .fw_name = "clk_ref" },
> +	{ .hw = &ipq5424_l3_pll.clkr.hw },
> +};

[...]

> +		.hw.init = &(struct clk_init_data){
> +			.name = "l3_clk",
> +			.parent_hws = (const struct clk_hw *[]){

"clk_hw *[]) {"

Konrad
