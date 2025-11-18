Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E059633C52A
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 10:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763460949; cv=none; b=TF837GqL/RCrIhxWnWq+cIrb/eNmVGM0GAPCE9Dl7xN4+5WhZ9jhUgSJFZ+iyrA1fS5mMs4whRJ7hpVZhiC8OhiX9vWu+q2GFQhcF1RN2g7csspKQrLqz0HVf/XaHJKndfpYpOPtjc2KDYDikR5+g/K+DwmFecUjbWQf3wW6Q7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763460949; c=relaxed/simple;
	bh=c923FaPe8OSR9sNjvZZtRMePKz/r/WGb/uwdhb0aNn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j8AZOZbClxF8biHKtBfDhlAhVUJbi8L3NXdCgK7VmUTjf4p4r1HUwjbuDXYfTcLY1StaLQUTux47Fr/09IebCNFY4EEJVorihdyed6gljtC+NtKwbKXltx8E6MFvZaMO/ZHUFLV4lxk6yPZfDNmccK6sKZcuOPq5fjDXazaL/Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjgurkKY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JM35XhEN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjgurkKY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JM35XhEN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI2x8tr375641
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 10:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xdt1fJlBHJiF6sNH22KsZAxFYSV7wS4ZjQvnqORWHpA=; b=UjgurkKY7OjlI1XZ
	JT2QbRrUtHlag4HYupzSDHT5HYNKmHnMBOlz7Fn6AMbNdUvK5o44gy0q1kCpOE1l
	K4xMaYJvhy/ItHv8j5joEjxuswOsSMpMEbG7b9KJBt03/9PbBBDQjI/dCF9ADAlg
	k7WgO6kWTW8/7OwAStX93bPwQMZ5H59tStlqvAVrvLSPFIcjvQyoVqSLroYsSQr/
	Iccca/zSI4jZCk961dX1LUHFZuN0u2IQFgme6A7/WfgNQY/RBfPhkC9LR6bulb28
	YIoFBzgdtEdxx5V36kiRsMSwsiT6MQUQORGChUceDKAXD5HAIC1XD5qLKlBOaKyq
	/pJ30g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag76njrvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 10:15:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297dfae179bso134544795ad.1
        for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 02:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763460942; x=1764065742; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xdt1fJlBHJiF6sNH22KsZAxFYSV7wS4ZjQvnqORWHpA=;
        b=JM35XhENh3ds2+l79NC94AmhOjI3aA6fKPLe834sHQEaRcVDrww8UNWF9cueKO3y+V
         0rsvNVD5Cr0/BXykv8k5L6+PL1+j/sdTaFMeLq3Davil6yAUydpwEFIW/bDqQgrBNslm
         UuNAH79vsXrWiiUKVIk74+foJ50afolaFI6/gneu8I9PJ1C50z5fsc0DmB8lEwWUSbwz
         j1rDUv+EzRHS8Wab5uMlAEqcdtHh8kPcZYKarJ9BT4zppkGRh8KYYOjnFYMFzsKId1ie
         joLZhvocbZMbTjUi0zpUXdHfDTGnldwAbRxHJga5NeE3oApQy5oCZu8hQn7NkV0ts4J2
         LRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460942; x=1764065742;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xdt1fJlBHJiF6sNH22KsZAxFYSV7wS4ZjQvnqORWHpA=;
        b=f8nt5EeFcagxXneRg/z71IwP0yYpdmeQRvZxsSJCjm1eY5YV7h6ydiDVEZuyPVSGOA
         NA/lrnG2f7PMRC55UiDYPv9yKDJOjQNOHVbWDaQR6GkXD12jSnShS92iDDUnEe9er7YC
         SG535+A+mK7aydQ9ZpOvmTD/WRJeDJiqDPIm+PivvoMtzKnbIRnLFR93fNXoyMFU0YKo
         HQbvvzFCEaujHV9mCARiI8mC3Q8Nv207AJ70MvaljRWmodHK+pJESS1rBmCKetwWZJLY
         972z3wUwVBq/4RZidIQrA9F0bRhINx8yTVDqQMBUXxlvu9HfE13BzY+2Znsv/VwEv4dO
         yDnw==
