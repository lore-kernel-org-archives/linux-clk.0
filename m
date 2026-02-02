Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0582E35D5EB
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 11:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770030020; cv=none; b=CpQrS//4qA9nlo4bvh5otUnrf0z+9ts0yzclN76WRKsQqPq8rC5aGiFqP3tQBKTUMNAVr2+NNavKewzvH3ARvuDPdbRlLLunFpLDBsHz1zyoVi+pwEJeC1lQJSYpX3tg0B0woqiUZiMSV5juG6j9UszWPRmk57zmb3PPLEYIT28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770030020; c=relaxed/simple;
	bh=rDNg3RNfurGN1Z6oV8ZAzB/LQiPiwhWEOlLHnxUvaWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cN0Vo7++2MONWIg0uUGs3eOfFau9Uuqx5JP9lUrUlFqt/JmhuVcin2v/+3tyaALlYPsqtXthvWE8UOnma+ZreCC50rMLXLk4GjtPhNamNcDrmmrqRqrDloKlG7TnDGLHKKDl9UboZkSkW04M9hIqsrx91b9k2oj+hgmmSYfefrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U/13cqsk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X2A19VOM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U/13cqsk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X2A19VOM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612AtL3g3916015
	for <linux-clk@vger.kernel.org>; Mon, 2 Feb 2026 11:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K8nl8n8+hpRgD4+NstSwXyU0r/XY4eYaf9Gky0MTgSo=; b=U/13cqsk+FJXMZac
	3hyJSrD3uiPA5kCpemopxx6Gz28WT49/Cra4/b37224uczGNuEYeKdFnF7NxEZmE
	HDVAlmSBDC4D7xaYbHmBpByep3jHWdzVk1FE8KtjFp5ilJNyUodZPUmjmhRqINqy
	rSRxE6HxxGPEDc7PIQrp25dNez2SYniJbavSmuAwMjOKJG3h0bIzp0ck29BSzKth
	HRNb+wfS1zLjO15MsehX8XKdrw7OrjJ/Ax8vRKO9Z00izkm3hEpbBKXLlijC7kRQ
	3qzA/5o62f9n8L7JUK7fj1WRdOGJn3qgHBxq08KaqOYpKYCK6mgXgrM6GhWXGAMT
	eVKvQw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tkmg0hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 11:00:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89496f5086dso13618746d6.3
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 03:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770030016; x=1770634816; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K8nl8n8+hpRgD4+NstSwXyU0r/XY4eYaf9Gky0MTgSo=;
        b=X2A19VOMi8YrTh+JdEOdSnfpKrEjMMho+uUXYgjRgCsFy/L3JjcTBir63X55dyxI/Y
         o8lfiYk2+kCFAlwcbzLxS6m+FwGvaY3u9C+ts+0XfUrt8EHY2c9qyIcs0ZFs8lhwp9NL
         ZoIoDakOmvU63lrKYhuTla+vnjB+0uopMVpzumbXbvyhu4wO5s9+PyGZd1tbGm1mmZ8e
         d4IOaDfxgMGmqSniR68CGmTUmeuddMi4GKoeQq0VzVAPswejNGOeoJagjGWCg3Opay3L
         Ab91aWwv+PpkzBvgLDGmXSvn9dPWmUUf/c0ehO1cmhjhS2TJqoDUADIRdgygIf/qPrmA
         R0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770030016; x=1770634816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8nl8n8+hpRgD4+NstSwXyU0r/XY4eYaf9Gky0MTgSo=;
        b=PQNKSoyNvIsX/fv2bkWtvJ5bfziIvcWANspZJ304XVnruQZfIbT9EaE0XKwZS5PAYO
         lKhfp4eDeMlfLUcd9JBBJO/cW2XT0lB7ddd2qL7pKS9z4MISU2560MRoszShYg2zEsGn
         Blnb0E14b5lSgynpptCyT/4J981fub9z2fI6MoK8Oc4Tc7mbUU79yhk0p77DqHItZfBK
         zb3aJ+ofqdRJe9ZV2gPssp2I8P8rFa+Zd4kXqMSTfmKh/h4x0FU0UlzSOjl9oeXDg7Jk
         YRNVIDGNIlzB5e+rQH+N3K5rK8/DEbM6JQsAltwyn6haM3pN1TrQjv1tBXu6TlokTB0J
         lvag==
