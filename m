Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B9438C41C
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 08:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776154088; cv=none; b=S4ha0JBzeilMIoiFZ7qm3gPjbUmQGva+R1HyK2ZPKTL7RtiUGH39LBfOcgjThpxPqTRD4QlcRa9lucK+6+zp2P8RwtuQgGPTNeCPWtxeoEFtb7C7RaoZMjWrJClqWOw0azkZ4kHL447VF+pvhoOQc/bjEdsVNTAWy5xHfLkrO8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776154088; c=relaxed/simple;
	bh=+na2rETZY3PhgUgP2f4aP6B+WxxI3R8eOMpOE0i2NN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VEklaaRkr6r/gT0BYM6lwdwnTu3s+fIyDFuxlyqzJ/euNiZo/QWEPSHRBkdlZeAMLMlO0/UeA3jH+Sf3dRlP/fZqJlH5wtAEXiF+0hNtD/AHojfgfzNO/BpeB28QinUZZqM9fxj7XFNWYAS9wMoeagr6CSbs+ViZywoH8kYXC1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TySy27fE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+Pov0nc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TySy27fE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+Pov0nc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6V0kh2509966
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 08:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Or8e6KVvqN5oLm2ttfPCRCtO9ggnyvfWSveduUn6uCQ=; b=TySy27fEX0oJEA5P
	1yGIg6jqDVxYj4yWvcPAjAAr5FFMxkrguuexME0GvhJvCGbNf6AXcjVqu8KaFEZb
	CD0QRpJyokuZcneIS91Azo0VZu3+vDbuxzYzzSpbb5jWB2GNwnS9DTqTdiNt88lW
	Wcc0gODe3myzJV2yDkcU/rI0WAlA2ZUtVsf7DF8DqMD8+4wVjmOg+0CFsKLtWEmZ
	nekXuDSK/Eae6NGcy5RxOCgDpkBzeQD7Bfryuwb7Q6W5oGcVGoHNZtuwTjvDUPBw
	4cTPoTU1kRDm9iFo9/zEmhyzCdh0chPd9hnpJ2GGWC6f5fxQuIM/KrNbndIVHxTI
	KQgTDQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh867sp6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 08:08:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d45ebdbc9fso106818485a.1
        for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 01:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776154085; x=1776758885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Or8e6KVvqN5oLm2ttfPCRCtO9ggnyvfWSveduUn6uCQ=;
        b=X+Pov0ncPtujRuy5DaUAzgLNC3lVEg07QZTt/fqGUKHKhLlZNJn9PKGt/nFQWz7Dmo
         oz448hK6QlAY/9ND3g9UClZvTeJw6/wW0iwLGg88KGT5tlgFbo9D/SSP6qoxv0HSdIjD
         0u4nz/AKBQ0VrrKlCC+9XHxzyx5LV+g7UQVzUXCB0um6QC/1Zg0yh5eraXVTTok7s8WH
         Y5U4AUkzgwlzWvaOxnkoIMcIU6Jb3eXhnrkJiwLyDOdz2GhZ3GLPhRYolXoEcZRsuKDT
         bFrnHHHVbGaRehWGwCeAVqV0yNRyzdnkMzwpsQ8fjysZPCcfqrNEp7Jr+BAnj2Z/+4J0
         m0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776154085; x=1776758885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Or8e6KVvqN5oLm2ttfPCRCtO9ggnyvfWSveduUn6uCQ=;
        b=pQBegl1eLixT7p6bd9O2mORGJFkD1nwjeWtMwvY1mpG0GMA4QUyxu6RjzB6cj65xxa
         DPGLZ/S+9gD9ADv5pXCFz9i2PN9y36KMerxHlPQVkFbrMtmQAWuKr/kMjtjamDkeH0Gy
         U547Xv/zNzbKn5rrfc7nx6gZuB/v8ztbVr/vJa2s7iCj1/ZO+diFCEt+H2DNVCLRsL5J
         4RPAnhrz98rk3CHnIkA57cZzLn8sTnLc2XX1pXsLPc2HxVpvb2IKYBD5hLPdrRou26cW
         CodVFKCR9nGB6CtTznC6vdTaMwb8kfNzmYbOl3OaCr9IRBKb30ptCqY7l12OzzRU+lMm
         Mrgw==
