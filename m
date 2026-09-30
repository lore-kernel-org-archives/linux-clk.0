Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD452472F7D
	for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 08:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758731; cv=none; b=L8IUaBiMaGlhBhmdGXRDmgv76qncfonvLW7+uPzYxwoNZhIHX38iaVGPk9ze4+pxwi3na874JyLsccgCNBqMf1Yl7OevWQHUOqxFAg3G18u8g64vc1sdTFFCQEGhVKG0k9j7SY+apZ4pvZVxNlPu4DpUNhJ77uD1szqihnjPNKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758731; c=relaxed/simple;
	bh=mZ62Kng/0Rgnxdkn4HmMlG6Oxc+tVal1JPFn6pjaB3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LwY2IdgYVH66MWU2gpgpvo14NFR7uE2hBjXEICNnDin/DLu4U0vY3Oo+N0M9ESJTO/8ulEYzKSmxM0sSDT7x3d5pbtCkxRDRbZC6hH78znHmS1WGRIhR4bNyMwrhWnsbZpEtgZVKn0YLEcQXBg82p9FXpGNeJOb6MdYFTkl95hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WHqrHBC8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K5LI9n/L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WHqrHBC8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K5LI9n/L"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dWhx2820002
	for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 08:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rmkFRaiiplQ+paOGLk3epfQou5738Zs3wOw+JTEUgjM=; b=WHqrHBC8V4pGgxVA
	VfNRGe3zNT/WpiNniEJpuWIi2pZQX6kET54Sb4TmmoCPtzFWuJny1SxESPsDqcM0
	Exe0ObADWSHVwWqlv+UTWqaXMrvJ+l44iY5SUGr2e9LHSnuBHCK2ggOPciEb5B5j
	ecHhtI65evHiOrlZ3YNRzSGzk2rYDOIjcrmqyp7Y+j+EGPce60B+6HNS/Z12fWY+
	n27bgDUvNbVoMTRfw9UIdjoiQTQBdyFt0ibzUyeV2IjlyGNPFNJC3WYUk7j8q43s
	cdOYNwwgO8P+8izf2v/5lR2XdJO7Hffqd1Mo/MbUFyN8Mt+t9QIvC8DISXDwJvMi
	u6pAxA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rj2sv7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 08:58:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-915e9e1a5f1so5168706d6.3
        for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 01:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790758726; x=1791363526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rmkFRaiiplQ+paOGLk3epfQou5738Zs3wOw+JTEUgjM=;
        b=K5LI9n/LEBSCGzZqqzT3US6Df3aOh/5cpCFhzkDw8Wrtoyj0NRIDrzibziWPsK8pHl
         WNwWViRL0Hhb7nIbpqRmdVKIgAWJp7y9iug2ShRxlTBwT4mepK8DTMZUJoSVpEgsw4kb
         HMoB8Rq6WSZovdM9zQgGTzAUoe8GEi2OL+0Wx5LPCrrK1eQaTOowo8Bape00SXAW+BpT
         xa3NARcDF90c773JqQzOVt+sTLR31NhweP+hthOjXxsk43xl61dObm7CbXcGhNwhENPi
         RuMikjclLF1p9+jSAiDEvMKhs3qN/K/YBQwYRYLQrpL2iR4sGbiYA302QnOjPBg595gC
         /t5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790758726; x=1791363526;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rmkFRaiiplQ+paOGLk3epfQou5738Zs3wOw+JTEUgjM=;
        b=NR/xQHf1p4S/m13R/XQTdPvDcbz29utbg2LJWS7LXzj6VARiSYeaUWuINa24z1pZ/8
         N1nAb9KZhE3R9GofNxaI8kIhchlP34bvO9VUXel/hWjtSZZiGUsVdm6ZzN7pSraX1ygq
         UXk5dOqzZnzcMI24eNxrrGQujs6lm8x71tquWdVs1lceaeEZJ4BolA1Hy72Y8RRkfJQQ
         sWMU3Jc0G4iqMqWpWKT67J1CsH/UBAoJ9rKYgDISiK6uvwHTIV+p+sd/ET1uaAocArV6
         1xEhaoHf7s7O8f3RIWcAsFLAp0TdguJh88TjbiQPqHy8od21D+JlmUbgN6U/jII2hQri
         SjiQ==
X-Forwarded-Encrypted: i=1; AKwUvByfa2zeQTOC3Y+P0P/h2n/nrFKtlWtiITBBTCp+OCeMu/2T1cWjgn1IMpOCVF4jmSTp58jvRN77ixM=@vger.kernel.org
X-Gm-Message-State: AFuF++nSBxWVHLwdQ9y1L5hsGR6IoKeUgsI0Gq2zTf9MfVRMmSfyeFK7
	MvM/+IvbJrbE4opTppQnyj2LXWwsU04vCMpG+RF7p7PmmuGwxpHco3UQfpW13+nZ7KUt36AeYAX
	vQchrDynqaz9uQirpFcRdt220AzFjOc6mPcUnDIdgLVsnbjwmNZcipV0867n3uXw=
