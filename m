Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537BF2D0C66
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 14:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768315813; cv=none; b=r5DNsw7i+auBDdDfTF7HcEPkfQlqiUotVL4VWubdFFrGAki+P0oQ5f5f2VkUVTGSCCL2Vs9KGv6oztLsQljh+P1pSqPnYMIRiDaVXa7wEwF7a1dGIbw4uattNcOFQctc/80wRDtWyIyKHtHnF8hNOEtd5HCCOGKZ6SyUo4z8c/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768315813; c=relaxed/simple;
	bh=xU/v+1+Ag2SE9i72VtMK72lv1azlPIgm9eEwAdK1Gdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gn3lIVhUyrDwBQOEQ6/68oKVUItr8EZFujWx3Z2QIYJbKs79oFVJk8xYThPPa6eA/r4eblRiA8yEtN18jGeH/oHPhmb9z+RNwQBq/J3KQN+95EOYsgmcsnB4FyAf677H0XKBp5ZkB/0fWAQ1j5Vc0CNanOxbazzaDQPn7dGLnqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vzqcb2dt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QmTtj1th; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vzqcb2dt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QmTtj1th"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DCQUgG3637257
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 14:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QcwxICmrR4gn1iEbkWO2XmXQzG34ygAOuMpV2HL6dSc=; b=Vzqcb2dt4qxwuj3n
	3tbwEq+TxmsomftMbdaJKB2dWG02cGZQ0B081IHQSeqUVPmXQjcZDZc6D254Acte
	II3d9yzPRmlkewFJLrY4w1CTuMTq75jwimIiyunT7t4D3RmQAwjkgh0asG+N1GWU
	7ecJ+Jvvmox+4AqJmqFXDUPK8jFO/MEyoZtBA9hnGc+yPcWdmotPRWiaQ3tsDZK9
	1ELHWZaOu9wXq2ITxn7pTZwfCDGTin829GIYqwNA1fpV3nzMvqlO5hSTZtpNFoDF
	qCqWP3P2dNIpfl1Fdg+RnsCfpSWhiWku84zBJ4EL/rnfWgB3uV3mZmU+Zapc+z0L
	IJorww==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng2c1pdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 14:50:11 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-646518169caso2195442d50.1
        for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 06:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768315810; x=1768920610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QcwxICmrR4gn1iEbkWO2XmXQzG34ygAOuMpV2HL6dSc=;
        b=QmTtj1thYCw+dfwSSkcIR9ik96T85FCtVg1n3wKuXiba2Yn8SEfjMP8xYzr1Bg0C1a
         WH1GP073FTzC7egKMTjBMqFn0FK2x+lfs8cpifLOF9OB6c6qGW8mBYzmEWWXv/6/2GIc
         xYNqwBP4hDutxTeJyJRAAVAuBITQPKZxBOjKby/xAhSnQ3Ke/0uqPtlV50r1LREHFA77
         s9G1YMwR0vEXwtOthDIyaY3awAvoKs3Wld7tUXOpqwFkztO81opT3fjWYVpsCiH3P7Xt
         4dY08hjVMS8ol1tYRl7v4e7zMnRxDp68nAYk5QE8owd34rvxyj9/yWMjsYzNK6ylftR2
         VdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768315810; x=1768920610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcwxICmrR4gn1iEbkWO2XmXQzG34ygAOuMpV2HL6dSc=;
        b=wcE8J42XRcDc4NF2GGxFQiw31TRu+ZlkUlOodpkOFMOvPVWrcSRsFwdV1J+T5J2Yi6
         EdsmVnxXv7qhmZ3RiP/jrfWmeY9XbtYuUATczBWGNkJABWd+aq/Qnry+5yH2Fq2TIJRI
         YwtebQ1hgdMBPA7GjEEi7mWPKjZ2pnpzXkpYuqtWQ+DRCbXXI7OckvozjFKdNB5koi0m
         kWLnMrHZOf+dag9eLjfAtc64fY1+M6u2VeM/TP3kCrRXDvMh5Q2CT6NfE5OZ2GuxSG9x
         af3G2zTmTMHWA8jR5hMdzBFBMJtTTCnF94MzGxBGybHW4tlr8f1Dy/SRlaqWm4lahr9I
         S/Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXtJ0G5BB6/gNaCXyXalzanqBLys84QM+Um4f2v67r6JmMugDqQ2HnfYM+Yax0kNvMsQzbNXd4Mans=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5OuW5iJbPD2zqFzk9JtRsqKesAr/ij+N47+sonipPHvHxvBAv
	9tKV1+AblGYcbz6XrHnkqZMCIagHPz2mKVFKdvjZROWJVqOG8KE7Rj/HP7A++r7XENKyzYYonKI
	kpQwupOpwlApWg2kWG1AjtxHxwusY3ceFpSYIcr3g9ctRx5F4KkfMwyLfcwSK430=
