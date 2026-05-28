Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5340823F417
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 13:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976022; cv=none; b=dc/GJGXDNKwdAtUGWw6VD0M/F+x69PjHeSyHuwUCW7x5n1Djh7czh+roTXy4XvOMBLF09ywMeFzwvBxW8zaVpcGFaQKKIzY2U95rLwl/IQhie8LgYvtwj33vBSB5l9bDEstbm+EydwQVsJyitNwiD5Wg9obSGLtVPCsW5k04h2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976022; c=relaxed/simple;
	bh=OkFcDZ/Ato6eXuGKS9g9eKIeQ3vGBtWHLlH+2CqUe5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S7jWvKpOKPLh0xb3JlyemhjJwygzIbUYLXLXoqoDq0eNQ55fAD/5DlkuMqtinO3nSm0zHPt4Vcn5zT8kUTUtojdV+UYZWWfKQCTlmb7cEjKXF9hN1h+nbHaDSLeiFGGFgmoXk2izKo+RvvRQ1NCHtnP+xuu6wYs9FHhxLmeKf6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ehdx3hoz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cwf5z9y/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ehdx3hoz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cwf5z9y/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vYGT1697184
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 13:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0D/KkWHTaB3TOoB7EDGNMthVvl8le95oSMP8KQVCtEE=; b=Ehdx3hozrhm+7JT+
	U2vWAN0G062Xfrl1KnrlcgboDIkhrLnVfEsLGpoWyFr0QVparikIGzI3W66mEVBR
	glgMz5lbjZGA9SBPmlfjbqOguv312sbQbpcPYPY+6sC0lCkPLLsQ2TmR3QM6WsYu
	shMJ6RXZp2sDQdPsCZ76OoW4nCwTV7uTXNYpn7kjMOjlZ2F2C+DooidFhsgl8+Fa
	iFtHLGKq7U8PnSNTv2ddh2C3y8I3JfDhj3C2bEQrHGvUthpxZOJPQ4C9bM4/z1tA
	WJ9NUs4eZ1o1MJTM0gYiQ61YOqNcMXM2Tm3EIDJ9quKl68RhiYMoYdC+shPylrEg
	fDD1mg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yajy8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 13:47:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba5f794825so102674685ad.0
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 06:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779976020; x=1780580820; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0D/KkWHTaB3TOoB7EDGNMthVvl8le95oSMP8KQVCtEE=;
        b=cwf5z9y/QKs8XbIRprt12klPHqQvjKbP+XOC1mJUOgKPZY2qzKnS/M7tGLr5YpMz01
         zPBToGesePnxstqy9HhlO2Hp9mIaBPOLwFIx0BHVKg78uOTZZGIvxhYsbvuFlIzocmYw
         z60htOw/uaQZ+YgQYtvFSwQIflg5pEJvQOogTsJLpYmXElmLf7xa4m1m3eWk69qPc8+k
         POkHzTEelimO5BkcD6aaCF8vORkLBbjGbOSYUSUmaLSZCzlkwmbjRbFuGruSrehnbPRn
         BBWlFVJeoLt0LezisFTn21Q1eC9UsmbprpqQ4Vwy8WB4BkqWQ/0SdzJO/bT2BCAR/SuP
         GUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779976020; x=1780580820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0D/KkWHTaB3TOoB7EDGNMthVvl8le95oSMP8KQVCtEE=;
        b=ZAVnMktaQuRG8g2snfMcQ4jhnVZbipLSTRVj8mISYmPOCuxLfSQx0PxDc1TBT5Mr3y
         Kec1AMxJBWSQAo6oWH1m0lH0h/x8fLYJ2DqslyVBzPDT19s2Hqj24dO+Nf6OAXbaO+Ae
         h3V9wWI5S8wd1IFoxgZjPuD+2uXYNkGlbwjy+rkm2lkcsNPi18qJuEgZ099JiNn/+c9I
         qgelZwjbIpzwYeUs8IHZ4vZ/pz5nJOU+Li4z0S40pMRgWAikTxybl9GvDlqnMkScVbUR
         uOX9HXafaQI9dZ3a78R05Fg/RJNYCR6E42PUoTxXiRPDfxO1DgaaK0JZvt1zz0/V/Yte
         pDlQ==
X-Forwarded-Encrypted: i=1; AFNElJ+/gOjjWm/Y8pVbxkj4q4YOT1Ov2m2C+DUVPBlkKBoiWlVeCri+lTMlibpmA+AAhUl8Llu4FVwYrn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeZ704g81/oNNLshVr7H/QCcQLi24ogot4HEQgLOGC/VHwAk7B
	Wmsr2Cz/zgjNHU0+6zrAOg5QYnTSnEUNPCbqaVw5lMAjaJC93nrFw1LbhEgJT6ZNSLkf4zvtWRT
	lajdEl2uovU+3OK4xqtFaAgUXvOHV29Mcr5tEp2lzkqUuG2UTbG2nn8E5IGs2kWQ=
