Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E01028A3FC
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 10:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753786103; cv=none; b=lF+C5KTgFi/CruZ+c7T+398Kj67zfkebU0QfnsDeR8CN0XWoLbwIH4BEqNdbUCF/EdGhzrv8BVCkQHPob1309HUlJXLXzznPCPIzU5wSeYfPu7Fq9K6cla8t+VkPLIwYveTe2gYvO1mt1Iq+Vj6nXA+CTZ9DjIY7IJNYx9ZKq3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753786103; c=relaxed/simple;
	bh=hKHbjjoJ+iGtckzDyicYvICv0iTNTrl7TsrUzNgpKaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fAv0vwm8cwzNxSrsMa+9C3fUrVfGEewUUMyUZ9znFbugueMjB2ji8eue6lVp6J4JvRnAEDwj3+tNQfLYtWzJUroRWDL4qfpJvU3FSJv6pHTFZJ8lNwdFbd3RH1bmYf4WPaMxuKaXFYlSQF+RjZVqwmdjB5jXItzSsETD6wRZ2sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lnTD/atV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lnTD/atV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8ruRh028201
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 10:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aIZodOZfSRc4bXLg5h+oXoOK
	Sy3LJLxbr/aCH937D3k=; b=lnTD/atVx4T4mnTggzkJ16I9SaQKJuhYu++ApJLv
	WcR078znfxHSYM09lIWgW3PCeNT/z3NLxt5Z+saZ3ITy9xrU/4vlXgklzHuZD5hQ
	tPGFNMkae5h8UbvrTOarKQRvH/XM6d2754gZKlmATH9c0hyG+fdLJAVLKt5jWOCH
	tam/MyEDe9todFmT7M0xdCjz0pYKDXGYOXJj2qV3mAhJhg/oq27PpgRuITyf/mH2
	aDpq1hRTNoHGDn/kskCIckJKWYgYhPVIDqLLdgWxgFopjbzPB3D6cUmv3irUXwCp
	TBlUqG+fJfIYtBJFTUUM2SCtX3V1TWSEWa5wCH/Zcoq6MA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2fqnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 10:48:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e33d32c501so1382898185a.3
        for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 03:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753786100; x=1754390900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIZodOZfSRc4bXLg5h+oXoOKSy3LJLxbr/aCH937D3k=;
        b=mKn8GRUpUKjpG4Mt5GURWBGu3L0tooAGAEO9lJXC/+uSVofBng5MhI3wLdqZTQ2/Am
         6ZF6Ls/PMWrX27shwXE3jFqvJ3aLMAKo3+scYuCwu79u5fL/TN1QUhyLIfXnHgkidA97
         ag0j2KF5ckIRX+byEZR6AleFjZ5NE43wcnKb0NbnlNpyLpxA3S4+29xj3gAFV9oo92Nl
         bRsyVm6xKRqRw0eHO0sSjDybDjQYs5XQ7LBWzy5Rn19CGxjbuzqg1NqEA53HEZCo/Nae
         1rDS5GsPvcjuhI9meyMnl8DzMuHQI8zqzLaphVnHEcQT5bkEnhZnCmytk4GT8ikc/Qzp
         CatA==
X-Forwarded-Encrypted: i=1; AJvYcCUpwgspebYndMWeWYdpZPTYreoJgMX1brsxn6/lRPkcpCbjXinHYl9VHArvuk952Qy7YwyKkJ/bsgs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2YUbH9q2zef/Gv8WnUdDbSPM6QAzTHSR+qDlrES7SCj4p+oQH
	QT1fAeej3Jy0YVEshvlNfGTtjqw8ZN+oX0L233iA9LiJYpkyTcT69eDuYC3SdIbskXoA2ZvD6/c
	BBsGdgCBVrFceFeTC2frJ7nqCA/7r9pmjb9oz/H1V2ZnTiMN44TnXEfT96jHzxxQ=
