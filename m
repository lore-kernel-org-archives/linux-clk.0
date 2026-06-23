Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6983D34BA
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 11:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782213810; cv=none; b=fWGVMQbsU6TETLQ3jX9eU8PDP/qR/7bsAkj5bYdSXoIADKqV3BJIqrxH9h6XSo6apEWxbRsbxqwAsV1t45Uk4lldOMXHCNbOBbAWEtGKd0emlntaunLA1Dau6isaPCupuuJgSrBiGJojB0dytB256X5W2nommI1tZbCuYot3UwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782213810; c=relaxed/simple;
	bh=RXUS0MiuMi7p51H4Qd9KyX1mXELw3gVjHZCesaH4yws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FDhi6r797Fiaab5xCVh3Hif/MYSp3mVVObHfjUzYh94OeiwLvCTakFqQyn9Bjdb1i4PYjQh6QqqqW4Bn7t03WUjA9MBooYlCRMA59QQDenAFnGIwJ1buxvYk+1bUorjoDPACkNayDXu8N+r48AX6vFxjSepLZTS0hy6u804Onyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cbXilyVI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3hE0+LS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cbXilyVI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3hE0+LS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsePO023925
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 11:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mAVIsyi0roMiNG+3y68083oAhmj4zDD/EfEM2kSD1qg=; b=cbXilyVI6wW8w1uJ
	sZXyG8GJmlYGOYwDI2JQHfWE9oF9tIeIQbhrCZjn0pvbKS7li7kBxH98HzdSka4y
	hFGhL+SDLgFikzzemVUbKThM20Xlmi4hoEl9jd/jv+nKs+Z2syIh0kPDS1LDNgf0
	zO1b3dSG+qfnTsNJ8yodH4frZdovKlS7FD6chm/9yp+dQxem+d78ngb3/OJwYiAE
	5uQbWjnerSM/+XhuM0y24R/kJCS2TUKgaigmEShJh3qp6xGxcy7NkB2TFpvgcnEG
	CEuHH+22bN0XUk1ePdfwwmZUlPpdf6ipYArWe/Vb+os/huSVJ6y1B4I67aRCdlEH
	mNNngA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvs7xj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 11:23:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9229581de9eso32357685a.2
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 04:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782213806; x=1782818606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mAVIsyi0roMiNG+3y68083oAhmj4zDD/EfEM2kSD1qg=;
        b=L3hE0+LSrVJWk/WzV534gc3c1HOagMkk/GQpj97Wjy8DkF5GLrHPMSR7MjIW8O+yQV
         sXIkLTXqfgE8JKYd+WQUj0ciZTwL8VtLLIwenM3Sk/gvN7Oog4FDqyIXGwhcbceoW9RR
         DTNfFnmXQvtoc1rvTc4EABEuargOOXsJ+co5l4DfoJkR9eqy7TDb9MnYJRtP+VoFyGAk
         wCcXkM3v0CZC6JDPoUPyj6aw2N3IoxI3b7GiCIFY/6TTYOmSHr55avOdpzeoNjj+BxfH
         MXPtvyhvD0dZqJhwI4Jodm94Aic6mVRME8eF/VeTeofhF0hwPQamXi711Dow0yhayMLx
         3wNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782213806; x=1782818606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mAVIsyi0roMiNG+3y68083oAhmj4zDD/EfEM2kSD1qg=;
        b=mobxgvhAOXF/u4lODRUrMm5PM54ETCVdC6L7CvnWcPd/KocO6LkpQ76kByC/0FjjA5
         7dgpRbsSeJnGp80g7O+VB/DlQ909G5yJydWD99YKf3hi3KCXamVTrm1AWMYZov9EufnR
         N9S+4OxLmbFs79rgRYg5MMoffRHq63Y3VgT379DuOBxM2rCpR9RrupIN3Sv8AKHhUpLb
         77GXvm4o7MUrc9mFrWK3E21u6AO+/gco4SQXk+8syND7zgMHWCnDkQ4vrm0OywtgxkfH
         y8vE+7W8xwgu85cmaoCb2Wgk2JlyEdhmFC4Ee1ZuIF7skzTPvMi4AcO5/5OcDPlQge1B
         Syqg==
X-Forwarded-Encrypted: i=1; AFNElJ+PUXg8DxcRQz3VTJ6s9zomGG/nGGqU6vyVExFDRij3VA+/+njiPY7+McsbnKdj2I0Ies4ZGNukKMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgueXZfqPDZiF388fu+GZOFX0DX8ZA7Q07HwIOUWR0xa6Kspn3
	2fJHSUz0n2NkWg/dOq9dyHUUHadnILF07EqpBi7lFGdbH+DeEmc0FDVoBwPSbWfF4SnwrRhcZt3
	p6h6EKoStxnGUNB0hODHaUqfw7F8fX27J1txC2lPZBId1Xpo0kF5zvR4EbbDElZU=
