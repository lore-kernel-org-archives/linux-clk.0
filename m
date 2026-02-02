Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93E93587C3
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 10:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770027660; cv=none; b=efZsRxTlzuQuiulkrSkrsTH6T1mUVr0tXWRWXrpJfVf/sNMucWBfjOiaINoUyXdlynLrmGmeOl1cINEcwY3zEWRDwHFmu8hr2PBVstzPiqpRIC6ExtRUDZ+AWH0h5BwX4FSVqrVqPjFQOlzxdiX48BTR505aJV1uwXMGz1iELC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770027660; c=relaxed/simple;
	bh=69fDhM2MNSYKxaIMW4WQElFr9savBfG6n3ZiVVmCrvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TYyN5vVRrDTdS9IXSPtrgcgBP4+FBNTVbnpr8aSCdH0Hgye8bsZUN2RHjm35aEnEW3lBIPU8yxjfK8Bqpcc5NdFiFv1rHw0cS4ImdlqPHoKrwpDGxZBDAv6S9n0I0OZ+u8rW767JByywOp+NKAsY/hMSa6ePp9f9gQcTrNRk8SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LfeWzLyn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DgM9nJmR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LfeWzLyn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DgM9nJmR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61284ADc1537337
	for <linux-clk@vger.kernel.org>; Mon, 2 Feb 2026 10:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lbbM/5o1YHALe2TiY8ThEdvZflmJ7vTUzQzZZ/lJdhI=; b=LfeWzLynzkq8Bv5t
	C5MPnSHxOjq7oh8+tX3T0NiQvQR2iJagb03UIXhw4YYpRldzv7mK76JRIMTT5C+8
	RSYQ90Ruaq/rcLQUwmG+H/y2qFwQzXp2cRq6nipWHxfmUWC+kwiejHBXa+oAx4dp
	CLqb8Fp+4FGZUuI+XYAsW7tLSLrMrcni8rjJK7LQt7HnVB+veTd4Clfb6fSJERBI
	DWfy78k6fBcX9c+TS5GDG0LxfWZtzAAiR1t+Q/103u1cazi70eDoOjWV+t2m4+IM
	8syjT4XJKblKheZWb2OQWqavVmagmNKgLBe3zj5BFOZR4sSNyrxuJmpRkStZO6mQ
	1XS+rQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1au2n0w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 10:20:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-890072346c2so8874426d6.3
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 02:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770027657; x=1770632457; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lbbM/5o1YHALe2TiY8ThEdvZflmJ7vTUzQzZZ/lJdhI=;
        b=DgM9nJmRGGu6UR2y3scKn06pD4TyiNASqJ6XStODlNHZLZTplMSsNXTCWxHkmEWZ1i
         ZwLD0Pcw7Ioiq6fbG3/8icM+9Fsr0uW+MWyQxxy0BTIeRh6kaawbDwbNYMLwlR50F2pr
         cTzLbvWhieTonCMm6pcQaSKdfLXAo07coQiCgby999sCH8FuWIXEaGRBcmeCI82rfPID
         bQIeJGd6l/l5WTXQVzgb042SQBt2Bf3X0L/QaaJzAjp5y9S3ucrvXOq9r9D19jzxkQTq
         X+tU4gblPNaSJGv5z2MFsoJrC4Dt6pyT5dWEfUEK6+gAXxJLhOItZ8HaxlcciDgiHte5
         1ckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770027657; x=1770632457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lbbM/5o1YHALe2TiY8ThEdvZflmJ7vTUzQzZZ/lJdhI=;
        b=n5B1vUfI9XauSrT/FH06Wr/BQ6fvIdcyPnYuDVmz8WirPnIGbfTebRHABP/Jq/yD4I
         VYWZ6p1k6Qek/mgQiGeS5ykNNKXYdnWBcS7UprW1HMd2urqFTFtSUvqd3Az/iloyEKvK
         2el5pt3YjsRRhEShTHXPj/P+KWwJu4pRJ5b4c3EupPWbsL8PHHGqrqCyRbs0GkcLuagw
         iB7LiGIgPE7eMz70wsjlutJPSknxxYhLmmeziQbSRurA5re4GOWIqj2mGpVQf5ZsC3Mj
         ZAaRwt96hm8I+VlIMY8uwm0wqbjVDpMslTrkvrrl4U+nvO9DAnmRHaUzzlTPBiGqEgW1
         7fRA==
X-Forwarded-Encrypted: i=1; AJvYcCWoS+Oi3kO2JtzqtokjBRDZauKMH1QM+9ml3xBdRhrctCuNQKvKFTjpU+dnC1dPjdEf6+5ESv69MtM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGSBa19pfCFLOnouyNsYm3wPDvLgCsA3tDtP6SOPOWOr1vrkuN
	gzflw7YRWsqrBQYokepXtQDet4XNBUx/VfZN6FyPUsNn87YjRM4aQpNmkZfVZCZ1b8497QhtX0L
	nQX608UagrRxNnT52aatmMe8ErfaF2bvpoxL/z2MFgDL9Q7Azr3kvycJj6RKrU4I=
