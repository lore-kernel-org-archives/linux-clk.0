Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6DC2FFF97
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 17:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771436122; cv=none; b=FmRYUp7KWcotztEjSMW4PAFQ2cK8VJCMQdzvWW/2HFc+AQ+B9RBU6wyRhFlnahhqKTl8bbHYlf4HJO6cNWOnw8fjqVblkAcMdNQL9MAlMAkL9hbjgbo40+ev0hjixGFRWEUxXV5gRNzUlZ5KVrkCcRsxZv1OLkh5oRb+eYsz3jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771436122; c=relaxed/simple;
	bh=6ZpSzjQ2Q8cSDPJlsM2jP4pwKfvfayaWDf8EqYJEigg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=azED2Yi458asc7abHSBNXfBJivPBrmYrln5w0349/DuxoX/zLTNTn76MbFrg4mPnswcKaX4hqsZgx+NbCD9UIbPeUB3QXbYGwg4rgTaczDIhxSeVjwoQAQLIKKvt+TSQF7sTK171z9bpfs29o/3QuZaIc8hz0ftsLs/aQMpWs0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vv488xVl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/RXMCLv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vv488xVl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L/RXMCLv"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I8h4D53379977
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 17:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SNnZn+xmeWcZfBOU+WqjAArDp5I0MTFneEShOM7do4o=; b=Vv488xVla9u2cGG+
	vTx5gwQmmHE/WGrMERnpvZtpSev7T/yNIDGwqTtLfobF4GMtUww9e5/PI2xVALoe
	7N14JompQDiQ0ZtPlSi+wksqtS4gFdhqOAQ3hvbys1IQc9+DsQ7hi+7dpx8PjTc9
	Waa8ZC0TZsJfzmGADiQN0hpW2LDrXlZ/csQ/KGKf1lYCrB28AblTacxGwPKCcYKU
	ZjKDDdNvpjCpfUrIhHc6fQxNgkXblEJiYbnU7a3UrG1WluHA3cnKQHLdO4vi3q9r
	a08SooOTDBct1bBeb4fnzkQyha7ShkEZspzpvKXt4wpycV7in3oeJmQx/N+kMakS
	F8YTaQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccxnyk7y0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 17:35:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a75ed2f89dso214785ad.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 09:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771436119; x=1772040919; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SNnZn+xmeWcZfBOU+WqjAArDp5I0MTFneEShOM7do4o=;
        b=L/RXMCLvTjp2+1vK7SylmG80zl5vZzxs3qTSTSHAvH/s4bGQrqSIFU0jhuXcowr7ui
         Go97K/vKjVAGdGQ9bMfvH2zWJLXasrgE/QZke9mS/+xND9Y7bRQxMb+PTvs+I/DE7U70
         GxODrpmXEr1p0+SQDyyGIMYZ6wKwqUax6W4OU3QnOhu4epbvji1FtC0RqEkq2ta+jCRu
         rmRhcQ1Vs8kqeW1XNJj+Djwt4bqIvAYE/r+cWAqrmjO/WUZwWQmKV3cHawzhFg5Meaef
         SaPC5TXfwK+cxmxJcVEcOAScP1j3ww+KIPZfZ9FwZnh2Wi4RxOlqF+8R0SdunS+S1W8P
         drVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771436119; x=1772040919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNnZn+xmeWcZfBOU+WqjAArDp5I0MTFneEShOM7do4o=;
        b=DY+mEaFWR0cwAjbVyNO25xRBhkgqahmaQF0LQOyHC1i/pRvYFnfQdLhiTLvdPhCR2w
         sxUF/PlkkgQIbiQ2zk6s5x/q6NUZ044P1ey/PpoSc+MkNDIsMYEtvHfydCe55loJgEom
         U2qxPD8iKutSVjvJNEwIci6a0NZY7/6kAXQc60dfUlW1z5Ktr0STHmuIUMRRh31y1XwE
         ay76zLlgWGFqsBGv1Z/+LSsKSxjw4afHE2PrgdvNhw+Y/vJl1OL+SNtBe8RERkbVZS2N
         YIcRzgSd0qLVZ6r9lyZRuczjxF8Uo3h8wpmOsePTovVc6QWPNplzPEIP72bvSMFX//Sq
         Hb4w==
X-Forwarded-Encrypted: i=1; AJvYcCXTn2FvR72oG/5xphexivyXu3ggB1mqn8HzihQcGsizots0AoVGaWUx9TqSh3wxxfH1iPg047cYDXc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+JiFhLhNrGQXFJCHCaNqtOG1XeDZZPLWtOe3FBF/jJTKlKxJf
	J4uSInPu2VjSc4xla4bt3uvKw1qTPSY9JboSJ+AnWGd4yCkaU7G475MhkV7EYs7IyiuoeIbuIue
	hv+sdoH8K1bomvMgMND7U5Uyq1tirovBCNN886IkQbQa6O2ZrCipmGeDIxoz/cvo=
