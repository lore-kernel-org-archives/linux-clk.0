Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9653C2D0C64
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 15:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784559615; cv=none; b=o9ApZL+T6Sti1QWBDacskRbEOgzD3LI5SzVn8uZ4MaZxMOb3qSSKsKr09j/6KEHCKnjXbtCs2NzhNL/a8WahKxGpZ+DX+eMUes/sajoH1KVE9ub9GxQb7wDAIAWdPH78DT8Xl5arhGcnUF9IZC9F5Cliy++ynCTJlXdrohYFXyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784559615; c=relaxed/simple;
	bh=EVYrPKkGXvUwdIEUFtq4wH5pabs+KuX5q7msTfB26Dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTUj4Z+WqXMKoANmWJVw0BT+7ehX84qb3BTit5cqVzPf2Er6z31H3F05hqs0Wm7EXL4RkBz1krT19ahES6NhHuOzzWbMJSk6HTmu/Z5V15OOpszHeizP1EZrol4/tN28/MHzWBfTxAqv+6VxFPe0hD2cNckCeZdiaJcM6aEg47E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ovEdLrq3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TOSODLI4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ovEdLrq3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TOSODLI4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDqups2852702
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 15:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AAans1b5mK/eA1hGqY2nPGLW
	poCtMEiP9l/HzJL2d0c=; b=ovEdLrq3Pdr4qOMFIuXCZ+MymEvLDESK02HVM1Bv
	kB6NmUi0FDAeddbCQMSnUL+sGEGNQghCJBoSeTHb0EVq8gNGCSGRJ9StwfdE82Gm
	BZnXnAVLCT0EdD7MiOajOBEggBV2vqkO4W80ysERVBtF4UuG05ncC/kLga1RCESu
	S4hosCCxBDWV8hqDjHAkwiwmxbObAEmJvEPMUJxYsUZxy7guj11kD38e3ew8aPvx
	2x29G9iBFGKj1HQoK77Erc5A2rxfPkZtuAct1/ilsxirTaOcMWcNchGnrlPga3zZ
	Z903bu9DjPkSJ69AoDByTolJDj7CikqYWzpxU1qXmHxFxA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhhgys8jx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 15:00:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-520a00c7a03so104113011cf.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 08:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784559611; x=1785164411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AAans1b5mK/eA1hGqY2nPGLWpoCtMEiP9l/HzJL2d0c=;
        b=TOSODLI4reqivp7APuoGCnT+g7DBUP1gapMyUw1CGv2EZsevCyTztslLTjavSdOrld
         pUg0ibNUTNAqkDMYdaq3R8k9WYzVQyXdOknwtEtX6Y5D1j6NkrKQb90J044k8DJMwwjR
         wzLKo7ePPsSN8N1HRC+bBHAiWaI937AeCKHcmV09jRwH5WedhtRoJ4kDYflXUa9MWwQb
         kag/YysDFXvyn+0c+QtgnARW8RcHN6jzPs0pRl/XJgyPTdoL32s0cazJWP/MatZMUE7q
         nU+phdu7Ds9FyNhDf8aI+/SJbpkrub96EaV09G+cWWkTtCofbuvV1+bpLGlwcmlbaYE4
         fQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784559612; x=1785164412;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AAans1b5mK/eA1hGqY2nPGLWpoCtMEiP9l/HzJL2d0c=;
        b=XDIkGQC1CU6osAuRfJikTc0T4Wbc8r4FiXlxhzSUlsDXUDeJwL5OnPRRoxbEZrmEuO
         qz0Re3W3h6203H+rVUjfJo0KvIG8KtZyh92Y/j56rT9Uqw2VMz1jqhpfeeU7h+wf6Z2u
         FV0/9IXKVPankd0xa8qVY099/GLejuYMddhbqGHLGsjbdyV4Vw546oYgEwqQ8aJmZVXj
         e0hm9d53hdVIyiAfuHQjcC9KPoR7nfnqUInEVqO6jfJfh64aLb4FuSQAAQllKlVnoofU
         Gxkt6szjt5k7nFNVPwAuHjGR46sKIK7TPgjELotdWdArRq5lDBj3CwuKtkvNn4upIiek
         Q9HQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqej3+iHrnYAEgZWSsJBLnRYwpEKb/7iysW+URg2lQUDZMatrQYOkqgopDR+TbSOIQah0fGson6s4s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlsyIdRlmVJhySb2/lHVECu/c6CsAByKWbYy5GzOQV8WP14/Bl
	iRLhM9zTbY+dHXRECVSDPGDx5OlQVCwvx/oBYQSe4eu4jpiUFXrsLWsb7weIvygfzcFQhPebmN8
	glTLUOqCPszmwCt3vlTE/nL4qXfdYfRPX7/Ow7Uv1ECCE4LoCsWap5r9IS28NWbs=
