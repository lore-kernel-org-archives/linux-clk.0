Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2B629DB8F
	for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 12:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751027831; cv=none; b=B2wwoZCyYJBXYsbrFlTO9lXBO+ldIi93BC6otPkz7i56kTNneGGhTwQrhiGCaebFYNHz+LacA4WYa40XCL+vwlDW3/qG4/vhx1gVSuZLC7kkvl8GjZxQbckRcVw+jB5wXnQvu9QMw4DYzSr1F/aoxbVqaHcg5OiOwGAnpZjKqAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751027831; c=relaxed/simple;
	bh=nA0EBTgDXpgCH6r8MZS4yR/dLw++4gxjwURZnOL3HLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JtWrdhSROxvn97Qt5wk9N4c1RGN7iOWiA/LzHZ14rUjqsWLHJjZALiPNFsegq9LLJcDJMS7d8zVBtqM9R/nDploHwRcixymtoU3ppw3jcC+rnXSyxlrcVz8cPnV0hfwXWqlw3n3ETjQoVtVL2WxcRS3pjS1Ja0KgWJJ4fH6vrb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EM1YY02A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EM1YY02A"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC1crB032657
	for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 12:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wAz0TL7lcdUxA4iFRWSjq9TB9NAzt1Ff1a2cuJJOS2o=; b=EM1YY02An5mDhU0+
	NViwHpVc8NBW7ga7Au6K48EHg4vnqIuQK0bSLXfjvv4tmYU8+bAzrhq5hdUWRMLx
	+JEwpC38U94p1yUCPUaxn2k30V4iqXSlN3MUwfjk/2rRCexYvX/D3OSjSdpcXGg6
	u9kHSy382DEfp+NDV+MRUQwtdmIPLZkPeXiB6RAjHVSHt+FV9DlbPl3WxPaffEW3
	pNDaTyWrP1hQoPm0xtnpMhcjZmDwnBdIbwKiZusM5X3FOue2Q86OQuHwPInWtcRe
	YD4uvl+7DpjwA4q+4lnk2+G0J5TAkFogcCAPcPjsAXitQxk9N5zFItUp+lU+JdOa
	/RxM0g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdgu9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 12:37:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d399065d55so272835885a.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 05:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751027827; x=1751632627;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wAz0TL7lcdUxA4iFRWSjq9TB9NAzt1Ff1a2cuJJOS2o=;
        b=B4D7W4BVk1bXUvD9l9OOMcSJQks2OHfZ3hWyTwdxQWxtv4QiLu4JV/ILuWZ/Qn/3pB
         u7VudDp4esoDq6a+oGc2cFBRDBMgUEaqAmZFyAZXutH2foG/UBvhnJJUvyyYKbT2Td/4
         5NSjxn4f7R9Q5mwaX49uZqDi3pyvp5b9AXrUQTedaIw6ZtES2fIKX9xpiXqxx4F26rKt
         +Y9/RpWsxsmT/XmFQqNVIcCQuplM8MM3yA5tGrcEY/JFIahWjjvZrAS+GYabkmPNznT/
         2bYWVoXwjFS234eFopePZpqkXgj4rCqmHp5fmurPXr3Wr2phz9kAiIj/cVSh1+Tz1W5Q
         KuRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnUTHXXiM4U7IV2Jj67KijVzy6DDL7fUfWdSmBqlBRAM+cephkVOi6G2CLPE9TWyue9qmmt9DZLZM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFLNMShCBQaBV2SqL27ROLfc308kBoXVwSkc0XGwBlSOpm9ZUO
	wtt2lqWgnmQqzhpLy2gK1Dn70vIUKBNTaWFkz3msMVs7E/SmuptyJ+aelV2I7z4DS7sGSffOzU4
	sqFqVXTktAvf6gUKyh7bZBR7+pyrtlo9bQL3bGLF3TPUWynJg7YF74HC0cVttoMU=
X-Gm-Gg: ASbGncuvQBz5U+Ns76xE5vdDXTHlTv/HNL1hcXrZ6Vl5UqWhMLFFZfEVBEGjibL0Kuc
	xBsloc/emc2jj/4ques3Jumlsprm44CJwJU/0MF/e9hel7E3Z60Rfx53P1hYL8x2KxqRdsnHnl2
	H8pOF5hMxCiYrx5boC++v5qEuOD7QjVIfyn2GS1zPDlpvdHO5LJey0Ams0Ucp/FinI/qfaV8NHZ
	CJZYQk2ypUx5t594nxuenDGrBOq0U4yR1Uz7dRX/YJL0KDNZ8W/he7ykMwcGDhuskro8kGcD/mp
	lkRq+iEcFt58RWiCHvBAZj5YE2w8Qqp8eC7GcKv7JJEX3kuD9f+vRJvoLt9gdVeS1V2R+3gB
X-Received: by 2002:a05:620a:4009:b0:7ca:efbd:f4f4 with SMTP id af79cd13be357-7d4439a37e7mr465645485a.56.1751027827331;
        Fri, 27 Jun 2025 05:37:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCxBke75XiU4P29zUlVR89IlIUHFxI4koZUgqia/W7QYIrDc/FKS/y6TSYgHEYIi97FOYfMQ==
X-Received: by 2002:a05:620a:4009:b0:7ca:efbd:f4f4 with SMTP id af79cd13be357-7d4439a37e7mr465640985a.56.1751027826895;
        Fri, 27 Jun 2025 05:37:06 -0700 (PDT)
