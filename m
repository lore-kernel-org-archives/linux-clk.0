Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08DB3AD51C
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 09:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910843; cv=none; b=UTb0bltu6UZegwMkJMayjx7VJKtZ+GeChn1rcJxqnFXpLIbpwQ3fAGXp1cqhPT+0psUD6sSDniF5aqi/StA50OzkcCP+Fv0gHq1yrUmHw7yI60G9WOukPHNMJoAYQqyBLgUQbr8tnxZbosdPnfXE+GWfILJQwJ/EuptqGSgjfi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910843; c=relaxed/simple;
	bh=vtqs9b/nCTg7Jdo+I3HvK36EwG+bfIQaRz9HpBO/Mxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CADmCKpSCxA1StCHiHbZ6N5NreY+85fx8uGF4+2+aTeF3MyzXPmtvimFg104aLeyEjqEyIOK7pdvO41tOxfeMiBL1J6aa5b2YsREphVZwvhuBbILOOhDW4Y4VJiJpK4qZhDIYMozdhdCbEuG4srvrEayPBTOohSR9rHqo+2jkQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O99SheKv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pc2BvqTo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O99SheKv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pc2BvqTo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OreM2274533
	for <linux-clk@vger.kernel.org>; Mon, 8 Jun 2026 09:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kX85k3rL3r+ScToe/ZghRHldTzTEj8XiK57rN6oEbXQ=; b=O99SheKv6wdWPUQx
	8Hvzl9CQmZSlsGs2FaOdVl/1YOHJKpOilALJIbnsY15QRzVeU+1gKQEjVTrAXCJF
	p3xFJ1IK5Op6wR8aG0UZd+XBY1Jz/Es60XfaEtBk072o5ZlAYc5WqwAQnnC5GKRj
	CR9xNgud38JkUXb6q8mPW9ApZCdqT4qOU4gk9NBZGY8Bh3gYKMN3oxBFX9zVcgmz
	v/jxDaLQ8N4Y/HmZdhzSN9VRWzINz4D+ZvtNzVrNrWbW9zmLnajsHwG3sBGUcdVR
	Ljs6vULYodnRPTZXfi4BWHTCnsTyB3qQys3KNJp9mbBxCG23ZlMsJrbIRaozfTMG
	4KY9Ag==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgxsjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 09:27:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517bdeceb54so1237601cf.2
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 02:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780910840; x=1781515640; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kX85k3rL3r+ScToe/ZghRHldTzTEj8XiK57rN6oEbXQ=;
        b=Pc2BvqTohvoEJNr2NfYN/zioQzt8aEXpMXVL/uep8yhiK+mn+GVTC4E4Ziw9j2AHcC
         DQdyB55k8LUQgW0bLCNRt4PDx6Gs5wiJ51jJgbZNtQsZW5dwfJTO2gXWKOmNO6tk89W/
         ulvQTdEWTOfWzYNY/zyMCgcY456MWq9faLdueT12/y1HUc/0ifLAnB9a6917YpyeU0GK
         Ckn+26xTkVK8ONrY43Hfr7AvUMwxQst2uekual1Yv0Xwt4mSF0ThPJZdqsyBk3j5DH3f
         AZAJ6Ulfk9S//eec0PqE0grHGkX3yWM5ONK110uNMDxM3R+t7x70Yyoy1zfg8guuVrbM
         pCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780910840; x=1781515640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kX85k3rL3r+ScToe/ZghRHldTzTEj8XiK57rN6oEbXQ=;
        b=sTaWzhs7SzLL3oVhqCgSCQoya+hyskrQ8f5Vx8YC9vdIu+99iOX86HeDYqZesxCN8U
         1qFW3OxO+LtHdT6bIratT/0YaiajfES3/N9iw7fSWD0biidwDbn4VWxS0mWXsqpfFI/f
         coIr3xuEvujVnMr0Df0prCIOZp+lGU2hn2t4zm92h1q0cTy7HdF3ltH+tp6jnf5U/IRl
         /YvMlT5NIezPJWUHWReR4W/4Dd4LXNi4MQ6RWkzQ51UbBs88rAe32cFSEwzzeMyH9LT5
         ibuOSBUTMHJyzpTqQ+L0Qyp+q455S5xmhjFajhCAniwDDMMIeZHOLIHuXlYUoBGFJ+D8
         BPWw==
X-Forwarded-Encrypted: i=1; AFNElJ/LbyXqowlM+lpd3+JSmkXAkI8HlxH/DmoRKuAvOilTwkpHXRvgmI/UI6x6Pzutq33KdWphr/LAciM=@vger.kernel.org
X-Gm-Message-State: AOJu0YySFMuilAa1GQKtThN8TqOpcEucMoe/X9YNFNKnFJqZxK0T6Dy0
	1Rp7Af+J4jODo+bjhAu1cAfdx3bcVNuimDkMgpMZ2CTAfRUIGBphOquweB23ZGygmsWnXIcXgFE
	PK5dIulaTK5xWpYnJGzSmkzTJvRC5MsHGOMuY0KHrr6NrPgrhA/tbO1x4/NtUBGs=
