Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7574B29ACE5
	for <linux-clk@vger.kernel.org>; Fri, 21 Nov 2025 17:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763746002; cv=none; b=fz2HS7FT2w5mD5feuCFalRyx+u9iT22hoSP+t2LKCRuFpwgYFrP6jHN5bRR+XVU7g0NmltSSRy1gUSlYpudVv5RYDFkz8zxFCo73qBg8n9VKf2QZ8FULYbA/kKZyVEB9SXsnEcNdoha3tLZ+BC6TLLMWz0KxFaAm7ziLthCr1zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763746002; c=relaxed/simple;
	bh=nOOq1hUExeYezHE2FAs+O6DXeKAXq0URUtz+DS2qY1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E0fd85UYHpS1FWYo2t1RFD6cpdXCpx9Q0pItZPhdOChMisUuqPrlDgisH++uZSCkwBhnWh6jw2i/6xhu6kU61NURL7jrQmQk2steNsVkzUX54pncZnvpsL8v6kBrQ/nama0t9V9k+6EYmNM/WgxlyLyfwnpgdWsqn12PSN9MUYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S4NFyHh1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=im+lyigp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S4NFyHh1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="im+lyigp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALB4KPR3911797
	for <linux-clk@vger.kernel.org>; Fri, 21 Nov 2025 17:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IQMIdaU08keuK05Zt/9Ybw5dGtW3CDvmzUEYJZmZs9I=; b=S4NFyHh1INEaGcf1
	ad4772oL1jgph4z8umDq12unyDoOH23zehDK037lWDajk/DZ8OMwscRjNl3hYavo
	IAm2Box/bABHLZqpPT05Trb1ss4g1nMMsDhaosl83l9k5FIQKsmMnj1rqT4/ud8w
	8B1Cvag07EdFZs0VFzyvHbwDTVu4N1VoE87FE+rjI18vrxQdeZqaujiHhW+cWm1z
	Lm8/NBqTAv/aaGuATfjIJcEOJEWc4YFQGHDt6uwuXitfmfdl3aOyPkEmeY6D5azY
	ufGNlJiNHtOSjgrnwUiM10Tgb9K2RJwuvaPVvbsiaHDLhdl+NXNUZnxws6nY41+R
	/DHtjg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajpvsh6rj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 21 Nov 2025 17:26:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b9208e1976so5062456b3a.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Nov 2025 09:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763745999; x=1764350799; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IQMIdaU08keuK05Zt/9Ybw5dGtW3CDvmzUEYJZmZs9I=;
        b=im+lyigp7GJIxvN7tboVKvl9Q7sjCWI9bGlqnpfCvWcQKJv9qbnLLHLcjpC/A31ZH+
         Scp/sM8fpGKY+cqsNa8o8BQ4LG5691DYFPnPdj/YYB2hB2iN8TMq37CAA2G7F+B2np7z
         Jxd3XWp5e0tx1Kusq9bkLXo8w1uBacO0KzJeD4t7J1nmZhOkBsjqB9NcXifDSaIDN+yn
         MYZ4Mdx7tVU6h3uM84ONaIjn9yND+K0UTHEuoAV63HQk9lMsDDvT3+4z2RxDdXVTyEU4
         jSJ3CF8f4htjK7jUfiLm82lfTyOfbO3vURHNNn9Y5eX0FKUuBFffrJ36iIetMEHCFilD
         ojFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763745999; x=1764350799;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQMIdaU08keuK05Zt/9Ybw5dGtW3CDvmzUEYJZmZs9I=;
        b=tvcqYEgLnmlP7+hWSLZP0sN4UcXxkee3cJtM2ICPZNOf7QU0gARDhS/oqeVoDFU2LP
         gz1c/+n0O2/5Cmb2Ooc/dXn0isY+tJ5cd7J64rbylwgJ2MbKJLdAP8LDEofnEr/Wzkdb
         ITMv1IW5z3Z18+2hboPIArZl4kKvcjJFp3oqOhYd5D83gdtxosSh0fTd8e+qGMzv3ogc
         qoIGJs0Mj50OWNB9/layGYezD5TSeqRifCqbkF/Go7nOvcJF/93sNSWvgPu7gBk+O2tl
         UOxResNXxuFj+L919GZ3qCC2PT1TgcJZ0EELHqZTGVZY8obYJXS5SW4zNrRNraySdv9m
         RP6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1VURNWYFtTzAmkS4YomwpoE5GtSXxR5Qk/k0vF+Jw47PNsVnI38E7F9GC6nFk1WBCnxuDpf/a4Yo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfrBfbi5j0/ULMcpL4Du4UueAVD7PGx6oABzj9N0KT0jltH59o
	i8cnZaPGP2nxh9sWr8Erij61QL0+Og+4oPEX32FGKrfwFEY9XQD0VSnmIF8k+HK+q0+gzh3J5oE
	kO2suQPrbNRPmyTOsaDRwpImt+DkiWiO1CzTBHBGCwUeqFpJOoGggnvW0shvGFwGq1IcPe2s=
