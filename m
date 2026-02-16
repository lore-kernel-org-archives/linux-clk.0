Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B81F329C73
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 15:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771257454; cv=none; b=ddGPoFOTVg3Lpt10vUvfpzun4smUqYH8WzC3Q8yrKCV9bqrQoTC3hhEJkeg1G0zjmjaCiv9LZo1AnUvC/Cm4L/bQBMMv9M61CWqlzQhNJqZlDmwOykqiDCQVqUqECgIO4Lu46DrGwGSViVZtiDey9c/h5M1BtLeO/Xw3QoflI8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771257454; c=relaxed/simple;
	bh=oeRmS+RnbI7iajNHi4vkTeNb1F6SCKI0ecOw1bP3KVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BNswgqKhjhPnBD6ZWmOLvjHWcPy30GJq6nhSmeiLwL6jBHSRx2QLGpt3d3wM0DIu1Mb+vk++/l77LIQDkBQ8o1UWo7+AwBOWaNC64SA+SGBV+Rjc1vlFwVDR1reN2B01LzurcTSW9pTxWkXzgyhyStdIrXk+bEloWJx5FsZ2Aco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S7D43Ov9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kY2R+IpL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S7D43Ov9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kY2R+IpL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G8gf8r2803491
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 15:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HDqYjUR+aQMkdEFghyjdfYjEhiYd5etbRbmhTWvDQso=; b=S7D43Ov9dvx/yiuL
	GBSnqyr696b3Vf1Nsxu4WONbIT167QqYS3hsbJFdEz4eg/uZv4UxipLmDyhJ7xYG
	lwqjJfZwSg0xn+7lT0xXvlcbV4qAjvKFfAKTQuEs2BtbxogEzjhTrfPX9yDKqEd+
	WVczDO0ybnRgqIp1DDR8NrieZyCBe1x0oRyl3cOtwVnvO8U/Sua9Ub+izuvPq/3y
	Wu5MaTCmgapBS7fJ1T6DMnoMyC6dYxUEeOVhAQ/zpV2MfaJWfO3cWMaRxSISWDyE
	xWeDGNNJCAThLEPGUFKAqbc8DPA9zJwuqN3NiY8/KfUUj+sR8+6HGhlL4E6BBWOj
	7TrkKQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxuh35e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 15:57:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cb31bcdso228415185a.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 07:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771257450; x=1771862250; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HDqYjUR+aQMkdEFghyjdfYjEhiYd5etbRbmhTWvDQso=;
        b=kY2R+IpLfoDQuAQezcgscFjakyx9mCWUWeUg5ZXCpl71PwLfSVrHLkrorpirkXF399
         bj130rPDJDMv7NLYt5SkuribU0SSKQKXWwQwi+v2kSDSvRUZMXLRkepftJ+I9CcYLWoe
         kJ5/RsFtAGz0bKTE6sNEFP0bvvVRcfz9J9vC6TvL0C5l18KGuzsZ5drtX15NZ/mRHH2h
         tQ8oS7Xg4ciUZFxHkwsMH5xr9v398gF634dk8cfI1pfGGyUF0W3Sbaldam3ZhzU9FEgV
         jPKCP7sklzwKK3jxj6/aKlBofoIz6gkNISWamIXcgOCQi0KSa/XrfsIBfogjNSQxoNyU
         bvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771257450; x=1771862250;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDqYjUR+aQMkdEFghyjdfYjEhiYd5etbRbmhTWvDQso=;
        b=Et9KQAzd+DyYx4JyZde3HYuyBxLZHJaT6CUZRp+5gSlRfponEAMlhaMrGxSpudDHiN
         qJ5PMz7GywFUo/g1sdVbgjUhS6ALyRV8xrpm7+AnV9XlhcMql0LLdzOZvYf1ERiax8KO
         xUQYSnI3HQDFtlIeipzcKIz/Eaa9/Gu6Jfad7B2L2oBbG0PPzreRDGXLsWMifUeZ2jY9
         V5OViasFkYsGWoQCP7lC+kosnqIzvWSGF7LPd4WFV2m7a9Y6QgWMwaTxFN/DLlruABgO
         uMSg5skn/HmpLABl/aXmtSIKLTRfTt/nQ9Bsm4DPLpah7GJGY0X7ceXOGgx8YQhIZDnG
         BCLg==
