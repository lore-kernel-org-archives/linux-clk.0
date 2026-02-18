Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E452515539A
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 08:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771402242; cv=none; b=T/rZ7/mQSqILYLpW9+MlkY2PTb5l7BxfkYxaOPnwxSKFYcTMrAsm6ltstL6MMaoU7ZGkXB1EY8yQ/++NzxuM9fUcL07ga78Ip64rCitBISxQZu3gL6/kKg33yITEGzcc7yaAL6lxDGChsCy9iD0nVeez5DE4nbQ33KoYAbjLpHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771402242; c=relaxed/simple;
	bh=Err06cI9A8cmp7W/yEr4Eiky0ENIlrafddFO8T8QR60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k7hg/7Q7fUCpnvgWYdscWFr7QuXvyHZqgyEDpIbZ8/MirWsKb90e4Ly177SLPM3Ax/NP2/1L8aCDLsjVuLrlUGo+pozWjIkYDiofQGaW+3qi+1PCumchdxpbold3ToV2hYFs1+XPaEMouDzyesbfu1u5u6ahhw4ITNu0cT4dN+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hNSI7C7b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g+E+mWHK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hNSI7C7b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g+E+mWHK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HKqeg42784643
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 08:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	siPTfIpr0X+b4BPnmwKJXOp0UawvD9fi3Yr1tF/ZDAQ=; b=hNSI7C7bOQTDtqmc
	mF8oeHzIDri/qkGIwp988yIh+EUczdw7qHWHFynZabKC4HBPIf+753p30QkkQ9/L
	48ILzm+IZJinoUGOQUaSzXWXyKyijS6yOezc7cBSVJSaJKus5FMNmb/dOnkBQfqz
	bUtQM1otoMyjNeAsBUb26KqU9TeiwL5ElvxMVmgku3BR9a+eeGjY1ff/d+b14czZ
	oG8yeC6O0efm+QOFog9/eOfFsp69pzY+FseDQ/qJidJRJ1lef+saPWXovMLEQSQ0
	x0xIFi99rC8c+AONVTUE0CBj76aDSYJZd/HngoKaViDQqcKvyWD4vyNOq5Mci6+1
	FnfHVQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccyrk1ebu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 08:10:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35464d7c539so4855691a91.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 00:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771402238; x=1772007038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=siPTfIpr0X+b4BPnmwKJXOp0UawvD9fi3Yr1tF/ZDAQ=;
        b=g+E+mWHK1iiXE9t9N6f3LY5gNIk192UuaJAbSoh+5ZhmNvVLUjPykHvy/3vA6WpfES
         e0uki60KWWRJMwL1n25da8F5939YSN0WKC0tTOu/Csg+jISszxxwaJbL5R/N68LFprSo
         KrOzZEkXYV7RXYuBfiNVyZYLcpJWqdc8GlvlrJrRqgqi9wKImk4Aok2Ki02uCkfUUDKi
         xt7iD4I0Is1HLZlmS/eMBu2zuTs9TTBRV1MPtrkS/3ZQO3FUsLYgGgM4TpdSsUuOtkMa
         3L9+OSqfc303wqfoPUqEE6vzbjD3cClcRpP4MrVnnsb1/kfzHQTUuopfqSjdsZ42PYbX
         GJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771402238; x=1772007038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=siPTfIpr0X+b4BPnmwKJXOp0UawvD9fi3Yr1tF/ZDAQ=;
        b=po3bO1b4Edm6A39y4IZPYokAOYtPEXXFSz/H6YvbB989cmzL8UsVvSuywyLECFxnrT
         U+Fdy4vkr/Su9zrM9NkHbXHhtyQPVTS0oqOKr7SyKB1/AjM/+1RxfyMfdCgq1ZO0DvJ2
         WyTcWap0m0M4rVU96rAZECjZCzlhzA5tac8PcliFW5r77SA6d2Kr9yHHCoC79iJrN4nE
         OU/HZAKEBdOeypM1ZAZAWx7trZtXyYWIP12S8VX5aKieXxC/c1JlHckthoIZ4IT8tfbb
         FLiTdK33ADvgMEEb7mWMc1vvSVys9J/cspONMn/SCqcyU7i9+W77CPO+dZwLuYX9LFBd
         s/PQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6hGOAQp96PVggbxjh+rq990TS8Cpq7OcC3JZsIjN3eKRmfmMuoWR5gDrVUQTWJk3BQNnzmhGMXks=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ2nfT1Owzk70Tut/UnH1BKoVsvPytVVYW4pMfIQ3ptBPZT0JG
	XS1e04gnF2K8JbCa0/vRrEuzlPQS1z7vkBNkAwF3JEZ3/Pcp+NOOf/PncfNDiis84tU+5FgouEP
	ztVxPP5g0VmShRUeYGBzLC0+gity4OcHdepKqfQJVzwc1yYsDZXrrrxaE/4XmMzg=
