Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699379;
	b=KE4axXipMcf+eve37xaWBWSc9KhEdIPpAztvCiNIp06DviWseOZhpuwUjrVFIwKWLHAQ
	 aybwNzRJa1RLxRiQznIb8gRIdNtX8bVkBzA2v4lo/ggPUHgybjYqljn3ExhX3rx5hSlMY
	 04WnpSlzYl2N5c4984nJly1hysTF7AaT6As103v7V0C9V46RHaeorwqV3dYJv2g5WJGkz
	 qALOTZrJAfq+GZcinBpKCq2Ts6bytI/AnllgE/5y8rO/OMPcvadaE7CL/xo2tzqZC7FsU
	 Yzdwl/pLlwB9LI/Vh/mHAglTHGxsyR1zsLWEarrODHQJmO2md/wSicGK0VXZoK/u1xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699379;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kMMQdzS/XU9GNBHfZVGHYfrRZgo6UXRJKRG45fQahE0=;
	b=JyE6Mai5wEDfxDjsy2URX975RSyysfRm1vFWMyc/ZZ5s8o5mJMfuQhsTbMtpM2n1dEKA
	 IB2n2ALa6a6qDeSduHxJfWeMtHM+XQqYMe7z1ERRG6bhB6bYglIhW4nDoIr9vns5lF9O+
	 vViTRUxPyOf/uEqzZcNEtjrldW/+HRyw2z2cpr8xm3wSaF72EJBHqjzIq1A0eaN9vAHUJ
	 ha1sxJS+CZOHH3l1ef0Z/6Vcu6criahFjqWaSCA93ohE/0QYPT/lpebkCYOhHwHPkj9gF
	 B4lxE6+lQUbUME4FFlAgnzdaRCv8QoiF1IQTOuvdmf8L6IwjPupo9zvWvx80EbLVjMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kZ3AbXuW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MTbS1LiP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2F4606A326
	for <linux-clk@vger.kernel.org>; Tue,  3 Nov 2026 09:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F2F4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kZ3AbXuW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MTbS1LiP
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37qJli1397438
	for <linux-clk@vger.kernel.org>; Tue, 3 Nov 2026 09:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kMMQdzS/XU9GNBHfZVGHYfrRZgo6UXRJKRG45fQahE0=; b=kZ3AbXuWPVnIFJ73
	O739e4Nif395c0f6pBHTd7pycrx1UiErORl2JUqtk24WPwDngoqsf8ZqFqWF3nmm
	AFISxSw4C3dAure3DwRq+m1KyQku7/0KGtueKXZysYXs6kSG4qek8xyK+wrDfn3F
	8KYo/AvkQ+x6Ufr9gj+T3849nSh4UKiqdsupZZBdkKweqEMcnPYCr+9RU7JlxgYE
	ENpL2EtDVa7TZWfV3pRj2l7WlOAa5RVq0rpAW3aiTuNpZWQpNtKcP+50iDEbKZVa
	I9RbXZUAwxUCxMCTJ1uLnFVtChe4oEaYNb4YNWVTz4tTG1jggxzInktVfYe0/6wc
	mKUjrg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5j1mh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 09:49:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c84695584so11853996d6.3
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 01:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699378; x=1794304178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kMMQdzS/XU9GNBHfZVGHYfrRZgo6UXRJKRG45fQahE0=;
        b=MTbS1LiPixWvc5P+8Glqq5jojRoRNUEHc7WwDsmiIyhbIpSX5Cm5mdg2c5QcaKJOjc
         XdUi5rCvvSWp2hrrFBhcgI01PXlFpmd76bbGlVbo16DaeDd3279ayEEyStA2bc/cjSO5
         P1m1q0fnVu9Dde6zhWmHM69l60IdZVhn41mGDQUF5NwAZBwsn4hPjrUn+h9W+YBcXfJ1
         QCbh1AjYkn3cBcDF5KrokxORufCCDlmCtmieY1ICg4yRENfoAIz3SaFjwO+DMjszzMl/
         OJC4K5Lwhqj0ZeuCy1IckM8BOXMCTrUi5arCECFtixyoaiFE4wLl3hnwaf6X4PpSbVSC
         kLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699378; x=1794304178;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kMMQdzS/XU9GNBHfZVGHYfrRZgo6UXRJKRG45fQahE0=;
        b=cgdcngbme3rhBMNY+c9g5ZI7OAX8lO4BSPCq3+3sNaaBfLX6tkyes4LWsIarg05XXr
         390E6ajxHCRN/l3dMmcNuZAeAgC+ltGEkpyiBoVbHGsLMjoTf1NtgZjS/ANDXG3XYzNV
         2gajZ9j+xr641rmOICpRxqw0Il4hJn3/4QXZFtK1/kD3dnvFRFGy6ytXUpQxUvKQBAT6
         x2PhfZke5SczXRvQ9b2Zm+Av3S3PhikgL2rUqgXMTyUYkCK5sulVwY1aElw9XmI3hVEs
         dWV3AJiNN3yD/wJpuqngWP7YOJTfPmZk5kKoxlAtKegTP7oBQulIA5IwxV5BGdvfhsy6
         Z0WA==
