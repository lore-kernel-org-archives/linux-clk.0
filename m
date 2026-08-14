Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E7742125C
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693556; cv=none; b=CeReSFmkD0Xa2TKMmtEFDwGoyneMSwI2xogdOPUN8Gda1ovWqiNke/dB+VdZT72bxHj+QsV4onFXKcw782bthSaTDP7hPjo1sC2sdJRdQj5h/JbyqTwClD6KoC9UYPX67UTl5GNSZSv4MsDFF2Nd8535uE0SGM6+0HvmYAjTSlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693556; c=relaxed/simple;
	bh=odhvjEz0uGc5n8RkpwlKDWDtDSKuyDnnEDBwtJ8W3tI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TkPU9rTFFcnn8iS1sLBzh/ZE8YpZksJ26tuF4ePfpnJirsgROjeW1rkHMWfSfzo73xdftGAXlCBxNcUzv3uVhomW2fo2vorOQQmqD7Aw8r+qZOzqCD9x2Adspz+wCuro87p+/AT0caKS4Swpnmdka9UvsxozdAw0jWlZ2X0RvLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RInTndO5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MrrPanvn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RInTndO5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MrrPanvn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E7fO8D1079093
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7kZ2avGnMlg8Z6PBbfqxwFl8yWl21AGMezmqeMHyqZM=; b=RInTndO5652zutsi
	uL6WzNzZ57vg6GtW6Jv1ldEVYC0s1++YbS3JcVb/isfmlwL2wDwoYrTqI8exRUre
	ndB3EIH2wRm8i/SLNERLdHUONKioi0HEThYcZQue8Vtd81P1ITp9sgnRu7NFP6Ga
	jJMHdvVJrf/ZLVzil0LBw4Nveu81RBikaoC4F2mLrO+5mvnISHXicU4fye2VeADp
	r9qRiQMHBb5vGWn9XbiJQ5Rwowtd509/2QvOUoNVzgaKx4OCBHj0DmPzcKFAK55s
	1D2GtW3zhoGkYqvLF5YHWdsFZANMWpikDwlUUK8IQDEIea91s2nsH+ZFb9PM8qL1
	N7kf3w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1xexg3nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:45:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so1061435a91.1
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 00:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786693545; x=1787298345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7kZ2avGnMlg8Z6PBbfqxwFl8yWl21AGMezmqeMHyqZM=;
        b=MrrPanvnTzUxjdX1Tnj0c1eNh0P1YlAWElKzUTs91vpaMIiC8K3reMTqQhousWRKPo
         he5PPMn+Fi8t4VfJO5FgTxL30wcYCGS7h5k87oimET9dkpzWtKQCvl4bIro2IonB/kg1
         eR8hLnCNqXBTw+apkHSuerl6jvZjo9MOQfX5tJ5EH2Cq+cYuZNRoyZ4zIL9LXD3NqF5D
         4473P/uaAlxosAF1DPapdH0F+eN8E9h2qbhMJN2Db2PDhPvsW6TOE4LiET9OB4p17mHx
         FrP5bW/H1IZeguGBjLo/CHtEcregPTLpo038Y5QLSKfZ+FZ3Y6TVE5BVxXu1vFe62prk
         ktwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693545; x=1787298345;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7kZ2avGnMlg8Z6PBbfqxwFl8yWl21AGMezmqeMHyqZM=;
        b=JSI2Ecv68eMfr4uz+NMICCUvBkrrmiIioN7eHivaCDaAHyMyYJk2iNxce/YGoNu1E4
         F5G3YZzZgUdIt+U8Xi4mm6KgnUAGoTc3Lp0ZMQLo0o28MeVU57YxJ4rAce3tJ7QdFvTO
         XrR1sNkCmqpNsdRtO5mEAcOThMYsQROrRDijHqfEk0c5BxCeYQIuuFxi/oppGRsiJl6q
         /79WjMoDBpBSPvA+oQoI6EA878yah/u2YEMPAuDEpGy15xo4XZnPTkP3+FUsoHewnWkA
         nghmb4TX9EKSGnkqKTh0yX8EqXLa5c8s00KVmCDniaKtrqbVDT6Pw7YSztgSxRLDGk2L
         DGnw==
X-Forwarded-Encrypted: i=1; AHgh+RruDJrQSTPE87l8i1bxqJsEsvuynnR0r7sNttxqKKnuHTJueH8Me9IvOyY7fPEYHFiywo8cfLOUJRk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyQDLMfKoCR7P1t2OwUXoCDFEFE/b5P80uwGDcQy951+/ZTk7N
	E/YOV/YFR7QEwZgIQirnGVstLLOh/1HoaQy7Y5M1K1wIHqBsKuMzFvUrvd02IGsbImaQsaTJfJZ
	VOWcbdCpqT8Y/uZ19/eJljvfihkxqFnXaFOILzDzGA59VNtgiy7fMzQ9DVfj9YUg=
