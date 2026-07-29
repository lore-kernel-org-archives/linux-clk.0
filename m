Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B913FB06E
	for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2026 09:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317106; cv=none; b=bMUgVdFVVVXGRd1hxzWh2tMlW6NOsPKzy97n75UqqY1tMB5sVJgOmslQWi1H3eZeAXPdux+6YsDkOqlZBFAsoq7v5SjAG8Us3Q8YHN0nPyfOiR6FRjMKSeY+GYqg/ka2X8cp4iVKqmNl0gj80cQOQaBpmZNnAa0gG18/S8zqzoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317106; c=relaxed/simple;
	bh=6l2FurrC2SMkFOwK+3FLIgVdNdBJO6GIBQoiLX2YaqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dr6NdazFUSHG238QTbMCUI55MrUwndZjvvBYQ9hGaCIEmUo3o/vM6ddISMxq90JSS2jHBE+vz6aImgeWVnUrI/22bKabdtlX6d4YsjbaEj+oH1FI+VgWiZCE5FtJPCtHfkZBzhbvS338UNabbvKNIGRfcNkCQ+MoeX7q5dDcaEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lhu9PG+4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZEhRuiPQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lhu9PG+4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZEhRuiPQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7f2nh2326589
	for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2026 09:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ywA4xQrxtMbXsUKCF8h2OYc7RQKwSOF8GADypvIBgbU=; b=Lhu9PG+4hxdAUX9u
	X4IjQ8A5fInUmDN9TaI70stDCRWFUkyBjN18NQBeyi3NX8NqANL9E4nNEKwqa0X/
	07xdieAjdAwC90ec3exoyGkCvxTS6KE/rNhGYk7uv3X3FIZ9qhKln88XsTaPbahu
	1LYOVSQXm3+6EMqpXE0ihMGe/conkrwFUuXmY8VxWSpBA875Euh9KgqPPseoZ+Z6
	6cCsu5xSOXrcFwhFAkUFHU4DVewPnk30lQTHL9Q05IdadZ7xS1J72KrBQAH9acVC
	FaWLYdqjhEPoY+nL2UezOwmS5qtKaJ9GEDCuZsoUhtJRE7kLBi0A+YIbmCn5WK+G
	9eBCgA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbm1gvqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2026 09:25:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f21e4e8b66so1763976d6.3
        for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2026 02:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785317104; x=1785921904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ywA4xQrxtMbXsUKCF8h2OYc7RQKwSOF8GADypvIBgbU=;
        b=ZEhRuiPQA6wrNhtPM0RWqeljisc6v6xNxJHCA4EIMH+QMJPlGid0LTYDmkWJWHPvYc
         99pbjd8/CNZRQSUcfIadLB/GBTIYYpJmAkV5DIZ/pfpDhwPT8KNEhUaSfbsawe1nhS+3
         jyWwVjeWxg1eQ4poKUSZUrq3cIH9xqFeBR+IWCtEnkE+pMPuWl5nuWhVaOTymvF4gnJe
         0uA3BQINfL5rZ3iy742vcPUGZHl3xmyTkml9FRzXsW4fLOmMLYOt8ujM1UmQgtK3H+Xn
         9XB4t6ARR0nZz7CAGV7DcV0waW2lI+uuBEEZ1dClNaYUwPafkyaPi2YZN3bvZhxmPP3L
         oskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785317104; x=1785921904;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ywA4xQrxtMbXsUKCF8h2OYc7RQKwSOF8GADypvIBgbU=;
        b=SNH1mDyqIBRmCBixqdxHNQLsnq1pKMY7ZKDTPOSBmkZlyC5rdxwNHCE9TSiPCh4brk
         Jx3wyKcYAGcLWIip++nkgSv0oBbXMwjZiDKiaQUo9fWZbskywt9+J0WsZUwUX2SPinO1
         kn9Qa9tMI2En4XehsdQP0yks5Kv3ArKmFqdOKCsLNMU17hTuMBQmmHzeNXv974iVt7o2
         zt4etLEdb1ufentOh9kdYmDROqcvkTVH1vOScXv5P7d4pzvIGr1p7VF9rPEkQszPzw49
         417qQo1UtYcD5WWoeiSBVyAHVIP6IICKNHAdhEOjKwd43/nS+ydF6aOVDeiiCoblSJO5
         rafw==
X-Forwarded-Encrypted: i=1; AHgh+RpNxAZe1iKK/iCDTydlQX80aYozrZ9iQwiBF5hkcAuYdeN/6gGlZlARRnKuvZLSKjRW/+ZNHO7mGZA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm5Reh3QA6zkOdTJADGX7xC6CAgtPoh4xggkbTxoGgSp9RqpHL
	dBs/varvr0Q7c54lmGxmi1cQpRPxQfHgChb7KugbxUT5IVWA3hd1gtvM63gaEcVvxStivF6a9CH
	SQiEqxBUeR2yrnSI6h0RJKfK2Jb0pPJar/TSaWlQk7HsuBtrShhw0mwOeZRnQIJA=
