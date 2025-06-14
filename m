Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8801DE4D8
	for <linux-clk@vger.kernel.org>; Sat, 14 Jun 2025 18:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749927046; cv=none; b=qekHAuElGEykn90GCOjEXSmfcU2mvlTjev68vqkazmq5b7edWDBmJnsutFkskFherEcQIx/HqDEqI3gO2hz6yRI6WnekPkXIbmM7sQpD8gkWSJ8mJpWDuYSj9NgCBWQvIjkoX0bFTSxh2DgsRJTcyRuNDR+ks8XoMQ450ltVYhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749927046; c=relaxed/simple;
	bh=zAo8PQ1kIpBM1SD/j60V6KNaG3hiL9Q7UDeeuB5Xfpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fuxRZz/dXmI+x/8HfRjr938FbOumHBevJn2+mW92AHDENfYBdTXuMwWsYY3f6+s6Ugv8YyAISpo1YF5OhuyuYHs5Ma0BdMxObSYS1tDBBQjYmDvS1vsnvJzy1KetAfD0WIy1mpVsjtZJmSZvHn9t+DU3KpbuVpfrxyhuVw9AUIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UDKuxPYn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UDKuxPYn"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EIocdb018484
	for <linux-clk@vger.kernel.org>; Sat, 14 Jun 2025 18:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eoG6O0K3f8gZX/KII4B/go1MHyLMfczPeBlrtLSsYrM=; b=UDKuxPYnC4bK/zSP
	qjZzLRQmMiLyjHi7cOmLs3MXUjrYKquJxPrs1f9I6+I0hl5/PETBkSTnYf2iI0jF
	EMtozgAt/iqpMHItsXUFVjrtRt7p65SVdI/tfdQrlS/AOxyBXGxsH7GlJW+u1Sia
	asYaodCQQCUX0TH5XsfLRozMdD6Qr9eYHOl5jUR1THq8/bD7irP7aNO8z9S7Nx3b
	RnzVqlGiMZuMqiCXKcwEFQjE2EcTeY/F2NZFiDncMBDTxmOwGP1ACK7hGlgMNfUd
	5dyWxRO4pE5FmLc+FB7UgReIg4t6pVw/v5os8IVPgqXnskbS3zqB4tAI+JdCFXbk
	tYAX6w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f70wjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 14 Jun 2025 18:50:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a6f59d5ac6so6133481cf.0
        for <linux-clk@vger.kernel.org>; Sat, 14 Jun 2025 11:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749927042; x=1750531842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eoG6O0K3f8gZX/KII4B/go1MHyLMfczPeBlrtLSsYrM=;
        b=rIx0tUNwaMR7DJHAqpLIagmre0FOJN+c/ODcNJNjDzy2UvBFL4iUbSLNhKLJpzFqm6
         BBX74oUSrrIVZwMF+r3l2Y3CQ6jZsflJhVVkrjzQbfMSyeoR/BD3DITxfdPtZye8TCo+
         INvPu+Tjo21MUUi7Ma67maPZUbKfmk33rCzn4K3qjMQwna6700ggZjnJe/otucjYskdi
         4WMASr68Z6YdlKpEPnqnZ4h5NC0EnWqwf4435zrptfXG0rrlOu4k7zSd7eMokOE+n9+l
         /DOAzr72EzshHKjJQC7ECF3mQY0ydanUvQJ5wzXWnGP1ceZ1vMZ3uEtHTA/aTcJ//6HF
         Es4A==
X-Forwarded-Encrypted: i=1; AJvYcCXJlJJJmaLEngrRSWwjIkdu126lU/ktx5fb2umeGrBX2nhdUc6qNRgL6LrK+eorNWfhmcNV5Bo+1Dw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwomfIesGR1r9abuQu7Ksv78avnWY9lntB7u4KTeqbFyEIkjCuF
	NAtVK0DqpmqYyZUGR99WUSP5uQ7O6qRKRTNbMJxh5P62Q8YA2tJ9Qd6QDetNoMpO0er8mMOkgIK
	r++k8jZnhmMl8WoC3xblVc86ErUAyWMno8wQhTlk/8kenDXXcF9MH+K7UgV/4BabhWpVGxqc=
X-Gm-Gg: ASbGncsARu/e24nyp+ro2yh70DZiLxb/Isaf2uz3qtuv8QBSObPsSO2D8UTgnO2op8p
	8DzY1J8IJOAcB14OpDUiZd3VyFt5w9z3Bc2bh6YfmEII6x/XIpYKtlRgbosjjOeCbOKOp4iDUBS
	a4i+yzPPE3HqopDVugjn+dKJPUs+ZazR1nJqBIw+7NTLwW0mBAfXuYovFVUEVzgCRvnJk7FlBs5
	dQjiavC6Qc3WavEvasmUFSED8Igde24Ct1BkqNHhKl1eRARL/s5MyDJCaw4Vnnp+daCXdEg4gg9
	72lOQDs1o20i60DMCOgM1O7OMJ1vc1FxI9LxltXBydlwS3bDncXF9Do4OqUm8/vFXztkx0J1RWX
	C0V8=
