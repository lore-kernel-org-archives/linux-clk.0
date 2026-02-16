Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2E5314D1D
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 15:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771254307; cv=none; b=pJ4Ibo4aZ/q9q2TbePbqcVjH0bZdDFkA3noYMKJelOXWjf7GbwMK57iTPRmm/Y4xiW5xlqXepeoeYBy5sj+ZAGu8bqAjIT1bz+Zupf3vZgaoHZfzV5Akahon8zKCfwQwbEZfPM0dqqsLxbeesW/nYWeYbK9XbWcNPhVgxxQtDT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771254307; c=relaxed/simple;
	bh=8XPQXtALpMcNlT8oVo/KcnfeFxoRRAvfT762pQJfdAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AXF0yvFG8fg7z5l+3ev/P27IvHkPCxhCgCsrW2YG0Iq9PY4o4wtxs+AC9rf6l9hN4n/b+TczTp118EQ4if12u4mm7R95pzH19YqYWjHItkG775zwNWCfJ+uI+QsCBrDypED8/DLMIyGjYb+c2W1b2Qr80TWqE91bsAGmVDzA4KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bJt7McuH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EZGOGkV1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bJt7McuH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EZGOGkV1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GCQfwi3304890
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 15:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k+/EAZwYzWfRc3ktkHNeIIfS83pbb/w/5aBpKlW3SWM=; b=bJt7McuHUrIg+Y9O
	s8uHmRdd2Fj3x5UbSOGSHPQkrYqOVUpCxBlwARfEMuljDQfLFNLfzRV8yku6AVr/
	+/g0kyGpDKoiRtpbgJ+68RuxfS7T5LQcdHPqeeTrsH3a0Kzoh1Y8V3mRNb/OE+XL
	k5j6QKPR3Ttjm4Wt0FOTmtovuAGYO5sVXl9GgclkhddYjjNQaq5X9AoZr+NdnAGH
	1OyYfS6jil/H83E+9fPD5w13REBXzQg1mvMeKn3PlVplaKgu0yx8Zxfg33XJe0Ep
	l5o/7dCAlvxDTOQ415tmgCmkIWErqq2d4l3KUAKbRjQezWJkWX8D+s3xDGIKSh2D
	uDzUGQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cahtcmte3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 15:05:06 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5674752c350so198090e0c.3
        for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 07:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771254305; x=1771859105; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k+/EAZwYzWfRc3ktkHNeIIfS83pbb/w/5aBpKlW3SWM=;
        b=EZGOGkV1kzIHH1wqBZefsoQhfnzrQXrQPWkAfv5W1OdTg1/MRl1aJuk+8UZgv8OMGs
         vhbQ7uFIJPf/Yd7X4fvlwFyF1hkcXkwYPYP46jpCH1xWmtUs3pyItpr3Zf5vM0f6qWTz
         oCvOuOzGxTkPraG6XokECk3/GUpgEp/VxWEqbOJjS+0Zd4Dt6y8XGz36ajWyqG1amD74
         wa9ILWkC+1sJl21l8fkjCSRIRNmKRkj0LZ8a2GHWJM7Yvvwa5knuPp9kZ/922Y0GUplF
         0jsw5L0BlBRLuj8Adj9HxrZOePxe57nV2gKNr5vNjYH/pm/TyieXlhqJ85PKV8XfseBe
         Iu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771254305; x=1771859105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+/EAZwYzWfRc3ktkHNeIIfS83pbb/w/5aBpKlW3SWM=;
        b=hTWtEhQZGFysOJ6Edrdnuxj6xQ7Yerkefra7Ef9PdPpzW8E6IvF8thnkIdgYmSZ4ae
         6vMqGilpVUCtcTEJLe0Jeig/sPyzMZg4+Xpm+YrKYMmQHyu21mGl5ErRnTeCcpYPpmhq
         2vmXSnZ6mX0xFYY0iUNQ0C+UtEr8TpIgTrcXPf6W/8jv59Px9QNLFR0fws4jRxWlxGvw
         Ni2/vm73kSBaxXB7eNLMfg9WckUG6YiISvEHYMb5yCj4nFUhnEUue9qp8sUTAZMTtiME
         mtoP06O3kTspgThl4/4EataPB6iDgjt2vFb+HFHMJL7jIvS0OTy2ULMtCTG+xtyxyeAZ
         2S2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXgMw8mJt7x6NLM9lxnahq69/M4PeJRFgB/MrYQ4QXbGPUfz/aXzmoS2n+RRfzqgSZ8jvH4VjJB6VM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBU32D5K5E5GPD3msBnOlgbQg6e1NZjOyIxIxcKU+6bVPlWBZr
	abnSTiCAbcNr4b5F/MYPxMQiPxkSoule1XgQLlsGQdWy+vs9IrjrFwbvb8b+qVQUU1JmSEVICb/
	dHjyllO4IA4iTW19JDpasOviK+W8GhYDhW5LG5yZxHfDesNBJMW5zt0TEtGOWAj4=
