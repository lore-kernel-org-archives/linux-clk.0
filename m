Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025018;
	b=gjMuiuTroT3djezmvTQUqJd0locKQVF8qFBax6sqopse2XW9ovAeQd7IBfUpoCeLYX8f
	 27kMWE9KzsFbpxAEsExVfNAMPCrumlb9NIKQVfaZb3yu1IWIU8PyjbFMXfxfec8hHaLlz
	 RpCFGs3QEI0uofipZy71r21CNAfAA0kXjeb1vVXvLSe8IQF9ah6E2yQ5uihAPvjSFiqLb
	 45m98MLiE6J7n0nsQhsMe3y0XSMRk6gOtdl7Udw4FCt/c/935tkTMbXyZkuopZo/BNiof
	 GLjICt3y14uY9/u1wyuAv5V0eavUCAjgHHRp8iWquIQCJzIgyhCuqcvUeYx1LnRTz4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025018;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yMu3fnCVQwPWkHQ66Uo2nxfdvwj8lcTfKGOFI3BAhX8=;
	b=dfDEcKWoMXq/T9NnUaWtqRB4GLAXOeNKZWHOvPH7OTyi15R4wzoxGTTAblC62p6GFbmx
	 a54bpc6rwMB/sD7qd3FUfM1nf/o4zJz3CXS/5Nrgu7PRDJwouyaKWBg/or6Lw6e0HX6IY
	 8I9PGZnMRJUeI9QJfPja2t5glEQpELH2fGtmJDq62Mbgt3PgGNuIKgNKy8hIzgu64sRVz
	 HLZrq3tjt7naSEEq32JNU5cZu4d1OOpy4IQUutYBCyucaHnfykbDdcSGtXKl5DTCYGx1g
	 82CmNo9iXah6vaC1kxlIdaxJ+ICHugoYrFmYTyMv53ycRb5t5BMunL4mwZdGWH3v8LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jKhQwNfO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nkczg9gZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526C5606A31A
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 14:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 526C5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jKhQwNfO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nkczg9gZ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAspfp4131378
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 14:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yMu3fnCVQwPWkHQ66Uo2nxfdvwj8lcTfKGOFI3BAhX8=; b=jKhQwNfO+Zo3KeXV
	sdi5uFRhFO7ZiL5Cgj/HeYpSRjnjHykgePpbNzrXzOVo+cTLBseTLBGgZ9KFPkdt
	1fGafODS9ud19fTLAqOpq2Ae4CKl4Jzakzg+8NnpKePPy09XC431itXnrKjcINcx
	iq8jO5nc/mO44MNNfbzbB6JcQSQHHFQp/ZFzikQuvp+R6PmdCs6KbBMiH6ycJStT
	UINvpGV6Ok0OJcz5H6YESwGkeu+JiMlawbI+m7/cgWZ1BWF25CL46BBzsIR5CWHv
	KvTlkI+58lO72M3QwS/daBnE8LvKsShpYPJsdC+6P9VyDb7RafWBtRZKTzPbqx2z
	yrOzqw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj53q0v4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 14:30:17 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc081f3066so86228137.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 07:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793025016; x=1793629816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yMu3fnCVQwPWkHQ66Uo2nxfdvwj8lcTfKGOFI3BAhX8=;
        b=Nkczg9gZKFHIOc6ug1dbluVcPPVb0iJvRR4hd8jqhO/8+ypIXK+yL9Rj3REKa3Wo7Z
         90KFev6ZXieYszZXiJhBfgVcwgmmM3xvaAdxiXxcTYE+G/iFvKNLC4XyAxVb4BydP4eh
         ACX5psc0+0HJIGwRMWVDm1nRM5PVIPvkg0wC1vVJZzfPcM8vYXHB/24wFmoS+89I18/M
         1EWLv21yr4S4HKpOLPq4aG6YNb7cRnCzhY6jTthj28UeVkyWjg/8fhhDTnf6UFZuK0vM
         4uPvS0tktz8BXrHKZwsKul15eG61oaWdbWd0METHGx30WsLNGuyYYnBmbOAE3GkIlTY8
         29zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025016; x=1793629816;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yMu3fnCVQwPWkHQ66Uo2nxfdvwj8lcTfKGOFI3BAhX8=;
        b=X/khXSbNYZKQJC2U21A+gm1qSX5Pk1PoWx54NzeavCE5qNhYUczXloyXUtqv5a3neF
         bnQAweVZ+xLraaZ23VTpiZBWKw+YPRKLoaNYb2e2LmJZZCuti2pIZ9tynDi6kJvt6aDR
         sVGcgfNWlRo2dCyJZ096E6tG3bpqtrdATcBN8cE3vf9fqMTDyTZyKtljT19a+cZyAier
         3mWLlVaINb8lAaEW6HsYvtnii4bD+OIltVx9Nv3sdFUrR/QhW8bFzasghn0gUFgJ2LaF
         AXx4VroBk/7KfKomwYBNZBU1BcYl6TwatZa8GKuLMMwIbIvwwgQNuwwDvxxOf3TU1szU
         AAsA==
