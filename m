Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E620B222574
	for <linux-clk@vger.kernel.org>; Thu,  5 Dec 2024 17:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733419650; cv=none; b=O/6+3473aayDoIe9WyAaubZuBtWHQoNVypXAZnjDQu5a3VlDi7XtbJyjMZXMatdED7jtjzWgqGhATa/PKzOwMn+QPIPh0+H81SaIwR1Q/Oi8RnLoFUWsau29/maLnYzXzI6TEk6VqsCB3IudpR1pLNmR+tuz0/J2DsXDNSu3UUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733419650; c=relaxed/simple;
	bh=fF2LhtfF45ILB8O3xln5CQMo1Ph6TXBGzfylj3dTqI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R8GLZKPxxxEPMJleInFdnFY1senmREGmUXGAcZTp+v1EK7KALYpOoUpd22K3l0L3H9dvtK4RoAStPMUYNOh6lff6EmnQuTArd2NisOwdjQKs7ciB69PxwT75yo2IhB0+QLWqkRBoDPNojfws67JD2n1aGs/Wm4R0UCh0yHIdNxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c6HWnIL8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c6HWnIL8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5EWlAC016480
	for <linux-clk@vger.kernel.org>; Thu, 5 Dec 2024 17:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fj1DwXHWgW6cIws9PIYZhpFQWc7IBvxR8/G4nwNPL70=; b=c6HWnIL8lwL49g5q
	MuxA763cZ+2VCknfeNDQKVHyOQ3+P2VaVoOaQnMh8BWFIOpBRwYs1uAjHtLYpYig
	gHOfFOHnC9mCkB2jccPXAkYxFKH7K3tT4m+ZyWRLMScLJ8B6OzckmgoqPAxsnFz4
	67mxhCMUH7J9kVgtPeKwRP2ZfDjgPokd8uW1LqgkxGmfuD4C6q4riq8jfdtYufYR
	A7Sj5t43/pu8M8Imu2W2j6O4yn5t1XL23+UN2TCgNr+MUojHX52dBPL3rgfnS0Bs
	QywoxgsJdHLPW2SvpOpy1DIMWAa/QD6NbsqlhSKEwzDHzEEtclaFZKWXogyRH2vM
	bu8UMA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43be170h0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 05 Dec 2024 17:27:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-466a20c8e57so1598261cf.0
        for <linux-clk@vger.kernel.org>; Thu, 05 Dec 2024 09:27:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733419647; x=1734024447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fj1DwXHWgW6cIws9PIYZhpFQWc7IBvxR8/G4nwNPL70=;
        b=ix3K7fXj6aVUup2lYNju+e3P3331DdrJx1XhXvP8awiRJAPLYSPHRd1bpHNjKhI9fY
         xM7l1vwSk//N1EVCDydfsTKEK/oiQaYUpMCTBIghKceFTgI99HCGl2G6QYcz1IhFzCLO
         Eoi3o6ewpmuMUXo+4+Y1cWB4uV+7g/upU8i7Al6H3LXP1sxF4NGoqcsl+F/wqxvwQD7h
         Wa/qqX14ZY2R59Ghdi72HG5BdrpudDIVBa3sWWHBN7K2orv1dYnIL65sIO/Cd4kf97/R
         RHRYe6FhKECfurKU+Yx5Mm3r6zHqzpR4udH+Q+MBRFKXbht/JSYMTL8fkxtuOe4+VT8m
         gh7A==
X-Forwarded-Encrypted: i=1; AJvYcCUPNR1LfvctrVE3+DI5G8azkHGsC92puIwzU/m+K+PHrv3mIsiJOALlN8N/8up9YbZwygAcWMT+Ujw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBms+miJcJBiFxvRdTJBR4Iu9tHzU1rN207rvKF12FLGWl13mx
	1pxG+H44dtQQGsz1YUiyT/iiLibe3eRF3Qw5lchwEvExDMilNqL4yTDhAVKdkkdc4O7klOqER/C
	2j6WKhzKWs3xvC8LW4O3qElBSzQG5m2KWYLumd6kOl3MEm0Il344/cpmLy9c=
X-Gm-Gg: ASbGncuhXgvuOhVc4o+J26ZQOml4Tfpgl/VFM2WO3LD9jhZPDvrQ2UdaX6Wl69AcCUG
	5+PWdSlINlE8028atO2rNRjfDja6prK74nRs01hpn39p4IgfsupsR/gXkZJ+vEU9N1G4RHmfRyh
	UA8x7WdvTBzWDxPp3qI8sH6NgGg6V/sEan5VWqRXvg5LUsrfh48r8PRUcX4gH5rL5LyargTv/r+
	DcMRzdOqOEqqZDaOKJcRUYn8mmVnSQoBTWrsDE9Bocqso1vnAinLxETzOb5ICYnNJ3OZYS2L338
	8q4CKuQvgoXWgFidAlTaI6AaBPhtvHE=
X-Received: by 2002:a05:622a:cf:b0:461:4467:14bb with SMTP id d75a77b69052e-46734ca2a7fmr95021cf.2.1733419646864;
        Thu, 05 Dec 2024 09:27:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9jw9d6QQQ742d1X4H1GTd0gJ/jXukZyEhfsj2yNb2yqqSlyALEbJIukWb/H2Gua4FXrmiPw==
X-Received: by 2002:a05:622a:cf:b0:461:4467:14bb with SMTP id d75a77b69052e-46734ca2a7fmr94721cf.2.1733419646416;
        Thu, 05 Dec 2024 09:27:26 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14b608faesm1042160a12.44.2024.12.05.09.27.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 09:27:24 -0800 (PST)
Message-ID: <3f1a960f-062e-4c29-ae7d-126192f35a8b@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 18:27:21 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-4-54075d75f654@linaro.org>
 <02dd5593-38ba-4344-aa64-0913eca45808@oss.qualcomm.com>
 <2chygbm3yjozhkhps64oae5gwirdk5b3orsybss7jgutu5g7ke@4jskpnermxfm>
 <90fc1097-d353-4b6a-bcbf-81f8a8e24390@nexus-software.ie>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <90fc1097-d353-4b6a-bcbf-81f8a8e24390@nexus-software.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BHobn1EyWmjaEhIqoV3dU162QcCekwN5
X-Proofpoint-ORIG-GUID: BHobn1EyWmjaEhIqoV3dU162QcCekwN5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=905 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050128

On 2.12.2024 4:30 PM, Bryan O'Donoghue wrote:
> On 02/12/2024 15:02, Dmitry Baryshkov wrote:
>>>> +            clocks = <&gcc GCC_CAMERA_AHB_CLK>,
>>> This clock is not registered with the CCF
>> Isn't that be going to be handled by the CCF on its own (like orphans,
>> etc)?
> 
> For refence this is always-on ATM.
> 
> drivers/clk/qcom/gcc-x1e80100.c:    qcom_branch_set_clk_en(regmap, 0x26004); /* GCC_CAMERA_AHB_CLK */

Okay let's keep it asis and call this a Linux impl detail

Konrad