X-Forwarded-Encrypted: i=1; AJvYcCU6cAx6o5YuL17n/F9fMeX0nO559oMvU/xLjsGZW7NF6NUHNBda6cUusXkD01aqev6kIITlD/v5QOw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5uJXRx28I5ePDbq7rXRfQbzvW6xy0+T965fa6Qrkuj4PS4Qay
	fADMeJJtXpWvexYvj+FoUueOzlps5dbm7YUQRHsdJGVxXx3s5CkH7bbkY463ElJWRElSdqGl82E
	jsk69txgKRXLxa0NK6Z/e+R0EtpVRlSgCr0alwrKv2qM5hJMcEv4oI0UDPiyAylk=
X-Gm-Gg: ASbGnct96DSptARcAvmveaNP2uQ8MLhq1MHeOfNQvLakKaDOgGKVEXIP/sA4mfoknEK
	e+tIp361cmO3AOGjcd+50owY2CaavFh5ESjanbzLQ9hltu+mM15vmIvW8L7q8gsRLt1JgDurMVc
	0EISCrI9vBY1IxOIM5dwRm0p03qZJL8Zz2fyQ+5lDzOPwV2Iwc0myNy02UMdGxUA827RSOfL/Q8
	z6nvx2AqP2q7EWrzcywF+2UciJD4CvCMpJDMYgRzkDGjNFY0PVBVs6uVYNOxv7h3LNB2ZuZKJ39
	ZsxC6173clsnReVkefhZAUVEAMSuR1D9bLw8p/C4twVVvFXOt7PkSeFifL6TSdhW5EJONGKST8P
	crepafjH4ZbFUYynuZA32ng2KMA==
X-Received: by 2002:a17:903:3503:b0:295:195:23b6 with SMTP id d9443c01a7336-2986a758e70mr174608575ad.55.1763460941903;
        Tue, 18 Nov 2025 02:15:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTfcp3k2UslNU1yGdZvu5PH3mN8YLFFD8nj0ilfWjunS5RIxeZb7YRknx/hk5woyr2UzNREg==
X-Received: by 2002:a17:903:3503:b0:295:195:23b6 with SMTP id d9443c01a7336-2986a758e70mr174608205ad.55.1763460941430;
        Tue, 18 Nov 2025 02:15:41 -0800 (PST)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345b0384abfsm962647a91.4.2025.11.18.02.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 02:15:41 -0800 (PST)
Message-ID: <0090f38c-b2c5-4f8e-8382-ea6fae29757e@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 15:45:17 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] clk: qcom: ecpricc-qdu100: Add mem_enable_mask to
 the clock memory branch
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
 <20251118-sm8750-videocc-v2-v4-2-049882a70c9f@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20251118-sm8750-videocc-v2-v4-2-049882a70c9f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA4MSBTYWx0ZWRfX/eyhbyyiTtXd
 qc03hk18nYS1dUS1HEwVB1m4+Vk+HsOUMoUcEFWU9f6xB9uhMtAiaGF3rRxA8HduYLss0yQIujH
 J04ot8MqDL7QPC5iGktrr54tvW21RyfBXYmSkCGGLtXp31m9wwwb+qo7d07szhCuC9NeB2vYAKg
 nIIS2lOU2Ny7KtE6rdxRcqf5wgfWibHI8Pp/ZiIdyRW5AYbvYY/M6Lc0mH7NFzLkxyCs824iieG
 zn1IBet0+28/Xdo7nHlYYDDT0Y+7z961iLENT2o2tnshTvSw6Lp/AXQUh35yEm0dE+pIPciSLW9
 jwEAwE7LNtU9zlF7MArGamzwWRp/arz7c5AUm2EztOX1QKOcW/Wy98hmb+ZEb/7KcNnZ530FWjB
 zfxBf6/uA+Eeu/gR1lX3uS0YMorIhw==
X-Proofpoint-GUID: cjNfiVkEuQnTEw3gvSb7pPoKtI_RnqOp
X-Proofpoint-ORIG-GUID: cjNfiVkEuQnTEw3gvSb7pPoKtI_RnqOp
X-Authority-Analysis: v=2.4 cv=a4I9NESF c=1 sm=1 tr=0 ts=691c474e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=dIrJftJwEK3lONcwLLMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180081



On 11/18/2025 12:47 PM, Taniya Das wrote:
> The ECPRI clock controller’s mem_ops clocks used the mem_enable_ack_mask
> directly for both setting and polling.
> Add the newly introduced 'mem_enable_mask' to the memory control branch
> clocks of ECPRI clock controller to align to the new mem_ops handling.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/ecpricc-qdu1000.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 

Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
