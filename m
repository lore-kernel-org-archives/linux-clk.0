Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1451925F7A9
	for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 09:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758878442; cv=none; b=r/IJl1Bq9LHdYxjZaHA5kK16SMAHBr0FBCg3I5Mxv0euqP9ufo0nPWqPCe0VZ9ivB/0paLevo7FxMzifFz93Nki5Y9SUu0xg1j/BqcM8PZAiOLk0Ver9NBB6bKIbMcDPJp+8R5CYtkr/L1ujRJ7nxgSmV01lbp0BC4NFmzsTBUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758878442; c=relaxed/simple;
	bh=FFLhJlGbweJau3CWZze0Dpw9OjhVRBCsdhDY0ijmLSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FbG/PAT1dzk2BcaT+hV/ksI3rYYMhCkudMkZlGglCRQoLvtg2LufbdKoLLAOpn6uvhFKbUVFZTi5HNr7QTFYF7evo1kd9glRMonrCxFZQWbYqlEzhc+b4jjzO6ogZG/GXWu64Tq8lXSL+Ck6uFGDBIlRd+84EisWjDNunSUvanM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YszUB8Ko; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YszUB8Ko"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vdaA011625
	for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 09:20:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lFu/WjwzIa456FPHcfJQDUYZ+72FnaVpv0Jr0vDGqFA=; b=YszUB8KoVynIXOrV
	KQtjRSDsqYGCYWYsCLIP1VTCczDIVIjLmuGO0A+Uud/X/3BHAvMg5mOtUFhod7fa
	BygBv7bFIp/xwgfZyhmr9PWTf/yMTx06rbUYQYkRlw73f2/BdPLRXg+H4x3Xscuj
	psax0GLS+N1ejvavBRDqeL5YcVC15bT1y6mDhxuUbS8vLlOPdRF2YbyZo39PzL9/
	hhZO+DnnQSfF46R+bsrN7/NLWCEgVsDagR+aVTFaXLq7VnZSRfAEAchEUw+YgcU8
	+rB5ZWj2MBvdOK+nwx7PCIaVZ204lLWaXEWKmkFs0rgcsgNJMYAVLp1x3GGuY6CS
	9jokiw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q2977-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 09:20:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-27eca7298d9so40236765ad.0
        for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 02:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758878439; x=1759483239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lFu/WjwzIa456FPHcfJQDUYZ+72FnaVpv0Jr0vDGqFA=;
        b=BdH9ih22o34Rtt4sy2VBboq1B75/WD++8dnK2W0eC9W5fxj6IlC1lErRwAFMGo4BF1
         n3q4sisY7ZQoEej2/i39nOIMGFr9F04b3Ky8wrjvdfenGp5lAmUIQSyfAHyfbFz7OIWm
         lllNjXClPwnMMvAGdmjANqicBS1XGkga0wqbGceZnY0H9qcti5iY7XcuxVc2xyu5bI+j
         Hg5Th/ia+DbHxyeIanLTCw2cV9SoTs2jXf+NQxei70I032cDVXlXC6WV8fsMHexrNLOD
         ZtB3GqCAjcqrM1QyELVUo3mw06X8EUDBPYIL4NqKH3BMDRaMk6Za1ygTTCEVlun0OlOf
         jbmA==
X-Forwarded-Encrypted: i=1; AJvYcCVeYAPPXgCKhG3yRZA7rLXKwCBEU40wmCFfJP26IxsBa+dusD840wscP3d2iantAfPogCUIdy72CRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgXraE5/Ly317QcG/P/6OZKQ/qPRPKmaG57SljboeZMCIP+hdn
	R/fmjXOv7y12FbkjWdUl+6AlKwbYhq539WubLMP5lmcvu2CxSDouIEMeXo/ihomIz8qbyGbCRvk
	h2ZUDRgnbInQ1xQoiiLGuZBGXS9/BF2kL1TeLS2wUZyBQMHV8OSNe9SATS0yHCQA=
X-Gm-Gg: ASbGncsdmullIatgSn3l1f7DAyebIHu48FixOE/IZWkF3hW2fdbmKZMsFBre9MrDU5P
	OcP8vPnz2eTRZ1pb6qSNcPYWJmAiUnvQMsvGPTsAkiEPbirjophStJaixfbAS7o5DoiSsQVS3wy
	PHhmmq8J3UPD7gpqjCG2KGzuyGFENeEXOm465xJdAmpwU7rYk37/A0N0FYzdflvv0BT4/MKfVkV
	2gIb6bcQvIS5Z9rkdE/W5C7PqSkg9sKH8noh2vgp/zyrOej7QfIUmwLvx0/dTzY2nhLmZqkoQcG
	rTNT4xiIhJV79Vz4k2glDgN4AnOlebO0Qi8ahDCtyEi433xqtTHr8NyZQrWBQSKlJ8Fd
