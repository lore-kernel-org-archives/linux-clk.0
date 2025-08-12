Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE731A23A0
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 05:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754975141; cv=none; b=fL8DEVwAY4sTzgPquFz2G+6AmyXu1PjlKunYYRB6NTcMnxMuUl1ndkbgnOirHqec0OwY0AUwCijFv51Ql7lwXqE4kdfXylcvu+BUl1Dj6vKoZJFGun4Xv4nwb1ra/K7MZXzP2zvV3hXMJrG68PsdmKRUo//wLDTkXY3LdFqombw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754975141; c=relaxed/simple;
	bh=QI1HnyqqGXFzazfF0kLLFQgBtZu2qOy6Z70INXj0J/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pjg3HdGWmwqSoylE3YElzfYX/wGLfGY4/OX7OWS7DmF9gmf3eFIZLm6Y/g2fh4EDyuHwZG8Yyks6I+UjIQ3UHFVsxGOQE1yr5c1NfK5wRJ+vqwdQ8ZrlTg6xWcMq+P/+Lj+ImF1Rf5cQqhvlNNdhrgK+NYR1h6dc7INfe9Pvab8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dT4ntOO7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dT4ntOO7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BGJNFx016035
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 05:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HyY1Y88Y0ORrgrBRfShLFFoDdBhRhqgMxdPtmHpsxLc=; b=dT4ntOO7AgEts2E4
	YibCqph0yiqXySfAbVfDMQyXjy8BzyR0G06yFNASqSGrokOQilF+Uach7JjgXh3F
	BAsFNKTXBqZLuhRrsikgqfA6lttMGBV6MHgiXUu7KILbfx/RNtRBYavp8X20n+Jr
	TRQBATkc445DLOL5J3Jm4DezeGYPw936RsOQstg0Rrg//ySTQKU8lqu8HhqEpaOg
	dFZpz4k7WcWCNvE+EPY6mdo1XgImRhwMJcoL/tisXbd+48fRs2eWgEtxKspEU/84
	VRJ2g4XSd6pWr3xVX3D70cNzmNyK4kiIrfLvjXNgC0HxiNUUczlDow/9VvzxoF+R
	3p80NA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmpyku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 05:05:37 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4310451ae4so6792109a12.3
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 22:05:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754975136; x=1755579936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HyY1Y88Y0ORrgrBRfShLFFoDdBhRhqgMxdPtmHpsxLc=;
        b=kvp82M4AE+/qpzBQ1vUpJotyEutx7h45/Y+NP8SB3Da5tCR5sIYTqqlX6BSqnX0IAK
         x4gBX/BnIbkQDs9nXw1PHru0zses6Og4OefzeQ7uCzuLGknW6YjjVhCkn6WMwbF9ECqq
         FoizGDax0R035agVxUYgXtHsQKFdBAXRDF7obVUMlpo2GwNwu14AtEQ1RqXbbYiRBYj6
         vK9E1s0XWA0aDiSd8xmbEYAdviMSn2WeJQvaOo0oDdnZ6QKDUbCJb5rqf/TWBOlGF8l5
         QyzNICm81Tp3RKqvPKJqLO/FgEFQkXOr8uwmq+ESVbJZpvLRwYkopXlrG2IBs7Nssg/y
         sStQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJjr5h1YEiQFOg3syfFLfeC1xnro7xVoLO6W0o6nJ9yQod3a1mMtRkTKAAbp0gX9ZB4fJHXJmkcyw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzittV801gzuc0Bo+GDyzEve1UIOdVcfyZYeF6Q/IqKOK7Rn2Kl
	3zerUOdNwSJaG/JzJo7dAbbWCkRqdB2ANLrFM//NV6Uo00Zm5WE2susIu4cVTUlDEgX4nyLnD7H
	7ceOousDEfKjECnzykj91nCPC6hHHGny5VMNkVhGd1s0nj7CMYphFIFBJgi2b/5Q=
X-Gm-Gg: ASbGnctVCqV7BbI3FaNTSsZGPR4eA1mo295ZQgpR8GBmbBJSPqgLLJ8BR6sKhkS+FbM
	cJlCFF4QiOH0ujC5rGVVqsOmt52UvzMMDqPnXjfuevHlyVrofGZJzgSm4fe0j+xHMIicq6aPm+k
	lhHD6hmi//gBJ/XlV6w09FQ5R6gcGfdXHrQjzsrrTYeQapLH9qpN8A7Ko5n6nq2yEnJeIsW2jV7
	nrE3OnDCMVi6PJXAlXTNlrNVdM1UVlQ5qXcjLSZj4W5Z/1mUDCuBWeRNx9jFSnVFOndQDJHYyJl
	eCq5jqaHF/gN54VJNNhDvmbraLcNFklYE04qn2K7b1xv+T1BvoVy3ue1lCxDZKQrtAqI
