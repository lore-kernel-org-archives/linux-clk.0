Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF163ECBEA
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948510; cv=none; b=G14yETJHUmyBXiiZpFbObfBn7Sf8F92M7R/7LyzBxWNgZCZIclYKZXyQpFR2mdGy3ggiBmDSWRnCMXlEVucgVKPfvDW/ahga4CQKipA7Ocdp44RF/art7yuYoqc9Ufb2E7b7jg+N9LEDV5VLNmohd47mLObupXtCXfGwH4ZpEnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948510; c=relaxed/simple;
	bh=7I8pgnyQRdO0BWjCySzAKVzNEcTZwP41eAknZ2uNTnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ICvtgXUV+vDIZ6bQe+fXEhKdHJUCa1t9lw+0cPmBdx8R036PW3mwUfwBNmAn7TRtqTB1xYVrVeRhv5QnrSmhnOMWOgcVHfssg6tkkyOXBjimSpkcPR8/IuM1q7IlCQEHqDd167oeeisxu2OepHjTVbT8ZSqDQLUznlyKnbwOp5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MpvhDN8s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ilUoY+yH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MpvhDN8s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ilUoY+yH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V80XVr430888
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GbwdIaXcDCZ8n+FwqzQDt59cvTDUlTONjPmNtjHi+kE=; b=MpvhDN8swqnPX4ql
	teCten82I5A52Ha7ymmO92XlUNrgPq45Udi2qc9Rl8ONGXgbEcpDq2HMr0QCex8/
	Lgcrus8BhmK+hHIjlENGD/H6RjR/6wP53HzF9hDZBlOmu27eIvjee9yMGwhGYw0H
	q/L/pAKlOI7dseEO6KNVwHiZaqqsVFXpYO6fTCZdtCw2bSsT4ZwqWOJjVD8w3eEu
	G8JAIRjYGsKQRxOBdYZrQ7ETI/d6tTHW99akpMrqTDF0lc8AIETMAXXPK9PoqVk4
	NRvEwD+mauFKpK3zQ9BodmG2/o/fPyDVvC1phGKsnsvh9I/E3KFjl+Sun0XJONKg
	WhyhFw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d84bfhnbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:15:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50943e69b08so19741031cf.2
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 02:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948508; x=1775553308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GbwdIaXcDCZ8n+FwqzQDt59cvTDUlTONjPmNtjHi+kE=;
        b=ilUoY+yH0qx/7V0ipBMOb1RFrRTu6FfnhM7nUQ4lxgJLFNHgAA1z5iOnoBRwBXeC2w
         W52kRNQXVHHmYQVF52KGmPgQ4wM/0A+Clq3raJ6ILejg3SLQRdS2cbgBE6TZNDxaD3iz
         nhGLWnRsBobx/1jBOlKbF8de3Ry+bM53xYgoRPz6DcpCYhKRhSiyHMT1vUOp1bJdilSI
         PXRNC2JWoBTJb2aoqplJCcj49G2onBzAxZkW0LH60nEiLtzL/sbM98iVPa50V71otW76
         3L6blV6BJgEKDi+oJ7/ZT078BvyfxlOb5naverRfCiJe5gAxrwkoW8/ZGt6WvdRECD3K
         eEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948508; x=1775553308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GbwdIaXcDCZ8n+FwqzQDt59cvTDUlTONjPmNtjHi+kE=;
        b=HSYEXQVVzjFzfoXNm9Qh0e2qu1pWWufTo9idT8a/cC/DASzUHfKBPLCu8cs310eMPd
         mOFM7HmbuWao/DJT3hIfc3MKlgcqzj7YoVJVGYs/i9U6LKikX2ke09rpkU/Z55x3Eksg
         Esx6uY8rE0tov/gcisVWNTiLZTaMMTVNdAv6Pb3Qkq+YCRhNkEyl9zSx3nRKHCinTJYK
         Pl0H2GyG3Oxc4Y/0+MojI8xfG4N/uqo5lksmMNXdZi+/XScXWAtbDmlBH6YZZs5srfNf
         aJxC3ZWi+mRiF3YMD/Tglxd8INXS5IktrxRr4AZd9gWlBqrdDRAr2Mlo1ZY0SuwtAqHD
         bimA==