X-Forwarded-Encrypted: i=1; AJvYcCXGy5eQEno8iDeOMdbgwYRqeul6eACd4aP7G01TFPC8/UIr2GjoEBlKxyiod2JFATsgzn0X4pKJ/X8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHC9YkTR6n91WjwBq2vpoGBdf3g3PaODnrqndNpS/yiEfkO9zM
	hgO3AiDUNDSWqYHrD1Nn1SrofxaR5eRJnYpIc4eEEs0Jrk+jB+8L1+0fqu8nX16JADQ/hnwrQwe
	DJo8P2smhg4qnDzsjUMevVv+KJToPMZ7SDTaGTavDkyqxPUOjQ3hyej2T5AwHU4U=
X-Gm-Gg: AZuq6aKXsypTAu4zc3wxbOabdKXCJ8tMWVrCvgLG0hOf0I1Yn3j2pIC94DWazy5cCJs
	9ZyCEDyO+SajK7cbCfC5GkFoXngAmmRZn1dNo7xRVvTxa5ud1pmrTSQE9WRnDg8kTBKcyyKtZJ+
	rG+yOHwVxRZl7+Ipm9NKsQXMiupuM+lOHbuqMVI2CG6rTuEfUptNXW6SMEG5xFas/f5XMOgLs2C
	HAvM54foRAEMRA7SXEGKdOX5Q2IWew98IN+lVv2om24mPdDIyNl9lmW6vPPVD8Y6kdd0WFZh5Mz
	jkwWLlwv4YmzxInRSjGCvU9+QMHOKzUzLPhsTqlaMd/LIl6R0CHetWOp//Rtnwqw1we0w4LMW/T
	1EHzhy5J5oUBjjns50Ohr6YePX7baltPXBncrJKPsW0I+bfbD09/sBSrX8bxURrgsmIo=
X-Received: by 2002:a05:6214:8009:b0:894:e086:e4bc with SMTP id 6a1803df08f44-894ea12bc69mr114323716d6.6.1770030016094;
        Mon, 02 Feb 2026 03:00:16 -0800 (PST)
X-Received: by 2002:a05:6214:8009:b0:894:e086:e4bc with SMTP id 6a1803df08f44-894ea12bc69mr114323166d6.6.1770030015295;
        Mon, 02 Feb 2026 03:00:15 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b46abb3esm7641208a12.32.2026.02.02.03.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 03:00:13 -0800 (PST)
Message-ID: <57c2b126-2620-4fc6-87eb-31b4f8299dfd@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 12:00:10 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] clk: qcom: videocc-glymur: Add video clock
 controller driver for Glymur
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260202-glymur_videocc-v2-0-8f7d8b4d8edd@oss.qualcomm.com>
 <20260202-glymur_videocc-v2-4-8f7d8b4d8edd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260202-glymur_videocc-v2-4-8f7d8b4d8edd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TaebdBQh c=1 sm=1 tr=0 ts=698083c1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=d7ClhsmVZ3m4v3ji_18A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 5I4SifmWF1xLfiJosbnA6oaDph6kCTkY
X-Proofpoint-ORIG-GUID: 5I4SifmWF1xLfiJosbnA6oaDph6kCTkY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NyBTYWx0ZWRfX7OhZ4Z/DIqOz
 PUQ1/0HY9012u0jpCFiKy7FiLPGjKjVk6Fn8MajI3HSFwVrLtZ4ndo8kDxWdBKwONC6XCHf+Dse
 YANWEvATK9qE31H6hdMUkWpCH2O5SGtpMSO5dHteM8BQnW5mJJUroj/0GUums/MeusRIa6bTtIA
 Wsa00CD9H8WQK6Jpjl/y3IFmIpxog2cMKOFe1hZM7YRGAs7HEjheLlheuYWgcpl0yV9ciJVCi+v
 P8xi8oJfdCeUqIo2BpR2lAr96G7guUEH3O+0Yn6xzuUGJOQ4U1M+4SIjLtgMQ305Cdz+ZEqsj0J
 cwwqY9tRZNN4mnw2DDmMFb8BRjhW/nX3WVQluvbpBiYiPa919VOMZhuoISP/WUft+h1D61aHpJM
 ygdRWu1JvH2FemhbHmo5bZCi3qGVSGBaXrA4UEWN18B2JUeS+E7PTVQX1k87pwHRScwvCHNph2L
 3Mek6cdCijroZCL2Kig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020087

On 2/2/26 11:56 AM, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on Glymur platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
