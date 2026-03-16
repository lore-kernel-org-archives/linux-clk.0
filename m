Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E4826E173
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 14:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773670864; cv=none; b=lhy83P4x9XZSxiuOSgY4kCfY9qqvp5ZrkQaWzPsZAtfIQAxdR/pfRk2fXCetvl0HIzgVjmngdKcDz+apETG2Uw7K54yK4PEdHXCDxaQdJP+vyJtKtGq8NNOXxTxTvonb0u/vZ5Exxtnz+lcCBKA1HENl1yOWVxTaCq+kOFzag3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773670864; c=relaxed/simple;
	bh=7Zo832r3CAxZlBSgtHVQyTnKGCjFCF2//i7OeB8wa1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MHvbTe3g7Tga4QeG3AuxSuQLqKGUrIidT8QG8WSOk+fhZLb9RiBrni1yxSLAJXibrg6xsdPz5a2i17Tg4CNj4ibefk4XS34KblHd7jfO+4scI+yCz4h3ZoNcSlzVDVF4IKSJUXoxx98qvRdqtel2tR6SH/cwZJN+qF1hWiQQnJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IhciJ8UU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hNxqV+Og; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IhciJ8UU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hNxqV+Og"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GCY2Rl1623660
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 14:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ET7+pRVfXFEX2ZQozQ5kNkMYM+mjYrCSj9KRGYyuCJE=; b=IhciJ8UU184mtLQn
	uy/mMqqJJIN3eg3YcNUuJiOX/jReszs8kC8Kia0ZjqFPZXZbAa2/4wjnNmtK3aKh
	AB2V1wwEnogIGTsuc87mJhqGmUe1YQI0uq3hlg2Xh8A9jT/MOswRca26CDeZOlCX
	vJ1WloxTclL4+aCBf/FbPh0id74gEtdoxU+k/k8tFexN2sAwCh6RDpkhmp6OKccW
	pDkRF8MMkbFoXH2guIz2AtId26gleQ1S0ZbezCLXezXBFiEqzPHX6qNYDvBdgqzn
	LcND3kpsXRp7FMxaYxbBSXHGKn7C/i7rlK4HN3g9khSX9+rPy51HbqXot2lg71ug
	rQ5vuQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxhyegdae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 14:21:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a04e9d4faso36901736d6.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 07:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773670861; x=1774275661; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ET7+pRVfXFEX2ZQozQ5kNkMYM+mjYrCSj9KRGYyuCJE=;
        b=hNxqV+Ogg/N9Hd0l5NdgF9sdSs5DAYR71pbfGSK6mSiKpO7ACnXJz/y78Vo9Z3JAWs
         P4KrffUnL8B4slAYTfMCNNqxMRxldrnUh94c9AazajRO1n2qMd44fJwFbXqo1j18r45n
         gWWp86kN4AF3tGcLpeX4uYt+Ai76BOOO3/XnHCHm+ErpIoTTF3jztj6DST2ll63vQRdb
         plSBiwMcgJQDmEBxcXVFKVKCgOp0b7sBINcEdALKovoZ69DYEHRWvxYUv9qs7OeQrIC+
         38doHXLYUHxsR9XuVrxlmlcOJwsf6TEvVt9Hd3a2hQOE2qi7K2m+3hIlHGfXhZw5jIqQ
         THZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773670861; x=1774275661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ET7+pRVfXFEX2ZQozQ5kNkMYM+mjYrCSj9KRGYyuCJE=;
        b=aRYbRsb05p/olGKI/F4Maj/LJg4Wp3sCOHA8ECKNWx/0yOhYOYvWx0QSki7Cllui2Z
         uucLqQVgyFd05HKVKuOnjsJL9pmhtxwJh8fdqM9SR3kYzTgdQsOK4e/mWURq3iauJJvc
         +R0niwXyAuuE725Wk5eEfBWXLiMQjkSks/o3QwekV/KHQwYOlFqWTqfG5Vo1xgIwryP8
         zbHKg2A4XyeX74rfxlciHLtylgyNscwAp+LFeJcQXuMqwzUxz4LfPpTfLN020HilBC/u
         JhUdYmhLvl2pvVTo2oGwqxanJDXFgST+7+dd+65L1q2yJuLuPCkm6wb9EhHdt48zN45o
         THmg==
