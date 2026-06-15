Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A8040DFA5
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 16:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781541427; cv=none; b=h22OT4cuOcxg8hTc9rLLZIWURcuwGmAOEqTZ5Q5B2c8zbeJ6vrNVAfCQgCLbrT6OokCGj/PXp7rWirfgcAnjdYYkF6yYGH7agK+h5KvyMmALaIFTB0pPCC6Ffgbc9f9oOqTQVFA6FwguYYafjFWo/Mw6IiRHKZo7CJdHufZOP0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781541427; c=relaxed/simple;
	bh=KnykR2/mt0PbIfgCIqYRR5r7ZR1BPAjruV/C8RjstuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bbd5sw9dPzQifcnBAmLdh0nSzmBSYTM47IwfGnszXwLCXPZm7fcD4YTyEz/2MUmpk90fiaapGLgE98ujNqWnRDQC+hCCWpCT0qWY9N+UXPzrkVwzfwfMTfqKbpjviHQueAEkIeyQaXsy+taT8vsiFfYSUv59gcXP/XscoGm4Da0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CNzfNWdL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SEd2JXIG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CNzfNWdL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SEd2JXIG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFha5w805514
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 16:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KnykR2/mt0PbIfgCIqYRR5r7ZR1BPAjruV/C8RjstuM=; b=CNzfNWdLFeOBft8G
	6RLKBJr3sUtBissZqf9ACDDSX2oJquHsSzZzhSawwh0KJgR8YubRmJIRKt/Su7o5
	+RFxUw4QGlNyAbD6QYBz0EqeuExx7NP5IA8dr1v2li8AOH7UrfhFeg+JPgspe2VW
	sKoRog1cUd4sPVtN9I3lVd2hXSfdf7Rpm9mleB/8SF4LPrjHSuUmikW1xedAjlzL
	zcWOaAi5l1VOqltcAvfWJ/dLHktXBMHfy1l/8Q8zHa1tk4ycGk3wsyBGL6NLS74p
	JJH7yj95hSVt8Nr1aBqirgNDDrzLlbdb+M/V702pV0yW2orXK5BSS4TesDRx9GZg
	bVk35A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetf1scv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 16:37:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915a547f4b3so32986985a.3
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 09:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781541424; x=1782146224; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KnykR2/mt0PbIfgCIqYRR5r7ZR1BPAjruV/C8RjstuM=;
        b=SEd2JXIG1PAEq0WeNeZPKl3+vtSFLeHot2B7R6V+Zk+V7hn4t1K7EpLkb5QUJ2GU09
         qACaN3OyIBaNFP1mMiZ0Oz89we3l7sdzKOo86aDbP4u3Py68AV9w0pnLvf2raRIPUuxX
         ID3ycYtkFDdAiNqTI20luK/uc9Dy2c1egDAl/b4H+N9GE0CAVUtqpPHtyE/hNnL3T9/5
         UAuFhI1/PdzDO23CtOlL6JKOx09ZI5Z8aKI5V4IWSbSH6+0IUFXcyQGuaLDiMfu717jq
         qRPb6TnW9Gab7IkwEroSL7FYS6a6g0JF/k+wdnBR9Mv9yHLH5g4P4qoBQ9MUjkMe/K6N
         +d/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781541424; x=1782146224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KnykR2/mt0PbIfgCIqYRR5r7ZR1BPAjruV/C8RjstuM=;
        b=emf5MQH/9EkHImfMPHuwx+V1xuTZe5hfituYqtMpjJ5FPHzAA7Repgypmyu2ykq/Ae
         BuuSAxVjVOJMixc1Y7juPooQEK+uYuX4ahlaYGZv7RwwQDPaAWSIfj8GcH5ue9DoNkye
         pdBsI2WJCLZstqxuKZG+/+bwOKi5m7wckJUixGdro0lmW5rye3c0Y0gxxbFT1V5MUvX3
         X5SaxgKV8leBC1/ggq2LEX/ERNxrE7qGn+U5Lyk9Gnsgf1utjlcKnJpvhFj3GRqOj4kU
         gFnOPavO4pKUQtdt5LtOuOESNHtNGzCbNsV+mdmyB9HpoJHTGTEhhSW1p/5x4fyp0+hU
         h6JQ==
X-Forwarded-Encrypted: i=1; AFNElJ/x7nZkh5ZUyuoOzMkuQYzWOM4xMz+s2hVDoGl22fCesF/qIE/JxuIMXXDgJOF7D7S8obfAxdLchUY=@vger.kernel.org
X-Gm-Message-State: AOJu0YztU5Tc8R0vUarrKZiTLdkaPSMt8W1q1cwTFyrrcMJ/Z1xYSOC+
	Za1NpWMiK176JcN5X31BtjQepgosVcTX19793tq9bKdno6oO9NV/E5duEB/f648Om7aX5guu8QZ
	zDk41XezLmc+JjI3mjNvNTbiq+l/sSmaoXiGT283KYKHPIHtSRiNn9WlyKALeb2Hl41m8CTI=