X-Gm-Gg: Acq92OE6Y8Ys89Xjuch4uNVlLW240RqE3jw+TDG7wpoW7/NoJaRfeLNbHTAVLUJnUkQ
	/0OIeRlHaow9gggjUHb5/1WGvX6Bg68SLGtrZOHgoyVOse8i/IwAFH6Hzcue4nQCqZfWCGZcInZ
	kTXif7ue+bVk1PmEiWJPKgnsnbQBpnh0P5A1ZlHzXJvXk8xyW65+qEa6ATnGyC9Ss071X8zJtEB
	JNjklFUfufC6cuK3aHKALpXfi2MbhBM7+IaVZ/oXAm3Hg1xECgtywSD4KjTaISlU74ko/GasZj/
	ClT7M0kGkRLJOHMenGko3pjlVS4DB0e1eZrXd4/zQBBSMOzenXGY1lTi0np8okAz5Xxgi9Znn1Y
	UI3K9xvG6ioRHFUEctdmWqrXMhSiHxP38l3lMQlaI7G/FxFf7Taa1H9KS8gEasXm8VNFP9VbvC/
	tELfBmftP8eVfl1X5rWT1/Ng==
X-Received: by 2002:a17:903:2bcc:b0:2b2:5099:2f3e with SMTP id d9443c01a7336-2beb06ea859mr298323465ad.4.1779976019726;
        Thu, 28 May 2026 06:46:59 -0700 (PDT)
X-Received: by 2002:a17:903:2bcc:b0:2b2:5099:2f3e with SMTP id d9443c01a7336-2beb06ea859mr298322915ad.4.1779976019194;
        Thu, 28 May 2026 06:46:59 -0700 (PDT)
Received: from [10.133.33.254] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56ba00csm182564155ad.22.2026.05.28.06.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 06:46:58 -0700 (PDT)
Message-ID: <791b1b88-d2d1-41f3-8902-d63dbd524bd7@oss.qualcomm.com>
Date: Thu, 28 May 2026 21:46:51 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] clk: qcom: Add generic clkref_en support
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
 <332c5b1e-8b70-4902-99f3-536dfe8e32bf@oss.qualcomm.com>
 <ahg9uFs1LqthstWi@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <ahg9uFs1LqthstWi@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7UbJhcUHAmyfzvtCA7nsBmoYJbI-bP59
X-Proofpoint-GUID: 7UbJhcUHAmyfzvtCA7nsBmoYJbI-bP59
X-Authority-Analysis: v=2.4 cv=E/r9Y6dl c=1 sm=1 tr=0 ts=6a184754 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=IqM-ao-owgBUIpmU7ckA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEzOCBTYWx0ZWRfXw/0c6EKY2279
 Io+bPyaC1iHf/+Y1qD38hzD0PTi9TN7RO/4v/7t7MiCxIOfpIRuUorlwmx67+PxpJyN5r8a8IUu
 3qbJP96HutU6QvMq04rxUOcMEjEXVlW9GlZP3cmbdbdjh252hStssrAn3LGnG8/lKbi1riFkILb
 bAEHcqc2JJBPeGdfYiZ+z8b1ZSBUHCqdHGUCmZ/L0LiCFGj5xN4S7hr5zwsSJANwr8gLH7CLB00
 Vtisxaib3M3d8k2Q9CEDGC1O5Ptfyj6cBI21F0Q0h1h69OsN7oPu2/o3+AaEy3hUxPfe9Elnr05
 /0JoxOXWy+Cc4TBYc57b1X9nNRcZ5rbkcJQOAtpkAOPgIjmE45bIGMliDV4AnfcIO5YSAO8c6pQ
 4RlS5oV8rGQeJQTeH6OmrYEU2mat+zhqs4RweMaiYgdGRrIIDOs231CiMSpdLaXsyww/R/xxT7Y
 YVHGgmLEfONN3tSqrUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280138