X-Gm-Gg: Acq92OEn+21eu07V+t3sFx3ajlzqLnFmnm5FtXyN9+8wKYyPOd7LgP3Z2RIQk6SRVfn
	9rK/AH2N4nX/GhVYq2islvzGL02BGXHlIvkHmNw8HbAchccUmXezObUEw0v+nXTiOOzCOMHGSTF
	xShlCSNpIgmLY/xGwJl3ryBX0kC0Gxr70Wh+EJ2uP1HeDTXci3ZQ8JPOteafjDEtYIR3hysQqC3
	OYsv69BRgcr0pnS0+MQXD6xuM+DC2lPTsdMnoDimF9bhtiUihAOJFC7q5rW2Tb3Ho6RxTMzsVuD
	V3NQGKfMyHQtJNyCDFL8kuKFEgzZgQvTIP0CvdyCo8PTpEAd8y8o2xD4wjGW1mFgHSgA7zK93MB
	oylO6bzbbAA5MzlhpuPpLSjkQAVqctPhHpbAoe8S8w8Dafn+4akQR3M3q
X-Received: by 2002:a05:622a:120b:b0:50d:9138:3322 with SMTP id d75a77b69052e-51795bebe2dmr138740101cf.7.1780910840326;
        Mon, 08 Jun 2026 02:27:20 -0700 (PDT)
X-Received: by 2002:a05:622a:120b:b0:50d:9138:3322 with SMTP id d75a77b69052e-51795bebe2dmr138739871cf.7.1780910839954;
        Mon, 08 Jun 2026 02:27:19 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054dfe3aesm841409866b.37.2026.06.08.02.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:27:19 -0700 (PDT)
Message-ID: <77797477-a6dd-4704-b441-b39b0a3c5e5d@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:27:17 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] clk: qcom: lcc-msm8960: check
 regmap_read/regmap_write return values in probe
To: Herman van Hazendonk <github.com@herrie.org>, sboyd@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602045002.290918-1-github.com@herrie.org>
 <20260602045002.290918-2-github.com@herrie.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602045002.290918-2-github.com@herrie.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a268af9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=cTwmTnRGAAAA:8 a=Ut5rIDj74-HqtMDnOCEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-GUID: hKUnpl5zF09pTnZPBOQu06pAjDkBQlJ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4NyBTYWx0ZWRfX5j+DzgfQPT6B
 sm9PfWbDX+LTmz9HxQ4IiIcRbF+OyQejqEQF/tZTbCaTMm2trpULW7LemBiaefP7jDZb/l/v+F1
 VjLBaaD32AdDrTWwuQnNYBq6WSBbkUVEfGODbfoYzXQTUUi/KKn5/q4lKiXZBSNU4E50tM/QOoq
 0H0zF0LlT2GniZYvsnPOFF9zdnWvQmF2Z42fNVaDhhpLOG3qI7tNkYOoQ+BtVqn0rhnXt9UcDsH
 oG5tgaHngik1vZ13+zUgVCqCzb0i4yeouHi6OOyZRTV4zZOz7NDx2Xc4ojDgHiS7MBR5LJLZ/pp
 Gsnw8FdCW2zmd71csaq5VWqJt6jbacMjRPvtg5IzLXiald00LcHS0UUGuBhgVDvBoAUimAX3dP2
 FIG6IoZREtm/4DZYWxwhNJzdOfiDOvJolkCaTO0a4kwR3MuQ/S8mPLZVsELy8hsDR+Bw9rfa+yL
 6fZK/Ecwnmj+22znW5Q==
X-Proofpoint-ORIG-GUID: hKUnpl5zF09pTnZPBOQu06pAjDkBQlJ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080087

On 6/2/26 6:49 AM, Herman van Hazendonk wrote:
> The PLL4 L-register read in probe was used to select between the 393 MHz
> and 492 MHz frequency plans without checking whether the underlying
> regmap operation succeeded; a silent failure would leave the rcg
> structures pointing at whatever default they had at startup (the 393
> MHz plan) and the chosen plan could be wrong for the running PLL,
> producing incorrect audio clock rates without any diagnostic.
> 
> The unconditional write to register 0xc4 that arms the LPASS Primary
> PLL mux on PLL4 had the same problem: a bus-level failure would leave
> the mux at its default (PXO) and every downstream LCC clock would be
> sourced from the wrong parent without a warning.
> 
> Use dev_err_probe() in both spots so the error is surfaced (and the
> deferred-probe state machine handles the EPROBE_DEFER-from-bus-arbiter
> case correctly) and the driver does not bind in a known-bad
> configuration.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---

Can this happen in practice?

LCC seems to be a device on the MMIO bus..

Konrad
