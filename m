Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42691250C06
	for <linux-clk@vger.kernel.org>; Sat,  6 Jun 2026 11:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780744547; cv=none; b=E57Yvo0A26dEK4PFyP/P0guECJ1qjDAJz8VvHqCfSTQlBTLGL4O21Jpld9j+MhljoKrXART7EbqP/uAIjif8/Zv5+A6ow92lJp6s+ZgvkGoFLocQ+cGiL1ToKFM7UtczfRp1cw++1sLYMiuJ5KwKOCVT+4YBfmupQFAqO0wDfzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780744547; c=relaxed/simple;
	bh=35T4RPwZtKj/AACr5jC/VoJ/dH+ywt4DKiJkh67GbEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WwE99v/Lj8xzrlpdMAVvzbCmFzngNDQB9S6ndr3armajiZG6Gv57eEz5lB/dCepU5nbMUxNl77Tyxx1Al7nMXsX9J05KfprQnRwmdF83BBhvhNQKrUZvlDkdjpZic8n7iCT1IxZlgwUw6hs/Z5TwItWPbta/fwXRfVGk3pasOPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DcpkRi+g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gqJiVuvk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DcpkRi+g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gqJiVuvk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65661Qsl665347
	for <linux-clk@vger.kernel.org>; Sat, 6 Jun 2026 11:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rY52lz044eYyFkQnD9+hzUtj
	rn2eYKc4Hi2FnVBYibs=; b=DcpkRi+gJXJapy0wslv31vjpyEXwHfmFUKqAivZf
	SLpclcrQ7pyr2zaHCGLzImnznEy3ipjG1uiI/vjwJChVTpAOt/Lq3gzqt3B9vhBb
	sk+STm1QkGawJ/1TZy3SORBCjvpIYEu37Cz0gjZ8UIyeVn5KG9EmNnQ3X0JrHwjm
	atLbAYNCYU0mdnj5itXTZVTOyost3TswOld7MnS/nfl6v3N44E42kFHCOHlAVQUn
	D4Ao8ehQphWG75DhMTf+9XxRngTVyQiqYwbvqOKbb2zQzsiPs8tj3qsJH/Oh73W5
	pJShzb6EHWue4l3gRZk/Zkzhn0Ue4K+PX3kjOWqjNx3uQg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx68tbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 06 Jun 2026 11:15:44 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6798c46f723so1762235137.1
        for <linux-clk@vger.kernel.org>; Sat, 06 Jun 2026 04:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780744543; x=1781349343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rY52lz044eYyFkQnD9+hzUtjrn2eYKc4Hi2FnVBYibs=;
        b=gqJiVuvk9uA7ZjMvBvjPmiKQzW85f0OxEhyFIkF2NxehkbqB3wYgxULdw5kklRByRm
         uDvsim6w7vRps0CHWz6BWDSH9gXS38rMa7/ICBYaNOexhLXCoQagMbE2PEDxCXRLDaPQ
         hXo3Ab1+jTPYWqyem4opoZeeAYnMqbIQH1i0ByUENSjJBAFptGPJLRCbUOtfhipuH/rf
         zaUr4uFsgCZVluaf/ifs1Egf/QcN9xDvXMg2O+wd0dMat4tCivGqOs2wJBtmBQ+l0LPx
         XEs/+QiS0iviDKGJi81EMKI4hVANvNKNhdyGTk8bTEvHypWb+v+eAHptkWBfLuqHoDID
         7KBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780744543; x=1781349343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rY52lz044eYyFkQnD9+hzUtjrn2eYKc4Hi2FnVBYibs=;
        b=DeNa08gmyBK4Gb8degd5p7z9pp8Moz63VeN4Or/VWNb0dKe/eNr1U/BUstiG5SKwOQ
         isTvIWYPfDK7PJxrzzvc7uPyrPKZyshWWa6vtkan8NbpHUHJG9tf65EUB1wEDwDBLL8m
         oWuE1eLu52EQJOMcqDQfF/YfqFZ0UD+rF3jVmlEjhHxmt2v2WNesQ/ogUSnfiOljVeHQ
         M8YwGT2nX7STmS8LDO7e4+umS0RcT3ZmoLxxTk7wT9mN0hTNbAouwloQaxLtMxIDkJr4
         A7Nd3KOUZBKQE6iLZBlgKvZv8P2fc7BcJYQLnIuN+IGAOEc44B96QnqAozKMxil77SZr
         K8pw==
X-Forwarded-Encrypted: i=1; AFNElJ/pLU0K8BNn6TErPizBh08VVJr+0ov72Q0H8RkUUs45AILJWD46yJg5aacLW/Yj4jJceoTniTRdtK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvzNl1vOU9sAoSfkaKlPBXEunYGeAXX+3l2UEa2WjeZWnqqbKg
	cfZa9K5d7AQh0M206ZJDgbU4vbncx+6M3LVLDlufvrwB0MZEkX9vKLV0cP58hcc4gIal/vAae8i
	ou4C0u2rG4Pi8By8q+uYhLAUHTuQEERwMsLiWD5XvX6+I4OoIsYNN4INuryRvuk0=
