Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B1E24729A
	for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 00:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769647197; cv=none; b=oHOrKPEPe5vc8zcIJv1CBQsdbz75FE5jGn+D3sn/ONUlQ/LC6tsIKJJ7n3aGXn4i/TjbNciu3MUNgVFpx8aREguNzb1KO91RJNiFk4BCYRg0hn069/1dBEU7HSTMJJFKfFOLlBA720MkfGvJ/gAPy+6oExxsGJoqSqxFqTUYPvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769647197; c=relaxed/simple;
	bh=5o2W92PLG497tBjG4QqKVQldsWBISAwfWw3WFmiwXZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bL7dsrL6yceevld1uMCntT0XYLpFZwQLsWGVS2tgmBuwjlxSz01XYNrNNuDPPxTZ/xorLGTV+cYfjGLuPQW5v4TeRnSMeVDyWMztQYCgd39ibVUhste3Vr/khWXJGVHO+9xg3QY7v8+7iBJadJEPCH9+CZ+R9MNEgvcldLqRpFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JNsp9st8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ThTkjtWW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JNsp9st8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ThTkjtWW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SLpL6C1398770
	for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 00:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BgucJZux864r4r2nJ7acWtQ9
	0OuvqPwqA3GgsXG2hLo=; b=JNsp9st8nqb0ck+qTf25AIhgIVUef9sQpfO7lom4
	3iJc2i7R1WFnUP5bVIJoyKo2bpRTIHCtUdnAYq5I6JcK37F3Zeo8oLSRYDY06ZlJ
	d7+0pwUDA0ihecchAhiDPJYfppBOhQV8he4UgksVgLyqDxNkPsMtQAKC+26eqG3t
	ddd2p/jxO4niy3GxbeevtOhlf9k7+l9ZgTljBw53hEwzieUM8OUxp0yWVBNPpSrQ
	DdvzzfASqvvRcB0fye9gYe5uh0tZaB+TtX7OQEscOCzPLJZvFP5J9NprTm4+O6My
	+rb+v5VBj6xf/R+ke6eXlko34os05Kofza3jWzVpNXek4A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bytqy0cma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 00:39:55 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ecdded59aaso1211823137.3
        for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 16:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769647194; x=1770251994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BgucJZux864r4r2nJ7acWtQ90OuvqPwqA3GgsXG2hLo=;
        b=ThTkjtWWYK5sCb8SIAq5acAKbL+bv2hTeKyConpSsKP+DPyqxxYPAlVurEAZMtCrF9
         qCvT85kh+OwPRjndtNoaPG0gKQB04b3nu1j0BZfQ7sPx554AHidbDjfa9Ykz7JH57bXA
         2B0ntTRkhiRlS7/ioqfZi5XP5ZdkYBtc41lLeMzZB2PR9ItJFMwF+k373oPKkci4JdSq
         ijTXCDdTTMwCc/nq3yNQs72mGNMi/pJvD+ZDZYZ+uchnSXFxBUZ9UsHZxInDBa3b18T9
         V5gj2A7yxbbVWgg4AejOEx+pYB+1Zr62esf4QWoTxii3wtUcqvJoOoCQjXUg71lsTtLK
         3OyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769647194; x=1770251994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BgucJZux864r4r2nJ7acWtQ90OuvqPwqA3GgsXG2hLo=;
        b=ItMfS2v9EYHd9LgIIZ3OBnH31VIgw1aPGB5pp9PPv3wMxG3zehJlu3JdNtz0bB5kQS
         u0hSq4YfNDQCeDzhhXsCPEBd5d5GubQ2dsP/BU7rbrXAK214Xcr5vZnBIyB1AydAmY9T
         K7faymfcyvo9XhUsR4lBU6w41y4pHOmnAiU6lp42TR2sD4RRjbFs3Leeqrc9BqGwWgN7
         kN9d9/pbAGBFT2bgNYJUohx/psvLsZ7Soo5S771DoXH35RSgNijOTHCWXUL5n029490W
         gi0zm4i3QoSiQ8+6Ze6EFI4UeY6v9L8i5sr4F7twpf/W/bXuIU9hScmUYSrWo40txZWD
         OBAA==
X-Forwarded-Encrypted: i=1; AJvYcCXq59ghKYuiMRyA7yNqXfqdOe3wC5tBhygMH8cRwkClroMUFzyIWda+TY3h2u2oCR+wEwHo56R12gI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx/pgQzP/+O5/dd8XfFPAa7KZyFGv+N/4yRSw5HBkx11t6JR5/
	triCc6VCM7CqcTbrSbgdadwh6hgpVfPFVfVtTuMolu1o8p8V/f8DtRZnKlwOC/7UXt5BfXYNWo+
	l9K+v5F3BfRAgW1AD9QrPxP+ECYetIPxdVNW+RTRXrHAMpnowTasBJ/Yj4IFV+Zs=
