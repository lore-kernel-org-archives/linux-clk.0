Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB91133B6D9
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 04:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773806870; cv=none; b=TTCUCig/5ZF9adtAQ7VCO5wHrS7lrI8EokLjj9TH5ijCopUhP2ftHaSYGETugS1kU2kZLw1F1Onvp0lhZtK5VOTlm7wFXCYkN8szOHnDJ9GZJ4KO856leXXF1ejcUkb8xD5K0zIPSN7vwrVxg7/QYUFEdU/cqwLnlzkJcICI8Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773806870; c=relaxed/simple;
	bh=SOWNwEgW+yqc14NA6gQzwIEghM/umtpaC0GhdYxBqx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tLJF14hOmGJIsqBgZcPN75sde9nmIXyWPL5gko4sabTT2xR1jilHtnST31ckKQPR1a5gjWGLMCdL9QdP2XD+sB/8cXAZZd0JxJ0gxgcHx+zP6X0M2ucwoJQTgA8xE3Y9/bjlJOtKDXsacEm1dWS5/k92lfFldI1xo7MaCXWpXEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FpkaCPTL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fO00s5UV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FpkaCPTL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fO00s5UV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I18NqO1050213
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 04:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k6xrBMFAJXheTgn6LoOrZwCJL5Zk1iRQuzTFNEhCS0A=; b=FpkaCPTL7VmXJRfg
	22ZFXlq+veGuJU3gtf4FxKCG+OAIeYP4i1Ezhic7mlqA6gqnI2pg6UlVqenxCVz6
	mGoVJstu7Q2Q6fD1PcFGlvfQ4xKCxwOjLa04k+EoX+3WgyIqqDZEP0YL8KMu+2Ry
	E3RtY3uckWZzHFA+ardj1ci/q7iAbhlcwxB228jBwmELmmJKq90b2iw2igbVa80F
	zMrOXLov6aMt2q6zPMSvz4CHx5Tcgar6cWzPQ9O2n4wxWGm+/DKmZ0kCqeZWjwsN
	R5bLzHZQ5apD2LnPXwCTlYVKEEdOCFHt4kIN/kGqUinxb/F9qKoHT3KkmNlbeCz1
	HFamnw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4egkh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 04:07:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829b9320a2cso3005832b3a.3
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 21:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773806868; x=1774411668; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k6xrBMFAJXheTgn6LoOrZwCJL5Zk1iRQuzTFNEhCS0A=;
        b=fO00s5UVknLwQd/kOPKTKiZlqGYHEA3k2yAj9Sz7njyDSsbdKs6687AB4iIolh+jth
         z3r1mPGgAfODotS3/TlflknUjvt3ikDK3PQ2N7pNi/psXaG5UEM3dyYUPEpDQZSYCPdD
         Oz0bSjPwCS+8IYcri2vmdFdHuobJCdNmW6BNGGLHma073QnTzajlN9f3sSAkhDyLWz1f
         MdnhDHIlJt8yAQaC2B8o0BMdeM1i3bPwlmZXPdWxKhUteSQzniSSqqQm4fllfl7acvAB
         ITZMM4qttDXfPh02unvHsVrlp7VZPF4lAparHBCSNZ8dC3YFFykzQzR4QyVZ2B0Xp3To
         io0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773806868; x=1774411668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k6xrBMFAJXheTgn6LoOrZwCJL5Zk1iRQuzTFNEhCS0A=;
        b=ScMDxREx7kl4XFqskKwMlYyaKnmbQIpXYHVSaEotxB2LLHia4wbGUXTM9673NxOoUi
         xZYWmQcHIkLrSl1GcqgzmyhTIz/xv0KLkbbyxpKyj0r+6v9CIPpuyBTdGuQCddxkY/oq
         S9ByY0Qs9RgFt+G3Uzc4F/R4gk4fQEoKxyyEvQi6JbtzbZ3sm1AF9Yw0/a1iTUgi9TFc
         7q4+8gWPt408gvrFPAUsYORaLB59mhrgLaxMO40Y6xVJRfoEGpHUzRiZcc7x65UkQ3lX
         UcyJuU/v1yfDRx5xAWXmbF/B02bRtBm39fZFWMOFBtT744gq1lMzNo2St4U412AGXMTU
         OMFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxNl9nKnsXnGKkfC7vhYVgjCxq23Ok/lUKAD1ucdPti2JlSizjt8jtwNg4QTHQ5/3k54+I1sWLU48=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsrMHOWvGzcSpTTV+0iN6VNwiAMZh+3vCUK70WV6tgVOH3Yrsv
	7eznOT0NcacOp5tV9VEBzrNn0UD8e3FvrYV630PqcfDqOybBPO/6xYbbb6i0FitXmxnFAtgh6TK
	YjuVjUy71TunJG4rU3ZgNgyGVTXKoeXWcfd3LOaHzp2nvSXdxYy2rU3zk+4iFy+0=