X-Gm-Gg: AZuq6aIcFtMFNHE4e7oVY6jcHik8Bpz3WII8TElEc0LOsuw8cPmDukz0JOZnlArJ3QJ
	Rpf78YcgMTM8GFA91bBVlMQ0xMsieqJ82HnTKwfzgqPVEVej8f8NkUc7ftZzb2FLmujB/FST9f8
	xv8L2ICJSYeLrFI7fGKdxcwFbn8aL5p9NxeaoMSzEOYhJcrP1FuaKiuXunnZ7enOi4FAKqJ5Flh
	SKVqIzV5JtYCyEInKK7UdPgIOQZdKaWZbMJZIbuApuIQiJY5t14qUyP3TgmIgcl+CPOeW0glrDk
	B82bJeGvJAJOy9nJbxjpTbo7ix6McOl8AtM1RlH1JqPUNkLS/FPdrRKIpEnJSDvq8MQkdUlvNBG
	ILVtzOtz4Rlablq1xIWB16sKGAA2RWWvNnkbmNPLkLP90ul3IOw==
X-Received: by 2002:a17:90b:4cc4:b0:352:bdcd:118a with SMTP id 98e67ed59e1d1-35844f9bd19mr11605214a91.21.1771402238402;
        Wed, 18 Feb 2026 00:10:38 -0800 (PST)
X-Received: by 2002:a17:90b:4cc4:b0:352:bdcd:118a with SMTP id 98e67ed59e1d1-35844f9bd19mr11605208a91.21.1771402237910;
        Wed, 18 Feb 2026 00:10:37 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662e6cc17sm25305883a91.5.2026.02.18.00.10.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 00:10:37 -0800 (PST)
Message-ID: <1dcb4fbc-3b1d-412f-8801-3a25d192401f@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 13:40:31 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: dispcc-sdm845: set GENPD_FLAG_NO_STAY_ON
 flag for MDSS domain
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        stable@vger.kernel.org
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-1-866f1965fef7@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260217-sdm845-hdk-v1-1-866f1965fef7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0xFQB7cDdIpGjpmK8F0sXcFZ-B7m7VuU
X-Proofpoint-ORIG-GUID: 0xFQB7cDdIpGjpmK8F0sXcFZ-B7m7VuU
X-Authority-Analysis: v=2.4 cv=eOweTXp1 c=1 sm=1 tr=0 ts=699573ff cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=jdCBXw2rLYaCttYT0gUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA3MCBTYWx0ZWRfX6N5NKBYxLeh9
 jOU0W1YzEdrFxNwRaXr9O7wtN+1xAIvgD1WqLq+b/fQzqFO87lJwl/4hBX498vq9r0Eyzo11+t9
 jWPmNTEDkbzxFKx1d84zX3HeGxLgaO3+tk/ihB4Mb2blbK33NdRjXG0wNWCpbEgMQj2eEC4UuSs
 MsH/sIEbvLxLfR7Qm00CMaQ0GbomTEOww8FxF0OvIz2t2HAvxjt9FmcqsLgpO+7BM7n1iO2qEGk
 002hBSmcOPQmyvxcrzvIXBFZFZ4mlARQLuFzT6KbO6W9sO2hmkkjocilBZrA04EvK/pA4YERoCY
 j5yJB3o1Q0XGCLvcz4pFNFbv5YDKWl9EAgh01lD6GY4ax/tVUIVTa0DRdd++foBRlzpvA8TO92n
 /dimyWRD7eaEe526Qe97bA6pY/TocpxnH+X6scIAbbhmb2NuCGHSkBLnDcDOvU2z/3RPJjLnw3s
 uu9jFMhUDpDPuxXYWgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_04,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180070



On 2/18/2026 2:50 AM, Dmitry Baryshkov wrote:
> drivers/clk/qcom/dispcc-sdm845.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
> index 78e43f6d7502..468b30497746 100644
> --- a/drivers/clk/qcom/dispcc-sdm845.c
> +++ b/drivers/clk/qcom/dispcc-sdm845.c
> @@ -763,6 +763,7 @@ static struct gdsc mdss_gdsc = {
>  	.en_rest_wait_val = 0x5,
>  	.pd = {
>  		.name = "mdss_gdsc",
> +		.flags = GENPD_FLAG_NO_STAY_ON,
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
>  	.flags = HW_CTRL | POLL_CFG_GDSCR,


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

