Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E6648425B
	for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2026 13:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330953; cv=none; b=DiGsVsq5xLM0MvNDCTNdbcqrVWMWH+ocQeIP+NEz1JQaATwlaV2AWEmrHCIsDczdPdCdxO/o9HergSgl4HarwWVTI6BPwSN+vTnaqOR19NuZ+ynRnNCUIDVnURk/kTDUkmTV7/Lfkfe8PuW4AHWSMmzk3yZD6ChVB6JIr3KGeos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330953; c=relaxed/simple;
	bh=nyAse5/UJpPEzPnHBsekh7k3RbahKU4gt6HZXzUrR1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fkxfKGmygA1CwdG7EjBADr3gT9v0SCktBp8rOC13fH5i0tkzceSfGY0tF/GUfUlBVu72KtaG/dBxeJRVUvWS63tByEwB25I81B2L1lXMRYoC7l0aK+n2dpkJ8TGYOZJFYJQCcngAFsnlKDZiXtV5x/erYLAy2FmfBXWIl2j6V5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZHLcFSv3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O7e6OBR3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZHLcFSv3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O7e6OBR3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TD81Sf1839704
	for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2026 13:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	piyeing5sm3Jpk687UCAPCcfeTDfpVNKUnrDk/15p1k=; b=ZHLcFSv3juzbArsA
	6t7SE8BFI6TpbyTrvw/ByZsHM6w4xJtgx2FZBQoV5lAB7xyASms1FOoKEUSLIB71
	gyl5Bqtjr/TnyZIjvT23S4KyzzjM1L+gza051JAcAHINzOcUPciugapyuaMjmcBR
	pYa3DIRa7VC8JajmET3HnNpmKCjiYEzbKrHcZRx6MOWFXoOfDeFACi/CK1cPMJFD
	3aSYHSqGV2i8ixBMM70xiOHF17IM11HUXa77q/GXvHIIqZcJKa7T5bEUKqJPEHXU
	jvTDuGtAHSStpUtM+kglvcHqyfnVDRv5loc0INK/+Dl3/q1uL6EaoSPAT7E3k70h
	5Wsu+Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqhdp87ay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2026 13:15:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so9370785ad.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2026 06:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785330950; x=1785935750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=piyeing5sm3Jpk687UCAPCcfeTDfpVNKUnrDk/15p1k=;
        b=O7e6OBR3gXGqd2I7OTFNTm7NgOp1Oz6LHhFevrCdXUQy+rFxewLu6IzzitWzg9Iu8a
         30jK1meIMioLO4AZqIS4NVLLgvJHxYiizRbPz4p5wmOTaZ7D5Qi6HEdMnFb9vrh7Zf6Y
         VYg/SsD4SWveBgM8sY1mTY+Ma1c7BuTG54GmEeOK97HAV8aQHZkTPavPIYzBlurk+Z74
         nLYLjvpoSP4H4A7d1lPrqtNAWe4EUPr+fTdLfvw7rDvRbLyBwbnTPu8BKCOsbRTmyWtm
         yC56WgDOCsWmStoFHAJYYZT443Vr2l4Nqu79MxVc2iWTNU9h8fLWm98Ngst+qKb2iW9+
         3xSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785330950; x=1785935750;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=piyeing5sm3Jpk687UCAPCcfeTDfpVNKUnrDk/15p1k=;
        b=olzxy9TUCQ3dYc5Cuq2Hg/KOEF2KkDVKkEsUD06H1rKWkZllUH6XDGuOJcBoAL4uis
         gYdFrIAMWC9qbpxcCDIg6BU8PhCHIXuus2aqo0I8sYj8U4ZgwEdPAP1ie9+udu4QL9Ui
         M7Qlop86hC3pd5zA/q8opBgk8v99YD383MDjjTQtMO0Wxf33ILlljRJuRbUHRpeOoITB
         nX3vAaoRtnr6bqg5ImtrPOuTUc6e1I1BbLc24wjuDgr7xFITM1Y1QjeFhebNO59J3p2m
         EXDe9REb8owdgdmJhW63twI9ugErsCZgWbFOS2ohNdbuZ7eBWaOjmJqxoitLCEQ4SGgZ
         K7nw==
X-Forwarded-Encrypted: i=1; AHgh+Rr4FQGnS32wfXhDm+n5enZWd3n83LVc7U96xsYX59k47Qm47PUR7J0SSoDDzMx66IFHMVBE8FPgz84=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSl/ittDyN7NZODHwKEUI7fSUBRW7TUs7C8WGoQZ3fORckua8a
	nOlS60yn0gEu9z1m4PTsOjurE1ANmKT8Yr1Z1Wb8Dl/3G8akTpcqArCz7vNm9c+8CwUTpeuy0Bw
	U1D4I7BO8IaPrV10U7M8NyH7ULVgrab3209wvW8BFo3/crEXEyT8PWYthvOFYGJg=
X-Gm-Gg: AR+sD12p/KkPYyyMDFDTLw31712X5j4D6wsgkfrct+LAvMj6cvqu/4TV6vNW1S/dxPX
	pFQROEtxbPNW1AD/Kxo6jSns2NZiQeNQZ3SB8pSJkz+NbxSppDNYgKYrODT7n7L1E1LzB4Bpiiq
	1d9OyZ7vWEldOSKm/TIDm0blqmny7I1dRCgw4b+rOnHWdRkGlIVIBXTxD0rzlik6PQ8JomtgeiO
	wQ8q3Pi/Ez4S+85XyMLx5v5Lp5DjPymvz6fznyxNaDmJtpeiJmEwBgPBzu8ShiRIO5jyIM8nr/n
	/BghJ7YoHuqyFCmabsvL01pXY7SZ+x94wF4j2489BUinejN6h2tH3yEMy0cLg0i1pY2et9PegyE
	QCxhU/xXnARDAXLO4Xmn4BRZVMnHq0UffnLqbe5yc95H/RP0sf1c0v3Qt3inyypHf
