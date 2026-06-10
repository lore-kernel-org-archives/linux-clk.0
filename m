Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF0D40B39D
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099084; cv=none; b=Oxh2PMC0jTtY2xKFrk7zZBylFKTiCKpjvMUI7p5TWsFci6T1S3dd6O5lHFJcuIkWcN8TN+KwMYQog+K2fg/ZrN8kKXh0TixMtv97F/QExC+ky45hRuWYmn41VRFksZsmdBcHcB+qqiOjZ86m9aOl0Uu/vx0pYiqSQg8hUIhgKrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099084; c=relaxed/simple;
	bh=CdfnwlmRSBV+figoFl9mNT4ce/sY0fnUNjgPXon7xVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BZO9xAQEyC/kgWKPmj607LrviVLM4d4edYYuo24kZTEcNNmgz/1P/WEHCvU5JDOSV+lle1FS4W8Tjqro7rAUFXu9eP16Aa9/ukoOukViAGlqv02obw1zjY4GS4DhJalDLKPX8N3xVeRqZv2NvQB6BrJIVitWY9nk/tk4mlc0EOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LQZpXydL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L0tpZjCC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LQZpXydL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L0tpZjCC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACC1lk1606484
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kug53bNTwtfaBOBC6lkpFkpl1cjnIWTW3W0ddWiIpuE=; b=LQZpXydLGiXepNhg
	SWI/+ezHS7zEMl9xyCRZX3RMYEMT07m4gcgw72XSm95oWad5GSMrerW1gPnXr5of
	4Gvpm+z4f2oFL5r9Xc/lj5L4EVRnWN4HpSq2FUTOQbsxOWe4vhjEDczGb6pWv2VX
	k7Ipilb/fn5GkUdJmni3PQiIWdJvnpaSvyaHQ0UpB90O0Bodq7DmvA3JGfhn3K1g
	6YquE3BVhOzXvnIiX3vTouYiBL/Osfg4uX2ea08WktCWY2LxAKrY1gxfT61LtsJ9
	y8Uo6lMU/CzzpcS0Z/2CvAwNSOncShIJxKOdYxiKB5BJrPjEVms1ByweVZC1Tcpv
	x5vMNQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq10aa1y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:44:41 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c4271166f3so305102137.0
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 06:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781099081; x=1781703881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kug53bNTwtfaBOBC6lkpFkpl1cjnIWTW3W0ddWiIpuE=;
        b=L0tpZjCCp3PwGJkaFfORc56XfPwAsxbLyWu3zmjTO1Yx9xSQEfry5dClEYMmY9o/BD
         tVc6yLtHYHeJ8no3E6782LK6Yj2tq6mtlPVs5WSsfHZSWqHU0xUR1zmej/wcqVWIGOAb
         VlsqGaxSBkRXMKCU1C7qaMrr6meKAiOVeZtKsx+t/6hGC+zsgt/JYy2LhWHRikxQtRRy
         vp8+cPJ5msRTvX2VuUixbSUWG6dzS5CProJrUkpMDFPWP4ekGqC2R+FHBSNSpEEWeIA+
         hHtzkXPlwX2FuTn+nRG18BEq3f7DjMrmmHpXG7gFyC0ahpLeeuVpMOPTSaf1YbUwbC1V
         ZvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099081; x=1781703881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kug53bNTwtfaBOBC6lkpFkpl1cjnIWTW3W0ddWiIpuE=;
        b=LM0UP1n200yZBC1ow3CnuXj8FJxWjEvwbqnTWJgrZT7sRhMSfy3lRog5OWEOmaQYJy
         XDqIYuqsFtW1urhG4b5udpnN/TRjRT5VKIyE2pgn1i2tObJb1tSGuYXSznSjCJJfhJ7b
         qOuIeHOpvvVWo08r05frko1xo8v4Mrd7+EUqZugvYHxVs5hWHAGeIfC7206x/r9RiNW7
         JaODgp0v9bRXBZTb9D6yJEFfYZ5oh22lTAewpyZMo7bUlfXYEDZYedNfmXUT18f6E2S4
         qpnmRFsbgz7N0+QnCljLI0MixQlr1/cW3qQ9HExhCkkjY/GDoPPdtKC8uVsw9BKyyTkO
         RLOA==
