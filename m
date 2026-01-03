Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D356322A4EB
	for <linux-clk@vger.kernel.org>; Sat,  3 Jan 2026 04:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767416246; cv=none; b=QDhly+n4Q/cqBnYBSzYz5WBawxmHhjkjPgKx+oQw9mQofjKboAD2YHVvtgshBN7ntVggOBWzxfsDWCzo5PT3tFAtVJsCdNDGwrGlzr12N0leC6UTpqisFasDjUrQjeBdY/s2CIrizc9FJwqwY0uSpqdMUeQJr0rK/dv7HHBQPOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767416246; c=relaxed/simple;
	bh=u94+Bfho9tqvWHNGoYDOZzfrVJAFa4Bq5Gf77WTLBv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rt1nhHg52nR9aMT8qDARwr2iqkGwucQNq9uqrvEjMQ+aliHj1ENhukeMYJphb7KdiLUrA6l4eNkCSWbkpyT1JuDvvgs6xKIpe4+Sj41z9QcePcHWedS4/a979H3pTQEvlkFVgE9ztk1NeYyJyuQU0TF7JCPuuJe3G7skE6RYAMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iwppwjql; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LxaSeYoI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iwppwjql";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LxaSeYoI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6034mRgZ2324595
	for <linux-clk@vger.kernel.org>; Sat, 3 Jan 2026 04:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oN4MD5eeX0NtpPeAXRkd7NBgj0dt2642kWfawjx6Rj4=; b=IwppwjqlngEHwyGo
	Kll+CXrB1jUbW5bb3Oi9tT464zDfr2kPShf3osgqGKEtn2rrnNsR54VL5lN0gcnL
	u6np+jkouFgr9WtBYbja1geX9bgw56ZWU7c5vuePglY2Z2iCfOY4Iz3GWhagirHw
	0N26Ia2TLgmg4YpsDw8P6iz0pjW9ncOV7TFxTwUGvYUesKghjneuSY8rZ2PMJqMy
	hAhFgW839/lmqoOtFALYbm8fMqGN7+uufw/Cr3AF4ZHgyI61vKJVg+3rNiVPdOqE
	U5G7O8HbeRAfaAqrRTssboU0rYGZ0SVkb57cTYjdH0Fm6W9MSjdu+fHI6C9hxrCa
	w440IQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bevd800b9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 03 Jan 2026 04:57:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34ab8693a2cso36190273a91.0
        for <linux-clk@vger.kernel.org>; Fri, 02 Jan 2026 20:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767416243; x=1768021043; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oN4MD5eeX0NtpPeAXRkd7NBgj0dt2642kWfawjx6Rj4=;
        b=LxaSeYoIUAdhAUhFd55oQRcAzeObsbnXWljDiJHHPYvHotHTaBzA0fSs96WaW7hwNB
         0Hal+RrTwBpWAnV2tUYtIRXy+3zdJxZJaJXnZwAhFqhK0154zGSotFswlCYC3UeRvJC6
         HQ4RiWVnb/6Af4e/QgawhmG+BMW+5W4Qz+eJieEI7H4wVH/jcTW9g5f3XY+toGyuiO6Z
         vPi63bHFXCjXi40LSYFKvTXksTlTnSkY4603GUuWjY2rEmV0fQeuxgCQV+BIFVg0NLck
         1SRKnv7CaHucSZam4Ce68j5iMBmDVApBzRTgPDxsvYYsOI3G9V4315nKKD9PrqI5zGua
         bnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767416243; x=1768021043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oN4MD5eeX0NtpPeAXRkd7NBgj0dt2642kWfawjx6Rj4=;
        b=VsZabpCeTwtsufT+KmpJHYCDYCxbXn9w+mzWlmdM8jGlBtNkaMR3gHdppzEHZzfV7Q
         sGuaLOSs70PZnCDeQNOjhAcsGECG7h4f9bA9qaaOf6MOdPoDYHMQ6LWWil9WtynpxcHa
         lQmZad8zzXVnonYEJLIJg8Q/fK6ISyY3PNqbyQcN2/xtTOMmvmax3V+aklea7kP4UQN0
         93JDiMBRJLSpSc5ZOysf0GEANxnRkt4UUDeyjuyqrHmunUOia3WLIqE/td41/cdwAQqj
         wb/tSsmlyxXOdrDSWkbd6lfyRdXLcrcGyAsJPY47aR6sxJeRguHvy2+BJsOQ5QqaoMQ3
         h7Kw==
X-Forwarded-Encrypted: i=1; AJvYcCX13V0avnVZMvFojeyCIwAUSeXXwP896mkOUuawjZzCo2JUroHnuhhPcecYAwbdvZ5+9/Rf6m9Voyo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyInkJiGA+aNQKf0cxa8cidimOeclbBvfRD7Bv5xbxmvT/G5+5/
	FF4tzXt0mldo/o/4hzApa2WVhQrTa+XJkDlt9sYWIRHP7VR0LBPMWlgU48wg7DHix6ZmtGBhmKl
	A/4VZehFBCHdjI5/PNFAKvOkK8wILrY+627BsmhOaCnXBGsneysqtco0DKlz63B4=
