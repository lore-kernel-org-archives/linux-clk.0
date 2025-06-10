Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8629C27FD73
	for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 22:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749594208; cv=none; b=bSilCCUSt++E6vvY53kGRgi29dnDpWpE33vXK+0lohDvrE3P4sZhjoieIiskyU/Pez0zUVF2NMl7L+eA+ajWD/2MNl18TsuPpjlJmTn+CHyngsmmW/CuY6cpIsBBrwfJMa8Phf8RCi0sq+v7Dmtv1xN2rinkzWIaTnFCai01e4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749594208; c=relaxed/simple;
	bh=npHB7Cz4fEyvzZ7FmcG0r7LLLmBlvaufPDf/mhV2evM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ooyQZWslgBv2nF7r+TrCxitTWGKR4HVhb1xor4vpd03lYeaP14fZwCtZYj1UbBaN5YjgrEnkT0crPIJ8BrC9yZVZ/Knmt/+ynfmG2xyP+ObcMdxp9lJtMd3KNuRz/pjW1qIMykR9lIJaz4FZhyHed9DRTRgKRke5PefgYCJ3890=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TspI/1g2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TspI/1g2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPt8m027415
	for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 22:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2hza23gY3coL4GLirsikjG3A
	jHM2RQT+qzkG3p4icuA=; b=TspI/1g2OXSBthgYyOLRrh6omOIB1ysX+Ho0IDwa
	UFE4/OLz1OkqKVRSYwuo3h70Z5kmmTaLsGtnMMY6Tmg4ObuVwIBR6+J/8Z5azzzE
	9apr4NQuprzo2pR+1uHLxl4Je9JktEK3mCY+boeehrY4XAO02drVYETlCRrEsbgj
	0joXd+igquKPoSJJH7UvrCCLtCZgIInP+dA2fvV9sn0syUuF5r3IoGs9+EiYOQeL
	1PSlcjMxkfPsEVBeTiRjVzuR6Te5OHWx4y2KdWPr6yqL7diZdGWzGbszpYlFo7kz
	mTnKpsnkjoxPI15BAEU5kQ7idKQnXKYLOKraxByxVqGwXw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4766mckp5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 22:23:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c760637fe5so1080767385a.0
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 15:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749594204; x=1750199004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hza23gY3coL4GLirsikjG3AjHM2RQT+qzkG3p4icuA=;
        b=o7XdW4sCiPgqoTqVabTBS6aaCQnuB7+x5yl25svowEFCvxWiG5zrxvEzjJ1rxu/y2j
         XXjtSR9d+rKSU6i2TTD4D6V90poZlZYQCc70Rp+zsJvw6J+fkbkumLkbGYtN6HmKmsef
         sld6vhImN+NPLAYcJmmh86yIQ5BFTq5z6jRIIy802hYDB9lZEPnihGX3y8Sx1gpoJxE0
         pKZ5VoYVmq3RQDLDh9LAHtKoe+ws9iVERk+upuua7NXqXSKl9nc+lwor5BhjqT/28wk9
         o5SJPsw1DyxZ/LYBq7obKUNWnJ2Kpse+PQTfVY8H2BWcAEej4lIHWu87FsZwsNafMBAl
         DV7w==
X-Forwarded-Encrypted: i=1; AJvYcCWO04FLLgecUOhBE776veD4DJLG2dBeBc1hvYvnQFxo48NN2M59uukkeibOwcjTAmbrlupWggthb3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLvUu2RIkt1U1sl0QeBqLybqtrtZV0XwFqCa7afGYzkb8yKoft
	pQ8lw6UVlbis1ODqkUXVOxpEwsSpBMOJfz/mfQmiNgGi1nk/ZSoUocDYYz2FgkYezcCDQDBtmnn
	AsMNtltHvoG/VvWBGQOnYGW+WCiZgRyB+GtgH/uNcKN6BANdeRrUf48cvxauomf0=
