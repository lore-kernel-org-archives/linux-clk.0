Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD31E412C1A
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693368; cv=none; b=sZL6yJc1XExYyocaclmOQIheW6GJMFvjhFMK1qMyr8TrmjNeBWyYJrA990pyqMwfrW+dCsiYIBsU3t3unoeUDNjKMteXLnqmcLti64K6bFVYqXTb9Dn06KoTyYouB+tyvUCfOft5Oiyy9Bn4OtPpXxbhj6T65r8NerQhNk+IzuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693368; c=relaxed/simple;
	bh=yQK6BU/jG8kZpwu5by/foagCc8x9efnKwLqHq52D3Yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DyrsiNQg1i6XmXxm0W7CO1XNd+FQO6ZFN2/mhhJBEAAGg2PWJj57H8hTV7d/Gh7EwX/DSy3SMDpabxzFq0owGuCielzhBYFMAoVt5nHgN9rhMxIAtqYOCMLpcSlt47ocHq0w1fyKCPcz6ZViCl4mE0nHDxbAdQhgoapSB9XQq4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EiQnZT4g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D+y6Eu2/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EiQnZT4g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D+y6Eu2/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E7fafV273926
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WBklc2G/busGjck73g0DPLTntqH4yid2WXdPSTnv2u0=; b=EiQnZT4gbhHaU+Pj
	kF96ZKDTJmzdLV0vYK4mDYhAiCUq/KsWIwMgBHFiTSDy2UzLQQA2b5OHgCippIZo
	uJYs+Z7DBuUokITFWg9iE45+ysRERVWegCOUoS9kKQdkHzszk3wMd2eZi05WiB6+
	m9ROl4CNEPZKng+17KrJTpQ9/pzwXrKdEiKYh2GAudIxxBl5GWI7QI3XxN4OU+D9
	tCjfqp02HD7neJMTQ8G5zrk60pyHjjoPys2HfwW6GMgYE1NRcQ0qNqCWS8nzacUD
	4anmEftPIjTM95ie1469AyH5FgW7lto/+qYOQd4pwpRyqHHvdjsTvElfxFrEK8Ez
	LarB5w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1m42j969-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:42:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5ea36f969so817137a12.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 00:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786693358; x=1787298158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WBklc2G/busGjck73g0DPLTntqH4yid2WXdPSTnv2u0=;
        b=D+y6Eu2/qDFIqMgjVlNpVmrw/je4jW5z6Am961uQxgSV66G/2sgOWkygPIiy4m39zn
         lYLl08SBYGEv66Ye4A/ESuRjC+r4zIneTDn5+rtcmvCpbtOzMjI5qAaZ4q5vNasIt2yR
         QQs+VxTHU6vypoz/Hs9RzCRquinzsn36FirUdPQzbE9POOAXJumuizGx0HcT9mv4vOVR
         NLMjOUwQ25dOCpTf/SmD/cbbm0P1Bxjb+Bpc0tIVXE3PR8pDYxgW9Te32NcUVlCu0XtW
         R0V/8ATjrdaEi3FTociWiUJsIMfwz32Dnk/qZBRuJvk8kw7c1A0MkEZlQvAW6Pu8Oee0
         x56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693358; x=1787298158;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WBklc2G/busGjck73g0DPLTntqH4yid2WXdPSTnv2u0=;
        b=shiB6ayt32ZFZ2AB5s+9L6wMT03wotwf8RY3amZX4Qw8qGeuLNooJixiWvifr7xZLb
         IFOHvzeaNSeMgiP5cKeDGpQ+FqEVTsIFNeszsSH2lfOclgbHJIDJieWMp3PW7wtZY6GP
         vjjLR+LLDKZ7ny3up4rEcnuB3HQaQGJjhx1rkqDpS0Wgs85RrUM16fxqt1f1rzPkeavL
         MiwkSpjxJBGrgT+kT2SDsb8wyL4vZY1zaD3sn7zfklMtN5seNqlhVOWKnJsjI/NA1798
         QkC+v9s0BuLvJE93D6q/+nO/ENtx0stIkIuFb7fLQ6JH32EpknRkKqL6FaV2ZECjPLdv
         ar/w==
X-Forwarded-Encrypted: i=1; AHgh+RqjnrWt8J8QMah7dkKowYcmbr/snEIkkkgfAvVw1p62x5AyIF3CfMoorH2vp/wYle6e90JPPZuOoXU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2bkzdPuD1DTL+ZjFYWrMmv+wF+slTIUX1FgYctR+Jkk3yfH+u
	GkWpRNiB0gZUZRNt3QaoJM2fjLkPrMKH2CnLdMsy8d8n8nVammpME6flX8DX03sz1PnIxPXTbac
	BI9tqOBe5mwEvI17y/Z6Q8ROloPdAatYAMeeThL9sEQI/ruD0ctxqYk5U7LEv55I=
