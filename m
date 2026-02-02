Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00304126BF1
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 10:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026653; cv=none; b=SK2RnnsdDEdP20XeLidTZHMoMr0voSTM0VXyDuvSVA6t1QmD55MamqgjrrBXDcCAMtltGBErwYnhW6zK4O+ADF20twehccKBYmC6dRL7lKhk5nYgOD24WRRiucm+a5n5o52Bd4UC0si4ZUwyjWMdiSHh78GauhHVUkchVyAmy1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026653; c=relaxed/simple;
	bh=L1rHivF6NBN0lD3cnyGkyngQEuYOKTLHrhI4xu2xf8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pOaxWmr6oxHloxfvGN33lvuZG0STFYbqyGYwtvow4DD1EQVMTnl95LE1ooLXsleNasaIb7uaTMmxIEMyk7yuH8fQ5EU5wYJ2dSOEYQNa5JfKTdMBQZ4J5d29XvVQNa3iRTMiFDorEdvRstP6FDt9iV44SAff5O83GFBLVLlDk38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WWWd6cfV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kVh+sl3x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WWWd6cfV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kVh+sl3x"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61287Qn12574528
	for <linux-clk@vger.kernel.org>; Mon, 2 Feb 2026 10:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kbYmq9la43Ch7Tu6ofM3MTDu6ZiuUveyMm3+/gY6fH8=; b=WWWd6cfVNanH3dy2
	orfJK+gfTsIc3Yao7eMqWaOKPwn9GwVMQTDRHBBtoHYJXvklyBXxqZVRCYNbLo45
	JWDPl0zuTVcoxDwds+fzYgwkVqaU+VgwaTCqzKiVfIpWzLbIfqeBFK7Jwnh1cR+e
	kR5RnahhJL/EJ0bYZP4pmMUWpehOF4V94O2rGUj1YAOsIjKSrbbih7obloXflp7m
	iRCJkiKNwRAV5lN548PVW32GnQA91dCTNAQdFjNSg+585c8Lr65IpQXfwvxVbsCp
	zsCTQUN1r6LM+zN34nAn+9uTdCNxG9Q4/o8jxxev+PKWyBLE0NLaU41SPeMFXZ7Q
	vmctTQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1ard507m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 10:04:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8888ae5976aso12583546d6.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 02:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770026649; x=1770631449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kbYmq9la43Ch7Tu6ofM3MTDu6ZiuUveyMm3+/gY6fH8=;
        b=kVh+sl3xxHqT3cNPpft+KMV8CKay6wQjaV6Peg/kT2s6SddIygZ4eK0ssshy7byPla
         g5m5bOl/mUsxX05NAnU64MSIejIY3wk1CPyyhYrl0MAPe4lMYfLq7OIXZ+1i9MRr4ArK
         ESPFWIXRdgCIFGZRV1EytjjwcMnQrUZtLrzIJKYWIEYqTmvcTHsq3hhjtmVMo+U0J13u
         l8IPnPrmZGq8DLF2/syh6ZTRGl5iUqWddQ+8OXqmPGv/r1kZVq03dkAnxcWHbjwks/cm
         E3TfFozm0NaHXDdTlJkUHZHAAuR8bn5l7ig1nPdzHck3QuXIv/EtfpuJPTsAlo0VHYk7
         43ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770026649; x=1770631449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kbYmq9la43Ch7Tu6ofM3MTDu6ZiuUveyMm3+/gY6fH8=;
        b=ZiY2+fQADhzALE3F7iBHwUbhm5MqSOYFtED5ZEu6wuWDLBdwALr4udx2fJqBvXBFAh
         AoE9sdtz5cTJIPdQUwRw3qtJMzmAQ/8B6NQPE8soua4SfzVIO3tlkTx1KMH158jdWoKj
         a9/aLdi8aWF10kr8qVoc+owNoj8kfbjjynJYY7sS3e1lzXh9fIe0bD2OGTjdp1VDPKLR
         HKaY+x50LDiqyzDFP6DRl37e/f0uzu28cXt5phzXxIZq5J8CT/+9NxL4bGuYscCRL0HT
         JkzgHyTCqHI2Y3c/d+/nXq9ys7RPsiW7MwDmHzn2hG9i+7HPsMuUYxnK9XFSXYf6okpD
         IXWg==