X-Received: by 2002:a17:902:f68c:b0:240:900b:7550 with SMTP id d9443c01a7336-242fc21006fmr28005315ad.5.1754975136429;
        Mon, 11 Aug 2025 22:05:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFp8q7iEcoE6icwUvjRib+HG6J9UgPT0yWBcxWWwYRBGOzentck67PNXD0Zcb1/vkf9fjph/A==
X-Received: by 2002:a17:902:f68c:b0:240:900b:7550 with SMTP id d9443c01a7336-242fc21006fmr28005135ad.5.1754975136011;
        Mon, 11 Aug 2025 22:05:36 -0700 (PDT)
Received: from [10.217.217.159] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24304c2943asm373085ad.30.2025.08.11.22.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 22:05:35 -0700 (PDT)
Message-ID: <ed0341b3-4056-4826-bec7-e835a6da4fad@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 10:35:30 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: dispcc-sc7280: Add dispcc resets
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250811-sc7280-mdss-reset-v1-0-83ceff1d48de@oss.qualcomm.com>
 <20250811-sc7280-mdss-reset-v1-2-83ceff1d48de@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20250811-sc7280-mdss-reset-v1-2-83ceff1d48de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=689acba1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=NNVWRqRCdYL-THHIErAA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: PpONjgoPibl7Kn0VI2DO7xeo7KQgBEPh
X-Proofpoint-ORIG-GUID: PpONjgoPibl7Kn0VI2DO7xeo7KQgBEPh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfX5otRQadAnewg
 ONl+SGbE2hAhWjly1WD9mYEXCvpCdSEbxNpKJE7oHttgfKRWIii5fMJ1kdQQp8/1T4akIfYSbvK
 eKue6TKENp4twe0asWUMgPXA4plgH2ylrDS7JeWAGDNCTJjQq4iW2wDKlMErSF4rMVpbGjezvYa
 xdkh83qKRzGqTGNuDkQszGi8ekZJdunwbRVwJNhsGkfZmT3swHlUYsYwM88usDbb2zvNVNPuIW8
 BAdirKNDb2D0B9w6hhaW7Ln26hSO6Sod6Q3vU8GrrO92wIThUXQZes6e/mZwTV72VSzHHwRgyFa
 nCMialRJV+svXaRaNcnb1oVJTcsMOXt/tClwQ0GtK3vKDTgW4z8Vmv2XTwPPHvCccj9Snr+tZwr
 cbU+F/GP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000



On 8/12/2025 8:41 AM, Bjorn Andersson wrote:
> Like many other platforms the sc7280 display clock controller provides
> a couple of resets for the display subsystem. In particular the
> MDSS_CORE_BCR is useful to reset the display subsystem to a known state
> during boot, so add these.
> 

In this issue I believe the requirement is to have a clean sheet and
restart the MDSS explicitly. Historically MDSS never required a BCR reset.

> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-sc7280.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/clk/qcom/dispcc-sc7280.c b/drivers/clk/qcom/dispcc-sc7280.c
> index 8bdf57734a3d47fdf8bd2053640d8ef462677556..465dc06c87128182348a4e0ea384af779647bd84 100644
> --- a/drivers/clk/qcom/dispcc-sc7280.c
> +++ b/drivers/clk/qcom/dispcc-sc7280.c
> @@ -17,6 +17,7 @@
>  #include "clk-regmap-divider.h"
>  #include "common.h"
>  #include "gdsc.h"
> +#include "reset.h"
>  
>  enum {
>  	P_BI_TCXO,
> @@ -847,6 +848,11 @@ static struct gdsc *disp_cc_sc7280_gdscs[] = {
>  	[DISP_CC_MDSS_CORE_GDSC] = &disp_cc_mdss_core_gdsc,
>  };
>  
> +static const struct qcom_reset_map disp_cc_sc7280_resets[] = {
> +	[DISP_CC_MDSS_CORE_BCR] = { 0x1000 },
> +	[DISP_CC_MDSS_RSCC_BCR] = { 0x2000 },
> +};
> +
>  static const struct regmap_config disp_cc_sc7280_regmap_config = {
>  	.reg_bits = 32,
>  	.reg_stride = 4,
> @@ -861,6 +867,8 @@ static const struct qcom_cc_desc disp_cc_sc7280_desc = {
>  	.num_clks = ARRAY_SIZE(disp_cc_sc7280_clocks),
>  	.gdscs = disp_cc_sc7280_gdscs,
>  	.num_gdscs = ARRAY_SIZE(disp_cc_sc7280_gdscs),
> +	.resets = disp_cc_sc7280_resets,
> +	.num_resets = ARRAY_SIZE(disp_cc_sc7280_resets),
>  };
>  
>  static const struct of_device_id disp_cc_sc7280_match_table[] = {
> 

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

