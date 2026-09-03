Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9440D48033C
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 11:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436688; cv=none; b=Bgc1DMjwcB0d9Z21J67TDobm+T5DnvDFUTGBsF/mR/cOJuTsjKsizxTBOa8Q/dcdlxelVonPVzOUQt6DjUegH8njNH6HAOx2N20i5E4howTdtb9r31SlMmqO2XV0nnN8x60sIct32yB+xAGMPSKltTf5C7CkHitqUamhCzyL3+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436688; c=relaxed/simple;
	bh=kS8sab3+oqQ16BkkWTgftQpd9FY6WwLaiCkt6PdFW58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dOuawnYSZmPRf9K5nJ/n4X0yChLufHj/qsU9hH+emKaWj+i8wc+LoUsIVHf7YGkMv3v3O0y+NUAZTZRHMV9312/vvTgWTJ1uHT9VMcU58bAdPy8q0U3/U7QRRCY3orjBHvB/qcXBqoHGbMt8wMnrGjkh00h5OAozpT9oDPxAfZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jcLDftjB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FSqlG8d4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jcLDftjB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FSqlG8d4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHBNX3782255
	for <linux-clk@vger.kernel.org>; Thu, 3 Sep 2026 11:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kq0G5jH7HbASPIJPYiJ5gmmBMkKYyuSnMyK4Bnc+Iw8=; b=jcLDftjBcHBpvXD1
	CXxXFHNudhYx8FGU5VwxJKzWM8el536Q5h3XyiZnOZrQ6Et+E0FyhZlWYj0Id4jD
	k/jdoziPvaF5N7R+50mShcmf0ydpQK25FdvxmleWoYcMgIH74qL4TFyALI92IF3X
	Xpx+aauUDHIUp3Uxs3eGTcZ1HEYS4oJ70agschGic9XQxQzjjTVdNIeMUYt0QiIu
	uwrAOo4Tb1Ng3iPw/hLHuZ5j7Ga4ogUnmbOfaav4KqVY/F1fu5TUK0cMRxHga7gg
	FuNk3YzlwUMeqYUAsQyRMCTOGTs7Wfqai7f+hWnXvVLnRroP3MpCeAAcsXBo2MBU
	+Xn5Gw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5pdrr4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 11:57:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9392788b3f8so54735085a.2
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 04:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788436677; x=1789041477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kq0G5jH7HbASPIJPYiJ5gmmBMkKYyuSnMyK4Bnc+Iw8=;
        b=FSqlG8d43Ph8L34ex/6WAxPV4Y8NBwU5iupDX1pDsdIpVY+lZ09dqm9ja5ergpVWpG
         wRRgfwRp0nr3Wm4rHcfmr7LxWzcpXM2gBrgVtTkvLg/AVeI+YGR/4CZfZHUq2+8FxojR
         3u0ovrUffcm/+WykFdmn9E06SZuhIngOerSF7wHZEnehJjwZDHRu8z2ClYu3ThfjDifj
         5F0No7GV4qo7XL984eGfXuCaYhZohWPd1OH5UQTlSMiq/+NukXKqDTzrERHY/d9Bwg0a
         K8zM22Ji0Waj0FrKHl/XKkg8gtED2ZtqH9h182OlcpMnt623vlB1xvFpjm7h1h9nNimO
         RpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436677; x=1789041477;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kq0G5jH7HbASPIJPYiJ5gmmBMkKYyuSnMyK4Bnc+Iw8=;
        b=M5SLaQITMPLEcvmsw4wmoLsHV2ezrUrDJRkrGPkwqYvJ1QXDbb6oWcqZXwPASSSKDm
         C73+hhwh21CcP04IDWgm7BsU/KFunrhumMRKr30bIb/ibubzbOQuuWC1jHvL7CU0Ye3G
         lGArjcObfpzRLAaSF+hMGMtUwwd3LnYPDWbA36zG8Wl6o7rF/1IaJUaomlCLQrqwy0xE
         cu9d7YUdgViXjnJ/K153yvbs4nv5mqyLj/ARc6OBt9RVFtDLntelJQN0J5vA9aF9FKR3
         9Yqu2KXKnB/6k4i5Pit6G+y7DEXdLKTbirZFs5WTXqhhkJtUZLfFeYF2Rm46WA07pGIq
         BOlg==
X-Forwarded-Encrypted: i=1; AKwUvBwhTXZKe1Ey25cacNzf47J0ZOaJp1zidlQYRm7Ssq2dnAfC9/iOUXLt9ByPwljATNAc/7IATWCLwRQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lDZE3MC1ChxTdFxgGcUnQatv1Cyd+L9FIGGrMuijjRMSAvtduc
	tMee9HHZzCmP/AJ0cBXV1vDg0m/4qxiCZNHwvukNHyGokW/rrsz8zn8f//EfxcK6mcy51r1xQNx
	zXi0LI7ZjVULYeirVoyoQJa+khxhKw+MSLHq5YEunXMlJFc/vpuegUcGeJNfh4Uo=
