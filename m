Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B5B305660
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 03:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779937435; cv=none; b=c3T0Pej5HuyZHfmQ9N3AETI21iQVv7GiXCEWH6jby8R+fyNRj33Nr2UCAUU1dSKshAYCc86B780+RzZo5X3zGRYXWtt+iSZzW4RFZJ7nKOyCWIkyeloPSUufssAD1pv9Ugp1D1Bopbh3/UDKe183vmSOSpqhYyfasY5ZkVIQyGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779937435; c=relaxed/simple;
	bh=QQ5CbSFxf7TS2HMiLtNCMgYv60bCUVSr0315pX/eoDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R6pywAMIa8qmSMEX6lYbCpafxgqUnm3WaOqIsGpa/8JWLnC4CfNH/ykTzGo7JTjbKyK4FRFNLGNN65sb1IRxN7CyZJXM9qV/GTkshRzKGgajJsYmQeC6+Qk9B8ssW8+/n5QrJx8SN3eHWGxxwfFkGwP8W1vRQqMQobxCSj39D80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZfwSMM9x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=feh1OMFi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZfwSMM9x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="feh1OMFi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RKlwN32931724
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 03:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tH65jBUi72poNn77DU0HzxsS63LcoGxhyxyxUXXm8BM=; b=ZfwSMM9xzkI9oVMy
	xUnTS5HAAHXkTFBPB3HAJstWaCuNp4xU3yU8xLM7CPi4+QeBgjb2Xv7gHCqDx703
	oCR/Mno14c5dQWWCXNxDrjjvhOb3SteVn8AgFY1z+oueQCbWehITDu6CRcFYZK/G
	Vi96JtB5xgy6V8lYX4g4+q4lQx0XLUd8vXcoTmCgJGxrkSerUBpkxYoS6ZxU3YoG
	N7+0Sppi7CPcomBHQ5vGVObBki8a0WAsOF9gsTIctp11BNOSiTmzuifgE0xVJTdi
	rs79eTVZrcY6DeaTbU2m5w2V+Cz9dPR2ThuR+CJD6iUYE+SGHOQbWqegUcjnGsdm
	+q6ROQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yah380-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 03:03:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba115ab6bbso136463185ad.3
        for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 20:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779937431; x=1780542231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tH65jBUi72poNn77DU0HzxsS63LcoGxhyxyxUXXm8BM=;
        b=feh1OMFiRwRoTr4yXe52JfQX097iNAE3pimjfk7YbfdxK1QEj1iSX9Vv2X5bKw4yYi
         ZwG8Z/440M+xz7HCswyrkBMZuZ6iru0rcT1FBQ+WTf8QO+x00Uz2EhzvnKK6qMAOyPrb
         QU9XHpMsp1dqoVUVdVB4fzol6YjySrt2eYKrOEsL/6sEnFJkR2FkK6EfNbrQAk8hBeOL
         xtmfyh+k16TVX3qNAVfgYtFurXGLg7PjfqxDY7t6GVLIusTl5b4wZF4vhcdyehap5oCr
         RJ1FwJKmzaiHLI4QgbkNzghZWMUHG1ofglFZngTYAw1hXVq+Nc8ItxzbICDOUKeO4/JR
         la1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779937431; x=1780542231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tH65jBUi72poNn77DU0HzxsS63LcoGxhyxyxUXXm8BM=;
        b=U6hOHS9WGWC2YA6maoJc858JkA3WmA6n4kGzLtS1P+fbFMuR7f5lL4rZPP97Wsggnp
         bzMbd0sLfu9LQ5Mpehs9drWZfdPZJeYvJrWGMZCgIO96KFof/h6ICQy5Nsdy6uWZiOus
         C11X3xkiEUsdqtdNf3Lrku4I0ZMiDTOWAO3sMbJv0q345fsU8VUFH2MSSs2tfFWYX1uG
         y8r/PrB1+xdVo8obrNwgkDPzegBYQjQPsqKwNs00gV0qqx0GCOwQh76OMtQaFSSBNlG4
         35jTYC2tFPhkakwOZ/mBMojgzRpzb6ZYMCbaNGdUE3Y96qU2yZsxsOrJLeao7AwUOxRe
         PYRw==
X-Forwarded-Encrypted: i=1; AFNElJ+ORGvVDsVu7kUI7RyTx947zElr0hstRDrAU/MJM62KHQVAW/wL3g6TWGqJ1VMAaU68aAU6/uUJ2zY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIGgwI50zuwos89gp0QboC5cBVStLiCyEmNcW73oX2xr4NgWjS
	brzzOih39ol5tRw8syfI7Bky8Gui1besxS1gJF9xuEr9E611vkAjqG0Lt3eo4vKwbkgWtVsDsBo
	4O0dm7IlJcH0KTXnytFnYplptq1A46Il4J6aak2CjZdJqjE4sS6zSm+eAbxshbZc=