X-Gm-Gg: ASbGncvDh0oqaiMvfPXRnSJvcuhmHo2e6JlQTdE4gVMqzoIY01ObDzn/4HFus0ZzNJG
	7ML5QLnTK2Y+bWMSqmV5AA5F9W7hpY48bTc/oEAGrB6Z8bKxrHXBoB36bgpjgT1wPYjkD3bMoMt
	p7sbLiiTCcsrhpVNMwce0w7VjOVes7fw5WoVWsJwOxj2Zh6CiM0BwcJ4HhgffSKGoXiuA9XmrNC
	y+6lRbY5xTHR97RfNNVorG26Puw8Mqlq8MqCsKNJZIvymN3jK3R4URgi3Iay0h3hHYA+97508La
	M0B3KmLji2gqnXv4Ge10pGVccnm5K/ovY8XYkkSCaKf0QDAVF3VD42y9I3ics1U4fKsicZNbZCe
	SrZpwx0m9Al1h9FLp6Cj7z5+xT9bDbRvepsnQrNYN+Xr7KA0h22NO
X-Received: by 2002:a05:6214:1cc9:b0:707:1a5a:71c3 with SMTP id 6a1803df08f44-707206fcfcdmr237668456d6.16.1753786100353;
        Tue, 29 Jul 2025 03:48:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFddgyjGv1hFw/a867iR4nqNHV4MwlsaV9ZbCgAmOWAOWVeaSDHwt5F9kad21ptJ0V3bBzeWQ==
X-Received: by 2002:a05:6214:1cc9:b0:707:1a5a:71c3 with SMTP id 6a1803df08f44-707206fcfcdmr237667936d6.16.1753786099873;
        Tue, 29 Jul 2025 03:48:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331f423597bsm15621391fa.44.2025.07.29.03.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 03:48:18 -0700 (PDT)
Date: Tue, 29 Jul 2025 13:48:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/7] clk: qcom: gcc: Add support for Global Clock
 Controller
Message-ID: <25uelsjuw4xxfopvfn4wvlj2zgivwbjprm74if5ddwvht4ibfz@yctc2kvfmxyw>
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-7-227cfe5c8ef4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-7-227cfe5c8ef4@oss.qualcomm.com>
X-Proofpoint-GUID: hkypSaTf3Ibn-nMrdeWGPJicwAuVNxin
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA4MiBTYWx0ZWRfX2uN3Vi948ETl
 fH6PORowNQOFL1vDjnkFNJYSjKsebVADcRI7RsyH6Y6++D92Wc2d3HfIuNZbMqQxPHJRDJLsaGF
 DvLUjsQDGYGJgdo4+QOt26b/NmP05u0+3LCNLFJ32Cf/hvCSokGD12veHpvOvuiLqyXWTrt4vcU
 TJZedR7xl2u8IWatDubVWCX2VRKODtqa4r85eCap06URVre/vcx6zd0Km1fefiJL71/OObivww4
 9WtOCCoRHvVyKNSAsazu4t6HgmW33yu2L1ESTeiIAMOehA1pLDaWBkTZq98gWdCPrf5k8Eqdusn
 3fruUpnZjkGz86cISAPxUW5hDD4luOuPkUS0sVh6DbWpiriZBr9RS5SG7raNnihqSl/7RA4Ir3H
 B1g4Z8R5gTZFtHt2Mw+opFStWd9yB9hZA9pyc+E8iDpQZpyZW+PR0TI2d5a16MEcUViGnj3S
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=6888a6f5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=QLzzLPEayNjuskPGAjcA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: hkypSaTf3Ibn-nMrdeWGPJicwAuVNxin
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_02,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290082

On Tue, Jul 29, 2025 at 11:12:41AM +0530, Taniya Das wrote:
> Add support for Global clock controller for Glymur platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig      |    9 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/gcc-glymur.c | 8623 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 8633 insertions(+)
> 
> +static void clk_glymur_regs_configure(struct device *dev, struct regmap *regmap)
> +{
> +	int ret;
> +
> +	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
> +				       ARRAY_SIZE(gcc_dfs_clocks));

Why are you doing this manually instead of using
qcom_cc_driver_data.dfs_rcgs ?

> +	if (ret) {
> +		dev_err(dev, "Failed to register DFS\n");
> +		return;
> +	}
> +
> +	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
> +	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
> +}
> +
> 

-- 
With best wishes
Dmitry
