Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210DA4D8DAE
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 15:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448898; cv=none; b=Lr6WWPKQDSkrfnhAdlaFBiql4G0oAENnfGrHGxcIZdkKkoSSb51KXzzUV0hnZ5Jm8YawLHxR3H4/WXs2u9dpd31B8QeDp0x6VARmj/SjlJVN6IyDBRh9dHDIlnfWQ1K5BCNZ/1W8V1jt9dIPongM0aJejlnNw2RpW22maoIkJhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448898; c=relaxed/simple;
	bh=AJRmnZv8TBL24Tq4Nk/MVvTyAGNJB3SKUgQnbs7iPxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QJVKyr2hUt7qrQDITsdoEnQui8sklE36qTtGAWD1j29xBERknck1s61iN68hoH+QuM30mV+T5veOdtHLX6CIZLGWPLgt4HjnACHXM/2/b3R+xc8138CyUClmy1E+z8j9hTlW41HungHkpdm2Xbu95Y0DIxY3NBTHSHEsKNZnx1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VuImJggM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZRueYH86; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VuImJggM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZRueYH86"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DB79R3580114
	for <linux-clk@vger.kernel.org>; Thu, 3 Sep 2026 15:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MDXm9sakiTVow2HHdoD2Gmx3gY3Rs3Pfdamjmd0bvo0=; b=VuImJggMuzKB4UNo
	4VSWxjGM0gt7Rnn7mxvFDlGUG9Vjfux/uR55j/BDqogQzf7KWKHUgkGkxQDFV7ii
	EDGnXWpSAsTTwy0gK7N/X39QdokV72HJAawjGkkt2eV9NmN8NbhltQEZQRFImDlJ
	KdI1CHq4SFfk+9wveFkZq79j5+DHMcPjouWifhq7uTXOu+CR+beoL6JXTuSJC0Mz
	16kzkMiBVK4GB6XgkCQqBc5vSixcfRPPe+CrXIBYpa3rmNjt8Nu8UDklfqF+wd5b
	1PB7Nedvp2Ca5bqpSlHTbW/EcdagcwxyZVGTBykfaGXCvT1uv2BOzjVRvhRsVesW
	EvgsEg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d11mqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 15:21:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d9057fab9eso38901945ad.1
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 08:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788448896; x=1789053696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MDXm9sakiTVow2HHdoD2Gmx3gY3Rs3Pfdamjmd0bvo0=;
        b=ZRueYH86rn1TmmT2ZJdIZd9YFM5WjVXhCQUA1J2BgAXdY2rFch6sxz8Wnx1C2HDsbu
         QgQmQnAfvKxYs1VtpUlVi4HjUWTXGY77hV8JFhrbnTOeySAgwcpbEkYRPeIyCnsktHh6
         6yr7+/gswwq3GKKkIj/POxhZ/d7+XdXm6a7MEWMLxS+oqY/iMRnAyR3vpD4dce94H//7
         978oWQzX2/IZMvXFC1ZMGkG2gsLANTU2u8DE1MkGnGHE3I13zjFwqhJLDI8/hIBlHt2a
         JB0sq5IAp3EJjfUzh0CGjYxkitZNg85Wvb4BZjRgFJrCLJD4iFsnsYxJ7TdyDLDgovzX
         tl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788448896; x=1789053696;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MDXm9sakiTVow2HHdoD2Gmx3gY3Rs3Pfdamjmd0bvo0=;
        b=eElEAFxGOWxL/UMBvzL3/trzbS8hdUv6okakFiUxBm5YsT4V2lsxvFcP3mCEYsUPCJ
         d99ROpTdqQEs9bFgxgde8nMK8waTVezII7CddA50U/WV7nJVIJDqD1jfS/sv+M4F0saH
         2fxbcak7v0cutYd/9VJLo3gv6hsY0Z4lnZ6UDTaO8NItVXPmakM7msxR5HMhG8SPLwmb
         URhRxkxjenCksCM2abOrcXeWLUKkjVMlQMu7OZVUgsFhVo9nqekk+opOqcaDymWYu/eJ
         EPsRdAoNquC+E5Tb5LMuEwBflQbM/BwCIQcsRY+pBBUvvMpJyQL4BX40f+J8trE9zvmc
         BjwA==
X-Forwarded-Encrypted: i=1; AKwUvByY1gsNJ+0NcoWmUzd/u7nGzOtfGY1S0WcCKGIfneWg88xaqa7IE2Kt01bQozJ3Piydj0WBZxyuSIc=@vger.kernel.org
X-Gm-Message-State: AFuF++ndxlKdLo3GZOkg0NDNotzhGslJwij4ZTrCrECFvQKrpfkVmDQz
	TjcKQOmYnhJyN4OJ2LpxA8C1hiod7W1p7Tp6Tj8vwAqRoStCC5nKIgQwaxb5Rug08aPtF0bemms
	GCrX/60e6lajNwuynh2pUSeG2A1vPlExJVMcOkn1X1LD64nWwuYX9cGKN0F18S3Q=
X-Gm-Gg: AYBFou1F/vUBsCueVQ6erAJ5srA5EpsMk0GJxlngRSQtcj7iLSrlqjLO7DxpWJyy4CI
	LsSpLtpxdqa0pvWCyJlSeL/xVEkdlBQQjM+C0b2s3qPbnmX6B+LNU3yeMrcsQ6kgaBAns6m9htJ
	0ivoZYf0FcgFHraFFr2NiBSArjHUVZqXNKOF+Wc9DMT3oLCwFXynbUhQRsYo4vJ3627N1RW85NW
	1f5gfwN2HOeg4eHQqyR/MPKfSv9xyU/8qX4fYpGG+jQnGNtxWva+TVUth0FRc6SNWVENQNs71/r
	HBMUOTsNI9/6kfQX9iKGRDRFOXnbJfkrMhuzJ3tz7JZTc2Bi+IKIl45a/U0hW+mCWjgakOWp8Ve
	RcC6Xh9LT5ksjsTJ/yEaAE40tFXDdvW2C5MMe8EOYmvZvAclixQvNZF40ZS1wm0l+
X-Received: by 2002:a17:903:22c5:b0:2da:eba4:b640 with SMTP id d9443c01a7336-2db10518c67mr5531015ad.6.1788448895643;
        Thu, 03 Sep 2026 08:21:35 -0700 (PDT)
X-Received: by 2002:a17:903:22c5:b0:2da:eba4:b640 with SMTP id d9443c01a7336-2db10518c67mr5530325ad.6.1788448895091;
        Thu, 03 Sep 2026 08:21:35 -0700 (PDT)
Received: from [10.133.33.96] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafe62d8dcsm11883625ad.26.2026.09.03.08.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:21:33 -0700 (PDT)
Message-ID: <75246b2d-4787-4748-831c-d66e3b42faa6@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 23:21:27 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] clk: qcom: ipq-cmn-pll: Add PON reference clock
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
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
 <7e32b791-b27a-4b0d-8143-ff4eadd11fa2@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <7e32b791-b27a-4b0d-8143-ff4eadd11fa2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzMyBTYWx0ZWRfX+3gevN5OhnME
 i/mfavRDPimTsjzf8uUffNa5kIvvSTBjj8ud3Q6qvRUU893igYQLGdHCXvj52N4P7Qc8/Kenv7y
 D06B9AdLd4Uwktr6Y1fDoEbg33E5DRAtSFfsP0P9LJ0vmNkMHPDLgYDrKtyUK/UH434Awm+o03i
 8R2jMJvfJLbqvLZwE1A6eNB9eXDklBCi+VtdgfnQeJ0VC0Kzym5Ay4bZVWrQH+aYOzW2AiRaxYo
 0JoeaGYL2hDeePqF3KQh0nxbjNZPgYtaLml0YDoU9BQNTGJzGc7HMo1mqy++b9SfbZswJlUlqNW
 B76eUGsM2aHSGQzSHJErdBQX7+QbgL3vFkfNiDFw0XL7wdesdzxP142Dsrun4hnxYxszKDQiJ/h
 mcDxLp/B6py+1OCz1xsfZynvHYThcthlllqV9F3l/iA0TYnpzJdML9c5VxRalAbVDhMpfk3Nouk
 bXaFqutPqekfB0nVJVw==
X-Proofpoint-ORIG-GUID: 9cJ8RXapJ9i4gD3WtiEzVsjwy_LSnc48
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzMyBTYWx0ZWRfX/nSb8R+9x9xQ
 AC9vHpbCT7fs20kqO2+LfU3oD7XnmnBsum1irc9GbyzNp3Hr9tmWYCKC3UG2aFx4sCLHY00CPSm
 W/fbo7w7wiqipukJzYAmqsY1wftUVSA=
X-Proofpoint-GUID: 9cJ8RXapJ9i4gD3WtiEzVsjwy_LSnc48
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a999080 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=eyD6XQoqffRT7lHHdTUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030133



On 9/3/2026 7:57 PM, Konrad Dybcio wrote:
> On 8/14/26 2:48 PM, Luo Jie wrote:
>> The PON (Passive Optical Network) reference clock's parent is
>> cmn_pll_div2 (CMN PLL rate / 2); it is then further divided by a
>> configurable 8-bit divider (1-255). The clock supports two modes:
> 
> [...]
> 
>> +static const struct clk_ops clk_pon_clk_ops = {
>> +	.enable = clk_pon_clk_enable,
> 
> clk_enable_regmap
>> +	.disable = clk_pon_clk_disable,
> 
> clk_disable_regmap
> 
>> +	.is_enabled = clk_pon_clk_is_enabled,
> 
> clk_is_enabled_regmap
> 
>> +	.recalc_rate = clk_pon_clk_recalc_rate,
>> +	.determine_rate = clk_pon_clk_determine_rate,
>> +	.set_rate = clk_pon_clk_set_rate,
> 
> These seem genuinely new
> 
> Konrad

Thanks. I’ll fix this by converting the PON clock to struct clk_regmap,
setting enable_reg and enable_mask, and using clk_enable_regmap,
clk_disable_regmap, and clk_is_enabled_regmap for the corresponding
operations. I’ll retain the custom recalc_rate, determine_rate, and
set_rate implementations as suggested.