X-Gm-Gg: ATEYQzzV0ulXowgttnJaddT8ixdJHWwkYVjqf+kmkOIY+7iUOsnmu5MJ+chZt8VfWL1
	/iwWlAeIeTPRUu3kzJd8BYpIMF5Pyt/T+E2jQkGFuIMJf6hjgW1VRl2GtZNysqL5cR678kurCGC
	KFUoD4+o+1m7v6IcIE0E6hzbl8mxxV8cGt4hO7xcZPJBS9pNjB1bO4LW6eFMmfuNSu9RE+wYfhK
	WPhsPtQLK/eCE4+5arkHjEofnSSnGZJItXBV7mno6lA4kMJepvh2fjSF9deSsSlImPhDSikk6Nj
	PmGo5w+pdRmx4YhKgGai6w+/BMFsaepo9s7rIWlckLphB4pf1iW1KVg5BGvRGKWOaD1hRxzU8g9
	ojBaJMXvHVDzDW4+ynmvbrVrpWROaP5ZstpyyZRR1q1hy/qM0NQ==
X-Received: by 2002:a05:6a00:915a:b0:82a:6b97:34a7 with SMTP id d2e1a72fcca58-82a6b9742e0mr1450308b3a.39.1773806868118;
        Tue, 17 Mar 2026 21:07:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:915a:b0:82a:6b97:34a7 with SMTP id d2e1a72fcca58-82a6b9742e0mr1450294b3a.39.1773806867620;
        Tue, 17 Mar 2026 21:07:47 -0700 (PDT)
Received: from [10.217.217.233] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bdd5569sm952839b3a.47.2026.03.17.21.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 21:07:47 -0700 (PDT)
Message-ID: <caabd5da-166e-4826-86b3-a1d80fe193d4@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 09:37:41 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: defconfig: Enable clock controllers on
 Qualcomm Eliza SoC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
 <20260317-eliza_mm_clock_controllers_v1-v1-7-4696eeda8cfb@oss.qualcomm.com>
 <1b28cd99-3a6c-442f-9668-23aca9b1fea8@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <1b28cd99-3a6c-442f-9668-23aca9b1fea8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T4+BjvKQ c=1 sm=1 tr=0 ts=69ba2514 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OaLB_a5L4ud7_QXzgQYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAzMiBTYWx0ZWRfXyrN4qc4sdK0Y
 QMSERrDqB7FxGjs/7A1D019Zr5w1yrB9f7HwVBHZ9kxWGg4rqNwWp0PvKnPG3nrWlGdBXW5Q4CK
 aZTclRMUzuYtiJtsRRuJRlZN6hljEx5wB0o0bupCNaYV9/euQD2m61LLabyYpY5rriDjcaiN56O
 3WbUVaqVMzqLMOdggFM3N5cA+84ci6RGt3vtIV5kQ6V7/2s+m6B+Wi/hNMQUc1b3/mkzf6UOBDS
 d136+LO1War+uj4GDdES/mGNcL/wKtDYfhJqWZrL+tWS7zz4yTz/KmDkoT13kOuQSIZiKzgkzB0
 3V8EcZR2ygSCfDwrJ09rJw+A0o7zcRAXSgvfOTsXnLOAYiZuV8DmCP6JPQNjXPRnog+ZzLGD8DL
 +TOcQewUhYgON9upIAliCitkhPKw3+b0owlmXvQ4wPxN5CAGdYRcfqC+2Ivlvh08N148nKkkXTz
 Jic3l9O0Fs2THlZUmZQ==
X-Proofpoint-GUID: BW4Xj9W8jqXjE1VjUTiwJS0dYZW1Hi4z
X-Proofpoint-ORIG-GUID: BW4Xj9W8jqXjE1VjUTiwJS0dYZW1Hi4z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180032



On 3/17/2026 10:56 PM, Krzysztof Kozlowski wrote:
> On 17/03/2026 18:14, Taniya Das wrote:
>> Enable the video, camera and gpu clock controllers for their respective
>> functionalities on the Qualcomm Eliza boards.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  arch/arm64/configs/defconfig | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 18881bd239f9c53e74ad5caa492bace394e4fde7..dd45d275d30a32fd567432b5c324896518aa4ad8 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -1458,6 +1458,11 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
>>  CONFIG_COMMON_CLK_MT8192_VDECSYS=y
>>  CONFIG_COMMON_CLK_MT8192_VENCSYS=y
>>  CONFIG_COMMON_CLK_QCOM=y
>> +CONFIG_CLK_ELIZA_CAMCC=m
>> +CONFIG_CLK_ELIZA_GCC=y
>> +CONFIG_CLK_ELIZA_GPUCC=m
>> +CONFIG_CLK_ELIZA_TCSRCC=m
> I told you already twice, don't send duplicated patches. Once when you
> sent sm8750 videocc, even though it was all ready and posted. Second
> today when you completely ignored one month of development of Eliza in
> Qualcomm tree (so your tree).
> 

The intention was never to enable TSCRCC, it was more of other Clock
controllers. It will be dropped in the next patch.

> Now this. You keep sending patches interfering with work which was
> already posted.
> 
> NAK
> 
> https://lore.kernel.org/all/20260316-arm64-defconfig-enable-eliza-basic-providers-v1-1-7ae581670aa8@oss.qualcomm.com/
> 
> Best regards,
> Krzysztof

-- 
Thanks,
Taniya Das

