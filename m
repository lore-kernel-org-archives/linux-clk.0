Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BDB2874ED
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 13:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841611; cv=none; b=KhwCllnO+O19nMnvsaeFrZ5bJmamgFu0Ejcy2RSoYP6nxbRZ9fvP4XPvotGD4pvok4CFX4LvntlVjdk5Z6JLioloRF9QW9s9kIDLFi9p+xlXzAkUjOXz6DHdX7jk0Nk7z1EG/7Zr7MmJi3M5HwmA5AwZab52W7zwocHMx8zrAl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841611; c=relaxed/simple;
	bh=sm7GjfEX5XQyMLkWOaLdD8o5qur9TwiNeNmhiSPCJNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/l/cZupqy/lSdHaMw12uF9w2eKFGOZwJqHv1n9ZguwhqVz3S8kitIJDut0sNWJpgbp5guCYzDhb6mDgekAhsj1UgXt3LNQhsSNkWaw4eKuM7WAXwPDpGVFU0vev/VmTypptKQkpYEq7drO9QWPlw6Oqg2n4Lf+rBrUqhUXdRjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZPvCaOLF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwItATNO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZPvCaOLF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZwItATNO"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9MvaT3358523
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 13:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IDSFjTcjEjfACG8rvUFFH5ed
	RHFF8AGGlL7KJH7J7Qs=; b=ZPvCaOLF4tS2u01PZpSEEN5nmtUMq6uyXViQWeV7
	IlE0iPZulEefe30jSEORchIC8vV45LK8lxttFgxkbdJJi/b71E6fbrTLiyo4S/2o
	tQzGsSvORk4kqoOTKNG5KfkiCyjTnCIp6w8tlkApbRCrOuRXw9pnhpcQ9osinX/c
	jCG6cvQcER7GESq4eHg4v66K0GBlyKrdULYyJatLE5W14lQSgq7pt8fBashEoh7h
	UQxYDj+eoqvAOhPcdOvg/1m2LgCdMIqD4POAwTLM7pfFcZYNtBzLMHlUGGbrp5vF
	hEv+Pl6mICA5WDCZa8QAe1NThDdC+K9o+xNUqi+GBv9HZg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyscb0xwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 13:46:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50923a9bec8so20382351cf.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 06:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773841608; x=1774446408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IDSFjTcjEjfACG8rvUFFH5edRHFF8AGGlL7KJH7J7Qs=;
        b=ZwItATNOEPchWE9TPwa6mBo+YRCpIGSUkU02uGLwreDtZqYNUW1L+XJbBk85t4IWFZ
         2FvY300uY6dGIkKjtzulg56BJ2ziW8aon9JqLZSv2b6tdODbo38/oYDmttTIKBZQZ+Cr
         FCBXL8pagvtdx5iZ3XdqRvPfEqmfDRNzfn01ZcecurPU2lqpuqdi9xAAU9IxtrhWYKR7
         TFGduQ4OzpMs7eP9qKaFyDEchDx5picEiWstv07ZTvWAxLph+1Drj6IPSHqoaMaw7Gkx
         0CHiy1fr6YW7Wtjd1wBs70Z/qwEBLxj7FDoOKtheYpWvuV69esZNPNaf/YQumKsx+Uwq
         kvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841608; x=1774446408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IDSFjTcjEjfACG8rvUFFH5edRHFF8AGGlL7KJH7J7Qs=;
        b=ccVjdiz0LZdvDJ0TCv2zMoWyLdtsht7qLu7gq/+2984I4T75pWty2QrUwPxtEOVuGs
         Z9OThmGVxsFdl0gRqnW3g+8A2dHVI1QD1DAeeSSM9NQtWTgEsLnvXWS0iShawOwsE78N
         nYOCi3Gik8uVvew/+2HeBYY+9PY7VJF+Ug+HZx1vSjuhv7vAg42B1gZ5R3Pcx8Ih2Wf4
         9eWMOofwRToO9E4ov1xfL6Xy3Rws9twY8uzYMRh4kLs0ZH64cF4XMl2feu02m0rnRg8R
         G/0oVN/dXmLra4JgIB/EXHybgt/jLojEDjG4Lv7s6hND01+l4IdsvoRXXrVLcaZCbrGy
         NMaw==
X-Forwarded-Encrypted: i=1; AJvYcCXO151gDnTCXbZ8FXZckYoQ2sznXii4HOn5I+Zbe4AxJd3Cq4IbfEDQOGAinqbR/Hg8iliSm0LMWBY=@vger.kernel.org
X-Gm-Message-State: AOJu0YydxoH/fyn/kTqhInGTy72/r2R582BLUI3hrwr4SsAtE3qPR5OP
	o/DOTLa+blFwk1O9W0O1HZSbZQQLghXylunin3tuf2Ysz0SDAPRqkXZ/C0QPR+4CZxI5fnYUu1C
	cXvBZSSr/YY/kRVy8pKO9aPjKxEX/GBbyu++YUibMb7uPNZlvHxBsYOhRGFmhITk=
