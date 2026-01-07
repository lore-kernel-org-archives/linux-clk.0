Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83469346E4F
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 16:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767802707; cv=none; b=nHxLnrQEX9Il0ZtXVHqm1PuvqdrWdT0euoMwDVsndFfKs+KX1cw6BOqj6l0L0IMnk8lK7U1E/QteBqWO4Q0u5Gocd6kzgIL9C2Mgk/GRS0QpbuNe8e8GolUohk0ZC9YPwIhGUwYg+4bIXI+uAd2viR2eGMoLdg7+QrjLu/mLQEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767802707; c=relaxed/simple;
	bh=QyFvZY01qp66pSTuvlh4IWF/M+0kAl3dI8MS/igN/8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZNJ8ZGnufFjJOibH7KcNW7uZiE1UbnBi7uwKZRIeFASCpWRE9rtWaeuL59YxCZUKsA2Y2HbY29tFQ61mSAik1rielwff7SyQl6Zxaz1LrOWxXSiW4RreUjvSQPjxoAVVaxupJs404v7Zdh1jYIGnsVHeP1BZtOHmsr0gF0F3YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7ommpBt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X8yxXXHD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7ommpBt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X8yxXXHD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079CH1a2453884
	for <linux-clk@vger.kernel.org>; Wed, 7 Jan 2026 16:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IVuHe0wt1etXnyCGWeXSp+IZ
	3Qg2MMH2Kny/0EnRpgQ=; b=M7ommpBtDPH5Y2ncr1awtSMNvETTSlM1jTl+9vJP
	WmQGzKpcCpRugST+xcH7Z+lv0RagNJ3ZEMe3aWzIMur6OwWqMElh6SRhrGC9dwA3
	as6c/lkESylKRgTqvcR6XUUXU521nL83yf+ZKdUrwg8CYucGIXKKLcQm2s7PUWiN
	y2JGdPQ0F+R5YOrPPthSHj64qgu7sE/UFbEA8cckO1mP7n6eGkOqyXUiNT1p2Sd0
	AfrACZnMFWHwgiXaszqyXKUJ+Zdx7hs1C6fD2His0GATr+lbzn+v+fqAenK2O6yx
	vg4roz1ujWe2Z6j5IyU9jKTuSkZJq8J2F+zhsgzVNgYA6g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhmnbh9dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 16:18:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c38129a433so567464585a.2
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 08:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767802694; x=1768407494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IVuHe0wt1etXnyCGWeXSp+IZ3Qg2MMH2Kny/0EnRpgQ=;
        b=X8yxXXHDddDwz8KvvEkBCECN0V4T+PD4OS+Iac5M3brcfsJErf2Ig4wAsqlXtYHFwM
         B4U8hhaPl+mbEqqZbwj8JYz5YFPZ/dqFHUw63jaZgzyXPWrvWCu9H9zLw0puQWSUt8jY
         U9nm8nYhNE+vwzGERtn3+d4xe2opFa2N/p4DssAfmgMYray3SMSeP4A9dXzWiTEosRkF
         CDybyEkrKCCQVSrVLFGCM3FjLquR11rfCS0ka5XYDDdHls1v4zHloo1xuuyVljVOt1FJ
         2ghAl+zS2rO3JN+wOZPzeWJFuDI5XGGHLjvwwWbKtCoFQVOmTyzBunmcjQCnqmhc9bJH
         I6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767802694; x=1768407494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVuHe0wt1etXnyCGWeXSp+IZ3Qg2MMH2Kny/0EnRpgQ=;
        b=dtcUOtERmmIV+H23u11zyBD38KG0IKgMQ2B5kJltEMI4V7R/Ib1Lem7KxCmpgqOIf5
         lKcYJrEx/vo4yLbt/cXO7MrkN6uyL756x9hmel4nuqhFu7W1pYAcdvkhZv4BCY7JczQL
         cN+Tke5719HxExYXG9PJcMeAqU1S30yPq1uTF1mOfvLLDVuqDNQ1mL5b33OWaseG1wHV
         jphamvQVV+Zvx1FN9s95Yuc1p/3vy66u6BZbYYbXIKxhu3MwCqai4gIsqTKQv5EzlBMY
         uVYgmYO7CMj3XOVFSmKK37FEPQlaunx4z9VskioUwaQs/j5N/kiiAm6tDP04khU5RRie
         BdFw==
