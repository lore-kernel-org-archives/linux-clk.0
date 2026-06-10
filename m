Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA74740BCA2
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099069; cv=none; b=ApXPSmJFHume7lfQgAXpKiEl2iIMhqeAnIbaYCz+1ECH96QnfASGVQS+6lSXGwLCMYNi3LdUF1RMsbVWka07/vYWjbHudcWEQD4M15YcrXNgv1naro6SL7T1J0VAAVp8gzh7Q3AMPxynM5p6WU15kH3lZJ3hyRTnEJJBICRENQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099069; c=relaxed/simple;
	bh=5EPC9P5S7PUBZZYNo1LRAWS0W5Ye46rG956pbwaEauc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=olX9GYl7tCc6QUIT2Doq0zGVZx8GIpDCRSnEEjlDSqiHsEKL75+bWEZhazSbryRi3I6g4Z4+YxXvF8CopRzNJQz/FAWhp/9Q3Duy/O/02VNEBxCQDVcBjt+Hwza3Qd7w1GGecxaF88OmSEWZQqPzUFi9N2K3d975fas2CbW7mFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=flc3eyxG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K058INB+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="flc3eyxG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K058INB+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACClPq1598742
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rc7H0K1bLjrhuNzodBgwv2B+RcHZws9T1i//7fhlpOk=; b=flc3eyxG1ANQxx0E
	PR1jtTzozfOBxIl2e+vC8kscK0wbejwCVVzkoy+bTxoWNKFzPRdCICdLlE+wtglT
	jFFw4TN1zILUEV9T6r0HDI/PuojjMXpQ4hyOQRVokAtier9ZRV/7DECgkxYKpgY2
	zAcsZgVKP3ThhDaJ4FMTHFalBFA+x/X+C3byxM4/QCiYWQJCfqrL7GbeSnRRqgcG
	h/fzSsTLsb+yI1rWljclN1hzsOE6heRCYTQU/vUTTqOhwyKVw/QwvVf2I4MlPYte
	ROW7SfOuWBWanZxqCTgAGYzmkNXphP45YgeIwntVGkotFxMHog0etTvPdiggBH5S
	pjHDeQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq2sehmtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:44:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5178ded346eso13316591cf.1
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 06:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781099067; x=1781703867; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rc7H0K1bLjrhuNzodBgwv2B+RcHZws9T1i//7fhlpOk=;
        b=K058INB+cWs8xVONQTmXq6ji/Xon3P3G4L6i6Ki0k+4Y4W8gfp/H1CcJuObkKc1Wxr
         E9CR1tiPv913hRkrhS6Fs2MIgAv1fgFBOvtsgwJ9eUQTztL5nLKmxiPWeXZmG4GeJFXz
         YENNxRF35bxGQ/nQbBGhLSbsTu06siNFGrVx/aTQ1VSpGo2jtuIwiH26bYS08lHxG1v/
         CZeBeayhWQmuTj3q0njaFi/6tKgJFY4NXHDPhVEIy9yYe3+U6SVGVQNrUhuXffg0Qj6T
         11n7jCLnAk7mpE/8LLp4LU2dHokhiv9JM+y5MXyUduZaVAe/31ihp13XBOXl39+rrn9C
         rKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099067; x=1781703867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rc7H0K1bLjrhuNzodBgwv2B+RcHZws9T1i//7fhlpOk=;
        b=X8b6L1mHq1F7e7lVtCO6LwJP/sH/VFEPfrEP8BoNPlVu+L1hvLjQ9/JdU3B5jZGBvR
         K0gBJMdaWrL476rc+4Ics40g+jlS/BVTC+gxOYazm09GdIgb0MRLU20hvHxl26nNF3s/
         HhQWNJvq+JKg1zETcRgg/DuclKGUo27JHiG/qEQjYd6H4dOT4zKy2SiLdYVbU+iuTt+T
         4/+ZpOcOiuU2+sVDGgVhM2mNVsZCTy0YblFgKEPrA4MTKcX3Z1+p4MzF5u0BRd+rQEut
         8kfb7wJhfH4NfOMtmgcP9/9zIG3QoUViwldUFmlyi8v4hVqetUz0xw1+E3ZqsrQ1NNYs
         /poQ==
