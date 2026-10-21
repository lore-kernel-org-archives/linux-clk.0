Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572022;
	b=a82nathmJMEn2eXb1pM6qq7+fRNOaErKgG1DKpATIH2NYUZ2Z/eRcipzn/yPszoa/Dy6
	 dG174HyQbqVkNGxMHou1OenPYiyvNKdx3cyjR9WQ3Tq8shLIouw4HQYdmlO79abpycR3u
	 wjoGmHENH2CcBMcTi+nTtiHkBEibogjwi53pvCQaeFukAdneTV3JJczckVquKgk3t3v/E
	 tzH1EZCKLqYjY/IqAegndlt8Mt21qL7ts1z10em/RGmOjx5DvXtDXsrLAr9dee3G/GGks
	 H5NlKSdO3YMU1IDziLTjBcktOzEgoXcEK8P6yK0OMDezSUzd8rctlj1lUM3jsoOn6Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572022;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C5ZUKiEE5SuzhMb9ieLfubEULIpm0CDUWQRF/Xp4ANM=;
	b=WxEwVQkqD4Qb5TYL88T89ln46lfMcPxt/3URF/1qws31OHbHxU6nqqCj13WiE2U1LFfe
	 fD+wQO+5eIsk1sX8x0671xeChNrUogszpgCFVpqv5s/fdx4zHS8lukpVEjnECnQRWrByO
	 iMg2sexc0kaOHaBF5Dd4bwitQ+L4RffB0fkhKFy8Y1RtPNB9FMNjBisVvlX7AG+osUkm9
	 V/nQxJ4l062d7Tho88tZWV/ESKwmPk2Bl8qq/6uUTZ1wYUIXlas36XM6Yg5OgJPlUu0T9
	 0zjhe5SL/cII4zls3ZS9y3qLGPH0mKTQ6Pp77v2P1PfqCPs9TuSotGMYQpTTm1ooaZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J5esj9t7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TOr+rTCN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6542960A5BC8
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 08:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6542960A5BC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J5esj9t7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TOr+rTCN
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L8Sbc5617803
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 08:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C5ZUKiEE5SuzhMb9ieLfubEU
	LIpm0CDUWQRF/Xp4ANM=; b=J5esj9t7OVLPLsmrMXQyNvbhBB3cAqiQdfN0X8Y0
	D2w6UGXfEpSaE8rMoua24Yml2+0nKAsdmE2xWVcMBXybcDjcxE+6vucRhm8gQF4u
	0UfQJKIALSV1ra6rDfpHhX4JxUY30blCRYbq91VoYOOLruNWgF9T3QYeudX3FH8S
	p3bJa1uxMeh/+qkec+3pqWAEAKznxOnuII44P6lJ9irwEtBV2a7cAyNAoofr4lnx
	9N2PAnIGXlIVaJ4HM5y6ALPFKN/APvlh+YJn35sNHdTuzawozcYEoWmdwuj1sX3m
	81ciQd8p13o5vkiCSkDbRmPVEPaMDzIdP+YWwvNwm6Aa8g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajjy9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 08:40:21 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91961d4b31bso12888916d6.0
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 01:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572021; x=1793176821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C5ZUKiEE5SuzhMb9ieLfubEULIpm0CDUWQRF/Xp4ANM=;
        b=TOr+rTCNswQqiP4AEIz227nHvPVgaguScqtptfgNIOhi4xtIq3aVrKkU5ODV78d9By
         mukGjcpnKAZvHb944wbWs++OqyLp9IXqa97Y9qRxsCK3C78OmfkrYCn2QxTyH3+WSh6h
         cZKrG+WdFJbqjaj7OXYE7XLJG4S1efS7p6d011yIXIxlgIrM/THfJe2wFioAq+lLKE3H
         +INm6BlTUTEw+Abgp6XXDwiyEN2cbFlAw5pYh3gTyQTrJ7R46daBrUaj/2B8SaP3Sa/Q
         5liGqEt+oQxj85yPx4w4hGvoUNrvfDKCiGWdPZ/BbCcvRUayjM9M2zh/eg2lyivVVZ0c
         8aUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572021; x=1793176821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5ZUKiEE5SuzhMb9ieLfubEULIpm0CDUWQRF/Xp4ANM=;
        b=x7Vdd/Td0eiKv5z+/tUGMaIta8McNTMx98ESzHE+1lCc+s20+hqvuUNywMzXbVvIA5
         fXyrMAuUyBMM04blWXYuoctpXD8exW0XGiH6akY0KNTnD/SpowF48t4XhTHrO8kTqzCs
         mUnYPIZf76BgCrebkErjDDcTOd1Vu5CsFluHmipv40f1lu6jeAXv7ff4UfhQpOLNku5d
         0zGswHpDA+/Hg0oNqWmc9/AeXpry9SUNMtB2R0AJyRAouo6nkbc3Inbl66TWIXDeW9NP
         sxnA+FbSi2jarq+sPB2UIVWbbCF5UBQSlnbrsTbfvgG/L651sOZ62WbBQwMUIWoDm2TU
         FDrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyp3DJSgF6xney4O/fgDidyYJoyKvSt6ZltEXk4Yo+I2UiBmQMaqKNzAOCZ1O8UQCdMU92q6ESJfU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDqkWqDOe0EJ53b4SC4Ud2DCtYY2kKQFKhKEbpv8sEfF13dyc6
	HuHeQrfBbcqnEDfinoag7jhLnukRzaGNxQq8aOMagWbPIsBHC0q7MjpXUZctCv+ID2HX90FWPxO
	fOBrA+637ca0em1LG0e5gT6fLdoC8svR+q4c+ft7SZ/yFTr0jqdoob773PFUOJRI=