X-Gm-Gg: ASbGncudgK/ZiTqu8GUZTenCZQmlsUYVL9XM8jPCjJjClkXqNq0b76f9zIpWGcwNII6
	eB3dW9413YF6o1coo0ydtCh8Lbd9QZANBzCreV7VZ38G0VYBFG13Wslcn+qCINwadlvvQQHGaDX
	pemOC9DCYw9ej5IJefMqWDdB1dyVvcgdaK7ZtQbtjPQKtJyNcyhve3J7gY0thTkkGUiatyL4p96
	v51E3zSzKmLfyF/nZTDZyz4p2BrF40Zgq+3eQ8bMk/eW+Y7K0ZpY9OwtgaUS0Pk5WhhOSUgpiWm
	Yy1m+4CJe4ysZaXShOf0vCu/7ndXxKOZdswYewFZB+77ZDlAB9hvcXxF/rJ1jMME5z0+4qkN0Ah
	I38SWh5kZJISPYQdM48iVspPL7TghA4EDyCk=
X-Received: by 2002:a05:620a:198e:b0:7c5:ee84:a575 with SMTP id af79cd13be357-7d3a89bb112mr168585185a.46.1749594204458;
        Tue, 10 Jun 2025 15:23:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCcqxVLVUJFrq+O0cQ9j5/TPx+SAaSrKInIQWb4KK+4mCxXHk5ZJ92VOUVg+qUAfhrlPtaxA==
X-Received: by 2002:a05:620a:198e:b0:7c5:ee84:a575 with SMTP id af79cd13be357-7d3a89bb112mr168578585a.46.1749594204049;
        Tue, 10 Jun 2025 15:23:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55379b2c854sm1321061e87.142.2025.06.10.15.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:23:21 -0700 (PDT)
Date: Wed, 11 Jun 2025 01:23:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v6 07/17] drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
Message-ID: <w4napqk3loelkhl36gvhke6z6xg4g4xxymxsfjn3hmntkj2urv@bshk4l63nfrn>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-7-ee633e3ddbff@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-b4-sm8750-display-v6-7-ee633e3ddbff@linaro.org>
X-Authority-Analysis: v=2.4 cv=T8KMT+KQ c=1 sm=1 tr=0 ts=6848b05d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3n_StpEWJ1elpYQgr94A:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: zKxH1ebZ3GCphSVjokGOU4RHLh3zCnPo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE4NCBTYWx0ZWRfX+uMt8fhyZ044
 ysRAofpnHs55Rpuc0fW2CHCVF3LF+7d21DLjKuZFaATst1WHiQVg2LfW2vi7J1cVUc7aTUjDXEN
 nrWp1IwkWGtixtfvhbjcewI4lDLmCzvYmrthMks0Xt6SjZQbi2ScqJJWMTX3Ek3Nzj3B32qmpok
 kZbpl7l+fiO1M+aWZ2XhiKvsrm5RozZXSMXDxd/Mt1he7WxaHFGCiOW0HBN5VLCagcW7BDFkGiy
 kqzK+JacxbZnjaDto6wCay8p4EDm1Nmu4eWKaiBz4tlXsQHPVVH/Yn9fhU5ake5/cGsLv7M42xR
 phFx8GNa5KmhWTPbBf9Ex0BhKWyDpN5Rq6lJHT5uQnH8DQnPmArJDLhgOvEJGqvWSk3/+pMjRvk
 enS+6c0UeH690VFCYEb9vfO08AKKt/bipMnsp0sXWUF/uqZ+Un+L29XMNbe7adbpc+htjzwy
X-Proofpoint-GUID: zKxH1ebZ3GCphSVjokGOU4RHLh3zCnPo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0
 mlxlogscore=413 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100184

On Tue, Jun 10, 2025 at 04:05:45PM +0200, Krzysztof Kozlowski wrote:
> Add bitfields for PHY_CMN_CTRL_0 registers to avoid hard-coding bit
> masks and shifts and make the code a bit more readable.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v6:
> 1. Add new line between declarations and actual code (Dmitry)
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 16 +++++++++++-----
>  drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 11 ++++++++++-
>  2 files changed, 21 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