X-Forwarded-Encrypted: i=1; AJvYcCWvFFrwqErxP8G0M14mXlZL4Fy1sV/XWYROKkwCOLncLxO05dee/rYGWZfR/txa0SVClSYML9K9CQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiziskLtl0fhmcCULGPN8hDZrvERHwipqBOq7bTUh/FGsZVC5D
	IG3/i+o609q0VxU9hv89LpYPpeGX3DD5N+HE8GpB/E6s7qNeCGMye0zrolnI4nRPKQ74htLlvba
	8cIQI6sgdZJbbw4z/EqPWDUkm7dwEZ5E1dkR1v0YNcxAUE+/WbKqRX1XTS3DFp4A=
X-Gm-Gg: AZuq6aJQKGJLViN+AkXdZEXaGqIeCSLIGnyxYkzMWff3L2FsK7qgiNMsoxuSjPBFFHB
	W+1VNF1hjalmH58TKHVOV2/e/CxqcuwCvTokI93++IiWxVaWKF1b3khx48bXTiDscWzeSxmXvre
	en1IvWRH47Ou67fUNNGkwSoKOqJWA9JRgFpHX0bcItmEHWNsLQlwXKUKk6lviyK1d2bnBWErMuE
	GTk9i5HnomC8MFMK4E/xQp+hk8pIvZxzPVgGAzAP0y47LU6q4ZmGEm/giV2a7gnm//4HofW3zhS
	v7Aykwg3fUCClFW2rwUJaNG4uGKDNm1Xho876yuxUQmfH/sDJQuY2NGO8xoQ1oDXzyE858IOhmT
	KIpl2X+0xjFJguBhgWQTFaPoxanLBkd/DlPjwUbPui30LnNNH7KuLuzXHpI6ucu9nKdrEU33RfB
	krc20=
X-Received: by 2002:a05:620a:45a3:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8cb408fb864mr1126018385a.9.1771257449937;
        Mon, 16 Feb 2026 07:57:29 -0800 (PST)
X-Received: by 2002:a05:620a:45a3:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8cb408fb864mr1126014785a.9.1771257449474;
        Mon, 16 Feb 2026 07:57:29 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad29d571sm1914625a12.11.2026.02.16.07.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 07:57:29 -0800 (PST)
Message-ID: <0f3fec98-4d58-4197-82e4-41480066d42b@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 16:57:24 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] clk: qcom: Add support for Global clock controller
 on Eliza
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
 <20260216-eliza-clocks-v3-5-8afc5a7e3a98@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216-eliza-clocks-v3-5-8afc5a7e3a98@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nP0h03brLYkA3qxE_xFwgcd7MxeGoWFx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEzNiBTYWx0ZWRfX5o7FlnAYD9jV
 xJAzGGJfSbjsZPUDoJz3QG5GDVBy3GdfAESVmHYpF1YUBPnt1Vu3gfjzuw7y0NySHVAC5WjzTpB
 DeXuJ06ImjmoaXHXf4skdnMYH7kZlJfTAM1n/5LYGt9lDmcPaS/f/8GROOmCEpjX/3rL/DdsW/c
 qtJiH3i7nEu7FauGpOglGUt3WJAvYSJGmKs81AaofUR/AG41DLTNRURD35O5P3to15pXWyeUr6t
 Mc19BeqZsJFWnWhn9k09fBsCGpP78lvlLZR70G6fhCJu/s7vkuXW2O438ToHJXmWq6/SJeLcoB4
 7CMVQQg14ftogmfGMpavcy8uzCh2NXWu1KBgo16UxCeFzr9MGZVpsgbbU9bljDi784trM0bK1jb
 hxxuy4Zw/1KIp6r4BaV9EFvwsHS0dN4RCo4sbMXq6dTTe79ZKYDUcjPKTitvtGunpgbmzL9dMXF
 L4Mm4Za7AG7BR1eRjxQ==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=69933e6a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=F7eGajQwVCTwq7oO_cwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: nP0h03brLYkA3qxE_xFwgcd7MxeGoWFx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_05,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160136

On 2/16/26 2:43 PM, Abel Vesa wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add support for Global clock controller for Eliza Qualcomm SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Do we need force_mem_on on UFS clocks?

Konrad
