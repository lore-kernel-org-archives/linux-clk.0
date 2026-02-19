Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07F5350A3F
	for <linux-clk@vger.kernel.org>; Thu, 19 Feb 2026 18:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771524676; cv=none; b=rFqrPQSjuowj65d5dz3LtWj42GIdkhkh+6wX92JSGVnJpycKKDEFIjDLVvygm4uWph4XqCoXXMsPyZERaIECp5MQWYJmhyDg6E8fFYQvUKJqhiRCdTc7XFQgFX1gYF09cVXDhW0vpiFjlcnidkzG9VpZS7itfbg1w5eYdEoFPYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771524676; c=relaxed/simple;
	bh=xvacaW1OysqWLNLZP3dNcuFwG95hURiYLwx+uhqifTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AoCE7fb0HWenJ8R0Xk20XDrQGdyX2yQGWav7BIMKz54VU6LarlN0qppCRiGEsmuiq14riIUvU3r3Tu1AbKSwmrYcUBhjmeplGk3nRK7bFIq+JDRerhP7ib0zsY4FTUHGTEiRevBgh7yWJmKUySm5ZVu3eA5YcWNMK0idgRQa/xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uh/6F4eP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S5vyEnZP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uh/6F4eP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S5vyEnZP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JCSAJ83077573
	for <linux-clk@vger.kernel.org>; Thu, 19 Feb 2026 18:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Li8aKO5Qa+Wo0IPQrn4AlzJySEcAv189KWIISoGMojo=; b=Uh/6F4ePWccrNfmM
	zo6aKP7rs7j6P7BaGFBUlOirMyBBy5CPoXzLbvDZl1vmH3msxUcDwLI7o0vCRaXl
	90QjhPmZ530rrMT0j0dO9ZQ5yc2Fa2N2VyUr0F7NuNt15yNhmgnZYppuRit+x+kK
	PZKmjMZBTeAmqqtqgoAysBNrYiDlP8FHfGdO7YTEfJwpRVydPKXvbJJA+yagR5DA
	zXGwzNWss5ZWCbvEUHnAb4aZsjECV5KOYOWHlnElH59WhIycPUsSEmI3QuN86OiR
	kGqTAHECycB1a+qf69QwZUXqsR7Psm5DpXn6HqDYWO/Zl2sSnrutq9DZrK9+N+Om
	gDawaw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdrk82h0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 19 Feb 2026 18:11:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a77040ede0so13733745ad.2
        for <linux-clk@vger.kernel.org>; Thu, 19 Feb 2026 10:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771524673; x=1772129473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Li8aKO5Qa+Wo0IPQrn4AlzJySEcAv189KWIISoGMojo=;
        b=S5vyEnZPI1tYyehtxyKDcAG78rLPe2AJk0JcBG4pgfH770+3nJWV1jQM2gy7jk40bM
         w1LhRtLBSOSyKrbm3JduFx2k4FU7mP9CkTg66BSk/5WuEJ3YgJoKOGV1Bwo4+vHt0N6I
         uGDT+40Z6oxs4/u0l45jmNx/WL7sNJCMeqX/7VzHMlwbMRb8PwGRBeJFioVYEWJt/1OY
         7rm6XpyLFpLhpJUf2YNEdz5v3L1DSTslHeOwtxqLyPtroFeIM1d0VSz1OnXxFpVLH8Lr
         re5GJbn+ewxENqUiEbJztwtx+o9j2PVCQmrHO0i4QsztTvpMHk1ZKw0+uaGsF+k+AQec
         92aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771524673; x=1772129473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Li8aKO5Qa+Wo0IPQrn4AlzJySEcAv189KWIISoGMojo=;
        b=UgCrUA0VAbZiJDB9hEsMYR+OlB0Q8x2KUAB41shNV32EDMWbOj+VHQG05giz3p/u68
         WdD/lTR/rYZKtSmtNeK3o2fXVvLgP+rk6BcddHXH0br3+t5xup/7GQzeb0xF0iei3HMw
         8nVnp7rsyywNUDUxlUyIaW4eWFHEoNTtH3xx04b85b85PT/rzYSSUQ7YoQ0cZmDaRcog
         fdiTiJkQ3v4bmOwuH+e38sP682QTMGZJS9pyBjuzIhANY7qx7cVzI4BOCll9MsUJPz9M
         HjZbX/hMlB8B2pupjkGafO52E4UXIJ0fIrXMQ3b62Uv5rL9xznYlAnigXCWDKwwXrAsN
         H6zQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNoVbmVQgk2z/lxw446lUGbZqXk5MEDi9tukC4lMx5TbkHQdnnJmO8AIYg7oWTUh9f6jCOojFd20s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGrcSW8YGSfenYwpWYrqACb4uEMcWuuxvusGM18Siyz2DvxB9z
	cZhvp7J9ocwFe1kpys85o9riTDVm6rlZOFTnGyHzDt+ZcvG8lsyB/V8R05MNQkskhD4rnJYD6g9
	JnEPfGtQE4YgVtelBWNNhAoxpZ/UYCS9o4jvnu60CPenQexP8ZztohBuROtDkWKE=
