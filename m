Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9A040DFDE
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099753; cv=none; b=MRT5gD/mI7owZJYb9zslYWPFYDefDtBhdaBoUJmwe53L90yz+pvqU99zdXcG/y9ntophr26pQnpkiStrNRMqEKxOWS/AfN2yGI7FFwskYfYwk6j0YJuqgJSjXHY4QTXTt6ScGX8srQBuICJM0P5FTrbzwSFL3KJUP+vgffdrJcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099753; c=relaxed/simple;
	bh=cuq1c/6+WWArjcGSMbLiT1Y+RaBUXU95in/iRHvw4X0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IOv49AHtf0OAkeK86HT4/GwAE79v09MqwVOIK/56ZClh2t8Z4zCVPwhbn+BeIICEZ9/+YdTjlVFH5acBH6pKvQlt5xphNASk4Fyb/ujznVRxkRtSQLRu8e6WPAEbLqE25frM4bY1yCCcXj8J8/9iSRuP24EjuaxjvZdaUq9zxvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LG8KypsG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mww4hI5k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LG8KypsG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mww4hI5k"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBpoA1073036
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/BjQi6IXqSkEiDb1G1KVMnKAIZrDjPattnHAhdn9E70=; b=LG8KypsGhDd5E+SW
	lWd7og7yJc9jQAozib/7JQ0uYaxzmQd8JZ/CEPnOoIH3bKcFwup06dR/pMi4Yp29
	PmUiLfM3SsOLFFzYJnBQeaX7c+WqXxBuWSnOO6qUD1IwhuzuyT8AWz6v/oYPvBvZ
	fTwBuk8riqkutFWsyN37eL5iZMr+m6zlaP+8z0mnMM0wGerIvXPyTnZhtdZo7oez
	eY7XboTkK8FH8mDZiazvXMZK2T/5X1/kX2/4YyVXbBal9sbbR5GSUPlsbio1KWY5
	YLrNAtVUrmVhlAlv/SZrG1ZtTTRS0Yb8o90/UvP5lbE5rjO8i/DIeBKhiwPD5P9E
	U2QHYQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvjf7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:55:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51768e1d798so17396831cf.1
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 06:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781099750; x=1781704550; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/BjQi6IXqSkEiDb1G1KVMnKAIZrDjPattnHAhdn9E70=;
        b=Mww4hI5kfpB9pBxOM5u60sdiKrYIJNDtlLYr0cM/norBAOumeii+h+Ff0KAQMkyV4t
         AsP/poQmjW1Fi9wBJOD0MKPHfmzV5cc/LmNvMutYmEEvXYqRLJV71y4sfbQRH3roO0Ad
         iNOIgC8t9tolfHg2H7QiGQ4TWWakUdDtWVDYpcb3a3Zf+4kZQ/e8waX3qFVPv26x79jF
         3dva998Yv7tolIJAj2U4ykTEI0cbyFPRDbmFjze164W0mKn6Z0JPJakqKPLTC5D+Y+SZ
         L9RkGvbvfVyWlSpkzDsPCafdy3jCBjhwlRFlIXkVwjaXp17H/W7m7AmJV4Xbz8vJjeDs
         9xzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099750; x=1781704550;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/BjQi6IXqSkEiDb1G1KVMnKAIZrDjPattnHAhdn9E70=;
        b=MXPof0ko1vXBTby6IuRss94EP1M7ax+xwBDlQnrsWc1OY/BommoP/yBERzChVmlV/e
         1Fbu5hjG+GrjKbRY+Ty5TYeEVqKUa8zFaMzcJ8iI6Cf4eF0ypeqNt4B91gQkYc7zFym2
         +5mEmt2/0si8lro4fbxGU+iEdAGHpWUfJ/WjCHwOzVmUc3i6WSAS1dBRfuy4hM5yn8F7
         Y1uxt2PGRVqb3JgoH9S4+IN76fvjsKj5smDBKBTnKJniLkmNvYG3f/9uXqKIm/WqARBi
         LPVnneP087Kaj9AA2P4uBAV2z+/XdpEl0+Gy3qbBXBfw671o/4hGPtj3LWwOUUIk9vlH
         6L8A==
