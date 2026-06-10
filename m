Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC273E3C41
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098823; cv=none; b=vCMLPZGBPwGibi+nVyjL5QNdyk2NnqG7bmqmN/BznzSavcWQHrgyanS1jgSfWqzWOc7tmB9vJSsORqSL6Zz5NXjZ3oyZx0IF1HiFXTYmBtCkmgWAIoxmo7Ai6nlKB4/dXMNM7ns2Ysn7mGWqJUEVXeAXFWUQSzFavHBwp7E4RxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098823; c=relaxed/simple;
	bh=mVXvA3wixa6hyZFvV4amyK9ItwAKUiD/qlGCQPnK1To=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cWy62L3rb2f1nH76mWz725xEY4jbGN51rA58fT/1JylH++up6ligec25IghUe/+pT0+0ZGym04tOrWsKkEmhvzRRBZeqpf7kuAu1z1YlqPG9TY641qmocEqRp0O9Lzxr51UDCdzc2P0BSZhr7ZiCnZh9Jtsq7QQNRbZfGeWnyyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SAYsM9+C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FnjQMzd3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SAYsM9+C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FnjQMzd3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBd7h1137374
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bZHZRNhM99+ka//kSSbW2vbtqwvtfObRGMFtOdCmG4k=; b=SAYsM9+C7UMEjemZ
	WNe/d19a0wFv802RiOdQc4e/jh9FrAor1JlhtZ+eYi6qPTIXkupbvXqYWi04JImP
	aPejNR6Hsb5PFE0WVYetuKJh3eqgeCzPzOITgzbZuqDa3/lmOsT8+AGOA7RSU95Q
	Yo7sx6KQoUDY9a5yFrgIZ4w2Rb3tELanRyPVI8tWXNA0e8Km2nQErLmfzNqlu8F0
	W7mldqwPbcPsfTpVK580JKBddmpmmhF2UAZ7z1YoHh8ngfNzpayoD2dPIQjxK4VM
	buSwG376ECMWbGSjHM4fXFllt01ws3pDsdaiZfLlcK8m/QT9gidSqzDQxEHsuCHS
	CZsHAA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh2qt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:40:21 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c59b44054cso359202137.3
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 06:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098821; x=1781703621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bZHZRNhM99+ka//kSSbW2vbtqwvtfObRGMFtOdCmG4k=;
        b=FnjQMzd3T8VtEYWd36YtPszeniZ2p6uY1z8VgTD7MF0tkv/td6RqCt5CyaxAk0wLNK
         kwhRNIZKZ1PgJhyRvwLR4Wne1pAWB3q7Xb2HQYMjozNBWrnKv/QL2deELD7if/2olmkC
         /rTozsos2WPP2z90pRnvC2mcHG61/uKsQkTy7cIdvW/3ULMN+sL9jzl/+150+OtVYThY
         15Fyn1cHJAr2QayzTWTUMCpfqs9FuxkccDyhtdS2FYlLiC2Zc0oKUVqvuILZ/e1T1LbW
         3xT4zpulKutnqLD0zW6bnDgrty3IGPuFIUPlQP/INOwSogtnYyZSRvnUf2ZQxt40RmDt
         5zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098821; x=1781703621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZHZRNhM99+ka//kSSbW2vbtqwvtfObRGMFtOdCmG4k=;
        b=gdoBnLmzQ4Ug15g+ynC9Wt8sUuFcj5XzoxoGEE309zORHOGSZnwvgdlxk4hEVZdqHF
         7rFixisU4jjb+OWh8wgX9bn68Ci+uuxgCUOB7j3EHyOj52y7v/fMs9Yrrn0guJG/tv2m
         046hIHYBx5B8IAou8S1GIkWGYHyw4ckgm6h08wcDq3vdZ0BXqkjYZYm4G8uOCrit4usk
         KgTRs39k6qxS9QZ5vAJ/ds9L23l2xqaJLw7OVBr4AaUd442OpwnVM9mCRT+LY2IMHHYb
         X1MWvdH0Brl/FzyZDE9Vghah3qRtuCisAdImqt4nOKrSucQmBcJ6+GvETmD9hWlmf8AI
         udDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gYLehwSw7CZcL4Q1GTx26GTDbJaCQlzXGTxA4Rink+14HgLjycrvFptsHIHjMc5ZNonxSTPzpGuc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfoAZ3PS5pg8UvXNEf9lCJAMZX+JFHqDis/q9z4w9onXuv1Sbw
	XF7V8luzIZtrdPo6UPgcDfyHhaYAOVSyToC/3VbXJxgchd6oUiWSKXmi+TFt5Vj3taL3z+zQmKh
	rhc47CfXIjIUeXocNB0XlyN0s6nIF8eqjduCcEmMzhNl65iSOkfc6rKwtrrZEfwU=
