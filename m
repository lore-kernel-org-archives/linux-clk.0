Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537773B3C17
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 09:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910502; cv=none; b=QQaY1VmJjlWhShtTL3yHJ+ASNWCEKrM3KchI+NUtcGH12LZsDb4P1C8yvJ5a5BVNTVVpQlJG3+rDlkx4b6luATgvGF6CvST3qAfJtcwZUhINHbrlDkuzDSDMShSkGXOmsddE8cm1zguRJEo2N7A37hnmwLXtUncy/D6JtbWWoyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910502; c=relaxed/simple;
	bh=/bF39d1NIuczfJ3IZUCdW7MiQjF0yS3eUlRvpoHWi94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=li+pUuTjtjQooEieAHfcoy8/f+hstUB3PvUNShRFQu7YSjUdjY9dkJNkqckI8csx7iuYKHsjuPx4fMFKpIztfKm761dzE/1DcaVwaDz3iKtsznYVAN4YdrLdKK9vIs76+Latu3Wgw0EawJbFhhFshchZ7aixYpDoxKn0H4ETvQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TkWkBUxQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PWt2R0RL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TkWkBUxQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PWt2R0RL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OkDn2347139
	for <linux-clk@vger.kernel.org>; Mon, 8 Jun 2026 09:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c3Qo/8d4aE/Bw4GAlPbSk79wc0v9MrjJB8silbnrFxA=; b=TkWkBUxQel2vcd/5
	t4JgxiOvkIZyvRHdd2w8RhIbIWb/euyIcdrjprZpWBMHUIUyZH67IADt+yyWdoKG
	h0vO67PhllfDR8JUV/9uWR+uxNj6SZFYWK95H07ODfGlpAc9js73W36Ce1bTgj7P
	/UJeBw1pO1YnvJTaO1qXBRdxJOx+U23YCvymKqrzCYdE/ieT3ZftAFBpXi4aaEZ6
	/Q3aJAWce4rRG9fJCj0kbP6BO0OKQPxo4gnoxFEZMc1kiFN8oCN7rFpJK1BejuiF
	7WTza2TTAYG74Nur0ww8ItPRZuwURG8WRU09j+EehdEmP3Y1ZY/0mP7iGTY4zbvw
	f9KKmA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagrfarh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 09:21:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915a547f4b3so105001985a.3
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 02:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780910499; x=1781515299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c3Qo/8d4aE/Bw4GAlPbSk79wc0v9MrjJB8silbnrFxA=;
        b=PWt2R0RLGxqq34mdugjjn3uH/YnU3C1TWIJIYhbY33qWHXThDs1X5qgBAtIeRWJAEM
         5ovpCTmYgCupTySXCfH3gG6jnWNW2i7YR02vDdDmomkEqzyqA+isgvaqKwvVFg3E2jzg
         /CI3QRcL70bayRe9YQsxICl1r32DY/XuBHcUYsAJsOBKlUJMj4d+dILQn9djGM6gkTQd
         pk9fo6Pl2aG4IWwqhCPYMLoBDNxCkFzjddhjmnVQik/yslAbLl58gnow1fOvguY4i4sm
         R77ReHI1N7SV9sE51V5It8/kyTqXf15fP5w2QzaSyKTfZsOAV2IlXz06wfyg+YiVIB/O
         mocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780910499; x=1781515299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3Qo/8d4aE/Bw4GAlPbSk79wc0v9MrjJB8silbnrFxA=;
        b=NgzPYzrAOfzc5su50dv71pwKPiL+6JnZw91tfMsVcMPy3t8FaKXjAATQSWAH6YJ0uO
         A0R1mSNrfXY2a3QDxGgVCwfKcxW1HK7+1QPz9vDejhIDP75Aw8AbwA4H2vGPAfcNhOTT
         K3gM2Wf7jg+VfurMHaSr9zBV5syCchrn0YxUg6TEsWGf2rNZCn5nCVe2powEmWLRHpiz
         pJRe4dBvjsvZmN55vDLACz4fB5gzMCXJe+hEFDQg1jwRfQN79LGmR8x8TfkX86a2gDDO
         u9niJNQlKksjzO/A03Yhgs2HRJQ2CcxVaX7cS/6FwjzGhRMCu0xJZn3Vw0OnTK4CpbCr
         nVfQ==
X-Forwarded-Encrypted: i=1; AFNElJ8sgBSANIaXSFf6cEU3Omz0k/dSyoE7tRhFM202K514BTjE7iHQMx+gOrL7uWZrOIoRpOmeVcDVNiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWi+cWU/ZTGENrrCJEUfPeYSzAw+qaAUcXQ4WFj2PRaU9maFDp
	fdo6LqFUkzMgyxr2X9r4qnXy6qHUE6GOL7bXmar80KljxnOdk9qMJuDNT9IUFOhGJxuYY5lUYHT
	ZB4j5+afnayLMdHfJIEWIo4zhikvN8BscQcH2WJYwjdkIyDc3W9WI9LbKC6nqrsg=
