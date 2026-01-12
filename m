Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF1F32A3C8
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 11:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768216428; cv=none; b=ZpwXxb5ZPLbXD9g99uiDbY8dB25rE3vWNTea9Anlg9xGDZ3E6lJhktiXrYSnEv7GeDvkHSi/vrOx2z6wcdCz6qptNoEFZ1i6778ayzFq3JiqQpXxpzZ5v8kizRMFH+18oImjKUqt3etiD6NNsECkGgjPMM+wcOubSL/7//MEwJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768216428; c=relaxed/simple;
	bh=VrdWiTItojoB0UvUnL3By2wiL0NBycrQaHONOvrlhe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rQXd6kJ4r58ejzwREkeTo6PwtT3lcqR0n3Dop/Yt0hvu73IGJr1YuOQ9ugl6f02X3kJwhTc3wUCxDHqB+dWkYIEuN2EwvnmyKcFzYVUTo+nbRic9rMS5ExwC2rzOVUKZGjQNg3OlLBbwIPKJid8j2tB6wxM9PrZx4HCBFgo+m6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HSKVZQG5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gTdb3/Km; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HSKVZQG5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gTdb3/Km"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C8vWTu113520
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 11:13:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N+NryKDtEvMjKNk6KisA7xnioR/cRPqT/YOulD8K8rU=; b=HSKVZQG53puEqoEn
	JGqvRPwOWa1aJz5W2frHNE3vBEX+Yqnh8bqaZB0zIEifZiw5qJjADNab4//HSOaA
	OpSVVzo7humGi2WNBXJ8nVQExI2aIT7SYnp0p702BgGfMJvEh2bgiy2DOYujRTFu
	uEiKBvZAsGN3nMQgXXo7CdC+XQGXTVzVnVR+fK4MWoGmQAEmdA9BY526Pu8oY2do
	YWjdu2JDfirmxXO8ti2UA07JRaWPUz4myQ2aG2iJzulO0/AR0KnJ09PWGLssG84w
	odlw1JImhavhwnHSaQfuywamT4ZsGOEVhYnjEhMviNYVt0dm13s8api2Iyqi9JRp
	gE7UXw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmr4uhgj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 11:13:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee07f794fcso20365861cf.2
        for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 03:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768216426; x=1768821226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N+NryKDtEvMjKNk6KisA7xnioR/cRPqT/YOulD8K8rU=;
        b=gTdb3/Kmo+Whvm/FXehAB9TmGGOHquYE73vaF7X4zumdzhTK3AKMINvS7aBBd0v2MW
         M0GynYFjp3UhIaoNTnxkHwJdaxOk+9tKHkcmsM8bQBNYZEbFJIvkwMVQCuWnb+qlEZfy
         au8C2JWXTMcBPK1a3xagvrKryJNxUvYyl2+/EzXThSXmf+GX62+A4wneTw7PMz9qbCKr
         TsipM4QRpXNhmOAkjkEKyIgxg1Vtq5gapuJLY5GC6+kZlw8pM6Fo5WXJ0vgTpGQc219/
         hvVeBdAvs/PNMBm+FYrWbVB3PZRL8+GN8V5h7lvTWA9FS4iPce9NxMkz175beAbZVoPB
         UxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768216426; x=1768821226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+NryKDtEvMjKNk6KisA7xnioR/cRPqT/YOulD8K8rU=;
        b=TGlP6SkBLRfHk5n04XmpLZ1QDhtub7FgsaRusW98n53KqmH8j4TYMw5+HbXBwE7qzi
         FaLqivaX/xFCRRUvpIO0+NSzIkXB8aVgACv/9ALtBjzEQ0MRWG0d9xRn6vBS5sIQ8jr6
         R5ZsNWPIhCCUpS4EVxDjWCcrEEqc5bQobHczV0BHP3Z6xgO9CuEcNZmGOOZLOjC+XCSq
         ay8ykXlqgIPyUTUmiqgpbQD9hT+Qp6djJIgqtUuYEuWwGaCCw8pW90itOx5VWGtU+c8H
         iNu43Ud5W/6eLRWBvZYOQHTSuKzm4cxvwGEGqfCe/gPa7lT0ZzFFwaGHJanUWW8J8xr3
         IvCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtCT8NaxB9Bkw3lqQJI0Rb+5TQ7zWJdsM6hUz7R1I1XKER4bwwKc8lx74SwRa/SyD2GzTqup+Tu58=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNhc9Xt4mm09od4GZCK7Ly0SgDZ4DGMvh7+KWSAG7D4za8dKKs
	GLHwuR1fhfiKS2vyAQZpN4YPHXvUg/+W51Ry4sS8ojUoim9DuOBnNspHDsTKIDYSNmxn7lm1EET
	uWghHDs1q6MH4Hw7aCtZ2P9AJTMZg0F4B+nMJI6wj+Xe1O1JYvM29C0o8ilY9gos=