X-Gm-Gg: AYBFou1UnW/a0h4tXQDdZAmLtkyANHP1OZFYrH9IiIEPrIALJD7zwLJnno7p+vGhp1k
	Naptm+uE3e7N1JbybLMEX5GLHXjAQxCMxEZYvQty3wN8dG/djim1lyD6+MgvA/hM9/sKSBdfrhY
	4VT9ZfzFmNNOZb2fl9XHmYaskR3gdbbgLS52ESJoOFPvp6vmf5KjH6f5tYNbVWOOgZEKeyLSSzI
	2DVYPgt2TWo0eWPePD7Ys5eZZZzHbbz9LT7pLMmsKYY9WCUbd4ZXAjGxbiwo37C03Vl6AJc1qGr
	kBy0/krrp1bDiDSV9U50qdS2J0pqim8gaBXGRuxJqSqyhhedQwD3aUu18DeQtwvVRKnVMVj+As+
	UOtbyCp8D8LWVYo5Gr3d6Cw==
X-Received: by 2002:a05:620a:261c:b0:93b:c6ec:780d with SMTP id af79cd13be357-93ca9880834mr94465085a.5.1790758725839;
        Wed, 30 Sep 2026 01:58:45 -0700 (PDT)
X-Received: by 2002:a05:620a:261c:b0:93b:c6ec:780d with SMTP id af79cd13be357-93ca9880834mr94461185a.5.1790758725400;
        Wed, 30 Sep 2026 01:58:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f79497sm31063166b.39.2026.09.30.01.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 01:58:44 -0700 (PDT)
Message-ID: <9b4eb301-5bb6-45c4-94eb-a6a3a2540309@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 10:58:42 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: gcc-sdm660: Keep the USB GDSC in retention
To: fabricioakio@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260928-sdm660-clk-fixes-v1-0-5d5bb84e3258@gmail.com>
 <20260928-sdm660-clk-fixes-v1-1-5d5bb84e3258@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260928-sdm660-clk-fixes-v1-1-5d5bb84e3258@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fu4_UzaOx8hjFZFlIMT9KdgOr-Vm07SN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzNSBTYWx0ZWRfXwjekpazH0NEO
 iEaQqfhXabTanba3lqilQTf0+qvybUbtZbeSPCJfttQNYdptwpj82SW5btSyId++3cUvB6e1SQw
 0yqCYdDm1LCX+qARro+Ux/t4mhdbt2b8nNmX1g882HteSJXKIdZov97yGmkshZbzbcpJuXwGdEx
 mmV3e5kz/rMzu6wtjG1HAy86Lj5feMy+V9nZIXFOaoaw8nYWNbvHBHdD5RHj1OpAT66Vne+Udkv
 k4PfeuDfZBI0tKAHqy+858gV2HZmVweXebDReX8P+c0iG2TMHz/cD/D7eIrsHCXSXz5319mqDO7
 MF1KDuwHAdauB7asRlX7Z/S4PGUAh0S6cvcmWHy1GgcptSCi6xMB0V+xldSlmNc/0xlk9UibuT5
 +KNzBg9qt3MjLKL7xPLkOcSpKsSmPZ2vSCIsjgmkeC7k3ZtjL4apw5daJfvTM5uy9Bgt9EHB1Z8
 GdHOh2XBVwnsgdHLMIw==
X-Proofpoint-GUID: fu4_UzaOx8hjFZFlIMT9KdgOr-Vm07SN
X-Authority-Analysis: v=2.4 cv=Ypya1IYX c=1 sm=1 tr=0 ts=6abccf46 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fhGIgCobiWGKHZvJdykA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzNSBTYWx0ZWRfX6ftMtgVJKk8D
 0x8r8Mbdu06wOlbEDm8dQ0Ae9sn9gDnZBx4gSp5BmndYC1sO7KH3lxt0AieD9GDqnJVIvWbJchr
 HYUl9878nBRLUv41LijWfoAX4Dxdizo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300035

On 9/28/26 7:41 PM, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> The DWC3 glue writes its QSCRATCH configuration only at probe. When
> system suspend switches usb_30_gdsc off, that configuration is lost
> and on resume the core fails to enable endpoint 0. Keep the GDSC in
> retention, as is already done on:
> 
>   commit 78a2f2a04fb5 ("clk: qcom: gcc-msm8996: Update the .pwrsts for
>   usb gdsc")
>   commit 83fddbcc8337 ("clk: qcom: gcc-msm8998: Update the .pwrsts for
>   usb gdsc")
> 
> This change should be reverted when a proper suspend sequence is
> implemented in the USB drivers.
> 
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
