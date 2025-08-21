Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728FC2FDC58
	for <linux-clk@vger.kernel.org>; Thu, 21 Aug 2025 10:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755772715; cv=none; b=r3QdG5G+CjzlMZPbji/mXyL7aJHheZjla6lvxd7TonCDfmCy10Q9ah6Y1z6lfS7QA4mqwUIU86iOOcIBAIdYZT1crrkxNzY5Q4jRbtxCGrsa9WpYfqx3QmRQWENi3FYGAGPPgXJIW7+PvS4Ah8HsUWS++1X+rEdvcl61qBW1T90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755772715; c=relaxed/simple;
	bh=dhc4I/MlWDeDvIuwX9I961QDfZaUtY9V9+5sP5hirYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=acrlWE6/yce/QqYm8yVZRTxupsyDWyMV+P6rqwgmE8W7vUD04vy7pKqTlLLHSZXZBzx/uAadGpbSiJfmpafqvrh+PNLRkwkSXegYAsY8/Zn98CgIL688Tkn365Zi/k6zt7iyV1b2d3RusmXSHqQ4vX+K2iVTupJZ7DCzQ/MzLsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dovp1mlP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dovp1mlP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9b7DK031334
	for <linux-clk@vger.kernel.org>; Thu, 21 Aug 2025 10:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y7XbYhx/DiCJXD+gTIWE345l
	Gfy4pmmZ548BXwvRUTw=; b=dovp1mlPD4cNC3Eo8I/3/JPFWxnwtWzuHGFzGReP
	4yyMfStnGYB3KLM7sDMU1HunVcfcMIzh2RZ4oyV/cskgigggwyUwHrMydSrHgkxh
	FJZIQqENn6Pjn3XbOHVAu17QlENfPWJi77lyChxH3/Phz1BsXmSdztv9o5G7aWMP
	xqRaeBENaXCEKMYGiOeYLlhf81jEXPQsaV2an+8y2gWsvt/7ulINBK/QYNnPAQKV
	7Y6JMAGQFOV8XVW9wdorUH4025hY3ldFNtJkjR9kykEeaaSeXwPwwm87LR2wwu/p
	DMir5IvSKTxNdy101S8J+UMNu0C8Ce7xGjrah8wI4SRDfw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52aw01t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 21 Aug 2025 10:38:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70d93f579ceso541596d6.1
        for <linux-clk@vger.kernel.org>; Thu, 21 Aug 2025 03:38:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755772712; x=1756377512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7XbYhx/DiCJXD+gTIWE345lGfy4pmmZ548BXwvRUTw=;
        b=NEBbsDQsoL+J67b13mfiz3i73JoIqLTGAc4Qdr0RRpJmntgLkJowaRI0v6qv+81kXP
         +nrQ9F8+X5LEjZgOfuhPIOELzynHyfZowElmRQbMzE1X8JRH5dM4M1sh/rzplxmJQn/9
         3FYhGnw1xzBK1BMbR4Un/4EuC8Aiw0MKxmesWR4mBZD2l9jNgUqu5ECcPLPOse+1qMbZ
         zDMlTIDlm38+hKkEihMAd2X4C/mHZIK4ldwUV1pAPrMN765U38ww7Ow9hUQzDUaT1onC
         xb4ujgqnySc2S6zeknVT85Ckqo3BgzdrHN8k/eoriAl607kA43SkFNwJT7+o5fLWNCSr
         TanA==
X-Forwarded-Encrypted: i=1; AJvYcCVTvADRzPzt6cMuFTnHjxvvE/a8myQadQqBWVKbc7MiQHnaek2a8guausLlmvukaYWDvoCsi7qNX+g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0oEQo0+A1fW/NX+DtDdKUXpKMckTJPLtoy6uZFIdUs1uMlO9K
	a1PHW+LiWqT9t9cSyQTvLknX8ywQNMglIc9v1Ood0h/BF6v5klSAmkDywXlqRphiaf0CF7Hp5ha
	pELhl71rZSsC7Pbu5VyWDLWrvJmNbFvaY2JcclILHe/9ZhmwT03eOBvNGyI+IWxtuU/BQaAY=
