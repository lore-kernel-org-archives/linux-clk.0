Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5E648BD5B
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 16:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158092; cv=none; b=MhW36HmzFN1aTZhagKjCWjv6+PLMVp6WknEmkv5RTakUE4mrXjyeGB59MP3j8ZWej2KVer8H5HXN6wdsE4rr6VEtwcSX6sr+WADwBENLvI8fmHBbqwiRVS2hceXKx++vcrFs4mevhRZbDej3FCLPWBfif9H5Ko3AygglaCbNDhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158092; c=relaxed/simple;
	bh=6SjESruRKP8DG2jY+pqsMyQDbVE7rq/WfjRVtxtA2FQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V8b4vFZpFmhaR+Ap2vfyRuA1bAadoJyNTn9EKq2DTfW3lDTUGzT7LwJN9WG753LiA6DFF1vjCzoL9Cigc7Q7hNPTmduEz8RXG4YX/XZhEy90ekt6h3uw0Kt675DtIV4d8ItFlfaYytvEubk3TvDmcgIvSOhfLIr6I2vDsCu2HO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OuKj7I5g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IlXbNDhr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OuKj7I5g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IlXbNDhr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEbYPJ067693
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 16:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3d8Vc0UOr1NwPvuyYBi6QHWRNEbCtofcowqpgNaVEqA=; b=OuKj7I5gRUKDMu77
	uJVzHQ+eCNZBomspfxkLkME4Nmzxezp5H8TSi5MmHzdtiIqD5U52hyTKLNmjMiDU
	+uHLZPPy6z0JcHAOj3zoj/cT2ki0edkkJeHKfkyGSRjOYxbZmnV5H/+GSZyIqE4Q
	9m6tRlkLdFJ11Hg4UJSX2DuduMtkBPkdNEFOKq9o7QOSv17DAW1WP5lhr+16pDt1
	itc3uw7GnAT9eFWFNZpiHrlGZQ5d3fHG9cKD8HtR/xquvbLIiI3HkFqWVAIobWNT
	kykIYWj8F3KE2fRWgnuX3vGNk/0SjWiFfyYC0g6sx4Ec6mSKF4WCtEX7WHmb4TEG
	Ca9nqg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5e5d0stx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 16:48:09 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bfc08e95ebso52709e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 09:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787158089; x=1787762889; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3d8Vc0UOr1NwPvuyYBi6QHWRNEbCtofcowqpgNaVEqA=;
        b=IlXbNDhruMUS7f9d+aRrrgSML0hIjJsI28l21K7RLsCb3SsuOZAbNU6CzcE+yWUhkg
         +nzdc4+S7psNMrLU9GWUdoCr8zOdv+khaxjkZYXDmmlCsDfae4wdPfSgPRFOo8Mz6NaC
         mQ3PDQ4Skdi3ZelwulmxVN5oBwCUEhFnGc+KVRYAYNOiwEQ813alhkXelg319fmKO9Tk
         fbxRMythIBn9A/BO1b8+lCbZnWKHfkV7U/F2hjVpwwvLsTdaALFOqDdRKH0luzkoREqd
         W+SZffI8qIrCLeMkjU5MVYpG4WYxqpxHAr0uRcKsjeJ4jsrqlvcELjh2b1Lh7Jn3iBxV
         leyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787158089; x=1787762889;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3d8Vc0UOr1NwPvuyYBi6QHWRNEbCtofcowqpgNaVEqA=;
        b=jN0HoZJyEhv3nChjEZMHabaQLavClMKU3Y9Lj+sznsV9HVNENCn+MD7cLE4NZG2lVy
         GaUa/jluFHY6w7NQ1MPGdKXH0OSZu0GIhh+y/HTQcW4HeevqHXNdJikm7/Uf/pyHItzk
         2RhLZ5uazbcd4crdNftUH1bMOaZ3CC/tR33iqbaFQlUxVH+q3FD/3zq/a5mo4LYQkXEv
         TxzDpXoAelDw0SyRXt+mfnpbmMm9wUVttaNyVwymJ+I1yrCzqm05qsBTPeHRxtlfzt+g
         ZH/xcmMu1IfcLHuOKzrFQ850oNp9kHm2NXyQ5+tgN3s/siBk0quJVDksAWlIvPmOKoCo
         CwQg==
