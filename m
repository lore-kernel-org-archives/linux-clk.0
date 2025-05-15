Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFED333DF
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323705; cv=none; b=fHPv511rYbDliDvB3lcBkBhdjBZ3rPfzz46f7h4fI4Qfd0eHYqw0BmDSnQssd0r1TdpQcudUA+PebI9Cj/w68cXQdv/PBivLZwP7iQIGnslviphvifdYnKGxZAgSElKXFXefHzfxBtJ0KW3Y621RvBj8ZuqzKxgljleoyyu6PRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323705; c=relaxed/simple;
	bh=7ywYiiKNLO9A8nztS2XTnBGliTV98wcv1CVo9aAO7eA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UjntVWJifQGFOaj4kUZLWjW0LwKhqHg4rVbcezWqe8eHLCmchUEDml1hIcKH/ebrHACH/xCQAls/ZkwUjMJqwc5fLW/pfqyhlhMY7vOwglNHC47vhdCOexlS7NVbpY7xvPQMW1vMEg96ztyCRHEDDptzW3iaDj2JaMRQAEwPN00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WWYwKoDu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WWYwKoDu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFCTh014760
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5/0ojRnSWXvRmL/NeRTFyIUoU4Q+EzsHrqsYsCOLaMc=; b=WWYwKoDuM723eE8r
	LElS6tFxfrFg9Mew4iYi4haIng1XDIaRkspLqfu1IXDkZdOveJyJNoI2OEK+Mj19
	uqRpJ6+mhCgQwqU5ngvMESTCDHq+0Z5D1Ldeg0JAohFtmW/fPuJwrvrjF33vzCQj
	OsEY90lgwMTefvNv/tDQP9P9htinKTnZsvcnKA8CF60yGMCPVf3hKdssbQ9DsXaW
	LL3ZN1DytBp60rRCjQp1uEHd55PFFSg7MQPQIZtre/JPDOKoeYpNKO53jDmGYsqj
	WTb6wM9oX6SrkKiFqqXLr657ZzB87hbPReDatFpKFexYEtkzfA1ThhwYfgnxOG2M
	vW0nYw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpesrx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:41:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f2c8929757so3159766d6.3
        for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 08:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323701; x=1747928501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5/0ojRnSWXvRmL/NeRTFyIUoU4Q+EzsHrqsYsCOLaMc=;
        b=WQbx108ZvVzs4NAJZJj59Wy4eY0hsAq25QqOwS8dnnY6nECnAtIhe1/Sp7SFXol1PQ
         Am77eR27W372gc0FjAXRmZ37UgdzZn1GkDocwdGeCfYrVDbnxet8HxHJbBrLAAtP9p+1
         CD6OOaQyvx+QOXkTGDS515bp5XV7ehVQwyfXPigaKfHsirh++u1N/Cul3XzM9ZUK3Hzv
         efoeF3OfekEDU/T8+lMv0gDK44PNf0f3Nrxn/blASqlOE+3sJ4y9UQTr8Yp8RyCzrvY8
         tBi+EQEB+FLuBCr5yww3NtwAZiZQKDCqlIex92Pe59N6lt+XEEz7+Y+KL1rcWfzGlkpW
         3zRA==
X-Forwarded-Encrypted: i=1; AJvYcCXVrmLhyz76UkkYyglypbB4J6D1q6WVa0wZFyekKWx0FJBFsQ1WE0EwXEA3MmCeMdqgZi9kBLkP0vk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGlrtoOF5mXMn15bKsIkVk0K29MYlLAIjUphmLd75BeZWIa3Bm
	QCy6mFgUswMPhSX3U5gKA0PcEokpyVM1iCeinsYmcr4qi/edzcUt/xwi8ND/jZenD7vTHUFdkKN
	RIMCzTNE1GMnoCuNbWIBS1H0objv211sdX+i71g9LQfLsuHcEuvN26TS8ym+x+pI=
X-Gm-Gg: ASbGncvZvjizAP62zbYMQJNgpOJhWxTSF26KFVnmphrP/WYSKD48C9bEb72Lh1DUcqh
	JzTQyMdnkLnPuOp5Ea0DE9326jhyWEMfBE1tvXZigyuu6VQllVLNp7V1QFc4yUJsa3MCj9ggecz
	mVvxSDRVOZHzcRAMzpDBnJlBoyyDGsR4A3sX4zU0E2mEmRjmcho+PNQkoEcEB2aGuqbZgDW7Lwg
	zZlVAlJ/zV3NH1ku1h+zcc0el/+H5EHd0t6kEJ4Td4P5eiEF98b8XmBwVE9mfIiuLSm/uuNUKUn
	Rhg/j4xl+v4SfUQUkYGun1gJce+w3mGrY0lCyh/2k0533hWtey92M/T+tAqOvDX03A==
X-Received: by 2002:ad4:5aa3:0:b0:6f8:a978:d32 with SMTP id 6a1803df08f44-6f8b08811b3mr1101216d6.5.1747323701179;
        Thu, 15 May 2025 08:41:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3C7W2ioUB8m6KAq++Aglw4cWZcPp6NjrXNXBkMScIXWVKR+28o/8L6hATFVney/nMPPQLlw==
X-Received: by 2002:ad4:5aa3:0:b0:6f8:a978:d32 with SMTP id 6a1803df08f44-6f8b08811b3mr1100906d6.5.1747323700776;
        Thu, 15 May 2025 08:41:40 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d502ec0sm15772a12.31.2025.05.15.08.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:41:40 -0700 (PDT)
Message-ID: <12bdd004-c2f5-4246-b103-f94d239e9f91@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:41:38 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/18] clk: qcom: camcc-sm8650: Move PLL & clk
 configuration to really probe
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-11-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-11-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nXpwJO5RM1t-l-8Jvfi0UW4jWfklA6zV
X-Proofpoint-ORIG-GUID: nXpwJO5RM1t-l-8Jvfi0UW4jWfklA6zV
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=68260b36 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=R-MJ-YjwOO2PQHfhffwA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NiBTYWx0ZWRfX+a4K7fYsZPUU
 sp7+1Dz6bpyVLfPXb8IQXvNh022wFyEUm5yJ5Hb2SHjpo3CIKYTuZI+N3Cpmq2Gm1Y+23O01j1x
 nYDhZKMPDtsIl3qEPDjOEjlxDY/mGjWLUuLY1Wdjvlk/kEqIQk1ezwNl/xS9ZhksvbijvwnyVkZ
 rQzLfOxJ95Wpd3wB2DKEzRPTNOT3QQ9cHvjbQiEkLQnGuckf85xKlWPgEP3FimqdBrjwiBWp94Y
 kVgmp+L26fXoeqoH43Sn4jirWCbkPGIt2f91M1JubVIA9vuTD0Dp4qWFp4fleroqsp8CsXYyMoy
 JdII1MV+UuMyclY8YPgtUI50gYgxzwBd77WpF2U2EU4/7kcJ+dpMHGCM6CvTXdu9YheG5hWoaPz
 fmyqpDq0X8DkgRaLak2PfBclB3RGf1R5BQALR/wZEsyLT81vTRFfqoBfdwIO1pXgKrKUQdiP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150156

On 5/14/25 9:08 PM, Jagadeesh Kona wrote:
> Camera PLLs on SM8650 require both MMCX and MXC rails to be kept ON
> to configure the PLLs properly. Hence move runtime power management,
> PLL configuration and enabling critical clocks to qcom_cc_really_probe()
> which ensures all required power domains are in enabled state before
> configuring the PLLs or enabling the clocks.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