X-Forwarded-Encrypted: i=1; AKwUvBza1JT2+VT18iuUHHEOeUnytGXLyR7Me+WMQGQXG8vyvchz3ipiaFNfa9zdNeCpvm4Hu9kp7KxlxuA=@vger.kernel.org
X-Gm-Message-State: APuU4Z86Pa9qOJ2QXMI8h3W9z0oSms7atVtywHUpXWhGyOEPyaiL6U5o
	T9/3rF6PK46x2T0fhyLD4FJp+lQsrEk+aamHhHz4MXWbbC/s4UR9i3CidkFfqBtMCm+XG6qgmNY
	ECOQzyLYG5l4MXS9cS0Zq833ORH7hLIp4QLJIpR4WGiAKgzMx5jIA0z0DkCFql8Mh/mMusuk=
X-Gm-Gg: AYBFou2nRLha8nUOT3y1sou0142bGc0/LuTIYtg/DwBcNi9L0jkE/fk/UjUMBRRq2Ku
	3/OASjUYM54LUWW+hhwbdreS7gTi98fkLdm8ih0fHu5CWWx4/3qXtTdNEnnMjZoqe9n41K8J2cg
	6zI8Wfc22BaJoOrkSrGGmqe/vcNo78LmJx9iPINmtMX2dw+BWz/HVswFhF5meq0ue5q/+XRSxvK
	7wmZyBtShLgip5yUTCnievvSup3y+3b9qs1VDruXEjCI8CANqlPocY53+0ai97aYksx9HyzyakE
	vFYM6lC3XNLIUANNTONDkC2TNXfqGyK3xUoz1rBJ6myGbtxmc/5AsmjYIWRhj7QkZvw7MklPQQW
	ur8lWtIUKjj+3Vl3u008mkXicH9sjXtxTw1sYuhnYxgz2t2SrFmfvNdvJRKLrIqOZ+LgVWw==
X-Received: by 2002:ad4:5f05:0:b0:917:9dfc:b958 with SMTP id 6a1803df08f44-91ca4a0b081mr304850496d6.1.1793699377551;
        Tue, 03 Nov 2026 01:49:37 -0800 (PST)
X-Received: by 2002:ad4:5f05:0:b0:917:9dfc:b958 with SMTP id 6a1803df08f44-91ca4a0b081mr304850016d6.1.1793699377101;
        Tue, 03 Nov 2026 01:49:37 -0800 (PST)
Received: from [192.168.226.81] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebebf164sm68701366b.13.2026.11.03.01.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 01:49:36 -0800 (PST)
Message-ID: <b8d60bb8-7000-4f9f-abff-02f596e1bee4@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 10:49:34 +0100
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
Subject: Re: [PATCH] clk: qcom: clk-alpha-pll: Fix the L value of Zonda PLLs
 with a negative alpha
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261103-clk-qcom-zonda-l-value-v1-1-9c271ef29155@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261103-clk-qcom-zonda-l-value-v1-1-9c271ef29155@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: T_woVPEwal5aVXIsJJR5zuIkQypZiR0h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfXzTl/KFD5JxxR
 15AgVjap8kitoAS6j1S4b32mtKbiGUBBD5FmWkOZbmTk3SUMLhMxOD/+P+Tt5r+WmOwKAr5yMBc
 qGd94NyAhubEIKDddUHvlP7z9MvRbukkgpi3W7/0WDp7AUIkJZd2Nv0fIVwcFvTOvgmdTh2+4T3
 G6zKjT2TP6sr44aTDWDjNviW6d0Tren2NkvKZWgJPF4KbUMH1Y5hFCYlFfifyTHow4DgZmq3JyG
 3bNQxFjSqG6+pfnZQ6d0s8eg3/yvTesGnrpVzVlPy2umoFj28/BakhUXjkOjrWtZlAXPCw/Zp/L
 /KJseBVcfULT+GkovvlWcPRgl8GmOnUByW9cz4C2zvnSwljddmTXBZj0e0CUUOuizsIWt7Eh1bY
 DaUnQCVun1PNGKtxQT/RM1aoSvEUui9P6ZlIShUep1I6+g46PWnRODb/hSsM6ZnBl7iRCIGc3LH
 hFTs8KGi/VgODGCIvUA==
X-Proofpoint-GUID: T_woVPEwal5aVXIsJJR5zuIkQypZiR0h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfX1qbrU9rFgZuJ
 +28d6sEyQavXpg4Zwc9vvUc//0hKNpCiVWozyEJty3snAsEMLT2ROJUQRMr9yAJLk7eIfWA1Ru1
 4zkKDsuurUvy2ENFOcOQVLrsfUcmvis=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae9ae32 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=U0MhLFlXrxXVFuOl:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_AXJYLjol3WrTOYx9vcA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030038

On 11/3/26 10:48 AM, Abel Vesa wrote:
> The alpha value of the Zonda PLLs is signed, so for a rate with a
> fractional part of one half or more, clk_zonda_pll_set_rate() programs
> L as the integer part rounded up, through zonda_pll_adjust_l_val().
> 
> Since commit a4d89b11aca3 ("clk: qcom: clk-alpha-pll: Simplify the
> zonda_pll_adjust_l_val()"), that function adds the rounding to the
> requested rate instead of to its quotient by the parent rate, so such a
> rate change writes the rate in Hz, truncated to 32 bits, into the L
> register.
> 
> Use the quotient again.
> 
> Fixes: a4d89b11aca3 ("clk: qcom: clk-alpha-pll: Simplify the zonda_pll_adjust_l_val()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Prepared with help from an LLM-based assistant.
> ---

https://lore.kernel.org/linux-arm-msm/20261027-nords_dprx-v3-1-5d98b2c6c263@oss.qualcomm.com/

Konrad
