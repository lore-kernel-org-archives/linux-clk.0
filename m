Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2453F8E10
	for <linux-clk@vger.kernel.org>; Wed,  1 Apr 2026 16:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775061325; cv=none; b=gFsGTZpuakyr94XmkQ9OptC+EuP+E4JsPFsBQHgibMXCm0/RMMA/eWIZNK8p+mERZRWmbJpoC7DX+dfWC6MzWoCwfEqAMVDps70TBpimvh6uXXbsB16AH79DXm6+EK5/BW8lmryDHqFphChdKHT7nyehyPG5+pQgLH4J70H65fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775061325; c=relaxed/simple;
	bh=7N701LTx9bJ0sc4tJYW2zwmhMyTG1gcsh4UxcNggmXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CXFNLtEZ3ZPbCLYUFJq2RSdl2VYTD9GSKpk1Y4oAwVwjPqQmI/oZWdNBNpI6CHXtBXWVgOVc7UkfyrfT2Z86qd84pJjbJ2VbPT27PbHnz852dcF9O0AIXwG30JEq5+Dwd2o4hnkdU6hZxPpzGA2SjRhB/mYOstsXnnnXclunlHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pt6gn+Yl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FVJaNKI9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pt6gn+Yl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FVJaNKI9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631EIl7Y3174198
	for <linux-clk@vger.kernel.org>; Wed, 1 Apr 2026 16:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oOH6Gjls3CqWEpA9mqTKUhqgpzoClPrvgbLT+iZ4b6Y=; b=pt6gn+YlNCcP80au
	cWyjxIZ6zwykIJftcfntN/LeviWS/FMUn63ziH+UDapF9hwYZjD4Rpqo/JTmUn0h
	tCp/9zyR/IUUkni7/agAr4cKUp19VlOdmOm3mZq/VuMLFvejE5U5niqX6QOOPccP
	DGw8slxEXiaNQQoo3bMNJX8joAPf3BokVC1/NFWl5VZSzm3WlS1mc8jGA+rOib/Z
	8PPsH4sH8JDJoYL/hYfSpPKse1LVOCilcWaNLY22PI4bZ33JSymEdBiWleJvY2uL
	Tp9zP4tu/YqKkwEJJdK8cVBWuiLs9R+sfJ8wFpsHlaPi0NGiry4oUV1pc+vcX+ZQ
	IQGUPQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d90gbhyw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 01 Apr 2026 16:35:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0bf2b3879so221442635ad.1
        for <linux-clk@vger.kernel.org>; Wed, 01 Apr 2026 09:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775061322; x=1775666122; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oOH6Gjls3CqWEpA9mqTKUhqgpzoClPrvgbLT+iZ4b6Y=;
        b=FVJaNKI9L5BBC1HJ9d16dCrEKZQYpR7MUtSojW/TgzbkaxH2AO4kvrGw2+0hs5J1DK
         HFMur7WCkvjzrRVYtWz42rmLA4B6XvSlw/Gq3w820CpUqD+NftYTvT/zAWcyd56GAT0K
         NkV/L4p61ZrSLMD5MW8ceqaCmDWVRpom/0a4ldRTwCaq1Xt8JcPZXVyPKaXtNbtY0yI7
         5ZgUKRv0Nw1HMxiWAgM77Jp6kJjR06bRvdOZLUjNNUykNzroImQ6lWC6Bx2bnZUQyEjp
         rnJer4xa+8sk7tTDYaWoTDO35ZDXdQoqX9wub9m5Y6NN/Y/A/WPSPKHOKUlR15OPAeJe
         0uNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775061322; x=1775666122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOH6Gjls3CqWEpA9mqTKUhqgpzoClPrvgbLT+iZ4b6Y=;
        b=QezyCb0Kgu/Og+IPTxh+0Js5HXlPLld/BF4jGshhMIN/sCX+frM21NdA6+oLKU6NRn
         nr2nQtInRV/q1ijIYv76Ou+R0onZRyGlE5IfZ7W+nWtjeWUDOFg/z96ggo342NXKzFoK
         RvTTh5WZICzq5Ot8RLHSUgBkxNosG6JUGUAOS1oxyl4Ai3szgKzB9ghQWOL1hySeBNj8
         OLQNpibBExiKCJsiMk0QgkGdAHiHUqwEkskUn/7AipvRpMk/JMNqEJSvb3lSTlk/2jmq
         NeyEPTTum11ZXhetZJy/mNeDqFN8CnwZWQ58Aie9GtTkYqRGASZoNT2jgy8kk1b/cGe0
         Odyw==