X-Gm-Gg: AY/fxX5tV5ehNmF54ynf7cWLUz3H39W+3ib5aNOFO5Fm55L+fVV1qUTKRyFYQHxxGa4
	yT6e7kCx84CXLSrMruirceaYm8R19d2Mmzpow3jTuuwuQ/XnN/WygiL6r9QkXhBCiGuBtDNr0zQ
	emUmyGo/O4SQ+uQDwIuF4EjQZkxF4ns6DPa0HXa6uCAySw3vILsEauca0QpbQaJvP99GCmPBlgf
	g7Jf0WewB4JXZ5mbhOtzVGIxvO84WjTHyqmP/bB0MRjUgz+l+xnrZLqRV+ouWnLSFF6If5tX8e1
	iqtcQl3PrNoRdLP8NGjqEjdi41uGDRbJX2VyRuVMZZ73/tooSJJWBmCaLu1pE7Hj6+ws/c02Hs/
	SfoWxANnRH88dj/q7CBipfnhSSOeo64Ho7lW6wjt8U7wVEu7wLU/0/V+5TROPlKwpfSQ=
X-Received: by 2002:a05:690c:91:b0:78f:c0f3:2e10 with SMTP id 00721157ae682-790b5701642mr160364677b3.9.1768315810522;
        Tue, 13 Jan 2026 06:50:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHp1gIBS5jEoXkt1plSH+bt7nf2F4KHwCWqllM1mxQRTlOiQ2zlHM62mWIaorCJLX3SUhEhcg==
X-Received: by 2002:a05:690c:91:b0:78f:c0f3:2e10 with SMTP id 00721157ae682-790b5701642mr160364427b3.9.1768315810084;
        Tue, 13 Jan 2026 06:50:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86fc303d7esm1058489866b.2.2026.01.13.06.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 06:50:09 -0800 (PST)
Message-ID: <d63d4c98-68f1-4dcb-b8fb-7c5daf343cc2@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 15:50:06 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: dispcc-sdm845: Enable parents for pixel
 clocks
To: Val Packett <val@packett.cool>, petr.hodina@protonmail.com,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, David Heidelberg <david@ixit.cz>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
 <702e4696-5ff6-4c72-bce4-1a9a8ee1ba18@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <702e4696-5ff6-4c72-bce4-1a9a8ee1ba18@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyNCBTYWx0ZWRfX9OxlDJ4QwekS
 E9QHEq6TjAoGm4PE1vVMSNnUJHFj9czm/C7nqoazzdMUKzLiaNHD8AlVPsPZzCDnjJMAzhWNeE+
 n3XbWKpNNS6xIWe92T3wF4xlQUnxXCw0KJFJkdSyajEXZqRqi66IYg/iBllzbHmHQLs8nN6xuyn
 AuuNYP+k9VWkPniw0w7xcxj5HFxzGAAWMDFoOeTt3IV5tB9501Ufm4YfxJxNuJBokWDqDV3hDG1
 R4RIpkFUoDq+Eq+p6K0c9hz6JxcJNpSFRb2GgcB3EK6IhZQGH0IpFcgDzVCZJ/plebmO60QwR0+
 TVkSo1TCO1+7m380m6V9Bbjp+Kb0A54O2FSpdIDYKJn5j8EllCHttOz7+MJdgoyK2wA0QEprow4
 TB/+eOC5gWCwQQH8Uu3FyOK5/CTjJGCyCsXy5qVZRtosvNkwF/kida2PxaYtggNF+VirmmGE0EE
 mCyz3q6v5DB6cXv1/Lg==
X-Authority-Analysis: v=2.4 cv=C5TkCAP+ c=1 sm=1 tr=0 ts=69665ba3 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=sfOm8-O8AAAA:8 a=rC8bUFBNB4MWVkYa7ykA:9
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: 58I46RIzAoSaS1YRxrzParMs7Zjxwzq3
X-Proofpoint-ORIG-GUID: 58I46RIzAoSaS1YRxrzParMs7Zjxwzq3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130124

On 1/9/26 12:00 AM, Val Packett wrote:
> 
> On 1/7/26 8:44 AM, Petr Hodina via B4 Relay wrote:
>> From: Petr Hodina <petr.hodina@protonmail.com>
>>
>> Add CLK_OPS_PARENT_ENABLE to MDSS pixel clock sources to ensure parent
>> clocks are enabled during clock operations, preventing potential
>> stability issues during display configuration.
>>
>> Fixes: 81351776c9fb ("clk: qcom: Add display clock controller driver for SDM845")
>> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
>> ---
>> We are currently running the latest linux-next snapshots (next-202511*
>> and next-202512*) and have encountered random freezes and crashes on the
>> Pixel 3, as well as crash dumps on the OnePlus 6 and 6T.
>>
>> This commit fixes the stability issue. I've checked other SDM dispcc
>> files and they also contain this configuration.
> 
> Hm, we don't have this flag set in dispcc-x1e80100.c either!
> 
> The only random freeze we have on that platform seems related to PCIe ASPM with NVMe drives, but during display configuration.. *extremely* rarely, but the eDP display output can get stuck on a blue screen. Many run with clk_ignore_unused for the early uefi framebuffer though.

Your device doesn't have a DSI-attached display

The Linux clock controller representation of the DSI PHY implements
an actually meaningful set of operations that (un)gate the clock

Both DP and eDP PHYs just provide funny fixed clocks to make the clock
tree resonable and filter allowed rates

Konrad
