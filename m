Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392D63B0AE7
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 08:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780908445; cv=none; b=fSlKsKsUgHHcoOMQh++wQmfjYexgAvZOwOSGwdUN2SuzjaDaXwZLdvgo49NV7VLWdx8219BUo5OiV6GWtIZfaDwxHRzT3mAEBIM9sEZSk9b0r95GTfpFmp+7Bobx51l2QiWlc+F8LAESgy+iOrjPugrMtYlpwtUDT7Ss8AElBkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780908445; c=relaxed/simple;
	bh=6xNCPJlDGmDF9Xp6ttUWKlED/iCUdRMCN83uMzmYsz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u7QjIgW1OV8xC4uuXHtwvLPHRz2jcv5bVbKxLUGPwPaN1mpWqzkl/29obakm1oRRTemZRllp2qsWTGT/l3PktlHuU9SMNABT4TIW51F3zK5qAv72ig7XtF5O46iYik5SRkxOzwO0uwErwGoFX6+QK0IfghOh992CNyl1QZKbiLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KhLLirOn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TK5iPseB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhLLirOn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TK5iPseB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Ot9o2384520
	for <linux-clk@vger.kernel.org>; Mon, 8 Jun 2026 08:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I5c1IdhnDyBdLWOxAQ9HMrfbElKxjABUy9YPSRIBmho=; b=KhLLirOn2lfldufB
	NNINJFSUqjyC4IvyV4oCXa9OQbXHnUzcTKC2WRyYS45IIDvR6bktexaJjFm19imd
	XlMQG4M5UBUK+75Rft7R9YA9N/79QGxKfZjjHFZpkKbcnkSoePnGRgBsEfd9hw5W
	9FucQ4TetdCF2ewkp/EiiJfF0ycB0wpqNUxOEurYBo/Re0M9eMB3AQV55cW4tPXj
	xuM545oayEnhMkhwbOqvWae3hmHghnX+HuOQx/Oh1xmwKkFkXxjrQ56USiL41ItM
	+H8J5E/fOeFCp1FS4VprZbWYPstz3Ij5TP11aLfuN1dsBuweatYJ4Zba5X4jLF9a
	Kvm0oQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1esh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 08:47:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517796be724so7830431cf.3
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 01:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780908442; x=1781513242; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I5c1IdhnDyBdLWOxAQ9HMrfbElKxjABUy9YPSRIBmho=;
        b=TK5iPseBj1N+vrm/suqSQJH6KXy28OKAt+lK2ymqqceAy8Hwxq4TgGezEReZlsNTin
         JUjQi0P5742qVx5k64EcfpoRUqAzqCPxmCcAbZeEPFVeEdtk+z9G1VYMt8QE8bchE1yA
         S9tlFxARNaHwrNJ/E3M2Urs7QE7RUgVJC3H5cSKkAZvYjaH1dRofcyGIgqjXVPQC9LNW
         xasjJDO+LNWWr0Mday21gsBcou5d8ZLYLXMho2ip+ZFZ24qgxtNYalgVzWslaFtQKtWg
         1nPLDYCo5vOt+iuG6eSRkjb/LsNrKvrdbzTCxq9eo0ko458v9mxFOBk3cRUEo4pvt/+4
         2fjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780908442; x=1781513242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5c1IdhnDyBdLWOxAQ9HMrfbElKxjABUy9YPSRIBmho=;
        b=OysYSZNrXxcoVouHiFY8Ba56Gwtr3hCRHp70RzB1eGD7CeBZkwZnU+BUZ6g1wijivh
         fhcwfVT/UW9uGpncgpcz1oi7XWLQ4ZtLf4kuyDE0PNZUBUttT9gSxnGV9ZHCU+umR0OH
         Oee7HZDwajfVRsUvXu1DdgdauD/Wpr+pvTdVSWW6toNtjjB7je+Ffaa6X+dMwQ03uq0t
         ZaZQC+PIg3GeZjHwmwFM91q5Res6J2w94MprtmeZALMASHet1DCXCmw0kSiezVUv2Ouu
         WXd6WKF0GonjntAfxX1H3S2n/cixIgR7qODX/ba3zT3xwLA+Rm3HDxEgptoEB92PLSfa
         lgyA==
