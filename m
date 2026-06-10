Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11E5165F1A
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099223; cv=none; b=t0gOCQAi2KtUsIwWkNxax8DcNwJOPuYy+l2yEKa+tcyKKwehWeYh0rS4T8O4pqflroLBN0PWptbILct+aGoS+DxfiEAMdEZEYqomRiI60C2S5K1j7+pXyNd8f4Zu0JyeXXJKoWBvHT7UxFlmcQe9+gxZ07db8+WT26XU8EEnmDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099223; c=relaxed/simple;
	bh=r+mQKnhrfih3eudQABMsb/sQMtoEYwF1GLwJmoBcbdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oLzaqk1tRLpCs1QpJpuY1ZFhhqmOVEWFKeUrMw57z+EmY0d4cWAIoxDDzdfWoQIQOCSYHfJn5fgoA/Wv0ge8VAihEV8USkdz7l0kYqNFoBltRuBWq/CaJzg50llJ8Pz5EY1HBhCZMlI0TYl4o4rXldVvfAR2XXFiKY/7fYSDWpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dyYOlNNT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TaVLVzIk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dyYOlNNT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TaVLVzIk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBxS41511550
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r0dYlM/C6Sbdw4GTkP4X9ZZpNBVV4Tmyobxb7/dNFug=; b=dyYOlNNTRQ4KXuRW
	XIIXevIyNKePinC8xjUEfEZ51bybSOcGSicRRIJC5diVUUDGLLMjNpiXSw/MKLEJ
	GFr2qFpUxecY1LROtepNAaz5Ul1Q1qDJFS6/E8B3j0+S9vmtZG5VjD9bjdCzXXtn
	M0+Qsn7s/XZfAAHtQoJWF/7Q0+3bo94U0aZ9hW99ZMfE9EJ74xDRfCDWp+RN8axg
	zoyOMW3IuC/7wZhBmrwUHTQ483jIlbaLGJwYmQJAZFm//R4CsM2eDemfAvI0v6EC
	y6K8Ds8iVHfEZq5lNyWKo0PPpDZpjCf1532qKohWfDSChgQ1+0PX/vito0ALUC//
	ylAOAw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epukeu8mk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:47:00 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cc6b92b8f3so221189137.1
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 06:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781099220; x=1781704020; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r0dYlM/C6Sbdw4GTkP4X9ZZpNBVV4Tmyobxb7/dNFug=;
        b=TaVLVzIkJ9XJcePaNfQsmHF8EGPaKrGWdZqPD2SHQPUozoHodIMariVVMvkDPm93YU
         3DDqqERqvr0cPjv0hBtG84lzTAx277/a9KTFc9FbYRUxVtFHf8VSB060ThLkK4KLt6wg
         GMv25v3a7Jd+3DAZ7izoBQo/f1zcgdGd/Aw+wOo7mDNpF2FzMQQDvwrQU4f7UAAMF/cb
         G9u5uTuwVB3hTPFcw7gbKXWB5GIAX/6TiWkMsO0cgT0WGSgiFBJERun6Grc3lR2xJhd5
         O/bSpXNt6L4F+jXjb4EEKJp32MVNsUXDKPuNKGhil4YHSjkKeyl0ULlFX4OZay1z2k/k
         9OKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099220; x=1781704020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r0dYlM/C6Sbdw4GTkP4X9ZZpNBVV4Tmyobxb7/dNFug=;
        b=bT8oV1az25WdNM3Q+AX+YX2z3FmVERa8qcqr4RXBnAP584/5Yg4Kxr5PDMAe6KGRxf
         DNRPJEVSauWoaeJcDDPSFe4+IxxZB/EsBIhTYlzjf/7ukD2UW9LWX2QnVTGr4v54T14h
         LLcBcOzmiblGrod0+BzWklumYR/z3Ac4uNBGVxlL9TOoxmWv30+t/e5HswumymR6zbjE
         NYjwg0BOw5MSlQ4Ho+m4uhHfeX4OVPbVj5EN3EwYpTsRuOuch9Y6emQMlSsZqguqhpq5
         CB5Xm5Eb8ZHSk8rLlzPrLlnQJYK2Z+F27sXA03sfXz9/HqdC4GeJpCyBTrD3LTXftU+U
         5Gpg==