X-Forwarded-Encrypted: i=1; AJvYcCUagiJJC7PCdDDWBpsb5g+Qm35/424gANldPnPiAq8dZ5GDe/F1h2afDy5XouzfsR+LzDkKWOhckoI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkD9oNtRnw1aJdUQrcrvTx2OnVjxQbfTjDVxsbTgITNBByTTgT
	keIipDYpd0KwWRmaoLchgSzkcwhPFO30Nw8xeQr3eoxyLQsk/gAma8B167YmebBYsswHdKEjnFD
	if/13mDfebQxAaZYQx0bsxHIrg/1lmg7tXcxxPlA7NyZnNjhLHEqE0ine5hNB7j0=
X-Gm-Gg: AY/fxX6sfHPn3DyU06wFekwD5yEAUGmGqVOWXuacNSC+6gbohXR/wJW6PZKQGJzfFZX
	3PLoCtgFMLbapv1kCC05okUGLreqi1Hs9XVL8occrBCpkQlFnLo5zIbAvIk7qc40LuX1eAMHNqq
	kJWrc37OSbmR51t/ccwUb7VLmyryoe8yskFu+sJR5cq4+ZBk14L23q66g7Q93mWa4OlDO91H7EK
	K+uy8H3GbhW0Rjgqbk6KSedQQ4/FmiVVwdKxz0MTrk7yoKfz9Ct10qnJTbXZh+HYgVkvNYh+ggA
	oOUGftmm5W55oWgvovvBeUW9mKmwcVK2CBm7x2Am+Vdgk+3JmodhJ+Imi6N314D16ADc/p+T5zM
	UmEwVzSsVLTdOFLa7EfLBRQj4Ydj+Il6vE+rIBTc21RZqyYT/+H58ePU6fU5rEvpUFNHkBzyZUo
	9U5siZgLExxNrJdGUB2x+ofDE=
X-Received: by 2002:a05:622a:4209:b0:4f4:e6b0:7120 with SMTP id d75a77b69052e-4ffb4b5da0emr34184281cf.82.1767802694050;
        Wed, 07 Jan 2026 08:18:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHY38emXXXkVnOMgdE65Id2wbfbRgInUDB1ehakjGirLO2ZFzXh0B1U67TMsqyhlMzUF0FBw==
X-Received: by 2002:a05:622a:4209:b0:4f4:e6b0:7120 with SMTP id d75a77b69052e-4ffb4b5da0emr34183661cf.82.1767802693489;
        Wed, 07 Jan 2026 08:18:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65ced9absm1402000e87.5.2026.01.07.08.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:18:12 -0800 (PST)
Date: Wed, 7 Jan 2026 18:18:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 10/11] clk: qcom: Add support for VideoCC driver for
 Kaanapali
Message-ID: <cfp2ukahbgay4fbm5bqq22mn2jumj5o577wskrfsjtftpznpa3@cksi2qp7igjm>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
 <20260107-kaanapali-mmcc-v3-v3-10-8e10adc236a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-10-8e10adc236a8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEyNyBTYWx0ZWRfX064eP1Wn1Bsg
 G1CUGNA6NYNcGKvjli9a1yQZFXwxvepgFfmDmOjSBeFsbYYmoxhyFh3MZK2E+3pFqgV28MowSEK
 ofUXKrrJxCbJACg920J4/yNSoZwPRnGecuXRAI0/Vid0lmZosWP9ki555jhBcQF8+Vj+0UqRzMP
 g3Y+XbFylTdvjDzd/PeqiPwvBOvfG3fSSZbm7tZz71WliAfOu7aR84YCV8KtCCCr+V9p418QWjG
 IGJ3403Uwx1F+IVTxCXZRyDbitEWY+UIhxaGiAzncSqRtOGLujrKr+Vytsfn5BGozx13a/ThmZ1
 cute1qhn7/1F2JSkPaVynXph6GcsjgK+T730LU85CoO62luzE3dmhAwixkr8uyMGlS8yJuQ1xUf
 Bu1a5Z+W1Rr4uALYTnYFdzopBo+RhUOa1FAgL2U4htJddDtsn3SAQM6wCsDeEkBb5ASW74BNZdK
 BdkUTqMojLGQwShlfNg==
X-Proofpoint-GUID: 5TY30siWwuy-r8bxskCA8FbfQuPZxlLF
X-Authority-Analysis: v=2.4 cv=eIkeTXp1 c=1 sm=1 tr=0 ts=695e8747 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0FKzuNh7WTnq1YNKSakA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 5TY30siWwuy-r8bxskCA8FbfQuPZxlLF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070127

On Wed, Jan 07, 2026 at 03:13:13PM +0530, Taniya Das wrote:
> Enable Kaanapali video clock driver for video SW to be able to control
> the clocks from the Video SW driver.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig             |   9 +
>  drivers/clk/qcom/Makefile            |   1 +
>  drivers/clk/qcom/videocc-kaanapali.c | 821 +++++++++++++++++++++++++++++++++++
>  3 files changed, 831 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
