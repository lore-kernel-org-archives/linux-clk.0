Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD102D8DB5
	for <linux-clk@vger.kernel.org>; Mon,  4 May 2026 08:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881721; cv=none; b=aiqiLfVgsXvvEbmyeIJep3VCzmw8LgubQNpbyO/AdnAKsf9thJxKI347FsVMiIc3VfF9zUEtxmurvBrKqoh5oewCTj6K0R1NCyjI9rt7tOAMvAmbwUmqkakm/IdmK/wUv9WnYndBvCQ8uCuZcasOQvvQFegeeXq+RdpM0dKPAdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881721; c=relaxed/simple;
	bh=SHvxN1FAQ67hKKAgXjoPnPc0lbu1oNAtVHKEqJqvHao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aQrnPDJmuN/KbbldrIUH8TanJoUZ7eV0XRVprTo93vaj890b+/7fiIpZpuq4pLxzoN270b97dbRpt0ZPKL3jOXYZZ5Tmn8sqEkoIgwWpCNTq0RYJOzuW2UwAn1mBj8sVOfCdR3KNQxoFDHntMorEEV6z8ITQRJDjUHlCTsdUmQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bmBwkzUK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cdbyq207; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bmBwkzUK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cdbyq207"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446D8Hw3470331
	for <linux-clk@vger.kernel.org>; Mon, 4 May 2026 08:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KEtWraP6YaM2azxEPO5mvuryly/qQzGWm+7OWC4MCv4=; b=bmBwkzUKjTgPASNK
	ARMiNNDaQOvNIDuniIYZzQB9jnNrxyqWEDiSkUwNYhX4+WY5VNowDqyww9Kl6+Hz
	uCkiXFLFki//7MAkSUOGMkQG4/xGN0RwTA2wxLcKSMxQKsi6lJY69h8zhgfmId3l
	Q8VLald/4r/2j/e3rLyhg+QoRbm3RIWVnID9oIPsMYqzaOv8kzb7Y1Q5HitWGE7m
	cXDjE1FzpKtQVlHFp9gksK3cWca3y7kyNVtbWX2+hQ/vexUumd0SXB0ckZCBmLJe
	TxL6YuWrDBfSKf6ffahQCU1Z8l7RFOntovkCQ1pxY89A9jIouBMrFoJonrFCNgxF
	pton5g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9bvmsxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 04 May 2026 08:01:58 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95d01ff3eecso25327241.0
        for <linux-clk@vger.kernel.org>; Mon, 04 May 2026 01:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777881718; x=1778486518; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KEtWraP6YaM2azxEPO5mvuryly/qQzGWm+7OWC4MCv4=;
        b=Cdbyq207kj3su53YrYGmDCnMmPpEOiIAxxHwHnFBDDF24uvYZLQR6i4JAXxyvjPE6l
         r8uDTnDiIk4SE/uE1j0BdyVKdIXL76kCrPRMWyAqXUs4TyC+fZ34IEInLA00OlflwuLL
         oNQShkdMB/QedlzQoDJDBYket3BzICASSRjiN86WSAvS69LOlB/r0j1ljCkPUmIAWZua
         s0hF0U6/cMGouF6Zuu0SbkPwJuob2n4WYqI9Nf5Z0CQqJw9AxEf+oJ6BL/QB3d5RK/MC
         LIMrJXCt3LbHfenlxWurg6+SUZs6XU2ESahCWpB+ko9kE/PQxHNwpCr3MvOKxKw2S6rU
         WnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777881718; x=1778486518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KEtWraP6YaM2azxEPO5mvuryly/qQzGWm+7OWC4MCv4=;
        b=srhLGdHlTfFLMr77c9waBfdhNVD2qw7hZkBWnbeM4fdTTHazVwdf+uxoVRQAUUez8o
         bvLPeIrmLeoTYxMYOkdXkB8Xz2QzpHqlMch+fyjxIztj04hGrt0fFIT4vSQEYO6OhRG3
         29ugjYqZXhz19pFuub+nzg8VIBQ3GBf4ZGQxLHNQoVULiG2u9LAVXNhj4tLZGCAl5Ife
         FIsnh7SO3Sgw1jUaSpBhbhiX3tZylPXoTX7GKmdH0/3Ybr6G4Wv4WBuno7oAfh1ALL6h
         vCaLE39Lx/6MQw/puw4q+b8HPFEwkzi0pmd8BIbeGfPywPHdELYE3SK+YmkH95WHpw6r
         OV+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/9dGIk8uBY+Gnhf2kXJmpLakQHUHrux1Ml/X0dQNdCBWjJZzEaqkmZV360dc4yPSJlrhNn7x+JW+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD74EdC1AX0dJf/t4UBFMWqLdrZlOGEqRNM1wQHtW795iPBkih
	ArMSK3oiQj7lj2114U5Tlo37QprxaXcT3NnfOH2t0Z4hIgzmuReXbWIttOJmZbmfeXfauuEgeYb
	7ALDsMmAyJEJ6rRq8eV8K2dCyVrFGmtgYtrPrlBfeH6KuTkkMuNnAfInPUY2mCnE=