X-Gm-Gg: AYBFou1YPFydcB6CkTynRIUG86/2EgfDwWfQvfon+0qQB10UqKB8X82OsEe3+MPh3ZX
	SW0vZE4Groa/769AMRqGomzYcx9M44ZX7gPt5hFXK6j0wo5l+P4Qj0+dzmU447ck7w6q+1+gftW
	Wd3+B6h4qGt0Njt8WLKuqDo1CiM9NZbdXiF6QAB1h/SfQC+fmEk2iM+xM9zfW2yaV1XAWsj/qYH
	9k5ngZxc+GstH2eD23U3cRreJSTtvxNh6bPehnHk0fDNlT6X3mTmP6BiDbhkTq/Kvn4b4KT596m
	luCBbodwox2ua8zS3F15WVTc0o4UGlry4RFqJkXVzcX8aHbGrxGjD4qblmacix43XMctZ78mQ9n
	+g6OFDwOChJjMRvoaF54JpA==
X-Received: by 2002:a05:620a:2915:b0:939:8bc:8826 with SMTP id af79cd13be357-93960df998dmr898835885a.2.1788436677448;
        Thu, 03 Sep 2026 04:57:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2915:b0:939:8bc:8826 with SMTP id af79cd13be357-93960df998dmr898832485a.2.1788436676972;
        Thu, 03 Sep 2026 04:57:56 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4174d7csm89224366b.15.2026.09.03.04.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:57:56 -0700 (PDT)
Message-ID: <7e32b791-b27a-4b0d-8143-ff4eadd11fa2@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:57:53 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] clk: qcom: ipq-cmn-pll: Add PON reference clock
 support
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-7-21c3db378611@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-7-21c3db378611@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfXxzyhxBbRy7kI
 wjaClVCk3+rQoxBLQkaMarlVDmsYwLJbe1/GDOEPYvuYPtFoFabwgfBfwSMTs2mwvmZfNrQUY+8
 GhrwRRhWddO9T2UsdwQeQk9GEtmEZ68=
X-Proofpoint-ORIG-GUID: ffhA6UuaZRulK51Oz2t2PnBzejjRM7s5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfX2+F6wX3xrlbs
 7cj1D8tvbbP6XPpnqKJacGDh+Cw2HBEhXevUOQ/HzaCQO2PZZPi/K7/mJ2necP/Fa2KQnsIQ8PN
 U7yfxrSqd/bcIia2NyU0UFLFgW6unMNfh6+7ZMcvV1rPM9uFYRdwJqM4gAEhpxf6Qf6diiptb8a
 eBn/YTD5D3cOkYKD3HsGwyj7Ts4Sc2UjMF3MeMJI1ThI+hcy2CoCk5FiKLLabDaA6inEH4FnYaO
 hf0DbX2rlaNoVgYd2/J2qIOM9320PyBKBle3L5SEkVNHQLkQaQhi5HS7Kk+WU92mC+uSWzJCxLM
 vwL70SwzhPkv8QhnQJV8T26kb392EmqPiqivVW527XSOcPVrHGIaZAs2AH53kIpxma0VXrycKbH
 eLrvEYmCb2DNplfQ5vG9dTpH9ME3Lr3IxQU9mwe9mPwv/N2WtY+Fw/ovy/Ti2HidiDrgR7VKPy8
 ZW78OXFyc/BJTYWI/rg==
X-Authority-Analysis: v=2.4 cv=RsL16imK c=1 sm=1 tr=0 ts=6a9960c6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7Q0HT--lCe2piuyCE3MA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: ffhA6UuaZRulK51Oz2t2PnBzejjRM7s5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030104

On 8/14/26 2:48 PM, Luo Jie wrote:
> The PON (Passive Optical Network) reference clock's parent is
> cmn_pll_div2 (CMN PLL rate / 2); it is then further divided by a
> configurable 8-bit divider (1-255). The clock supports two modes:

[...]

> +static const struct clk_ops clk_pon_clk_ops = {
> +	.enable = clk_pon_clk_enable,

clk_enable_regmap
> +	.disable = clk_pon_clk_disable,

clk_disable_regmap

> +	.is_enabled = clk_pon_clk_is_enabled,

clk_is_enabled_regmap

> +	.recalc_rate = clk_pon_clk_recalc_rate,
> +	.determine_rate = clk_pon_clk_determine_rate,
> +	.set_rate = clk_pon_clk_set_rate,

These seem genuinely new

Konrad