X-Forwarded-Encrypted: i=1; AFNElJ+J/5oowHyz9olr3RabFWMbgfVc8C3gSH60OupqF5rcwFMryST2sIOap0xREpkZ65NmIDxLtbEwiwM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6PJJCkYi9YQU9tCPcTLS+qCuUSp0Y1dEmzzokRvWMy5sB+1fD
	tLB318ImZYaESXJIqT00hO+rqDoil05hcqx+VjZhIYhriZsoeza1mzd/nRFYbuZGhvcqjkjHUjL
	r9HCaKGhT+wQ42M83OX+/J7EBWfxahvYrb8oYeHuG2kIRfJRe+dFtreQ/rzpjuME=
X-Gm-Gg: Acq92OE/0q1K31ezz2hi6oZpKyYG0h/O215MCs8Jsv8n1v2UMMOu5RBpuCnh6ATchJr
	WdpNXQWSzrwvCtzEuNZywHJmijg01tfpVo3P0XcrNBbn2gOVGbzDGy3i3iFsI8tV/aX64BMtAnU
	Zt4646dhvRtD5HozM4hGhZ1GFnbjy0m0u88LMTBw3sUj0yKRUjTru5u7PNfYkyiUz0saFbzsQaL
	JLzIsUTwawTABYDHknUmHsbZ6eFEWav2NOppAaQTceMXv/g9cd/iLAXh8mPNV4g/mMnphUAlble
	4gq4UKj4wuXoxhCMIFk6BIyo8cFClv4un7d0Uif0OpX8bQbQSxIcWjSjHNtG1rE4xV4Ij3qf3/7
	NC6XztZXwpd+22RLkf10354sunqzFkiaCtljceQ2IIAfK5mDWiqJpO46I
X-Received: by 2002:a05:622a:388:b0:50b:3489:5495 with SMTP id d75a77b69052e-51795bc9321mr220428121cf.8.1781099749533;
        Wed, 10 Jun 2026 06:55:49 -0700 (PDT)
X-Received: by 2002:a05:622a:388:b0:50b:3489:5495 with SMTP id d75a77b69052e-51795bc9321mr220427801cf.8.1781099749023;
        Wed, 10 Jun 2026 06:55:49 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65b57c66sm9823929a12.28.2026.06.10.06.55.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:55:48 -0700 (PDT)
Message-ID: <2392323f-0b8d-499e-9a6b-9823311ae595@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:55:45 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/13] clk: qcom: dispcc-qcm2290: Move to the latest
 common qcom_cc_probe() model
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-5-8204f1029311@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-5-8204f1029311@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: I3KYf9niG-hYdxnxkJWFTcbELvGGEcl5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMyBTYWx0ZWRfXwrx2yN6afcUE
 /M5g9jqruMWmYuZbWi5kFGZt1qmbqn7cXCDol4FpvaDDKJSqg+751OqT5vkDuXiVG9Xv5sTv7EH
 hc7eoMtBfKT9AkVLGxYFt7ay5ZjBZirxslM4NNEj854XdAOzF7fyWwOaLfT1k7ClVsFb218Oht5
 3Q6MTIAk76xWm1VZuH06SVEWe5C92yAFsaTcYfGLp55wVNMwm14P6YQaBfEyEKf3wsNjuJhvooT
 yKSzqQmcyKIDXuoyB5l9McKnr9cDIt2riPMKur5FQPdwONXlTF/+Y8bK1qAXCAgVnmkLTKq1IpC
 TSx3P+tu2lAf+K6b7Q67m8HWLsVs8Mgh5Hp6tNnTb/0r3GB3HtoBbfHPgFr/ektdfBqHXZIwUR7
 El1HZDWa0HwtQm8oTemA7vIjxFYKmvQXPoj9yMeXCGcPjHeafRgoW/liVxfzE2Oie69Rlch4XZ5
 vTKs6mdLz99+MzbSMuA==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a296ce6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=IyfWUWnWmjsiacPjz4MA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: I3KYf9niG-hYdxnxkJWFTcbELvGGEcl5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100133

On 6/4/26 7:26 AM, Imran Shaik wrote:
> Update the QCM2290 DISPCC driver to use the qcom_cc_probe() model by moving
> the critical clocks handling and PLL configurations from probe to the
> driver_data to align with the latest convention.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