X-Gm-Gg: Acq92OHH53BnRUWGt4WgR2X9nObQObMpwT5/12GMQu4t/4w7PWxVVamzIV1YPuXZyUO
	bY/dz88x26b3XEFr/WasqU9qOgfRzJpVYNV5nKcDVlG1LjectV8Ulj/tDBTJvcTP3YR5mrfyTOQ
	HUXI6jgY+I7C2BWtmUeJRdoXm8I4oq1yDDuxSEapP/4MB+38spJuYb68NM+yMbtr+9FVZHUYh0E
	e6k2ePXYrZDLi62dMAzVs98elNZ+8LbQiSS1PlfermlyYfXCM6xGtzjr7DFskOTJUELJ8EapnE6
	i5TW6qXsOpSLTj+sHCr3cSC+MfFXR764W3TbJvcWP2PL/SXNlqbDeswWP8wqWJqQ3oXIXDcs11O
	7CatM4lyWT7fRspuiJbH8FmIm7uQ7mErQgaTrqkBAtU4ZlPpsZU3lGaAI
X-Received: by 2002:a05:620a:4153:b0:915:7dd2:f855 with SMTP id af79cd13be357-915a9e16827mr1242566385a.7.1780910499607;
        Mon, 08 Jun 2026 02:21:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4153:b0:915:7dd2:f855 with SMTP id af79cd13be357-915a9e16827mr1242563685a.7.1780910499171;
        Mon, 08 Jun 2026 02:21:39 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64c2f34asm7139892a12.4.2026.06.08.02.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:21:38 -0700 (PDT)
Message-ID: <1ab6db68-3347-4555-8ce4-108c4ac01438@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:21:36 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: qcom: gdsc: add RPM_ALWAYS_ON flag
To: Herman van Hazendonk <github.com@herrie.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260606-submit-clk-gdsc-msm8x60-legacy-v2-0-187a32d2f015@herrie.org>
 <20260606-submit-clk-gdsc-msm8x60-legacy-v2-2-187a32d2f015@herrie.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260606-submit-clk-gdsc-msm8x60-legacy-v2-2-187a32d2f015@herrie.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4NiBTYWx0ZWRfX+iNj7ogb6m0B
 ff8wdLdrVZKNQAJ3sDij+ZlpT7oTiNZ/3XiW2GLQYQHgA3FOt7uKlGWVnpbJ2UP5h8E7TDhTCmw
 GsgzYe7kyDcAT8Vr6wZz9KjVqh+HtGw2kTgifbT4MDc+B+uD6tyorQ2n9Ot5Sawg2JWz22lxRH9
 GK4PnzRaFDt5PqycS4fnVToplb4awlbV9B79/E/HMgzR/dezWA1glUTznfsjv0BgDoPzxY5G/U4
 +hRkThzAYRRzGiF/f+mUntJexMmlOv32ysvOEPewiilHpuHeckzuNpxS8rDc1AKn5eCep9N4Hbh
 WkV2AHoaudrn2fGyM4tfT9ePw/UbXPQnCVSNQ494rC/vE8fAEw3yIXYNHIAem+JETqLap63AS/c
 IBjnbD9Tn9ZRvnxWnD6gEGGIQSuswwZcfUDFl/oKpIZyMQBJSxDAMPqSHzWss/213YPdiRyOdqy
 Xu9OFyW4j11siADrl6A==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a2689a4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=1DhR-0cvEugVRngfOrQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: A9SKq3PtNyrRMIraDnxjpxzccSQf8P7r
X-Proofpoint-GUID: A9SKq3PtNyrRMIraDnxjpxzccSQf8P7r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080086

On 6/6/26 2:34 PM, Herman van Hazendonk wrote:
> Some power domains need to stay powered across runtime PM even though
> their clocks may still gate, and only collapse on full system suspend.
> Add an RPM_ALWAYS_ON flag that maps to the existing
> GENPD_FLAG_RPM_ALWAYS_ON on the underlying generic_pm_domain.
> 
> This is distinct from the existing ALWAYS_ON flag (which keeps the
> domain permanently enabled and prevents collapse even during system
> suspend) and from leaving the flag unset (which allows the domain to
> collapse on every runtime-idle transition).
> 
> GENPD_FLAG_RPM_ALWAYS_ON, like GENPD_FLAG_ALWAYS_ON, requires the
> underlying genpd to be in the ON state at pm_genpd_init() time --
> the framework rejects registration otherwise. Fold RPM_ALWAYS_ON
> into the gdsc_init() block that already force-enables ALWAYS_ON
> GDSCs found powered down at sync time so the flag combination is
> honoured consistently.
> 
> The first user is the upcoming MSM8x60 MMCC driver, which needs
> RPM_ALWAYS_ON on the a2xx (Adreno 220) GFX3D footswitch: cold-cycling
> the GPU rail on every runtime idle forces an a2xx_hw_init microcode
> reload whose MMIO burst can stall the shared MMSS AXI fabric when it
> coincides with an MDP display client-switch underrun, hard-hanging
> the SoC. Letting the rail stay up during runtime PM (clocks still
> gate, idle power is still saved) and only collapsing on system
> suspend avoids the corner case while still allowing full power-down
> during deep sleep.

Is this something that downstream works around, or is that observed
behavior with upstream?

Konrad