X-Forwarded-Encrypted: i=1; AJvYcCWPpS0/1k2lLFLShAHx5aPy6GV6q0pRaPTZhea65+g86wAQLd1ChTa6koJJm/RMhQsv+7W0K3Sa7yQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6OHQSaVRMGmlWC3eAZMtcTItwsMSR8tAK5WKQGOvj37KjYN5j
	DQPwDs7pOdgjrRIlVNkv2+HT2MPQ6NRWmK7LKThmwaRWvqVi0jYaQcAdMoNmpAWT9ndGT41pm8f
	stlnVmibXQUGSVk8QM7gqZv19nkJ46LsRPMuox3jxaMx1gRfT/iNm5mltexHN7JM=
X-Gm-Gg: ATEYQzyLE13FMxfcJ+5i2/1qnQV2L4W9kSzz5HAV3zdlNLZI3b0ZN8EaN8bVD6ZJcck
	5QRAknimdgnOyWClXW82EN1Oe6zJ2cJp7cdr3JQLfP2wefW4jLJ5gfn59jlYyeL3tZCFbT4rLn7
	P2C0/sFymsxmA55Sk55P8Fjo88QZWkPGp8tyHzi9o5ySMw29J5bHkToelNTrQXMOjb+L1xNV1Oa
	m0dsUzgEQBcFBp2f+Ng5KbA8ZbZGTaCHoTUU/gV6QMFqbkUcpbrddEIBLTBZt4Kgo1jz1Wn6/kO
	zPzjrQYxs+MuwwMU3Ee4nehZYJjSAkRrMfDOk7p159yEQDo81AnOCI0/4C7iaL3gDzGJM9wCxc0
	wOum5DSnNVFU523w+tPdh3CuZyR9AlIPZaipv8IWOW3UPMoSzlQ==
X-Received: by 2002:a17:903:2b0c:b0:2b0:ac1e:9720 with SMTP id d9443c01a7336-2b269cffdefmr43544515ad.23.1775061322249;
        Wed, 01 Apr 2026 09:35:22 -0700 (PDT)
X-Received: by 2002:a17:903:2b0c:b0:2b0:ac1e:9720 with SMTP id d9443c01a7336-2b269cffdefmr43544125ad.23.1775061321745;
        Wed, 01 Apr 2026 09:35:21 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.30.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478b658sm2609885ad.31.2026.04.01.09.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 09:35:21 -0700 (PDT)
Message-ID: <ebce5979-0ab5-47ff-963e-68e27216821d@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 22:05:12 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/4] clk: qcom: tcsrcc-glymur: Migrate
 tcsr_pcie_N_clkref_en to clk_ref common helper
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, johan@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
 <20260331-qref_vote-v1-3-3fd7fbf87864@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260331-qref_vote-v1-3-3fd7fbf87864@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDE1NSBTYWx0ZWRfXy3EaJbLBSyQ8
 O8YFdZgh894/kF5d4/hmnd5tzuGWZynsUZLJStDDziObjhXcwJ4qAik0Nzu3esu2TRt1qNZHVcm
 qmtwh84iI2OAp19PvMPRQPpRzfBKiDbIi+2CBXwZ8Uy2F18f90BS9gDqKlCcJmqvezFgAqxa+ko
 wmw9h77mAqUz/WOm3F5l4GB88Jce++qWiocT+D8MT0hBiqe1Nun2hqPr+/hBpNWKA+atR4oZxWs
 iskLMrWI96kqrLVLX4DhN6sRW9ZRy255176KpXVzQiSqL0VnrMVZwhnHVuVG+bk0aQ3wiraRUB2
 vNyu5lRt1TZjqDWyQPa7Tv9ESdW1hfcXF1UiXcdU09DbaNuQiYl711NxQU0Ddajt/qipUy/sUK8
 +xPOhfbhM+hFl7eiylBUl6H2vKvoyR1YiMx3i1HczrtC+yT9iDIGgnLRQukdc3tBZc4CQ4cAa5E
 dq1DtUedcm65SML5nvg==
