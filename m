Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73434318EC1
	for <linux-clk@vger.kernel.org>; Tue,  8 Sep 2026 03:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788838112; cv=none; b=tT0PuBZWZFKlHc4NoQb4dqFj9VzlfVdt33FBU4O2bejJ2U2SrPXVk2NifRmua1JmAQ49a3be1Rvg5HMgd0f0YXxiOgGtBNyGZbsyQOSvBGGGF3/gIS+Wl1XJ7ek+pI7U4CnDsffxEHRBbIVgfjQZYZYxJYaYDlNuYEfYX5LuoIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788838112; c=relaxed/simple;
	bh=SyhZKiR68CZ04tzIfEj/DtTdEFdN4/+8mi8sTjIBL/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SixWVUqdXV/FJKBz7hY80wkKkQ0ng/qXfizLUlMv914ABKsh1E6P4c3PQC9MTwRseOcrQAFM9HGCNOzmh9JbDOkAsPlJkbYiCtuQRhM+1WV4F9ho4HHSr6n0XDHVHnuK6SfUbLWWG8brRIqeTBaGBlLsGjLIoNXqi6r25MAxiZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VSZM+V4D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aSDJrO7Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VSZM+V4D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aSDJrO7Y"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687NlJae637439
	for <linux-clk@vger.kernel.org>; Tue, 8 Sep 2026 03:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jOFICu+/TxYyTegVJ+ic4nC3wN/lY3Z7pXeHMMmZOvA=; b=VSZM+V4Do+jdXhlN
	2d8azx9IAXqGN+B+Jdai8z71xYN2/OXILt/DaCSL3p0P199h+aw4VxYB5NCbFmaR
	0R7cBAYLyNtkJmoSteNTq//yf7tc14L1wqQfbGLuV0D9PgbrEpgNOF1oTsUqt+3J
	0UHb0n7nb29dA7CKDTmdBu2TLbn5K3e/vVnCndA7OARl/cTzykP9wWAk16dh7tcB
	2sXcKqIzEkOAwuzU6mB+7lwElhWKYSKfpCb2L3shTFMRHrI0Vzs9v3nitoNWpzld
	/xyihy9TvDT8c41fTh2bgupuavgd1II4cvRXGoBJVUcuaN/5fq2ZtRu1N/AXuAxr
	ezbpLQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsw23crf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 08 Sep 2026 03:28:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3968dfff779so5682930a91.1
        for <linux-clk@vger.kernel.org>; Mon, 07 Sep 2026 20:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788838110; x=1789442910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jOFICu+/TxYyTegVJ+ic4nC3wN/lY3Z7pXeHMMmZOvA=;
        b=aSDJrO7YDEt+ZxczKbzHcG5KbWK4Qxe7pXbpbFikaDMy2oJoJp3Lr4pv/OHClpmNs+
         jby2heF1mOVzrJ8Imvh7jzfTusrVf+a5Fb5Yc6VD+El/Kdu4azRQQSsvAelSfynbiH4d
         vY5dUWs6Gd0NfyvM/cz+xCeiBXkDcxPJerZUkQ/PMM4uClO63yNqM2o5N+CD9d2ISk2R
         Rhc0KK15Uml6f5a1LFB2ZhdAdb/1GfNmOqirnfy+oCsMlHim3lHBYpHQXz2hup9x85nw
         2ddLX36NsL7z5ElU3idmuZBqP/P0NboKDy/KxY0q93n1C0zmt0nxuDcfz3xNOYKf+9BM
         hfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788838110; x=1789442910;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jOFICu+/TxYyTegVJ+ic4nC3wN/lY3Z7pXeHMMmZOvA=;
        b=TDdgmUnpoIt9l4yZVgqnJ/lpQVP+eEo7Clt8kKL1suuVuPJ+LwBCUKw1gxy73RitWe
         0ni4kPCZqqZI06p6lirdR+v1V4i7pv+FUQRCoVVNV0lGN1slpSIAy9eclVpktBx4DkY8
         5JFbbbU+Usg0BAUAeoRrXXboYIS3GMYwOTHnR7c8WOwzqRKsANRcnea/9FWvTP7z8IIl
         rHxe9NgFCJya8VcjIJ0Mc4YysLGMCXqzzNPTrYT2QdjprJyeFyn6L0ZhniNrjZzitjMn
         b5dJOqvmni7tQze1Fi4MNG+6+uxBkjNHkVc5tzhVp7MbMerdMBnyJS8UPzS6brBU9in9
         9MAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfveBky39qJWnLLSLrEguVeP/gzEkkcC/j7D9DHqckCUz4E+U+ECYBow9ktDwMXq89scT3Ieab2To=@vger.kernel.org
