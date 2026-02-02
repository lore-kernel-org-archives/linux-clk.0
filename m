Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BEA2DAFAA
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 10:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026613; cv=none; b=jRPuUfiDRUyl1Bjr4QP4VfgNED+YgbI1hoUoeHshmm9p29+ndSyEh36vb/wkugKg2dIpU1EFVzU6lu+1ziMuxsv7ZzQsobNM0EJY1T0fLTZXOMBaPQa3tzNnlvNAZKkSfF4EF0vHHZv7+K73aQDDyp0B6ZK1S8eNlAq2s6CxA8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026613; c=relaxed/simple;
	bh=XEMyZqo6MP+uYcG6p5a5ymcj2O0tjv/y5I/kJu+xHrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OyNXW5QzFjsAy11f015syuEONd5Mgs2dYQzxhZ1+2CCtafj67XWylVftVL/LxUrjP2cQPH1AKpRZMsjJXIfNbSfda6q6n49B6eFEru48BWkuPDCmxYvVCbDKRuT7ScmurYHhpkGU0wylWEG8AUiiP04N6qxsrESZ2N82ZgfRg2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SgigRAE2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JUIK10q6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SgigRAE2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JUIK10q6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612880ps1325781
	for <linux-clk@vger.kernel.org>; Mon, 2 Feb 2026 10:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+aL8yDsraPFT4ypmMjaLgpbPx9Def0W/PUrKR7pwI/w=; b=SgigRAE2+5P01ZnK
	evdhd7XV9RCySM/MGoDPhcHqiIEMm+i9hdfIzzre6vonPoncpuObrhWp+MukOiZs
	Stf1jv1507twTynCF2kYLkm9YW0bSFFI+GAT8fkBcJ8zkVl9GKK6rxFcr84Ath8o
	hUbkd1IqXkALwGS4Z8OHlLoWxUeYh7t5m3RXjS1XOjwBhYLFK0on22sW+8gnUL/+
	rX814saOOX212tA/rri3FW/LwVdZRQv8lk3GOfqO35sk/lCeOBI+FisxEKGHHDKB
	fJ/I84YFxkT0RT6L40qRKmoKmesnLEn55AgcKY2XTTtT8jh6LWGvntVWicpEKqHH
	+mzBaQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awnw184-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 10:03:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71655aa11so1376736085a.3
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 02:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770026610; x=1770631410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+aL8yDsraPFT4ypmMjaLgpbPx9Def0W/PUrKR7pwI/w=;
        b=JUIK10q6xJwSh9mVP4cVnN6KuWidJ6WCx0c3VQ29oQQuetOU3EJsbtNKFAioH17YFl
         YJQoIbVjrus33YHTmXh63gSO7ZzA8f78hWiMjzWD3Dq+moKQvFAYlnEJFMu6A32NAj4e
         Ztq5x9l5BY4QFoKAmowd3TUZFuFuVEeSbiscvnS8N8aSBPD73dzmTSGGPXixksXdDCMa
         ao1YAuiqA8nAbYOD6zE1dR4/o6gv8MlyTacFBLQ46rQDusesVoBTmwO3leTXn+iLfIbR
         za0IqRtANM6Z4H5G7rp63S7YfUreCuV8fqTUYFvlQgs7zeZ7S3N2+A0VGZSrW0Pxt/dE
         KU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770026610; x=1770631410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aL8yDsraPFT4ypmMjaLgpbPx9Def0W/PUrKR7pwI/w=;
        b=ihkvDA7utRgqgv+nbe8na8gckF2+vlaqyrzYd8hXlZ6RS9q43cMtM7kfkGVfJtQhjM
         8qS4R2YR5gdnzz2QI30AclmcbyyDjLd1OyeAOzRPC3oP0c/tUCzA1fSyluocO3GVosOk
         EMS9upLDocCI1r5d+5ZfVZ53tRDbHRkdVBAv72XIYDFd3APlN+4Sipx3MN1XrwZzVwHO
         UvJt+yBY4te+DuSzgBXx4LyPyB5Q7gxPxfWobJlIsfTukSU2llIYwlSwR78dYWrCT3VM
         kzTW5T99MkK46tlOuhBscc5gYqfrtqDOPZXpzJqVELcUWQKmeuN/TRdzrAoHKShfAa4j
         KAEA==
X-Forwarded-Encrypted: i=1; AJvYcCX4yODH9Ujo6T7WPquV3E1Bb1QB2rFPf3891IYoO4V15oMQJDkRvcUl8EODo2wVfDDHkWxLtx6fp0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIpzHSGWkM7wVHJq/WG572vSgI42sew0PP6kjfbRi2EAzhwlFn
	3XOg7dhaeDNTGmkiDPLIiRGtkCkQeWDm6RWAbFSQz58YK3isv7Th2zQ+tSpQKaiVXyR2SqeaODv
	PAQJawP1pHk7UDFrSnuJAiGPDHrnZnBClB1lUO4Q4EeFn5OW2ZLWHYts8MZyjoyM=