X-Gm-Gg: AY/fxX5hjNq5f06IwKQx0Wy0sV6LNtHaQZ1Zx3K5BgnLIIk03sReW62sY2bGH0U/M4t
	UPOcc56iMhr3TExGwGCdRxFqdPWIpr1J40e9NFWqnfDnVBH4Rx9spX2HhndeTtk9KFyvCE5Tkih
	kMZx1cHBCGmk7sQINPaW9tILLWMUOMe+luTbHSC6mPcMi45mS0X+MSRAD2vDa1Lt+aWwE9WRO9P
	1VeXWWU1btddDmq4BLql0xW0Q8hSTe7034i898TsQDJgnt9j45isnKUyre0+zib753ocMJ2hdGf
	2V1T5h3iGoIfx6053lTQSlGa6YY4ABTid4Qy5AVT7U1JAd3FC632e1My5PpSFD5OT1wsjKOByuX
	E5k/Q1boK7d9rx+47IbUOX1wo7YbSmx8FPjO9Dg==
X-Received: by 2002:a17:90b:2251:b0:340:c179:3657 with SMTP id 98e67ed59e1d1-34e921eaecbmr35681146a91.33.1767416243265;
        Fri, 02 Jan 2026 20:57:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGM8plv5Og80aEyg/gcNA3wNYGBDpmdeoneNRbr8f3cn9OSV3XtH5CjB1pTvqIp0AGH4ec+Q==
X-Received: by 2002:a17:90b:2251:b0:340:c179:3657 with SMTP id 98e67ed59e1d1-34e921eaecbmr35681133a91.33.1767416242787;
        Fri, 02 Jan 2026 20:57:22 -0800 (PST)
Received: from [192.168.0.195] ([49.204.30.122])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f475f16fdsm625678a91.1.2026.01.02.20.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 20:57:22 -0800 (PST)
Message-ID: <c7c4096c-c27a-4704-94db-742db2d7d5c8@oss.qualcomm.com>
Date: Sat, 3 Jan 2026 10:27:14 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom,x1e80100-gcc: Add missing
 UFS mux clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
References: <20251230-ufs_symbol_clk-v1-0-47d46b24c087@oss.qualcomm.com>
 <20251230-ufs_symbol_clk-v1-1-47d46b24c087@oss.qualcomm.com>
 <20260102-helpful-natural-donkey-9b5005@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260102-helpful-natural-donkey-9b5005@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XIIrorFC7DqbUndTEqWbWGdbdfUs0DU4
X-Proofpoint-ORIG-GUID: XIIrorFC7DqbUndTEqWbWGdbdfUs0DU4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAzMDA0MiBTYWx0ZWRfX7/EdJiMH4wgt
 2zKBg4PYGayZiVmZ2Ul7fZ5hZQ9pQnCs3ZUa0ydLbkXUR/kCJtv08YSwj8LRd38Kwq8zYR0npm+
 NdR+pQzXyvPAs9xmjTqZpTXEXEqCUumGoLA7Zv3gxrPMQ7FCqFpRYIlrGTwjEmHJUqzJLrFlBmj
 Gkv7iy121OiX80xqKnOAy/ssh3Btod0IB8hd4QidkDS7L5jV/vwI4Jz7OTUjCeC2AlCWOyEWaXn
 DDoQDYQkbmoxqrsHbE1ZF4KLSEUW8tmKt8MEgaZgOI9fAKC3CjXMr7xZGVxN1gKCFxo//bB4xdJ
 mAW4/lchn/HSS+86CbAR4fS4vOyyBIs3MV6xxKzsoOF8cWv9sTT4HAFZ5yooXgIqN0v8pViwGh8
 JvPi1GFsNezah/jpwbn9bbkaX5FCpHQJkxalcdb2VE0+ZdEe0NXIetM3BhL8WfzQA4MA71tQwRj
 bjsgf4FIQJ+wjW7v2IQ==
X-Authority-Analysis: v=2.4 cv=B9G0EetM c=1 sm=1 tr=0 ts=6958a1b3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=9rRkaxDsGNSyJgmPD8XSTA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=uzcbP_6v65Lnz5JMdmIA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601030042



On 1/2/2026 5:44 PM, Krzysztof Kozlowski wrote:
> On Tue, Dec 30, 2025 at 11:08:34PM +0530, Taniya Das wrote:
>> Some of the UFS symbol rx/tx muxes were not initially described.
>>
>> Add indices for them to allow extending the driver.
> 
> Please drop this. We do not add bindings to allow extending driver, so
> above is not the correct reason to do anything here.
> 

Sure will remove this.

>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 

-- 
Thanks,
Taniya Das