X-Gm-Gg: AZuq6aKkm4Sc7iRvOm3tcocgS023Fdz4Px8NLsw7nXEb42iYCI/G569xUOml9xmzTrN
	optozEJvG8AalDRhh+wiKIiSTigHvsD+WWy3btEAN2LYA2cDDJ+pBMIKFxKDdr/s+VfyDOTBVR0
	72O/EXEqCjeNzOiqty91K/cW31XQoZIRDim6XyWMwik/OndSM+YzdX2uaBhXctT340hhbZEJGg0
	tgdTckmlQWXzIcO2qM75w15QC6vDN4zz9tJUY5l3Qa9cSM9LTUKopEGrN1Eznl9M+9GS775mtjD
	Bi7frzKFxLCxSl1knYklbEmU619dtjlLiuBLF7N5/nvKYdOXFKSMKn866DrpG3YwMN3Kw34j3VW
	qJiQ6HMJSr36GUkWpaszn7KpUi7nWsqN6gHKvubcLC/3STB4Scg==
X-Received: by 2002:a17:903:2b10:b0:2aa:e843:ab11 with SMTP id d9443c01a7336-2ad174dd3c2mr126622695ad.28.1771436119445;
        Wed, 18 Feb 2026 09:35:19 -0800 (PST)
X-Received: by 2002:a17:903:2b10:b0:2aa:e843:ab11 with SMTP id d9443c01a7336-2ad174dd3c2mr126622325ad.28.1771436118678;
        Wed, 18 Feb 2026 09:35:18 -0800 (PST)
Received: from [192.168.0.195] ([49.204.28.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aaf5506sm133262885ad.87.2026.02.18.09.35.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 09:35:18 -0800 (PST)
Message-ID: <6bbeaf2e-47a8-4e99-ab5b-71452f2cc9be@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 23:05:13 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom,glymur-dispcc:
 De-acronymize SoC name
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260217130047.281813-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260217130047.281813-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ify-JBKizw06BVelCjST3oS9MeTeQSGI
X-Authority-Analysis: v=2.4 cv=Do5bOW/+ c=1 sm=1 tr=0 ts=6995f858 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IXbkkVN8uJs8XsqYossUiQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=ZD5VXX6mDgfP9xSn57MA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: ify-JBKizw06BVelCjST3oS9MeTeQSGI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE1MCBTYWx0ZWRfX+bbVH/7IP49o
 I3Sfgdj5pPsf918EaNxVn/DFM/K/um8tb1LIt0LVXajF6juLR0lFrUYpYYgSmvyg1siyxJGC2IF
 zz5msAregp+w4jfSTKsCmrVgn5ZJ+//yiD6K8F7vh3AFJccBE6zhiLWVACgQTYNGhtxIqPsfVQN
 8MZbeevMvuww2gRB7wzGrvOuAN5+DIKBXCU386jofj+jmhSH+RVSLYwKMxlJFuFfqKBAXI14l/b
 EB7U7HxSEDtLrqnyalICKZO69sBYp6U+p+liC8UUbLcPbsRDBipTMXGDlbBE0XY907CGFySDfsH
 v8NLmGqOqOtl6B7uffOvtbupR5Odo4wXfsHUFr2O9pYXPF44ux7rw2qxepkJ+fO1uEAlind1Hc6
 ujut0DNtX5ec8+kEIxJ41dXDlH1/jT7yUe5s8CqiPVvc8mYwmYpkwOShvfYR3R5eVnQEYRF2s/B
 UeWZFULRY+Q8qxnOqvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180150



On 2/17/2026 6:30 PM, Krzysztof Kozlowski wrote:
> Glymur is a codename of Qualcomm SoC, not an acronym.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> Split from previous patchset, because I messed up commands and combined
> wrong patches together.
> ---
>  .../devicetree/bindings/clock/qcom,glymur-dispcc.yaml         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml
> index 45f027c70e03..9de4ba71f1d9 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml
> @@ -4,14 +4,14 @@
>  $id: http://devicetree.org/schemas/clock/qcom,glymur-dispcc.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Qualcomm Display Clock & Reset Controller on GLYMUR
> +title: Qualcomm Display Clock & Reset Controller on Glymur SoC
>  
>  maintainers:
>    - Taniya Das <taniya.das@oss.qualcomm.com>
>  
>  description: |
>    Qualcomm display clock control module which supports the clocks, resets and
> -  power domains for the MDSS instances on GLYMUR SoC.
> +  power domains for the MDSS instances on Glymur SoC.
>  
>    See also:
>      include/dt-bindings/clock/qcom,dispcc-glymur.h

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

