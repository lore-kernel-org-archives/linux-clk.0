Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C01A27450
	for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 19:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748460104; cv=none; b=UZ2wDK4UQk1zwFPQqnzDdoEm7T2DSdipJMiyxlqk1W6fh3l7bQ3d+/WQ9q+oxvPNABgTel1sTzK1DFactG2Oy44SAx/pfunU5i1mGB2T4r03+gSDRuYYLYNfHLzXFbYj9qpxBhcTXHRcmGpV84MqnG1s2sesrOBtePo7NARwDEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748460104; c=relaxed/simple;
	bh=5YkGN7qiUJaRl3Nx6l2MDDYu/ZprV3VXMY9hifYOnPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=In7D9254XF5Ml09c0d5FPW3rIxVcv+EmiUKWw/AtUVgzfxPW9b5Ql+VXDPE67VsmCTpZ8HWnsoHiJ8a7lQjOfXPxu785FsAoLHlm96Gvk3VwcMnMDSXyJ0sO/syRNXo14rCjBQaMbrpOIUHPv8oeyAntuepCRO9YItMkC2ZiBLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eai61nNI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eai61nNI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SJ4uPT001593
	for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 19:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0gLgWYRWzCLunD/qHvyEBxK0
	5YkGBQTqBuXAxV9jh+0=; b=eai61nNIZrFCYT4XHda5r/y0e/6wLWlVa8+GpSR5
	bnjyvI/XotbJuO1zMciMfrq5n6WPGwC8T2FVPQalr0tpiuKUbz/1JF7nn86sImix
	cxZpwD2P0s/HWQ8cpGxY9nBk55IRPv2khHTxN3UHwWOAaEfmn508RtPtpnuexz9r
	qjM3Bkw+DwnzeTXAjUHTtUOihxFVXg9XJkddSXoEyTQBUvs+p++aXVUfJDZh28+E
	/DlAKUKq3s2/zbzN1fjktNtbcE6bnwnhqfi0JQis+yDNfHyY1LAgECkHZK8bZY2y
	SNHiRxFPfQheoUMZY5o4OTiuSugRbMtKOu/JvFqzb6EIgA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjucrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 19:21:38 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-4e1060d40f4so33534137.0
        for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 12:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748460097; x=1749064897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gLgWYRWzCLunD/qHvyEBxK05YkGBQTqBuXAxV9jh+0=;
        b=duoN5Qel3BPgPczCYBCjh59rXpHLzV5O/TYr/MyJAWPypQwieRgX5b5hAaC25bTlmL
         Zliq9lm9IWRim8nUpzezqELvcrF1IWhG+2W/6xRRGY7+pFuFV+KMlUYkl1C8uVvrHWoU
         lqbKNBXtcEV0jQ8SjKk3P/vuuzxCnFNVFmeEPH2YJsJoh0a5YSRVNtZCz2Cv8FrhsBZK
         OJQkRtFlVVI/HJ3vdzx8aPr9E82PSpHC4FYkRv3ISejHOdsm/3mjRY5NkzqcfoNduE7x
         e6PmenmMnWBn4Dw57EFbeqyMvFNO6jlggTDpaRJn521Ffj6A0iXlVkhFmc3oWdXVHxtD
         p1Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXOPH0P2uPgNdoibOdW4U8uvACXO8RlIjbJQptdzTTr5xI1wnBOl2uo9lMfE7nS6xgOPkarXWIJ5b8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy35uDI2Ecb/1BN7xhXYjKwd3vfz/dpBhV/nJv73gj8pL/cgAhU
	mnnigNOSLOpcewBwBzWPR30fvJGfeq6lKqjlBsoPLlqTyC9gVU05ittpgb/ROaZ5tri/gH8YnOk
	mp8gAf3IgRUqnu9g918RMOa2rqG7LI7zfPMn531oD5QL0p0/e9VuU3SeDsVwKCqFmytOeyz0=