X-Forwarded-Encrypted: i=1; AJvYcCUAAntSiLtpZ4CA5CXQ2CCODLwFg+XgPbksrkn4ICgMRrb0Ynx9qOS1zXibG4m2DL0wEaNYRdmd880=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQsAgrujpScf2ZLaIOOEQhZM9enkxhq9+g19YamahCsUQivc10
	xniaCjL2CaxrvKFE3yom6KStTyWgyxCrWN6Z2cMxPcZ59n/3ad4f6R6GE8KZDIy4scyP6UMZ8Lk
	vjVOcScXRGObn6KtvOf5ZG2BuWw9FOLHAJxs8N99wjkeu9pDHFvAngXTa31kPIXc=
X-Gm-Gg: AZuq6aIwF+9I4Nmr3jXiBxR0ZWniOX3yJmGOzMQVOEuuC34iuuXOD/lzwUUKPQRz3Az
	uan9GYaLtce8dxcTecNN3rjOMuZ5vbA13V/StZpBPpMpHAgbQ95aSjMROWNQHsRoPoVjRc//qKn
	htuyPJrry0/C/PgvxTlOtC+CJtT5lciCu5xpv2A7+CcrrWC2n31wEMBreocAW3n9Sx/CSq9S/ky
	p52ZV1iqYZwFfyko16KiH4imIznRO643RwhEmfk/hogpt7d+fhlQDrt8tYl6AoSlxMHF1/vv5uN
	7Hp5FCITNPilrDC1JjIrQ5euVbVIov5VigeSuHMHEG544ORsXhTX08oets9bvNYyXblvBkiPWTd
	C0DbyaWb0xvgZWKZXsAPAlLU4qqlJtSe0Nu1+cL4Q6Ev+bFuNO2ZFAHuIx07fi5VQIiQ=
X-Received: by 2002:a05:6214:4c89:b0:894:9d19:d632 with SMTP id 6a1803df08f44-894ea10d5bfmr93866176d6.6.1770026649332;
        Mon, 02 Feb 2026 02:04:09 -0800 (PST)
X-Received: by 2002:a05:6214:4c89:b0:894:9d19:d632 with SMTP id 6a1803df08f44-894ea10d5bfmr93865826d6.6.1770026648930;
        Mon, 02 Feb 2026 02:04:08 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4452e73sm7211223a12.11.2026.02.02.02.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:04:07 -0800 (PST)
Message-ID: <32c68db0-8798-43ec-b875-563957053154@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:04:04 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: sort out Iris power domains
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <20260201-iris-venus-fix-sm8250-v2-7-6f40d2605c89@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-7-6f40d2605c89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NSBTYWx0ZWRfXy7nIk5r2UtM5
 G3TWygXSo3HIMNIUkhlVBLheCDloKuxJn/QkvB2stw57LZS0TEXJTNT8X2kM+txlKcLav9nsUul
 LU4HuO6CHXBhZRo4fMQlUWClDHYf1i4Hyn/9QlHGjxTINUJsUohV243MfKok/++KGx3p8U7ECCr
 jm/7304/djhJ8wvwrh+IJKuQd61l7PJAXvdpeLiZE+xBoZ2kttqEFEzfA/L6j+Td1TFjsFhPXHI
 +OL4qSyajzT6arohYkUwr9lVsybKlFKmxCiNxm2+HJgrHDGXWVyDeCYt+0qHyi3o+LOP3bnSNql
 vIDkljcH0tkTjc6AHupkMf366n9dK3kkYKHNDCQgYU+ilY1+iZSGu/sEKEsKUjLkeD/BBA/fp1k
 Uejz+jDdlqyFTBQOmsikmYJ+dVZ/D8skLT0l6oYtKB/PeudksH4SCCFHnCkNdhueij8pxdbjgJv
 HfUR32xwhzTpIt7HUHw==
X-Authority-Analysis: v=2.4 cv=J6anLQnS c=1 sm=1 tr=0 ts=6980769a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=K8E2y3tpqAm5I2OsxKoA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: w1aFSl22uaXh19aMLoxJHpOAR1UW9Tkq
X-Proofpoint-GUID: w1aFSl22uaXh19aMLoxJHpOAR1UW9Tkq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020085

On 2/1/26 11:49 AM, Dmitry Baryshkov wrote:
> On SM8250 Iris core requires two power rails to function, MX (for PLLs)
> and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
> qcom: sm8250: Add venus DT node") added only MX power rail, but,
> strangely enough, using MMCX voltage levels.
> 
> Add MMCX domain together with the (more correct) MX OPP levels.
> 
> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
