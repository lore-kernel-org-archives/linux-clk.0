Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155FC37F320
	for <linux-clk@vger.kernel.org>; Thu,  1 Oct 2026 01:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790819901; cv=none; b=DAlR78mrnbu1LBa90yBeWkL5eencu7WXHjYvPNmnQS/298JyeISIqy5ZnGDc8d3gwDcdHObGIHQByccdMI7Y+zu2Cf+ZSrWKWdSZ7EsMRYacaoYYhp136v3G7XEK+eYZ46JlaKSiVP8VdH5cTL2+va1qtnjNQDZOOiCaSuGgSSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790819901; c=relaxed/simple;
	bh=WNlxAVW9sEGah+tbexj/J3vs8zzU01+pV505LfFfPdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q6M06EgHCVpWd6CWD1fJB5zoolAqbk9CTJ2FKMSvvOwN6vGR79WZwPHFIUKCxUdGA60V0Cp4IVtu91+g84Ivoi7K5sC6TKHlT2BXwbVEROUoj4er96QyLPX3jowhChwk+6FVvgfg9DDI8PxfPpK7F9070VIy0yU4lV3L7Gwqut4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Av6XhOcW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bY0Qp3/t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Av6XhOcW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bY0Qp3/t"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6910k7o42013317
	for <linux-clk@vger.kernel.org>; Thu, 1 Oct 2026 01:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZdeAUChydPqhPIvtw0cY1t+X
	ErxSg9azs+6bi/qs5xI=; b=Av6XhOcW37SpihgwTkGfs4qIDt0nNlPqo7uM+tTP
	csNja1zSArvVgJBXalT9UdhucfFxx30xWP3vbe9cMp/ntSP2ByZNm90EG5v4c7VJ
	oJRM6K0oQAo2/W6sdLegXqhDjNH6g0ZWQl4iej31n1Jnf43bB7ZmmgH7nRQ78Uvt
	CyODMykncY4RRlobcyM8BvdeEg6lyJpGykgjRJg5dDYHUGmGCcvmRu1UVvwOuJpW
	mb8tx/7QI09N3Q+Js/9N6NCgSGYOWJQ/8t1vMMmS3EsV9vI+8nS8lm3nZpdqimoq
	BDGxotkozDyWaDVXRZGMY7T2nOabY3jC70ckSGuF9uyvGQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0yh83xjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 01 Oct 2026 01:58:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-532dc3793easo9159481cf.0
        for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 18:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790819898; x=1791424698; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZdeAUChydPqhPIvtw0cY1t+XErxSg9azs+6bi/qs5xI=;
        b=bY0Qp3/t2awbl3T+qU7Edgm0/eXVi1P6dae+l6WoYuR0RLgHybvF44XNpT9KWO6Hbb
         0f9fzHrI5KECehOSYy/X4nBBabB5Ck5fRxx/ti2JaFjuKn6znhStU/zVY669Tm59CZsu
         LQMugyn8RH5ghmoB1asX4l8Xdc9IkNBfJq+jJfQgnexsjuLw6zYOeBWBKwPxiVpyibka
         Rlrbtc9VxActIDxmI3qwV3+lDjUcFl2zrmp5FchYxlOxhc0ONVldjFJ8Z71FUEayFdDT
         jvvwgSMezfjoBII+nzT+J234YahEKdmoiazXJ/0BiNczqW6wohijn9lfQ3Hj1dexbeF8
         lfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790819898; x=1791424698;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZdeAUChydPqhPIvtw0cY1t+XErxSg9azs+6bi/qs5xI=;
        b=uQiVkD8lHha/0T/colphjC7HXR/h5AyuRTvFB2YQUKvNXC6AXFERdZYxIhYS2G7Xmt
         tmEwNLBDdWyMdL+H6YDCJwzzHruuRfYzdzFKsX6ej7Gb3XDIW3o7NJpJb/LuQ71R5rni
         /qdBPsiDKVipPC7HDR8G/rn9p8Hf8kOidLF8OEeeH+CgwQjEB9lMxn2aHPicdEXSaoAe
         uuFINzmGsp22FOEdyNV0CU33b6hdw6IY848vg+0mxlgnmq/lbSafZ5nuql6jy2JIYhop
         +KvT5CFEOMHYY0jWZt52nz+vdLBx50sIAaTrWCtUPufE308INvpp/aZII06S+1UNdTHo
         rg3w==
X-Forwarded-Encrypted: i=1; AKwUvBwYqIdKEiPUco+/4N/+PPx8Zb3Tth1tZ3dzjzc4bcD+qof0NET6tcNrlPM3+N9y8+T0KFmn0eM3sOA=@vger.kernel.org
X-Gm-Message-State: AFuF++lW08TkDjYpq8py87YyE38OE+TZt3OpL9LoE6QDqcdhppG+B4xX
	LbO30x4nVVAeruu1T8q9adKduhdeBgJUS7K9hKK+UAQU8NCl3jpWcbvTsfkxWQzU9QeVfx/S7l2
	spMvnb9TjDb+wQs91ic3aaWHMz1lcLtBm5Om+6x/1JbfqC/ZLObbzcGu7va2jh7A=