X-Received: by 2002:a05:622a:60e:b0:494:b869:ac06 with SMTP id d75a77b69052e-4a73c4f0986mr22004411cf.6.1749927042626;
        Sat, 14 Jun 2025 11:50:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx8dYFput+x1zrfRR/vwybI6ORi4SG7FUVUMwmj0jEta6iK89coF3n7ZV/SrKjJMpi0fdbrQ==
X-Received: by 2002:a05:622a:60e:b0:494:b869:ac06 with SMTP id d75a77b69052e-4a73c4f0986mr22004301cf.6.1749927042208;
        Sat, 14 Jun 2025 11:50:42 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adfade680d4sm186158466b.10.2025.06.14.11.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 11:50:41 -0700 (PDT)
Message-ID: <f0483597-45b9-49f8-b316-a9cde7b98d81@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 20:50:39 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/10] clk: qcom: clk-alpha-pll: Add support for
 dynamic update for slewing PLLs
To: Taniya Das <quic_tdas@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250612-qcs615-mm-v9-clock-controllers-v9-0-b34dc78d6e1b@quicinc.com>
 <20250612-qcs615-mm-v9-clock-controllers-v9-1-b34dc78d6e1b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250612-qcs615-mm-v9-clock-controllers-v9-1-b34dc78d6e1b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE1OCBTYWx0ZWRfX78Fm2K2uiep7
 myv7ZmGpq6OorXxMc/+ksgTO/dRYJAnxyvi48M+uf5Mjyvmb1C/9wVF+Fv39O5xYVXOOcGdvqe5
 NhrEMlQMMFn6MSFdBIRgI/d2y0DpMuNYX/3cVbWSx1Q8YSleen1l5OpvvahwMqYDCSTARtIwiXz
 U8XO0WVKXyEkzei0u9K5AeZiDA1SAyQDNJom0+ukQK+NA4at83g2vgqIiuPGAj3h1Z83t7fDc82
 IPXtGwM9VOKdZvPGBLikoJAVXbToxvNQe+0N8hPmvTmi6YgEms8qLyu/4lZSvwy9VV8202t1fQr
 Be//p6mi/n5sNoYFMJb908Zk3oPR5X0qtlURyg+ahDS5E/duyoFitRz0xDogGF8AoTl2eoIS2dk
 uX5NxBqQ692ebtE9RJTFZvKWOR8BIrqMNLZf1eiLvC15Xlb416Yuw1o71+10Y4jtc0VaY/Pj
X-Proofpoint-GUID: rhd35FBYcgrU-SgIL15X6jDDuPKzPW5n
X-Proofpoint-ORIG-GUID: rhd35FBYcgrU-SgIL15X6jDDuPKzPW5n
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=684dc483 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=b3DFIE2h8Nkn-kLj-EYA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506140158

On 6/12/25 11:55 AM, Taniya Das wrote:
> The alpha PLLs which slew to a new frequency at runtime would require
> the PLL to calibrate at the mid point of the VCO. Add the new PLL ops
> which can support the slewing of the PLL to a new frequency.
> 
> Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 170 +++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |   1 +
>  2 files changed, 171 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index cec0afea8e446010f0d4140d4ef63121706dde47..5e4a755b849970281e7742ef83219b7eeaa406c3 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -2960,3 +2960,173 @@ const struct clk_ops clk_alpha_pll_regera_ops = {
>  	.set_rate = clk_zonda_pll_set_rate,
>  };
>  EXPORT_SYMBOL_GPL(clk_alpha_pll_regera_ops);
> +
> +static int clk_alpha_pll_slew_update(struct clk_alpha_pll *pll)
> +{
> +	int ret;
> +	u32 val;
> +
> +	regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_UPDATE, PLL_UPDATE);

There's an ever sweeter sugar-syntax for this case - regmap_set_bits()

> +	regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
> +
> +	ret = wait_for_pll_update(pll);
> +	if (ret)
> +		return ret;
> +	/*
> +	 * Hardware programming mandates a wait of at least 570ns before polling the LOCK
> +	 * detect bit. Have a delay of 1us just to be safe.
> +	 */
> +	mb();

Since you read the value of PLL_MODE back, the barrier is unnecessary

[...]

> +
> +	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(a));
> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(a));
> +
> +	/* Ensure that the write above goes before slewing the PLL */
> +	mb();

Here however, the write may not arrive at the clock controller before you
proceed to slew_update()

> +
> +	if (clk_hw_is_enabled(hw))
> +		return clk_alpha_pll_slew_update(pll);
> +
> +	return 0;
> +}
> +
> +/*
> + * Slewing plls should be bought up at frequency which is in the middle of the
> + * desired VCO range. So after bringing up the pll at calibration freq, set it
> + * back to desired frequency(that was set by previous clk_set_rate).
> + */
> +static int clk_alpha_pll_calibrate(struct clk_hw *hw)
> +{
> +	unsigned long calibration_freq, freq_hz;
> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +	struct clk_hw *parent;
> +	const struct pll_vco *vco;
> +	u32 l;
> +	int rc;
> +	u64 a;

A reverse-Christmas-tree sorting would be nice 

Konrad
