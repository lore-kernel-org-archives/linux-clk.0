Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04173346E4E
	for <linux-clk@vger.kernel.org>; Wed,  4 Feb 2026 17:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770224467; cv=none; b=ockdRbn4GwB+Fxn0yPUYWhBCCgf62H5nzIsieriD2WxVYixEp33vluPzBvIHKJI+2NUCJ3ZHQCOrVKri4VuOkS91VUQTYgCz31AMD1VbsZn9Xak7KY7nLQ52UKkm67K6mkWzXlvHaIfmC1Fm8M5iW7B5C+7GO8ns4Q5jWTKucQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770224467; c=relaxed/simple;
	bh=b8l3uRvylvnmYlfiIOyNcMgNQqZ/uL343XbLioP3YU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oHqJ8LD2+xNXzGL5mAsKMAySZOqyYjOMOy2Z9hfTfi189D/ps7dIf7TATeIaVhGw2cTRJtvuxWWyoPTbbQiC/XQRCo0YxrAyuAsPG56nNGN8fVgPy2PgH2iqQiP+cqbEkrLF2sMhxNISkmHJsyUV3lq3BkZOhb7fc46Eku53KSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bqkf1+Wq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LrSTc0Zd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bqkf1+Wq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LrSTc0Zd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIMiW111000
	for <linux-clk@vger.kernel.org>; Wed, 4 Feb 2026 17:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3vaFz7u8fOWWpR8NKippz2cCLPvPJSPOUShdgMvVoYk=; b=Bqkf1+WqixRG6niP
	H5qKR1xHWQ9F/o6107B3ugde95YtQkDWWaGNzbiYE+iVkEU9h9IvEwI0QvRW0/q5
	3J2+TJ92DFyjZIT+viCnr2ex0yeNeQi1DLRBhdCALNcXRNli3bwjKoZypkGP9z4T
	j4M1jHmmO8EewVSIrsShdUo6Ecg2WwqES/HfWEctqyVo5Cqo/UxRclxBPTHnZGTf
	sfO+txOOQOXcOBTxhtWxNMXWe+i5q2AXTggnQ5fOymv3KJYtMuQztCyqeTMZHc2D
	0qSXbostFqQaPndPOnbFB4mE1ZERu5zDiKuU/K4+zYS8gkD1avL+rA0CTAI/My5c
	L/a71A==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c44xjh36f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Feb 2026 17:01:05 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d189185bfdso1722a34.2
        for <linux-clk@vger.kernel.org>; Wed, 04 Feb 2026 09:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770224465; x=1770829265; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3vaFz7u8fOWWpR8NKippz2cCLPvPJSPOUShdgMvVoYk=;
        b=LrSTc0ZdXg7knlKSYzSkNartBFJhd3NcEmt9rRa/E7KPPxjek1wjCD6fKJopXTnSI7
         cHpax3z8LwmUueOP1JovsuCgg1RHML6/Coj4QZu0WlGECMWBTFwUu4sDRL4HdXyDR4Z5
         NDoSQFzdJSjMbnfGjmceSSF8eehHk6pFy2K9SrDJyvkGUM5UC1uiNvxTxvl1hRVsIAj3
         utiWUpm/zX5zmGTZHOKpzmosI/4xJbiGymVV69IfRb3tsXCtTXPRKkB/auDtHxRy3mfG
         496TAOFLcACHHSM+Xce5+5PotK3r8ppdSMuGKJ0ZWu6dr37oVMJvDI6C35h0CM70zlg1
         00mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770224465; x=1770829265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3vaFz7u8fOWWpR8NKippz2cCLPvPJSPOUShdgMvVoYk=;
        b=VwEBxUH2A8h6/pd4ExHS11nVlRn8zk3wAhlgg0Du4NhZ5HxPj7qzJPXvlY7VCgvUMO
         tQhLZniKmkzIZkNWLZytxFZ9FWsNHi3Pf1D/jG8uJb9GZr35GbKLdEbXo5zGZRHJcOG+
         rnu+ylDzk+UNpNPt5F3f2FCTmfonCav65ruIkInNJTVcbAlVGELwYfZYsZRGaPZmQEQv
         X6KnLNnFLpB7BMRdf8QJYppBpeMOi+hr/d1WGOvXWKxbT6EUeAIS+WzVSqJJzydX0ErH
         uYR3i0GmdBOSq44NGMXz5jzRtN1sUp9Mo7FA3uzJBK5kYCtY5QQvPfe0rHcuMTBCGbST
         roJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaH3/K8zbbY58ncuLfLPCXlx0kMtTwRgK9bR4233znbJZMiCvG6zHBHzKgXN3eUVGbHnWVCTh25OY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyXWCm6CDFmz5q1BxIbLuFmqyYxHcYsH8qisH/03/M4u7Y8wJm
	PHonaUagPJ36nq4nGs6Fy1XFndGB3hpeSC21bJAIY7HyljXHurAaXKX55JZnzPkjHl/mv3vtYKJ
	z1RMzTQ2du2eOZHPrm1cK0J16F6yIOBLZthvpdkwirkaY36D9EZ7AB0wslwhGy6M=
