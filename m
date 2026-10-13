Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E00B4B403F
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 10:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887588; cv=none; b=ftThzaxfFkOIVaeJ47UkQB90SPnxgzHl9b4J56FOVZNDSSnOcWNvmSoaORoXkdX9rtlf8kbs/EDiIsdAc/++L9M2Y0CwMl1IG/CAwY5jpCwr53IBPCG2M/UJIxQXht8A2arW5TZfqu6GKhVUcA45/vixfiLUC1JjYJ7breqFPWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887588; c=relaxed/simple;
	bh=sANSgWpteU9Cf9eidNCj99X0xOWnKiEStezKFXKpais=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cHfpQpPigUQNsI8g7f48xT8MXjFVQel04u+v3e40poZjy02kuTp2V0rl2ONRttdy46uVtMaVb1vntprlQwzjEEr9XCKG4bpk3281gMsCl87Bc6Z0s1BqjnAzwwkUm3LIdESv5UyuA2bGg7xpiaUIUqIkzjE/ANAmcAGgXTejWSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RH6Bw6zG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Prhsg4eB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RH6Bw6zG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Prhsg4eB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8PIXn302832
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 10:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JHFj7PGaObXZDiYXMghJftsWqlHAdyKjro0kH0HK4po=; b=RH6Bw6zGSIdAkjYR
	CWZPSSlwSMc+5ePjOVRDc/qgSO2EgZiyC2kgOAKy+8akEvjWPlTvyvPpu5twOYNX
	rXlrHk3kUWL3px0dRW0UqkLLq4SVQojOGMGOs4cKHjpkt+iPIRfdBYh5VDsls3rr
	R6tzgEopGBoTem9yjUDCJxJO0M5AXSsAuwVk3d58xSqaS0dFiYES/tbZAIyq39ja
	lGiGfD/wljfKWStv7AgKVxAF05z56yd8WSSyZxffozmPaqaw/Jdg3hQe+zsbJTjG
	wQPs9EEN8oGSEwkYell5VM54wucbh25W+tC4f7EVYMbo53tv29s4oITlwIfEKC7X
	5Wy6nQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sqadb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 10:33:06 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-88a1de72cf7so4419573b3a.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 03:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791887585; x=1792492385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JHFj7PGaObXZDiYXMghJftsWqlHAdyKjro0kH0HK4po=;
        b=Prhsg4eBA0U67XnGK2CWuGKqjPOTXsT9V4ijeW7fO+GYLfHRqw+tXHyuB36oGwMsnC
         7Y2rRg5ehKN7jKg/xYqubvZVtXLKyGnbSmSKCtDOckfDL5Hz0U88SfuW3Ac8oFaV8T7H
         OeNQPKm4h9kp3UFwmqWMV1/wsaXoaCMZxbDaPbXV1M+oxQnmF5kTl0chekhuwcXjPfp4
         iU0cGaPUo7MjfLhfd8Qmw9IjjsushciiMMx0vAh1mP3vd8TO3q4NscqbTorUL02FndkI
         jYr4mB3HpKaafsxSq27zc7qFy8jwHK07SzKCLE+4f/7Q4wA93rF4lZS3PKIasv4D8VNo
         KGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887585; x=1792492385;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHFj7PGaObXZDiYXMghJftsWqlHAdyKjro0kH0HK4po=;
        b=SHTRjECq/axIpFXQImvaoleYzxNoyU/kTn8ZRiyDPG0Hpmxx3rrWiMiRqm7ko+UYED
         Ss3CD27TfhY5k/Gs8XzDevx5dmOxsF8Ykd47iy07KzoBe36TfrZB++3AyJJmTnN5Bjzs
         lOCFZCENmlxtrJGkR4OCzSBdDdiPi9AYdBdmpbiaEosxbNOLcfLLi9I9p1IXAXctiGQL
         58l8UnW+SWCaRpMR3zUgi5MfS99eA/UsG6Js97OdspN/auQCwPxz3VzsrrWVSlIlrTuC
         hLXvW1Wtwh1gFOWnGGuqswn/p53kMbby8gR069C2hlkpoWAcKKN2AXjt8VQlbwG+VCua
         syxQ==
X-Gm-Message-State: AFq9FYJJdbNgGI/1VWQNa6xGqzMgOgeRShZ6Jnp5yEhgJhk9VIqzxQw1
	dfrBROmo6luJA5B2CAVmDSAlZJ1PEFxtK5XzbRBaBVDqfbpmqfp06fgRVQtNmkEk3boHdP47Wuv
	kR20pJX+oXMx/jiKlc6hanvlUr2Q1URpCTwFQyRJClUafdpW0fFOQg76BcRqPU6I=