X-Gm-Gg: ASbGncsh0ZB+cLZ3T7+lNGzCGTsN9WwqqJmBJKrpbi8vbzXVZRN3T0hLM0i5+hZPkkh
	KuMq4q/SqrFkUvW/ZEZRNGMoCW8HXivV5SW3s8pKB8bD2nK+j0F+WQqIH8m6qTh7lYxHnVkkia0
	KVre6VsIOVk3HQM5/iSUTj7aExVzYyhZFx2o1NA53eO1iGR2EPV27bINEmgns2kyIoks4ifEsA7
	mjmakYvukZ3jqpmKPL1+MZ3umvWdbb9FAqiDpo0xuPX1b+I4fNSgTg9PiHgTDzib6iI+/lib40K
	1DLbiBufturiGFrLFPcEZOh8EF43qsK/9rW1h57sZeSc9BtZqkQz+2zlw1GdUK+1M7hRKhEPhpg
	=
X-Received: by 2002:a05:6102:3c83:b0:4e2:bac8:75dc with SMTP id ada2fe7eead31-4e424107ac5mr16096185137.15.1748460097036;
        Wed, 28 May 2025 12:21:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERFOoB32HSD5K8ZYFJWnW5A8/+hLXTTrO7fhdopo43CCwU6vsapvR8yzcxq2z2wgo+mX8xeA==
X-Received: by 2002:a05:6102:3c83:b0:4e2:bac8:75dc with SMTP id ada2fe7eead31-4e424107ac5mr16096164137.15.1748460096733;
        Wed, 28 May 2025 12:21:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f6a6276sm404321e87.207.2025.05.28.12.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:21:35 -0700 (PDT)
Date: Wed, 28 May 2025 22:21:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, Georgi Djakov <djakov@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 2/4] mailbox: qcom-apcs-ipc: Assign OF node to clock
 controller child device
Message-ID: <m6nprxug75aifcw6scqpnlx5664zk44neo7v6w6trxfmoe76b7@kt6v5vrdeadm>
References: <20250506-qcom-apcs-mailbox-cc-v1-0-b54dddb150a5@linaro.org>
 <20250506-qcom-apcs-mailbox-cc-v1-2-b54dddb150a5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-qcom-apcs-mailbox-cc-v1-2-b54dddb150a5@linaro.org>
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=68376242 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=oeMlsxxNoTt8-AEUPKgA:9
 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: qH34URpdmIyuCyUGyKoMySzQ7ZVop8Fw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE2OCBTYWx0ZWRfX1PI2PkMu+kIh
 6+8LVWNcfHprJplB5FveE37wxR7kGn8nmv0yCrvBCzeREIC8lytwsUjv05FHF5eJYcKG5OQgUoP
 f11btYyqIlK99suPqpGPz6X+ogh+0sBGHyk3W9HYLTJLXE41bcA7av3wpOVfM56el1fYnX6uxvK
 xjI6Ewydd+iiKEsbsQPSGmwDR/QzVU4x3a6AlzokANDLsbSvg+60/3Hy0gTnTXXnZw1JBE/4ikg
 m0leDxsy5a32LbB9n0M2tuComv89TnP77IT6eyqIPH1fgNZZ4VujnN/tThj3+5qKzdzhbvwm5oy
 uwemOgDxbaiVeBJY8Pp+Sgl7heveFsKcG/Jo9su1Zhg6S5IcK4MJkBHRz8eDXx1WOO8fUUNuGgr
 rPQzIHRAJDBemM8+nlDxzC/nfyCWC+LR+FhZwqNg+3nZbEM90t9fgMqReGlboY8GCrgp4hZI
X-Proofpoint-GUID: qH34URpdmIyuCyUGyKoMySzQ7ZVop8Fw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_09,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280168

On Tue, May 06, 2025 at 03:10:09PM +0200, Stephan Gerhold wrote:
> Currently, the child device for the clock controller inside the APCS block
> is created without any OF node assigned, so the drivers need to rely on the
> parent device for obtaining any resources.
> 
> Add support for defining the clock controller inside a "clock-controller"
> subnode to break up circular dependencies between the mailbox and required
> parent clocks of the clock controller. For backwards compatibility, if the
> subnode is not defined, reuse the OF node from the parent device.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
