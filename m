Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2D02D3A7B
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 17:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773853777; cv=none; b=aLkbjUrcmg6yA4sx6l3pu9YqNNi3RZrFLb8lvf+IQJCv7Oo5V0z4LPTlW5sRl1SSlDnqCAj4v4ocQ8ssWeb0qTDlrEsTX21zow8X3u+0CMzSkzWSnAsw9fOpYkd1lx6xb2lsSyOjapqpIzmwqYq2n9d6mnpGiMCFQIVt3y+SryA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773853777; c=relaxed/simple;
	bh=NH9+OVtPdDHqeC7pTIE8pHeL4cphd9YvgiXAgWcJH9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eKOZL5YXL9azvYQAkGlixjUCfo+YlhGx+Td7hAWGNnYHz3QhYSgy9BYkIXgluX70dNrco/efOwWqy7Kl+IWkXSPcUDWmPkCzUtIpfJcpT/2WCfj/CCeab/zI3e8OKWpM98VXdORxIl5SYS5fKf1O1cxzFMtxF0iIVeGQi9Zw24o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UCLlQRwx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HlGZA8vw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UCLlQRwx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HlGZA8vw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFgbiE003849
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 17:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KWy6AvBvJuSLSKIvUfXuWYTFb2xoDYuunAiAip6CnCI=; b=UCLlQRwx62Gtdcyb
	ef2BYcyCI2drwNJtS0Il8DPuhISa0lef9Im2M6XGJ9dj1Tsd87TBoi0uNzszE+rT
	HVYimFrYPRXYM8AUDfpUyKwqljflitDuWMBT7i+7FDoF5xEZvVLmiDhlHHpa20l/
	Yv5IWiE9KLKSvUzo8O5snY6IRaaSlPRdo+utQqbK+v5nE4zyFnQyuimqtEIXRrbt
	lxNdcJ0w6e/PTJm63495s3A7pR+ehYCF5QM7Rty+z41KwXViT1qQTYFFdG9apV7i
	/SSr9j50skXti4oQLO7as/+hm+N0MeLcVwddd55mjmxTSrPV3CWIu1b6XwGehtkv
	/FFp1w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyscb1s7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 17:09:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35641c14663so221119a91.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 10:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773853774; x=1774458574; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KWy6AvBvJuSLSKIvUfXuWYTFb2xoDYuunAiAip6CnCI=;
        b=HlGZA8vwDVhxVz4YSue7d+kIuPcgI8IEYaKAr/kj8CTiOFRaTlkJGA0Cz0LFObcXZX
         yrHdkzHpKtpDY7c65hWRocWCUEzH+Ri8hRjiUTp01FgadmV9wKqpO3iADPCqml0+F1kB
         CHQinusphM3jBYQH8Yi8l1mlWQf67q/zuDRRTiziyux9KLCVxa+yihYmnGm2jmvAPZTK
         zDqR4/LgpqPTflOVDfU+F9RWMmBICAOTSUmtQh2bbXtPjyiAE1gArtBCQpU3/+WaLUah
         lvpajFkc8Ye2bWuV7B8kQRm1orV+aIwXvUTSnra2H7CBQsqeGNNc86iOvJNAK1AajNUy
         SLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773853774; x=1774458574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KWy6AvBvJuSLSKIvUfXuWYTFb2xoDYuunAiAip6CnCI=;
        b=bZojgYHF6uKwXLcOevSifZmahryc4tbZfu6tnRe9SBPX+Xme8wt+GzTXj/VLtgGulu
         afwaRUx+nDsMZkJDB5HowpQYMV5s8kS6LqdAg1eYyeQwfjjHq982yGsnkt+vyIEMFa6y
         0KOh2MJ0jAQIUR01sDWkP3UzvTPZQTeug0Df/7+YvX/NFcIXUOVkARdILwWyJfGxgDiF
         ioe8SCycGqj5Yym2VnQzzXc0QFlk11DhOlu78QG4/Y7pFMqrhJree7K8raXl4MOyEyxV
         yTsSIpbuvf76qYxUJBQdm69kwYCR5N4DMnzRZhrvAk1Ax0GUkoQImPvQ8EMS08pqVXeN
         pDzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn8o63QCtDVFcxQ981MPnWluRsnb64ooRgw02SPYLbpcDnrJL2YDYpyh7kSjDsu9yWq4IOkdHGt1s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpiO5sC2U0stpfA1UNd/WMl6ArzEVqL4kAFRioX16FGns0+P+F
	36gylRIBwKWGuNl+34AfgBnfJ0enbpQJvnMVsI9igzIhaS6+C60oFTvZM2TA4+lpbUi62RAYFrM
	X2M2dfQqc8oGK6A5Ln7GghDdIdZoz2oucsM5JNdr1olYz0jGUoCEwni1efQZQf+E=