X-Gm-Gg: AZuq6aLRaEfjCkRP2ZE1C0NoC+1/HDTs54CiMGR9x0Ogglyv1+R4VTnwGcb9PXSdaFL
	cde7EDpI2uck3umqw6JUsyNATTZ3MTee/IdMsWsMtP3MwVpxWRW7ceZkR4KAOHzMelUpzzFOJYr
	zq46JoFgfELmfINg+qG3F52xWXpbdVQY54R051o3FR+3PlQTD/J/STDazucyNHxIl/MBkpNtNAx
	3ZZk22pGpMHhuDv+q90ARIayacaVtJQQ9WZ3U3Vex/Gr49Q5nTGcm03tvkyyTjvgtA3XtCHsSeJ
	/nlc/UM490+cnKpRpPZRJYQmLsu72lZ+C0GLU0ea0+XVFDEqYe0umIpIIxCZMENY8BV0eoDd7Hu
	nmSiLRYIgfTPJqSKX37AhB9fs02qGukBa5adPhmo09wsh/WFnbg2M
X-Received: by 2002:a17:903:3806:b0:2a3:628d:dbea with SMTP id d9443c01a7336-2ad50ed2f07mr51585405ad.24.1771524673265;
        Thu, 19 Feb 2026 10:11:13 -0800 (PST)
X-Received: by 2002:a17:903:3806:b0:2a3:628d:dbea with SMTP id d9443c01a7336-2ad50ed2f07mr51585215ad.24.1771524672780;
        Thu, 19 Feb 2026 10:11:12 -0800 (PST)
Received: from [192.168.0.103] ([49.206.59.3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a6f9d34sm171022145ad.11.2026.02.19.10.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 10:11:12 -0800 (PST)
Message-ID: <857f0582-8b46-4bfa-8c62-5ca6f3d0aec5@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 23:41:06 +0530
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
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-1-866f1965fef7@oss.qualcomm.com>
 <vbmo6qvepw5sjmtrffkdiaqulgqrhxlo3lrlzxhjz6i252efvg@uyhzdskc3jut>
 <wiztxwsea2aojcxmcs2q4vskooli7lrw3oio75bij54273mrbr@ody4vonry2qr>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <wiztxwsea2aojcxmcs2q4vskooli7lrw3oio75bij54273mrbr@ody4vonry2qr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aL1wpYjKQc_MdSN5oY6M6MbV944bK89x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE2NSBTYWx0ZWRfX4Ff7Y9keeFf9
 yZ6vdjRp99zFss9fiOuzY/viZjxm33YJ3TfYIs0pRjK8cFZijaLE5FLQU4K0lX+y2dIdGGXB+Xn
 gqHaw5B+x9XgPycm4f9u5NtFB3c6bF6kgMIJmT1vp/IGX4jdu9wOblIDQVax5kfsH4BFt8xlZBH
 9zr7+dzrzhOiKbTMltWG3xiO/Q5ycuAgaighRxHWupG58fCvrr177hIpvPYsjSWf6j0WgNwP+EC
 iNNPKIbKA6qZ6lTfGj8UMwby9BsAL0GFoo4sRnVkczXAFtRJQvh3dVy49WoGgifEDuMmpP2jKyU
 rUpMUid7yEuoOqv8dpBXm1qhcNvJP3KgsQ0wOemMbhqAIX9YfB4WYXL8bsyGeCSxa+rMYGs5J86
 1kNl6XtlHNizfSkaioN9KovCQjG0iO/K66q0JcvAnASyE7c6UqsUOwmPM8+DVNP3k19LJm40V1f
 kAbCo4MbwgySDsEGQfg==
X-Authority-Analysis: v=2.4 cv=MJBtWcZl c=1 sm=1 tr=0 ts=69975242 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=HeaAYArbXk87yN+lODdNzA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=3hJzyq8Zk_V8b2OfjNkA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: aL1wpYjKQc_MdSN5oY6M6MbV944bK89x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190165



On 2/18/2026 9:28 PM, Dmitry Baryshkov wrote:
> On Wed, Feb 18, 2026 at 08:49:34AM -0600, Bjorn Andersson wrote:
>> On Tue, Feb 17, 2026 at 11:20:42PM +0200, Dmitry Baryshkov wrote:
>>> Since the commit 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds
>>> on until late_initcall_sync") setting of the display clocks is partially
>>> broken. For example, when on SDM845-HDK the bootloader leaves display
>>> enabled, later the kernel can't set up DSI clocks, ending up with the
>>> broken display, blinking blue.
>>
>> This describes how the problem manifest itself. Can you please document
>> why clocks are partially broken and how that relate to the GDSC state,
>> and why setting GENPD_FLAG_NO_STAY_ON solves this?
> 
> Probably the best answer (for the second part of the question): I don't
> know (yet).
> 

RCG update typically gets stuck if the new/old source is OFF while the RCG is ON; but
if the RCG is already OFF, the update proceeds safely even if new/old source is OFF.

A possible theory is that if the GDSC is in OFF state, the branch clocks will be OFF,
due to this RCG also will be in OFF state, preventing the update stuck issue even if
the new/old source is OFF. But, if the GDSC remains on until sync_state, the branches
and RCG likely stays ON, leading to update stuck issue if the new/old source is OFF.

Ideally, if both old and new RCG sources are ON during the update configuration, the
update should succeed regardless of the GDSC status.

Thanks,
Jagadeesh