X-Received: by 2002:a17:902:c40d:b0:2ca:281:27fd with SMTP id d9443c01a7336-2d015c878efmr81077145ad.25.1785330950026;
        Wed, 29 Jul 2026 06:15:50 -0700 (PDT)
X-Received: by 2002:a17:902:c40d:b0:2ca:281:27fd with SMTP id d9443c01a7336-2d015c878efmr81076515ad.25.1785330949475;
        Wed, 29 Jul 2026 06:15:49 -0700 (PDT)
Received: from [10.133.33.36] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0228417adsm11343225ad.0.2026.07.29.06.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 06:15:48 -0700 (PDT)
Message-ID: <a9439f32-ee36-4c66-b96e-082b40e9b9c7@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 21:15:42 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] clk: qcom: ipq-cmn-pll: Add NSS clock support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
 <20260724-qcom_ipq5210_cmnpll-v1-4-a8b8679d215f@oss.qualcomm.com>
 <a907cba4-c276-4355-986c-44f6e39c310a@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <a907cba4-c276-4355-986c-44f6e39c310a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2VBvqxTWKDC8IK7FltiZ5NVnQ_7V-8Fv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwOSBTYWx0ZWRfX56rdkh/0cPJD
 SrPN6h1XPPSLJ7b85N5JL/hpeKK7MM/5C7SPkaA/Y2964N1TeZ8uyCDVKoC39Wr5UKJzuAXqY+N
 4GrB9c1A4xA6hg1p7funYBXbogBCHuw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwOSBTYWx0ZWRfX+f/j1r74yTpJ
 ueNZjO7YXNHSTrPc/ctVOyLwWf2jc2Rr0Ej1vjucEpdMp/zg/AvKLA+5kA8YwFfp6qFL2EFK1Cv
 4EN5ry+hVdlAOKux+GEJSAV/JK2LuziZ7+z3liSx5k3TwJXbDCe2hDknbxWvC3TN2K01Oc+EFz5
 vHDM4u7XaEOfFG4EbSAhZtRb21sp9MCAFdv7MAQA/kSuOyDTMAKq6vNJrzJIkEXrATv0H8imML3
 51qNRc6TkHM6gdlBtx03Om7b5UB5eu0zIDF9jA65UtxcCddaqo7bc2/FVV7/p7wi1zERA3UAVlB
 cRrdPrrdYhtIj9VqoiUOQfvLu9HNxRb4ozUI+eML0sphKHeIksX28MxT1zQcn6FUCorpJJOQcDl
 +gyFa+Sd4OoTrW6Y+IaA5MBI6DEwS3wWizi409++ULaqAF+BsC9eESx64u0SlcOzaSP93vrQb/E
 9dZZ9gM20hX4GlXLS8g==
X-Proofpoint-ORIG-GUID: 2VBvqxTWKDC8IK7FltiZ5NVnQ_7V-8Fv
X-Authority-Analysis: v=2.4 cv=TPF1jVla c=1 sm=1 tr=0 ts=6a69fd06 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=mo-5zohwMfGRhBBTFyAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_05,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290109



On 7/28/2026 5:29 PM, Konrad Dybcio wrote:
> On 7/24/26 5:00 PM, Luo Jie wrote:
>> The NSS (network subsystem) clock is derived from the CMN PLL output
>> divided by 2 and then further divided by a configurable 6-bit divider
>> with a valid range of 8-63.
>>
>> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
>> ---
> 
> This looks very similar to clk-regmap-divider.c (or at least to
> the generic clk-divider.c implementation).
> 

You're right — this can be converted to use clk_regmap_div_ops directly.

The NSS and PPE clocks both compute rate = parent_rate / (2 * div),
where div is read/written straight from a register field with no other
transform. The only thing blocking reuse of clk_regmap_div_ops is that
implicit 2 *, which none of the existing CLK_DIVIDER_* flags express.

I'll add a new flag CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET, to clk-
divider.c/clk-provider.h to express that relationship, pass a flags
field through struct clk_regmap_div (clk-regmap-divider.c/.h) so qcom
clock drivers can opt into it, and register both NSS and PPE as plain
clk_regmap_div instances with .ops = &clk_regmap_div_ops instead of
hand-rolling recalc_rate/set_rate.

> [...]
> 
>>  	/* Register the fixed rate output clocks. */
>>  	for (i = 0; i < num_clks; i++) {
>> -		struct clk_parent_data pdata = { .hw = cmn_pll_hw };
>> +		if (fixed_clk[i].rate) {
>> +			struct clk_parent_data pdata = { .hw = cmn_pll_hw };
>> +
>> +			hw = devm_clk_hw_register_fixed_rate_parent_data(dev,
>> +									 fixed_clk[i].name,
>> +									 &pdata, 0,
>> +									 fixed_clk[i].rate);
>> +		} else if (!strcmp(fixed_clk[i].name, "nss")) {
>> +			hw = ipq_cmn_pll_nss_register(pdev, cmn_pll->regmap,
>> +						      cmn_pll_hw);
> 
> Huge "no", this must be a compile-time constant and not rely on
> some funky detection.
> 
> Konrad

Thanks. Will replace the rate/enable_bit/strcmp(name, ...) runtime
inference with an explicit enum cmn_pll_clk_type field, set directly by
each entry's construction macro (CLK_PLL_OUTPUT/CLK_PLL_GATE/
CLK_PLL_NSS/CLK_PLL_PPE/CLK_PLL_PON/CLK_PLL_EPHY_RAW), and dispatch via
switch in ipq_cmn_pll_register_clks().

