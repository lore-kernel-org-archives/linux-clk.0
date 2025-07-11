Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60AE27E075
	for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 10:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752228023; cv=none; b=nPNFSBmktPw8hiTR32XvURoS+JKnDf22lEATkFEWi2zCIbumw9hX/MB2YlQpLa/qbwLz8iFZkuXpkUv7KiIaVfx9bKq6OcchpJ7gd4eXbs3+WWrcLKi0Bu99rTyeQin1/ZAipzeM4tJyZSdbH+RkjZ6TQh/8J1gCQtHvFerMGL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752228023; c=relaxed/simple;
	bh=zWLtanhvCIpSQaF+swneQUeYFWPTh5F4obnY4lrF7m0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UPftraXETVJTWODWEq+RUYP/+nN3d6uC1AjsrfFdv242IpnAHKTXyVigpYF1Wp8NWUH2yjqV2ClftE2DfA8uSgYu8IDAr7HjWDj8r8w5MKeT1myAAZE28PQ45zvyoIZuO0nRFWuurSdKDRfQGqh6F0F0F06ilM/iKnQYevfBSsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=axw5SR9u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="axw5SR9u"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1X3uW012023
	for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 10:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=; b=axw5SR9uMFk3cf5O
	c65Nu/hMWRZOrxPT5SbOCqJIjVKnOvBhRE8X0fQ6i0KGuZLwsJI0EMBLgz44VhIW
	WcVUXjWHyNwtSFfylk/BbF+Eaf/rUfoS1cG536ujCumN/i+ut4Zxunksp+PYpzh7
	9T05vbaYGayHfh2hWaTcUL5KISKFpUwpRwKtAn9d9LconQakq9FBerVWsIjzrkET
	twVdqZ98NXYE937d6Lqi2sragbZoGI3siTh6HPt3YfEY+J9hwAYplrs+on2CVKB8
	qWsm/cZD23v+ESTat3Gkt/SyuF/AK3Lr8QaRKSrvAKbwTUDr9l5tbRMmg66stqP7
	Qqv/kQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47sm9e0408-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 10:00:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7dea67756f4so14675685a.3
        for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 03:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752228020; x=1752832820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=;
        b=d2eQHMyad8gDYC71bHFDsaV7dqh5AD5rDdJdouYr0vcfF9LzabSk26lDi9MkWiMpy/
         B5S4+3c6+/smdAJwMkFXv4RAh3vhIurfNAslvVbm6m+2LqyEEuN/gySFqirEmodTfvAl
         x5j1r/lc6KbNwKQ47+ny6d58+yUbXdJToHn24lu3DWmBvwHCReTlLCIuGc9qjy3Ee/LT
         Ai0Df8depEUw53IZ439YyACxJk40UQk0xZPPyQWYb9EOar9pn+hlbqxXcRucYMhi39m7
         BQiYVtyS+1D9tvdu3CMVIwPvAEGc6AEs2YWJui5OwlL4EwsJ3bgDuHZuvMRNqibCZyj8
         vBHg==
X-Forwarded-Encrypted: i=1; AJvYcCU0dGxPf9bq5iNFkk/Aw6SEUUDLAhzWZKMVBlur6VD1wgJ+wEDLicYrtoEOFr8Q6IKVf5hqIogd2Nk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhgtP8Qh9VnYwYv8Ifa62/krAEyQWg86kFAlmq7ZJLm2GAFzhc
	h861PsFYn2NqAxxJo6MeVJtvDu/SuhPTnGVeuDZmij2+IoBzpQWS7dRx1OI/80HQxWn98cbA/Ey
	YYkl/r0lpvM4RcgnvmFyH3j5V+aPgzJdaWXSpP9utw93skn8GioH3WTzxJsDlSTQ=
X-Gm-Gg: ASbGnctSv1x+yImterQoCbxcF3/uZwtxe1D5oSgJh3ZrHJI0cKsB3JBYVwYpUVsSyrn
	zpxKnSb0B1sH34xPGeNYLbm++i9QJJv6Ag6DHWvEP4O6HkZ2aM3yRLSomV7iLcSm9GBuyywG187
	82boeBJHZCgAXQTpc2zhXBMbkfDBUcBPHrhSsMZJnASQERktMXDr5M40FtUDRhacKZZUcKeDbg1
	eSvrc62ArPRwdqSJ/F6GZiIeiAtABkueW/bXORS8Sj/zBQhPL5B+8y8PZSc1IcVvIfG5gjMNkm+
	d/lhK4aUWv5AHjMXpR6ZvH2sY9OCoc3PV/mfXSVvwZ+ukNmgxc/hQGBtzPAROjZUO/n8F+N6/53
	e+9yFrQeRChRTAcNZEwrG
X-Received: by 2002:a05:620a:1791:b0:7d4:4353:880 with SMTP id af79cd13be357-7de97c2cee7mr101575385a.6.1752228019692;
        Fri, 11 Jul 2025 03:00:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlhPKclj6Yn0L7q+F2xj0Xt2MfgZll0J2UP/WxG5I7gSC0cNE/OxkTsOoKzfyHayBKXzvFZg==
X-Received: by 2002:a05:620a:1791:b0:7d4:4353:880 with SMTP id af79cd13be357-7de97c2cee7mr101571885a.6.1752228019106;
        Fri, 11 Jul 2025 03:00:19 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e907c7sm276215566b.17.2025.07.11.03.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 03:00:15 -0700 (PDT)
Message-ID: <9b1c3318-7d89-4fcf-99ea-3b446793a758@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 12:00:10 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] drm/msm/disp/mdp4/mdp4_lvds_pll: convert from
 round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>, Philipp Zabel
 <p.zabel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Linus Walleij
 <linus.walleij@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai
 <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wdIU9s76EDTVfTPdaY1wqr4Dged0Bud9
X-Authority-Analysis: v=2.4 cv=W7k4VQWk c=1 sm=1 tr=0 ts=6870e0b4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=Lh8LEGs6nEvmLzq652MA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: wdIU9s76EDTVfTPdaY1wqr4Dged0Bud9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3MCBTYWx0ZWRfX1UtW261hCzPF
 jsOQ+HdsPHXbZOvMYUNAiiOZI5njoNkGseGuGRLvRYItyNXEczn0yqhH+6Qu2O6cyPb7mKk6O6f
 7K6RReACh3WVfjdwaYOoyQ47AufSaBCJyMbPa3SwMS6LIk0EL040w8JX3XxhyMfmX5/rYdSt7jF
 jRNRO+Z3j2XQ+SiQxJGFhvk3qTJ3MVehHi8XOy/pwopuN1hxk/pdSxS5wx2mJ3fbcVnxEPNDFxT
 /OMDQBrGeVeWL3Xa4homtcS2vOjQAqk5MePUyTt4t4Bo4Vrfmo5ljmBkgd2OeZ1LIa7F3Cx1uDq
 16QWRmvMb0zH6c/DOQ2z3fBQs4ksnxqWwmR6+G9buDGR96bWFfoYqWyM7lzqUa+lQfZznHjE2Hs
 CV95c1B4u/62VH9RCVySoi/aUIStvvZfSnaypRBdHlCRdFGStnqfbCzQqNxZSZIoj+Esaqyl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=787 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110070

On 7/10/25 7:43 PM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