X-Gm-Gg: AeBDieuxWQ5EVOZy+ZBbAw5Gkikso5dPB/XSkvg4UHEvrApDJlXOSlykjMWkm4/Ap3v
	mrZVxaNIj6bZ4S2i/WXPYrdfXlfkJX8xdcCZeh7dmy358Oz8qYDusWqu854QvVlUSvOZft2HioH
	5xtDD46GaxLVyiBN1Pms1W1LvLf0yTpYIOCOxbiiXbeV/I63WmBvS6xBbKUt2JU4hNlUGuSlQGI
	QhbLs/ju711JloVHR9UfOT52C3ldqqhCCDaIXUTUZ1NmcuYw36MRNbEeq2g+la3ubcR3OIa/NlK
	Ss99kRvzyH7QuphDlZ7pcAHkLfAXTClx1MqgTMnsuBQvtrHxhyDnuXqsnHip8T1jrsW9KItz31Q
	nRAWJg4gtrYDk3895gFRkICf6G+Mmuavit1mFJ4Bd2u5u3P5iW/6t1lk8glocssqx0Daxrm7Gw5
	dJmYFKmDn1WDQOSA==
X-Received: by 2002:ac5:cdb6:0:b0:575:24c1:f668 with SMTP id 71dfb90a1353d-57524c21934mr476251e0c.1.1777881718195;
        Mon, 04 May 2026 01:01:58 -0700 (PDT)
X-Received: by 2002:ac5:cdb6:0:b0:575:24c1:f668 with SMTP id 71dfb90a1353d-57524c21934mr476226e0c.1.1777881717760;
        Mon, 04 May 2026 01:01:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6d06e417sm367209666b.33.2026.05.04.01.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 01:01:56 -0700 (PDT)
Message-ID: <670bc922-0a50-4f60-8be1-9fadf757b76f@oss.qualcomm.com>
Date: Mon, 4 May 2026 10:01:53 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: milos: Add interconnects to
 camcc
To: Luca Weiss <luca.weiss@fairphone.com>, Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
 <20260501-milos-camcc-icc-v2-5-bb83c1256cc3@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260501-milos-camcc-icc-v2-5-bb83c1256cc3@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RluXSMRl0pIp9OV-3vl_KKRMn449SxUv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4NiBTYWx0ZWRfX8ZG+gb5PMdWP
 h7nGDo+4rdnTwWpNh5ho0Wy0erRm8kdokCDQBzfh8Aa+Evm8Ls3hzYDIAQayuXFHD5u2lj/f4Gq
 Rk0q29+shgDNWZdTPkTdhWqFcrNkY8rLO5mpNWimc75+HOjHt+tQ1A42UgOIa0niaK8KepDU62X
 osMUSkhsi2ldKzClbM14S0dR+XzZq7iLSe3Df20iLP/mKfffiFINCOFSeYSI1PqXuayPPO9JUfI
 KX286v4XTzbioYevFrwKAeKMMtAfhzACjTITBHJZDQ7kJLryQYEF5wwNA4I+BSd6k84Mhoyur4I
 uGdkotB6XamWBPZl0X4347t/RUkCWS2qkWkIhM6O5by8NaL6kI3Lk6cv1IAyrOg7M+3VMSeKu79
 UUOZvMWylKSRLR2xULGd4WXh/y+yVgQ6uPyYF//pUu/tIkk7DIK6ir3EN2eZSv1inaLXzBdArvf
 OT2IdOrGfeZ24P6FjQw==
X-Authority-Analysis: v=2.4 cv=dqLrzVg4 c=1 sm=1 tr=0 ts=69f85276 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=jeBussX95TUAqHeP4CEA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: RluXSMRl0pIp9OV-3vl_KKRMn449SxUv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040086

On 5/1/26 11:18 AM, Luca Weiss wrote:
> The CAMSS_TOP_GDSC inside camcc requires an interconnect path to be
> enabled, otherwise the GDSC will be stuck on 'off' and can't be enabled.
> 
> Add the interconnect path so that this requirement can be satisfied by
> the kernel.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