X-Gm-Gg: AZuq6aLycgBnLVptjcUbk5ds+U7agCEpEjFCaoAdE4J0mixCV2BZXW9IDzKb6C4CsW7
	7XEhb/Q6zB9OygPhN+6eW4VBujZuIhLuS5eNSrTRUJXMEgo6dj0gaDr1seZxHepSCyGwBhcL/Ib
	aLI1dB/xOJEMD7c9EtkYn/Uz5J0lB9ugI2o7KcUPAsToEZ7FZhiw1xAEaQ2Dop5ZIraeVusOm6r
	KRI+xBJ9fSRBR52hsOvjTz8cqcaVfmDzt2LWOlQFvqonvio3hYLwFHYcGh4HoCI3JHCg3iYkxZl
	qgOQw1pqCsvfM/MYZZq7IPS4MbufVpA5B4Q1qDM/RYoIHSUWPJUhHlugVdh4qiYOT9HB4tR1A27
	nmAMehcy0jIAIaMKWG8xXvNWHC36Y/CyihVuow02TecO/9HeNKCttw6g8y7trfjHP6hw=
X-Received: by 2002:a05:6214:4d03:b0:894:6c97:691b with SMTP id 6a1803df08f44-894ea075718mr115131346d6.6.1770027657226;
        Mon, 02 Feb 2026 02:20:57 -0800 (PST)
X-Received: by 2002:a05:6214:4d03:b0:894:6c97:691b with SMTP id 6a1803df08f44-894ea075718mr115131106d6.6.1770027656840;
        Mon, 02 Feb 2026 02:20:56 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4453094sm7382716a12.14.2026.02.02.02.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:20:55 -0800 (PST)
Message-ID: <95ec1fa0-5f0b-4dc2-a420-599d61f5e11d@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:20:48 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] media: iris: scale MMCX power domain on SM8250
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
 <20260201-iris-venus-fix-sm8250-v2-4-6f40d2605c89@oss.qualcomm.com>
 <95977a30-616c-44af-ac93-90bae2bed298@oss.qualcomm.com>
 <ace931f9-822b-4756-8c23-f69963ffac02@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ace931f9-822b-4756-8c23-f69963ffac02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8-4i5P4ousnZ7oSdojTSX8QHPonhyiDs
X-Authority-Analysis: v=2.4 cv=TtfrRTXh c=1 sm=1 tr=0 ts=69807a8a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=PIOu0JlNxAVOzX5nUJ4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 8-4i5P4ousnZ7oSdojTSX8QHPonhyiDs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NiBTYWx0ZWRfXy8ty08twDBou
 KqPZv+YN40ihvmeE6IKkPwbSMVUNOZYPavph7TB76LYRTOWaP3IFTk+jRHdNQNDoLm2ee7AUis2
 ZaJphsCTtaydtjuakao8lSeTfydcZZHrZiHAfyj2V6dQ7SwVVLF1hVINUZsxnBz9JqHz+5wNDxZ
 fNDBcDM7OENjXjwt0DQiW5Fe4GyeEzaT/neOzPLEkEiD+BBIkDfVLGKBJbjHzmfPs0BXAsj4fND
 GWZxl6pe+NfeBxzFyT2Jbdb7usS/JqOjYeIkilcowXBCh8XwCWKov6r0LHc1v9LJD2wzTil6sPY
 jxU22iCuFHfP8Z4rSw9GK+5SliBYoFIewXdZxmvmowpYYUifScJj6u+I5h02UM2tqBqwV65K7NF
 5EqAfqPVq+eu1votpxcaO8a3gMhOHoJqqmvF43WIIBkEj79j6oIGPgOeFIumb8NckPGWIeMRTg+
 DtE/uliW5DpdPkV1fyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020086

On 2/2/26 11:12 AM, Dmitry Baryshkov wrote:
> On 02/02/2026 12:07, Konrad Dybcio wrote:
>> On 2/1/26 11:49 AM, Dmitry Baryshkov wrote:
>>> On SM8250 most of the video clocks are powered by the MMCX domain, while
>>> the PLL it powered on by the MX domain. Extend the driver to support
>>> scaling both power domains, while keeping compatibitility with the
>>> existing DTs, which define only the MX domain.
>>>
>>> Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>   drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
>>>   drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
>>>   2 files changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>>> index df8e6bf9430e..aa71f7f53ee3 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>>> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[] = {
>>>     static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
>>>   -static const char * const sm8250_opp_pd_table[] = { "mx" };
>>> +static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
>>>     static const struct platform_clk_data sm8250_clk_table[] = {
>>>       {IRIS_AXI_CLK,  "iface"        },
>>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>>> index 7b612ad37e4f..74ec81e3d622 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>>> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_core *core)
>>>           return ret;
>>>         ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
>>> +    /* backwards compatibility for incomplete ABI SM8250 */
>>> +    if (ret == -ENODEV &&
>>> +        of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venus")) {
>>> +        iris_opp_pd_data.num_pd_names--;
>>
>> You're decrementing 1 to 0 @ this point in the series
> 
> Why?
> 
>  .opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
> 
>  .num_pd_names = core->iris_platform_data->opp_pd_tbl_size,
> 
> So here the nom_pd_names is decremented from 2 to 1

You're right, I was looking at the wrong file

Konrad
