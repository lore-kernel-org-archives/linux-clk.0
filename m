Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EF021A434
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 13:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784726150; cv=none; b=ONAtB/xkDc3Cx4jY1BHsbADxTxMKG0yGlYEgXojvIf9SyGw2wkbRQeo/rYBxFuA0bN+YqgKBYRj9cqmb08jcin1sQujTTR0M5/V1bqz9DuLSpE05WCimg8cjIi6uYcJNdQqGN6YQ1yq9djAVME5G+bDRBmvrlBsiC/OufoiJ9Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784726150; c=relaxed/simple;
	bh=+Yvl8CUQVYUwowN48lsRM1N9M0OFq7pvUPzAgtaXviY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MXdQsiB1X4KorxabeqaVmT2qS9jrqYh5t0VXs0LebIInvKTFruNG5qrRuirGd00XXimtPPdTfvkYmi6HHup0AHr3PysCKREndrhioDMkV5TcYtaA3W1dmxT3XtAsKC3Wz980YsQFu4uJDEvhyyGnso5Z+sYHrXG5L9YEYPDh/k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iB3X2hpV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LrZVvV10; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iB3X2hpV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LrZVvV10"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MD23RV824363
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 13:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E2pYKig/VqmDd/aJ5K8VxO3FvWWhc6q9pFKs9v7eaVI=; b=iB3X2hpVcO1pMabk
	se6520ykhfMm+AvOmkQJ9e5t1+9kvRluQfklrdEQf7Fdldq1Lummzx/d9xGx4Ut1
	EcbsZJMuPmC8U3bzrhAW8JuTeU2RaDns6WzFyW2fqXOB0YZ/N6KtzJ3fvSbVdUqS
	9zZYBOo1z8/Cn1L5pr85uxiqmFT03wq99VyWZ+ZQRF1fBbrx67pANfo2hYNDpqVh
	wsv5fnE2Vz+pILMCG+7nOTBg8gGHAE3dZuZEV17J4EEc6fvLHbGWAWNdcncSxd9F
	LZGelCsvI++6KrRuNiDusffroNF/ZgbrSlsjuQ4n4aBW4ke6hhC44vP4y6m6G39z
	plPPAw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6ac4n9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 13:15:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c069f73e4so25694881cf.1
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 06:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784726145; x=1785330945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E2pYKig/VqmDd/aJ5K8VxO3FvWWhc6q9pFKs9v7eaVI=;
        b=LrZVvV10v3khPo5dPw3UNMekpdlTdyS9bEByCCmqWTPvSuuAXV6ON3o3wqPKdON+Yu
         7cO1ZClhpzJHbzJhlnlTi2/7GQa4kbuE36a8ok8sT5smAGotSn/7+YMVNKyDFLFbjiQF
         Qn49HM/JaWUGMy8WkSFXRAYzPLxe0sytQBlAQZeHP7Imy81kNL/RhmZzwTzKPF7NnGbY
         pPSP2LOMTj1Tqpdfep1eepEEDrtKmDL2dE755jc2z93wVGhE410xf7qSrERI/gdS/Hgh
         RYjoYjbWNWNM7qMO0cDmJR/CCaicrzmFFKHck65zb3zQLtWyBNybx9cpO24pzzdUiQAQ
         O2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784726145; x=1785330945;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E2pYKig/VqmDd/aJ5K8VxO3FvWWhc6q9pFKs9v7eaVI=;
        b=pq/2iHnepRItoMVAYoklADY5kJakrceVOKgP1hwVufnZ2Afzuyu2CA77Y1crQqTheZ
         ffsEq0nS80zyNItm36nFtJ1WX63ucICPb7/Zy6Ut2XfGPFvCVe0VF1I6p274wUeJlzdY
         X52euJ/YoLtrnaUrBEV/ds+PujcoYiZcrjtKUM8N7kgm3kXm4DJoRPIBkZaORHUyBK7k
         LMU9lXbljpIQBznczf82gtcwd02GXL3nzHL0UXBAUCtn/a6HeFAHgkAguHEDi0YiT3BU
         1v8X5qfzPXpAdOOM+2Ab7KnEWNgbMK/gjbgIsmr5E7xlAg6rNZBHRmEpD3fuo3tB9/uN
         J8oA==
X-Forwarded-Encrypted: i=1; AHgh+RoJSClmIlMgdPY3wSnsq14hoSmpQ4jilRFBHdPlcdfPzFwh0B/jH4md36mTOAk97kJiQ8+5byXaToY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwljonQ3NawwAt7sbQ8FW6O/pYktO8AOzXwm9x5svhMw4pkpDZD
	kuBA+67I0LhHkSy0brBlZJDYxhfzU+YL7KtOHmTjB878rzoV3YcVmtSNmrzyR2v8DTk65iJ8kw3
	mhiI9RQEpLlO0H2ZRU8whjr+pRVZcIu6Dx7xMny9ntqwZrrxFzxRXp5ayk5RDVwcvSB/zvLo=