X-Gm-Gg: Acq92OFRgem+yQn4E56vtn9yI/nQpkSKJFUc3mevnaPSyzbwDFb1z8WNbPGy4Ws887Z
	b62xC39YkDYILUrViYnRWVzZmR5HCLUWy3Qz4kvLXvwANatNhV1190bqutXhrQIWyjvyGAVJh19
	1Wmqsmm1jISbq9m3SfnHQ/yve3n40h/K9gSSRRpf9g8eWOIP+/Aq6DVywQ+jEIq5IiCfWzVwdHP
	g1Rs5zJVi++nMNTo7ts5AYtilK7xAaJJAeFrL3q5Nl4mjHhhpfMy5yo51otVGVPfTKulQAJzyMd
	LRKOvwg+ZyredrwoeNfeDBNAg8SA3lbJK5i8W+XjOWjegE9DT4jWizBdOLfQJ6E0TNHFRBg0MeO
	NXPoaL0iyEVP16vutJHuDKqheeYWBSd9ny1PbPao7sbeV8g==
X-Received: by 2002:a05:620a:1a20:b0:915:fad5:9096 with SMTP id af79cd13be357-9161bcd5533mr1337894885a.7.1781541424082;
        Mon, 15 Jun 2026 09:37:04 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:915:fad5:9096 with SMTP id af79cd13be357-9161bcd5533mr1337890685a.7.1781541423607;
        Mon, 15 Jun 2026 09:37:03 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937919b556sm3774679a12.4.2026.06.15.09.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 09:37:01 -0700 (PDT)
Message-ID: <b51b4d7e-fdea-4793-9007-c9e3ee922f70@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 18:36:59 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: gcc-msm8660: register CE2 H clock
To: Herman van Hazendonk <github.com@herrie.org>, sboyd@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602042747.277270-1-github.com@herrie.org>
 <20260602042747.277270-2-github.com@herrie.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602042747.277270-2-github.com@herrie.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=adxRWxot c=1 sm=1 tr=0 ts=6a302a30 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=LvhWEcBnrMCrogBIVCUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: OeA08hSDXIgJzW9ocpPGS-b9_5KxClLs
X-Proofpoint-ORIG-GUID: OeA08hSDXIgJzW9ocpPGS-b9_5KxClLs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE3NSBTYWx0ZWRfX4ZiwrH5K3FYw
 pefwoPTOia0iBsPcgFJQap+/Yhkhy2nGVeaSJS3yYILgo546ulpWkemXNUGod423VFd1QQyojjb
 TQeXpPWXjwMHLPfWwh4qAbU3W5FaFDQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE3NSBTYWx0ZWRfX7YRl+zhQ/M7g
 kq2qrrAVw/ANplzzas4wqj9F5Vq8BSAm6MXW3DHSElA3GvnKBGf6W6iBobz6IukkJ8c7V+vJA20
 gkX6pYat0bmB94hPgq0PassDJS6p3QUYrGQz+SpXDfPd+rMdmi9sWCcAXAMn21lFEeu1CJiKlEF
 Pfd94TrsWkbC+YQNHAJ0c5JXwPgjIjIh6Wcu07gq3VrfyR99AtDBUpr/zL0l/giFiL1d94WhNTc
 eUz2LAqDsPwO4ghJsVWzfWczx2HqQy7Lz6ze9/Gryg19xEPJD2QcuCdD+wprs05CKltogfJdf92
 yVfkhDhXRy+DuUGWN/2ZOj9O8SUnBaFwYVHDjeHlMcfnBvD5wM+VuIUbUxNrfbXQPUV1qShj/Ze
 zYhxIqEHzC2557E20yj1M01Iy8tw/LKcDYFucYRN6lx1U6c8u/ujOL+hhQmoSeMaGRY9S0JmUlp
 9cDSrKKVKjijkmgu4BQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150175

On 6/2/26 6:27 AM, Herman van Hazendonk wrote:
> On MSM8x60 the Crypto Engine 2 (CE2) block at 0x18500000 is gated by
> a single hardware enable in GCC_CE2_HCLK_CTL (0x2740, BIT(4)). The
> existing dt-binding header already reserves CE2_H_CLK (ID 77) for
> this clock but the driver never registered an entry for it, so probe
> of any consumer that resolves the binding fails: the CE2 MMIO window
> reads back 0x0 and qce's DMA hangs indefinitely waiting for handshake
> signals that never arrive.

[...]

> +/*
> + * Crypto Engine 2 (CE2) clock.
> + *
> + * On MSM8x60 the CE2 block at 0x18500000 is gated by a single hardware
> + * enable in GCC_CE2_HCLK_CTL (0x2740, BIT(4)). The vendor MSM8660
> + * clock-8x60.c routes both the "core" and "iface" consumer-name lookups
> + * to this one register, and the upstream QCE crypto driver requests
> + * both clock names via devm_clk_get_optional_enabled(). Without the
> + * clock present at probe the QCE MMIO window reads back 0x0 and DMA
> + * hangs indefinitely waiting for handshake signals that never arrive.
> + *
> + * Register a single clk_branch: the consumer DT can reference the same
> + * clock phandle twice under different clock-names ("core" and "iface"),
> + * which yields the same struct clk for both clk_get() calls. Per-
> + * consumer refcounting then works correctly and the single underlying
> + * enable bit is asserted while either consumer holds the clock
> + * prepared, instead of having two independent clk_branch structs
> + * racing the same hardware bit.
> + */

I don't find this comment particularly valuable, given it ends up
describing the fact that the common clock framework has refcounted
enables (pretty widely known) and details how the DT is going to use
this (which we can read in the DT itself)

I think the commit message is really exhaustive and it's a better
place for this info anyway

Konrad