X-Gm-Gg: Acq92OF5281LzpjscHBF8mp1fCrDgG2+YnLQ/lcHm9IYAXMwM4e6RrzMLSdZy5puOrC
	TQGX3Qp26ozZgWKGqISPRSNGcQvz+3r8bhrEPyC8J3qCdagzNkC6GOJysUzKL5xMA8tu/z161N9
	DxapiUaX80S79JzfMSjdeJ5k04IohShLMxYEJl+DcA9RCabcx77iSa4sacnXzen61wGw6SWk4U1
	cNyGZacHcWkQrlkAC/gHEWdEfsxwjAdDuZaIzh29mcWLLFe5DTD5H70UR2doV+WW0vI1RNjAEKG
	lpOvCbEAyHyBlTiWcKsxV4LxWl/uM+ATdyRjZgLsYZIVatQ5het7NWb5Bi8kvfn9Z6xaJpXJF1D
	fi+pz1C3itd3YuwCiQiNU5CetuYUFYQnTQwmmfAIn63xlt6VGaRQ41yOARQ2rrrKhNjgnKrZ6il
	xIawuFbhBwrw8KE026WnmkGw==
X-Received: by 2002:a17:903:2348:b0:2bd:a403:1d82 with SMTP id d9443c01a7336-2beb074fa6amr285372355ad.21.1779937431521;
        Wed, 27 May 2026 20:03:51 -0700 (PDT)
X-Received: by 2002:a17:903:2348:b0:2bd:a403:1d82 with SMTP id d9443c01a7336-2beb074fa6amr285371955ad.21.1779937430978;
        Wed, 27 May 2026 20:03:50 -0700 (PDT)
Received: from [10.133.33.250] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2d47sm203898135ad.45.2026.05.27.20.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 20:03:50 -0700 (PDT)
Message-ID: <332c5b1e-8b70-4902-99f3-536dfe8e32bf@oss.qualcomm.com>
Date: Thu, 28 May 2026 11:03:45 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] clk: qcom: Add generic clkref_en support
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: O3tj4dokqfrexJxguW71gPWnOiFjikKb
X-Proofpoint-ORIG-GUID: O3tj4dokqfrexJxguW71gPWnOiFjikKb
X-Authority-Analysis: v=2.4 cv=CaE4Irrl c=1 sm=1 tr=0 ts=6a17b098 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Vq0jQWeKcoOPcsz1E3gA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDAyNyBTYWx0ZWRfXyTBMUQn3Blw9
 jb+i1DvaOF3sbm1rfPUNNDV3KZyF3kZ6FHtqR/d9wffm7Yo4m3eB7vqWj6cAPlaHd2U0XmRP0FT
 A0qf5x2wbcm1a14BJPfV9CGc/jaUBPLdRO3jSxCBsK6o4jn3Nkl1HfbQyFRJZCnN60krgnRZ1WY
 scIUrmh1KHmCwYgcDdIENlon/roqABjFnnctMLBD40tJjH9P0PjG9j5HqtHuGaTLljx/Rc7FClG
 Hpcmn89O+bubhvsY8JSi4Klqmy7vbJmnwxOgMDMtGhs1bo0ddMWnLCuJxX2dfNbdJGOKAnDyrM8
 m/rWteQnTcS8hTFJPfKQ72Gzx7Nqmuu2dKH800Njno+JxDlSotbtPHcIZHsytbP2Ue2Yyvfgq71
 /jhR2RcoJzWyCp8sjOS/SMBVkP10WDTd8uY/p1kiGZP4P6Wj887y71ivijKOc/auTMriL9oZ3Cs
 Ny1HaEwsGEnCUI9beQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280027



