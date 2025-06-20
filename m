Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8301E2EBB8D
	for <linux-clk@vger.kernel.org>; Fri, 20 Jun 2025 18:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750443250; cv=none; b=P26foV6UP6DcfWlHzd1e3wiMuq4gHPvzo+cCVUYq9ROQu5uSqy+EtLD537nR1RPptonT902kvHfeVn7V2vW4jvFdoDEopaeDDHxzw+nczGhIyF7jY6eR9SmK5L6oc0XQUJ07wCsY6kB11tuRZzgdNSf6tROLy4FLQ4udeq7WTzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750443250; c=relaxed/simple;
	bh=2K9cIvrmpMhJN+kMq2izfuw7kNE2JXNJ0wD2DCmq1aY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jQjdG5CE5uspdKHCJg8jEwZW9K+Qz32Qn+y++vmy6HSSwKBOAsOWOuJvjmotOC1cVAM3XYMs/+yqM6iMjwpCOdIueHli9Gxxx4iF7zd+1lgJML/xa2jWvpBq0+aGOARIieK1HhXc5eFLlBMo3zmXR6k8+L7+X3HLAbdtHQQymg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nbbZblG7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nbbZblG7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KGVAnu029047
	for <linux-clk@vger.kernel.org>; Fri, 20 Jun 2025 18:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9LhI2Xwe2pXBEvWnMtQOowUyXjOfB/3ScM2SDxNRahE=; b=nbbZblG7kIq7wyu3
	xw+eI9ITeOlHnddSN3xlHIuqi1GvqX9jIW2+o+5cVs3J6MAJTTzQSCP3spNtDM+s
	8mTI3L9kwB0HooUQ/wXwH6f/OgbGjOzmYbfhUw0Nq9YZK/uRV73+OpIHbj6OEgNK
	lyDG4rwz3I3HOEWBOyZYx+GsL/EwsJZZZLSp0SVuUOKDEAEypOZLVVooLySrRSDN
	/Jj4++tOh/OpKZ5CYGxosN3RTyxVURar7wyjs/t33Z9FZosk2MQvZZvejzlqIkXH
	gnxL705oMEaf3muEC16bjRqupwVtCS2waPuh6B6DUQMZd7a17XmHX7tUBajyS/cr
	8/dYfQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47db82g8rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 20 Jun 2025 18:14:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d38f565974so344113285a.1
        for <linux-clk@vger.kernel.org>; Fri, 20 Jun 2025 11:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750443247; x=1751048047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9LhI2Xwe2pXBEvWnMtQOowUyXjOfB/3ScM2SDxNRahE=;
        b=GqI7oBTLFN4zQENuNUoUKOCKsdeS2FnQAKWiVivd8Qhu36CHYz03ItI6qsaLEdNXvF
         5iIiM81J3vsJaPLYXwoRGM8k3yFHfLoqcJC03qb5JTseZjcSi17zCFjxjSxMWWpQuEwi
         93aE31ot5BJ8t6J+txIm7dvU3+k5QZYKnPmn68i1VyCEe/qpOj0dwy5xLSN9jzK1nbkP
         42gA5YVwadIxVgy7vscTYmR7i8fXx867CfTSDOxaEwDn8OFL1nI8B8Vqagp4mzeMocHc
         6m6K7oLBBqsDow5EjVcgQabUyc6iwFerw0IfclGAC8tlLWhcgDrJW2dycBF93k8LWHPM
         eQZg==
X-Forwarded-Encrypted: i=1; AJvYcCVZvrsQ4ad43J7d85/sO53Hu1kxdnn9pipsGwYyw2gMLwaOZfsU0MTfSp+Ds5BPPA0SFNtsjpGerw0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1TKAVn6Br1cPYI7Cj+D3/yZzl2Rh1cLQCpxtZZjPLzAsuzA6g
	P257PuCSgIGR9vKOUOzUQ+yPWoQjESMh+L49GEbw6rzcEy/bD5r3PK4QQHwp+sG6BgSOy6jIKZj
	aQdyueggPgfj8VP4jMuT4QGlODnjiEbzLGc2+3Gtt+f5jgKhb/XXveoxatt1k07k=
X-Gm-Gg: ASbGncsE1pJYiVLmsdihCaUKB7V3aX7yxrsY9X2vhPfEpQC0ccWT3rsgXWQPX7aDaKA
	L0xVTEDBB2QZG4s5WGV+R9G8r+G0Xfqvlf55LEkGXNQgx8QloBbTPycQiE01CF+Z8gtvxlCQJJp
	DMIQLs8j2rqfnJWBSGeX2XmUL7SQwLU3EISzwVi4Ch7+0AIAarMuZgAVwpEyyLWZm7G+so8nzqe
	7CfcvS0hxtgaFGgWYfEOKS5caFEU4puqIptlJumuVAWQ0I8SVMZpXH8ia9i6wZDBY9LGjic1FwY
	KZeByC2cEeSsb7+S29svc5IiFr1TpCS1Rg+OdsxjCRkHSciJEMJW7d4AbvGXULUOpBSgDLNtiAC
	dB4cXLIZuI6FJI4bQ+/8zGV2yDoFU8j/mXj8=
