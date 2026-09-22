Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB864AEBCE
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 20:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109389; cv=none; b=EZ0rJpztYvW29MAiygo773u4ri7YpaADdEpiQGR9wqgRSqRs2lmoQ8JzoCidCgoGWrLL8NFo/+9p6HkMunQ1sirwcSFhwCTP+DIoVomdSDV+kJ1KeCw0uBG/G2PRRrC1iVJpyv0fBAazOEkSRKc2QzC9LrSTnQTBroxE6fenMho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109389; c=relaxed/simple;
	bh=F2Rmub3kqynxFCpMUaKCzbW3Wn9kxlczWQbB/Q64QTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWxxFpK2L12l5niNqyLT+u4SaGA9A7SxrIMn1KjMAbdQN2XB9v6sDyPEjx60ScQrAFHfkTwtxNs0wrMY8MuDHL+/26yCh0bHMiviZODs5J7WUNJYiQblH+lyrvEbsm7BvYStenvKy0Mx2f7rjHJ/SeY4UwyQf5+jXfFY4xn5UZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gq1bXgXF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ip0CgMha; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gq1bXgXF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ip0CgMha"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7Clc368050
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 20:36:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+hpos+oDMvB//kGlWtIFvFC8
	JGuO25mX9RiSy0nVVWI=; b=gq1bXgXF3s8Ra4n02W3SuuXBHDj7XCY1aL1sxa9c
	u2ix9mNTUjoYemXIUH9MUJBag6g96s+TaF3H4UV4X0Wwh4Jp4C+bT1bvRGIefFf/
	evLcj9iy5K80G4tgUlTNm0+6PM8pnK+UlIK/rQHU6HORQq1dobQdsAQc0sOs2yVP
	l6barOdQ00KSB1x/v5eVSy6TCD2xX5HcAR6wERBje5qrpc8jf9qzQK1pZrDDPGLL
	RPaiXl66re5XrVB2T0JhfiWpX/Geoo/8x+tGZHhuAEDzeSmfJIODDBAb9vTknyUK
	jnvkqMl1sq27dq08hW6w+a7KwE/1SdLH0GWY6i24Cmp4Cw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurntau4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 20:36:13 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c8323b8464so353042e0c.3
        for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 13:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790109372; x=1790714172; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+hpos+oDMvB//kGlWtIFvFC8JGuO25mX9RiSy0nVVWI=;
        b=ip0CgMhayu6gB3gsAPCS5yxYEqc+dwLSCbuGbOjh2Nt9Y3rNTHqxJlqJLI1dqE6NbV
         ncP5LngzGNiDLFA3naKTHyvHv6Iu/GvW9y1PGJDMqB7+b2tucjY8gPjdNqTYBbS76voy
         QOp8+2YEHvusbSCFsBMM4CzX49AjvJznet7YYf31awLcY3ANXNujhvHEBaMDxj3XKpaj
         BoMKiO4ofIVyKfpcLME+sxcLsCROkKUA7ejBThgRV18Htx8z+jnEydvU89gCJbt8r05/
         +H0O+z9Iah5AjZrYbi31pdjsQ/TJf9U95Uty2BCCwufdgLvZPVM1MYHUrhWuBd1xstNF
         NLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109372; x=1790714172;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+hpos+oDMvB//kGlWtIFvFC8JGuO25mX9RiSy0nVVWI=;
        b=MLrBn3xG3F70qoSHIT3dsjQVGUhSnvr53P/dvLCsWcRT7u9I2r0zLvARKqV/tCnyRv
         ODHy5Pj9+caEzLtTYtLUhFwnWrjMFhymHFuaVhKe6LvVU+7QQODLTXOUQ3OQUUs293Os
         yCi0v2pEgczblNE/83HRpjNvGmcHkl4mEuw5WUUOixqm/xdxyUzkMFuMYy8p+4lvsVq3
         5hlslCcrHZ6W80XTzgIU7dS/EyLW2GWvbFQSW/9VBkUbyFkllWREJfM18SNtofASUtTM
         YGYlJt9Sf6pUXtQHxsoYJiYk5uZxt+aIGyt4wRrmfzCpZCXRwB683ErDzqDzyvoVeSbB
         lP9w==
X-Forwarded-Encrypted: i=1; AKwUvBz8nX7EzKKyLdhiDciCFcrEsrdODvKRWKWOJFNYvLwsXCibugORdoWleUhE190APbI8deM8WJ7MF5k=@vger.kernel.org
X-Gm-Message-State: AFuF++lZR9SLxc8wk04dT0CiScDbRm83pngKNPIQK3W51CoHTvHNBVCn
	+iYI3IhfGdbVKbSnvAVjGM7c5otNq/A62IN7NHEbrCs+rh+Elz60ODWs95iqwettb+IubiOAPKJ
	lEfZiKahfsoq3GVWRbKduKzgVw78Fqa18jK9prals9SrQD2OeGSWsecQg+RzdHQs=
