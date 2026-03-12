Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC25271A6D
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 02:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773283107; cv=none; b=qgSvbVFNL/6ttAOxpnfZ6R1WKGz+YrNsvl6EtYQJV8uHVODFBfMWqkDMq+Tf8U8gVPW2/0tbXhRopFEfORDeJIE0oNzXG2S9JJ1HboiWk+z/+ixbd9fsbcYICzeGutz7T7DtYQP1y2iDZaKD6WubsxztKKOAiEsWAjz+U2dgqbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773283107; c=relaxed/simple;
	bh=7V9OuUs/GZ9LAoR22G1yJEV3t/ofu7G0LbfU0uGw5Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0nUR8Fw82PKWS+ZygZWuQIvtAketJu8qc3bp+C21J6k/+AneHJQXNqEw6QZCIQMnK40ITcY5afRCbxbyeO6BUs7aeHTjsDjLcdBdy2llC+qsU0TIWdIdejdGyMC1tVNEMr11Xi9KaatScTSJTWPpNiIxjD5pfAjfD/vqtum4c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NidlplNh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U+mr5m2Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NidlplNh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U+mr5m2Y"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMN1vS4025746
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 02:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s6KmeP8fIPrfCASKESv9JEH0
	i7o9V+Co84iwzH05YUM=; b=NidlplNhVuMlZi/eEghYNXKacyknkSG8ncCiOiuY
	0uGU46oDL86ZALLvV/0amqDJMycVXZFIkXKU1/jo39Guvlh1sHYSO1uzsD7JwteA
	ToRvrJggDcB1VMwPIj4dDhVFJTzGQ2t3BjRbyNTukgWJqesY+vuHiVVS6LJGszbc
	btC1V/XtDB5OyzO2Ac5Tx0N/qCatiflCPOOhJXIMn65aQIcRQMShDcb4PCtbzftS
	akfXVmYM3RZ1AnnL33DV3GAgFVB4LQcb1jgHH+XQlUzHqGI0N9GRkjBzh8kEa2fu
	s/I6ScUIxrOU0aUNrPXzawZGN8xOtv4a2UA/VUAxpf18dg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh50rm0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 02:38:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50917996cfaso48786151cf.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 19:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773283104; x=1773887904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s6KmeP8fIPrfCASKESv9JEH0i7o9V+Co84iwzH05YUM=;
        b=U+mr5m2Yz4NxABbyzz2nFiRfhf6dB3bQk9nRUBDmdTHP+gOi7v19pmPutbSPaXUDwK
         r405+UY83OoNPZnaY1yJVt2u8Y7WkoRu0Rzo/0KE0RQfFcfNyOf8lmkb75gm5Xx1ys12
         8IYhe1qI6zFXu7ail+ClkfxZoTSM4aL/hyVYyBU2Du6zcQTXwzUk9eQmRamz8SNu0E9s
         Q8bsVkzOo7lbOy+xuDTZnR4Np9SlnHs98Na+eS4Fi9sZ12ECpgqJJM0z5kAznE9UqgOD
         K0waA+mrClXw7iQzONt6hesoeGNWaNb9CHyQ0Y8arCGK0OIn7gdrlftNhKAJWMaQCyU3
         5XWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773283104; x=1773887904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6KmeP8fIPrfCASKESv9JEH0i7o9V+Co84iwzH05YUM=;
        b=wowVY3qMThiO4S+mHFCqIs7MDu4fMQWdub5IjsFvbOiYyQ9Rd8cb8dS/Z7dyu9ainx
         SIe24oKu9ICaCrS7KDRh5/09024lhY/wE4dKZ1trD3uyQjyDFD2W8zrUioN7canEEtxJ
         n15qXebhWA+htVWDkkBFla7N+8V6WdIHuMY/3Ceb8tV0pePNuWst7gECgOvUkkf/LyyF
         vxjsjgwobz7nWxxR3o0EbW/Sqru9XY2ltGBq8B6bAawoitTsbpWijLeYxF+m3yefmQP/
         MZTrYEN49yOfJSg5rnblss6IiiehTWQSG3Du0CSu7vonFhBW8+8Agm969Fn6/R8tWoIc
         jAqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyydLnxNVanHm3exMxoTzoDSg/rB+uRVGRNCAC8/jEWG4PQ0OcEJ3tpsLF0CiYbmR2jr2jFYRBdXw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZnzXgetq9dvehjyzVwkI2EVFuBBsomL0+vNhArzuli6NCtwo8
	pYstnaG//nx8NKswMnqQ6BbFoj/MG+6yHLvhE78Dn5kkg1hJdiYMcy8CFuIeJzalXfIlnFZ8qxY
	1b70cf0mEwIqYrbQSOf6eH/fRY3lfS4c6hkp7Em5FwHdpKwl1MgQrjlnu+CA6kG24VKdY14e6tw
	==