X-Forwarded-Encrypted: i=1; AFNElJ+hvuzynmyOMhhGf8NldeSagPBk6pwb6DTS8zxCPFanNl82hf3DU77KcVsPVJyFPUs+XUhGels/NNk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNMzbB+NWFbjiVfm/xQCXYFRn+BYNAiqgwtpgVmMOOxq9WRDa5
	B0IdXz4Yjc/yRSZzzlJUtNArW+kdIIqVKy84TUpXz8cQVzZ3AhX7+gqVQik0EmgtGIMq+tu6fJp
	tMC1nRQUfj/jlNL0JMQ57hGancMnVCarTvE1GNiSeKEeiX38eb+9b3BtzFIkV6iI=
X-Gm-Gg: Acq92OFy5VFst7YdtP76W1g8LBdJPDhxtGBVOVL+W6rPBo8yLglrKakGkqQyhwJ+oII
	dnUwCXtI41zgGMkbE/5MLwyWyKl9AxTFDlVphC/ZL9yf1kvUzeh9WWBGa/6YB2+t5XikV1l4ZME
	2OG5vtfRbVpW6eYAgRnfWgMt5yxYjs6/K2JD49kCJR9g77eBrnVJuHQlJ6sto2nEWy2okl8SYe4
	adcFBIUEUdG+yaslB2B+dbNel9c81QEojCsoW5UwWN8G5GOa1T9Lh0RkoptRSKB5BfTTPB9avlA
	GSCNI5mNcSesR0s16k8Bi57oA9BjTh5rTJuAVigpbdkvY7m61e9kFyiPBzJndqGCw/sXP3Oowad
	yaEozOAAkHP70t5YK2PkqSu7a+dztyM6BR+1ejOb7nmkA1YsJwejr5EyU
X-Received: by 2002:a05:6102:689b:b0:637:30f8:5cd5 with SMTP id ada2fe7eead31-71926aa00d9mr1583073137.8.1781099220371;
        Wed, 10 Jun 2026 06:47:00 -0700 (PDT)
X-Received: by 2002:a05:6102:689b:b0:637:30f8:5cd5 with SMTP id ada2fe7eead31-71926aa00d9mr1583055137.8.1781099219881;
        Wed, 10 Jun 2026 06:46:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6585185csm10035790a12.16.2026.06.10.06.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:46:59 -0700 (PDT)
Message-ID: <4b7c43a3-4d3f-4122-97e6-f0522322070f@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:46:56 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] clk: qcom: gcc-mdm9607: Increase delay for USB PHY
 reset
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
 <20260609-qcom-clk-mdm9607-fixes-v1-6-5e9717faf842@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-6-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMSBTYWx0ZWRfXwZKkg/iYhZvR
 0d+hh/b1XiC8gEhjdgQmkzak1KmsoOx3BJDBkN2xCr2qaBBdsg0eXKJdSFotY3jMagP13uild9S
 mkowYil4LY1q7flIc2Kv6vY8YsnkibYeCejR+AFDLjkQHbal5NXsNNdCINWS2150EEf3iETiSfA
 3eRnDNVAGZVcZXHPwUeQqQ/lZ6Mu2BIVKchNEU3MPpDC3nYC5b80eVAWB5L/b38KN6+V0ul8//l
 v31ECch8oS90mbAw5cSOlSvF+YCqcDTYP8XCGwFBzKGCOfma1gQWR2YHaRiRg8xRr5llESz2MwD
 rlukaSY+1obOnYi0gqm1Q1pVFPKD/7q0UBoiKibObwjfZyIhCNWKmmDkIfzUqENF1xuO2ktSVnb
 wf1z3p2N34d88tsoYGlCoIEuiwc4d1lJ5UeXRasMkf/GxCWaTHATwMA1bPkrFt+74uqM+0TPgMz
 bmqu07rZJuRqs/oeoXg==
X-Proofpoint-ORIG-GUID: pxZl2JF-EhDlMAkryh3vfz87rSczdlle
X-Proofpoint-GUID: pxZl2JF-EhDlMAkryh3vfz87rSczdlle
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a296ad4 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=j8Cu_9a8AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DdRk7HRULw4uXnc1SswA:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=A2jcf3dkIZPIRbEE90CI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100131

On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
> 
> To conform to the specifications of the USB PHY, the reset signal should be
> asserted for at least 10us. Guarantee that by increasing the delay for the
> USB2_HS_PHY_ONLY_BCR reset control similar to commit dcc6c9fb7128 ("clk:
> qcom: gcc-msm8909: Increase delay for USB PHY reset").
> 
> Cc: stable@vger.kernel.org
> Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---

I'm still not sure if we need the extra 5, but one does not reset the USB
PHY repeatedly so it's not a huge loss..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