X-Gm-Gg: AR+sD11F3WeMpZ3iHBMJqq6EVd2JkkKg+D4phEgL03Y9zHU8Mk/UIg6liizAb+dTTuV
	DRFWvHOUMoGPkXdWVKYs9sXww4i1N0eJt+Tb1qIDMEcmRJPYNp29q8qdOljhtuDqUZbQt41KG0C
	GVq3GNp7mB+8s6pLKtS07zahsVw3CpCcOo2WrYImonI1OHuhAnKWVaBZi9w+xOLXVffHM8OvtTU
	JtudZLYp6Er1aAiiQgbm9oDsk3mELBibmnRaVIEeS/5ojFAovVapsZRMJ8TMnb5ojrnIaPeIJNn
	3ZLZUebz6eea4AwrZTbFrNQOaARg3xS9mFouprGpqhcHQYcelPrear39FukTAMcnGHKlZahsxEo
	+AWi72R9SvcS390YnH0aOEvrnqNY4br7JC+zic3HnNi2V9e0KiGuq/DP7WboddZRtw52Gs6JPi1
	46DI/GSH1BLdr1Kc2vOzo=
X-Received: by 2002:a05:6a20:3c8f:b0:3c3:b57b:627d with SMTP id adf61e73a8af0-3cc71b83e99mr4271591637.12.1786693358529;
        Fri, 14 Aug 2026 00:42:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:3c8f:b0:3c3:b57b:627d with SMTP id adf61e73a8af0-3cc71b83e99mr4271542637.12.1786693358103;
        Fri, 14 Aug 2026 00:42:38 -0700 (PDT)
Received: from [10.79.117.20] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc095a3f9cfsm136922a12.27.2026.08.14.00.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 00:42:37 -0700 (PDT)
Message-ID: <c1baeaa9-5145-4a3f-bf14-f50ce1e48ae2@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:12:29 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] clk: qcom: Add Global Clock Controller driver for
 Kuno
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-11-5e0ede4a0c72@oss.qualcomm.com>
 <h3mptj7zar6lev6qqsuz6q4gqkywu5djadjglzsjztzqystabz@555y7a4xd6ux>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <h3mptj7zar6lev6qqsuz6q4gqkywu5djadjglzsjztzqystabz@555y7a4xd6ux>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I+dVgtgg c=1 sm=1 tr=0 ts=6a7ec6ef cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EkQsDeFWBQwVCp19dG4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: F7CwFJ60q5i_Vb0DYK9ZfdPEFMsZdJlK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfX5emHl3GVFtYH
 laHxzOfkc9A4/4+1RRN7NioIBYrYLYQd/DHNXoBAvic87smXRaV3gVV//k3TKO6H4a1c+B7CC1N
 RT+4F18chjlmcNPeAWde5cYJdXfH/gfEndyzqLAE5v17Zk4PKZGQj3ns1I+H/JkQMlDuvVJPaA4
 sWk37IW8QdiAWfF1M40dKv8wehx/PQGheUwKjhhUkdfIeywM79MYdXjy7dO914DcLTH0H/s7NMG
 2UypkGmagjru6naD7BkjC0PyLPHtXKA0ZEe6NJf1WVyND84DFJOWAnSJIHRV+j0zALaHuZzCwKV
 IJzWJ4x2BV7uZqa5rAdWsxL1pD4tBEOTLFRZwR5quTYFca6kkuB0DImpnhgHLVwtvfWGZfAXwE0
 Ga8o9P30yU9LHkUddRdkRduDxhEpt1phFEvYQwQgRpRgrRSmane7GuAEvpMayWkR1RdP6Ls/2fd
 CAASiIZRlIEcUeHcfyQ==
X-Proofpoint-GUID: F7CwFJ60q5i_Vb0DYK9ZfdPEFMsZdJlK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfXzBJ1DwqHbibT
 L5GSQS8b0yyErB2YexC8fv88m0ChZhLiRvz+vY03L/bAAiNOSmo9sMP6nPW27IVrVpd0vRWDS2u
 uLYyQkuRcN6veP/7xlVx0MAeanMyyto=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140059


On 8/11/2026 6:36 AM, Dmitry Baryshkov wrote:
> On Sun, Aug 09, 2026 at 12:57:10PM +0530, Hardeep Sharma wrote:
>> Add the global clock controller (GCC) driver for the Qualcomm Kuno SoC,
>> providing the PLLs, root clock generators, gate/branch clocks and resets
>> used by the peripheral devices such as UART, SPI, I2C, USB, SD, PCIe and
>> Ethernet.
>>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/Kconfig    |   10 +
>>   drivers/clk/qcom/Makefile   |    1 +
>>   drivers/clk/qcom/gcc-kuno.c | 1438 +++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 1449 insertions(+)
>>
>> +static struct clk_alpha_pll gpll0 = {
>> +	.offset = 0x0,
>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
>> +	.clkr = {
>> +		.enable_reg = 0x7d000,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data){
>> +			.name = "gpll0",
>> +			.parent_data = &(const struct clk_parent_data){
> Whitespace between ) and { (through all the file).
>
>> +				.index = DT_BI_TCXO,
>> +			},
>> +			.num_parents = 1,
>> +			.ops = &clk_alpha_pll_fixed_lucid_evo_ops,
>> +		},
>> +	},
>> +};
>> +

Thanks for review.

Done in v2 : 
https://lore.kernel.org/all/20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com/

Best Wishes
Hardeep Sharma

