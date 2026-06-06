Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E1B38D3E5
	for <linux-clk@vger.kernel.org>; Sat,  6 Jun 2026 11:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780745499; cv=none; b=FvlYkDXazAG1UJUO9swmsG3SJ9O81hLI084iHo281Zw5AzoWRfiTfBOX/T4sVxFK6Fx3BQV8+lqUpVepoSC60o6RLTcTc1wofREvJj6rTNe/nTyKbPcaPd64O1aXgprSwdINpxpyAbredgfCF9EmMROXPiHbpWTKP/+eFgLxBMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780745499; c=relaxed/simple;
	bh=aT8eOo0oxEu8CziWg3ScWwepp+rHcL5Krv4dBvdnM0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iqbE7qnaaMX/zbHqe0WDQwpQ1sJhySsm6d5ud4o6CfMfl4GWQ1CSdRL1UaJE4pOjoxl8enqUgnXj/r8AjNJY4rsUv7N8tHFQNIeQBYjF/VO0NaSWDVcaNIXLa+/QfCo9xa4MqE5KISyA1wyW92vEqGhZ2ETim2BxCiOZPFDRxio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izXU77Rv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kGtW9KDa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izXU77Rv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kGtW9KDa"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BDvqH1330963
	for <linux-clk@vger.kernel.org>; Sat, 6 Jun 2026 11:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nV0WGJYJDrl6fP2+qV8UtMKe
	e2Fm8LZB0V38Lw8sBJY=; b=izXU77RvDT/hlcf6urCt7Ce2LjK7MzKvxWxq0xiX
	+uYrmvgeE/iRtSj47qzFz/mPyk0JpRJSeCzp2mg10XeZolnDnudH1Aj54zwD9QX7
	83/MOC5jYglr9rlorFfltPBKe+eVAODZ1GvbrPbFXDVojz27FGKAacQcDZxH4NvH
	5pg2SpjHMqlHOQYNUBAJGarP29tYvh4dmxudqJQmcrrV8n/yT8P90Wq2+2NbUX3v
	5E6GsOIDhVokhqiliTnXbfF2vA4h5/BjHueNVPuxKiv8cEtD5w4oilBptneaek6q
	ZJkUIXg9n2Runcq2G5y0FVG+cE5PrXYjm+FHfu9YUar7bw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98csf8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 06 Jun 2026 11:31:37 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6ee0bfb5681so3391940137.0
        for <linux-clk@vger.kernel.org>; Sat, 06 Jun 2026 04:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780745496; x=1781350296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nV0WGJYJDrl6fP2+qV8UtMKee2Fm8LZB0V38Lw8sBJY=;
        b=kGtW9KDajnqCgmAoc3DeGiBN4po6vY2WmytM3u9h72+K+F66zlw1jXOaL65QY1/GeD
         pUExkhpzwgG8Z+kcemXL5nuUWk3ntNem4D6H/+YyUGtSDBilLX4fBXskljzarSiIqoW/
         m75k4ymcXOaQpzp7ZyTPCJhqLJAztwLTG6Wj8S3nHEjBG3VwkNoJCNq+L/O1ra0QWn3t
         FRSsP0IhJkzpMOgWmG1oPa66jdQmyjZZLu8b1Ps1izlrdsG4FSRN3dolf2IkpzvBJk0y
         Y4wZ6DcNcboN7tAOmANFzoiM1IIKUymsYmvP66ylv5t8wlHB6Xs36JvefCU48uZ/Vl77
         h87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780745496; x=1781350296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nV0WGJYJDrl6fP2+qV8UtMKee2Fm8LZB0V38Lw8sBJY=;
        b=jaQCSZixmsY7iPPYFIegQTUp7wCy0lXedE7ZCkIPuE1CB7M1EJiViBgAim7HDvEr36
         ZGbJNOw8ddFnK+GpA5Y8ldunXFNA0iECs6TQPXa0rVeMOc46ZH71tUuDtR0l+KckaHuq
         zcN/dxreJBgGlNR8sT96ELg3F/qlDQUrqXtSmisu7BP/L0rJYbPiEH4rUM8w/ws3zxdD
         h+tiueJ50qkRKGBUXr9e8OXElJREcbk0aEKmLMZQdpPBnDlZGzhSlSM5MM5gDey758v4
         s4/E6Pdssq9SfkTvRnwzeI2x7/O3YpqBI2vTzu/HnBy1QO+e4Q1VHUWM87ZNmEUfTd1k
         0gPw==