X-Gm-Gg: ATEYQzxfBjTjXAYnDDvkG46knY6MpAl2NZ3L7AIOPFMQ/I8hFUVeHjjp0FkJOLUXaPt
	y8nS0B2j6vV+QwiDRB0zQtZzaeU0MomxK2CQ4eMFOPK59pDo2IipoOKzJPcZHZwUw9AHKtuIMqZ
	QAGRyYQthhzmjQG2pEoQoTbKLbqZaGVVf/0o9jO7NL5jofAX2KEF5Mbkk/uQNTiR79ceRuC+Znk
	ByWFDjlz4l2B7Kobuw6k/ckru5PLvNWuDJWWNw9X3i8Hr3oEMMoIoZvG6lNbFH/XhBop1aTCiVl
	F6Kt+svtKwRR85CGyHYa4xUaJgqNJKzsZalJOrWQlgE8kiDo5MAcbT0KN7vKN2yz3HAwfqg65JD
	f91CHmEORpXsGQWs5Y1N0gadXtCmXMpr0f8p4qqT7+kJNb6cXFmq7JTwR7Nm0aM+85FsYqkeJzI
	SQ9ac3QNY5W7X1T3fNqNv5e4tjyvzY26seo5w=
X-Received: by 2002:a05:620a:19a9:b0:8ca:123e:819c with SMTP id af79cd13be357-8cda1985809mr611838585a.35.1773283104158;
        Wed, 11 Mar 2026 19:38:24 -0700 (PDT)
X-Received: by 2002:a05:620a:19a9:b0:8ca:123e:819c with SMTP id af79cd13be357-8cda1985809mr611835985a.35.1773283103740;
        Wed, 11 Mar 2026 19:38:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162ba3sm685473e87.47.2026.03.11.19.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 19:38:21 -0700 (PDT)
Date: Thu, 12 Mar 2026 04:38:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RESEND v6 0/6] clk: qcom: Add support for basic clocks
 providers on Eliza SoC
Message-ID: <wxvb55g4w5ixxkngtxzhtki5wx3eqqql5hy4pehbyhzz7zyazi@ljhceku7yyhx>
References: <20260311-eliza-clocks-v6-0-453c4cf657a2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-eliza-clocks-v6-0-453c4cf657a2@oss.qualcomm.com>
X-Proofpoint-GUID: nUTYpX8DDmAjmqYEsD8hdqUll8b-AnxK
X-Authority-Analysis: v=2.4 cv=LvKfC3dc c=1 sm=1 tr=0 ts=69b22721 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=R1Tt6jW_Uyey-IW2WNAA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: nUTYpX8DDmAjmqYEsD8hdqUll8b-AnxK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAxOSBTYWx0ZWRfX2IxmZbhT4H7v
 KheZv3YVVY3m1rSlQ5CQfTJA3ZOy1Hpf7VFCcICsdtM2xAvi9XLeeTJrtT64AV60u1L/rVZjYf5
 /+UHZzsCybJBEiWmzaOIbTk8N397dxK5ub6y4R2YkiMoUJ1pTPUjwTx+/eWz2ZSuQgM1B2UvD4K
 mGN2KG0pfMT3SyJu7/WeYQVZbbYWUVtGKS5njGxpUWLulBlDGfCeXukqvXk5cFjZ9fUsaX2G6Wz
 Foogzg42sYtaW/Griho6F1W0wWIcM6K7a7SBGYKvTPIx5zijlfk11PEDm5MWZquHahRenlDQx+y
 fvfZx7wifmzgMNsvm6r19stLmxmgyLB/fnwyYURZuSKvpuF5WX+XrNlr2azVYWkPYPKQueKaoWu
 EIUJDj2gLiYlxM1I5cb7M40wtAHX0LjfAE7+gGbJU8Jq6unzWvqQGHDt5zb+PRsP4wBAXFwMa1P
 FoO/m3dR4n4aVzAjvlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120019

On Wed, Mar 11, 2026 at 04:46:30PM +0200, Abel Vesa wrote:
> These are the bare minimum clock providers needed in order to
> be able to boot to shell and have the rootfs on UFS.
> 
> The multimedia-specific clock providers will come later on.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Changes in v6 (RESEND):
> - No changes. Rebased on next-20260310 so it can be applied cleanly.

If it was rebased because of the conflicts, then it's v7

> - Link to v6: https://patch.msgid.link/20260302-eliza-clocks-v6-0-6f42d8a9d25c@oss.qualcomm.com
> 

-- 
With best wishes
Dmitry
