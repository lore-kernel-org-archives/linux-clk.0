Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715AB3DDDAE
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 12:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389406; cv=none; b=fPzrJIBEP37PGvzfG1p/l9abMB7vNPF7H4EfDHPPMiIQvisA58d7MbvLhX1thgxX0JCMrZniLaORi21G242jsMRWQ53wmH4MoN4DaFG6GSi5mf+XWPn/H5gzEauMwktPgJsvMr0R5NewzujnOlrRIFTP0UjoUewhZWD4nEmFXLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389406; c=relaxed/simple;
	bh=qVSccV+PPFn2ycSFxupGD0ezxiHk4cFL6ejjLet9SOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UGH8ZkY2nGV5LG9u+jhBKFOk8gYyXWaNagfhjXrACvAS6rOmvjJhnkJHeg6O2o3nsGM+SbyQqtx03ULfLncsNBNNUw7NTGxh7mDcE0lAaqO6gU50RT9YEYUJsf2bQ7M6bgsjP/WWiDBbDGouTyAY0bgx4OSSCRfq0yGG3wkg6mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ftHyWL46; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AnQ+31Sk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ftHyWL46";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AnQ+31Sk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jw5p2047057
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 12:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YbxBIHP4GTyNhgGImgrH2ee9ixVAN6uNrqw5mAZsIR4=; b=ftHyWL46+UvCxbEq
	ODj5vQoIGKmTwGswKZQw7HYJHMFGnmI29QoAaaNMNByr7ovED9q8U8gvH/8KKDvK
	rlD+0A5t6TpaXTKvp08VgwtY37MsrbGcpvm/0ehsd47pGv20RP8sNpGzltO6Na1q
	oxFtRmEp6MC2LRl9NWVw0aBd1CXzR+8qcPMWQ3VBqxJklXAOCbPxlvK0PUBnYWvU
	e004Ej7AwMZrj3Kd898PV73Gh6l8gMKVLuIdbLX0gGqRVDqSWmpIEooQZjIPTzyO
	Y4BMb8MmNQxxKT4OVV8W9/BsXt98ggICZL0zxuQ41u8ZRBZO1CBH4QbrauYsLPXP
	jX4jRA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uyqhyf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 12:10:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a15cef334so2486051cf.3
        for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 05:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782389404; x=1782994204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YbxBIHP4GTyNhgGImgrH2ee9ixVAN6uNrqw5mAZsIR4=;
        b=AnQ+31SkMPyHiymIvFs+8Hk2dGYGGTf767RQJRBmKddiNvEC62j3XN+68zsor8tRx1
         prGNatf863q/dC4af5FNlvCWFS1LOHBW6Xd2QU/xBX2L7sKFSJW1hfUlecbiSLsHdkXi
         X6TuecZk/CWnoMjUSysaitrK1idvPM6ZIIHzECKYXNSlVgPn9qIRxNoTFS/0viOLnYgC
         lui6lRoaw2ZXnt23oiNZ9l1HaNpAOF4kS1PeuGQHO9T+9HcGPYSZa92glebPKrUzIOUd
         Wjwg96LGw+UW53qhHZZZPbWUy2T+AWVUaBx3brN9PW3VKR4PzcSBssCl+yFbNXrh+5kp
         /74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782389404; x=1782994204;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YbxBIHP4GTyNhgGImgrH2ee9ixVAN6uNrqw5mAZsIR4=;
        b=WPvh2a/cb+NW1+RbJlAzP6mSRHg5sLYjCJK2KqIE/S4kySz9Pm7RMJx/2hHEjePXTX
         Do+09NDc+9Q54w/tTJKphY3HtCucL18KIIbhgtczQmAqCzM3S3+9JWwXTk4/B6vAIH3s
         9MLCdwPjxJqFHMLQMOG0GMt8um1OgFB1gNOkEGy2NNI4lYZ0P2vg+3CWS4ePpkYgr+nL
         nYBVq5aD/zPUEs9LWPKAo69n0T+wi45WeeqkNOeT8f14hsakcXowpqiY10zu5vctdwDy
         5HP7GWW82Lr8gr5Td5MTnHGEPXxIMBztY64yapaI4wgrcj+UBxPOSviLRfD4BXQwTBBl
         ONlw==
X-Forwarded-Encrypted: i=1; AFNElJ8qnsa2yce3si9nXR1FB3xtp3GcbNM11468rVmJM5x4vD0si9cEG4KCqlXajtv5yGpL4JEF8s0Ujqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZvpn2dwZ6I+eiPSgviu0S1Cd77ceI7dJEbFXz4YWeQjVDmpjl
	pW542x/z1EOy6eL/ggSYu1OHJuA3GfKMk7yrJa+hv9U7GYeY/cC/Ln0NliG7wAOVe4lkwrTPwBA
	BupNa9ZBpDnyxpixk+IrMrxVlPkwRONmiYC3CPj9DZb/emLGkfyMxzFXiRMXt7x0=