X-Gm-Message-State: AOJu0YzWOv1wUB7qUQQtkM1wbC5ZxoSiCfmkl9JKl+8fZa1aQJREjKdB
	aUE1Rwd5or7vzqylxE6miPBt98HKmIlAKRg7L6kfEoOFwTpTm9NRQzeRJstByocnlXdFzpghGl9
	Bome0FdP20kl2jlGbjULfCb8Bg24I1nYJ/5S9HNeILmQZrO9dsQZVShnip+IgKA4=
X-Gm-Gg: Acq92OF4q6B2qQHQEGa9uiEDH0A+EuEahxgpGZp4prGubOsIxukOIpG8XTp+I6/bQNF
	UeYwuf0j7hoVpy94sWan39xzrtrjMsn+b+/1xV08QObTyMGGYSOe6htgiyZ97zurXQ/VKbaDEhs
	bo/1iekYg9NM2g1KjLyt5H2djbPyuve4xa2sOeJL18XRwyY7i8IWWqWAVi+4a2arwHU//Kd8IWC
	brzaEdFm7fb8j9wHJr0DYAZzL+RKRvH2oQenM85Ds84GFJioN/YkeO1MOm7nCIM6qrXvuVO1fJo
	E3Uyq8uuft9LeSOMhmulz8nRoGx05LomNlaZtHo4RQrrgn0inlqiRPaJRDiu82G/turhtEIbL6h
	YiFh7qY8rr/7IEGVO9z+I2DWVOqpf+Drh6exA0F+NIcq+Gm4hII+8iDi1
X-Received: by 2002:a05:622a:1809:b0:516:cae0:c6e9 with SMTP id d75a77b69052e-51795958520mr129035921cf.0.1780908442396;
        Mon, 08 Jun 2026 01:47:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1809:b0:516:cae0:c6e9 with SMTP id d75a77b69052e-51795958520mr129035761cf.0.1780908441925;
        Mon, 08 Jun 2026 01:47:21 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64e2c810sm6934134a12.9.2026.06.08.01.47.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 01:47:21 -0700 (PDT)
Message-ID: <f3ee213e-078c-4366-8acf-d86e4c81b6ce@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 10:47:18 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: common: introduce qcom_cc_sync_state()
To: Brian Masney <bmasney@redhat.com>, Saravana Kannan
 <saravanak@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
 <20260603-clk-sync-state-v1-2-457120eed200@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260603-clk-sync-state-v1-2-457120eed200@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4MCBTYWx0ZWRfX7yDeXsA7HwMb
 a5CFaQYBxXI8fY3S1uURXqrOXxhl/aXVBgbdU3hfY7dhVtkHFR+5j6OETrCojsrB+DPhfPTMMwl
 oDEHDnurF3Yn/Z8kZAx/Gwoud1HaPYmvZe3qq/HXgcalyIU9Ec5Fc4icERf/WoGqSO4sUX17ArX
 QYM0KuPL9lIekSZeW11VgPHfeVITWUtUCPSuMhIlHk6w4QNTJ4ahnXNivVqw0e5ZJJmkAvz4Fm4
 +iq/sWwvkEELw1YW9pfHyLdarcRyTrVOgRegd5mZUjsPqERRp3oNDUXHhE+9+UZR+COSOwDHiYu
 DpSk8tNGVRwcjfemky5bPZcEQ08Avo+TzbvKukyvN7v9vnrcbFPZyjr18oRtklip77PBAcw3xFc
 xzfbNACgeUEZCfHMSESJMeYKKVQxlFkFjmy8gJqwQsDJ0txHV1uA5f0ozucEXdro7FEc5eqTQHX
 sSw6WU8dGpcY3cltmCQ==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a26819b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=20KFwNOVAAAA:8 a=0rD7byl_W-EYyDmgqW0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 3VJ1AXLv39TOd8gKiSfQjojWmK0d36Xi
X-Proofpoint-GUID: 3VJ1AXLv39TOd8gKiSfQjojWmK0d36Xi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080080

On 6/3/26 4:21 PM, Brian Masney wrote:
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
> +	clk_sync_state(dev);
> +}

Do we expect more things to appear here? Currently it's only the qcom
clock controllers that use icc_sync_state, but I wouldn't be surprised
if that list grew

OTOH, as Dmitry suggested, we may need to check some of the
driver-specific data..

Konrad
