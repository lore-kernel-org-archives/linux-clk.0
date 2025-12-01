Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B7130AACC
	for <linux-clk@vger.kernel.org>; Mon,  1 Dec 2025 13:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764594950; cv=none; b=k+l39ylC/x/sIuiq2xoEwENTxR2MlefIaOLuVZrkxZ7wwcb+sCtyJ9pSDnky6Ps6oD8idtIt2XdhRy6Y/oNkjNPfGr6KcGHjnQsRf9EDGSNYs+NmBUnEZPIO6HCbypg8eECAvyyxyGTD4d6vYLvLPdhjVqFpMWR4oZGblsQQ+5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764594950; c=relaxed/simple;
	bh=nbo9Gy1z9me7RbbbLnOg4ADpNmVnEU8hm0G2ysDXIWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VYjDakruuTId5URftnR9Bv4J8cLUGYsAL7XD0/eQ+8xNxFGDzEbNO/iA7jUmpxdeKJqej4Y9zqd/+DTd7jvp2gaOKS4UttEUoAZSwarAJhisS/Y5UG6JjpjmZcnsRy5ebBOjpUa/uX6tDd+ApL4tyVRrAHwd/shYbSClFKqQjy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZcyfNaYE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MvS5ZkIG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZcyfNaYE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MvS5ZkIG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B16iuqX3689448
	for <linux-clk@vger.kernel.org>; Mon, 1 Dec 2025 13:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KO6UX3gdfdkT2yMHnnC93Nu+wZWbIHdz6+QscTqB5gE=; b=ZcyfNaYE3hsYKWhy
	MjTAZJIxEM2TybhgAE05GpjxkfRiBf77qzbGyC88uK4tY6zjfTtxTjW5+PJALtbl
	6PZ9Wk/G19i0HJclMgzxFvyOTugwfHKOAoU/cAvjaKRkNYtVzjHen95AmaURrcUn
	0iFL9GuGtAhCGMxZX9POJuzGZ9yKAnRwWqxhpbcqm/sgarTjvECBsh9pNb44kjQO
	37mPAS3/nGeaOZwyBdGB5zYP4KLuqWS96nTZKLrzdNE+/+U6C07GE4/9eaw9Ihpq
	lA8P6RMKG1tMXHyT0Cw+S3qgeFets7YwkTIPh0UfJ2FNd8VZcrHdM+dq7WMdaaOg
	eSkABA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as614157n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 01 Dec 2025 13:15:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed5ff5e770so7456461cf.3
        for <linux-clk@vger.kernel.org>; Mon, 01 Dec 2025 05:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764594948; x=1765199748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KO6UX3gdfdkT2yMHnnC93Nu+wZWbIHdz6+QscTqB5gE=;
        b=MvS5ZkIGCxhz802jj6+PT9Jo26BpXyOcom97k/i+NUG5jV98UlCjdIgkbXrgmE6JVy
         XDZBWkEKixNWwdg66FNhRyjAPsSCg2i24q5T5qe7TkbT0Axk/MeUDxdPatTA7TalapPx
         I4eB+/M4yCh4KKJNcCbC2XJ6DsrFb2jy2mLILzPkLnmnOKvMN4tJVTeWHNut9YuH5L2f
         VRr5gnJCokQNYZCdRCuu7v5lZod096E8sbhzaWlTZFBPUhMa0xyAoKXvXbg0WPPkkuA9
         4sCYgOIe7Kq/WStWMfp4c1iji+JIdOVviRxSl+f73G3fOgjLAxVCikLYTmi2HTEKlJ0w
         2v9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764594948; x=1765199748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KO6UX3gdfdkT2yMHnnC93Nu+wZWbIHdz6+QscTqB5gE=;
        b=S9tuamr0TrDfAo/IhOkrdvseO5DosxpzX5/f7c/z7fpBIRqKmY3r1f3WUJmbKla2hV
         CBPipFe2GstNQPm2iByTTVxlGtcC3NaCFwxlb0kfrvzo2wAna7OT5nxXdmFFNFw1++ua
         5EIHi/m5kJYFzppE3LhJuYmUfYI4HU27QmDgrDSTCDDOgKkE/mLhE7zQ1Kbd/3uaTMjj
         basz8njGwULSgkkqH1KQU1UDtilr4p3guysOGgobu8CFibvWE5wP6A1An1qkxZGCuCZU
         HBGyF/68Tzeq1JnwvwjkmD3T2XbPtLRjB3vUkK+3/67LMjoP/l3blg+kdqz47btE8EAe
         yBQg==
X-Forwarded-Encrypted: i=1; AJvYcCVvOBDwUPnJmTDUwOTuxgpHK9nL80XD0+Zezlxry/h+4TG68NFVnGjBlYJqAhftYf+34wi6bFJwH80=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSebx1TrJYtKAPlyHF6kh5lAn7M3wCQBVTZeVCtxpdWYu2yCKB
	L5b9up0LwscyxFsD7KRxSyCX8nmGraMkcveEnyUwiOxy+Gknp47O1Vy0G+tqQYCwP59sDPwrCo2
	j5rNpBo3UXvdouG5Rsc4StD+c00mbfJXOOZ1LVEzspqijgXOv6m3yfeiedxs+RgY=