On 5/28/2026 9:06 PM, Qiang Yu wrote:
> On Thu, May 28, 2026 at 11:03:45AM +0800, Jie Gan wrote:
>>
>>
>> On 5/28/2026 10:29 AM, Qiang Yu wrote:
>>> Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
>>> a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
>>> register controls whether refclk is gated through to the PHY side.
>>>
>>> These clkref controls are different from typical GCC branch clocks:
>>> - only a single enable bit is present, without branch-style config bits
>>> - regulators must be voted before enable and unvoted after disable
>>>
>>> Model this as a dedicated clk_ref clock type with custom clk_ops instead
>>> of reusing struct clk_branch semantics.
>>>
>>> Also provide a common registration/probe API so the same clkref model
>>> can be reused regardless of where clkref_en registers are placed, e.g.
>>> TCSR on glymur and TLMM on SM8750.
>>>

[...]

>>> +
>>> +static int qcom_clk_ref_is_enabled(struct clk_hw *hw)
>>> +{
>>> +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
>>> +	u32 val;
>>> +	int ret;
>>> +
>>> +	ret = regmap_read(rclk->regmap, rclk->desc.offset, &val);
>>> +	if (ret)
>>> +		return ret;
>>
>> regmap_read returns a negative error code on failure, but the
>> clk_ops.is_enabled() treats the non-zero value as enabled.
>>
> 
> A regmap_read failure doesn't mean the clock is disabled.

Do we have special reason to treat the error number as "true"? Its 
worthy to add a comment to explain why.

Thanks,
Jie

> 
> - Qiang Yu
>> Thanks,
>> Jie
>>
>>> +
>>> +	return !!(val & QCOM_CLK_REF_EN_MASK);
>>> +}
>>> +
>>> +static const struct clk_ops qcom_clk_ref_ops = {
>>> +	.prepare = qcom_clk_ref_prepare,
>>> +	.unprepare = qcom_clk_ref_unprepare,
>>> +	.enable = qcom_clk_ref_enable,
>>> +	.disable = qcom_clk_ref_disable,
>>> +	.is_enabled = qcom_clk_ref_is_enabled,
>>> +};
>>> +
>>> +static int qcom_clk_ref_register(struct device *dev, struct regmap *regmap,
>>> +				 struct qcom_clk_ref *clk_refs,
>>> +				 const struct qcom_clk_ref_desc *descs,
>>> +				 size_t num_clk_refs)
>>> +{
>>> +	const struct qcom_clk_ref_desc *desc;
>>> +	struct qcom_clk_ref *clk_ref;
>>> +	size_t clk_idx;
>>> +	unsigned int i;
>>> +	int ret;
>>> +
>>> +	for (clk_idx = 0; clk_idx < num_clk_refs; clk_idx++) {
>>> +		clk_ref = &clk_refs[clk_idx];
>>> +		desc = &descs[clk_idx];
>>> +
>>> +		if (!desc->name)
>>> +			continue;
>>> +
>>> +		clk_ref->regmap = regmap;
>>> +		clk_ref->desc = *desc;
>>> +
>>> +		if (clk_ref->desc.num_regulators) {
>>> +			clk_ref->regulators = devm_kcalloc(dev, clk_ref->desc.num_regulators,
>>> +							   sizeof(*clk_ref->regulators),
>>> +							   GFP_KERNEL);
>>> +			if (!clk_ref->regulators)
>>> +				return -ENOMEM;
>>> +
>>> +			for (i = 0; i < clk_ref->desc.num_regulators; i++)
>>> +				clk_ref->regulators[i].supply =
>>> +					clk_ref->desc.regulator_names[i];
>>> +
>>> +			ret = devm_regulator_bulk_get(dev, clk_ref->desc.num_regulators,
>>> +						      clk_ref->regulators);
>>> +			if (ret)
>>> +				return dev_err_probe(dev, ret,
>>> +						     "Failed to get regulators for %s\n",
>>> +						     clk_ref->desc.name);
>>> +		}
>>> +
>>> +		clk_ref->init_data.name = clk_ref->desc.name;
>>> +		clk_ref->init_data.parent_data = &qcom_clk_ref_parent_data;
>>> +		clk_ref->init_data.num_parents = 1;
>>> +		clk_ref->init_data.ops = &qcom_clk_ref_ops;
>>> +		clk_ref->hw.init = &clk_ref->init_data;
>>> +
>>> +		ret = devm_clk_hw_register(dev, &clk_ref->hw);
>>> +		if (ret)
>>> +			return ret;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static struct clk_hw *qcom_clk_ref_provider_get(struct of_phandle_args *clkspec, void *data)
>>> +{
>>> +	struct qcom_clk_ref_provider *provider = data;
>>> +	unsigned int idx = clkspec->args[0];
>>> +
>>> +	if (idx >= provider->num_refs)
>>> +		return ERR_PTR(-EINVAL);
>>> +
>>> +	if (!provider->refs[idx].regmap)
>>> +		return ERR_PTR(-ENOENT);
>>> +
>>> +	return &provider->refs[idx].hw;
>>> +}
>>> +
>>> +int qcom_clk_ref_probe(struct platform_device *pdev,
>>> +		       const struct regmap_config *config,
>>> +		       const struct qcom_clk_ref_desc *descs,
>>> +		       size_t num_clk_refs)
>>> +{
>>> +	struct qcom_clk_ref_provider *provider;
>>> +	struct device *dev = &pdev->dev;
>>> +	struct regmap *regmap;
>>> +	void __iomem *base;
>>> +	int ret;
>>> +
>>> +	base = devm_platform_ioremap_resource(pdev, 0);
>>> +	if (IS_ERR(base))
>>> +		return PTR_ERR(base);
>>> +
>>> +	regmap = devm_regmap_init_mmio(dev, base, config);
>>> +	if (IS_ERR(regmap))
>>> +		return PTR_ERR(regmap);
>>> +
>>> +	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
>>> +	if (!provider)
>>> +		return -ENOMEM;
>>> +
>>> +	provider->refs = devm_kcalloc(dev, num_clk_refs, sizeof(*provider->refs),
>>> +				      GFP_KERNEL);
>>> +	if (!provider->refs)
>>> +		return -ENOMEM;
>>> +
>>> +	provider->num_refs = num_clk_refs;
>>> +
>>> +	ret = qcom_clk_ref_register(dev, regmap, provider->refs, descs,
>>> +				    provider->num_refs);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	return devm_of_clk_add_hw_provider(dev, qcom_clk_ref_provider_get, provider);
>>> +}
>>> +EXPORT_SYMBOL_GPL(qcom_clk_ref_probe);
>>> diff --git a/include/linux/clk/qcom.h b/include/linux/clk/qcom.h
>>> new file mode 100644
>>> index 000000000000..09e2e3178cfb
>>> --- /dev/null
>>> +++ b/include/linux/clk/qcom.h
>>> @@ -0,0 +1,69 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Copyright (c) 2026, Qualcomm Technologies, Inc. and/or its subsidiaries.
>>> + */
>>> +
>>> +#ifndef __LINUX_CLK_QCOM_H
>>> +#define __LINUX_CLK_QCOM_H
>>> +
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/errno.h>
>>> +#include <linux/kconfig.h>
>>> +#include <linux/regmap.h>
>>> +#include <linux/types.h>
>>> +
>>> +struct device;
>>> +struct platform_device;
>>> +struct regulator_bulk_data;
>>> +
>>> +/**
>>> + * struct qcom_clk_ref_desc - descriptor for a clkref_en gate clock
>>> + * @name: clock name exposed to the common clock framework
>>> + * @offset: clkref_en register offset from the block base
>>> + * @regulator_names: optional supply names enabled while preparing the clock
>>> + * @num_regulators: number of entries in @regulator_names
>>> + */
>>> +struct qcom_clk_ref_desc {
>>> +	const char *name;
>>> +	u32 offset;
>>> +	const char * const *regulator_names;
>>> +	unsigned int num_regulators;
>>> +};
>>> +
>>> +/**
>>> + * struct qcom_clk_ref - per-clock data for a clkref_en gate clock
>>> + * @hw: common clock framework hardware clock handle
>>> + * @init_data: common clock framework registration data
>>> + * @regmap: register map backing the clkref_en register
>>> + * @desc: clock descriptor copied at registration time
>>> + * @regulators: optional bulk regulator handles for @desc.regulator_names
>>> + */
>>> +struct qcom_clk_ref {
>>> +	struct clk_hw hw;
>>> +	struct clk_init_data init_data;
>>> +	struct regmap *regmap;
>>> +	struct qcom_clk_ref_desc desc;
>>> +	struct regulator_bulk_data *regulators;
>>> +};
>>> +
>>> +#if IS_ENABLED(CONFIG_COMMON_CLK_QCOM)
>>> +
>>> +int qcom_clk_ref_probe(struct platform_device *pdev,
>>> +		       const struct regmap_config *config,
>>> +		       const struct qcom_clk_ref_desc *descs,
>>> +		       size_t num_clk_refs);
>>> +
>>> +#else
>>> +
>>> +static inline int
>>> +qcom_clk_ref_probe(struct platform_device *pdev,
>>> +		   const struct regmap_config *config,
>>> +		   const struct qcom_clk_ref_desc *descs,
>>> +		   size_t num_clk_refs)
>>> +{
>>> +	return -EOPNOTSUPP;
>>> +}
>>> +
>>> +#endif
>>> +
>>> +#endif
>>>
>>

