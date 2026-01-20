Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13F434027E
	for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 16:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768928041; cv=none; b=BESSIgzu244ZCn5itQsuvVhL/rg6w9U9NTAc047PJOJhn/2moh6Cb/4qP7nJhDMgJKAT36kuIF9b0jDo743vmbejW97Ihr9j3e+YgSGZCJIggqcd/xkBKPdrkzdM8OaZ16WhFBfZkqLH/i9t8FSvJkp3xxnn7SYxDcVRmP8+Zs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768928041; c=relaxed/simple;
	bh=Xh5NhbusMKugFJN+jyX+RAwANK94Y1YcdWvZxclernI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wxz1VAQUoVlaGSJI+o190B+/ukVVRxLXGiKBMad9YtjlvKlqcuQQjhhAd0cuzwb/rzDo6rDDkP2qNxICN1JWuS1j0xXftQGh1urgZyVgSANlk192tK4AUa3rFZJXmy913u4IzzEIJNvw58bWRCfNtzvcmeSYSeQHpLzk6RaHpuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X6Q6Q7Na; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AAhfZGfB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X6Q6Q7Na";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AAhfZGfB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KEcpcu3155121
	for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 16:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xQH8/RM6VC8rU1HZ+RTjzOS2KZDYo8OMBNTFVGcVfA8=; b=X6Q6Q7NaIlQVfsHh
	/4tut6VsbqZpTQhdn3jj/OmDh3yV8kGy/XhZH46s2QicIaNam1nw/o+vWtyZ3GEL
	V6rpT/5EtG3tE/xkn1hj0bCQVJlp6s2io+TjSUYM7Dq25gijNu/F1jVi36eq++S8
	Ozf0S9E5A/eNn2EB2FePe2yl6Bn1DPmRW9i2i1IcWkPel3lQThZkVtc22Zw3CtgP
	GfIA+b/J9eoW/d4JvodzpUyXWB9KbyGZEcbVDzFQ9/lI0e29GsGnwVwMg3aXKKOi
	y7TXhgfkqYT3BOv1SdnGGESyodm2cq081htQR1mHbAOadr/1YDsJlltI0a79TYEN
	GZDIQg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt4q51v16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 16:53:57 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c551e6fe4b4so3445954a12.3
        for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 08:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768928036; x=1769532836; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQH8/RM6VC8rU1HZ+RTjzOS2KZDYo8OMBNTFVGcVfA8=;
        b=AAhfZGfBxbVhKViqcGjguptC2WH34uD9P4wwWB9WxgGk2/4W0dMjqLsSou9nLkuuNh
         kZJnrjow7d9xupDvzE28dO7loA21VXf/4oQ2mOQYB6E0rcshPOl5gO3oeT0cOjAJVORr
         swvQkCui1uksLGOaCV/io0CjvJNhHzYYUTneu0rau1FJG2qBLA4lzWUt2lWLSEO/9C4b
         dVImJRlZleNBCKrZ/HHMNZfdfAQyg4fYHcGzFer5GOrvf09v82XzqUCvMlWuxPBlhqfM
         uc9rO4SF0JqJD8Pb+7CtLD2fUWNDOTFroBgp9u1NLKK8Cp1RDoIjw7b3xL/dDCJPl7tx
         J2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768928036; x=1769532836;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQH8/RM6VC8rU1HZ+RTjzOS2KZDYo8OMBNTFVGcVfA8=;
        b=FbEJQ9/w9LHCeguk4+XwtUHzUUnijGYP+QA/Tp5N4aak9rLFrhvTmaGGD4ec2kjhmH
         fMHfi7069/QrNPtFDRxLbYH7kT3ZWxfWgXUX8ozzMVf7YpC2cImwDxbZXoystcbkZXoc
         LBzU8E9Y0Tle15AjvmXBBEpA2K5kDd+UrGhT1H0i/yeOhUBPcEJ1i4piYKDNSYBvGMd4
         WvXNQEcD5JAfyaaBwqzo7i6Bsw68ykreuCAvSnnXuf5UdhHVzYB4JaiX3cHxjl+94URg
         /6C/AA6Sso75gd8pDcElx9ZLvm5Mlbfd56hDFPcXFxo6eXKktODbazA8wH0Mp8mTSol5
         tW7g==
X-Forwarded-Encrypted: i=1; AJvYcCVw5DN3Vax/ui5mpI7WuuStt3gw8jGFM4XwlFmAU8l/w2QSfFhnY04l6JFZo8zgF3SFYqNu1wp8B1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqBnmemScZJiiHkumJqrLIcfJooV030hOfoHpBsSFev0y6S4uk
	3MHicWmm6W6hrVvpLZyippT47GVFCMjDK70FJRsytGs+etSknwTXgOr8NPCYNg7sHp2tNo2UQDG
	zqn0xZNSHf31QzEJz2Z18guU/7Ydj2dsaZ+T+1BTGU51zGcKUhK6kszGY7yy5yvo=