X-Gm-Gg: AZuq6aJp5o0N8s30E2XPjlnClu0LwbV1KsqY5G/pTJ8DKPd03nhBQ8daiKwm7S57vDg
	dTiIJQ6o/Eh3KFiu4DXRq9lHTgJg+r9yHMrBluype/QodhfWWje91KS1dftSXUpJleaMGo+Vsr9
	KcgAy8anht4EcHWVZf28EYfOvV63YcpDjlgSf6DLfGgaWl84gNbJ0kfhHVehnZqUBfthwBCm1jO
	d56LfmmVUMu8qSYAMtS2+8n+2SKJsdpNobrOqdDxcclQuqH7ZnJU1f6X/3441N/2vCmXllp7URQ
	0Ant1ZviD+hWuQBlkEI6JIQqm6E9NLEguV7uOCjhPDWD7pfGbWpJ/R1dWaisq7i/dar4HfcNL7N
	aqte2MXK9mHCJYWVG4hEbjOnWBQNRwoCkTpvKPvThhYrU93+AQos4QSipLzjYGuOooNXnEYNtEh
	MMHoc=
X-Received: by 2002:a05:6122:8717:b0:566:3608:f8db with SMTP id 71dfb90a1353d-5676826540amr1386807e0c.2.1771254305032;
        Mon, 16 Feb 2026 07:05:05 -0800 (PST)
X-Received: by 2002:a05:6122:8717:b0:566:3608:f8db with SMTP id 71dfb90a1353d-5676826540amr1386784e0c.2.1771254304538;
        Mon, 16 Feb 2026 07:05:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc73f7c24sm267294166b.30.2026.02.16.07.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 07:05:03 -0800 (PST)
Message-ID: <e21786fa-c32d-4012-b1e4-78cf88e2d1d6@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 16:05:01 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] clk: qcom: rpmh: Add support for Eliza rpmh clocks
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
 <20260216-eliza-clocks-v3-4-8afc5a7e3a98@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216-eliza-clocks-v3-4-8afc5a7e3a98@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEyOCBTYWx0ZWRfXxezu62Iqqto7
 UnmJJVxtXpPauuwlN9+txSwxzAUakpGJxO87QwQyVSsaDLKqbhNaO6upb+sVqBxfoFU31mcDqhf
 vpjcMxFeY78yZNZ8K4fl9P8rrUS27jYcrrmFGSchERBkjsisj+/7n0QrZvSd2Z0IPc6wheAqsev
 QC5ST0i9XC4s5rNGbg8E2dU84Xlalbi32XMPMvF5y6Jpt1HRcwGSbQnCm3xi770q1fzup9aGVCF
 fIHWaL1J4c+4O9cUhyC1leUBs9OPaIE2ogk6vvFSPB/sMlcHpTkM7YD+MyhMj8jZEn8ABDwmoUl
 RMEgbc8yRKI6CXJbOLVdot80AVNiQq0TFooMUQmrAx8AIbqPGZIetwyLPKpZ1g7zCR38w3d0PgC
 BsFe4/X19vnWehfFbB3/KKJfJI48Nzw0y0iZrntF5Vw1TuJDlysj/cq6PtRHM9xI5tqr9X9fDtP
 baihrq7MjDPy8nX97mA==
X-Proofpoint-ORIG-GUID: 72l3Jbj4PJLb274h_yqgFFL8FNIrnIcS
X-Authority-Analysis: v=2.4 cv=DJOCIiNb c=1 sm=1 tr=0 ts=69933222 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=QfZBNxv062MJluzyly8A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: 72l3Jbj4PJLb274h_yqgFFL8FNIrnIcS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160128

On 2/16/26 2:43 PM, Abel Vesa wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add the RPMH clocks present in Eliza SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
