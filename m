Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9F3944E
	for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415085; cv=none; b=VtLMBlzN4gVPDcZLZ29Re5+S9lDzwg5ChaXRQPo9xTcFgQ5GfcAk4fDic7CMvGGiOuJ2oRy0kNPmLD66WgKMQVZdxKlkBUHSBamg/TCqvcBX/XlZ9C6Zl/kQwdCbxncRnkDoqN+cltIR9rQD3JwS94WqojwzHeCKWENbKD9O8LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415085; c=relaxed/simple;
	bh=YPWbosimC3qPkFIdP63gOcohPto8jVI/bjwvfdxo1T0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCXqG7+TkJjnegeDze7E3rmng44jyQxO8rEgYt013y3rGD8+k3JOTzdVDbE0xpGW/JZKtecyxkOILKI1FW9h4l2PBy+DDGq1h6iu/kRVmzZ8zs76p7TZugpjTQsxTyS7pMUcoNRQ7BbNRrXpR9WN2qJ4qvMAil8qeDTV4C7dLWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aRFmbBeB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aRFmbBeB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NBEsJM014367
	for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 13:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dZWmP9gM06dWmEKtYYm5mxy3
	nQnWFD6fy7umPVrKHi0=; b=aRFmbBeByAGZvNocZKi/oi6Wq9yS71NB7meeiNC5
	6VkTz4uk1rAlDwQDYkckfe+r/03dNhtgy7dh+2+Iin9RD7qbRHx4v3mwbz8Ow97h
	ejZTDBqmtXWtDK+WEkkHf15QK+jfNOnAAQXhFkEjaaxpfGWCEyay7Mt/FAf72jw0
	F3IeOZ8obV2qKlRVtyVqR5wLUIBRsGu+Q26lSN1UbKtQkAYB9rBL2DwdnrGHAgnc
	hTIHQdArOuO3M5xjZ5odE/21yDszB7JUx3h2mWIQSALFgyWOlqgUKlB804XHgytT
	avZVqKi6iPhVByNXlcHdavlosu/o2JgNgovILUgMNI6MHA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3a81n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 13:31:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c92425a8b1so169423385a.1
        for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 06:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415081; x=1746019881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZWmP9gM06dWmEKtYYm5mxy3nQnWFD6fy7umPVrKHi0=;
        b=MAdYaFUqJ0u2FzoGcACRnH62/tasCAVqBQeX8OvGkBr9hSBAo+AUzoygZoaHIMp9Wo
         r42/vxze7/AhisBcDyT1RkdwxcGFQLUZAkWz5Ml00jWzshg0s3OLLkD/YaKubRNWBWb0
         VqJGRqqxRocifBaVoScr9U+RTibYaV4bpnAQnGFpNzrg1BwnNbXCd5xEmogr37bKgbKt
         yrzSfDujFWUOet/IEhYBb++FRSBhzMWNWkNBHtr+VPKSs2ZDbnCfLkEMduSX6qhB61Fw
         5KzWQQpyetvDkXZpdshF6bNQ6Mze8KB8WgXBhlCfazOVO2AedBKKwq7abP1w05IQT7+3
         eveA==
X-Forwarded-Encrypted: i=1; AJvYcCV7SXiEiXDvCdsuqokQxTkN1fHdMUytmj3B99yvu+s5b2waZiBezzpHOoiluQFA1yzHRgRCSy4PT/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFdQMuRruvdBazwRUfkpc4kAkuZNzHH7zOgr4+AGmExwnoHinv
	BT9mT0lxgZJEv2Zj8ZC49FO5EJS3SENAEMHDrqKmSMQcviuDJDHF4MyQTxcm7ievWL29qGwByA1
	K8/TeKD4XWStP3/lpvZz51GdY24dS+7gppXW/YcVBLUGCNICNgPu+GluntmY=