X-Forwarded-Encrypted: i=1; AFNElJ988DOcj3/UM8AeNZXT7OwdeB/oUcbomEZRjqcbyshpa4GpcFs5u7Wn1eDDaw7TwrYVviiCPw33L+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzSQPIBvB7sJ2XtukElYz+XaxnDOKM2mJ87hCwwlotKLBQwhRQ
	gELYm1KML3r2VBsWwgk9ACVcRr1usaC/NS1zmt7nyXI0zUNnwYKcqSt6EvCXMPaI2OKjbzIIjQ/
	Ra+FAmwUsuzRhXwfcNApCWehzkUxkNJLm9MqOP/enirk/zMoI8HUMZvudXla3R5M=
X-Gm-Gg: Acq92OF7Po27O4CbBvK4TFTY9BILwom6B/SuHNd20EiVO4oALi35ggqAOYsxHM3KDJe
	w0gKywdv8TrVOfx3ptuDN2sIuqRW24DitXg4YHehek8v3gjdPfYcRiNe+nXEg80UIJIFuS4m3Mz
	KZ8n8HCjqAFDAtz0gKVpwJbO5a68Z39378X3pLeTY65VeqsW3Gyj2AnsinwBkgheX1w9IuJgQg9
	F1+ohIg9edYysx6w6qxmTWQiL9zLY4Z1t+9GuB/qTdDxsWzVU3JshHsRUcGABYgGN1sdSB/3xHq
	cTtqM1BNSFWp9B1vyVQk1cE2weFT3ybgMGelD/LM+g3zZxoEtWY0Mc/402oVvYV8InZgmPk+zCY
	cbPHuhZNlCKgFZTOeCLHADYlgyqzBRlEBwVdSHOTDTD1zzz+4IFNjwv8x
X-Received: by 2002:a05:622a:1186:b0:517:6162:daf2 with SMTP id d75a77b69052e-51795bc3ca5mr205452911cf.4.1781099067014;
        Wed, 10 Jun 2026 06:44:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1186:b0:517:6162:daf2 with SMTP id d75a77b69052e-51795bc3ca5mr205452531cf.4.1781099066564;
        Wed, 10 Jun 2026 06:44:26 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051e9b1fasm1203203666b.23.2026.06.10.06.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:44:25 -0700 (PDT)
Message-ID: <bcf0fa6a-dd47-4c87-bca1-942303ff7a5a@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:44:23 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] dt-bindings: clock: qcom,gcc-mdm9607: Add missing
 "clocks" property
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-10-5e9717faf842@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-10-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: b4y3Er8QU8zR4-0tmvMtb5DfrAvduLzQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMSBTYWx0ZWRfX2EBP+xviZAhy
 wWiMfLIzd5PP6tT3bcOvyLNJftyasd/FJufCBgP5HIl0Iic/QKpBOX4a13Em5Ym1pli2lasAWqC
 YQY6Ne1AFJGRCCIMeo0/RnqPD+6C3DNXew2C6E4ny3AFwfS1A5cJsm9Vjd9MXIKTMV+cqzM6TlB
 3in2TINi1eRze1wjY1ckLC+MnaAg3vIeOq1qgtL8aqKXRouV9AonhI5dt8RmVN3yX10VQs3awpe
 bxS94dRmTcXjue17KWC0FEAvjw7jykAZPDWf3aHlQyJiHcw0K8OdohXm+chrOb8GYOU7mSij/Mv
 LaO0ImclXzkmt1cTn/WkIe0xFPv+uyNnpY94BQmkZyONDx/T0RCSifIFi+OHEbcphjIjykt9+H5
 eEkXUjRiTGMNEqAip+s+gsOaaVJQBlMMj8+lHsJbWu6wfZJIiyr1ImD2H7XScY5lZKePE7vVvTA
 p2kwSRWRQKzRAYtvKKQ==
X-Proofpoint-ORIG-GUID: b4y3Er8QU8zR4-0tmvMtb5DfrAvduLzQ
X-Authority-Analysis: v=2.4 cv=Md1cfZ/f c=1 sm=1 tr=0 ts=6a296a3b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=hM3Lp7_hyHUGSlGb_zoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100131

On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> gcc-mdm9607.c uses "fw_name", so it requires specifying the "xo" and
> "sleep_clk" clock source in the device tree. For some reason, this was
> never documented in the dt-bindings. Nowadays, qcom,gcc-mdm9607 has a
> dedicated schema, so we can just add it to the properties without any
> additional conditionals.
> 
> Fixes: 6faa7e4ddce6 ("dt-bindings: clock: Add MDM9607 GCC clock bindings")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
