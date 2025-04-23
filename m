Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0565561FFE
	for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 13:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415405; cv=none; b=mNII3upNYbM5kBoOrGCsjqgFQX+JpA864pTECOemudoh/WS4fy+I2x+j3PBRMrQ2F924xDUuKRbXSU4UQW7pHzxJk/srR1lDa3e3tydaVrVzGwd73Vjv2UrDxJxj9NAWhUaPV8JOgw3wIfZHhA7hIB/Bofq2bfl8zGV3IcsTBu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415405; c=relaxed/simple;
	bh=lPJJwHKGCbJcWTOy/W2KqY1hoahEC6Ch3aeOkRUot7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPZlcPhDu8U4qaZMrcxY9b8E6iC2HWsZBiAcATAMyzu9IFBvEEb+8xrjZ7qJtLpeAGaIWfyDO4QdQEQENvUzFO8T6O1OEN2bazgnp0GrPAjasc82+S+L7SdzICdTLhfQCEM0iIZ0WFm54qNmriu8guEgvX/fEsCAVQmccWUEd9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lln9v1Oc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lln9v1Oc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NB2JhH012378
	for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 13:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wj+FtiAGAkQ5P/5zChODPkrm
	ZAMKKPl/2U1Ld2vwF7E=; b=lln9v1Oc1wNdBAOcxgSa0NUOSO3GeARiFX0pWfBT
	TB72Ue87DJnryx3NjX+fkfljwpPeSHEttfHNXIMW0hMXfAWmCQz30Qfnr39qHxoj
	Lsz8T5pDCCM45mCE0VL7jq/tReu41HvWK7/F0k9p7WykLE8P6KYjRbdAbVTBQo7A
	RPpPQOoEZPn1+toa5OKpsOVAoTp02EWXjAQ2jnwOR+1nGzmnsNxXz5/jRHpWaMO6
	ZKUigtfJs+ZRGywq+p3Sl08dmcM8y4u+3rlYlzQjQ99zakY39vFtej73yslL+a4i
	J87Hg6K/1RRqiO4kV189DUnc/+QfgYfnPwl/yelkdOc3Ow==
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1j9u5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 13:36:43 +0000 (GMT)
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85b5878a66cso2052971639f.2
        for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 06:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415402; x=1746020202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wj+FtiAGAkQ5P/5zChODPkrmZAMKKPl/2U1Ld2vwF7E=;
        b=JkLRb4ltGBT0QDw8P320BU8YRfqxHqVsI341o4IFOBRyHBv5ixLG7DcRMvBHFNQNKB
         lG87XLsItALFX77vo8DDYo9is7eVVrpxlH0silJxLg0QJpfgU2aRBWDjFnYuRS9JBOUF
         mXpDT8K0dwcUe8kAXSqg0USggZqMn0eRjS8WJxBhbkBgB11ODZx6+M2wz8o62ZoDGwnD
         9lCM49PKXAYxafyIgia4F9eQoGiHYPmf6Bue7BRAu3Asw9eMGSNsXCF0uq0sjf8wNH3h
         wB/jaxny3PUfXkutgHcap2yUw/wgeThJgu1mPAmR73GWHG56Gphwz9dflONTZOJBCNbG
         GWmg==
X-Forwarded-Encrypted: i=1; AJvYcCUoLD3oDjOq9TPQtn264HafR22YZMIGQyZ0XIbm5WBq7d2cWqKga/iVyQAWBoqNnXNlPjdmxGqwrqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGScO05aMEUm4shrbi2I0+FQw2MFbVv3RvaMjlbfEeuhUmZZ5v
	n/cSMUVwUXq0sdYkGZIj+2kgAtETptKEQOpS1f9d/pv2P9ODuD3yeP8eSDHytGtlNuauvZ+sL+o
	BSGk/smBXR1hybq3npKw3n2BUvnTYAL2/3aranXQUH1DJnepsnXXgWte3cEI=