X-Gm-Gg: AfdE7ckoW3UrGK9us+NDaQWNpg8dH/0Q0Wj0ALlXDphFo7R5frOB99jMp4n1KnZ1rRB
	2Ze/UlzOYXFbp3lemAeZNFYo1Ao6lsaVijkOql3/6j7VZ2HtMESMn8+xQvVs6R63vA3WwrZ1d2u
	EBxRGqQcrmVks/N3d76bge7fNHW/zRHepOF+cr1WUlWZs30WeV/uBWfvaQT5+DkyJtuctx48Be0
	0GLJEN2pr03bkH63oCEEfyGmReEQ1mxuhHsyAOsItCGr3da/1Vg591+RcrllZI3w0c2EsPAwwRJ
	OvLMeWVw9h1fX40XqdlcB3Bxu+KyWqajsh6hhaK1IF78PKbGXnLXbPlRN94lDP5sEcStRkFwfrz
	qjlLJVsu+gii/J9+Kh6Xrox/RTCMVoxzUO4JZg74wzL95s6yAfTECqZZVjlO73igBYs/uB3MOXi
	OhY/EaoyzDBotiog==
X-Received: by 2002:ac8:7d56:0:b0:51c:bc76:dae0 with SMTP id d75a77b69052e-5213e886d34mr137630001cf.57.1784559611376;
        Mon, 20 Jul 2026 08:00:11 -0700 (PDT)
X-Received: by 2002:ac8:7d56:0:b0:51c:bc76:dae0 with SMTP id d75a77b69052e-5213e886d34mr137629191cf.57.1784559610729;
        Mon, 20 Jul 2026 08:00:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e18811sm2376560e87.60.2026.07.20.08.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:00:08 -0700 (PDT)
Date: Mon, 20 Jul 2026 18:00:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Val Packett <val@packett.cool>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] Revert "clk: qcom: dispcc-sm8250: Enable parents for
 pixel clocks"
Message-ID: <bjgad2qs6pt2cn5pr353qaelxa3gtpaqfoxjnrwfhwbty4g75f@ngu4ddk5jeyf>
References: <20260701001147.416518-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701001147.416518-1-vladimir.zapolskiy@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2NSBTYWx0ZWRfX02h5D378ex1e
 JdARyBhcK8lAjJh07avx9JVE59J+sZlss+lAEJ4A2xyUVzgX5DhQwnG8FCayhqDfMDmC+DRVV/2
 pQctIjxochfVwCBIQHPeuKOYkaUea9E=
X-Authority-Analysis: v=2.4 cv=LK9WhpW9 c=1 sm=1 tr=0 ts=6a5e37fc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=hD80L64hAAAA:8 a=KKAkSRfTAAAA:8 a=aTNQOr_AIDaXwWVaGe4A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ezeZ49Rj0Xe8z8etHk87qSk_YKOuo6Uk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2NSBTYWx0ZWRfX0m5BhL84WD4u
 3q9e2egPyKOJrHz/Ok54Y+nqe8ylLk4ji1xf0Wn300EPDauinONWLLEg1pZIUGjKoV93i+lECFo
 etE44wHiOLMPZaqTCAetPEvYXXBZuYrSSwO6t/j64FB9Jpz8sLhqmOlDwNqcG44xQiYSQ/79vqY
 NEUT4g5dCeCPefaPtc+Vb+YVhqen26nfAE+GgIBWGS0AL+l6ShezkDNVqpbTtGZHZZ1Owe7xXqy
 +WmB5tSnh0KATYGwA09oAmwafs6TwwWBuDE/4FVhYfz3oYKPqRNKHyvwtC7qGkT2CBIdR9FsD5i
 EIftsg1uwhZbuEylklgQgH96zOoDADqAcnw1FUl6UYusmjMKt0KHJK4CpmxuNnCWlVZAzU97j/D
 yAkDqyICQvAOWJZ/6gr0vo3q0qAPS023XqbdPpsD1LyU0txajnY0spirkORjwl6M+XgyccfeKvG
 Qd3p6ebG1R5Cr6vre5Q==
X-Proofpoint-GUID: ezeZ49Rj0Xe8z8etHk87qSk_YKOuo6Uk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200165

On Wed, Jul 01, 2026 at 03:11:47AM +0300, Vladimir Zapolskiy wrote:
> This reverts commit acf7a91d0b0e9e3ef374944021de62062125b7e4.
> 
> The commit causes quite severe problems in runtime due to the introduced
> cyclic clock dependency:
> 
> * dsi@ae9400 platform device and its probe depends on dispcc clocks,
> * the reverted commit links dispcc clocks enablement to mdss_dsiX_phy clocks,
> * at this stage DSI PHY PLL cannot be locked to complete driver initialization,
>   the parent clocks for DISPCC provided mdss_pclkX clocks can not be enabled.
> 
> On RB5 board with no connected display panel on boot I get this error report:
> 
>   DSI PLL(0) lock failed, status=0x00000000
>   PLL(0) lock failed

Why can't it be locked at this stage? Is it underpowered? Or is the code
trying to lock it on some random, unsupported value?

>   dsi0_phy_pll_out_dsiclk already disabled
>   WARNING: drivers/clk/clk.c:1188 at clk_core_disable+0xa4/0xac, CPU#4: kworker/u32:1/61
>   ...
>   dsi0_phy_pll_out_dsiclk already unprepared
>   WARNING: drivers/clk/clk.c:1047 at clk_core_unprepare+0xe4/0x104, CPU#4: kworker/u32:1/61
>   ...
>   Tainted: [W]=WARN
> 
> The problem has been already reported and discussed before [1], the original
> commit was done for "preventing potential stability issues" reason, and this
> time fixing a potential issue introduced the actual one unfortunately.
> 
> [1] https://lore.kernel.org/linux-arm-msm/2f5b98a4-80a6-4611-9615-ab0202a8c455@samsung.com/
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/dispcc-sm8250.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry
