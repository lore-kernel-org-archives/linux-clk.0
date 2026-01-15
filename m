Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B37527510E
	for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 21:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768511155; cv=none; b=WkKHt7suwJBcMhjRs9yryd1rd6p3MhpXMuld7qKWzfTm/ouZ8z67C6GlwDRQO7DpLG+Yzh/dqKubSd/xFsGbX5CQcAIUeQ5Z2D3qPV5pY3cTqNfjdyX+GrHpYlsRJSr9qUg6ofBnxel75TRgFhDd+58zLwERvja9qFT8vI7ZUds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768511155; c=relaxed/simple;
	bh=ENmGoObji0+Hq4MublklfZhpzGxYbI0JiS47cctdDv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MroEJwv8eLodYEE0y1aPqpk0C5AeJNw4kzdAWFAjcs+KBFMqU6XbcF2D3Ki9nTTdq2SxDLTHawMW2tn7eF3OJA+Qe+TyJcx3cMZtbO6vMLoUN+wKvB3NWg4WqiEmLHwvx3orLhQlm3f2efbfQ/URQxNuQWdmwtirv9pS9XwyOcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LcyP4ZgH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SkH5SnJ3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LcyP4ZgH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SkH5SnJ3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYGvV1910150
	for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 21:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WLhM43u7KTCNMftZSAW1g9y9SRicJ/aCzV4l0MaawTE=; b=LcyP4ZgHar0lfCNc
	erfRehhLm+Jly3LD5YZe+gnbNWLMPpKpCHqXWqbxOusksc+bO9tXicyW7jh//NJi
	usIGfOEjO9AEv9gpfGj/98YCcHfrTukl/zYmQLydJsdQKttHrSPAJdyOP2ZwhZgo
	JBQMEwdzMGLiVdBk1W/SXyZVvNdc5NRZT+FM7qpEx7/7NvdPOy5frXysA8s0gU8J
	ZqNYay2ewVXzcLHlbBz3ecFwu6edWv5ajyjydAsDG19/Yj+LuCA7AN0opCmt5loq
	k4QJeBZL720AEGIBMtghVzSNUa8Qz2OgpGPhh0XGju56X61amGvdnRG64wNypL3C
	6E2Taw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpxgn1ryt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 21:05:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a4c50fe5so220328685a.3
        for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 13:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768511151; x=1769115951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLhM43u7KTCNMftZSAW1g9y9SRicJ/aCzV4l0MaawTE=;
        b=SkH5SnJ379fWvURX63Vxc3HKwmbQ79q3DlQeJxE9g4FlrriS9zaYSuSuPMlmUCV4QK
         DpRNVNewpczX1tlQzgDUQOZnvKg+Nphjndr5bm9yha71Zjs5lJsVbkaqMfRzVKFh+xgX
         X/fcOZiCyUht3n94f+7rX0GtudAaecYxgAQHimpeo0VQKQOOj2CVRnvJTLDcp7nVz4Jl
         oAKptckF98NDSVGF0+cRhCVSG7cu4FJ5noowFbqGQDYohVwmWbAF92FGZ8t5J648GMHC
         Ckf8ygMXs3kivXkLEAwByI1qSB9WDyHuy6J5s/SCjoxa50JQWtGsy+Uka2rBOLBVnrL2
         pbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768511151; x=1769115951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WLhM43u7KTCNMftZSAW1g9y9SRicJ/aCzV4l0MaawTE=;
        b=itDEZfURFvDLJol0KB7nANyV4Ipas3jLNMmOrd3LwJHimAHV3Osg4rPIP06By0r+cA
         g9WV+teWWSdoMgO6QvRmMXj1kpEIUim4VyNwgi1NAmJbM0fMO1yXXtGkYwjtomIdTzAN
         BRUFEb6ZxNrqBhMcNzghCl3dfzLAgxeE6z8Vxgq5jNyviX7HGWJsVoJXkEQ5StA9Mkeb
         rBFHDf6hzl1r1YdsJT4R9RWBXlaLkOo2yVpiUoFN6ZynKBebrXTDAK0J/wWmlsbOw92s
         FWOvZvji5vFQKnv/8cn2/Z6dEpynegrrF9TWG+F1EdcSI6JnJPOpWaAP1lB5IrWABIiB
         VskQ==
X-Gm-Message-State: AOJu0YzPYc7uiaB5490ms8jQDPjju7lcT8+j5n96uwatBP01cYRv9kab
	yQCH1RgbD6H7+2YD8Gjy3p9u80TtV9kXqrhXZ8Mssxv4REYpV2jR0r9dGDCXKT+UNTZajC+mzfL
	nfGoULHJYBK5qYmuRRu+R29tKr1GQ3qKwrsqcCULcoYbJBN63z0nrtVgIZ+r5QMk=