X-Forwarded-Encrypted: i=1; AFNElJ+9xqWxmGn7zEWlHVuarcMPKdmia3X0fnaqOuIQGCyVocwX+alUFdWgpjEFDcJfOb/XrsbMHUOUP/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YynoSOB/dBSvcAztnTPs9djifoNHhB7bIntrGqVTssUGf3In4nA
	T+m2KPC6rIY1zKykRLHtDsShpaKdA1MYL7qSRdDlRp+xHUIsUX0x2DRBnq8qjJCLAph8UL32sLc
	QDinoS9iiKXiONyIohJaRsR0xSE9fe0qn96Pmukp184L5oFnKHkr1uwBrDWV6GVo=
X-Gm-Gg: Acq92OFrp7N4RLMjBkApazqYa5dTC/U3NNHznmaUvaxtg/yArxGcChttGmbcY356V5z
	pUDjeXJ6fdObINGKIia6Fu3OrfGFBxdnrf9imnkJLaHF7suHzGiSqt28/RzLMfJhRrBWZorURDA
	SoNvoJjPG2tYSe1sCtGgydcLGaw9/BKO5hyqkKRTCQuKi08Ou8VHnDLQ4/tylQVZEFRge1CoIy4
	NNmM123Xf5EnKZiir36zaHXiiHvzQBs2nHR3wyfAqkB+IABuB76OYSgwHE0oDUJ9qUkA4HIbab5
	0IHAZN3RqznUCIW40b+1WbzzuKHotMlvr98JF8E2HEOnEPvcFLJ1/zlZv0518JHoCgYvQilZajM
	VJzKRMjHdJ58Qss4i6Hrcc+VAiLD3G0+flnEfWgC9kcf6y1KaDx7NPoOletpoUs/SggVT9znURQ
	22SEfgnpKBiIS8jxpjwAB+LQ4UbNQkYBlFMkeE8kV6a1POgg==
X-Received: by 2002:a05:6102:c47:b0:639:4bb7:c916 with SMTP id ada2fe7eead31-6feecfb6b46mr4044632137.3.1780745496481;
        Sat, 06 Jun 2026 04:31:36 -0700 (PDT)
X-Received: by 2002:a05:6102:c47:b0:639:4bb7:c916 with SMTP id ada2fe7eead31-6feecfb6b46mr4044622137.3.1780745496140;
        Sat, 06 Jun 2026 04:31:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99cd4asm2401374e87.83.2026.06.06.04.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:31:35 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:31:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/13] clk: qcom: gpucc-qcm2290: Update GDSC *wait_val
 values and flags
Message-ID: <xcujjo7qdgoupayq5zrddl7gii7s2ljhunvav2jjzynykg7za4@ifykyjburvea>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-10-8204f1029311@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-10-8204f1029311@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExNCBTYWx0ZWRfXwKQrKmtCuvgt
 ReeE/xIyU8CF1pdaQLCTrNBmjOAygcRtDGDnH164R3VRt74MPugmpZp5gYRKsCNBpEAK6ac9kQh
 2poVBdOpCBrbjoUmJQWfP8qLYoLlxx5/9vjfJFxtohHfTO4KyptK5T35/jJ2Y8TEVZvOYyxzstm
 iRKOGKIfYSsYHFU1e0GJyKnGKKe/WExhokGp4/QhcP+NtKpIEwpXICIjWvtvl1AXpLw2HfXMGP7
 N1mLEaB3V9m2gYRKYA8dQOskweEGDvGVF4fIeqe0xvLk9/o0IvLoLlzJxtxKg1qPGLd9TYNosMv
 qPgzqgBRXxuOZJ0UOnf0rtcXK2kIZ1llwxllLHyoUYT90YCY9iqCCQijA/rax8mqCmKJjlGMlLN
 EGOAdsRYSFD0WdI4aCXQvP+kO4RgaTvB4dsfJqvOs+tnQ7vSBS0vq+OacIUolkOE49yUNtG0ySP
 vI7u2260UdN11K5yKdA==
X-Proofpoint-ORIG-GUID: gCkBywcJcG0ASmD9kPEP1-pqoZOsCmUG
X-Proofpoint-GUID: gCkBywcJcG0ASmD9kPEP1-pqoZOsCmUG
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a240519 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Wcw2DPdNTWUl35SL3yYA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060114

On Thu, Jun 04, 2026 at 10:56:16AM +0530, Imran Shaik wrote:
> Update the QCM2290 GPUCC GDSC wait_val fields to match the hardware default
> values. Incorrect settings can cause the GDSC FSM to stuck, leading to
> power on/off failures. And update the GPUCC GDSC flags to retain the
> registers, and poll for the CFG GDSCR as applicable.

Separate commits, explanations, justification, etc. E.g. why are the
flags being set only to the one of the GDSCs?

> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gpucc-qcm2290.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry
