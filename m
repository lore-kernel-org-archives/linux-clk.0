Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A9B3164B4
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 04:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775796733; cv=none; b=uoxN6LZpxUzPn5s46l+zZnmRQMOMpe1xrePYCkOCsIpUi3Fphi29pKVOGDd+4iGeQVpho/cD/8QoXaWh/1mzoFWwSp3TrJDQ4yQKcqpnpCN5nYuRjNUVchocMR38tDXhHzvaqvYiqaDztJfOFxmF9HBfTmBoeVkYlQfbCXAREAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775796733; c=relaxed/simple;
	bh=A4xzkCqH/qys1wiQXVa+BTNBsula2Pw5VETT0kvN/Tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u7pi5PWmgbBASItmux177Cu7m/aXsBBxDI/y7xENVmA+R/+5zSAZQTNzSfi7tr2lBILseG8jUoQpjNjy5n3gqe3MoiZFLSD3RhLJaoJrNkzazO3DyShbU+vMi8DaAEtni5GW5wDzuekBhzMY2r7R7dATFHGlmtFDcaBqOwAZz+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D9hg1dpD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hpbGjdbN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D9hg1dpD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hpbGjdbN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A24ej6115016
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 04:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sXtgsNNAPnexGN5VQbjjHuHnybFIPEuuvuVsapqN8+s=; b=D9hg1dpD1HSj7X05
	/fvWjcGFZRmGzsHPTi2j3N7IkjrOcZh91vs/woXsQ1ay4+1oG3YCu0B1ALT/TBhT
	kk1hV50WbiMTMcb9LpZfd7APAC2XJH59dDQ+y8WMIrKsr+/nAjqIQcu5ureBwTpj
	VG3XbKrvO0x9dxcq/rbVJsRv2hp8qnL4laAJOMiCu/+zFEcyR2ANoOSqvxjQD+qC
	2SwmoIM59ejGUSlRYj7XjseBRjtEdWNcK3lXgjv1f1P/ZIuXhPjFgnZrn4+uwswS
	JuTBkmzhtsxKjbDdA9A8v3Bu0CVm9Ngbrn6ClUnurfx809ecVa1AbCbIiFnk5P8L
	fLapbw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dee8xab7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 04:52:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24305cb3cso16188435ad.2
        for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 21:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775796730; x=1776401530; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sXtgsNNAPnexGN5VQbjjHuHnybFIPEuuvuVsapqN8+s=;
        b=hpbGjdbNapghI5X0Eo1w9SqjBabHu6nhHoeufAXZmNC2OjqJCmhAhlC0Cbl9DhhLlg
         0EdOikVfmF2wFMZUvxBDRtofj/z/d+Ihd9deMMy9hCOGtZNCUnUKdQXcgrKrI9/iCSwX
         KuBmccTLoZSkaY7w08PQn6XLO40HITZJMk8iDkhiucqfM3zscnm7r5Q+DLTqozJqLNDE
         xM1S0f2iwyWWslS2SmmC51tvt6Z21Srw4k1aRDszOHTm3mCtXebOhttMajpbK/5A34Ay
         Pd6ScXZJmeNvG6SOws6ioRr6zDkI7jVpB3R1SpX/neHRTolQTW7JQfgeCAB18d8xMeW7
         MUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775796730; x=1776401530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sXtgsNNAPnexGN5VQbjjHuHnybFIPEuuvuVsapqN8+s=;
        b=eQPDjNlJKvqiT70X5Hu7Q0ZfB/T9dOEBoYoS0H5ZspayjiSohfdCcMWshDykQHhG2F
         6WI5S0ZlQ6dFrAhmyfJEkBLvsOBJid9VprhH8HxqxmgEIt6Dc7qj7LaeH80Q3jB2jv3Q
         iEd+7dza8kgahoTDttLi5Dym6HWIP83xRtUafzfzndPkGNhFmQwn3A6gxIy1ahvfmaG6
         mObUutkdPWfK61GpFbf1Aie7xLy+bag3fIGWdsaPeW1fT7K1muRGu3ymm8ZSLrwnDlqb
         I03yTnTUEAyDtBPULIHiD4rin+iyLL2cKT/okNKdylG+En6ew9nkuwThPEIj7euvjMSc
         DlKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9dDskEFre4i2usERRlJYbUFZ66eFq9POfqb1PsbOh0TP/Pu8gSysOUcVU/fV/Fnc83DRh5+OkcgI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW5Cp/JsRfSw7RozdXNmSP8YuNAOQloF9t1n9xB2YrUCVRzrHE
	4XTLjqFKcTvlzmsSa400sfa165JQgQKbLLtVMvnAOowu8NYxbpwKigy3Ow/d4hch6nw7SiiFNYs
	yxq6Vvn7fl6X0Rqc/McXwxbo/ZEz4uTyzO0bePLBAiVa2cTAdMoEJvmHo9mYbaNU=
X-Gm-Gg: AeBDievkbD8UQLM50t64sULeL4WgmT1zh80vg5rXF+ClqLPNILQ5K/H5zMwUjPLW9m4
	Z5VwttsRlB5Mc2p4Xstpf6kkc/tFURQrFrEkiyisLBJ+RHc1M98EyjjR18WfXrNja3p5QGFSvxV
	GjxYGl/t8b2A8xQ73+3SWUBTB/ePBLW87+Wt/JGg1H97YOhIJ2jkwimGrbP6uwsh/0N2poymMaW
	+J6SxFW1TwQR4BJOVoPNESfhbFC9BCJy4mWLkF/HxumcL7yTcXVFEprWakIvdHACpmu6gkeG7pQ
	NvUNf65gImFsiPbXa6PQW+fbYYV38N/W8/AmPe+aI0n9BY67gT/s1BC0inc9ASf2hxUhHTznxiP
	5lnqncy/DrfOXcf6hIPdoxEd8BNq7zhlKe6WTJjdv10KxhHd06CFDOQ==
X-Received: by 2002:a17:903:1a43:b0:2b0:ccad:de1a with SMTP id d9443c01a7336-2b2d5a2c035mr18578115ad.30.1775796729989;
        Thu, 09 Apr 2026 21:52:09 -0700 (PDT)
X-Received: by 2002:a17:903:1a43:b0:2b0:ccad:de1a with SMTP id d9443c01a7336-2b2d5a2c035mr18577835ad.30.1775796729398;
        Thu, 09 Apr 2026 21:52:09 -0700 (PDT)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f08d1bsm13220155ad.54.2026.04.09.21.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 21:52:09 -0700 (PDT)
Message-ID: <2dfa4af5-d3c4-41ac-9762-0a9101f436ee@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 10:22:04 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: camcc: Make Titan GDSC a power domain of
 clock controller
To: Bryan O'Donoghue <bod.linux@nxsw.ie>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org>
 <20260331140142.892579-3-vladimir.zapolskiy@linaro.org>
 <70042f4f-c4ef-4185-b0c6-397d27164a32@nxsw.ie>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <70042f4f-c4ef-4185-b0c6-397d27164a32@nxsw.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA0MiBTYWx0ZWRfXzBrlo5R9X1uc
 P0/y7QMdG/2jTRuwEdm/3h1bmEpNF3KNCGlt+wJcGPAkWwucFX0MzkClJKhHf/bxbE6/oAwa7kc
 3SSXsktckezc+S4zURNrgYanMF5kt/EblYTxWezP5KBMsURboP/doyqTO1l3tICTFVA+0e14BEN
 LYqOktCLP1C2YLJSz/abLIAPV5gPoePrjBJUa6CMzV4IZzbaiOZxU8Yu0d8HX/UH43ltB1KjZzx
 RmB+54Si3KucXxr/eQ1yBWLhOV/66eaJgGmAqe5GQ+FJrYoCmMhLbqbyazdI/efQ7Z1jmAGV49P
 /wAuq9H/w/EVKXVaEB61CM+uAh/I9cLhiXsHy9JatweKTaODRRDJOcSJcLNra+OyiyUjAZNvO5b
 2SgGzaGZSnkXtuqEuA18opyoChV2F3ME3Op7+PTHEnRElE4TY03AY49Nac2Pmobj/kZQxLpGf+1
 DcicxNJ08SOjuXjQlAw==
X-Proofpoint-GUID: ntOQy6Bbh9V9an066FfJQwuvcP7lN7Ee
X-Proofpoint-ORIG-GUID: ntOQy6Bbh9V9an066FfJQwuvcP7lN7Ee
X-Authority-Analysis: v=2.4 cv=O7YJeh9W c=1 sm=1 tr=0 ts=69d881fb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=5Z1WaS1EQYwBqN5nsLcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100042



On 4/10/2026 12:03 AM, Bryan O'Donoghue wrote:
> On 31/03/2026 15:01, Vladimir Zapolskiy wrote:
>> +	.cc_gdsc = &cam_cc_titan_top_gdsc,
> 
> So.
> 
> You can represent this in one of two ways.
> 
> - By making the GDSC a depends of the sensor
>    Obviously a PITA to keep doing.
> 
> - By making the link from CAMCC to the GDSC
>    The question is, is it valid for CAMCC or indeed
>    any clock controller to be both a provider and
>    a consumer of the same power-domain.
> 
> The other question I have is; in this setup you have
> does the GDSC you've made a link to switch on/off as
> it should ? Have you checked ?
> 
> I think you can make the argument both ways.
> 
> - The sensor should consume the PD provided by the
>    controller - like CAMSS and CCI does.
> 
> or
> 
> - Lets optimise the representation of the dependencies
>    so that the consumers don't need to know about it.
> 
> The self-referential nature of the change seems a bit odd to me but, at 
> the same time, I find the over-representation of power dependencies like 
> pointless spinning of wheels too...
> 
> ---
> bod
> 

Since sensor driver is a consumer of camcc clocks, the associated power‑domain
for those camcc clocks also must be voted from the sensor(consumer) side,
rather than by marking camcc device as a consumer of its own GDSC. This also
ensures all sensor dependencies are accurately captured in sensor DT node & voted
from sensor driver.

The approach in this series also doesn't work on chipsets where use_rpm is not
set for camcc or for split camcc as mentioned in cover letter. So if sensor
driver is common across the chipsets, it would still require to vote on titan
top PD on chipsets where camcc is split or use_rpm is not set, so it is better
to vote titan top PD from sensor driver only across all the chipsets.

Thanks,
Jagadeesh