X-Gm-Gg: AYBFou1hZH3HSLhDEf9MYKoy7rZhbq16ACP5QbqZJbxTud5MpuW4skeMMIQCVkqKX2h
	SHhh7zSE99Ywx6Gyi7kzBB+VF7BXEZarmwxENYMyRxdany6hoqSTjqzoNtlpHpp/nQ177SyD3Bx
	hBSKhcr6GkiKk5TWG0/avD2D+olVTGqh4diZwr3/SFs9tbBFNLmOJAGk3nCru2KfyAwhv5wr0Qg
	xccbh8963d7kwDUGAWYGnmisG+Cs2HTQj4RdREck/9I+J7jG5djh1ybj8tsgpamRmz2WfjThsb8
	qHi5idcmutyUOjVrIInra/JhO28RkUHKcDGFiLocVx8l0FDHjZprmGyVTullht7VUyE+7PYSqE0
	JUR6+gcriw/gYQ0c8qroVUIBsaQ==
X-Received: by 2002:a05:6a00:2181:b0:89c:e375:1de9 with SMTP id d2e1a72fcca58-89ce3751f88mr965780b3a.4.1791887585106;
        Tue, 13 Oct 2026 03:33:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:2181:b0:89c:e375:1de9 with SMTP id d2e1a72fcca58-89ce3751f88mr965756b3a.4.1791887584596;
        Tue, 13 Oct 2026 03:33:04 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89928fd8469sm3040594b3a.61.2026.10.13.03.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:33:04 -0700 (PDT)
Message-ID: <869f6981-38d3-48cc-824e-98b5f662bd01@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:03:00 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Regression v3] SM8750: cambistmclkcc + camcc together hard-reset
 the SoC on display blank
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, linux-arm-msm@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
References: <179179331695.677917.11557670447411700010@mail.ustc.edu.cn>
 <179185039667.309517.8503800087166757122@mail.ustc.edu.cn>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <179185039667.309517.8503800087166757122@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX5JcUJbPd5lUD
 o7Y9mpQ2VoIVXAALhh6Ytfm1iWgNzLxQz0hPYe59kf69hysp69AAJDKVxUTRgo/92jNeXCXYs08
 q0oUmB7NEwnY4lM8WZAyUEeNqh04RMAhHqp73uYR20odQlFp1Kaf1ZcjvPl37NE2q9VnpAzRYgq
 6NWFz1w2sWGXh8fj1+XmwauA3yqNTQtdKVk0TuHwmQt0WpXSjlfrUmQ47K+TtW+tRzysM4fuTg9
 b7zawVB/PtPn/EDT5hq+MzwpgJwCXl2yiveWWHRzJr/nEFkxTr4Th8YdFyURDH9xhn2r2R1r0U/
 8E2ULGC0txuwVB7QldCte+Fveu5CVtCT6JyDUHlV7BBG2JtUNHGaV+BLDOtolATg1+PBrQiOLKi
 wvJbZIYSxx3Xr7dIIkcuusn4YAstWO1G9fYWDTWdd0kQBZngjz5eYumYuHwjoBb9pPXh2DR1dyg
 qWQ923lQTW1nkry7xVg==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6ace08e2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=J2Heq_bScuKQZqPe_Y0A:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX4gKM91kV2lr4
 5ANFSir/X8omgZTigC/2j5T/FrOCeOvq5Vy2BtTDIuqy4HZtRpJesxCrnaSwteyKdCUPO+VOu13
 b9aW57GyGLkOwVcMG7tC2VXXOEQD7xA=
X-Proofpoint-ORIG-GUID: jdcJnFPQGMPB3Y0wDj0bOp7iHlYci9jq
X-Proofpoint-GUID: jdcJnFPQGMPB3Y0wDj0bOp7iHlYci9jq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130041



On 10/13/2026 5:43 AM, Qianhui Xu wrote:
> Hi,
> 
> Two upstream data points that look relevant to question 1 (cambistmclkcc used as
> a bare clock controller with no consumer).  Short, no new bug, just context:
> 
> 1. The Kaanapali camera DT overlay (PATCH v21 14/14) uses cambistmclkcc as a
>    camera MCLK provider:
> 
>      clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
> 
>    So upstream does have a consumer for the block.  On our SM8750 board the
>    reset happens when cambistmclkcc and camcc are both probed with no camera
>    consumer attached and the display is blanked.  Is a consumer (or the camcc
>    side being powered) expected to hold the block in a different state, or is a
>    bare, consumer-less controller meant to be safe?
> 
> 2. The v7.4 clock pull contains "sm8750-gcc: Add CX power domain",
>    "gcc-sm8750: Tie the CX power domain to controller" and "dispcc-sm8750: use
>    common probe handling for always-on clocks".  Our failure always ends at a
>    display power transition and the last RPMh write before the reset is a
>    cx/mmcx level vote, so this looks like the same area.  We are rebasing onto
>    that work now and will re-run the pairing case (camcc + cambistmclkcc, real
>    display blank) with the same three-state instrumentation; if the CX domain
>    tie changes the outcome we will report back with the evidence.
> 
> No fix patch from us yet - the four questions in the original mail still stand.
> 

Hi Qianhui,

Could you please share the complete dmesg/console logs and share the
below to analyze further
1. genpd_summary (cat /sys/kernel/debug/pm_genpd/pm_genpd_summary)
2. clk_summary  (cat /sys/kernel/debug/clk/clk_summary)

-- 
Thanks,
Taniya Das

