Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62822E2665
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 13:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784726662; cv=none; b=oXNobTEXHuOMhXlqH3mg9VE+XcHh/5Ip9QWctuk3IIoHNFg3EUZfIwmaudcvOwW4oH1qQh32i72IvoJed0m6GxLIPp3jKeUcxiXzMt90STWaUOYFVgUeVWBiD/RWioFBlfkskV5WdE0lPWe2w5zVau5s4eH859MUtB1JxRhRJGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784726662; c=relaxed/simple;
	bh=OtuCzfm+Y2UHA5VM0e1dmQovrRINQObfVgzsesKn0hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QyWkib1RbRJFj6b4f9kJeX38pGcZKonHTzMgKzztP8ni0zqzYJnxzFfwstulaNL3XGF+x+ggNOc2rTrAsg3K/NSGjP5j5aT+idNLQ/PnjVe11Zm4MNyKMf9nXmxbk0HzUfSlcyEHGD7h/Ra/xGDbwkYjG4rfSleWI0zib76lrKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DPcEo+xx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DmKsj1fU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DPcEo+xx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DmKsj1fU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MD1ptp791702
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 13:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T8Wl3PkYX0uLbKQSwPdWic3x
	tWSYx5vu6/J67u/+Rn4=; b=DPcEo+xxSPQSvINJRvBLZJXW4pTaq9Loi7Cvs2GM
	OVCgodeU6yt/m4VDJg8CZpb4Q34wiKP65pAobLkNYAzTqVP6kAGYIzLMpRgin5Rz
	/mxRZIJ8/yLqFCsN0yID2+JwHrYMTESHthjoN3GqWtv1CvciXAWbtAZqfbixVMdw
	KZFDAWGOcqwPes6fdG5ldkCoNYCvhs4j5DCO5z5OP0sFWNOOINgCaaRdrdM8IB0V
	8n/tCEJVLyfadK1hI5q/1OmiCG2SEnwL6GT9wVZgrery+nOsrD073eWSNo94rO8J
	+k8BwU52AAu+rNPahein7acRqxwfUBOI7p9tC3Vt/ngRvg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn2aad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 13:24:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21c01cf3so200286861cf.2
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 06:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784726659; x=1785331459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T8Wl3PkYX0uLbKQSwPdWic3xtWSYx5vu6/J67u/+Rn4=;
        b=DmKsj1fUnlq8qRlgi9Gc/EvoFCEsjAteaea7suavFko3wYIulSFMJ9oylZ+6UIhMcC
         6mJV3YsIKApBtXu6AeAWZR4RhL1DBpU7TiTaGcaCGxMallOLzi6bjWepJ5b527EU3LSD
         1Ht/rVltBJNVQcbdKDxFXcZHQjbc4S07TnLkiwrpHuz5s06I0UY7cRaEYdvOUBuu2EYn
         DC8KnaCjvZgDd6WIbtZi5Kuo1A+9vYBjYTuaU+ihQ7ggk5/tiBaUjMpWV1+nfO8cu5WR
         5NGSeBKh/VQIjcZgn5GsDGrVSx6L/b4KWNjVqq0dBiS4TTpepvnvrcCeAooM/K7iplXr
         suLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784726659; x=1785331459;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T8Wl3PkYX0uLbKQSwPdWic3xtWSYx5vu6/J67u/+Rn4=;
        b=iK0Q7BSFvUXyB56TDRgzWo6rvWOypAJw0qXZOCgte44Ecd8o+w8+ntY63nBz27a+mt
         QlNb6IzH7wXvhGOy8L057+hECGpUxhDqTMgmpe8OJLOAMHBRcWX38roJwDeV15AkDrlF
         7peSytwSizVHgRoOamjGkhZSY72zR27DiPr/dCXx/wt3j8qGBOQ0L9evl0SUl+T409ny
         g+6rDCWnhj52UdbGLW+FHnjv0+G4V6ESck7iamB5fDz6kStEiKSivfGxLm7vQlpq9Ecs
         gw7uWp3pv7KKSNd59u9E9Nfn5G677de52BMasT98146clPFB4yAKMkWZabuCdB9bQoAN
         I5IA==
X-Forwarded-Encrypted: i=1; AHgh+RoNrJYRWOM/ef+STXZ6bT+BDBYDnEohcNo5yAILOJHzu3z0i0j3e9JoeUNlWjsYA4bRFwMqcf6vrbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoSyLJWGrmuy5MkVT6xGTAc+siw+r+WuXKfgs0tlUA0dUa5zQJ
	vR+HVNEArIGZcn2DucThObzshbOepu/ZQsIaAvdB78llkXWZaQ/gV9Za9QryX47iHeh5VBdqQeH
	Bq4CJzi89Nzyku4THOKfyCwK9pLij7bmy6GhqQtpCW79AsSWHu8Hfl/bqi/TidcoC1djGiIA=