X-Gm-Gg: ASbGncst5iiO1Y4VvvDUF00A0kEKzKBc7sT2+YfuIzw5ywO4DbDYTqCY5+qG2SXIxKi
	K7Kn0OvDo7bdVF8+CdvP5SYWfpH84h0trLG278pWUtJoNBZjF9f2xdSbLsJ0XvLwuhjmslfMdj8
	ZxchyzxXNmeuFM9V7P1Hj76GgfSboGk8n3owM9+7ekneyspDtEyM8yOCBmRp5yMbD44PH8JEMrG
	WaK7WvwM4+blvwmeFOt6PiUP3BcHaxmNGFU3TGVyQM5E/DLMeSs7a9/wVBfHO45IoYACatIo+ID
	TD1RtJzNNQCIrKx6SM4tjik0YxWiMYEyzBft7vpZy33/U87kZ0FAch4ceK2HBdtPpmhLLr2ju3A
	jzRkWTRyKaxpAht3CcXjqu0gZNhefD9v8nzYLBXzFPgX56MLPfnIUt2l+FoHVAOuuuz0=
X-Received: by 2002:ac8:5a46:0:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4ee5885ba39mr390589231cf.4.1764594947284;
        Mon, 01 Dec 2025 05:15:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsc43YZ5vfth/ieBcfBTnzwxswN44JaEXdbd0f7CPZ1tdQd9HPE6e1lDuQM4FJ+9etruHieg==
X-Received: by 2002:ac8:5a46:0:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4ee5885ba39mr390587631cf.4.1764594945691;
        Mon, 01 Dec 2025 05:15:45 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751035b75sm13559964a12.20.2025.12.01.05.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 05:15:44 -0800 (PST)
Message-ID: <850c172d-66e0-4d28-903d-fbcef7ad7444@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 14:15:42 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] clk: qcom: Add support for VideoCC driver for
 Kaanapali
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-10-fb44e78f300b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-10-fb44e78f300b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J/KnLQnS c=1 sm=1 tr=0 ts=692d9504 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1utaWbyG55iW8k7krG4A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Fbj92Os5k12ylsLrBp-AxEQ_1FAa1Z5m
X-Proofpoint-ORIG-GUID: Fbj92Os5k12ylsLrBp-AxEQ_1FAa1Z5m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwOCBTYWx0ZWRfXxPgmPRG/4y5n
 8wEeUVBvOM4QWzuUWx/Z7bcMyaercqWSbdwIsv9cx/qlM4+4xwXcGQLiv9jyOvGgR2X8VzqUG5d
 MNZNLqTP3ZNtmMaQt88V4oYmR/N5nCC8vwxVarbyr7jjt+5AeDDf1YJ5NJL6UzL3cD49HKMmwdM
 Do9QhhRjk8pAxynHYyppAj2xEV+XYq7LJWLPAqhKQC5MGYqQuhOK86IUoqPRrgZIwKL8Pq62jsD
 JwZCvhpLbp9Z/IEySRcGzIal8d5QzcoChVDlnRMAcqbB/Co4csDghPZY8oBxXVrRaMcKtAuVREO
 uqefv1h56e08zgdzskKr2fy6LLkjL2Oli2vHv/r7/3oyLkTMlsEEBysL9o1KbZJqIQZwXMen6bs
 gAPgoMnSrEU73x1VtmI1OBFxfLx81g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010108

On 11/25/25 6:45 PM, Taniya Das wrote:
> Enable Kaanapali video clock driver for video SW to be able to control
> the clocks from the Video SW driver.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]

> +static struct clk_mem_branch video_cc_mvs0_freerun_clk = {
> +	.mem_enable_reg = 0x80E4,
> +	.mem_ack_reg =  0x80E4,

hex must be lowercase

> +	.mem_enable_mask = BIT(3),
> +	.mem_enable_ack_mask = 0xc00,

GENMASK(11, 10)

> +	.mem_enable_invert = true,
> +	.branch = {
> +		.halt_reg = 0x80e0,
> +		.halt_check = BRANCH_HALT,
> +		.clkr = {
> +			.enable_reg = 0x80e0,
> +			.enable_mask = BIT(0),
> +			.hw.init = &(const struct clk_init_data) {
> +				.name = "video_cc_mvs0_freerun_clk",
> +				.parent_hws = (const struct clk_hw*[]) {
> +					&video_cc_mvs0_clk_src.clkr.hw,
> +				},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +			},

The indentation is a little malformed 


> +static void clk_kaanapali_regs_configure(struct device *dev, struct regmap *regmap)
> +{
> +	/*
> +	 * Enable clk_on sync for MVS0 and VPP clocks via VIDEO_CC_SPARE1
> +	 * during core reset by default.
> +	 */
> +	regmap_update_bits(regmap, 0x9f24, BIT(0), BIT(0));

regmap_set_bits()

lgtm otherwise

Konrad
