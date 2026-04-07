Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B151B3A9601
	for <linux-clk@vger.kernel.org>; Tue,  7 Apr 2026 10:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559418; cv=none; b=ikfbb0fRP4SkUiS2fMj7L51ouHyr04tVqTKgXGCOK7G76EMy3KyC0D89DYl5pPoVob5lOwzCaVngcRPMkMEGHF8vvIj6e0HgMIHB4CNvf1BkV7SYMUoOmSYcKVzNnxP1I0S0iVGeDYU4K64Nd8xg5eh37+OorWU79+LtTcoBFY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559418; c=relaxed/simple;
	bh=5FZFpwbsvZkfWCGIHX89iA1PbcaMgbBVSQDDJ5l/Glg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ddzi91Uh/+ohVydXDUr1gjV1DAGn0YNEO6lR39M3YI3GMXVu1dT+CxB+X8s/xW5crIGyA06hOZnw8pSUcKG610S6Zbv5wNFe+VsONHxy/BBNLZPn/geYRHfxdPS8gM9aVpt3X97n8b/dIireIGj3EvGRZn4z6N1Qd3gOHqJCrLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nRY18Sgd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ACHvREEB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nRY18Sgd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ACHvREEB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376X4g92327732
	for <linux-clk@vger.kernel.org>; Tue, 7 Apr 2026 10:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6o+78GtA5SeBZnyBVOyCgJsy+RDbc81lZyqFwDAmIGg=; b=nRY18SgdId3HLTAp
	6dfTnPPIA8vS9qd20lg0qPf0MoGEqTj3EBuvAzrI4XnBYz0XjnG2eR1sV1FIwc2Y
	shE30s/qdRQDr53UN75hIpWzjRYQKtTgK14NwrLj5ZwdWOX6LnEQqGOb6Q30rpzB
	qlplYezgSZ/EmrPoTNw94a7NSeLydHn0FhjezIpokQQEjtUiLVo9xv1v3PRVUG2i
	izA4KUUVswDIQgQa1EbQ7nhf5yD1wN7lemQ0Vq85kwxnXCH9QrbfL21k41zqadn4
	uYD8jjqQoWPZDnCCWLBqI/BoYfO6o0Y1b0jZiU7jVBaURJOSIfWkGT35xeqz6wUs
	eTra3A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4tc7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 10:56:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8c183c2eso18655351cf.0
        for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 03:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775559416; x=1776164216; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6o+78GtA5SeBZnyBVOyCgJsy+RDbc81lZyqFwDAmIGg=;
        b=ACHvREEB21QnsDeIG09x5g2+yLkmsIawdzxmgTfrNFwt+awlypJmhkA78hVXpKe9Y4
         o7RwwuyjUHsexmRATMf824RanNbb4Qi5As+jTpfPimKi6BgiDLBCAPKKWeUKb13nGh51
         GF7s/QguyIoGEvLtFwiUr0sSjIslNoQ5E2zlulrby0IE/DsT9+vHNB6/4ZMTITIuum6j
         EuwOncqNswDzao/NvNdnSWGQxH4GxScyPzGj2cdhqR+ok2NUCot2p9AAhJCTobtqTwtI
         IJbqStNn4/hFg9ePkhAjMscRq5DaaawpSQ2+j3NcIvp1z6ctkvUkcj5XPNMovkH3WFGS
         N4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775559416; x=1776164216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6o+78GtA5SeBZnyBVOyCgJsy+RDbc81lZyqFwDAmIGg=;
        b=SkW/DNsl4KaSLR+ffh3LvpZC+O1giscBKevUyO2BwErkClSLeYXk/rIXKq83ZPKGXQ
         zto1r1tkXQ72++C8+KCBT2qRhCzyR0/V7agA1wpRsd88zPVxNCa8Kxh/H4W0E/eHBu0g
         RzjUnAL1aTq1tvPAUjxiqOGtPzdyMZM9HYrv+x6vnf16t8M7jjomjlJcLcUPmmxnTexE
         /Rf7EyYQR0nZV49TS79IGEf+sb6W06ausSDNOJlWb+AwK/Lgpw+7jAy5MIDyTChvfib3
         gzdKWVYgMt0Y9w6ghBdHIlAgVOv2pwm2p5AQCL09LaxGMnv4YiBI9u2Z2pkExnl8rD5p
         0Epw==
X-Forwarded-Encrypted: i=1; AJvYcCXM+DkgWeDWAJuvsuKbXLOkHiSpVuv3INtMh2nqKxo89f7Xgb9P0k97K86dpDI2h+QQaZk02kJoRME=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvoayo7WhYVjf4Ig/YuacAkFglQ5LhMIrovk+I20FfYyVQ3y0p
	vydx7xdegF8YgX2LgF281jBJeux7NOGe1WTnCgNg4MPr6cU0dFI+vBb1LLCbDnTAA1fq+zmww5v
	ZtlO1TNEKtNfivBZL01oMr51D8aRlbL9eIrls9BoQrt4XEvSuZxXCRXLiqP26Qcc=