X-Gm-Gg: Acq92OFM0hpuvVm8HKtIAsQVePVUWOWEUFm9hjDLzWrrA247yWnIYKZQaDJILp5nzIL
	4GzYVY0tDBXl+6o/0q8xaS8UU22pFzJwetq21YOAz/Gs/RiVyYVVknSHRIAyx0ctLVbjZemDdf2
	8nfdSAHahGlry8zuk8cI0HGquXaHvY7IGsoUeGWkqChkGEWanzle5GaVcsxwozNS7/ScRyua2a/
	Ofl/W5trKK1OLXIPtJ1R2OgOOlt1umN/tF8UUnUWukJsROXalE8Eb9gnZSVlA/yrovEp3Kycgd4
	4yvLwDENBgK77RXJfT7iUeSnxc3wI8fso+ke5WDEelJpwfeP9N3Gtnyz0dZd+FjtebKz7txAq5U
	YTVs4oOg4pvwY839RUy2equenr+/REak+3YHHCWnhZTwD+dx/5bL8EUJH
X-Received: by 2002:a05:6102:6890:b0:6c1:6ef9:db9d with SMTP id ada2fe7eead31-6feffb06cd2mr3913372137.3.1781098820615;
        Wed, 10 Jun 2026 06:40:20 -0700 (PDT)
X-Received: by 2002:a05:6102:6890:b0:6c1:6ef9:db9d with SMTP id ada2fe7eead31-6feffb06cd2mr3913354137.3.1781098820062;
        Wed, 10 Jun 2026 06:40:20 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac07e243sm64054131fa.12.2026.06.10.06.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:40:19 -0700 (PDT)
Message-ID: <29d23bba-4952-4c03-9aad-5f7325e1cd77@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:40:15 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] clk: qcom: gcc-msm8916: Fix enable_reg for
 gcc_blsp1_sleep_clk
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
 <20260609-qcom-clk-mdm9607-fixes-v1-1-5e9717faf842@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-1-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMSBTYWx0ZWRfXyf06w0hUkVYs
 9Giyd6Mes4uZZkDXI5KlAI6M3y9gMJrBYF9V842ZkUuOQRTtyJUSxt2yYOnwLDMJnvuPJxOttUz
 QWzqSFvziWIWrjCjslseKSHKfJjGGtEWlWdG/atmL4/lHoQ6q/XPkZvmMIqoZ8SbeFPlDQuKr+n
 2Zl+sgLiioDThIXGIEJvaMMrAStH86C/18kTfgZ0teRtnJWOkgHNSwzvKybw1UQpqnZkLaEmdZF
 zLv8PZ6zRAjqKbRWrn9LOuMIZoCd0klzK1CS+BYsf+N17CDNs9GevtEV5QuptrkBbS5fgoE28/3
 awqvKh0iUHBAUrizU1Nd9YrlmyWaW8V3gyYUIYE0oeplexCdjFYaHLP2KSyCzQvqxHOzrp2kB7Y
 Ux8zawLckP4UX6o6xWggb3CFQs9jQlgwdQJXcRlkilHrXF1b5pkPwI3v11bjccx64y334973GsB
 b8xk8ZIWDE9ltmsSr3A==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a296945 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=94LYJJSoxN27RZodj4oA:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: FoL8zwWvr3WJvWMterh6aAGsleEeafOr
X-Proofpoint-GUID: FoL8zwWvr3WJvWMterh6aAGsleEeafOr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100131

On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> According to the APQ8016E TRM, the GCC_BLSP1_SLEEP_CBCR register is
> read-only and only has the CLK_OFF bit to check if the clock is running.
> This is a shared vote clock, the correct way to enable it is to vote for
> BLSP1_SLEEP_CLK_ENA (BIT(9)) in GCC_APCS_CLOCK_BRANCH_ENA_VOTE (0x45004).
> 
> Cc: stable@vger.kernel.org
> Fixes: 3966fab8b6ab ("clk: qcom: Add MSM8916 Global Clock Controller support")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

My sources concur that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