X-Gm-Message-State: AFuF++klEPRC0kWYI1s15ulHRdVxf992jhLEMZwANWwpLswQ60yEogn3
	NBxHYBEkr+4RYNfgOncdF0+InNpcfr4PbBeG+gvzLhwRpK63L9yLAcHn3Oqai5xhLXcPVQ66Frg
	vnOM2hGkpmxgfpN+EpNz9A5XPk+DCE5eDiqE9L08Tk+1S3+ItIBKNIA9QnXlV3IyR6ij+01Y=
X-Gm-Gg: AYBFou2aBcmyb2FxUBo00n5+IQ0FZoujkvhbGWj2UvRXTkb3bct7HWUmdeai14Y5JIa
	bzig4NIGFwaQOFWotqABIWuB+gscYKBWTwVj7yVoadALVV0dhSrit4YV9hJZjghHJWODNbuMqav
	L7MV4Eja+pa4Joh3MG8jhKREmsz60ZfpJamBdCn9ccwUOgOyQmW5g9MSNGLLw2Z/3dq+XDSlqYv
	xhCYZ0fY4uElhxczLe4WW83iMnOCc2sF1nkmiVP2DadCI+wCUAFbTIvLm6I8DI0WyqFOHHfZCMX
	eTtFhR+HfimIAmqpdSrxRVdWEuQMEKRKv7Fk2Yc2UFF222keGkETrteURouWnMuXrwg3IcCvRmF
	VzBIdT4K+T1PyEvQ0et77dzvMjV33bScuWK06ILqwt1Cc5CtFxFkVUV5+YgjcGHez
X-Received: by 2002:a17:90b:4c10:b0:398:9bd3:d6d1 with SMTP id 98e67ed59e1d1-39b8bec869amr3836551a91.11.1788838109310;
        Mon, 07 Sep 2026 20:28:29 -0700 (PDT)
X-Received: by 2002:a17:90b:4c10:b0:398:9bd3:d6d1 with SMTP id 98e67ed59e1d1-39b8bec869amr3836536a91.11.1788838108871;
        Mon, 07 Sep 2026 20:28:28 -0700 (PDT)
Received: from [10.133.33.39] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcc090sm29612468a91.4.2026.09.07.20.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 20:28:28 -0700 (PDT)
Message-ID: <43a9f5ec-c8c2-4e3c-bc78-b980ead0ed5a@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 11:28:25 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/12] clk: qcom: ipq-cmn-pll: Add PON reference clock
 support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org
References: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
 <20260906-qcom_ipq5210_cmnpll-v4-7-aec5ed642f4f@oss.qualcomm.com>
 <20260906142559.17FE91F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <20260906142559.17FE91F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: f8VYDDqGasG5fY7N6p6RXjnTwfIQv2ea
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDAzNCBTYWx0ZWRfX/JM/N5IJSuaG
 XuiVDRdiQKJqd5xz1D6E8g/UD6slMTwwW8W1svMw6aJoo80FS7ym2jIXMz9r4TgAx+CLXWUy4xi
 fB6ZYg2Q44P4d7enPQkkbrYRnuJRutg=