X-Gm-Gg: AR+sD13Lrcjr3/oLUKfwhRGeYhObopi6AiMKCrRD9NfvvjSXKD1e/SM+zMgmcz1Rtep
	DJ3DOq28tHH7S4QB/w4SOQzSM/jEbMQif4AIeyzYRzjR9PQiGXoQWzII7ZkT6zJCPlSOFdItiaQ
	ygDh9zq8hNQJ0d+7uD8f6iHQLnrTNq2bwby+EHQoBlN4WzcIeHG5IOVCgkqq/0ZBuT4DWu3YJZO
	NgC3U0SSdakzVG4/FbU2blr6PXb1M+vKrunn8o6q1Ejh9/UT/Kvhn746fZxXL+yV1u1Pkv8vOgZ
	JWZfmMFAU6DHzXYiu6EptbETXtLh6EyxtGSphSDx+IzXPdT+zGtWgIVFjoabx/f9oKn7KsPtfii
	kFU6m5n3A9z8IrXH9oDpx2ti7WtHstXdMz3bjyJBlpVzCQLPmYufyfYFPIhN+9klauor6FDeRys
	CP6YYozcQwtpw7BxeKzCA=
X-Received: by 2002:a17:90b:268c:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-3933b84be0cmr4470085a91.9.1786693545535;
        Fri, 14 Aug 2026 00:45:45 -0700 (PDT)
X-Received: by 2002:a17:90b:268c:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-3933b84be0cmr4470024a91.9.1786693545103;
        Fri, 14 Aug 2026 00:45:45 -0700 (PDT)
Received: from [10.79.117.20] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3933b688035sm772468a91.3.2026.08.14.00.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 00:45:44 -0700 (PDT)
Message-ID: <3941f29d-3da7-4576-a852-9922b94007df@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:15:36 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-15-5e0ede4a0c72@oss.qualcomm.com>
 <CAD++jL=M1E+Bvfe9tHw3FaSTFgR1Nfzyn==xoLETvARLZHPrMQ@mail.gmail.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <CAD++jL=M1E+Bvfe9tHw3FaSTFgR1Nfzyn==xoLETvARLZHPrMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfX2G9++wWNc694
 vwh8ehqWps6AoPMcGpVOEkLDR5L/1WWciVdmBfpQ8UrzR6WxJd5sahNcLG4w/1rnTIflYP4uMNM
 8splKJ5xWXsdDqFZWlSURgDLwtMKm7E=
X-Proofpoint-GUID: Z4gnpDyW0f8Y6oN_0qFcAilEfxkTQshI
X-Authority-Analysis: v=2.4 cv=eO4jSnp1 c=1 sm=1 tr=0 ts=6a7ec7aa cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EUvog4zVDZIPAgcz-YkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfX81x7PLQyF1qW
 fl5of8a5dcOVorZCDO3bleLp+2GuZARvgnm2xk4iz0RFXJpAeDof9560F2dK6p9fJMiIXBq3LKs
 +G20XEHXO/H7a50wn8/ExQiAyl/JbZQLVO201Fvs3sCQezY4OwkpszwpP6A2Mt9FjXZYeMgihyJ
 gzbh0w1dSEuKM6SndDtZSb13zmRSVaDqWHKZMrOD32FVP+xOmVDVCNiUum6/4IyB6jCPybY05fL
 6haunfiNlThJHxtnxTeA9upbvokQ5oJMfj8iQbHcqDtDpcJt52vjq7GzKMMuvywzCvGtZDbwV49
 u5VuFt9+Xyck+scv0PCZVz9yJVdmPonW5jA+AbKPm6TA11imFflx2OoUtFtq2gg/NtW2oULo/ou
 hImzCzY8e/s1/xPvZjI9K+4PgaT2DLGjN4dBhGESlHhhVX+uX9m23AXD8f4QZr2+5ZJkN4LNWjM
 CFpikbWlQ6A+CgAKlZw==
X-Proofpoint-ORIG-GUID: Z4gnpDyW0f8Y6oN_0qFcAilEfxkTQshI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140059


On 8/11/2026 1:33 AM, Linus Walleij wrote:
> Hi Hardeep,
>
> thanks for your patch!
>
> On Sun, Aug 9, 2026 at 9:29 AM Hardeep Sharma
> <hardeep.sharma@oss.qualcomm.com> wrote:
>
>> +       memory {
>> +               device_type = "memory";
>> +               reg = <0x0 0x0>;
>> +       };
> Since this is clearly intended to be filled in by the boot loader, then
> write that in a comment.
>
> Other than that is looks good to me!
>
> Yours,
> Linus Walleij

Thanks for review.

Done in v2 : 
https://lore.kernel.org/all/20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com/

Best Wishes
Hardeep Sharma