X-Gm-Gg: AfdE7ckWiglAWyvyen685r2Vh+zRniv6TZ6QFwqf1MhyiFze/rDw36YtT3OKcYnBGlg
	ZrVi5jVh8NvQIu2Quo/w3BaWhTDisI0vYbz+UYRJO59XVDBE1IHvVVbSNJAUcZTdEElI59Ueeww
	u6PRLEG7LQNvlt1VnwYZ+R057AqhsJTe+hoIkQkasenPOlGGzDHYuhzImWuHr5nGx8yEHxlb4aZ
	zAYD2r1+W7XDhSuAE9TwC3P1jhGJRR/4XdLfFGk3zuH1hXp+yaur0N32BHX/D7Tgnshux9rr+iV
	BqZSJAHQPfA2qDP2nLVZ9viog4ayaewD3oEkhJvgpslqFHmmq0+rThMvtpgohyX+F48MTA7mbgT
	PouxK1Krm+UcO6KxFqad1tyKk5m0vFsOpblw=
X-Received: by 2002:a05:622a:1451:b0:517:6d82:9d7b with SMTP id d75a77b69052e-51a7279ef50mr17703591cf.4.1782389403694;
        Thu, 25 Jun 2026 05:10:03 -0700 (PDT)
X-Received: by 2002:a05:622a:1451:b0:517:6d82:9d7b with SMTP id d75a77b69052e-51a7279ef50mr17703141cf.4.1782389403074;
        Thu, 25 Jun 2026 05:10:03 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe0742fsm166255366b.34.2026.06.25.05.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 05:10:02 -0700 (PDT)
Message-ID: <c462694a-d48e-4e05-99d4-b2ad1036baf3@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:09:59 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] clk: qcom: gpucc: Add Nord graphics clock controller
 support
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-6-860c84539804@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623-nords_mm_v1-v1-6-860c84539804@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: P613vMBBCPllQhPlICDMCRp0ruYigAQF
X-Proofpoint-ORIG-GUID: P613vMBBCPllQhPlICDMCRp0ruYigAQF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwNCBTYWx0ZWRfX6ZPoJn4sCnyK
 +B1+da0kVMdAuOLlBM+y1q4WjM+omkymHHGD1bOqycNMq3nd8+R5/5OyQMSzZl4EeIJjdM2saYH
 1+4CErabIJ7U/qoeghWvuXMaquxa5rQ=
X-Authority-Analysis: v=2.4 cv=EsLiaycA c=1 sm=1 tr=0 ts=6a3d1a9c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=cQiK_xN199hq2pa4WXYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwNCBTYWx0ZWRfX5ZgaeXDUbRnn
 ErdQT6uSEoX7oICFK/6sVZVhssU5/W/Yiq0Ou5WSqYRuxniYqb+Ne6A567eyRPIxenw+izCFPun
 V2fwBG+5dlttdhybhMRYkJ/P/SIL/YJctU6FnsQmCDqOVspXgTbDsJraD2v/ie+VHvvTbyC3naw
 /hX2S1JMpj21JkVJvESkrMVc/qHZUWEEGr3UN/QM3N2GF0hGoZHnjH3987K/9pEx4nVAUbta6Ww
 Uvn+jgy46CUMXDa9xBc/CsGYjTG/VyVC6KjLIA4IXcL9PTWiKnZQU6KoitNmxjJioHqrfcE8Z57
 sD891u8JJpycC9pPI6c0D2WdHpaHJeY65/utFLiBXwKJKpPSSJMIdtcNUaSvn4d0KuW2uuPysjm
 D1gQhm1Zm1NyXR5b2uB3tUHw0CDNykcGW/42F0DJm5hchXnEVUezs40ZL/lXkY/4B3FnkNNS4yZ
 guTjExjj3OjzkSzuXjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250104

On 6/23/26 12:54 PM, Taniya Das wrote:
> Add support for the GPU clock controllers (GPUCC) on the Qualcomm
> Nord platform.
> 
> The platform includes two GPU clock controller instances,GPUCC
> and GPU2CC. Register support for both controllers, which provide
> clocks required for the graphics subsystem.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig       |  11 +
>  drivers/clk/qcom/Makefile      |   1 +
>  drivers/clk/qcom/gpu2cc-nord.c | 546 +++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/gpucc-nord.c  | 593 +++++++++++++++++++++++++++++++++++++++++

GPU_2_CC and GPU_CC seem to have a different set of clocks and
resets. If that's not physically the case, please align the
lists. Otherwise, please use a separate bindings header for each
one

Konrad