X-Gm-Gg: AYBFou24TtfapHjsHYvFVgb0NTqeR84Jj42BUFEngddVBemeANkf8rNHuSTYGQvr5E8
	CeARhGla6SJW0w8Zb7YcvVjesxEtFByL1WdkaJfsXdcHrUsSayebrz4ESwrDVMtKhOprx6LGU01
	3EzidYDByjhFX/HUuBdjsBLRfWXYFbTNtM9Q5oJa3BZI219oAg9zCV/3Ws3uZE4jf1UUb4TDwuP
	IWr4xLiV2KN7XvDiGwUFtZ+loKHJyHsq1BotTFyv7g2+1G1f2kb+BW60tsTT6/GDA8vqO0R3Dcu
	XzTE1vOVLL/4AfihJPbLm/lWaZut0GU1idIxVi233YguuRc4QLPVfXr45nVgYrh1i9EdXYTgbGU
	2up0+hkqk+u02UP8o2uJiBo63q0L53vM8AekCnsYTeFOgn9mdIxxYKwmheflRwqz/6yyuzfqT/B
	Y1KNr4CW1phkfM
X-Received: by 2002:a05:620a:2991:b0:93c:aa6b:93a9 with SMTP id af79cd13be357-93cb5c10d42mr278082885a.32.1790819897760;
        Wed, 30 Sep 2026 18:58:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2991:b0:93c:aa6b:93a9 with SMTP id af79cd13be357-93cb5c10d42mr278079485a.32.1790819897286;
        Wed, 30 Sep 2026 18:58:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba440595e3sm175732e87.8.2026.09.30.18.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 18:58:15 -0700 (PDT)
Date: Thu, 1 Oct 2026 04:58:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: muzafferkadir@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 14/19] soc: qcom: ubwc: Add UBWC config for MSM8952
Message-ID: <lxil5g2zx3gr2li5ola6xyj7khwfltzbyqfuflqygrcetztryu@mr65up77ioec>
References: <20260921-msm8952-initial-support-v3-0-b96fd3fe298b@mainlining.org>
 <20260921-msm8952-initial-support-v3-14-b96fd3fe298b@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-msm8952-initial-support-v3-14-b96fd3fe298b@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAwNyBTYWx0ZWRfXzmx6no8ZEUkt
 PodyoWgN6gCFJoh7FvInNa/i5zWmzlaItGYvTXR6X4nnVnmBKlmqlIAfGdW5b6ZWNeJKsuMBxNM
 TxoVOVV2ekJfBmsfkQ7ykXuH4aF/YJIwN/8ggmaCVlkFxJvAe6KjklSqZsfEunWECxAbBa7Ru1q
 jdzGWVdy7Wt65oEsUzK6cLBd64FVVUbSkcE+6skFGr0xGEwdcmg00j2quvL8PvzhzpQmEdJD3wG
 3wiZJ/Q1V9Mp3eZuFDhEYqSKNfQeZHdoYoDAjb7ybuB6v1/xKIwye1uGwmec5wBURBAMUvBxi2E
 0PbCDIFRj3WnQRm5p04wXZlXUQkrW+n6ylpg3poZ5SrwJKBEj7F3mHaksw2VY3uvb/G6wM4MilD
 2c+CGyRX9Yi0QJPySwcJaQg3mlxO1Eujq3Odurq3F3sTZ9YuIZCb/B8GIf0lV1NV0WRevjLSa0f
 M0aUES5Jy6A3X9P6FZQ==
X-Proofpoint-ORIG-GUID: w28jTBdmYDB9CPIIL9e3DaiDzmkmM2HU
X-Authority-Analysis: v=2.4 cv=NedzRGD4 c=1 sm=1 tr=0 ts=6abdbe3b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=OuZLqq7tAAAA:8
 a=EUspDBNiAAAA:8 a=bqz1LMNPX605IxUfdh4A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: w28jTBdmYDB9CPIIL9e3DaiDzmkmM2HU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAwNyBTYWx0ZWRfXybfC04wZxO7s
 1YqlmnWWKYpgzoPIEBvIo4kkwfgf92cs6mX/3ZW8IiStnQhwDYBBZtc3Au3PYDhjb3Rqfo7eUAG
 HLAp851fla46bqoEEQ2QvrgdXWnjNzQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010007

On Mon, Sep 21, 2026 at 09:19:05PM +0300, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> MSM8952 uses Adreno 405 and predates ubwc just like MSM8939.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---
>  drivers/soc/qcom/ubwc_config.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
