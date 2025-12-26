Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3141E5B73
	for <linux-clk@vger.kernel.org>; Fri, 26 Dec 2025 18:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766772032; cv=none; b=Mvck0a/Zu6pX8p5+3iRuD6L7K+6TH5t6K0Ue6qEd0wizUXTrJJ/YYEGRfMHnw6I2n4H+P15iWmMUSrqP1etg6SedQ3mc67A5sXZFHjyrV9xB3xS0OeQtbEh0Gjfh94MD2pysLTscYsc2GTgLHksPIoLHXDFOvD/U/ntMg5vCRWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766772032; c=relaxed/simple;
	bh=Tw0hpYujlg+lIGxFPAT+vDw7Mbm9lvuZ7L8uDeKIUek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MlWWzwHnA1Xp629Dd2qknIFsw214LXWSFr4YSIVMEWZoJp+Qk5kkOWOF1rQmK+4/p17womBrxvDZWaytIJp90z8fYi4hyApSOvSIm20Xz/+JA1hAbWdnGtOdiO/PUvwe5y6Cve3Y02sTnA83tmGrrPWJ/sWqhoIq6ahmd90c4fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nH3IY2Pu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GEkDKG+l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nH3IY2Pu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GEkDKG+l"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ8bf1M164343
	for <linux-clk@vger.kernel.org>; Fri, 26 Dec 2025 18:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tMuB0hXI/5B2GptpbNmP+iRFf5l17u1VGLcI/EUuwcQ=; b=nH3IY2PurkfMMKbt
	fH4fDw1dbuLFkvjZZf4bn9LlAEFebd8WY2/4zGVV0Yy33nSmjl4daGtDZ3A8cMGf
	0u4l5vXVHsqKUai9o9AcMQr2ZZwQhOcIndgDGl89HlVfzS7oxTAANYmYzDrU5gOa
	O+WkQqgYbKeaPRgag1bExCo1Xl8UtPsgeuiHqC3EpeMzyLjBILRQ/A2/XEEWvdUZ
	iNfOyxdnAmu8/k6Y0G3b8LiITCb4suwZoDSC6f6MCIrOZ4+JICBe5z7FMVBkU/mT
	YrTbClRdes/t6VoWyKUzoOz2UiMLGfjr0uNu8GpKhqnp4FpFJ7lGk5/9XqyIaQn9
	iZJLRw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8vaabp1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 26 Dec 2025 18:00:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f13989cd3so226778465ad.1
        for <linux-clk@vger.kernel.org>; Fri, 26 Dec 2025 10:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766772029; x=1767376829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tMuB0hXI/5B2GptpbNmP+iRFf5l17u1VGLcI/EUuwcQ=;
        b=GEkDKG+lUN02oWxttCIbAaJo3SRP5tDaONHOiTSo9lg0mnt5f5h+/41vtspgAdAw4s
         C6w65EGhS5iszwHfQbxzU6tom4xxqdpH9nBgxWxUluwwkVs7imTG/gD2LlvnUEzUebpk
         oGHorY7gRamJ/KrOA9nIKm+TvAQACb0RtcpSfk/o5oPVOkV+F8DnIHMeYBHO7otOerIF
         vBecJhzwVdBFGxr49zWofpGJnKbcncfbvLzHww5lqL1NFd4Lln0sTFEfgVNrLbEhmpPE
         4ao4IlIAI9Bze+2jxtXnoAxpMC8Cwk1Kbfo+STAJXcsSiBYxDc35jbtCk0qUdz/1hLlp
         N1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766772029; x=1767376829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tMuB0hXI/5B2GptpbNmP+iRFf5l17u1VGLcI/EUuwcQ=;
        b=lgYNALcOBAs0D9h1CwLdLZ0fL9QKmXGrgTIdX0IQ8Q5UEKovSopFv5o4T7zU1vkCB0
         KwVBepc2Sq/OUF5GcMLHMdilu7J8wUr0fPneQT70XLY/3rVouOWxO19wYcrXEa0r5mYE
         veKR0/sQqoUPPLJQI40uSeHEcXFVXd06VGL5916IKrZbrfD6N6+EcIytYYolwPIwB8Xr
         kAOw5XIkB/+QvalAXTNWGfwQouxwkCyhUu+vAzOH06i5xkAg8wVOIre06+OwGSMwCbtF
         ej9BiQzj9RkUBrn5GfcG/30At+Zx8NRGQrRdZNzNMWEoL2TLICArWyZc8iu+oBGeYdcI
         JABg==
X-Forwarded-Encrypted: i=1; AJvYcCVKA9rh9uuoJHD6L3i2EHhBewNcDhYrrWNXWp/qlrbUbjQnmbo6+BO7gQfV91LRq+mivBRDSt/vXCU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0TIbVso3/P/Ovy8arC2L1rIeecWGBjdI9Pe5pGUxEIRHVgGTm
	qnyoCWupt9NxZ3+OcuVP9XxPU1r0yK/HLBmr8SWfgHDWr1YYj8gxUBFBCo3hE6inLrhTM3ARFyw
	tP8CYMSymu1trQUIoUM4tHseJfD1EAviwazFr/CbHHe0c7/6q1aPlmxF63IqGuIg=