X-Gm-Gg: AY/fxX5AldcOcxC533LOlI7czFzgmjrAX7bRXSaeo1UzYtlrl2Y12y0f0MeK5RJVVbT
	nkgkXWneOnnOwye2IbAd9arwZyd9AF1URqFzQoc2iPeP0xzBQ9QivCcwdwvZA1giz5/3gXv6pKJ
	RXX2MR0ymq9mgOBvE1CE+Y5Pk/1NdqtPM2OkEvd69M2oevdLhlm1RNa19CucLbJp/RboYeCfHfa
	dZYDTWQtHwm3IW/YzW2zWmy2J4LA1SwjIxlZ0IxQ8dZwmQrCDZ8r2MCgNi08SXxpawuddfeAWmr
	2eypohQvEBcu8cY5V4JPmZep40DTDi9NHIFjBrA0z3eTdaHOBFZKm0mCjjeCFqw7m0rEGd6UNj5
	yWvO40SLrjzPfstL7amJNHFnccIFqHFa233bb8LfbD244pXoarCBUPzJGXonvbUr45j1RnykAGi
	72HkQF+0wimm1sWrsj/JV0OzY=
X-Received: by 2002:a05:620a:1723:b0:8b2:dfda:66c4 with SMTP id af79cd13be357-8c6a68d2f67mr120083585a.8.1768511150971;
        Thu, 15 Jan 2026 13:05:50 -0800 (PST)
X-Received: by 2002:a05:620a:1723:b0:8b2:dfda:66c4 with SMTP id af79cd13be357-8c6a68d2f67mr120072385a.8.1768511150340;
        Thu, 15 Jan 2026 13:05:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 13:05:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev,
        Chen-Yu Tsai <wens@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-actions@lists.infradead.org,
        Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>,
        Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Michal Simek <michal.simek@amd.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 00/27] clk: remove deprecated API divider_round_rate() and friends
Date: Thu, 15 Jan 2026 23:05:48 +0200
Message-ID: <176851027322.3933285.17869583744437773979.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uyXpOQUQvCGQ-fLRIkURYVdmEDJEQrSj
X-Proofpoint-ORIG-GUID: uyXpOQUQvCGQ-fLRIkURYVdmEDJEQrSj
X-Authority-Analysis: v=2.4 cv=ANDFHcx+ c=1 sm=1 tr=0 ts=696956af cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=whp_R4xS9ENlu3RGya8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfXwTfbxbPdV3Nl
 sDV+Z1nhkcqSbu1vA+dGOo18l5cWLIPLk+aiyLW/gXi9lbSICbYQrEaQvUpju2w6RwLaanwkocs
 sJRwFICQb1HdB2+nRJ/EzB5zybHmUP3O9tNhHoYY2JQeLZllF4RYvGmLEs3HD+4+gg1dZJwQ7qc
 5YeoqjdYceiCNNn6wFn/SZsXUFOS6ZB4WuKBkNOlyGbopG9A4taID+H9IFfBvnOh/cfZQG6ctzk
 3+ZyOkvJ5aBbgO2R5DZ939SaKlZH8gxKEFvshzKfE9vZXBWvs/LoXgQAHP67EfN6mTI7G2v+m8n
 Zx7YCEkA2Ug5pXQLBFa/3yljOlUAcgFmQdFtVUB0KBgzZ1FUCqQgr9BYE4wj3pmBb3wN3wDAunG
 qlIi4fU5ZUvTDAkzweNz/LPOAMh/lV06gpoIEmcY3n+MlRTcLr1JXBetGkF6uI1UyQ7OuP24EzU
 U+EleicCiDYjrdPH+VQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165

On Thu, 08 Jan 2026 16:16:18 -0500, Brian Masney wrote:
> Here's a series that gets rid of the deprecated APIs
> divider_round_rate(), divider_round_rate_parent(), and
> divider_ro_round_rate_parent() since these functions are just wrappers
> for the determine_rate variant.
> 
> Note that when I converted some of these drivers from round_rate to
> determine_rate, this was mistakenly converted to the following in some
> cases:
> 
> [...]

Applied to msm-next, thanks!

[24/27] drm/msm/dsi_phy_14nm: convert from divider_round_rate() to divider_determine_rate()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1d232f793d4d

Best regards,
-- 
With best wishes
Dmitry