X-Gm-Gg: ASbGncsQapBE0s/EQJKeiMvhUfc5NpWzBmv9zHrEwrPFMxOp/3dhjFB0uvecM9kU5f1
	9oJsAWZKOAkp9rIZ4e1rYvwZDUTmqOoAUzdYYhoWARXgTKB4bVVUCAnZe4qLGAMo07T5L1Ym+qI
	es9zxhCktpJiPtgaUZfQYdCQ5b5mWeZUkL5AD7fRX2hN0kooe1O4JfLGWVO1LPUw6izSamQj9HX
	oylYE6vudrL8xrKCvWVu6E8RH33mxeE+1uAMzJofzNwoMfUgZ+VTyuI8Hs4GZdpTIoQwnR2ChxW
	zgD0ZEEd0tDo0eplJy2AK8GIPc3AXouHLPTqtXpMerul6folIoqwVZB4fDgak/w90rR3c0hUVAc
	=
X-Received: by 2002:a05:620a:24c5:b0:7c3:dd2d:c0e2 with SMTP id af79cd13be357-7c94d83dee5mr484770085a.13.1745415080689;
        Wed, 23 Apr 2025 06:31:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpfJbI+AgBKtKkvkNrS86sfl4ggqkejOcLK4vPJLKCGSN66njI9kIk5rDo+YJT0RY1DWgIxg==
X-Received: by 2002:a05:620a:24c5:b0:7c3:dd2d:c0e2 with SMTP id af79cd13be357-7c94d83dee5mr484758485a.13.1745415079978;
        Wed, 23 Apr 2025 06:31:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5f61afsm1578477e87.246.2025.04.23.06.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:31:18 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:31:16 +0300
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
Subject: Re: [PATCH 29/33] firmware: qcom: tzmem: disable sm7150 platform
Message-ID: <3skwipkunn6dw4xtzyx4vdiqiwtu2qgezbel3vcu5k4cxk65yi@csi6xun5nlyj>
References: <20250422213137.80366-1-danila@jiaxyga.com>
 <20250422213137.80366-13-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422213137.80366-13-danila@jiaxyga.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NSBTYWx0ZWRfX0cNsRDX8gf2I xh9JSEkds8VjFF8l+bP15ibEAQpx8pmt8ak3HQkyxmgqVukv0JsClXvNtTtFKqLsHsDFJ6NuJ7W CKOkDdk55jn8kxbhGSyv4xLgN0TwoympSfqW8cUoEnUpsb8oCOlo5+chxFQAjhXRJOVPvo0o1kq
 DtXukUfPQt5vqA7i1wxXaejm3xhVqS/UXxVEW4JauvI04F4+1Cey7zZOyCeedGs9s7Ki3foLshd /NDeEXrBtdorkkbixUineDlU5oZ3wkYmdGmSn/H2E+dn+1XJHfMaf8XqnA/O3YtFdZCTNVXQHmV JxSGsu2PoZFUrvFitvhQFkGRWy3KKw4CZlpXC0iRs79eEgScAhlYvJHVIJE9/NQnFqYoCl35F9F
 qJKUciWaK1uTe8wHNx57xEMEncLNIkbriOwvU6uZ1Prqh8yHWfjKTyN8im5P57u1L5yawKHu
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=6808ebaa cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=7ibcVnAUAAAA:8 a=EUspDBNiAAAA:8 a=UlxMoeSB6LsTFmt9i7YA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=HywIFdX19-EX8Ph82vJO:22
X-Proofpoint-ORIG-GUID: 8xpuARDtMnhpsZznA3qOm_rWZQv8LNtz
X-Proofpoint-GUID: 8xpuARDtMnhpsZznA3qOm_rWZQv8LNtz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=867 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230095

On Wed, Apr 23, 2025 at 12:31:33AM +0300, Danila Tikhonov wrote:
> The SHM bridge makes the SM7150 devices reset while probing the RMTFS
> (in qcom_scm_assign_mem()). Blacklist the SHM Bridge on corresponding
> platforms using SoC-level compat string.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  drivers/firmware/qcom/qcom_tzmem.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
