Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF453189F5C
	for <linux-clk@vger.kernel.org>; Mon, 28 Oct 2024 10:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730111099; cv=none; b=sjKfhNllpPSvHyuv1EIoj3ykcsmasDXyzyD4E6nbcHveJfoViez72bEWc5VQRdrlKnqfaBOrEieAFZ3D6zt8KkKxXAdM643sDP4HNk7toQjAZM6/sUA7gPctnFOsERaIy5fLh0AKm8IofL81lDSjREnghVIjjwMGczlPJWSnm14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730111099; c=relaxed/simple;
	bh=fbtunhKLM67bLa2qu23S88glusv6bfpysmOgMaktmbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rcS+A9EaVt1TybdlvogdQjB5vW15hrreuG+780c2IDN90JOw5/PGmD6fAbHYJBChe8ACco/UfemsQYnJgu0Ew8dnkf4eRBcLbGZ0eUWS6RwmZw+LttGKDonzo4mwLu00Zs4iVQ8VG+70WBwZHI12L3+4hrMzy2k2o3M/u+q2TYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GmShF6Px; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GmShF6Px"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RNdLYC010250
	for <linux-clk@vger.kernel.org>; Mon, 28 Oct 2024 10:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fg9jSsM2x5+eCKxffj8Vjk5A547zvvC9R2DqGq/9wok=; b=GmShF6Pxdex6D+XI
	Q7uD8E9NN8lBbja18R1/MeSvfBWP7oK5FjzhaKc8l/isGDj439YMBrBzaOuQtG9B
	9LFRXsWIZys/bcI9idwyiElDDL0ED92m5J7g+c73BNrBI+g7zTK+68+U3t8Aiepu
	Dnuy7Y88czX3pZ/+6Eu+CGKpCFeoVmiDP7aDUKEc7D41fZNA8VMYQpOYatRuCfaL
	O1R+xdsNFNEJa17TBVwZmgTxTBSdd5Y7Uys2v00hUnNQXmZgGAd5W2Khzn5ZF2Jd
	HGVaBFtiZ3LIoHN3m9a2HdEYjhqKMMJvbmWGUiirnv55XtTrd1X/X5Cnww7Pwl4S
	q/i3yg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grn4vhr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 28 Oct 2024 10:24:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6cbe91571easo15222876d6.0
        for <linux-clk@vger.kernel.org>; Mon, 28 Oct 2024 03:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730111096; x=1730715896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fg9jSsM2x5+eCKxffj8Vjk5A547zvvC9R2DqGq/9wok=;
        b=qkrTJToH+7PBPxgOfycGcyjEJ0xOOFUYFpj3WBQR6eJEcW6U4T90Y0Fg5upskyCmLd
         hiu5wqR1YkyrGAJQlKfI+nvuVTO6n6Y18t+AcD5TLrGwMRYmpVo9nvNc93Yafx2JN5+h
         DgzMZY5e+mN1K+e659NODLxNzhF+4Ijum/7MT5VoXvsPFAaN3X3Qz/dsoR5AsL+Z9n59
         Z7l/H2GLCmyPbD+9NaFwl7ofNNnuyMLvv+RG8pcuO0V9QrNofAV7nR6wthlxkiMEZ2r1
         6O1RJN1HMbQL99MC2L/oXQFJmLVIOXeNS19wDAvslgMIZ0HTZzcjBdD2cu1FGRrjlLnv
         k2rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZGCjvnf7miXS0HDUtz/Qs6DPQU8rSB05OxkW7thDtZK8NGb+O4VLb6GYgrwNqeyNf3ZUfXiJy+2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaB7nhWA4p/nTw5RXeZT0V+TkQGUpv1oU2jHGXzP72glH4Y8Ck
	A383BU6E/gXMiJB4m850DExWZeNOTOIq4OwV+s72uPLPqdwMRmsESEFGHoYSSRka43PbeGDaD1h
	qX2vXt5tlTckxZ7H0+/ZLRQMzB9jQb5mWh6qqsGb43xXz+n8gC/Aq8JgFkRY=
X-Received: by 2002:ad4:5bc1:0:b0:6c3:6d25:2578 with SMTP id 6a1803df08f44-6d185816bf1mr54129786d6.8.1730111095784;
        Mon, 28 Oct 2024 03:24:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1LCyhTsx+s4J7iCqfSqv0uRemX/kPrSPNh3ahugTm/b+6Nqx8Iut8S7BU/6LdyG6nwn7IXA==
X-Received: by 2002:ad4:5bc1:0:b0:6c3:6d25:2578 with SMTP id 6a1803df08f44-6d185816bf1mr54129576d6.8.1730111095455;
        Mon, 28 Oct 2024 03:24:55 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f298ef6sm363536566b.136.2024.10.28.03.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 03:24:54 -0700 (PDT)
Message-ID: <465ee5c1-2fca-4099-b618-f80484445dac@oss.qualcomm.com>
Date: Mon, 28 Oct 2024 11:24:51 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm: dts: qcom-ipq5018-linksys-jamaica: Include
 dts from arm64
To: Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Karl Chan <exxxxkc@getgoogleoff.me>,
        Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linus.walleij@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20241002232804.3867-1-exxxxkc@getgoogleoff.me>
 <20241002232804.3867-6-exxxxkc@getgoogleoff.me>
 <f2eck3tudqoqyylcknfvz77wj52fornxevp6po3y7sov7swikt@asez6wepyl6h>
 <768a1c92-6e1d-4d6c-90f6-efe66f68dd0e@oss.qualcomm.com>
 <c154d164-57c8-4407-8b07-543676d21206@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c154d164-57c8-4407-8b07-543676d21206@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: akvV5ka2cDwituF-CugpI7J7XnI4padQ
X-Proofpoint-ORIG-GUID: akvV5ka2cDwituF-CugpI7J7XnI4padQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=747
 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280085

On 28.10.2024 7:33 AM, Sricharan Ramabadhran wrote:
> 
> 
> On 10/26/2024 5:08 PM, Konrad Dybcio wrote:
>> Would you folks know anything about it? Do we have an open source
>> U-Boot release that could be sideloaded as a secondary bootloader to
>> kick it into 64-bit mode
> 
> Yes slightly older u-boot release [1] supports booting both 32/64 bit
> kernels.
> 
> [1] https://git.codelinaro.org/clo/qsdk/oss/boot/u-boot-2016/-/tree/win.coretech.1.0?ref_type=heads

Thank you!

Konrad
