Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2056F3909BD
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 08:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776328115; cv=none; b=Gh6llmVsiVVairiSX4Es19oLovppgK4nC9KOCbRMYKyFIFVK2c4CfycRwxYJDBVRPvhgqlUjEGl38wwCUr1V6OqtYKAUIT0/inMTbk+L223Lxg9iOUgfIbU0f392avNeKqxdFp42GYm51qrcYm96AkldQXprkpOSgCGCAlcwkdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776328115; c=relaxed/simple;
	bh=UArPoZ37I80QcdnFfys7bFqnf/VN5V0FZIqC2nIlfYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XLE9uEEUh2h3ooDb1LFUDghaeUEtHC10JeAA28olmSvhGmJGe3hRWAuF4YIqMqlF5WcXT9R0RIdgEbH3KnbxvflSE42QAqqG0Whs9FD4A5nMhEuaH/NDQiKfcD5x/l/lU1M+mLIDJ/ay9MRvPegqlhCIeBvnmO0dRdJPcOzhJ2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NxbDqwk7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GN22ERA2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NxbDqwk7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GN22ERA2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G1TXA8579768
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 08:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DQHthsDGdl9w7MGb0t8lhxCpnqMRCQMQQcCA2m7POEw=; b=NxbDqwk7EKtyLjPB
	Xom//KYTmM9aj+qhFdj66c0KYuA2dL/fdcTGqIcuLGJe8Q0ahQ+DBhidTOxV/qyY
	05vfoMfTogH24OklCiTNyNJERBhE+YYDS8OqCXZMXMA5car+wuZqOQ5unkZ8jHkj
	gSiPatAJyq+G//tEr1whM6OPAmj9fpx43EyzbtNE6SWHeSeS3bh2RmfBlZTeVzgB
	ZHxcGTyxz6dXniLG0GcSX3V8d+B1g/PKAoH3KnmRB9ZfrcPDrdFN7r2yYotgkdpm
	swEqLzpgvUioyyRMI0ClVUG0D7Yg6tSAj4N9Uvr1QVtb8JmeMwj40jCt9+atMUze
	5auKTQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djcr8ty5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 08:28:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d4c66096e5so108849285a.3
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 01:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776328112; x=1776932912; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DQHthsDGdl9w7MGb0t8lhxCpnqMRCQMQQcCA2m7POEw=;
        b=GN22ERA26qfDSh3pisDkuSOdl7/trd8qDsXM8LYhCXEXYJaPjKD5mEUrjiKJCjzfgN
         gJqG8iGXZUJpdHmZ59Iy0AUfnojN92/10jH2ftj0RyjNjTN3Q4aq6UbXNv57VV499C/j
         WSQclnJmVBUxio56vcHuDxtoBEM8+R6qoRi5NUva2mOKAYD06TjhV7UhXJ18nFvlF9rm
         rHktm6NAUbD8h9dez1lLoGDwYEDkXONpwiB+XptnlWRDvc7wvSS5co5TPvI3cI5SW9JC
         GvkrIVouMCvDZl7MUMIJ8kgbbihA31giuPGF7KpeaH83Pw4Zqkbm23ZD7qXLyqWnnABG
         jmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776328112; x=1776932912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQHthsDGdl9w7MGb0t8lhxCpnqMRCQMQQcCA2m7POEw=;
        b=eLDAZ1E1rP4K9S+QFdpt19XGQGHs5jY2o0Keb2zez4F0C1G9WFI+ZHjId/5pbfoyB7
         b193K3bBHOP9tyxWOg53PdI8juSXvdpraWYUeDawenQpSTTf7vfkENZsHk+fi67BsUzH
         idyAGhItINjfOdRSnAdl2Bh/6bXIKTlufCrZhcNrIR0wHPawY7de2eariaOoLPYguR5T
         rhfnn1iIKcf0533586lexEOmZTxX3vuqBt+ELxTOx58JFyr2xaSZtwLq1DRNF8x+2C6v
         emRUFdVip1rNm1grmcHNboGBdXns+CwGeDr/Xz9ouP7r4sHFkeRGtvytcEo0rBaFSldP
         kw+Q==
X-Forwarded-Encrypted: i=1; AFNElJ8sL2SGa6UO/D6FwAK/HkGFOlAmRne4SP+grhyb4cFW5JxgfiQiWbJx5LS/MM6tzC2y3Zl7lhvXKXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa3r/XZkBVN2J+ZsKkWjkXhZWiHWaF1nQ2nOJ+JE7AkHcNljs3
	nVi7AHLjGkNEF8X0waYj4N5h6RBjWGOzVWdN/RZboW1tf5LFkWNxypcDe8/TjnhrgdZk8ZtmHCf
	6aiqipSFIRyPrQgwhVwqkicSo2f/e/HjhNioFTAC9GOE4DcpIGZYi31JEw5wXNiu8RL//pyo=
X-Gm-Gg: AeBDietgqbgAScmmtaJiXclRGpvvuRB9tVyO99HFSWE83Z5FTXwDc3Tfg7gpMvSPsEp
	Iqw6yAXa8NctKXmtVzG6Fpj4wrot/AZafB/7JPTgNlXvA0ScXajogH2Ghzu/q+IIk5XQPoFcTD0
	FJLb3H512qIlNRof94QOqxkVPNiAW+SVhy34FMgFdIj3YbuRsQxYMA/O4dQRd+x8h2xFDv1s71Z
	CbDS+uRSj3LqcJeAaKEdw5NJnTEA/IWlIfKpV8nzwrP8QMBbe1dGpGzPHEagzY0WJBPT7e2Aay1
	PoELfgtxaWtSTA+qBWJy5n2Fpmvuask8r1iwHNYAx2X+g6dNP+q/evmelqAKparZC1YbJyyEI75
	jucZG+5nt9ZH8euaQ4V2zCi+PQBcYdDzeJlxQQSE8QzEo8CpfbkeUZbWuhS4CklyrroMGpDnD6f
	J3PfOPvS863FmQpA==
X-Received: by 2002:a05:6214:e6a:b0:8ae:6380:8fae with SMTP id 6a1803df08f44-8af61fe98bdmr16984256d6.3.1776328112229;
        Thu, 16 Apr 2026 01:28:32 -0700 (PDT)
X-Received: by 2002:a05:6214:e6a:b0:8ae:6380:8fae with SMTP id 6a1803df08f44-8af61fe98bdmr16984156d6.3.1776328111838;
        Thu, 16 Apr 2026 01:28:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1739300fbsm146192266b.14.2026.04.16.01.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 01:28:30 -0700 (PDT)
Message-ID: <ce0ed808-facd-456d-b5a7-620dbad6465c@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 10:28:28 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: Make important arm64 drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com>
 <20260416-clk-qcom-defaults-v1-2-579e75c4cfe5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-clk-qcom-defaults-v1-2-579e75c4cfe5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gc8nWwXL c=1 sm=1 tr=0 ts=69e09db1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=H8HeEjOgkr3naCPkutQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: tOnSN2B29rn2WppIp9IBJfLjcgElKljB
X-Proofpoint-ORIG-GUID: tOnSN2B29rn2WppIp9IBJfLjcgElKljB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA3OCBTYWx0ZWRfX51KD4skrGSTx
 I16zPHd7ea1l1ToJP0xaldkuSVbbsAIA86Q0mVi1OghxKM0ubNQhyDdpRpAF7wcORYkbT+4Qn5X
 n0RmENAjVmwTlFL30jz4sCJ8ai4bjSeg0wJPJ1Ek9FQWdameH9jGCwrQ1wpm4ZKzMSX57ey3EDy
 wGxQ91YHftJnZ1txuDGLVsSkTOktvXmoGIHxab5wneuFVEowwx/gj2H+TmJ413vL3bxg7YMyMiY
 ImSf3SVZFFwFof7gnFeZbJ8fdX/fgned6+fu/WTnE/0/Koy0UcuMaU3ZPgqz7Lfsuhkd0/kLfp8
 SGZEVru6GsqqcZFZ810HY3IhBllJ2+tGUuw87EK2gmBMpn4T0nr3C/I7mvD5C9c8tf9qWdDX5Fa
 d49SjQ2C+cL7KCnfVsH+hA8fqVMpfxvLQLMwVfJBzY5pd9a+6IA8mGETrQCFLG2NSBd+3DeBPeE
 jHHNhA1S9xYqovWoW7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160078

On 4/16/26 10:10 AM, Krzysztof Kozlowski wrote:
> Clock controller drivers are essential for booting up SoCs and are not
> really optional for a given platform.  Kernel should not ask users
> choice of drivers when that choice is obvious and known to the
> developers that answer should be 'yes' or 'module'.
> 
> Switch all Qualcomm clock controller drivers which are chosen in
> defconfig to respective default 'yes' or 'module'.
> 
> This has no impact on arm64 defconfig include/generated/autoconf.h,
> however changes few drivers for arm:
> 
> 1. multi_v7_defconfig: Enable QCOM_CLK_RPMH as module, because SDX55
>    (ARM 32-bit) uses it.
> 
> 2. Enable QCOM_A53PLL, QCOM_CLK_APCS_MSM8916 and MSM_GCC_8916 as
>    built-in, because MSM8916 is also used ARM 32-bit.

Is that to say that the arm(non-64) defconfig should be updated
too? I don't see a related change in the series

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

For the change here:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