X-Gm-Gg: AYBFou30bG12IWZXfGeITOWYms/F0l6WPp1Q38XocPy40zjnMssJMh+Gz+dYRUPas1f
	F2BbWjT+CYsoouH3sclC9UTBmjrBGi4FdIfRlS0jKXNCUiv2/GplUzTcUw6iTys/7qiZ4hOP6fL
	uCg5r4xtApptFf05n5fh1x1yXefa6iWHyP3lSpInvPY6xEspa8yGceplgJe7UYftgq9YQmz5UO+
	vuruT45ZcdJ+qCnx+0qpH6UmyWlbD4FsyucLjPfzs5frbx+eOGtY99+cRxSijqnbGiV8M9oz1rT
	owAevvD6V1nnLrZTeU4dc67AggC4YTUw6hFpOvs5N/3UkjWh3JQ09YStR78bh0d+GulVh2foES4
	Yse8nM9HllEewvA==
X-Received: by 2002:a05:6122:21a1:b0:5c9:a7af:8178 with SMTP id 71dfb90a1353d-5c9f1597c52mr1337319e0c.2.1790109371722;
        Tue, 22 Sep 2026 13:36:11 -0700 (PDT)
X-Received: by 2002:a05:6122:21a1:b0:5c9:a7af:8178 with SMTP id 71dfb90a1353d-5c9f1597c52mr1337277e0c.2.1790109371230;
        Tue, 22 Sep 2026 13:36:11 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c267sm965996f8f.16.2026.09.22.13.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:36:10 -0700 (PDT)
Date: Tue, 22 Sep 2026 23:36:06 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
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
        linux-input@vger.kernel.org
Subject: Re: [PATCH v3 02/19] clk: qcom: Add global clock controller driver
 for MSM8952
Message-ID: <c2jt5rpbmys2fguk6ui7e4lwzp55vio3vf73akeiega2wqb5pf@ewp6wsvtxm3n>
References: <20260921-msm8952-initial-support-v3-0-b96fd3fe298b@mainlining.org>
 <20260921-msm8952-initial-support-v3-2-b96fd3fe298b@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-msm8952-initial-support-v3-2-b96fd3fe298b@mainlining.org>
X-Proofpoint-ORIG-GUID: vkuqSkhfgHDnqYciBPEi-LKAo4ESVNH_
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab2e6be cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Oh2cFVv5AAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=n1RHFZ1giDiXVFLDIJ0A:9
 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=7KeoIwV6GZqOttXkcoxL:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NSBTYWx0ZWRfXyZgTWWzicRcV
 nQZmKIMkwwIruQtAgfUlnR2fphCjuTn/tlDj+mdmv9A3bIh8mXVcJa2/3Buz81ECNI5EHEV79Oa
 VRpETHkcHKR0BmwE8COQbj9llvk0/45nGySrhkrgOEgBb6bCTtxk0yKEO2RxY058f9I3cyQhJnF
 hihDrFAzx6QOxxYq4m5y3R91TdJ0qbyw3Sp9egW55AQkiqE4s+ueNDXaFlAWWJt9izyLktCQ9Zr
 lyJAbcbxNJPv7PZuaMASkvAJ0cqVKa4Ba6d3TbHo+1uOzh7LX0G0zoFGOPwULBv+Cb9MZOJZPFf
 VLOEZvYUdY6urBh5kMTtUKi5UYWd1N7ITbTNR4l8EsXT5HoEWNAHYI3bs6anIdROHPPcv745cQo
 kBnJPafgqCja7URi8+BcNn16f6ji0vImkARv/JWSApmB2CwDIVsVF5Fjm0NWWLNkKWBeDiqMmhu
 tNzfdEo6u4oG3kit0Kg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NSBTYWx0ZWRfXwOaSwoYMOuXw
 R4+hyjYTxtRx6mdhfUyx3vl2h8qzeBPW96mgYi25qynIamJpLMNsTRBO6ACba0MgQWvbp54Edu0
 w8JaflsC3477Jl0DyuOwCwlhss3HlOc=
X-Proofpoint-GUID: vkuqSkhfgHDnqYciBPEi-LKAo4ESVNH_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220295

On 26-09-21 21:18:53, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> This driver provides clocks, resets and power domains needed for various
> components of the MSM8952.
> 
> Some downstreams merge MSM8952 to MSM8917 and MSM8937. But upstreamed
> GCC driver for 8917 series has different pll structure and ported from
> different GCC driver.
> 
> MSM8952 GCC driver is mainly based on MSM8939 GCC driver, with
> some parts added from existing other GCC drivers.
> 
> Link: https://android.googlesource.com/kernel/msm.git/+/refs/tags/android-wear-7.0.0_r0.3/drivers/clk/qcom/clock-gcc-8952.c
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
