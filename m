Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607233A7F45
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 08:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081984; cv=none; b=rJersCSaKY36T+l3pxUp6mX2rRLwecRAqvkbmGhfLWfltkk6Y+fNPNGJDA5zwYNzqj+4fhwU0o69nGqneELQMp5sl2ws4FYET1HKl4qPbWoCQJzOUI0cGTHppfIMQA4QMyDeWU4eAmWB5wkbUi3WUl7RhNURO7ox5RDCuja5iLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081984; c=relaxed/simple;
	bh=Av7ZG2i1gLJEUjKcG7mtXe6GDqWW+auW0QTqhvZU2cQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I+A8Uc8535CjS5ctyXYbCtNQ3V+wXoWa09+sEoljl9125wnqeES+y+z4L8+GkGne7J4m6YU4nxrYWpTdUO0QNhKe1FHAz+udvCjxRZFX3sAXA0psJeRHuOE3N6a2xt/uACUCA4ZJoHEbQFSCFo59uiKJ7y1Mj3p4xKiq/hLxtzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n0sEfToN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ok0jlbg6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n0sEfToN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ok0jlbg6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iiWv904524
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 08:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K4Odi0h8mvRiXoQLG9GdfnXsVeRWyJkyrEIIy370Y/I=; b=n0sEfToNSM14fwTj
	I91GHlIR7zseYUqKJ2QJfHbsQxHNC+13qoR+XkAODFzRxhkvZqAwOrVdyB23poEt
	z09pL53tCjnKDsNRgUMfnqPopUYWAZQzMFgoFuMeRqSPX5CfjVac001Q/lIVpImn
	7BGZtR8Jmu86RU/Yc2Gb2QrSUti2x8IMtOuGb5/kurUr/qf4MfVgHmgE/4Y+1Pe+
	Q9EcXIubdpvvPXqxuZnHGdeFRimZC9IIrigaHAt2HBYNe7G+iffxgEWGVo8HlSXe
	Rha5fxzcxkrekZ1tO4CyL24k3gzoBcvMoR/9qdgBr7U291ovg0NUnzXkd7ufUMmg
	k5fezQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epuket5fc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 08:59:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5178ded346eso12831221cf.1
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 01:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081982; x=1781686782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K4Odi0h8mvRiXoQLG9GdfnXsVeRWyJkyrEIIy370Y/I=;
        b=Ok0jlbg6S1ZtRn2nzgmKPShA5QJtc00NfJBPufdZR8dTicwTK30k1pEbSyW3HLgL3c
         05sG/0dSC5JyLKQdU0pVr7jKjpb4rBDYD7oQau3e2EHCiOCsWJ8I7iOn2/h87DzsgeGo
         gfXwJsKOJvJWTudSKdic5lsmsaWTgY8KG/rE64PeLk/rAVRK1Xb+v1QllFwKQEJCB8VF
         3FhyrMHSpV5bKRqWnTZh+cw6QBy042sVa9FMZtKVr2DTozcnG5lm/iygULuOqNpapV4b
         JApgeBmMVT2/yfuyqXjBNJRF1thdcLfXTaRRjVoJoFvSWqSsn15zI0TBUcB97qNwQkXz
         co2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081982; x=1781686782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4Odi0h8mvRiXoQLG9GdfnXsVeRWyJkyrEIIy370Y/I=;
        b=b92K1ktvWjfeu4BHozqauaUwXTW8S/AcCcx2Xj8RmltyMiQyC3Vp1B8vWxqwJEhtGq
         Ttd4A2Ac+pmdp34hmS9ZcfP6j4NAX4hfWRKxWPNwlQwIJInnzg5jSRvY49ZznV+pAc5Z
         JrdetpEsoqYLtv2hV0SWhMrXyfAtR7QPfhul3lqtMyyDVlfdjKDjQKi3nK7fCC8mdF2G
         EdhRxNJgb8nLZfcf5gGlMiZlrk5/ucL0WTK8/2FEtWW76zFumt8UJnTvUiMvbqbITZrz
         qhTmcanDq/YfbAVI0RwDS2m1iGv1rfV4ygUk8jcVg7LUuDpS7h9lt3lRDmYqjd8n0Yyt
         K3Zg==