X-Gm-Gg: AZuq6aJgfA+0zLbiMDOK3xD1S0fOK/XVpOFxSSIbh/DAdXmh/aLKMpXC6RwsmTHl5xO
	9eRhavnwXpRZZqAz3Nt3yUeJyy1Qh5cu58wk4UEKGqePBWNWjqIToShQ3M1/OPsnVouUKNclPhP
	F98YL/H0kpmw5Cqk7kvzKGKWex6PIPx4iLXCysglhlaX6+Zn+Q20GkrRwcDeJcUfGOjhaJuuyTI
	6ZxntY2aag0BSyhaiooZrRM0kmDIsjp/SSJn0HV1V+E4Wd8HBi6g2UggprV40TEQwYeXJhPyZxI
	NrQnXfqqeu/uctOe/svxB/vyX1FfhP6EKc/mrEN3jCXAWQeHUE8NkzfRdD+Ju1XrrCkziV2cojx
	XOwH98HXmT5Q5tl/VUqkF5KSBsunyhlI/RprXpBIsSoSBQi24GOXOK4rNRZMcFYv4CQ7MBuxONz
	7fBCAe4p8UHT1M4hA8PdqOPxQpvWmm9mebCRd0AmMMnV7FuMQJhBXw36VmS8N3Ylo=
X-Received: by 2002:a05:620a:7105:b0:8c7:1b41:d94b with SMTP id af79cd13be357-8c9eb2597fdmr1242230585a.9.1770026609863;
        Mon, 02 Feb 2026 02:03:29 -0800 (PST)
X-Received: by 2002:a05:620a:7105:b0:8c7:1b41:d94b with SMTP id af79cd13be357-8c9eb2597fdmr1242228085a.9.1770026609442;
        Mon, 02 Feb 2026 02:03:29 -0800 (PST)
Received: from ?IPV6:2001:14bb:15b:d5bd:79ce:863:9a22:aae2? (2001-14bb-15b-d5bd-79ce-863-9a22-aae2.rev.dnainternet.fi. [2001:14bb:15b:d5bd:79ce:863:9a22:aae2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e08b8905esm3302294e87.38.2026.02.02.02.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:03:28 -0800 (PST)
Message-ID: <655fcbac-b39f-4207-a1ac-d97bfde3d209@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:03:24 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] media: venus: scale MMCX power domain on SM8250
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <20260201-iris-venus-fix-sm8250-v2-5-6f40d2605c89@oss.qualcomm.com>
 <231ae9c2-bb3b-430c-990c-deab6a8a0d0b@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <231ae9c2-bb3b-430c-990c-deab6a8a0d0b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MNltWcZl c=1 sm=1 tr=0 ts=69807672 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=HXGjUklKsU4Eq_QyynMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: jNA6tq-d_-HLMg8Pni_7p-xdIu2Hy6f7
X-Proofpoint-ORIG-GUID: jNA6tq-d_-HLMg8Pni_7p-xdIu2Hy6f7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NSBTYWx0ZWRfXwcV8xqrYt2jQ
 upi36Yfku8efVw149M+strV8TFTWWjby8KvbrwmImwAZuKZHfYa0bdKolBKCfCvp36HrWPpLiGH
 LnxPbm/fTUulu2vSk0KPyAB3/zIeRZsWqdTNmZYjazrnCBqpUCsgX0nLABWlIeK2z2dirZHEFMI
 TkJexUFb4u4UmG+uxozKcn7tcRzWDN9rVwuzS/W0pFNFdvPSd0GAcIW74/GndGz7LPufDANPgQN
 Qpuaw9EJ1ng8qWko7s4DmFnem1C/PNRGXkxjhd66lQi4qlr1Bn4V6x0EIumrPvZ5rHyFLA/PCJs
 YVMuQxk2pjIzhc41YaB9ZB3fa7sQZYJg5of0uh6X7Mc7gJ6fjAuCtRIrCQyEV7MH2PFFWDKTFeP
 XFyowN4Kpsimp3tnHipFfXsJGJwDNRQfuXQTCUrCouKo2Mfjqyh+qSc/y709Zniz1U/Vb+fmjv/
 yHRTiCd9YJK5HZCVf7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020085

On 02/02/2026 12:02, Konrad Dybcio wrote:
> On 2/1/26 11:49 AM, Dmitry Baryshkov wrote:
>> On SM8250 most of the video clocks are powered by the MMCX domain, while
>> the PLL it powered on by the MX domain. Extend the driver to support
>> scaling both power domains, while keeping compatibitility with the
>> existing DTs, which define only the MX domain.
>>
>> Fixes: 0aeabfa29a9c ("media: venus: core: add sm8250 DT compatible and resource data")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> @@ -904,6 +904,12 @@ static int vcodec_domains_get(struct venus_core *core)
>>   
>>   	/* Attach the power domain for setting performance state */
>>   	ret = devm_pm_domain_attach_list(dev, &opp_pd_data, &core->opp_pmdomain);
>> +	/* backwards compatibility for incomplete ABI SM8250 */
> 
> "eeeh", I'd rather error out since it can't guarantee to have its
> power fully on

That would break backwards compatibility, so... it's not possible.

> 
> Konrad
> 
>> +	if (ret == -ENODEV &&
>> +	    of_device_is_compatible(dev->of_node, "qcom,sm8250-venus")) {
>> +		opp_pd_data.num_pd_names--;
>> +		ret = devm_pm_domain_attach_list(dev, &opp_pd_data, &core->opp_pmdomain);
>> +	}
>>   	if (ret < 0)
>>   		return ret;
>>   
>>


-- 
With best wishes
Dmitry