X-Gm-Gg: AY/fxX4vmNnp/w+A4eaMgkoRospYyX6y3nCxk6BFaT594FST7VQXZlaqeFxwtUPz5kj
	yPMG1cf0UJqCNf7nIvKQk3ivablibbkZN8qMwd4bmIx4Zs2rwKrgPsk3LHg3ASDS80Ba2WNMWGU
	DefCb7pdK6/L2gT4F5o1Vetwq4Fu8Ytf7/i0pIEk6Qjr2azf2waMsFoPDC9JTGwmkkeItbr2Fqm
	lFaGImKVa2gwtNFnLYWRPIW+DSnrE+yrg3J/cSyU8B0oytV/MwC8atjguD4nzRcBQuglwW/ctKB
	/y0VBoH1ZpRyVAPXVzvcBMNx8ywbnTm7xaP/cCFgb7XIVhJnC0rDaogxkkCIqapd8nPxW/BJofb
	2G/GS6/oK+sWrzXXPeDsuTxVjocOOfgITBWT5I1Fy1Bsxh8HbPF7STSad3g7emQuaZaM=
X-Received: by 2002:a05:622a:4cd:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4ffb490511fmr185948571cf.4.1768216425954;
        Mon, 12 Jan 2026 03:13:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEElM4ll08lOpzkHDuKu7CKsTHNXZ5gxeHC2/ZX1VO0z69vlMOAjoFpYdj8WO/qIPyj/UCVig==
X-Received: by 2002:a05:622a:4cd:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4ffb490511fmr185948381cf.4.1768216425579;
        Mon, 12 Jan 2026 03:13:45 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be658b3sm17106912a12.18.2026.01.12.03.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:13:45 -0800 (PST)
Message-ID: <7c7a5332-8af0-424e-a26d-d87c524e30f9@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:13:44 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-sm8450: use RCG2 ops for DPTX1 AUX
 clock source
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260112-dp-aux-clks-v1-0-456b0c11b069@oss.qualcomm.com>
 <20260112-dp-aux-clks-v1-2-456b0c11b069@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260112-dp-aux-clks-v1-2-456b0c11b069@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4OSBTYWx0ZWRfX72P9zxHvcCjQ
 CykUFH+N/7mlssUjVz3OlAikZpe/bjPe7MxwpHwq/cbnMiZqVHi5NQi47yu/0XAniTBugjsJ5Bh
 79iF5KgPihPP+Ro+KMtoQqpl1a/QxbMfmYIaU7ZH8G3DMyo7DCs306CG8TIc0VEKpt+2LCUAFEw
 8J8EYTosO/dCzVKP99A6+iY09wVAyLwQTR1xbv2YCaZm0B5Z0XzqXE3LayVWF2YRYcahMvjnEIn
 /hF6bPb01ffp6r9XM6G2H4nr+DloiqCicui4TzSNs1Q8RBmfrtwuFt/QZQsqkvWeqb2vZAcFJq8
 5L99KWtOvSd11LnmRX7NIZyt4WbId0twGgn/fXrnhtOk0jOQZukWw2wTfI/g1xIyYDPdKszYHGV
 iUYCjR7NkjghugnsowXDiOLGAZOcCol82pCxYSrb9OQa5ytGKprs2DodYTooak1e/hrAaJeEcMI
 hqAKoDV13DF/5pDxSWw==
X-Proofpoint-ORIG-GUID: PmqeaXkJR7TC19tIsk4wPUykK0m8Ip_9
X-Authority-Analysis: v=2.4 cv=YocChoYX c=1 sm=1 tr=0 ts=6964d76a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UIqvOZ8aP2BlQGmZcB0A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: PmqeaXkJR7TC19tIsk4wPUykK0m8Ip_9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120089

On 1/12/26 3:12 AM, Dmitry Baryshkov wrote:
> The clk_dp_ops are supposed to be used for DP-related clocks with a
> proper MND divier. Use standard RCG2 ops for dptx1_aux_clk_src, the same
> as all other DPTX AUX clocks in this driver.
> 
> Fixes: 16fb89f92ec4 ("clk: qcom: Add support for Display Clock Controller on SM8450")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