X-Received: by 2002:a05:620a:4115:b0:7d0:9a17:7b93 with SMTP id af79cd13be357-7d3fc06d5f4mr385720485a.25.1750443246588;
        Fri, 20 Jun 2025 11:14:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGF8a5iG3F+DfIN05T64ynCvLmjJR9evM/gfCnKmC2l0p9LUB+rWiOYDNmodaY5O6qyN66eA==
X-Received: by 2002:a05:620a:4115:b0:7d0:9a17:7b93 with SMTP id af79cd13be357-7d3fc06d5f4mr385713285a.25.1750443245901;
        Fri, 20 Jun 2025 11:14:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e4144306sm363384e87.18.2025.06.20.11.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 11:14:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v7 00/13] drm/msm: Add support for SM8750
Date: Fri, 20 Jun 2025 21:13:54 +0300
Message-Id: <175044313808.2014621.17398212116401078001.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
References: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1Nd6ogctnkGahLBhYGUN3ft7F-vl3XWX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyNyBTYWx0ZWRfX4NE12blHyCvc
 RyaQPRiQPuXIkoocFPsTFHgN7ncUChDG14isy1DiKIeZrE6v1MMNCxWg1Y4EClVoCiLUkSqtDQi
 noM07LQGdN2dbnLOvW80WDp9w3Gc4ZaaOYD3hWY/nVgoQdlJBX/2qK9heY7xxckX/EWyg2jBpIL
 /2oygq+VfZdOi7cb/fQC5SN4h1rjj1aIkxvQOsKTboahtHSmEW0Vp7oKbiUiKb+z3hHuKr5ctYg
 3k1BigUzQS/UxlbMMHZ2IwG2mOH3Qm02tf3NEHnMNFToN2u7vf8kP2b6Ch346+HgmB55ytrBAFC
 Vtpvrqu5/poQymchcw9yNanpP05aU9hjszlPe0B3OrZtbWbVrT0VawFS1tauLJ5JXvQy3BodCSb
 ubhWoOPKSjKXSumBea2iOQefrCB6Tm3SnFZm5mbfsdwYN9Nj9VM5tM+u1naXjMshgvrw4UmB
X-Authority-Analysis: v=2.4 cv=RaOQC0tv c=1 sm=1 tr=0 ts=6855a4ef cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=e5mUnYsNAAAA:8 a=edIzf9TL5m76aqoGtVoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 1Nd6ogctnkGahLBhYGUN3ft7F-vl3XWX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200127


On Wed, 18 Jun 2025 16:32:29 +0200, Krzysztof Kozlowski wrote:
> Dependency / Rabased on top of
> ==============================
> https://lore.kernel.org/r/20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com/
> 
> Changes in v7:
> =============
> - Add ack/rb tags
> - Drop unrelated DSI enablement as requested by Dmitry:
>   https://lore.kernel.org/all/fa8d4af9-e822-4dec-a8dc-f3bbf5dd0100@oss.qualcomm.com/
>   These will be sent in separate patchset.
>   Such split allows to have SM8750 patchset fully reviewed, without
>   continuous requests of doing some more fixes in DSI PHY drivers
>   (related and unrelated like 10nm).
> - Link to v6: https://lore.kernel.org/r/20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org
> 
> [...]

Applied, thanks!

[01/13] dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f8976415b669
[02/13] dt-bindings: display/msm: dsi-controller-main: Add SM8750
        https://gitlab.freedesktop.org/lumag/msm/-/commit/65e6647eda4f
[03/13] dt-bindings: display/msm: dp-controller: Add SM8750
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0122acd798ba
[04/13] dt-bindings: display/msm: qcom,sm8650-dpu: Add SM8750
        https://gitlab.freedesktop.org/lumag/msm/-/commit/12c9c014f83b
[05/13] dt-bindings: display/msm: qcom,sm8750-mdss: Add SM8750
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ea982597d19e
[06/13] drm/msm/dsi/phy: Add support for SM8750
        https://gitlab.freedesktop.org/lumag/msm/-/commit/714495a41634
[07/13] drm/msm/dsi: Add support for SM8750
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f4b6ecb62b7f
[08/13] drm/msm/dpu: Add support for SM8750
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9eff92a3ed18
[09/13] drm/msm/dpu: Consistently use u32 instead of uint32_t
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f409019fb4e7
[10/13] drm/msm/dpu: Implement 10-bit color alpha for v12.0 DPU
        https://gitlab.freedesktop.org/lumag/msm/-/commit/dd968c6e3e85
[11/13] drm/msm/dpu: Implement CTL_PIPE_ACTIVE for v12.0 DPU
        https://gitlab.freedesktop.org/lumag/msm/-/commit/82f64dae7f0d
[12/13] drm/msm/dpu: Implement LM crossbar for v12.0 DPU
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d96d8ba9a96b
[13/13] drm/msm/mdss: Add support for SM8750
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0b385dc8d1b2

Best regards,
-- 
With best wishes
Dmitry