X-Gm-Gg: AY/fxX7MwyJpcReXktramTgnKbLSgP7zivCWrqauqezp+Aaxjjca0SWbwWlB6oCN6J4
	P9PgNW0j+XgjlraNHA7xslTyEKqK4w94V3Vg032lUHCtnp14tUaMeH43/hGlaEcCwxAL09T2xDz
	SeT0RlLxzP6ah/OEKIXl5iePe1nj7ymuZAh/UzGhtSHSmbpsEVD75Rem7gJl2XPmmNMOUL6QZeh
	rOY5OBiLm6+O84zbAoD8P8PJ8D3iKpBbFDQ+uePTjJAFtqMOXbQAcb2gS9nHgqQbVyROWPItDHN
	Qoh0h3jQAn8oOummlWVUxPfo8uakWUraxPLkNeWblfoy+0jmpBLa+vJsFG/XrJMOicOedM1E8lX
	ozopM17Ib2ExW91Xx+Yavwi0dKaPgDJP7o7YeQw==
X-Received: by 2002:a05:6a20:d81a:b0:38d:ec2d:80e5 with SMTP id adf61e73a8af0-38dfe71dccfmr14977002637.45.1768928036283;
        Tue, 20 Jan 2026 08:53:56 -0800 (PST)
X-Received: by 2002:a05:6a20:d81a:b0:38d:ec2d:80e5 with SMTP id adf61e73a8af0-38dfe71dccfmr14976971637.45.1768928035633;
        Tue, 20 Jan 2026 08:53:55 -0800 (PST)
Received: from [192.168.0.195] ([49.204.25.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190eee4fsm127957315ad.42.2026.01.20.08.53.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 08:53:55 -0800 (PST)
Message-ID: <edb23628-8f07-4332-8a85-2b4a22a1e1a0@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 22:23:49 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: dispcc-sc7180: Add missing MDSS resets
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        cros-qcom-dts-watchers@chromium.org,
        Kalyan Thota
 <quic_kalyant@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Harigovindan P <harigovi@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com>
 <20260120-topic-7180_dispcc_bcr-v1-2-0b1b442156c3@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260120-topic-7180_dispcc_bcr-v1-2-0b1b442156c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0MCBTYWx0ZWRfXzUalwoYPdE8+
 x3k46/R9xnCGE28Dtv0PZWtI23xBUByW/FUvpKVwslRuoeVDa7as/laVRJERw33t0sppOBLTmdJ
 j5K1DUGTRX6g/VLLVARMQP0CZx5dWAc32WRiwHoWISZsCJeEmFpemmzDw8oTCYzVPsfznJ8VRPF
 /Ia/Tid8ZIZBspChFXVbszrBBbVlSSNRs1R7qTNN+X+K4vP3y7R1gxYoGiit6L/EQ1S+W450H3g
 G/cdjQ66+hGe28UWRK7uY5n3SBAVg2qx1aOUQv/HqTpVOgMDb04rIlomVqOqxrxP3uUzAnunIGu
 D+WreT3vvduG56DIdxHb4lBpNYafS8iHkqhaZQzhNDkXeYblR/ZfpYoKLbNzvd5O66ed3wzw9sg
 yH11T+ihECwfgPPVQEDPZyw877Z3AmdxTysF2RNolhx/QaBfABEXsAMjETpSckYxFof5NmVgQEr
 3vqCUmjnvEljFdxS9sQ==
X-Proofpoint-GUID: zyewGP9gQWD2ACTQFwlgMKHOXqWEO6OJ
X-Proofpoint-ORIG-GUID: zyewGP9gQWD2ACTQFwlgMKHOXqWEO6OJ
X-Authority-Analysis: v=2.4 cv=MNFtWcZl c=1 sm=1 tr=0 ts=696fb325 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=NUZ/Q5sP+scsJfd5oYcUKA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=EEUffno1QXpLnStXY5cA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200140



On 1/20/2026 4:49 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The MDSS resets have so far been left undescribed. Fix that.
> 
> Fixes: dd3d06622138 ("clk: qcom: Add display clock controller driver for SC7180")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-sc7180.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
> index ab1a8d419863..d7e37fbbe87e 100644
> --- a/drivers/clk/qcom/dispcc-sc7180.c
> +++ b/drivers/clk/qcom/dispcc-sc7180.c
> @@ -17,6 +17,7 @@
>  #include "clk-regmap-divider.h"
>  #include "common.h"
>  #include "gdsc.h"
> +#include "reset.h"
>  
>  enum {
>  	P_BI_TCXO,
> @@ -636,6 +637,11 @@ static struct gdsc mdss_gdsc = {
>  	.flags = HW_CTRL,
>  };
>  
> +static const struct qcom_reset_map disp_cc_sc7180_resets[] = {
> +	[DISP_CC_MDSS_CORE_BCR] = { 0x2000 },
> +	[DISP_CC_MDSS_RSCC_BCR] = { 0x4000 },
> +};
> +
>  static struct gdsc *disp_cc_sc7180_gdscs[] = {
>  	[MDSS_GDSC] = &mdss_gdsc,
>  };
> @@ -687,6 +693,8 @@ static const struct qcom_cc_desc disp_cc_sc7180_desc = {
>  	.config = &disp_cc_sc7180_regmap_config,
>  	.clks = disp_cc_sc7180_clocks,
>  	.num_clks = ARRAY_SIZE(disp_cc_sc7180_clocks),
> +	.resets = disp_cc_sc7180_resets,
> +	.num_resets = ARRAY_SIZE(disp_cc_sc7180_resets),
>  	.gdscs = disp_cc_sc7180_gdscs,
>  	.num_gdscs = ARRAY_SIZE(disp_cc_sc7180_gdscs),
>  };
> 

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