X-Forwarded-Encrypted: i=1; AFNElJ/gKGj5s3LYN9KbnaEUEpAVoyY3FuOmenHQ3zWgEqX/t3M4jCj0C0X6iV2b/uExrJYhXssfxJ3rf9c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/xrHxvnsZYkMpZO1yZsyB9tDwVExJH0W0cDPLBoPZqFvSiAQZ
	+j3MHMAZAd1vnv06POdEPSZDEKCSssj1n6ELLQ7hM9sq8soaJYckDHacZbZbiSTVo74ighTzY5U
	06UgRhP8jPgwHaZqAOgVKTsFQPwhZBjomD7bM+PpZGcbbITLh7LEJLO4XuYwc3oM=
X-Gm-Gg: AeBDievgNS5hwqZUg2gtjh3AhFBoeS+ATaigUle69ygJncQYUWzBbdkKYvH20Aniu0U
	Qc5gGiKuu8uYJWFNenBwXo/1kI8lXkB/cn1UE4RmY4YA6R9TGoFTNcfQWKvGD7+N4OHgh274Vy4
	OxeMAbdPBfAJP3SabgjvC6A5dSA+UpulkGtwZhS0oozueGxHiI2SqjDcFWJiEbqvSFglOahMcdt
	jqSRVNwbgD4J2u8o52xOK1K51RJNHR80aCN7MzNZ/X+d5ljgMh9TezmlU4sIwAn+4r35za/xC+r
	duSx7PB8XimYC2oyBffhrGHerBfazcd6qfcX6+J5E/LNe0cp02JY/JfgOvRcLo55Ox1qEpehz1u
	l3WLgyMG5ZNYM79gsY8RVEqj+T+aRRD00JwG5E2Y+tIVzLk/bRHfcLo9oUJSAO4MuvyZlR8GjRd
	1zhTpgeVDQxTdj/A==
X-Received: by 2002:a05:620a:410a:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8ddeb1cfaf4mr1620677785a.4.1776154085210;
        Tue, 14 Apr 2026 01:08:05 -0700 (PDT)
X-Received: by 2002:a05:620a:410a:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8ddeb1cfaf4mr1620675885a.4.1776154084770;
        Tue, 14 Apr 2026 01:08:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670eb258a99sm1899153a12.15.2026.04.14.01.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:08:04 -0700 (PDT)
Message-ID: <677f1d1d-a1fe-42ec-9e82-c9e504873c98@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:08:00 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] clk: qcom: clk-rpm: add msm8960 compatible
To: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-4-007fda9d6134@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-msm8960-wifi-v1-4-007fda9d6134@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: inNAJbfYDQ6Tzl-T9-CazwppVUURlJi1
X-Proofpoint-GUID: inNAJbfYDQ6Tzl-T9-CazwppVUURlJi1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3NSBTYWx0ZWRfX21lfxcyk0ifP
 gs43IPvvAK18d4Vw9pxRZQ+nPVez4HAKb+u+DwXHbH3MZpBL8VCKWXf/PVUD853y98R/zA/Js4C
 S782nUSRac/HXwi9ZgdDHaqvvterYvSuMnasPVAWrH8y5mi8FVcpbcMA96JPo5ucRa/laiiGoJJ
 kv51JpHkmHBvKclYKZox9vQ/MoB0YeaJ8wTDMyMQiKPaIaCODR2q/+YGR4yjFVhNDy0b4kOtbdZ
 V9WqhoZ1kxdWiCN1iGjGvPPIM0x+rttIxQijIfVtVHPU00MrLYVQGzIcV5kRMjOD/Y2S/bbGUfm
 lUJVxNf7tJpwxMvkFNl2Fl8YFS8MtMJUcwP9wlQ60NdpngwkS9A9OoD5KOLafMKa6lYjRv1B9J2
 kmjZRyKoUgG4EoEslbK+AJO23Iwwhk5MlvXht84I3DKu/mcC16VJHhGHCua2pdTQ7DHxuzKUIql
 o/eU+Hea0yGwJl3MgMw==
X-Authority-Analysis: v=2.4 cv=etzvCIpX c=1 sm=1 tr=0 ts=69ddf5e5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=wxLWbCv9AAAA:8 a=pGLkceISAAAA:8 a=5PoCL-xiRuW4qANWJgcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140075

On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add support for the "qcom,rpmcc-msm8960" compatible string to the
> RPM clock driver.
> 
> msm8960 uses the same RPM clock descriptions as apq8064, so reuse
> rpm_clk_apq8064 for this compatible.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---

This suggests a fallback compatible could be fitting

Konrad