Received: from [10.185.26.70] (37-33-181-83.bb.dnainternet.fi. [37.33.181.83])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2c4f24sm430368e87.143.2025.06.27.05.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 05:37:06 -0700 (PDT)
Message-ID: <667ac51f-d19d-4832-9aa6-97d9a86e0068@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 15:37:09 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 01/10] clk: qcom: clk-alpha-pll: Add support for
 dynamic update for slewing PLLs
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250625-qcs615-mm-v10-clock-controllers-v10-0-ec48255f90d8@quicinc.com>
 <20250625-qcs615-mm-v10-clock-controllers-v10-1-ec48255f90d8@quicinc.com>
 <trwdfk2oz2udtbiqxh3ybuqbvasfqywmqxgi4xyvsknz6svs2r@icpp7snpq6c5>
 <44dddd3f-d2d2-4d4b-831a-21e6d9050445@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <44dddd3f-d2d2-4d4b-831a-21e6d9050445@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685e9074 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=a09MB1VsJqAZHPW3esczKA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=-U2GbryNtLgmjeNmToIA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwNCBTYWx0ZWRfXwlDM0hARAzp5
 vuWc3/y6zfCI+uo6N3I11jsq+JcyVurEQ3OeYq5uDS7Vr/GjAT8lB/dSVDUI6heKYVTZ52h+Vp2
 DV2xDXWbZLvysPc2MNHfcPK9aXbERshKVj4rN02EUeVvNC8NHv/bpjHz596xjMx9Yw9OZ+lM6Pq
 sZjwSUvHtCMjg5tBdoHkYe3oRwdr848SvH+B9j5LGvVVmCXEy1tj8PTSTLGM4lBQLkV6TSEGKrT
 C+Fd+Q8SZowvrCCwetFy5c3e55xBrVkHy8w53p9RWjLmImx7zzU3szRzX9p2n8BnZoPPb61iMOb
 rSopGJlKK4ba5bY05+m+oNUFtsDrLZmV2khQB18ipJQbrRci25bUiGI3M2NO6b06XseJgH+XlEE
 XFwHBgEMdM9kQeJXGcgA886OaQV9NVOAlbl/NYmLoaAva/it7dfEGxKZlyLkDvsvqjvV3Qj6
X-Proofpoint-GUID: 1RyqHmzxF2Ok9xTKMR4lSfLwseadkxLQ
X-Proofpoint-ORIG-GUID: 1RyqHmzxF2Ok9xTKMR4lSfLwseadkxLQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270104

On 27/06/2025 13:13, Taniya Das wrote:
> 
> 
> On 6/25/2025 5:17 PM, Dmitry Baryshkov wrote:
>> On Wed, Jun 25, 2025 at 04:13:26PM +0530, Taniya Das wrote:
>>> The alpha PLLs which slew to a new frequency at runtime would require
>>> the PLL to calibrate at the mid point of the VCO. Add the new PLL ops
>>> which can support the slewing of the PLL to a new frequency.
>>>
>>> Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> ---
>>>   drivers/clk/qcom/clk-alpha-pll.c | 169 +++++++++++++++++++++++++++++++++++++++
>>>   drivers/clk/qcom/clk-alpha-pll.h |   1 +
>>>   2 files changed, 170 insertions(+)
>>>
> 
>>> +	/*
>>> +	 * Dynamic pll update will not support switching frequencies across
>>> +	 * vco ranges. In those cases fall back to normal alpha set rate.
>>> +	 */
>>> +	if (curr_vco->val != vco->val)
>>> +		return clk_alpha_pll_set_rate(hw, rate, parent_rate);
>>> +
>>> +	a <<= ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH;
>>> +
>>> +	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
>>> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(a));
>>> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(a));
>>
>> We have code that does this in __clk_alpha_pll_set_rate() and now you
>> are adding two more copies. Please extract PLL_L_VAL, PLL_ALPHA_VAL and
>> PLL_USER_CTL / PLL_VCO_MASK into a helper function.
>>
> 
> Dmitry, I was thinking of implementing the following as a reusable
> helper since it can be leveraged by most of the functions. I'd
> appreciate your suggestions or feedback.

The code below looks good to me. Please use 'alpha' instead of 'a'.

> 
> static void clk_alpha_pll_update_configs(struct clk_alpha_pll *pll,
> const struct pll_vco *vco, u32 l, u64 a, u32 alpha_width, bool alpha_en)
> {
> 	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
> 
> 	if (alpha_width > ALPHA_BITWIDTH)
> 		a <<= alpha_width - ALPHA_BITWIDTH;
> 
> 	if (alpha_width > 32)
> 		regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(a));
> 
> 	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(a));
> 
> 	if (vco) {
> 		regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
> 				   PLL_VCO_MASK << PLL_VCO_SHIFT,
> 				   vco->val << PLL_VCO_SHIFT);
> 	}
> 
> 	if (alpha_en)
> 		regmap_set_bits(pll->clkr.regmap, PLL_USER_CTL(pll), PLL_ALPHA_EN);
> }
> 
> 
>>> +
>>> +	/* Ensure that the write above goes before slewing the PLL */
>>> +	mb();
>>> +
>>> +	if (clk_hw_is_enabled(hw))
>>> +		return clk_alpha_pll_slew_update(pll);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +/*
>>> + * Slewing plls should be bought up at frequency which is in the middle of the
>>> + * desired VCO range. So after bringing up the pll at calibration freq, set it
>>> + * back to desired frequency(that was set by previous clk_set_rate).
> 
>>>
>>
> 


-- 
With best wishes
Dmitry