X-Gm-Gg: ATEYQzyY84N5WHIxVHIJH4quIyXWht6mA/toq3gXEUvDgOan5aN1QtOZ3oHUH6RGIpI
	VBu2XRSo17nC5rn/ptpcnOs1Jo7e/NwbChFalmKwk8HSL60iYZxm/6+BllY/IKx6C+mOODgy7Qx
	KQRiquXbA1xvt7ENnjTU/98qgaZ3JvM1DdWPz5i0Iuqpgxkddo8weq3rj94GrGgzxpsQTYsZU84
	qAWRYpUiJMRKByNNrsbHAhXvShaXG1lnqM96rEqXXM2ysNkwrlrzhNbfaVoCXNnMNYbwgrTgpR4
	cyYABLPVXVoImQb+bnb5bIGV1tsGLXIc7ROSKBAeLTa/LJCINBtQjmCLuhT/ZVtRaFKaM5SVOQR
	OvbrJCEB4/ZXli6trxg+mmXkpGHvoHR653VhRhGsb0gN6az3Rw5eBEB+GjOJMda8+V2E9Rwo7oC
	zH8BTv9ySgNou201iyxdWmr/44SnTCGjyTBOM=
X-Received: by 2002:ac8:5a82:0:b0:509:1ef7:dd90 with SMTP id d75a77b69052e-50b14743c53mr41534611cf.12.1773841607952;
        Wed, 18 Mar 2026 06:46:47 -0700 (PDT)
X-Received: by 2002:ac8:5a82:0:b0:509:1ef7:dd90 with SMTP id d75a77b69052e-50b14743c53mr41534181cf.12.1773841607384;
        Wed, 18 Mar 2026 06:46:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd5157108sm6168061fa.1.2026.03.18.06.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 06:46:46 -0700 (PDT)
Date: Wed, 18 Mar 2026 15:46:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] clk: qcom: dispcc-eliza: Add Eliza display clock
 controller support
Message-ID: <xofpfzgcsmjhprnnffqrwbauisbsctg7bedtri2vxtxk5zowz4@rjlmceevwesg>
References: <20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com>
 <20260318-clk-qcom-dispcc-eliza-v2-2-8c05581168d1@oss.qualcomm.com>
 <1a00582d-66d6-4325-aafd-156cfacee8cd@oss.qualcomm.com>
 <d2975a1a-04bb-4026-a0cd-34571f99ae02@oss.qualcomm.com>
 <2227a9d2-fb34-4d54-8122-c00f54009de1@oss.qualcomm.com>
 <846ae47c-8e0e-4fdb-899d-de679d013fa5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <846ae47c-8e0e-4fdb-899d-de679d013fa5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: m6V7Ds29GQXEGMxa4YZ5WvraZUTM8LBD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExNyBTYWx0ZWRfXwlV9HlrifeFN
 lIEMInXAR7hU4tFxjcpfv91JG+AaBs9moG+oxdR2BCprb7LdO+uXbybVBhSxrx5RsH949laljSE
 SZpWS2Ka0wnW8dffJbY425mxGEPmR68p9ASeSoR+oh/dRXYOdHYZe2ltBGVF263KM9ZQfTGcp57
 ee5liS7x6ta59H9P+0os/yiOqKNjbn1pzqfavzS1n61fCXngDYYhlMSbSuOvUqd+YLCmnwmead2
 IiZTshJN/KxSGigLGy9xFhTzr6jo7eGXEDi8coHjYjySg6BDrWUW7xIzvWrU20UH1roc0A6nPh2
 8PXPe8NMxQUyyoMbuo4KnEZmFppyWr8sT9vm2XcQdymRc6Gui6fWc6agJ9HnwRd9tX1QFrpZeIq
 h+jSvq2j/8jplnzuGewgWsOoGcSftQwBGBjfY9zUdpW1U6JQq5xvw3ye3mNnJwKQNMO++lVAj7X
 HdST3Dxfg4Jd9u/hJuQ==
X-Proofpoint-GUID: m6V7Ds29GQXEGMxa4YZ5WvraZUTM8LBD
X-Authority-Analysis: v=2.4 cv=PtCergM3 c=1 sm=1 tr=0 ts=69baacc8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=HmPH9EL2l39KE_PJ_n8A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180117

On Wed, Mar 18, 2026 at 12:36:24PM +0100, Krzysztof Kozlowski wrote:
> On 18/03/2026 12:32, Konrad Dybcio wrote:
> > On 3/18/26 12:13 PM, Krzysztof Kozlowski wrote:
> >> On 18/03/2026 11:48, Konrad Dybcio wrote:
> >>> On 3/18/26 11:39 AM, Krzysztof Kozlowski wrote:
> >>>> Add a driver for the display clock controller on Qualcomm Eliza SoC,
> >>>> which is copied from SM8750 driver plus changes:
> >>>>
> >>>> 1. Additional DT_HDMI_PHY_PLL_CLK clock input,
> >>>> 2. Eight new HDMI clocks,
> >>>> 3. Different PLLs (lucid and pongo).
> >>>>
> >>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >>>> ---
> >>>
> >>> [...]
> >>>
> >>>
> >>>> +// SPDX-License-Identifier: GPL-2.0-only
> >>>> +/*
> >>>> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> >>>> + * Copyright (c) 2023-2024, Linaro Ltd.
> >>>> + * Copyright (c) 2024-2025, Qualcomm Innovation Center, Inc. All rights reserved.
> >>>
> >>> -> Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >>
> >> That's the copyright I found in the downstream code I used in few places
> >> here (with modifications) and I am not touching them. I also don't care
> >> about these and I am surprised this keeps popping in community review...
> > 
> > You may not care, but our legal department does..
> 
> And your task as community maintainer is to care about community and
> Linux kernel, not about legal department.
> 
> Legal department can comment here, if they care. You as maintainer have
> rather responsibilities regardless of that legal department.
> 
> Don't bring corpo legal stuff to the community.

Then please follow the internal company guidelines as outlined in the
legal&marketing documents.

JFYI, several other Qualcomm maintainers also enforce use of copyright
headers for Qualcomm-provided patches. Konrad is not unique here.

-- 
With best wishes
Dmitry