X-Authority-Analysis: v=2.4 cv=QJJlhwLL c=1 sm=1 tr=0 ts=69cd494a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=UX8sLPG5SLFWA/DeEh7vkg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1wW_Jg1dmpZ7RQPaF88A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: AwXSrJ-EriGuyprPkpHNPHRqiM-ynPLH
X-Proofpoint-ORIG-GUID: AwXSrJ-EriGuyprPkpHNPHRqiM-ynPLH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010155



On 4/1/2026 12:05 PM, Qiang Yu wrote:
> Replace local clk_branch-based clkref definitions with descriptor-based
> registration via qcom_clk_ref_probe().
> 
> This keeps the glymur driver focused on clock metadata and reuses common
> runtime logic for regulator handling, enable/disable sequencing, and OF
> provider wiring.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/tcsrcc-glymur.c | 340 +++++++++++----------------------------
>  1 file changed, 93 insertions(+), 247 deletions(-)
> 
> diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
> index 9c0edebcdbb12816d1be5249e4f04bcaf02048aa..585f87b23af2d92daef1787b2f38911681c0d8ee 100644
> --- a/drivers/clk/qcom/tcsrcc-glymur.c
> +++ b/drivers/clk/qcom/tcsrcc-glymur.c
> @@ -4,265 +4,115 @@
>   */
>  
>  #include <linux/clk-provider.h>
> +#include <linux/clk/qcom.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  
>  #include <dt-bindings/clock/qcom,glymur-tcsr.h>
>  
> -#include "clk-alpha-pll.h"
> -#include "clk-branch.h"
> -#include "clk-pll.h"
> -#include "clk-rcg.h"
> -#include "clk-regmap.h"
> -#include "clk-regmap-divider.h"
> -#include "clk-regmap-mux.h"
> -#include "common.h"
> -#include "gdsc.h"
> -#include "reset.h"
> -
> -enum {
> -	DT_BI_TCXO_PAD,
> -};
> -
> -static struct clk_branch tcsr_edp_clkref_en = {
> -	.halt_reg = 0x60,
> -	.halt_check = BRANCH_HALT_DELAY,
> -	.clkr = {
> -		.enable_reg = 0x60,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(const struct clk_init_data) {
> -			.name = "tcsr_edp_clkref_en",
> -			.parent_data = &(const struct clk_parent_data){
> -				.index = DT_BI_TCXO_PAD,
> -			},
> -			.num_parents = 1,
> -			.ops = &clk_branch2_ops,
> -		},
> +static const char * const tcsr_pcie_1_regulators[] = {
> +	"vdda-refgen-0p9",
> +	"vdda-refgen-1p2",
> +	"vdda-qrefrx5-0p9",
> +	"vdda-qreftx0-0p9",
> +	"vdda-qreftx0-1p2",
> +};
> +
> +static const char * const tcsr_pcie_2_regulators[] = {
> +	"vdda-refgen-0p9",
> +	"vdda-refgen-1p2",
> +	"vdda-qreftx1-0p9",
> +	"vdda-qrefrpt0-0p9",
> +	"vdda-qrefrpt1-0p9",
> +	"vdda-qrefrpt2-0p9",
> +	"vdda-qrefrx2-0p9",
> +};
> +
> +static const char * const tcsr_pcie_3_regulators[] = {
> +	"vdda-refgen-0p9",
> +	"vdda-refgen-1p2",
> +	"vdda-qreftx1-0p9",
> +	"vdda-qrefrpt0-0p9",
> +	"vdda-qrefrpt1-0p9",
> +	"vdda-qrefrx1-0p9",
> +};
> +
> +static const char * const tcsr_pcie_4_regulators[] = {
> +	"vdda-refgen-0p9",
> +	"vdda-refgen-1p2",
> +	"vdda-qreftx1-0p9",
> +	"vdda-qrefrpt0-0p9",
> +	"vdda-qrefrpt1-0p9",
> +	"vdda-qrefrpt2-0p9",
> +	"vdda-qrefrx2-0p9",
> +};
> +

TCSR clock refs are just not for PCIe alone, they would have supplies
for all the ref clocks. These supplies can also be shared across other
clock refs. I think it is not the correct way to handle the supplies, as
TCSR does not have the complete supplies map.


> +static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
> +	[TCSR_EDP_CLKREF_EN] = {
> +		.name = "tcsr_edp_clkref_en",
> +		.offset = 0x60,
>  	},
> -};
>


-- 
Thanks,
Taniya Das