X-Gm-Gg: AR+sD133KAnNTMQiu0QdjtZcQXQ8IzhJK0gHGRvFm8RRhwrzbO0eSBHJUTX2byqwssq
	EV7cXC4ANDEwK7gi2IX2GUU0TIsIND4NRvnM8mT5Xi97a+SdbIdsjiXPXyYXu2odorz0zPAftDI
	Hh/XBpbVkAZ4N0jKbld7dEtrxstbEvYyLydQL1hktLuQL2IX8/q+yNYjrO2dAp++B+ZnuTmR4Bb
	w+Nt9Eafjz5uLMXyEH7aVHbgDl7kdOC5KhQLJEa5IMftS1EsIg0nxlKUmBP5TDHUdSuLvz99nUv
	4fyglQKjLBIpqmbP/EekO8z1uDFBq0HB1JAtoOPKble/KyWAa9eAMZ25dKDPvnos8TsxGPSYRUj
	U8/zqPpyB6B++4FUYoIhu2slQ
X-Received: by 2002:a05:6214:5002:b0:8fe:b7a6:4fe7 with SMTP id 6a1803df08f44-908172b4077mr57831286d6.1.1785317103469;
        Wed, 29 Jul 2026 02:25:03 -0700 (PDT)
X-Received: by 2002:a05:6214:5002:b0:8fe:b7a6:4fe7 with SMTP id 6a1803df08f44-908172b4077mr57830716d6.1.1785317102763;
        Wed, 29 Jul 2026 02:25:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a050c4ac3fsm599079a12.15.2026.07.29.02.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 02:25:01 -0700 (PDT)
Message-ID: <a39b9889-2311-47c3-8ed2-dc94ac2478c8@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 11:24:58 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] clk: qcom: alpha-pll: Check Lucid Ole PLL status
 before configuring
To: Esteban Urrutia <esteuwu@proton.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me>
 <20260713-sm8450-qol-dispcc-v3-3-56fd05822270@proton.me>
 <40404aa6-7822-4c65-abdf-0ecf1fa073cc@oss.qualcomm.com>
 <1c4ff5d7-58dd-42c1-882c-c1ce0d5a62cb@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1c4ff5d7-58dd-42c1-882c-c1ce0d5a62cb@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA3NiBTYWx0ZWRfX1VVCwbZvjOqh
 oGXbAdn86KD5Kx2A/Tt3j29cj3rNCkGCBDPudrFkMFEKOrCWEwvMgW0pW0VTYyuVZNw/L0DUjoE
 ilclwC92EkAyV1vxD5ERdfnYhslpKjPt9t7k5FsWpOctY4ABU4YXmE4rw1FdPqMC8nJceaTNxHc
 6hDXaM9S6d137HH1O4PRrSLIWyEyKsQ+LZRlnnsC+Xa9bBTgcVG+CxuFVfxmxe3YrEQJzVhKdRC
 E12ti/sLGBAQlNapBV4fFewBrmG0RZPiD3fUku/qobGX97viWtNzXDL+sQ3u5sfaQ9xMJuDVrwy
 9Hf0nW39kxj/qECaEtvkMHPPxETjwfrGPZ2UQUpP3zRr74eWM0qxr77P1WTMTIt3Dm0AyTxwv4J
 hYPABc3iXMLlKYUW/+H4q52tUK86N5u9ZqonJjsNBTiw1PRObNqqmQSEvFMXaj8q3UkhGo3aTXj
 cUW1TrYhHh3kBMH6pcA==
X-Proofpoint-GUID: nZAuLoO7Sl_AluOWqf7_M_G3ZTlHd_Y0
X-Authority-Analysis: v=2.4 cv=R7Az39RX c=1 sm=1 tr=0 ts=6a69c6f0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=7_YbKsyzkvOx_SXqh5AA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: nZAuLoO7Sl_AluOWqf7_M_G3ZTlHd_Y0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA3NiBTYWx0ZWRfX3efvKZ6JNaIm
 jMh0ajqCM8iYE3WCVu+US+3La31oayudLacndRkvsKy1GBCXSkWzD0vCuyL0aWtxQIGWa9xcKyX
 RjmLqh2ist9Cf6swMh/mZZ1DhUHdoX8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290076

On 7/29/26 4:44 AM, Esteban Urrutia wrote:
> On 7/15/26 5:31 AM, Konrad Dybcio wrote:
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> 
> Konrad, since you pointed me in the right direction for this commit, can
> I have your permission to add Suggested-by?
> I should have asked this earlier. Sorry about that.

Might as well. I'll leave it here so that maintainer tooling picks it
up while applying (i.e. don't resend this series)

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