X-Gm-Gg: ASbGncs0JyAOH9Qd95a8yLIyQoF553BgfDB0lF4OGAjheXKE8O8oJz5QZxngH4liPxx
	9IIa/DBxxQ8wQfUZaHJBMGfQkFjK/xMDNDmPc9onZo+r44TCTi//o4HZuOroT21VcZZYcAbRqs9
	iSsVgXJyTzova+e3j6OurAhHgyFpm9FbZYMEJXXjKob7y8SFsEAevbmKGaaP+DZeTVzFxsKn8gs
	LNTtakjEXd2Z/ha6fne1odjSXJ51fgZfQgic4s2WrAsEO6fTxnmk++o4xxasFX3b5uUNGflup9G
	h/+G4JQT3t76pZ+50OFsSi/EV37VC5Ct+4Q5fUCHZzcO/yNHSlHvj954o0HQpgNlVDNR8X0LmkV
	w3d4/NAIo8ObLP4zmHr3oNzhHb61R6MKQbpUV2g==
X-Received: by 2002:a05:6a00:2f08:b0:7bf:5011:d1e0 with SMTP id d2e1a72fcca58-7c58c4a7988mr2586445b3a.2.1763745998944;
        Fri, 21 Nov 2025 09:26:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH56aTpsA3S0hWTXDgIt1z8Y3LX8eB9/2cGmDjNKQmmX/1ntjarn0bWDJ53np2JIBkBlsDUng==
X-Received: by 2002:a05:6a00:2f08:b0:7bf:5011:d1e0 with SMTP id d2e1a72fcca58-7c58c4a7988mr2586414b3a.2.1763745998433;
        Fri, 21 Nov 2025 09:26:38 -0800 (PST)
Received: from [192.168.0.195] ([49.204.24.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f02423f6sm6634689b3a.39.2025.11.21.09.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 09:26:37 -0800 (PST)
Message-ID: <a4ac2816-0a39-4d35-8136-6a4f38122219@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 22:56:32 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] clk: qcom: Add TCSR clock driver for Kaanapali
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
 <20251030-gcc_kaanapali-v2-v2-5-a774a587af6f@oss.qualcomm.com>
 <71e0d879-63ed-49e7-9bfe-c5cd8e0ca8ba@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <71e0d879-63ed-49e7-9bfe-c5cd8e0ca8ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9feDm9xRA3Lxpn3nMRgqDTDIloXBXfmM
X-Proofpoint-ORIG-GUID: 9feDm9xRA3Lxpn3nMRgqDTDIloXBXfmM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEzMCBTYWx0ZWRfX7hmvC5JXLLMq
 fOfNBoLIKaMOtumm1SIGiv+4yXv3ZvHZa7IYlsIGmfjqiBW4Q6LcHE85BPaJJEGH+AVQ8/CUJE5
 27XEl9P/dF8GQwmRm9TwyfNIJunPp6fH9EAhvJEQ9558sWdlHs5OBkVwUZ0Tw+H0wuyu2t8CfMg
 OWnmtxc+S4uGzCckR/vVUoE5bu86w4y0BRQRVy3/W9t9CRQWcODjaoJ3vQOSrZBohPJKGlIXAF9
 OcxnT813gaiSrZJhg2AV186vU6BFVoi7k4BGSU+EN5bHtkpr5B7JNyRbhNTimeMOhdkhEDcvyAz
 j2vZH3kUoWHNmCmVWJgikH8mO4zRSOJAWQBSoJ6p/iz+ptmw8Vi/42lMYa7pgFnw12uaVQ2kAk8
 rfWc8CtYTKiwNDSt5gWP7tfzN4arrw==
X-Authority-Analysis: v=2.4 cv=MqFfKmae c=1 sm=1 tr=0 ts=6920a0d0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JNCjnJIMGS+pfmg2DM0HVg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=RaHAS9VqNI6p-X5hwAwA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210130



On 11/18/2025 12:14 PM, Jingyi Wang wrote:
>> +
>> +static struct clk_branch tcsr_pcie_0_clkref_en = {
>> +	.halt_reg = 0x0,
>> +	.halt_check = BRANCH_HALT_DELAY,
>> +	.clkr = {
>> +		.enable_reg = 0x0,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "tcsr_pcie_0_clkref_en",
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
> Hi Taniya,
> 
> Here is a discussion for tcsr in this thread:
> https://lore.kernel.org/all/01de9616-825b-4fbb-83cf-
> e0bf91e8cf39@oss.qualcomm.com/
> 
> As TCSR_CLKS is a part of tcsr block, we should merge it as one node, the address
> should be start at 0x01fc0000 instead of 0x01fd5044, so offset need to be added in the
> tcsrcc reg configuration.
> 

Yes, the next patch will incorporate the changes in offsets of the
clocks and the device tree node needs to be updated.

-- 
Thanks,
Taniya Das