X-Gm-Gg: AR+sD134ImeG9DmYU0IqjfS7wO/AaavnCHs4/+6y6xIyEp5BybmpZ5nalZNIbUdB7na
	NvHOg3hpUwOsSM3ixjjHizeORpcSzdtKYrunr0VoEOjh13twUQ6AgCRY5FvPWlkfk7OLshpMLja
	JaLkJ7tjUQD9xdTcjvR8PtlU/w2VrMXGsV9FxkZM87cytdA8JALucrJfe8DJrTpu3eeEWVEYZhz
	m9s2pHPqRWWTPbp5iEFPJTkKXkc/0T27J7ZXzW8I7PVvASZ+A/MxFvDQ3DT8uCBvagyXfGabpeY
	G0aAqTdemMm2O/H3ByRTvlqpZOl43+DqbJ+6Y14aqsz7mRqz4wqGM4o+kuBJMJxvw90ArkMD8yT
	bAFQiQ30Q5MbjLzBz6ApSXMi4
X-Received: by 2002:ac8:5c83:0:b0:51c:857f:9c1c with SMTP id d75a77b69052e-527cc19d2demr27925161cf.11.1784726145136;
        Wed, 22 Jul 2026 06:15:45 -0700 (PDT)
X-Received: by 2002:ac8:5c83:0:b0:51c:857f:9c1c with SMTP id d75a77b69052e-527cc19d2demr27924861cf.11.1784726144702;
        Wed, 22 Jul 2026 06:15:44 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebbb0fsm101684966b.53.2026.07.22.06.15.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 06:15:43 -0700 (PDT)
Message-ID: <1fbe6819-e0cb-4409-9abb-d71272e63448@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 15:15:41 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-qcm2290: don't park QUP RCGs upon
 registration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Douglas Anderson <dianders@chromium.org>
Cc: Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260722-agatti-no-park-v1-1-31ae3a4774e5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260722-agatti-no-park-v1-1-31ae3a4774e5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEyOSBTYWx0ZWRfXwDZWrDYHNlnR
 VBmtSGwFPMiMTZV1hdabjCqbmTDFz17ocT1kNxp18n+Kn5ZYmuNeb62dXfXUkryvs+LFLgisEL6
 4xkif9ncSbOtzxGydN9+wuN45Rza2TrHgnDgfbfISQmoe40CXNhGK2z8KFynztCi+Q++bdoMgzr
 WI7Q9CBEle/l7R1eNDfFJ4ruAF6XI0uzPwqkFO7dQGyBJPs7YW/t9fk/GfqVbDO9H7SDwIo908i
 AU7a9gBiR3G/VL7sREj5tTYSMXAgwrPCamVCDDg6Kee+v9DuosW8blLsXLK/yEDKemmpgwzwKjA
 80lkkYeQus3fHgc40pPMoG1rrpTAl8HwAf91QIcDgFogl87eNsUqKkoIMj1iGS5QkEHrtBSAgeZ
 dOdGjHlVcrYd8vKlNpLlwPbCtB6W+ZbOTEOXqyDptenya0gKibq8BoY2QUm7RRcNJpwYc3AVzGy
 5N8qGJPRlqd1xhHKmtQ==
X-Proofpoint-GUID: iF0Q06ZBtPO3l17x3mglQ2Tl78oo7Rdd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEyOSBTYWx0ZWRfX6z5PsgK1Hxfz
 +RH6CCuSWEj/6ELRTVCHw8TAoOfBHTD3TXUqHYNuw7xawcNbCMvwx5ZUpwyzq6S12uEd9PebnX2
 OhWDLPvg0CB4MVCjS8ozK2fTJGYKB70=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a60c281 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=l6PFIUm38CZcM4dbOsgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: iF0Q06ZBtPO3l17x3mglQ2Tl78oo7Rdd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220129

On 7/22/26 2:46 PM, Dmitry Baryshkov wrote:
> The gcc_qupv3_wrap0_s[0-5]_clk_src RCGs feed the QUP serial engines
> (UART/I2C/SPI). Since shared RCGs are parked to XO at registration time,
> binding the gcc-qcm2290 driver reprograms these clocks away from the
> rate configured by the bootloader. For the UART used as the boot console
> this drops early console output until the serial driver later
> reconfigures the clock.
> 
> Switch the QUP wrap0 clock sources over to
> clk_rcg2_shared_no_init_park_ops so their frequency is left unchanged at
> registration time, keeping the bootloader-configured console working
> across the gcc driver probe.
> 
> Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