X-Gm-Gg: AY/fxX78m1DFE6/88ORqIr/lBYiSDG5+VrOiMlQJ6r7LUGwV/MIGL3C+khCv5pxInBu
	+EfsdC4z7gdgTYjG1ub73/H7DLKbQHtn4OuJlShGWQFRxkkqX55wCyN46pQyWbxavOROlekpQTd
	5XLjIxA2n4wE3j/cH0S75ZrPV2IuEe4bKkqoQRUGbCxgDZAAsaWKEN/Dzg0vvA878R09vFWrkyH
	8u+hhFOD2nDZngkmGeNJMpZg7+9GBVBu6F4I/B3yq/seqbSGNPgjqE1/WlIuM47OcdbgNvciHKR
	t0KK8s3PtEtva/ZQc8Zeo3e4ECtz4kahiiV/mudTmgfbuqs7lAQoAoP30MZBUONw7HGH5qQMFXf
	X5Choinzyt4VQ1+4Yc+Ip3Hk0eQsFdnyP6DRTMA==
X-Received: by 2002:a17:902:e747:b0:2a0:b02b:2114 with SMTP id d9443c01a7336-2a2f220697cmr236097545ad.11.1766772029162;
        Fri, 26 Dec 2025 10:00:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTOcClec5lZYyKWh2iYi1rQ15hI+Z9TJS1BmbregQuUi4Yc4X2f6fvZg18gwi1aVYLsphQXQ==
X-Received: by 2002:a17:902:e747:b0:2a0:b02b:2114 with SMTP id d9443c01a7336-2a2f220697cmr236097165ad.11.1766772028587;
        Fri, 26 Dec 2025 10:00:28 -0800 (PST)
Received: from [192.168.0.195] ([49.204.27.144])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8d10esm207575495ad.42.2025.12.26.10.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 10:00:28 -0800 (PST)
Message-ID: <79483c95-c376-414a-947e-d7bf836c1e94@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 23:30:23 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: rcg2: compute 2d using duty fraction directly
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251222-duty_cycle_precision-v1-1-b0da8e9fdab7@oss.qualcomm.com>
 <emy273nvnbzznvufe6fmbysrln6d7lm4xi5rwsuwnj4kjlalvx@7j4dxyd2f25l>
 <176661333774.4169.12534802903262524563@lazor>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <176661333774.4169.12534802903262524563@lazor>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yPQqoQIRrPUfHUapFrv6TqtmifazB1V5
X-Proofpoint-ORIG-GUID: yPQqoQIRrPUfHUapFrv6TqtmifazB1V5
X-Authority-Analysis: v=2.4 cv=WMByn3sR c=1 sm=1 tr=0 ts=694ecd3e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=CGk/GHK3MkyyyFueakV4jQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=p2D3aUV_7dyrOLTwZK4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE2OCBTYWx0ZWRfX8UBWU1sfU7Ap
 HYaEHvf0Kbz9GrH19+7xSdai7kM0iYlfbXkawYGd5ewQ9ff9mXtjL2uliALz0YFhrsq3Y4kqfWb
 Q8mjZGrLQXA8p239aJG924NDHi5JM49tZJY9YQVN59CzReLgHXVqcbrybObjpynggwwgKdvW4Mi
 8oCW/Lx2TYuYCHBQAvPi7gooO5hLSG/YA7csm54YtAgsqLRvvcnVdtASqZBoWDW/HQscmoIRQK0
 0isNKGtZFWzEkrJ0kri/Ws4a28GLensvQP0NswAfomsH/fOAatd1u3rFNgn2Ltam8X4Khmpgr2y
 fw6jeW3a3TaKUgKBkABipWR7QY6qDu9gklDWL5b74fHJO3DlR/dhv9imjvXJJbR53KKkajne650
 wGdIP5Q1vWZEluOmViwoge4WGkqE+bFkZ+R37mOgiCifBxZPpPcMsanXtr6QFLtMb4BlyRYIX2+
 BVvNfCJVZFZEfjCMJdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260168



On 12/25/2025 3:25 AM, Stephen Boyd wrote:
> Quoting Bjorn Andersson (2025-12-22 09:09:54)
>> On Mon, Dec 22, 2025 at 10:38:14PM +0530, Taniya Das wrote:
>>> @@ -774,10 +774,8 @@ static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
>>>  
>>>       n = (~(notn_m) + m) & mask;
>>>  
>>> -     duty_per = (duty->num * 100) / duty->den;
>>> -
>>>       /* Calculate 2d value */
>>> -     d = DIV_ROUND_CLOSEST(n * duty_per * 2, 100);
>>> +     d = DIV_ROUND_CLOSEST(n * duty->num * 2, duty->den);
>>
>> This looks better/cleaner. But for my understanding, can you share some
>> example numbers that shows the problem?
>>
> 
> Even better would be to add some KUnit tests for the qcom clk driver
> functions like this so we know they're still working.


Sure Stephen, let me take a look.

-- 
Thanks,
Taniya Das