X-Forwarded-Encrypted: i=1; AJvYcCVsInoNyb8zaT0oaJeeN5RSQW0yxwFD1rgMuMNEBEGsyHKmSTKgQrv44xLAI2g3quCKWsDmITYvkRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrVFH9whcAp5M/cxVCHSZ1Q6acWiNC5zHHcaHkDkJmz8NLcpc2
	9XKztCc6CjWpahVXJOilm+Uo7PEUmyoEl7OJcaeGiGbG5te4fqZapX6qRhvVB8Pf6Sg5CHdaUk4
	KmJ3dniq5X8CWKF4M77J5NJtc9QwT9rIssM6qRR0NrnnPrb+m6xv325QuxvCSMZA=
X-Gm-Gg: ATEYQzwIq/h5boU/r/3Rbz5bOqU3Lpzzyp6ChZgyevkKD7/DfTtp43FVBEO2YbFy/SI
	EIKmVhGyJTWtnzVypphNwimRplZZYNUTAgeQ6A6Z2wv4Xw5Gx5eZblq2jrF/j+IE52TgtglUsmp
	s5k70JrcAdXY4nBkJjs3vm66WcR4Vu+WBQweN9IsHt1qZjphChBWAOf1uZW1s92ZcaooYtDyV53
	vFWLMJq2KqgEn+0obI1zxTlnJ3ZkpG0TGM4pHST22cJuVyI8Bco1qTzGqMGaJBdxJM8HKpMtHn+
	1tafwaXNQ9TiNyqaS33vNkCn3jxV6Dlo3iU6Uso4eoAAiPkGmMonUhLJ+NGzPYCgd0vJFdpmWWJ
	DXIaPeaB2jIf4WVIvELB/q7g1JCgsH7lTWh0GBVCsu8ez4c8rBYRPU5YBB5lBKa4EpO23bde+iU
	NyBxY=
X-Received: by 2002:a05:6214:601c:b0:89a:6263:feae with SMTP id 6a1803df08f44-89a81cce148mr130779296d6.2.1773670861526;
        Mon, 16 Mar 2026 07:21:01 -0700 (PDT)
X-Received: by 2002:a05:6214:601c:b0:89a:6263:feae with SMTP id 6a1803df08f44-89a81cce148mr130778816d6.2.1773670860964;
        Mon, 16 Mar 2026 07:21:00 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9791c113d4sm468691366b.6.2026.03.16.07.20.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 07:20:59 -0700 (PDT)
Message-ID: <6e993559-8be6-4dde-8214-9417250b1815@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 15:20:57 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: mark gcc_xo_clk_src as critical
To: Christian Marangi <ansuelsmth@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: John Crispin <john@phrozen.org>
References: <20260311182147.30266-1-ansuelsmth@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260311182147.30266-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dp2UtlLe6ZSYjyIeG_TW_idv3GfMHkvJ
X-Proofpoint-ORIG-GUID: dp2UtlLe6ZSYjyIeG_TW_idv3GfMHkvJ
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b811ce cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Vxy2kpnnAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=EiN3ZDTDylVKncD3b3QA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=mQL3ssppXrSh16SuiSjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEwOCBTYWx0ZWRfX1g656N2SedNY
 S9oOYE2+1fNQxfOhsNWlp7U2WffubRvn4B0ERlNE3m/xZ+lokwfIq1CS3jgmPFZR2ExeYhqTgDG
 yaV6+8ybxVO3rWAHNXwyCwGYVkreUE+nje5xmq4sjAfvh28x+qFr0wGsMfWsqANfzbrDU1u9HDI
 C9MjsAoJFXQ/8gxaMsDfZ/i7/dKTyjwmDJgTwKg7dB9J0sdC7Qv7DnjOJTAD23U3npBeJ3qql4B
 yVXX+spyoygCYLsUektGgwwk+dM2u75Z4CQ0/uOXVwJcRgi+g3tSR12mF6uRC01DjWclFefvkdT
 dCCSrxMAMUyZpw/2Y182VBS0UFE0cerJ5hIn8OE7wvmpp+ARqDi1a2mNiIjeZ+IQzNF/Tm6Y2Ec
 kv/Ov5uWAXohnnSkFQDDkek8cONVmuVmsVysAZcEWfC1gbeMotd65OjBeGQ6i6bkJVHUb2MZWWu
 DpXfcp1bVDo/OdtULhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160108

On 3/11/26 7:21 PM, Christian Marangi wrote:
> From: John Crispin <john@phrozen.org>
> 
> The XO clock source is always-on in hardware and cannot be gated.
> Without CLK_IS_CRITICAL, runtime PM of downstream consumers (such as
> the CMN PLL driver) cascades a disable up to gcc_xo_clk_src, causing
> a branch status timeout warning.
> 
> The IPQ8074 GCC driver already marks this clock as CLK_IS_CRITICAL.
> Apply the same fix to IPQ6018.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
