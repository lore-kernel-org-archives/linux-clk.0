Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5045D1DF982
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 12:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758804424; cv=none; b=B/m11y8sLqn8m2E+fdOTZwhAI8zKB08sMZ9oUILreI1mMaa5r/L9p+7TaZiHpnT49D3ed78XSBnKfgxUOxyP/XhLydu8qpr1KaMTXGs81ikwvg/VgMtv84rXgeZn4ivKTlHpJyy6XQU2ztiiIAjbTw2SLHZ9d4fGbygMPGh2pgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758804424; c=relaxed/simple;
	bh=Sf3l9CHT01uRYsHEl0V9vF5wYANn0cN2l7qyPLMGwTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eeqwQOqCOt9jkeKZG4UPg3jsEuPehM6UonaHKswlysJFA5kyadwqP+s0qW7EWh/N+W6/+Bm8JlBcC911CGzY0aEZ/cqZwsLeQzyy5L/hRhiKIMYbbPFrpAc8jXoFqY0scArfl3+6GFQfoNnEMpEKKOWZIUTAgSG+enhUqnZXbJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jqA18vdS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jqA18vdS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9lH6H025119
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 12:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m4djSLZXtAvXlpgvFemWia+EmnebRJaAYcpun5RmN1I=; b=jqA18vdS63rgkH/K
	9+QNA3ax73bNrzpf2zfelbtIBPv4o2/DH89fghA6RWHiuJU8cfIM9dyshIvvTnrJ
	jn6EYeC1f0eXlgPmx87Qg1xdMvc4gqciVdiAe7In+xzeeoRK4n06NJZZycesxz5+
	tNeGsPb7julQXchhf+ha9QcGFdXvfLFqRClCEgVTCMKOyKZZllXLCpOgKNvZLEqW
	KU2kbYpMkW0TczT4mz63TY5PzV/U2AUYh6+3hsfkUXLOIbh7gHZGN7pt2o4fRoit
	bMOCdXa/TitRujTI3m+dwRzoPrxaXKB6Kyp0/jTmuLez0EdnyISLAIit+Psmu1xC
	s0IwuA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv1848s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 12:47:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-85a8ff42553so27840585a.2
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 05:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758804420; x=1759409220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m4djSLZXtAvXlpgvFemWia+EmnebRJaAYcpun5RmN1I=;
        b=V4+ILeq0RnwloioY55jkAf2lDncTXeUjOSrHjJlBumodhXsufq+r14I+PR3Ko1qozg
         G1ZqK+bT/IclEJS0PxFYIYMZlyngc0prAnWLYQyT8aokW4zkrJVzsR7lEtidBi5FPImg
         UIQUQmZQQlnMYJ3Wbt4ZA/6ovk2mQ7ilfGd/gXNHNKktGCXjQrCUdo5ZK+dy0zhnRNm7
         8jE+MBbrQPnEijsHMKeIv/tlEEXQaGdRSbfHYvxiCZfWX8ynGgxWKsgQOfkS3Vh3aT0J
         BJR5gG87E0MlqOqpDMpAbh7sbC4OCNnXlCVzGYOR9n7aozWeHH+Wz8Ihm9sqxPntQqD8
         tNog==
X-Forwarded-Encrypted: i=1; AJvYcCXMmDDN8KzOLdp5UHIi3upqUxYmHEkYE0G/6AlPt9LCNdjJHQRmNfl3uD9PsklHLs8R4Gd5aMQRh70=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjECWzcjCM/VdkNo3f51gIP1X+PGOLp885a6Y/izNirAC8iQBa
	qKCZCSQK20tkySsNs/oGsWEJkEwCGtv0BSMImKeWE+cE5uZFkpFU3naMvkefDLAzfmGbxnWqMTh
	0cgQ4svaBjZEeT1IQ/LutQBxKeAI3bEJC54yxgjxgMRXrFGJ5eDQVpZT20Dnc5EA=
X-Gm-Gg: ASbGncsuKKlGnsq7hOOy1x3qJ771Gbp/SuQB7US8c37MsXrVahokqPy2Dr8wDQOqS4e
	JDecgmx99sFo4kVD38+ESQMovfDt0t97qnwYziA1whUqoGlFmy3pQ1X+c3//WVFtQp6PLcWDp1N
	DpFZFEREFKMix3QBenwcUhq88Nqa+jMOf9kLoQCbslO6ueqKK3OXJTHD8muU2jfr6UH+4auMX/p
	ggHK3M4gBCKp5fOnz4SCGNQKNctaUrkExMtQwYZmZOViK/xO3OWrgCTBV0WoEMZHsDDtNnHPopu
	w5UfEc+ZwJz11Cq0DIUPzCSEGhOFpzPg8DiEHFtf4V+MYWi606BunYqgcWua1ezSz1XQ8MBDHxe
	XFhzIRwEl47EP//m3UdGXfg==
X-Received: by 2002:a05:620a:1727:b0:84d:f048:d795 with SMTP id af79cd13be357-85ae0dc2b92mr287455985a.5.1758804420225;
        Thu, 25 Sep 2025 05:47:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFb6/eSVSPaLmQN76rHLSNw8JAIbpMfof7DPaUmUXWN6Zyw726mb2YnBoPc4+zEUrPWqel5g==
X-Received: by 2002:a05:620a:1727:b0:84d:f048:d795 with SMTP id af79cd13be357-85ae0dc2b92mr287452085a.5.1758804419583;
        Thu, 25 Sep 2025 05:46:59 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353efa4c35sm160873566b.26.2025.09.25.05.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 05:46:59 -0700 (PDT)
Message-ID: <25deb71e-f3dd-4766-b520-07ae72055e99@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 14:46:56 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] clk: qcom: clk-alpha-pll: Add support for controlling
 Rivian PLL
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
 <20250924-knp-clk-v1-9-29b02b818782@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250924-knp-clk-v1-9-29b02b818782@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tdjgKhkAUgyCNw_uVt63zQwODuYlp0-W
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d539c5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=4MofXZx8MfQD9CL7cgkA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfXyD+Iu7grJZre
 zC7PbLEtqYDQ7E9L03JxjWvczBz4OBewjjtuvSyKUNlGncccFYcIq8/KP9/+ZWZSIzGWYPFxVeI
 /cblzKdKvpf26uf+vYi+VCnW6aYbbeQN2c/JDJHmLrmuPQOp8zT7YF9hpe7T/er0LrW9Zqu/utj
 Xq3x78n149Gp0mOm94UIq4WxteCZNXAtkZmgBZ7N8a1lmPGuuIF1/RGOul+lj4ApC283u3Zist2
 /8tinBOrINrQsWISoWWJzUb+oS6x8mD0JlHp9+NQ2ANMZJG+hW5flksUcYXkL6cbAp+PtHP3jej
 rZymZ9RpPdNTHep7iKKKpyY2dpGzydK7fjHU1kwbn/NvWnDyRkYdpqNh6EDXWf/UpiaDzV/iTQ2
 CfrwK9BT
X-Proofpoint-ORIG-GUID: tdjgKhkAUgyCNw_uVt63zQwODuYlp0-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

On 9/25/25 12:59 AM, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add clock ops for Rivian ELU and EKO_T PLLs, add the register offsets
> for the Rivian ELU PLL. Since ELU and EKO_T shared the same offsets and
> PLL ops, reuse the Rivian EKO_T enum.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