X-Gm-Gg: AR+sD13c9otgNhg/O0NuEartqSZmvzTLTIKtAW6rqgWih20s/sMCw6Zryw+hiMXsgmJ
	v6rBHbjH7Sv2HX+mB2BkXkkFpEPJk/E03UFH0+HHdP1evBQphiUNh+H3MNun8NEvMTVm/h22L3K
	aF3z+U/pU+GmNCl56zUm79UV2RPbhOZTzlJAxi43ivNbGMjORsEV9bltRleSgL/RPJeIzpeCyHr
	OY87laPi/aX55ARuH7DwtRQhy2o/m75wuSXB/D0unXUQMb9Y5UNcW5Z2vHppCnUeDWXOAXnVq8/
	D3i/y0NxQvRcc2HNxzn4dQOvd4HkcErwlT7M6IZdW40gAiEt1McQ+V+ouhyQ2XwbprPoyfGtpf1
	dIMU1JpL2I74bpDhj8vxhvk8JJabIKTzPfVaP4Hjp0xihh0iRypAYffsaumAQGDAQm621fH1O9L
	3vRuXPumLr1jJO8Q==
X-Received: by 2002:a05:622a:8c6:b0:51a:8c97:fb91 with SMTP id d75a77b69052e-5213fc53b39mr230566251cf.58.1784726658941;
        Wed, 22 Jul 2026 06:24:18 -0700 (PDT)
X-Received: by 2002:a05:622a:8c6:b0:51a:8c97:fb91 with SMTP id d75a77b69052e-5213fc53b39mr230565661cf.58.1784726658456;
        Wed, 22 Jul 2026 06:24:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d4353csm457943e87.57.2026.07.22.06.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:24:17 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:24:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: esteuwu@proton.me
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] clk: qcom: dispcc-sm8450: Migrate to
 qcom_cc_driver_data
Message-ID: <oehzbfhssp4ky3tptpygc66ebylethh6sla5nunfhluwtznqfi@meykqppu7jwy>
References: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me>
 <20260713-sm8450-qol-dispcc-v3-2-56fd05822270@proton.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-sm8450-qol-dispcc-v3-2-56fd05822270@proton.me>
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a60c483 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=RFcdKQwhVAgsHQyBjzUA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: A0tB8aaTI7DA7EfDCRhzNDkVJmQr8PSg
X-Proofpoint-ORIG-GUID: A0tB8aaTI7DA7EfDCRhzNDkVJmQr8PSg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfXw86MuGlUyFpA
 CskTtmPuIlkhppNV64fXFeY+aC/TbEgD8cdUknYTG/4MYDkwmlz6kNwMDkEPRV9No5inaP9hx90
 DS2ic8RH3PK/mfHIyRq750qaUIogP/Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfX7d2qwmyOPXti
 ifKXV6+y1x3DciB8LvdfY2kw2hxAv3xVeS8GEcCUJcnRMXFBuH+C0eQ72wq+RCPxfkQ1j1sm1hE
 bq01xwU076GuUZbuhJONueYr9PFaVBgcufQjs+UGw5POmG/8U0+6ux7rJBlBLpzWJRUCyRHNgTQ
 6nrAOyGXMT1v62SnblLDeGBtCR5P8iPRxCFh4/K7TUykaAMJCJfzSL9MfIk8I+fYQgS+MzuAg71
 PIjdXVOldRz7e1L91l98ARqpdnS09evLgwUzdY6Z2B+NbjDu6xRJE89/Mgd2VIbQq//eY2DCbMv
 2TfR3tY4ItJL49/TZVHVHN7voq7KE8MNz++TNI0bWn2FlrwQ/BJgSoWxa25PymS2fs10iZ6Kxcl
 QTIX3NOlu2WS5m5o38arhrK3fFIDmQOvL25RNeZbr12dtq4g2jxrQrOc7XiIzJs8YA3VwLZpj7u
 UtnTzD0LI7Jkm/y4DQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220130

On Mon, Jul 13, 2026 at 11:28:18PM -0400, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Migrate to qcom_cc_driver_data, which is used by other clock controller
> drivers.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  drivers/clk/qcom/dispcc-sm8450.c | 38 ++++++++++++++++++++++++++++----------
>  1 file changed, 28 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