X-Gm-Gg: ASbGncvkvR6kiscj1bIUGyM5tr4X+K2uxrgfnQfB8bCfV4KtODz24ebRPgWXpKop89v
	/rkKo3u1esO466TVoM1OA51K5Ba0MlTqNJoaKvcGVSUO1rHiyh5ghnS6ilPqBKlc+pmo6AHHCLB
	ksqNFMdG71mkgmSb4zIBFb4uFrG8IgODl1GHjWjYqe4cvc+mGYzNYrHwCNtJiPRXxiFspDXAawF
	xKpINBHSJEiYytJOvN6eb8ZDCGTuOqisWfM4p6S5gK9FRc+PbrPdXEw+IPkRBsV9gqchoqFl0uu
	Oqyw4iyfzi2c9K/Y8cbnlk5+JIu0SAv8e+PIuPOMeSZ8bJWfsDV7fBzL59UWjmnoeGHdI6H6Rlq
	ObF0AhQBeMfS6OXCT9rwpJQiS9JxGoIAGPRFwOOhIwXzb+MvEKxVS
X-Received: by 2002:ad4:5bac:0:b0:709:e65a:8ace with SMTP id 6a1803df08f44-70d88fc9219mr15034216d6.46.1755772712253;
        Thu, 21 Aug 2025 03:38:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH61ZKpxI75vebq18AslDQxb4qNuADPe87MuwfCz6Y1lEvwAi3O2ArZrJrJVYNRQ/jcIemWHw==
X-Received: by 2002:ad4:5bac:0:b0:709:e65a:8ace with SMTP id 6a1803df08f44-70d88fc9219mr15033976d6.46.1755772711837;
        Thu, 21 Aug 2025 03:38:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a6045b3sm34241381fa.39.2025.08.21.03.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 03:38:29 -0700 (PDT)
Date: Thu, 21 Aug 2025 13:38:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: milos: Constify 'struct qcom_cc_desc'
Message-ID: <dv63p6laidz7aj4ruk347jqboqoiyekddgzqc7xb7n4ppvjkwy@rzdhicxf7phb>
References: <20250820124821.149141-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820124821.149141-2-krzysztof.kozlowski@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX+XTqlzjfSDh2
 4uCHQ6CAZry0EHeX89DFJPdaY20R2sn8Zjt7pN/pK2h1/7etEyrmduTPKCNrtqNEHvmR7nvvv0T
 kWpG/LTXqGkG3qZCtbT3uqHcA/u0w0A18mGIcLBNNDgMuoCaCSmNP4eG858qwhuNMkuLORaJRta
 TawDGUCUATtTOtJD33o0mfczG6ltmawSjsK3XePFOaiF574SqQhkSpo/1BSaKkjduWaK8g0BL3X
 Luf1gXzNFdulOIEjU4Z2Lpe/RAHok/CsIwJD+YfZohXUGbjl7Qe5UmccwfMWTd9tWe+Bxv4nKlh
 zqEFu/0asPiAvcQJlCI+1hygasWDbm8DrmgcBl1cwgt/MXtnQsUu7Iz31F8peuFtkW7uB7tVtzt
 quVlY78dcF/N8VFuD2OSlSKdRnqLgw==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a6f729 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=LBVU2G7aICa-vlctToYA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: rjR1qJxEm6T8jerKgvuIaWvbKT-whJiF
X-Proofpoint-GUID: rjR1qJxEm6T8jerKgvuIaWvbKT-whJiF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 02:48:22PM +0200, Krzysztof Kozlowski wrote:
> 'struct qcom_cc_desc' is passed to qcom_cc_map() and
> qcom_cc_really_probe() only as pointer to const, so make the memory
> const for safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> My standard commit... I just keep repeating the same over and over
> again.
> ---
>  drivers/clk/qcom/camcc-milos.c   | 2 +-
>  drivers/clk/qcom/dispcc-milos.c  | 2 +-
>  drivers/clk/qcom/videocc-milos.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