X-Gm-Gg: AfdE7cla2XhX/vY8kBZ2ywVo8C3vOuMW96QvDaibd9EUal4kEPZG2wxfb87Dof57brJ
	C/6BJrVafQ1Lj3XopClpIsPeNYuwMMmJRkFWdqgO4Z8x4HKDKxlKEaUYd8VWisOShGELDSsLMoI
	WukHusLZfeeqXfwStkf2aqkFStIEaO0xRtfOBCkZ8H96787drgMtV9IStDKuZGDuD4HS/dX1eqo
	4+3ZMY7+6YtAIZTlgKqx7aOVME0KnS7VhlZSl90BHgulT5g714E2cWjQHaNPDIuUWN52PPTXEhr
	QeU6sxmsL9oklocvlXThotC0uZGUrgg7RuAIw/jYCN6NAUk251I7IgeMy62VvIyfkZJDZit+ikb
	0M8pKeTE9DgRbTEbZW2AoncM4gTT7mNoBwqw=
X-Received: by 2002:a05:620a:6cce:b0:920:6579:bee8 with SMTP id af79cd13be357-925c6f59e85mr504351485a.1.1782213806276;
        Tue, 23 Jun 2026 04:23:26 -0700 (PDT)
X-Received: by 2002:a05:620a:6cce:b0:920:6579:bee8 with SMTP id af79cd13be357-925c6f59e85mr504346985a.1.1782213805798;
        Tue, 23 Jun 2026 04:23:25 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e49a759sm503098866b.6.2026.06.23.04.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:23:24 -0700 (PDT)
Message-ID: <27db2e06-e3ea-4edf-a0b9-1baac1d5bb50@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:23:21 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] arm64: dts: qcom: sm8450: Modify GPU operating points
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-3-37e2ee8df9da@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260622-sm8450-qol-v1-3-37e2ee8df9da@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a6caf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=yh-zqMWk-TAmMPKcllkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5MiBTYWx0ZWRfX8pb0EL+H32Js
 7QCzQM2Wc5gB/s+ymSjg1oFU3MIhGu/KbL1+rd3cEjqmklwQhUnbN0sLlxqny0vnq03uVHxBmtc
 iweKFVDMY6oLoNHu7ksrbliHHUa12sc=
X-Proofpoint-ORIG-GUID: dZ-rY-JjQQ-5sNBGyDVqlwP77XvK6Qvj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5MiBTYWx0ZWRfX3dM8vPyomm9T
 K7GmPXzBJUAWHk29nxlOESprGugJMi1OI1beoOtn9en9IptPChMQSpIcazLVfHO3Y6KLsFnm0FL
 GwvU2THBOSYaTluIrOFWs2ivJpmCwnxV7KY9exX5c9PWhEGMbDuVqzVbK6KnYbkMMwLLXCAZs5m
 Y4Z5hLI6/0NL7zK96cCLXhuNDI775dTRuTAMYObMxbmTKmtMzVqG+vRhsa+yIL9UHSBAqfJqqFP
 kHEmUpyFlX+6dpNfjXkqGPtY4Isf4gJdqfn9DH2l+y33KVdpcQohf3Iau8Wkq8lDffDSY51wx7I
 cfHNyQTu9sJZAsSaO/+nTbCxO//MRzJIRRApUTKwXqtL1hXE6Ih1abgtMQ9xVr27SpR7KBzOJXP
 JfFH8iH6qmwROQ+5X/m0monH7aLcxQ==
X-Proofpoint-GUID: dZ-rY-JjQQ-5sNBGyDVqlwP77XvK6Qvj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230092

On 6/23/26 2:54 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> These frecuencies don't exist in downstream device trees.
> Both 220MHz and 285MHz belong to SM8475, and I'm not sure where 317MHz
> came from.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 15 ---------------
>  1 file changed, 15 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index e34e3c05bf74..5e331a25e22a 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2495,21 +2495,6 @@ opp-350000000 {
>  					opp-hz = /bits/ 64 <350000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
>  				};
> -
> -				opp-317000000 {
> -					opp-hz = /bits/ 64 <317000000>;
> -					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> -				};
> -
> -				opp-285000000 {
> -					opp-hz = /bits/ 64 <285000000>;
> -					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
> -				};
> -
> -				opp-220000000 {
> -					opp-hz = /bits/ 64 <220000000>;
> -					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
> -				};

These are valid frequency points, although downstream didn't advertize
them.

Funnily enough, the frequency plan lists them as:

LOWSVS_D2 -> 317 MHz // in downstream, at LOW_SVS
LOWSVS_D1 -> 285 MHz // in downstream as-is
LOWSVS_D0 -> 220 MHz // in downstream, LOW_SVS_D1
(the above are what it says in the doc, yes, lower voltage for
higher frequencies.. certainly seems like a bug..)

LOW_SVS   -> 350 Mhz // this and the following are in downstream too
LOW_SVS_L1-> 421 MHz
SVS	  -> 492 MHz
SVS_L0 	  -> 545 MHz
SVS_L1    -> 599 MHz
SVS_L2    -> 640 MHz
NOM       -> 734 MHz
NOM_L1    -> 791 MHz
TURBO     -> 818 MHz

so in short, the existing map seems to be OK

Konrad