X-Gm-Gg: ATEYQzzvx5LxnnMOSvcPH3Y9ZNP6SSjwHVGzFmnvHSArc1206a5tRc0NeVihGbKiPHu
	kTvVqNxJpixCw7fQqBG//WCOMvpdblnCmYeTh2rOKJHkIQZldpnKCVkWPohSDIs8gDeNnH0Oy+g
	uHpw8GcpYAuTLQxms4IXmHH/otCEPJPHuIuCYTD/0k8s9VMmHk8xfG0Eg/37pApZSKGw2f6X7HC
	jti9HRu+JMRj5Bv8S/BLyU0IhlB5/EAzs0mN8UyGwThYn/0kVOrf1cCn5eXfDnxYvy2E3/bd+KR
	nHOeugYt7BWZrJ7cBTOcGR5L4YwQtYNhI6yQZxDKvEs9YlcSAoEjesQJxbGY7mhug25OcEXRb1B
	PPRuwOKPeQdWs5rTlGUef21GDeaQHWriGkIEldNItn99M1CezPw==
X-Received: by 2002:a17:90b:3e47:b0:359:7b9a:2cf4 with SMTP id 98e67ed59e1d1-35bb9d92ce0mr3656533a91.0.1773853773963;
        Wed, 18 Mar 2026 10:09:33 -0700 (PDT)
X-Received: by 2002:a17:90b:3e47:b0:359:7b9a:2cf4 with SMTP id 98e67ed59e1d1-35bb9d92ce0mr3656516a91.0.1773853773480;
        Wed, 18 Mar 2026 10:09:33 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.29.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc62b514bsm171902a91.3.2026.03.18.10.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 10:09:33 -0700 (PDT)
Message-ID: <cd63e6e4-e8c5-4c26-b929-cf47e9b58250@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 22:39:27 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: qcom,eliza-dispcc: Add Eliza
 SoC display CC
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com>
 <20260318-clk-qcom-dispcc-eliza-v2-1-8c05581168d1@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-dispcc-eliza-v2-1-8c05581168d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uQ2HtkV2Mvj2XH0WR7TC164eCsxz7140
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDE0NiBTYWx0ZWRfXxajwqDCFDCqJ
 iwAhlfS4rUcCRk1z00AF/VBbx7hRiV4I1EpmN79/xeWnBBpJAJSwCLjKj0n4bnkD7smyqw363re
 FRuCbLgwGoRazUiDZs7mAzwaViIEt7KqlvWFWhj7Py3kQjxDfuJl4UvPoPjTAdYu3cRkmq3knSE
 lC0THhH2gvVlzPcD/9PtRILcysWwU/NMrAsWiiiuMTix8yg9HNmubTSn0Nzj/YQyEJhyZKOp/aQ
 nUQM/F8Aomb4kOg6x3LlSAFwj/2bSNCY0qJRUnioHVcs+gev0Sfj4z5VOjIiLw6do19sMSe7gb5
 YPOUzZKVAmRETqph9bxBgcXAfAkEKMLaHivFIp1Ing2CwPS8WWARIq1QzN3f5Xu/hbESipRQtj4
 RflXNgklWxMSgGiGczXEVZSLKHSeLfVc6oW/7V3PvRKC35G0z2FddGMrwOtz6vcejK8D2cBuekf
 HYRQ5fAuAuhmhkjLhKw==
X-Proofpoint-GUID: uQ2HtkV2Mvj2XH0WR7TC164eCsxz7140
X-Authority-Analysis: v=2.4 cv=PtCergM3 c=1 sm=1 tr=0 ts=69badc4e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=kWG1ar9lY4jofqPRq7zosA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=biJtGA3NR2aAF7uD6uoA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180146



On 3/18/2026 4:09 PM, Krzysztof Kozlowski wrote:
> +  power-domains:
> +    items:
> +      - description: MMCX power domain
> +
> +  required-opps:
> +    items:
> +      - description: MMCX performance point
> +

Eliza, does not have MMCX rail, it is all connected to CX.

-- 
Thanks,
Taniya Das