X-Gm-Gg: Acq92OEwBDdoOqaj0PgJWPqi9FOkvIxPnBOtjB7hhxarXMTPtGkZotH2zZFhdcYfPtZ
	ELrLLJsSN9X+LqqpPB056Kh4K1qx7ZQzPpw0NnL6LfY0BpfOauyoxS9V8uW9EHDINjFxhziLwbD
	jZO593tVrIlWOKGrCLWFcOtoCNAs1BRPDcqtQmW+GPzOyE3K6k4pisDblwoL2mqnn+g1cVYbyqc
	hentrE9nlxT3m27/LSgiUzoKHmcKHIhfVawrESV1MM8J4BEjxasLWpoFx31Aav8pgYaFWzLaTcM
	DQYFcQ5ZNotUvj2X3Hp6pI8FEeecmfE5TpW95PZXezPT1WVbu9GJxSzn5f3+oB4+aWkcNcIsJX+
	d/rF5SWcpab2DX8z2PAOHU92QA4+CrJelo0N65vA+V5ZlupzC6HJZoa9fATJA5aN7pbFNDCjf2r
	aCajgrlU+bMHDAYgoblaGatF0QIlO7+t2dCEeA5FKDg5/9jA==
X-Received: by 2002:a05:6102:3e27:b0:65a:fcea:5a8 with SMTP id ada2fe7eead31-6fef75ccdf8mr3760608137.3.1780744543592;
        Sat, 06 Jun 2026 04:15:43 -0700 (PDT)
X-Received: by 2002:a05:6102:3e27:b0:65a:fcea:5a8 with SMTP id ada2fe7eead31-6fef75ccdf8mr3760598137.3.1780744543178;
        Sat, 06 Jun 2026 04:15:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b990486sm2354393e87.68.2026.06.06.04.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:15:42 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:15:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: qcom: common: introduce qcom_cc_sync_state()
Message-ID: <xtrvgetj3ybwuceez6mymxw4cwa6sqeycoz2hs2zztozeb4oyb@uuhtzbludmzv>
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
 <20260603-clk-sync-state-v1-2-457120eed200@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-clk-sync-state-v1-2-457120eed200@redhat.com>
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a240160 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=20KFwNOVAAAA:8
 a=jABXd_slnFCNTMqTTkEA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExMCBTYWx0ZWRfX1p2NzRTyk3rX
 HUNnoGJs4mhuoYhIXpW8P/xfEjbZ71C/dp7FAxGLwEtOJaF02ukC51s3n56RceuBwnp4NPJD/NB
 vw85NHdx3jFfx0wasOiTqn/so6HOPTbdOZ+8HLiCNaeIioY++dJg2FuQ07JtfM7OuXrp9X2Swim
 c7aCHqInN5ee3LfmslbS8iJBfjkx3YirrrSnnYHW+7C910hFQrW+z6BwJLDWcahVlSuFyuvmX4d
 2lQrTNcN8S62PLOkMOorVEX1qGc2CivX8Hs6Ypg5L1q2CbOAGmQ8CuSMWjrp/nIu88w0rxn9Mlu
 iBTyzigor7noZABjt64vxdWRp6Ia/6tvrsule/OUf2k5w3ANNH+wgmD8JMlsHYxaoF+6+iL7O9l
 T7jZInHaDw9L6BiPWSktD7Ec8o0sghkKQ/zYTdiYfRp653aY3tHETqyOmAmLKC4NPt64yyIOaij
 kgi8lnZlKc+G0ZP8Jhw==
X-Proofpoint-GUID: qYJ0Dpnyu1CUH4R97ozPrebL_9T_rhBw
X-Proofpoint-ORIG-GUID: qYJ0Dpnyu1CUH4R97ozPrebL_9T_rhBw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060110

On Wed, Jun 03, 2026 at 10:21:47AM -0400, Brian Masney wrote:
> Several qcom clk providers currently have a sync_state helper set to
> icc_sync_state(). With an upcoming change to the clk framework, if
> sync_state is not defined for the device, then the clk framework sets it
> to clk_sync_state().
> 
> Clk providers that require their own sync_state will need to call the
> framework level clk_sync_state(). Let's introduce a new common helper
> qcom_cc_sync_state() that calls icc_sync_state() and clk_sync_state().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/qcom/common.c | 9 +++++++++
>  drivers/clk/qcom/common.h | 1 +
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index eec369d2173b..31382c49c948 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -3,12 +3,14 @@
>   * Copyright (c) 2013-2014, The Linux Foundation. All rights reserved.
>   */
>  
> +#include <linux/clk.h>
>  #include <linux/export.h>
>  #include <linux/module.h>
>  #include <linux/regmap.h>
>  #include <linux/platform_device.h>
>  #include <linux/clk-provider.h>
>  #include <linux/interconnect-clk.h>
> +#include <linux/interconnect-provider.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset-controller.h>
>  #include <linux/of.h>
> @@ -464,5 +466,12 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
>  }
>  EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
>  
> +void qcom_cc_sync_state(struct device *dev)
> +{
> +	icc_sync_state(dev);

Only if desc->icc_hws != 0, otherwise it will mess the interconnect
internals. You might need to set drvdata to desc.

> +	clk_sync_state(dev);
> +}
> +EXPORT_SYMBOL_GPL(qcom_cc_sync_state);
> +
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("QTI Common Clock module");
> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
> index 6f2406f8839e..ee448163b1fc 100644
> --- a/drivers/clk/qcom/common.h
> +++ b/drivers/clk/qcom/common.h
> @@ -88,5 +88,6 @@ extern int qcom_cc_probe(struct platform_device *pdev,
>  			 const struct qcom_cc_desc *desc);
>  extern int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
>  				  const struct qcom_cc_desc *desc);
> +extern void qcom_cc_sync_state(struct device *dev);
>  
>  #endif
> 
> -- 
> 2.54.0
> 

-- 
With best wishes
Dmitry
