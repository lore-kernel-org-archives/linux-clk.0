Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C90F20E6
	for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 09:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753868367; cv=none; b=JoEBPi7bR2jlkT9FsL7aA5qT/FQBxZcDw0cmmCQO27yyJay1NCLfDZfSfybRAspe5U8RMl7vjUMOTJxcHvNRc7RFwGe3yWXOjya42vcvFgfkSD3J7OuaXXYE+bYQXSqWTZCn5ffuRN2xh2v95ihYEg0GFmHtijImKMx8d8LQy+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753868367; c=relaxed/simple;
	bh=FFwMpkhOYSBmnp5I4Qk19pzDCl+8/KeHG7bi2vq6ggY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TOjFVPJY9peMN41gkdV0YonPBZ+eEbAVM6Al7EqH8LRKQCjPnQxjLTl07YeZD2wzoc7K/l+TgfHsHSynJL+/o8ouUp7H0d27xb+D3O3Yz1ZQdq1Zv6N0kKlHx42gKWecEOF5r7JPM75J0NCe1hycxbw0P/fD6B3YeK3JCzSn9UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GAbYsTCt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GAbYsTCt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U7V9nr017410
	for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 09:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M4xxlIsUwBSemAmhdAK1Q9uezrhoKQ5cmwiav1SEhOQ=; b=GAbYsTCtbk/iLWdk
	p9LGJXfinV82t7J8kW6q+nZwKb3xfKmiiefeLdA6mXmsCzmN0qjzindinnEl5JzB
	lNzKpZR19fPOsG5/kTBsr9kT5b0PMDXh6Uorula6Z8SoFRzQl5c3Oj11Z+FT/BbV
	goToaiTtMBpjyGcy7VVO2xyPDiI4SwE8iwflU8VatxUbkHJpexyjRND5YZ7IZGBd
	xs4bLAyq67DEtTS/3sIZ2UO7CcJgfulQd4/Gvwl6JHejrkFo2P0qswVDKT41NHXl
	tebtiTkBC81TlG9sWscvwz/SlrBJmiVvQEKARC9Epx80JTI0t9qqo8gHieyOoVo5
	RPjtXw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 486v6y3mrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 09:39:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4abd7342386so16644531cf.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 02:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753868363; x=1754473163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M4xxlIsUwBSemAmhdAK1Q9uezrhoKQ5cmwiav1SEhOQ=;
        b=NRC/hJyV6skpWtWV5f5JzEZF08SW753MHZys/1mDmKvE00Ff7/MwQgvYGII6F5HNOT
         wWDiBd1w9o4XJ1lc31ltkR+iOuSjOa2Qc5omBgTDCeTnEj8+nsZrkEA5IztRB+WI0cMe
         +hycWMVbXgftUFodNecIZLEQXdYN+MiSpsPkYbeytWsdEAlu3ZtvuoBRQaEoNMtbQCvG
         2CveMhq/ReUWGKWyqvndXE4fBrTXTkhAXCya3nBTZnNUO6oGD9f9dAnqWOay6lblmhRl
         WJOOa9nIQ4SqMbdhAYNDn7jYEt920jRkA5RIB4k+coBR5H2KCgc7R09z18QEPUIY695k
         unUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxS5vQ3OFKN8y9bymvNcE1YENOvRN3q7rw6OHNneIrCzLxMtEgF83gaXorBPQ0NyoLyeVZLe2tTXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjRHdR9ITp7e0NPCVTNijdD2gUuK8m3dg1wfFrA4ghIn52cvJV
	860tWm70uV25wFz5yOF/WfIKnAa1oApJ/W19aVUJlgyWnBlOGT6pIh26bC/efo/i7LdJgo/6y5J
	A1PNZzJBVBrZqB7ifMzU0KMEluUunaq01q7JBnDs1lztr2AuL0gErnOUZFV5AVTk=
X-Gm-Gg: ASbGncsr1oOMFUH4t2AW74SXsgQbXV1ugkEArqfbFtrgIztIDZ/WHggC01hg7tTjCcl
	yhm/ffkGEo5FenuqATXotmUnhEg5z+uWXx3jhoGkVAmjF3hKbMLblRdvsHluLP/Da37x3KOBS9C
	uhBDh2Mq0qRWf20YMV304PbydGWrBXDSywZ29RXCopEPotm9cRKPnL6H5KzmS1Y8qcB9V5bcXwc
	lr/NHpuwLyZpkxtCTxdSVp1YlznVw+5TKQWAlqJKPe+StKZU0KUX+nZiQEsX7wY5Zw4jKgWNrEf
	mNgHV4hcZWWaNGrh8PFtoBE4K0/ncahJf11qZpt4gvSiF27KdIcVGETGWeU4oJ7IL/5RiF6mni9
	fCIMxruUT7zEAET7GKQ==
X-Received: by 2002:a05:622a:4d91:b0:4ae:dc63:462a with SMTP id d75a77b69052e-4aedc6347b7mr22328891cf.0.1753868362916;
        Wed, 30 Jul 2025 02:39:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNmC57TxqA5fJorGH135uruMdHSiL4OQkD3t41/Mi83JfFgYns87im7Ap3ZJoIyYR/7aVvuw==
X-Received: by 2002:a05:622a:4d91:b0:4ae:dc63:462a with SMTP id d75a77b69052e-4aedc6347b7mr22328541cf.0.1753868362361;
        Wed, 30 Jul 2025 02:39:22 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af6358acb2asm717167866b.56.2025.07.30.02.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 02:39:21 -0700 (PDT)
Message-ID: <3c69deb7-3a23-4627-a64f-3179785bf6f5@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 11:39:18 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] clk: qcom: apss-ipq5424: Add ipq5424 apss clock
 controller
To: Varadarajan Narayanan <quic_varada@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, ilia.lin@kernel.org,
        djakov@kernel.org, quic_srichara@quicinc.com, quic_mdalam@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20250730081316.547796-1-quic_varada@quicinc.com>
 <20250730081316.547796-3-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250730081316.547796-3-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA2NyBTYWx0ZWRfX43LWP1vunImn
 OwTEPJJR4IqNVQm9wdiNhS+dJm+sHByCxIR/hPdp51hZMGyDWzoRQZpKCMbi03tmmF5KI3+8V2h
 60tKAiE+iXf4Ebg0xM10h3hbuVcw+6pizh0BnxAjx0dEPaW+BUegjfQhzxuPm/t9vz5jvDBXHnV
 f2d+MKQn68CpsV6uL0lB6xuXrUsk02z4u1dziUxym0CXUyHRv043x0x4zkSz/dRawK01JnQ0wnW
 Jsc+3FZdwaz+AqJERgW+zyq1HyrGmmX+RRKWicTysFdUFqHovgM0/LvwODqcTaVC9dJ8JlC4YL2
 +8rOFLyAzhGjdvB1toYktAHa3J86bIBsBGXhHdYxrsVqh+DmuaYbDEWqfGTfOG4eoWCoMUjyM7q
 Q7gitNsOFqoKQoh+Sx/vssetTgdK5gOCOIXdfadX5+SoCPEC0bG7PA9hWLKe7vKPMk0FtZku
X-Proofpoint-GUID: Eua1iVk3e3uWI9DePTyS8EUYsbDceGUf
X-Proofpoint-ORIG-GUID: Eua1iVk3e3uWI9DePTyS8EUYsbDceGUf
X-Authority-Analysis: v=2.4 cv=QYlmvtbv c=1 sm=1 tr=0 ts=6889e84c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=i-JfjlNmehoY5ENsB_0A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300067

On 7/30/25 10:13 AM, Varadarajan Narayanan wrote:
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
> +				.fw_name = "xo-board-clk",

This is not consistent with your dt-bindings.

You should instead define an enum that reflects them and use .index
(see e.g. gcc-sm8750.c)

> +			},
> +			.parent_names = (const char *[]){ "xo-board-clk"},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_huayra_ops,
> +		},
> +	},
> +};
> +
> +static const struct clk_parent_data parents_apss_silver_clk_src[] = {
> +	{ .fw_name = "xo-board-clk" },
> +	{ .fw_name = "clk_ref" },

Similarly here, neither one exists

Konrad