X-Gm-Gg: AZuq6aLNnpcmv84+nhCtcJFlCOHku0nu814oSwgu/yVrU2xOoIQpCZXp2Qve81ypajx
	Cw3Fd7fqrNXh3/QHubsV8NuaQCqNR1X26VvyAPgmsNf59a8m7ppmnioNbqSXxT8w3/Ztkt7SMsS
	WRV1YqSVDa0whfum6uPrGhD2tKEqyY2X+5s0gOnsCWWKK2Wh1YCb375gUtEnHtRxAAL0c19epfT
	7byYLj0Vci3kj8gQlrb8itFNbheQVGRJ71jrwpDAf63GnpdY7eBw90IXsQ16tsSbKNtrd35K/ze
	zw2uOvKvH76pLbRqsOmxzlI5n6yrjkj6S/RVDKiH8mBlb6JDHI/JTcxYlqpxQLt1uFT+lVdtpC2
	CYRSafsZoJngKX7286CAN8xWe1kBEOvYf2Ziah84qQFrrhYsbhnJ86kilo9i7zyiruQAIWcKuBD
	JVxULXBSd+/6cvP+2FQUtqZTQ=
X-Received: by 2002:a05:6102:370b:b0:5ef:a9fb:f1f3 with SMTP id ada2fe7eead31-5f72362dbf8mr2917940137.11.1769647194628;
        Wed, 28 Jan 2026 16:39:54 -0800 (PST)
X-Received: by 2002:a05:6102:370b:b0:5ef:a9fb:f1f3 with SMTP id ada2fe7eead31-5f72362dbf8mr2917924137.11.1769647194250;
        Wed, 28 Jan 2026 16:39:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e0a4dd30asm509038e87.63.2026.01.28.16.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 16:39:53 -0800 (PST)
Date: Thu, 29 Jan 2026 02:39:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/8] clk: qcom: camcc-x1p42100: Add support for camera
 clock controller
Message-ID: <bftoltz5p6rbvuhsialcoiynrhymilwyfqlhlhuvfodelsz6ms@5w2vd4hkof7g>
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-5-b23de57df5ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-purwa-videocc-camcc-v1-5-b23de57df5ba@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAwMiBTYWx0ZWRfX00n1RPiFqk/H
 atZ57jG1/fugYXNQacLl80TR2ektLXcgzNUpVr9SVpSRtW2CeN5WXjckl1+MKdW9z90y9wIiWdL
 vodVEp9Uf9JHUbGgBexiGkhn9c32zBx5fXKoh2nw+Po2ii/14Q7Xh043JVtcvy7MmM1P3p/zRYa
 U5+PzOmOuK8biZQtiVZSoXI23PClQ0sfEEKeyNPrj0kCw5fGNlJiwMuC9BES1FOnPW4oChIHEr1
 xTikesry4RK7R5QBLnGEAi8R8INqarCO+Fxj5f6g8MIPxpheSoTNvxun2C5qsa6TgfiMqplCHno
 KBIyeBlsxHeY/jn+aNumFkr0c6P+64/clxqbpfz5wemCqRESSKofcPf0+bX8nklIgrVVOecBS4J
 3nNHxHAF4UG8LNJ2Wh3DPotxv7KzqPF2vHaRJmFN7QA9EHtaoGeM/3c8seUbJGddN7m++Hr5Qeg
 PXeotAez3PCSFQp7WHQ==
X-Authority-Analysis: v=2.4 cv=Je2xbEKV c=1 sm=1 tr=0 ts=697aac5b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=OBcQ79OtfN4fMwN9YucA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: c2CiElGuCig-HEkmTyfl_Nc6A-T7LN3j
X-Proofpoint-GUID: c2CiElGuCig-HEkmTyfl_Nc6A-T7LN3j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290002

On Wed, Jan 28, 2026 at 12:56:36AM +0530, Jagadeesh Kona wrote:
> Add support for the camera clock controller for camera clients to
> be able to request for camcc clocks on X1P42100 platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig          |   10 +
>  drivers/clk/qcom/Makefile         |    1 +
>  drivers/clk/qcom/camcc-x1p42100.c | 2223 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 2234 insertions(+)

Again, this one is pretty similar to the one working for X1E80100. Can
they be merged?


-- 
With best wishes
Dmitry