X-Gm-Gg: AZuq6aJGm58NonB7NwEJ8QzYLRpbaa8q0aQFwUQumV5SfgjbvWPSG+M58x5yP87cPSq
	FyjzMJzIojO1vGelSSGrswkBkvw1UZjz0iYP2tQXfTV15VUsXCXV08V+oLL9nbjoDQmTERCl+0L
	PkHhNfDdF78w4BCp3yMH22pMutByUnr+Sot/wvlC+A34Z9q1edGyV9B5aLQcv2GJye0pUPVHWuI
	UOkMqIpEiKErVqMlE2Xw0juDs7LjFJxhgIaajab+YLLto4tR4nZGXEDUGUEMbYFBoPhSS6Dh/g2
	PZA4xEZfODyUEYs3LrixoHTTuhJXlhriVOY+8eZg718TvcrLlFwc2NngOrpphqfRfFKVbGpjHha
	pZgx+Asr/hS3rZ51Sg3TL9JQhSViLfkJTW3MNh8h68/ousRxX8PPA3T0otDjBT32wdW8=
X-Received: by 2002:a05:6830:7194:b0:7cf:d0f6:a1eb with SMTP id 46e09a7af769-7d4489b2f83mr1707997a34.1.1770224465145;
        Wed, 04 Feb 2026 09:01:05 -0800 (PST)
X-Received: by 2002:a05:6830:7194:b0:7cf:d0f6:a1eb with SMTP id 46e09a7af769-7d4489b2f83mr1707973a34.1.1770224464753;
        Wed, 04 Feb 2026 09:01:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9fcd8f7csm138531066b.14.2026.02.04.09.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 09:01:03 -0800 (PST)
Message-ID: <44041296-7618-4cfb-accf-aacefaa100cf@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 18:00:58 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Add support for GPUCC and GXCLK for Glymur
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260127-glymur_gpucc-v1-0-547334c81ba2@oss.qualcomm.com>
 <20260127-glymur_gpucc-v1-2-547334c81ba2@oss.qualcomm.com>
 <df4f1934-7366-4ded-bc8d-73189769d967@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <df4f1934-7366-4ded-bc8d-73189769d967@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DtpbOW/+ c=1 sm=1 tr=0 ts=69837b51 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wIi9r7vYnxKYCbEa-HoA:9
 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: pWDqtsvvIpEOFOUNPaVak_k69WHGP9w-
X-Proofpoint-ORIG-GUID: pWDqtsvvIpEOFOUNPaVak_k69WHGP9w-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEyOSBTYWx0ZWRfX2mwOfcMsEJno
 jj9GYM65KXUXafGijX8NKIeOpPsZ12tuacnjork2snCONBlnkFRITbemz6tOBy4cNDJWo/aIe5j
 4g4eTGIzkXs2Bs5zGeYjCxBaPGmC62cH/6etPa6WjLolA44TUAg6y0IK/GQOXYAErYrVlE8oGXd
 l28JVg2q8xAzTkC5NZimhnnkYST2SyuMyUA3nMmrzgtFe8SDPe4bMt4lt9jDOL1XSVsI9sNs5ig
 MP63NrwNAEbHQ7IgDI/50O3ZX+RsVhXNNp+/QhqsfxWcJnOYSCg2oStzaJ3p1Ix7f93jjAWp5HJ
 HbRzKI5N7PgtEQfKBGEghLa1Rx50tU6VVdxWlYhN/h5+Ns89AU9NB3Ip1kULTNngfj7gPeBbPd6
 aOCAv2oppQKt9wfuenK+HDvYlCeevKWWyDnCY7Z8LPXr9bbIcRjQoyKFVC+tpW8REtqO0rs9ugM
 xGWkxBM+CeCzcCqIV6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040129

On 1/27/26 12:31 PM, Konrad Dybcio wrote:
> On 1/27/26 8:15 AM, Taniya Das wrote:
>> Support the graphics clock controller for Glymur for Graphics SW
>> driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
>> block dedicated to managing clocks for the GPU subsystem on GX power
>> domain. The GX clock controller driver manages only the GX GDSC and the
>> rest of the resources of the controller are managed by the firmware.
>>
>> Update the compatible for Graphics GX Clock Controller for Glymur as the
>> GX clock controller is a reuse of the Kaanapali driver.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
>> index c209ce5fe4f003aabefd4421eb4f5662e257912a..3ee512f34967f1b165fdc5481bb28e1dadee133d 100644
>> --- a/drivers/clk/qcom/gxclkctl-kaanapali.c
>> +++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
>> @@ -52,6 +52,7 @@ static const struct qcom_cc_desc gx_clkctl_kaanapali_desc = {
>>  };
>>  
>>  static const struct of_device_id gx_clkctl_kaanapali_match_table[] = {
>> +	{ .compatible = "qcom,glymur-gxclkctl" },
>>  	{ .compatible = "qcom,kaanapali-gxclkctl" },
> 
> I'm not sure this is correct - there's an extra GDSC on one of them

After an internal discussion, we figured it's not managed by Linux
and it's not necessary to represent it, so this simplified approach
is perfectly fine and can be split up & extended if that need ever
arises

Konrad