X-Gm-Gg: AeBDieuGZE+kWsrZ1t03fFa6wFSr/Qu21DRXn05z+lt/dtxh5EzGCWC8hjYLs7KFble
	uxSrTKFZIi+8yu2Aw6e69jv0Me/afR8ibF8rNv5pdbbLVjB1Pc7xe1cbEsP3UOAQVbbd2+iGWP4
	elbm3WmzSwU8OpmAdOIHrgdmg6Lomb5zrBF7qypxDvl2EkfECKSV1Ux/DJY0qNpSKC8WzQuzMDq
	ghwp/RqMExbvpmx8azpeQGk66tYjwlzc6hPKDElh4wFTjAZBpwATysKZRnbKJbRw3I9oWlFQ/H1
	dTiKDhlkr3ozBxSYGaC8b/fc6aWUsI00LnfjCQrRVFHPKJD5s0s0bwIR2zyblsV1omFuhUAJ89X
	KcgrEm3vzQQPDZspSCbT1ZEUrnC0VwgIsgD3ZV82OTvyffaNxKMt/MXk7aXx2t3jz+rNcIUcsm/
	ON6qo=
X-Received: by 2002:ac8:584c:0:b0:509:2b5a:808 with SMTP id d75a77b69052e-50d62af94f2mr177225811cf.2.1775559416045;
        Tue, 07 Apr 2026 03:56:56 -0700 (PDT)
X-Received: by 2002:ac8:584c:0:b0:509:2b5a:808 with SMTP id d75a77b69052e-50d62af94f2mr177225461cf.2.1775559415594;
        Tue, 07 Apr 2026 03:56:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff1c3dsm540271466b.49.2026.04.07.03.56.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:56:54 -0700 (PDT)
Message-ID: <22afd2ae-c5ef-421c-9a9c-dc1073aaaff4@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:56:51 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] clk: qcom: gxclkctl: Use custom disable callback for
 gx_gdsc
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Pengyu Luo <mitltlatltl@gmail.com>,
        Alexander Koskovich <akoskovich@pm.me>
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
 <20260407-gfx-clk-fixes-v1-2-4bb5583a5054@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-gfx-clk-fixes-v1-2-4bb5583a5054@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwMiBTYWx0ZWRfX6Kawj1q0husE
 l2GVUgFoXpay2kL2T4ehwoQQ/AwkXP/v13Lm9ABO4oo4WnT2l5GCcAS7b+n/34L8943xBN1w9/S
 1+unGwu4y1BSaD9pGb/eWo1+q3YKpg6TNdEULfTgfB0wdSaUvDhsuEZRUQ5QjVKx5U1JmzXtcX7
 cbdUY/8g4zRjB+bTHdLCFWthpJUGrSklMudObb+XgYub0CjHWvbK1YJCRKQjNRFBUP1Q4abBilx
 YCbzgBcz1lGseq96bVbJyO6tAV6YNHzbiv3baLmrGJhKvhFG59UOHUQnmNfhDtkEPGhRHCb/zmw
 l6+gj0A2dD1i2RVoJZAhqrNi+ZeAOL91zJCmrisSLRG8cmIJFsvpqwtxpI8s14PqZpd95JTpgd/
 ZVTSEBJt9haJ4/kQQ3w22iT6DNvArkFJ4RUkoQgw2KvyRqaasghTSuLrOSy4IJ7c9c/TaJRd8dT
 xAxNZnjspvyi/05FlFA==
X-Proofpoint-ORIG-GUID: IclKl9bh93YU_EL4s2tRwDkh9__ZduQJ
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d4e2f9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=4w9pqFYAhlswuzcMsVcA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: IclKl9bh93YU_EL4s2tRwDkh9__ZduQJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070102

On 4/7/26 11:30 AM, Taniya Das wrote:
> The GX GDSC represents a special GPU power domain that must not be
> disabled during normal runtime PM flows. As per the GMU architecture,
> GX GDSC should only be force-disabled during GMU/GPU recovery, where the
> OS explicitly resets the GX power domain.
> 
> However, when managed by the generic GDSC runtime PM path, GX GDSC may be
> disabled during GMU runtime suspend, resulting in warnings such as:
> 
>   gx_clkctl_gx_gdsc status stuck at 'on'
> 
> and failures in gdsc_toggle_logic() during rpm suspend.
> 
> Use the newly added custom disable callback for gx_gdsc to ensure the
> GDSC is toggled only in recovery scenarios, while preventing unintended
> disable attempts during normal GMU runtime PM operations.
> 
> Reported-by: Pengyu Luo <mitltlatltl@gmail.com>
> Closes: https://lore.kernel.org/all/CAH2e8h4Vp9fJYAUUbOmoHSKB25wakPBvmpwa62BTRqgRQbMWuw@mail.gmail.com/
> Reported-by: Alexander Koskovich <akoskovich@pm.me>
> Closes: https://lore.kernel.org/all/gwVAH2mJerU4dBInw8pKmOs5aQK55Q7W6q_UQAlLFCsEgX6eyvSgXAWbNNMqAX4WmPlYCKUSMhfkr5Jry4Ps5EqnxYZqEEDd3Whwv7ZXGlc=@pm.me/
> Fixes: 5af11acae660 ("clk: qcom: Add a driver for SM8750 GPU clocks")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