X-Forwarded-Encrypted: i=1; AJvYcCUo/eJWpuLWcyeMhXbwe9Xk5fDnhIwRvpbwEoTeN7pYcVl7mfKqkmVOxBZ2SDsDvzuVpRPWzxC2kIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxggssPphhqr1CywTyFjpG7nJYTqspGt5+HrEni11fNbhsmv5D
	VIm0hgMZnUihZLatcpw47Xe1VkCmYOIpBuzUD1V5w33i05j0YPboAkJMxwRbcA6SzJxsAyp9NxG
	yRBP/BVr53QA7D5YunGHg+5esELgjmp2HOrTnIe1FgofLwIq044wXIMdGbOKKEY4=
X-Gm-Gg: ATEYQzy5aswbvmcSsd+afShdnBYCvtWj9zgt5rueM4y/NZK4duvlbYZtoGX8EUDkjUO
	HGpt8Z3ihLeYNhlvq1FlYLaAGPpIwD/zTp58Pu6p66L1I1DUcYkvjx20w9Jv3BLGzn/vKj89R5V
	xg2BEdImPshD+HxnwjkZ1SoAbu0rrOArk48ZHxC1gVoHizuFDoTOohhLs0UX4fxI+0x8dSIDwKq
	HwykjnQwHBosrnPq0WOc5bc6Y3l+lA6IA8INnjVecN90Z37ZD69MpI7kCVtpjwfkCr5Ym/h9cZ9
	ni0diF1qcz2JW+j50T779HfEOeLIFUX1tKM3B1I1Rlv6k+7/CjBiQzhzGxAKTcier2EqbHV/FpL
	p0x8mIUveYBZiDaK6mQsGJWj0cMn6t0cht7YfNioc9Wu2JzxW/8cUtZS+ncOLPvLfanrPrtxPh8
	DrzNQ=
X-Received: by 2002:ac8:5a11:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50ba382505bmr165089431cf.1.1774948507933;
        Tue, 31 Mar 2026 02:15:07 -0700 (PDT)
X-Received: by 2002:ac8:5a11:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50ba382505bmr165088881cf.1.1774948507432;
        Tue, 31 Mar 2026 02:15:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b225d4bsm381743966b.60.2026.03.31.02.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:15:06 -0700 (PDT)
Message-ID: <690b0263-3379-4776-b073-18abdbf94489@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 11:15:04 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
 <20260331-purwa-videocc-camcc-v3-6-6daca180a4b1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-purwa-videocc-camcc-v3-6-6daca180a4b1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=69cb909c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=w3l1uDNNw06S2l6T0SEA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NiBTYWx0ZWRfXyTAzyCJFGh8s
 ybLIOFO8YVsgbLBLJMqDP7PGUl6gTi6OfyhSEBuwgwDTdUcgD2J4ZjuZMmvNElEQ7s/0eE2l0Lk
 kguLyrnhAq5wN50wvMBqNaAtKi+NXUySE4jG3KqPzv1Yw4eEKufEd/ahOfUUuuR3nc/2IlL1LaZ
 zZn1qNQmyqaJ1i5yls9kZPOCcjECEp5DSVGQJiJ+IywIK9aqpy7zsObQbxU4I+VZ48l1HeyQlCt
 G0Lhe5QwUvih/VXrCR5Lhv2CBr9WN57rcp3xlidoxNK20Amzl+sktNUUro6OCMHqn3bNq1pUNfX
 e6s8iy9j1TUVkszzRxDsOwSmkJNTAVVKnZPS9hkw5kepKrglPxwMJYehMChtVpBTOUT3KtC5QRE
 RRyzOGHb0pj5Ysrb0Q62JjtymMtZq9jvinyicXuBqLq1rt1srbZntkm2wn6ZZBLHt8uVecYkvYy
 EFoj3rSoTPhVti69G3g==
X-Proofpoint-GUID: OYzwcCZA6oJWQ03CzGDSizJ6pWxzvPZp
X-Proofpoint-ORIG-GUID: OYzwcCZA6oJWQ03CzGDSizJ6pWxzvPZp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310086

On 3/31/26 7:24 AM, Jagadeesh Kona wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
> of previous CAMCC blocks with the exception of having two required
> power-domains not just one. And update the compatible for camcc and
> videocc nodes on Purwa to match with their respective Purwa (X1P42100)
> specific drivers.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Can I please get a definitive yes/no on this?

https://lore.kernel.org/linux-arm-msm/382725b5-1e72-44b2-b9ae-38aea1f7a976@oss.qualcomm.com/

Konrad