X-Forwarded-Encrypted: i=1; AFNElJ/u5MQH4k5sxktO7iYqiT8MvLqEhU0hV8LY2VVAHKcVJvusjrYtHps5FjVnSfDdLdu5c20SSSz8sLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjhQo5JGnQqWE0zbq+qMekCs4ps66agwdS/l3sk0/W7hlUQkIB
	FlQcl2kgaxTJTrEX//R3vKEzfYFeCmUAApg716xxBEhWrxjVs36YQ7ydFcKnIusEAhHbqSlGk/U
	WA4MiYzUT161jMVW4Lf8IYDZ7TXOAp6kyO42KAH3TGmg1lv4gGb04S0NONK7kW0o=
X-Gm-Gg: Acq92OFRLiWOScSMKQny0ofUujwRaUOYMtkiLBFoGfgTNG+EbGeTAlfnZSoFMDg+lCk
	8BqD4phdFW4x7sIY4+cgjECVExa/KeukCZA0ZiOQ4m38oCAZdV03LB/RNuJWEe8OeNBHr8OiEK2
	/EYS/dT8APM4XZmATjsueu0uTErWjHyYE9A4zq8IHW3S/mi3Le6sK74tInTw00KG7GGhd3bBN2W
	q85uk6fikgH8lU/jOciN3xnRovn/f6OoU9EfNdzJSb9ja3/wVsIbQNI9SRP1mIDcSXpCQSYGnfI
	4KZN+IZ8sbfTNGFEVMUketzQkerZPfbFwFLtviAiiymANpJ0HKltrDgBxlVl5PZ5kwv4SxEMv0L
	Q9wRB1X5rYdq85H9OfnzXmr2haJ8vIxce+AZ1Rz+eoOq1ZLaLcjikWQFf
X-Received: by 2002:a05:622a:1186:b0:517:6162:daf2 with SMTP id d75a77b69052e-51795bc3ca5mr196189851cf.4.1781081981882;
        Wed, 10 Jun 2026 01:59:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1186:b0:517:6162:daf2 with SMTP id d75a77b69052e-51795bc3ca5mr196189601cf.4.1781081981503;
        Wed, 10 Jun 2026 01:59:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051770c7csm1164756366b.12.2026.06.10.01.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:59:40 -0700 (PDT)
Message-ID: <0eedf3d0-79a5-490d-b1a6-44a9eb60e0f8@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:59:39 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] clk: qcom: Restrict IPQ5424, IPQ6018,IPQ9574,
 QCM2290 and others to ARM64
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
 <20260609-clk-qcom-defaults-v2-1-0c67c06dca11@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-1-0c67c06dca11@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4NCBTYWx0ZWRfXyyr5SuiFOMML
 o6Rw03jOAekUtQ1bOIA2tsUI6Is82PwXc9AOjAS6yFOcseSBnthA8QlY8GBryc7/lXFa9bAsSVu
 PXKi6DbS27/rPHrqcCz3oIQVwKC8a0S7RqBUDV5uG/Sj/431ngkGHpGDPrempr/eX71i6DQFx2F
 P3pBpcUPTJTHlNY9yphV29UhfO2DitW2Ua9yQbOudPJ8ijjp9WCzZ+Q1hcnnKccyD4x7U27UE3S
 dLE1YnxF+HxWLWn0l++T9b2FE6HwLyrcXIhKd0b49AEBQ0WWHqJq94xMULednDt6RltO+rykgYo
 eVlHCDq+dPZsGxEzuBdf3F17OTJp1SvtpFPEkVbetpRgYhqjlq3DMrjfnHYuo263FNKzsDRneS8
 SM5Gp1qpkMIkryU2clouRgPwiJQ5Pa6cFsivk7SNgHyajYd/ta8A2KnAPz62Yl0po7H6up5q/kA
 PeYfEzllAy0K093Ur0Q==
X-Proofpoint-ORIG-GUID: yeC2sjOAPRt_Kqri6UBOM0SB7hDrMBOb
X-Proofpoint-GUID: yeC2sjOAPRt_Kqri6UBOM0SB7hDrMBOb
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a29277e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=XY21xBfZkjNNQA91HVkA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100084

On 6/9/26 5:32 PM, Krzysztof Kozlowski wrote:
> Some clock drivers for IPQ5424, IPQ9574, QCM2290, QDU1000 and SA8775
> already depend on ARM64.  IPQ6018 is ARM64 only SoC (at least upstream)
> so should not be a choice for ARM 32-bit builds, to make kernels smaller
> and user choices easier.
> 
> IPQ_CMN_PLL is used only by the SoCs already having clock controllers
> restricted to ARM64
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