X-Gm-Message-State: AFq9FYLFZV/i0Fi732lwTvoLtHYaTJku/HjS8e4v3eAcB7kOJrVCbIDO
	Qe0F1G76uW23g2ArP0NMYcNDSRTU/IGwJkitK1iuf5n8uv6BEo1Eh9pYjP44HWsOdaJ6Syz/YJk
	WIFLVTDScP+GBG+nluUw3OzMO9DsIixAKrHqwZK5d2Z5S5uSUrZ2qTvY0Q6mL0u8=
X-Gm-Gg: AYBFou3ReEvI8IaSpHI8mBxXLw7ahsTrilaF3kMu4ru/3y7mNS8dDgcRN62jDO1l/xO
	9quEO1NE78K9x/AnudOHIEkQxvEUfL/ZVt6EvOZlaPBllhttePUQ2JCL8mZALfJgd0aYY2JELGh
	c1+pq7ciA1KT9JBkVGpD8i3+XeFhmiioIfWL/WAcqRTd0geL1cU+FF/Wp9xIHRUq0B8W7qU+Uza
	v9pgkvfbRqmmZTF+pIzKPqQ0WKTxZB+/ewdzW7rm9ZHRuctlHEfeuMi1kfHbqv+R3lAncP09Qjw
	NKmofmmpAj58F2m/3DIgrGVeEb0yaJbl9DzWYIcfZR+4IBtJ0xDb0nA5lJCth7A71dsfdc985Vl
	Rt6egFWVyNK+StcGvcxQzIA==
X-Received: by 2002:a05:6123:5ce:20b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec232b5a4amr1950677e0c.5.1793025016287;
        Mon, 26 Oct 2026 07:30:16 -0700 (PDT)
X-Received: by 2002:a05:6123:5ce:20b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec232b5a4amr1950600e0c.5.1793025014974;
        Mon, 26 Oct 2026 07:30:14 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66c6f7sm328224466b.63.2026.10.26.07.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:30:14 -0700 (PDT)
Message-ID: <3afb8798-5859-40cb-b4ae-da7de358771d@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:30:12 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: send abort notifications when a parent change is
 vetoed
To: James Hilliard <james.hilliard1@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Mike Turquette <mturquette@linaro.org>,
        Thomas Gleixner <tglx@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261021-submit-clk-parent-abort-v1-v1-1-2936181822fc@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-submit-clk-parent-abort-v1-v1-1-2936181822fc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NyBTYWx0ZWRfXzsXe8f9h82hB
 47s4F3BQymhbXtD5IGBLyHmMpsp37TXumVEUmZt9aaq2fpuAniUn0z6TBChzpco6md6F09Kvgkl
 AUurEOzl0O4w1ljb1EvlhbLLsBnt1vc=
X-Proofpoint-ORIG-GUID: tM3MNw3cBuTcRk99Bp9Z04DpiRYrc9M6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NyBTYWx0ZWRfX9Xg+IopIqsgO
 Nxs2SBru9b0vrH6jho4ASHtJHTIB+f/HmE4ItqZIc85fiieOlnPqv8aqq2GbVbpdG7lOmgUOONq
 NvzbzhAUWVSPH9tCWa8gsZ2i/Xij50nm1DMDgZBmtWgGJZgiCoFwI5e7oTe0j+0k9/UFmJE5Y6L
 asNVmg19O8ACyw2dQVxjw7YPEQZPQxXe5Smyhmpt1ic7nEugvW//a+oWcWVCYXjvQ1C8wt/VNox
 wcZTOkZfv2RIBPF6DtwgDjZpDLA8nrUvYp5R9JaFXqLnVCgVmyqfjFgJI6i70O/x84rBIS03BN0
 VhVGFZYSoSRH2yzB7G3YzuuxcB35wF4ZdxXykbPuaG9uWzUloWdgQIxJO3DYXRLwg7EbNt29BAL
 4miDRgi4KUjkcNtqsJ2LrszWQuv8pKZYBOhNYlIyVtUEFr08jqMCYcpUdMNiRFj2Kunxdo/gnd3
 osyrCpMJf/ATt9db5AQ==
X-Authority-Analysis: v=2.4 cv=D93SufRj c=1 sm=1 tr=0 ts=6adf63f9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=IX6fHhDGAB72HcA44fcA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: tM3MNw3cBuTcRk99Bp9Z04DpiRYrc9M6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260057

On 10/21/26 11:28 PM, James Hilliard wrote:
> clk_core_set_parent_nolock() returns directly when a PRE_RATE_CHANGE
> notifier rejects the proposed parent. Consumers notified before the veto
> do not receive ABORT_RATE_CHANGE, even though they may have stopped I/O
> or reserved resources until the transition finishes. The caller also
> receives a positive notifier return value instead of a negative errno.
> 
> Recalculate and notify the unchanged subtree with ABORT_RATE_CHANGE before
> returning -EBUSY, as for other failed parent changes. This lets prepared
> consumers unwind without changing the parent or its rate.
> 
> Extend the mux notifier tests to cover both a self-veto and a later
> notifier vetoing after the first consumer accepted the change. Check the
> abort notification, errno and unchanged parent/rate in both cases.
> 
> Fixes: b2476490ef11 ("clk: introduce the common clock framework")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