On 5/28/2026 10:29 AM, Qiang Yu wrote:
> Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> register controls whether refclk is gated through to the PHY side.
> 
> These clkref controls are different from typical GCC branch clocks:
> - only a single enable bit is present, without branch-style config bits
> - regulators must be voted before enable and unvoted after disable
> 
> Model this as a dedicated clk_ref clock type with custom clk_ops instead
> of reusing struct clk_branch semantics.
> 
> Also provide a common registration/probe API so the same clkref model
> can be reused regardless of where clkref_en registers are placed, e.g.
> TCSR on glymur and TLMM on SM8750.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>   drivers/clk/qcom/Makefile  |   1 +
>   drivers/clk/qcom/clk-ref.c | 205 +++++++++++++++++++++++++++++++++++++++++++++
>   include/linux/clk/qcom.h   |  69 +++++++++++++++
>   3 files changed, 275 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index e100cfd6a52d..c5b02360861d 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -8,6 +8,7 @@ clk-qcom-y += clk-pll.o
>   clk-qcom-y += clk-rcg.o
>   clk-qcom-y += clk-rcg2.o
>   clk-qcom-y += clk-branch.o
> +clk-qcom-y += clk-ref.o
>   clk-qcom-y += clk-regmap-divider.o
>   clk-qcom-y += clk-regmap-mux.o
>   clk-qcom-y += clk-regmap-mux-div.o
> diff --git a/drivers/clk/qcom/clk-ref.c b/drivers/clk/qcom/clk-ref.c
> new file mode 100644
> index 000000000000..213c0f58bb36
> --- /dev/null
> +++ b/drivers/clk/qcom/clk-ref.c
> @@ -0,0 +1,205 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2026, Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/clk/qcom.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/export.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
> +
> +#define QCOM_CLK_REF_EN_MASK BIT(0)
> +
> +struct qcom_clk_ref_provider {
> +	struct qcom_clk_ref *refs;
> +	size_t num_refs;
> +};
> +
> +static inline struct qcom_clk_ref *to_qcom_clk_ref(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct qcom_clk_ref, hw);
> +}
> +
> +static const struct clk_parent_data qcom_clk_ref_parent_data = {
> +	.index = 0,
> +};
> +
> +static int qcom_clk_ref_prepare(struct clk_hw *hw)
> +{
> +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> +	int ret;
> +
> +	if (!rclk->desc.num_regulators)
> +		return 0;
> +
> +	ret = regulator_bulk_enable(rclk->desc.num_regulators, rclk->regulators);
> +	if (ret)
> +		pr_err("Failed to enable regulators for %s: %d\n",
> +		       clk_hw_get_name(hw), ret);
> +
> +	return ret;
> +}
> +
> +static void qcom_clk_ref_unprepare(struct clk_hw *hw)
> +{
> +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> +
> +	if (rclk->desc.num_regulators)
> +		regulator_bulk_disable(rclk->desc.num_regulators, rclk->regulators);
> +}
> +
> +static int qcom_clk_ref_enable(struct clk_hw *hw)
> +{
> +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> +	int ret;
> +
> +	ret = regmap_update_bits(rclk->regmap, rclk->desc.offset, QCOM_CLK_REF_EN_MASK,
> +				 QCOM_CLK_REF_EN_MASK);
> +	if (ret)
> +		return ret;
> +
> +	udelay(10);

try usleep_range instead of udelay for better power consumption.

> +
> +	return 0;
> +}
> +
> +static void qcom_clk_ref_disable(struct clk_hw *hw)
> +{
> +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> +
> +	regmap_update_bits(rclk->regmap, rclk->desc.offset, QCOM_CLK_REF_EN_MASK, 0);
> +	udelay(10);
> +}
> +
> +static int qcom_clk_ref_is_enabled(struct clk_hw *hw)
> +{
> +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read(rclk->regmap, rclk->desc.offset, &val);
> +	if (ret)
> +		return ret;

regmap_read returns a negative error code on failure, but the 
clk_ops.is_enabled() treats the non-zero value as enabled.

Thanks,
Jie

> +
> +	return !!(val & QCOM_CLK_REF_EN_MASK);
> +}
> +
> +static const struct clk_ops qcom_clk_ref_ops = {
> +	.prepare = qcom_clk_ref_prepare,
> +	.unprepare = qcom_clk_ref_unprepare,
> +	.enable = qcom_clk_ref_enable,
> +	.disable = qcom_clk_ref_disable,
> +	.is_enabled = qcom_clk_ref_is_enabled,
> +};
> +
> +static int qcom_clk_ref_register(struct device *dev, struct regmap *regmap,
> +				 struct qcom_clk_ref *clk_refs,
> +				 const struct qcom_clk_ref_desc *descs,
> +				 size_t num_clk_refs)
> +{
> +	const struct qcom_clk_ref_desc *desc;
> +	struct qcom_clk_ref *clk_ref;
> +	size_t clk_idx;
> +	unsigned int i;
> +	int ret;
> +
> +	for (clk_idx = 0; clk_idx < num_clk_refs; clk_idx++) {
> +		clk_ref = &clk_refs[clk_idx];
> +		desc = &descs[clk_idx];
> +
> +		if (!desc->name)
> +			continue;
> +
> +		clk_ref->regmap = regmap;
> +		clk_ref->desc = *desc;
> +
> +		if (clk_ref->desc.num_regulators) {
> +			clk_ref->regulators = devm_kcalloc(dev, clk_ref->desc.num_regulators,
> +							   sizeof(*clk_ref->regulators),
> +							   GFP_KERNEL);
> +			if (!clk_ref->regulators)
> +				return -ENOMEM;
> +
> +			for (i = 0; i < clk_ref->desc.num_regulators; i++)
> +				clk_ref->regulators[i].supply =
> +					clk_ref->desc.regulator_names[i];
> +
> +			ret = devm_regulator_bulk_get(dev, clk_ref->desc.num_regulators,
> +						      clk_ref->regulators);
> +			if (ret)
> +				return dev_err_probe(dev, ret,
> +						     "Failed to get regulators for %s\n",
> +						     clk_ref->desc.name);
> +		}
> +
> +		clk_ref->init_data.name = clk_ref->desc.name;
> +		clk_ref->init_data.parent_data = &qcom_clk_ref_parent_data;
> +		clk_ref->init_data.num_parents = 1;
> +		clk_ref->init_data.ops = &qcom_clk_ref_ops;
> +		clk_ref->hw.init = &clk_ref->init_data;
> +
> +		ret = devm_clk_hw_register(dev, &clk_ref->hw);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct clk_hw *qcom_clk_ref_provider_get(struct of_phandle_args *clkspec, void *data)
> +{
> +	struct qcom_clk_ref_provider *provider = data;
> +	unsigned int idx = clkspec->args[0];
> +
> +	if (idx >= provider->num_refs)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (!provider->refs[idx].regmap)
> +		return ERR_PTR(-ENOENT);
> +
> +	return &provider->refs[idx].hw;
> +}
> +
> +int qcom_clk_ref_probe(struct platform_device *pdev,
> +		       const struct regmap_config *config,
> +		       const struct qcom_clk_ref_desc *descs,
> +		       size_t num_clk_refs)
> +{
> +	struct qcom_clk_ref_provider *provider;
> +	struct device *dev = &pdev->dev;
> +	struct regmap *regmap;
> +	void __iomem *base;
> +	int ret;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	regmap = devm_regmap_init_mmio(dev, base, config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
> +	if (!provider)
> +		return -ENOMEM;
> +
> +	provider->refs = devm_kcalloc(dev, num_clk_refs, sizeof(*provider->refs),
> +				      GFP_KERNEL);
> +	if (!provider->refs)
> +		return -ENOMEM;
> +
> +	provider->num_refs = num_clk_refs;
> +
> +	ret = qcom_clk_ref_register(dev, regmap, provider->refs, descs,
> +				    provider->num_refs);
> +	if (ret)
> +		return ret;
> +
> +	return devm_of_clk_add_hw_provider(dev, qcom_clk_ref_provider_get, provider);
> +}
> +EXPORT_SYMBOL_GPL(qcom_clk_ref_probe);
> diff --git a/include/linux/clk/qcom.h b/include/linux/clk/qcom.h
> new file mode 100644
> index 000000000000..09e2e3178cfb
> --- /dev/null
> +++ b/include/linux/clk/qcom.h
> @@ -0,0 +1,69 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2026, Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __LINUX_CLK_QCOM_H
> +#define __LINUX_CLK_QCOM_H
> +
> +#include <linux/clk-provider.h>
> +#include <linux/errno.h>
> +#include <linux/kconfig.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +
> +struct device;
> +struct platform_device;
> +struct regulator_bulk_data;
> +
> +/**
> + * struct qcom_clk_ref_desc - descriptor for a clkref_en gate clock
> + * @name: clock name exposed to the common clock framework
> + * @offset: clkref_en register offset from the block base
> + * @regulator_names: optional supply names enabled while preparing the clock
> + * @num_regulators: number of entries in @regulator_names
> + */
> +struct qcom_clk_ref_desc {
> +	const char *name;
> +	u32 offset;
> +	const char * const *regulator_names;
> +	unsigned int num_regulators;
> +};
> +
> +/**
> + * struct qcom_clk_ref - per-clock data for a clkref_en gate clock
> + * @hw: common clock framework hardware clock handle
> + * @init_data: common clock framework registration data
> + * @regmap: register map backing the clkref_en register
> + * @desc: clock descriptor copied at registration time
> + * @regulators: optional bulk regulator handles for @desc.regulator_names
> + */
> +struct qcom_clk_ref {
> +	struct clk_hw hw;
> +	struct clk_init_data init_data;
> +	struct regmap *regmap;
> +	struct qcom_clk_ref_desc desc;
> +	struct regulator_bulk_data *regulators;
> +};
> +
> +#if IS_ENABLED(CONFIG_COMMON_CLK_QCOM)
> +
> +int qcom_clk_ref_probe(struct platform_device *pdev,
> +		       const struct regmap_config *config,
> +		       const struct qcom_clk_ref_desc *descs,
> +		       size_t num_clk_refs);
> +
> +#else
> +
> +static inline int
> +qcom_clk_ref_probe(struct platform_device *pdev,
> +		   const struct regmap_config *config,
> +		   const struct qcom_clk_ref_desc *descs,
> +		   size_t num_clk_refs)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +#endif
> +
> +#endif
> 