X-Forwarded-Encrypted: i=1; AHgh+RpMpA8NntUDhcyxmNbgzVTtk+3BIwR8UopQW9VRSS2D/xofFNiwmbsB1oLCEUzhcvHEzwKLAT9YLrI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGhHmYfHG65MtogtRfK15H9VYqtggElDkjdFnMyVxO1NJGb4BC
	SbUcXQyNC6Er1sszrwdSGoBwID25SpRkRrXusrIvmc8/ccOTJMQPJPg+YudYCh0QhHitv5fJcdi
	fh3S8aO5/51JOgGfpm1cp0Fi98yPQimg22nY1aXVSKDRnjV5UeY2zkJ5SaP2m/SYUw0TZBoU=
X-Gm-Gg: AR+sD11Iz+0NBhgWIJ16PBuYuxC6Zaq2nSCZTzY5q1DbZsLjQbCMEs8muSmKs0dinm0
	cdP7Uuw7qNNphkpOKzR+ybei85tYQmeJ7JlQ74XanByFuWGirAIoM1otqV6Igh0WUOxGvWscHC9
	xW72U5Ykc5Y2GlkGcoOCK6FZcPThSjjJz/2ZxRQfQPgg62vo5TRwVRHQwDAfzER61fyvOp/ibl/
	GMxRCqYB4mPDEOIrHnPpwPHqAJqt9EmR7s9wl2AHxbNG1HsQa+DO6nE5TSjs5Aksc0aRjMkRchE
	LRxgQrH+V7aiVMq6bdZNEfyhE469VfspPa1m3GdfHGvhEUwOw0Qm4dZEVIXAug0taMzcnRURolf
	q+fArTo9jcVHG8A9ukB656Eqz
X-Received: by 2002:a05:6102:2c15:b0:74a:b1ee:e21b with SMTP id ada2fe7eead31-777faba447cmr854291137.1.1787158088858;
        Wed, 19 Aug 2026 09:48:08 -0700 (PDT)
X-Received: by 2002:a05:6102:2c15:b0:74a:b1ee:e21b with SMTP id ada2fe7eead31-777faba447cmr854265137.1.1787158088451;
        Wed, 19 Aug 2026 09:48:08 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0d5f70sm1234818a12.13.2026.08.19.09.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 09:48:07 -0700 (PDT)
Message-ID: <6c90a1a2-6edf-43a6-a22b-acb6879f98ff@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:48:05 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/16] arm64: dts: qcom: sm8350: Add GCC CX power domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-10-840034124e73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-10-840034124e73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfXz6LiTejBqOTu
 Rm70vqJk6GXOFMRmrc71CLo4sIFf3rxXXZBXB3GdYaFFHMOW99SbhkzLZj8ROm6oWyWNA9ABsXb
 vakxU6HRK7yIzb7vKyYa5x/M9FGZddt+yhTD/1lXLp+HGeDQ7XLGWPj7yQqUYH9qkk8s8kutNhp
 W8KGY0el/EChFKqMThLOen4g0H+e+OjeEO3sm7ya6PrO0QyZDSbuDemrKz1zv0ZESXgyh2O6P1Z
 Wl6cbSe1q7YJx38Kv9hTOb5LbPupKUqHXyVoJjw1cKTk43gre5c/+BCl/NheGavrhJVLBPRbR8E
 dj+M1aT+eod6+F6fZwnEJnJgku5DZ8KL3FAg4u20IV12tlwWxP723zKXrELc4ljby939ocQ//zJ
 bYA88f8/WOAALKElSi2az0/2aQCuMSD26do9VlEp8bg0Ix8WtsBtDvS/X4jkUNLPjOV6aaZNj3D
 l6/mjPnwsA7zzStZLBw==
X-Authority-Analysis: v=2.4 cv=cuOrVV4i c=1 sm=1 tr=0 ts=6a85de49 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nJhpUYXR7LpnGJmJaegA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: i2cDdoPzalxSOaDzWS60a9qVYHR_kGm5
X-Proofpoint-GUID: i2cDdoPzalxSOaDzWS60a9qVYHR_kGm5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfXzh52mAlJHZ7l
 32dR7NxkBqy3htm2Eu09ehtNtjd3+qbyd01EmFrqL9WizdfP4buxneodiFs/oKZapNMxLgDmJcK
 T+ioi12S1UB2dNAzE0mAfLuxMcFqkQY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190130

On 8/19/26 2:51 PM, Abel Vesa wrote:
> The GCC GDSCs on SM8350 are backed by the RPMh CX power domain. Without
> describing that parent domain, consumers of GCC-provided GDSCs can enable
> their local domain without causing the required CX vote to be held.
> 
> Add the CX power-domain reference to the GCC node so votes from GCC GDSC
> consumers can propagate to RPMh CX.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
