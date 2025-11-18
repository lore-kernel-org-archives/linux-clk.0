Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26D2328B75
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 09:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763458791; cv=none; b=njVdZyp1q2drhfZfKbrLNIfWRF51AWct+cLj5rEdX8KfU8s7/U60HzeX3aOQGnQqPVz1OoDegAUJxK5qh1NjgZojh6ZkMtMDbDjJ2kqo/i6inWyTasDs/aHYW9l5exoWm5qBohy8SKEqOw8JeDNTgK0Wwhy7BZvZ4RBvEg5Tc2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763458791; c=relaxed/simple;
	bh=mfRRUUiLEUM00WsS0T61tZsOtb8UlFWYBb8fTQshtjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xqvkblbnpm0jQS5ulEMNTRUo0HziAdWwfzO8s97jIt5pBk3htNv4c3SsK9jsu/SViGXjhzzjjJ8og0JOI5X6ovi/S7vIwMxihXDOKBGk8S4ngk5pbUI3cmAAFoeWmcKLoW60c+af9M3aymwVGoUBS1J5XhrTGBrtm0P8wCTINsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vx549b7w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iZbsLIf7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vx549b7w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iZbsLIf7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6fWPj2343437
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 09:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lpxskyOt/DUyd+JK+oswxenNWQqg6JO7PsHwIirxqQk=; b=Vx549b7wmIT1t9Ld
	Vk+BjWJn1YsWUZZd+IrS1liaqjSeSlv+OzGHA4JB4gZmyzXyU/4+WUHVZPC4YYSd
	KH8d4aIsSh6nAD9o1lf2caJauqu/n/pu7VXhCfRdEdzb7yElftD7Ti6GQcTSOgoo
	kzH6geewdDtKAav8jpREcv0UP693nhRMgWJQRRAfpMmbj05eqaLIIBKXM0KTM91Y
	72OosjmZ4mJNKLgM4/aEXSZueB4dicC12uHISlPiOL2RQdpMDHZlFvI6kX+/sgOX
	0X3CTGuLJeD64IlXQ+07BXbLQMbnEOQ8WkeaOY+9sJMaUrWnwhS8fRJ/cI6eCS6F
	K+2T4g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agkrn0hnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 09:39:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ede0bd2154so19336231cf.1
        for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 01:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763458787; x=1764063587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lpxskyOt/DUyd+JK+oswxenNWQqg6JO7PsHwIirxqQk=;
        b=iZbsLIf7WrrK9TjnMGrDs5oM6MKwt6THWzmbJIAGx7tS9F60+L+82kxsROyA3H2u5h
         UeGZKTjEggbtKPIccqCFjbmQhRf+KROINqQGkYmPR1wZxnYg9QnFLQHt30LiVq2sxo5N
         x+47v/BjrFhGLDvILBZjcDd9CcWar/KlQbiTwQ+fKZGuZ+K4s3PbzP5d05jVf+LDNVJG
         Oiat4E0XGSVgfRYEukdeyEzhR1R13vpg4yPrMW6HUuLaeEpUWAys5V8kQG5XCM4hc7Oz
         cCa2r/rgDBxUYYsa7RftGMohxbmyghSyNRTXNA8CJYNYmi4nYMjwldT5db5IUyzatBnO
         1KCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763458787; x=1764063587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lpxskyOt/DUyd+JK+oswxenNWQqg6JO7PsHwIirxqQk=;
        b=ZXSknxK5qRflAzqJfguS0iKbqRDB7U+vojLtgdNK8vNDjSpscu7FfYmI+FgawayWOk
         AFb8Zl2tpD1zzhtU6d7gwCewla3rDyxsq7aw414SgMZOigmUFbPlBBFiMpbWMgJwEjsD
         QKoj6ucN8kTFMRdGnFJeHNVvtsfUiBHPIMkQmOBWUjGEqrvxNwZI/ITYRM99RQMadCXt
         XyfQDo9ck0kspg2d402eJjoQcqZruiaPOSbhKpeJ0tML2UyVJPQU4s54M6qW6QOaVqA4
         1+iGTMWRfmRP7LS2rR1EOlB2u+jKpPiaN2AF48rybueX7A5b7aBXEE2WpyUz1x/5iMwY
         PxcA==