X-Gm-Gg: AYBFou3Sljow+ceIZBN+bjsA02E8vNlM0vTz5X47mqcNMMdLyjlyZIBuW3lx3moJvyj
	37wUIG0lqxTVzuHUHBPfcUPQdyLHNS+9B8P1+IDyX6Ui1M/xtwFGqJLnPe5AbZjv7LP2l6ZGpnY
	QERrZOzO6z/hPxeckeGv1E/Vpl3rqQAt0WE67MAdMAR2bAcRm1wWXu43332Mb60Q4jh8I3D9651
	i4gwawrLa7D9zKQHr2+irrnoUGXgaQ7XNi0k+ts4y2q9g/CJpa0Nek+ERW3BujabkMfVYfC3cFo
	Fp26C4rGDC7udfOQmL3cpnylmvztY9mH3WYTOcorfhxuFuTCRlMwPbebi/5jMqN9/ZzLF6hddrE
	qQFOQLzwJ3LmZkeel
X-Received: by 2002:a05:620a:261d:b0:93e:fd69:9a93 with SMTP id af79cd13be357-93f57f84f2fmr278265885a.31.1792572020330;
        Wed, 21 Oct 2026 01:40:20 -0700 (PDT)
X-Received: by 2002:a05:620a:261d:b0:93e:fd69:9a93 with SMTP id af79cd13be357-93f57f84f2fmr278262385a.31.1792572019672;
        Wed, 21 Oct 2026 01:40:19 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d41c8asm134142735e9.8.2026.10.21.01.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:40:18 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:40:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sushmit Singh Rathore <sushmit718@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] clk: qcom: camcc-sm8450: Retain flops across
 camera GDSC collapse
Message-ID: <lhszemddes3ettau7brxfaiqe7srrqy4mfb4coxtlclxsavbg3@jk5c2s235wkj>
References: <20261020142157.1749-1-sushmit718@gmail.com>
 <20261020142157.1749-3-sushmit718@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020142157.1749-3-sushmit718@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfXxP5Ex1xdpP1M
 6bTrL1bjDLZfoPO6g+puPfMk8o0EknpSOkXC7NbhuB+p2aV8kQMg2rhXgpkRgKL6RengNI+mzYh
 Zbe+1gscm0GxyQummVIzUmgyGEoGTkZgfmpRCYzHWTKU8TN18Rn2MLGH2aCXvfYqDY0CpPIsYRO
 lJsPZrZ6cm+R5vGW78kaBDdsbs+LCO46RBheZ0asuvq6mF09RpzMc23wV2pRRhjdGWmbZWZh0Ht
 lDdy3AmymjcLMEkoO5U/r63mU0XNWhMYPSfiswRX27U/PitGQAy+FHz3h/QLr7P7o/si9fMSz/7
 VTbv47dTaklYI3AtQr5p9/D3eZYh5Twy+jZABBwPEA5x4myIvS4+phhpGGuFrNPCOa6Bkxev/lv
 3te6yNHUCuZgtx37WiCdlHHPEM8ZThKMFVLnpp/bdtwZf3P3kCVz0FHeBYpI54iBEjHQftgG1wt
 dIn1V+5Oj8dpJWkyuQQ==
X-Proofpoint-GUID: o9VmdLOZEent3p6K_9I3MKRSPkRXmtGN
X-Proofpoint-ORIG-GUID: o9VmdLOZEent3p6K_9I3MKRSPkRXmtGN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX7pmqJw/lcMYB
 tMpqw5mog5dLO05iVglGiVCuuXmh4t6r9wGpUZX7zkQL9uvL4oqJT0K6hDSXtpM7HnQ8EQjP5x7
 azd/Q3sjpFiRNdR1LWqCF7pmY8UU0Nk=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad87a75 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=cLpk0Fc0Ve9Y1kKZFIQA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210034

On 26-10-20 14:21:30, Sushmit Singh Rathore wrote:
> The camera GDSCs are collapsed between camera sessions. Without flop
> retention and with the default clock-disable wait, the IFE GDSC can
> stay stuck off when it is powered up for the next session.
> 
> Program the same wait values and set RETAIN_FF_ENABLE as camcc-sm8550
> and the downstream camera clock controller driver do for these GDSCs.
> 
> Tested on the Nothing Phone (2) (SM8475) by running repeated camera
> sessions.
> 
> Fixes: 6082037fe62e ("clk: qcom: add camera clock controller driver for SM8450 SoC")
> Assisted-by: LLM
> Signed-off-by: Sushmit Singh Rathore <sushmit718@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