X-Authority-Analysis: v=2.4 cv=eKwjSnp1 c=1 sm=1 tr=0 ts=6a9f80de cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KbbPYYVOdocP4CsVI9sA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDAzNCBTYWx0ZWRfX5ybOZ2z1nIaG
 FsShrY39dp/BvPRtkVYcQoJyyn9T9AvfBbk0hl36swrHjR+wpO2g2bvgwW39E0R1bDXA/I637gg
 GoL/9SMzefJHsiwRUJbNKI42yn+mRdnT4dCEOCDhjQUHlAmRM3qmQUWu/VElFE+liXqix69AxqF
 mRix/czDHFrkd2O9i8anyrUP2whNuqFLISfO/c+TOzXXHahcrR0VsTzyGtd/0kotPtVsweX2Xra
 IiAI4nWnNB93Zd2tgX9x6ySbDdXAwbbeeQbMWvvXAXTc3TjbWjyn2Eu6plmpVFs+XX8SjsMjBH6
 iae1JRrZoj1eBOPfPSMSLIbyX/Umc4Mn4d/Fulmx9S2WStMl1h9ZaDyFe0UH7gYMg2Z81Ai9pVW
 tVE0mdRH5oGy6KZMM6DEX7v5AxtXlIMb3w/H8qCTpu5ix+FpD0Kq/ckwuDTo5PJ9bC8hqX6+qWe
 bt4YeDMGFmwROD8mj5g==
X-Proofpoint-GUID: f8VYDDqGasG5fY7N6p6RXjnTwfIQv2ea
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_07,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080034



On 9/6/2026 10:25 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] clk_pon_clk_determine_rate() incorrectly fails valid rate requests due to rounding at bound edges.
> --
> 
> commit 9a9a4823a8ebca7e3c30590799eb2ac41ada876e
> Author: Luo Jie <jie.luo@oss.qualcomm.com>
> 
> clk: qcom: ipq-cmn-pll: Add PON reference clock support
> 
> This commit adds support for the PON reference clock to the IPQ CMN PLL driver.
> It configures the clock to operate in either UNIPHY mode with a fixed 31.25 MHz
> rate, or PON mode using an 8-bit divider derived from the parent rate.
> 
>> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
>> index 44d035870a89b..f12352a707f7a 100644
>> --- a/drivers/clk/qcom/ipq-cmn-pll.c
>> +++ b/drivers/clk/qcom/ipq-cmn-pll.c
> [ ... ]
>> +static int clk_pon_clk_determine_rate(struct clk_hw *hw,
>> +				      struct clk_rate_request *req)
>> +{
>> +	unsigned long div, pon_rate, uniphy_rate = 31250000UL;
>> +	bool uniphy_rate_valid, pon_rate_valid;
>> +
>> +	if (!req->rate || !req->best_parent_rate)
>> +		return -EINVAL;
>> +
>> +	div = DIV64_U64_ROUND_CLOSEST((u64)req->best_parent_rate, req->rate);
>> +
>> +	/* Clamp to valid range (1-255) */
>> +	div = clamp_t(unsigned long, div, 1, 255);
>> +
>> +	pon_rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, div);
>> +
>> +	uniphy_rate_valid = uniphy_rate >= req->min_rate &&
>> +			    uniphy_rate <= req->max_rate;
>> +	pon_rate_valid = pon_rate >= req->min_rate &&
>> +			 pon_rate <= req->max_rate;
>> +
>> +	if (!uniphy_rate_valid && !pon_rate_valid)
>> +		return -EINVAL;
> 
> [Severity: High]
> Will this logic incorrectly reject valid rate requests when the closest
> divider falls slightly outside the boundaries due to rounding?
> 
> If a client restricts the bounds (e.g., via clk_set_min_rate), the requested
> rate is clamped to the bounds. If calculating the closest divider for that
> rate yields a frequency that barely misses the min_rate or max_rate bound, 
> pon_rate_valid becomes false and this returns -EINVAL.
> 
> Should this code check adjacent dividers (such as div - 1 or div + 1) to see
> if they yield a rate strictly within the requested bounds before giving up?
> 

It doesn't hold up for this driver, a PON reference clock feeds the
UNIPHY/PON that needs one exact standard frequency (e.g. the 31.25 MHz
UNIPHY rate, or whatever exact PON-mode rate the line rate dictates),
not "anything within a window." A real consumer would call
clk_set_rate(clk, exact_rate) and expect either that exact rate back or
-EINVAL, never clk_set_rate_range().

>> +
>> +	/* Pick whichever mode gets closer to the requested rate */
>> +	if (uniphy_rate_valid && pon_rate_valid) {
> [ ... ]
> 