X-Forwarded-Encrypted: i=1; AJvYcCXwRmKWaA4/mKDkbM7S2iBMWh9+jyVRqVTieTXwMcXsIQZIHp3g/2LElG7OireqYwCVF+4ub3Mdc18=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjQx5xe0b/9OVTP0ObezcUrwSOHQdJeHDQQ4ZvxM8rMBvIPEJV
	dx603vibfD9s3qFURzKmPL8c7KrYZ/d2axoyt1Ja10LQgy01OUYTPc9buGE3PIWnMmUmeFSBDar
	mK/0p71XY/rnW4BMt7ORkzGXSQEGUwAwyolk7i44n6ntVlg/qX3Xj0DEcp5Jjtho=
X-Gm-Gg: ASbGncsPw0jGbSYAblvFXIcl2NMECklPr/SFEfDs9x2aBphFtZ0xNK1MVOn9kQ36xL8
	/u0XRzy+ht7K5/XL7VvQ/RJEiQqNks6PwoquHqETzqZ5s5k0aX8X1xgi0xxQlZgEmuvEP90q6V9
	WTut0Ob5uXdYpGh/MyeK4cHrNfyS9M7L7xKM0DfFKB2dFEb8mL4EzJLKi4jNmpVOFUfBkhfxYr6
	0rj0fbtxt1aRaRKpNHFffI5wRJLeGPsnz5/16m8tdpIHk2zuscZNDvs38vv3Wgzlcq0MqXqq2vR
	2BulKN0+SI2qHameUlIpp6mOyiM71eUMIx/BGgUmtWPQ/61B8juyLvpVrbmTxLnF8l0eh3CLgyG
	vtzJCkcfOsK8tYQdwLeAZJHPqtvwQ273S6hhlyNq/Avk5RqhvAwd2dKe2WKSyibA73yM=
X-Received: by 2002:ac8:5a47:0:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4ee3140eb67mr19637871cf.5.1763458787182;
        Tue, 18 Nov 2025 01:39:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGM2XznaRPw4t1ZV3qwqJLsICwQEZb87oxLhz3lJ4o/WnzQaq3sDjaNpuPz0cNrOC+2yawjJg==
X-Received: by 2002:ac8:5a47:0:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4ee3140eb67mr19637651cf.5.1763458786765;
        Tue, 18 Nov 2025 01:39:46 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda8a7bsm1283095866b.54.2025.11.18.01.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:39:45 -0800 (PST)
Message-ID: <875788df-3702-47be-83d5-e34619b31083@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 10:39:43 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] clk: qcom: branch: Extend invert logic for branch2
 mem clocks
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
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
 <20251118-sm8750-videocc-v2-v4-3-049882a70c9f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-sm8750-videocc-v2-v4-3-049882a70c9f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NR6aAMUOePkusun_HFd1SqpY4J1XaiQu
X-Proofpoint-ORIG-GUID: NR6aAMUOePkusun_HFd1SqpY4J1XaiQu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA3NiBTYWx0ZWRfX0Hhi83DBEm8Z
 BPk/g/uN4ds5RjlKKbavAmzAeJYjoZ+O/fFD+q7o49hr4EJMbO2e+r6RD8wDj2RhWWPHrkKAMym
 dlAH6KoMzdHvc3OzX4iYjKYhQ4nj6JHuPECWb9NrP7j5mrV89CyEJy00At68NIoPd73k9wyQkDM
 lHZ9njPN1vLFLl9hADnK5oRKIgiOlRsmD23nFYLf/lYmAjD8pKsqc4cglGYSXQpyoDaq3Pym8gq
 m1pseTXSSNnnJ/giGKHyxitVvgX51OpARjnbC0f0glMYh3fdYYor+M7Uu6IGiqwucLojghrq7HZ
 czlDG1ENjTqkvgNivVO9j7LFp+APPXuDOXhKDQfZveZjawIXOexA3Ht9XNX9/lvSWyJr1+9sLux
 XkaB5t4CX/kG6Hf+T3FaJrvRalj4Jg==
X-Authority-Analysis: v=2.4 cv=L+kQguT8 c=1 sm=1 tr=0 ts=691c3ee3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8EbF_sMYILjvT3iq7EYA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180076

On 11/18/25 8:17 AM, Taniya Das wrote:
> Some clock branches require inverted logic for memory gating, where
> disabling the memory involves setting a bit and enabling it involves
> clearing the same bit. This behavior differs from the standard approach
> memory branch clocks ops where enabling typically sets the bit.
> 
> The mem_enable_invert to allow conditional handling of these sequences
> of the inverted control logic for memory operations required on those
> memory clock branches.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