X-Forwarded-Encrypted: i=1; AFNElJ++i8mEh2lCVG3GhUQmqXPQAbqpiXFshAih0AGsqopdaGQgIRaxqFE9YJfr7kXqAn1FMt1M7u1waCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPx6dxqZkvkdgK7KL0SmywDGfQS8s8i/h7f+yLiEQL56hcRPb3
	F//nbuBMVqOeVGyTTfik/9AM0EMH0q35ECayyqAU9esCAG0jBuFE/988k1G5qnaUsNG/x+dAPuN
	zuiCN36iLHH/+AWMjATTDarDl+nElvuZdlmrzNP3p+LftD5XfYFxrFgwL81cQLsE=
X-Gm-Gg: Acq92OElihIYwQexvIClEIPyT8wEFp8z3PkNnHitjvqkBeOR+sB8K/JE8yjN4DjauTP
	qa5C+57MOPTlehS7s4vy1ljKCtdv4EIDYCIKTH70Xo8Pd7WCjqQV+uGSdgeOjDn3ei1Rq2RhfoV
	OSulJGT8f2eKyU0w73hcb4JeG4VCFk0pVmHQ5kZWZnqgtDLRKYFws7T+k0PDlGOM4vEvWUUxEtl
	Kwbshlvej5ZEaTchqdw1ltwTvKh/tP5mslEEa+Xi8yrq2hRDihznUc2unCWnfJ6L4rtNKFVtRDJ
	FVrjBAcaTIuHna4ASkz4mzqbfsgttivThommREA/mHEl4L5GRj3OEaOKJko7o5+87h0ds2EAbWS
	/pYL0UM5mNC+cSQEf+Fqroq3L4+/f6M2QhAGOrIbiVSRxFx8wz+y42Zqn
X-Received: by 2002:a05:6102:1489:b0:6c2:7d0d:e09f with SMTP id ada2fe7eead31-6feee4f9571mr4179079137.1.1781099081030;
        Wed, 10 Jun 2026 06:44:41 -0700 (PDT)
X-Received: by 2002:a05:6102:1489:b0:6c2:7d0d:e09f with SMTP id ada2fe7eead31-6feee4f9571mr4179073137.1.1781099080601;
        Wed, 10 Jun 2026 06:44:40 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac091b23sm63272021fa.17.2026.06.10.06.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:44:39 -0700 (PDT)
Message-ID: <c76aff72-9167-4048-a009-9b8e477d3764@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:44:36 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] dt-bindings: clock: qcom,gcc-mdm9607: Use proper
 address in example
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
 <20260609-qcom-clk-mdm9607-fixes-v1-11-5e9717faf842@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-11-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GoFyPE1C c=1 sm=1 tr=0 ts=6a296a49 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OYg1jswFRQlTD9ONj4EA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: GWGZtp_WHfk90jZ-b4uETJJcAOGmJM90
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMSBTYWx0ZWRfX4g92xHnbEv2H
 P8NoC8SIwCuTQaKRMjKSQjEDTFE/bdHI3A+/u2R5ICb2T+ZKomTkhT3hXHFwLrVTbuCm+wRy2RQ
 f81WrMbBIHc6DClfaqjYBxg17EMrmvTYKDBunoKBujjrFyLlqRp/fCvYvAOk0s49gWOi2XAk/sN
 gXwurTymj+SD5+qvyot7shYOqEFpAgYUW9luSRlShCY/cMS/kigtteQYME2v5Y69Sb/QwQOksJC
 4vLCmEKRxokUEvYDbKXBzMyPuIVrJNmgKfHs4zv6Ofqpg+YfVHb8iZPwJUtCwdnZR8XXiLNgZ32
 E0F9tkKnk+lBfH4AW3q3+cmPYRPL/hUqeTCm9rlMEyYhNTI+IqJ1G/+2X08lQ1TtFq/675rloo0
 2B7/AG+OL2dnnrst7nHn421VurzmciPbydxXinbJ1OzbgPmbb9Pu1JhYp6642MNyU2dtM4paL0F
 Bki2D8dN6zHwewx1/Sw==
X-Proofpoint-GUID: GWGZtp_WHfk90jZ-b4uETJJcAOGmJM90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100131

On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> Given that this is a dedicated schema for qcom,gcc-mdm9607, we might as
> well use the correct memory addresses in the example. This does not
> affect the validation itself, but will reduce confusion for readers.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