X-Gm-Gg: ASbGncvd6woVSKgr/fYQKwh1TsNQcs55NaR0x8dtlW3M+ngdRmYh0OkLMoWhiPwt+Id
	LOEwyIH1whnlF2U431ATLLZs1+lzbRAT2ApwiAUS3q+sBk5Ox6LcGLGpE7JA+SbXDDfSq3hvWiD
	PFjrc9ZmZighxK1oonutNLOI0TfO55H169zqEMosSQtV3oxixS9rnpaUho5iD1enuA+p6PTBd+f
	DA/Gj9ftXotfwGESowZNJWjyLaLwS+LqrdDXXZD5pXk7e69OKgQILiUBg3bpKb7bDst/6Y+WNrb
	eSBfqvEq26kFFO7+IgMeH9qEG3CkxJ28x318IWtzx5ONIYKdfanUsUagbeJQpBQxgOKZRIOh428
	=
X-Received: by 2002:a05:6808:6a84:b0:400:fa6b:5dfb with SMTP id 5614622812f47-401c0ca677amr12197835b6e.36.1745415056344;
        Wed, 23 Apr 2025 06:30:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDEi3rdB2ep6R+cK4PHyu/fZwFAeRdF3OHYastR6zA3OEKUX6hMlxowo/Y01S4Kl8W7OZkVg==
X-Received: by 2002:a05:6808:6a84:b0:400:fa6b:5dfb with SMTP id 5614622812f47-401c0ca677amr12197723b6e.36.1745415055890;
        Wed, 23 Apr 2025 06:30:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3109084e434sm18283881fa.104.2025.04.23.06.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:30:54 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:30:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Lee Jones <lee@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
        David Wronek <david@mainlining.org>,
        Jens Reidel <adrian@mainlining.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
        linux-scsi@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-remoteproc@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org,
        linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 28/33] cpufreq: Add SM7150 to cpufreq-dt-platdev blocklist
Message-ID: <pywgehih5yrxbnzyjtufkh52xiuonsjv7wougvbauiw2yd3mpy@imcguzi5f7fm>
References: <20250422213137.80366-1-danila@jiaxyga.com>
 <20250422213137.80366-12-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422213137.80366-12-danila@jiaxyga.com>
X-Proofpoint-GUID: 4UoVdYwXYkVg5dwF6I2jgZTCrTAGfSpf
X-Proofpoint-ORIG-GUID: 4UoVdYwXYkVg5dwF6I2jgZTCrTAGfSpf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NSBTYWx0ZWRfX1fh3Moip7BvH MRLH+Bn+sQAUtq15HuH2DYetMQ5uD9nVKeSKf6mOloausOU4/5t/2A4s3ybiTgAfPSrKEfnCNGt APdKqLs4dCaN5AwfWXhUQcH3nGRpOVOAYFGlQmTYNF9AxP8tTMPj0Nxr0wfZvSbBYv2QXwiwyQD
 M4dURH3znWvvP0maAefwmE3Mer417/GQl/n8LzRz7saIWItd7b9EVmFWfE8sTujn/hDUqbTe7zx N5mw55NTl5yauCaV0FTK5tZDKxRICCueFEsgjU4Wdj2jvQqKCA/kJTAwIcjmNKot7fGX8fDA3Q+ fxtC2yF2q48+tFOemGwPk9RWQw0VCcgfwGKyhxy2skXpGriWmPHh00BPxwOAM4TEzmTcluioy+F
 6WsWRPJJJq31BWpIuO0v4sbuHucd+75y3SO36laBd29q0slwBftenalZSNMb6O+25435gwUN
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=6808eceb cx=c_pps a=uNfGY+tMOExK0qre0aeUgg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=7ibcVnAUAAAA:8 a=EUspDBNiAAAA:8 a=KMkCwTOw-m2sBZ1LepcA:9 a=CjuIK1q_8ugA:10
 a=61Ooq9ZcVZHF1UnRMGoz:22 a=HywIFdX19-EX8Ph82vJO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=622 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230095

On Wed, Apr 23, 2025 at 12:31:32AM +0300, Danila Tikhonov wrote:
> The Qualcomm SM7150 platform uses the qcom-cpufreq-hw driver, so add
> it to the cpufreq-dt-platdev driver's blocklist.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-- 
With best wishes
Dmitry