X-Received: by 2002:a17:903:986:b0:26c:9b12:2b6f with SMTP id d9443c01a7336-27ed49b85camr71575765ad.3.1758878439225;
        Fri, 26 Sep 2025 02:20:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7rrW7nDK+DSsZ1+iAO+YYBObXr6q47Vhq5ZpJ+PYNdGMhbv2C4q/3UQ6WknVUYLqfgBU/xA==
X-Received: by 2002:a17:903:986:b0:26c:9b12:2b6f with SMTP id d9443c01a7336-27ed49b85camr71575355ad.3.1758878438738;
        Fri, 26 Sep 2025 02:20:38 -0700 (PDT)
Received: from [10.217.216.188] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed672aa0asm49116955ad.62.2025.09.26.02.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 02:20:38 -0700 (PDT)
Message-ID: <2e862560-c422-427e-bace-4199b86d3e6d@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 14:50:32 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] clk: qcom: videocc-sm8750: Add video clock
 controller driver for SM8750
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250829-sm8750-videocc-v2-v2-0-4517a5300e41@oss.qualcomm.com>
 <20250829-sm8750-videocc-v2-v2-3-4517a5300e41@oss.qualcomm.com>
 <503e1fde-39ea-4107-947b-18b705f2bc51@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <503e1fde-39ea-4107-947b-18b705f2bc51@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5Iz66poz1iX6VreQP1_tPdRp2mtIUqIN
X-Proofpoint-GUID: 5Iz66poz1iX6VreQP1_tPdRp2mtIUqIN
X-Authority-Analysis: v=2.4 cv=aZhsXBot c=1 sm=1 tr=0 ts=68d65ae8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=TyDm9B-wxu7uxzFpS6AA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX4WPLFO/463sX
 jpFMKiRaOTb1aNSP2UljAJxyizfhnYVNz1o4ttLEkJ0CO2/36velddg0EqvZCw8/eGlcEAWqgzY
 nEXRTvt0OPnM8k44cbSH66dcT0Ok7iiVX6Bg4JWOO7R1WStaS5xL7onXZ2V8409AOPaRkZiRWa5
 T9tHnNX8fGapUw4fFhgF2m1SdZFbDFVz0o3Lt0qy4UsDh/2/7xXSrf8qRfXXaJ4VcLGdDpy/rC5
 n95rJ5f0TOTZf84x4ndNiUG4KbXTmzev5cAC/nXXTQmj1/xTvtE2oyTxB/PAhAurTsUxHXHW7rj
 5UHyS7dfDjn2gR2JTnWkhCQR/g54f/fXGNZ1rrDn9trzsPWdno3uK6aHH3lqeh+LExC1pbK/ltF
 BCUAR2GM9xpoeYzgV9r9ZNOju7fBVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171



On 9/12/2025 4:38 PM, Konrad Dybcio wrote:
> On 8/29/25 12:15 PM, Taniya Das wrote:
>> Add support for the video clock controller for video clients to be able
>> to request for videocc clocks on SM8750 platform.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static int video_cc_sm8750_probe(struct platform_device *pdev)
>> +{
>> +	struct regmap *regmap;
>> +	int ret;
>> +
>> +	ret = devm_pm_runtime_enable(&pdev->dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = pm_runtime_resume_and_get(&pdev->dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	regmap = qcom_cc_map(pdev, &video_cc_sm8750_desc);
>> +	if (IS_ERR(regmap)) {
>> +		pm_runtime_put(&pdev->dev);
>> +		return PTR_ERR(regmap);
>> +	}
>> +
>> +	clk_taycan_elu_pll_configure(&video_cc_pll0, regmap, &video_cc_pll0_config);
>> +
>> +	/* Update DLY_ACCU_RED_SHIFTER_DONE to 0xF for mvs0, mvs0c */
>> +	regmap_update_bits(regmap, 0x8074, 0x1e00000, 0x1e00000);
> 
> regmap_update_bits(..., GENMASK(x, y) /* full field width */, 0xf)

Sure, Konrad, will update the change.

> 
> would be easier for the next person to check against docs in case this
> needs to ever change or be validated
>> +	regmap_update_bits(regmap, 0x8040, 0x1e00000, 0x1e00000);
>> +
>> +	regmap_update_bits(regmap, 0x9f24, BIT(0), BIT(0));
> 
> The register description mentions a ticket which I believe says this
> is not necessary in production hardware
> 

It is required on production hardware as well.

>> +
>> +	/*
>> +	 * Keep clocks always enabled:
>> +	 *	video_cc_ahb_clk
>> +	 *	video_cc_sleep_clk
>> +	 *	video_cc_xo_clk
>> +	 */
>> +	regmap_update_bits(regmap, 0x80a4, BIT(0), BIT(0));
>> +	regmap_update_bits(regmap, 0x80f8, BIT(0), BIT(0));
>> +	regmap_update_bits(regmap, 0x80d4, BIT(0), BIT(0));
> 
> Please use the new _desc infra
> 
> Konrad

Yes, will migrate to use the _desc infra.

-- 
Thanks,
Taniya Das

