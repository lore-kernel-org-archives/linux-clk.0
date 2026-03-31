Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9683B52E7
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 11:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774956888; cv=none; b=gAQQPgavkvzm8PXq98twyKFRd5wXZL1zRGN3hxFZRjJZrgUNx0LU2yO4pYg8e05fslCur0zu4vobw/B8rzt8hd6Sq7fbdrcJ27Zl455SBKIrkfRQShq5B0yRf165RFZTBUeOVjOoBR+vLyKqiEP6Lqk6hnSpU0+JztRL/9tY7tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774956888; c=relaxed/simple;
	bh=gyBFP/b/mLiJYrmBbkDNlvJj4Cb9GsLsJxV65G81sLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MV8Zs76gLUC6skGsI3GPtb9Xjn9EbtNK8aq3Px5luOnNHfpqE3dFU670l4/UaTtQC1pzgGPqShd3BsSvj8hdNmvJsGOqNIAX3+3Y5Y7r/a4ACiVRpHMfTmiEn2+uVKSD4zOb5oeOFA4GKCYOg0iMHb3fTMPXxnkd9cMsWIV/Vnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekael1d/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E0rpR+0M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ekael1d/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E0rpR+0M"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VBVxOD1841101
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 11:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gyBFP/b/mLiJYrmBbkDNlvJj4Cb9GsLsJxV65G81sLU=; b=ekael1d/hRf/vJk3
	4oxbIMMsXyGWTlDhIMRytzUco+jyDnRboQckc0eEJ5H+xYGxtjnIFXuOK3G1OmIO
	Fy+9oWdSNb+QEk8zp3dJMbCwiQNfGBXAvTaLguSWkCkpQkwP0VRbExWguWU0RjPr
	RZN9uMQwA9bd5Di+GF38ivilr5wYzL96igaKicEaU0f7VZl5Mm3o9creSDWEV8/o
	jlKNlS1OsD2qU8UgQgb1Nm744ZC6nhcpaLlSdPtreldZsxObcpwmbs58Aqjf/tEg
	yGLX6p1/n29rvvIY3TXikMdI6TIXBADliSaO+vyBGbmxY+qvWsE94jxu5nowXDU+
	V30WMQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80rsju45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 11:34:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b3544bc7bso79301991cf.2
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 04:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774956886; x=1775561686; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gyBFP/b/mLiJYrmBbkDNlvJj4Cb9GsLsJxV65G81sLU=;
        b=E0rpR+0MFMKEjQADVi919fktCvRlhfE7OO04hg5UHPqHg8aFtvSDbO/1nlDVqL4Qh3
         Uy2pNj3S0Eq+1opmlJDRigG3kjhtGY8b3MxvQ85fX9g7IukllkhC504NoxW4IBxcm/Bx
         cFJ5lz9zCe5ZzhaFB2KtOHSm2nNSoNYloXwLMNyn+oWmmVfWcBtQYPjpZNJfH1uIvPfm
         JbrhN9QP5ZadPgfbeXcJLo7EgG0Z0k3ERmLIpMkvDzJ6caW+k3E1/y1QKYQFQIfLUADs
         V2cFjAhoRVuQdSUcfvqjFehrgm4v7J0/UtIul14OqbcrRyh68Hh4xT+mWo+J2ZjLtCty
         RelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774956886; x=1775561686;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gyBFP/b/mLiJYrmBbkDNlvJj4Cb9GsLsJxV65G81sLU=;
        b=aq8wSYU5p0p//VQsriCfpXqCzgAfbWWoob3xcwX3ok9dgWSWS8E+KzpUAHeY2IpmFG
         rYDvJnGylzUdHoki7BN7nqnWAdzlIVUgdAxUrdMsqcLFmj4a1k3q1lo7N6D16bShxoLs
         5T25eeefSYnvLK610T+v7VKFGUOdXCRdbgBdCrEaoYNLAzwnhQfBKAFXDPep82ZJoveb
         usACNhL/OPmVMYd/+f9hUeVlWmZVtYYu//a5n8BqmUA1Kd5JyB4dIVuxD925Vb2R6HtI
         5yJ1ZPd7mY2OU3t2tn0Pu3Z0QE5FnyK4uZeh6scPrJLpQcxnxPR4f9OAAina16VyAvHX
         PMEA==
X-Forwarded-Encrypted: i=1; AJvYcCUFUnfpP8aVxaZIj9cocnSbQFaxkn6HkxiAe0XYJ7vjX3nkONlf39oWR/u2WXsHl3J6hO8pW/3+TWY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMJdn/FU79XpvzXN4ndE/+7PqSZNyrtTsthzFyfz4ieGYwaV9W
	pcd972hvMAsy7/9v6dK6ftIY9Bgm1xCdA5tDzIkQdVe1mr3Oo2+KAs+lzZKTtjlqoydgxX1uF84
	r0ibu9xqp3yzkAlC1IcoWXnf68YP/MJYfeIt+qsTT5q7uhWFkd/5S3C/VP2D0aZk=
X-Gm-Gg: ATEYQzxMWZvnfl8y6FHOfO9vny4s44yDGNPa3c4KDbY8heFx4H1mMdxQoBUESg02PEF
	Ynf9L1L425eUvMo+CeY4GAzA1PyBBOKY/qYSL0zpDlHuqVypfIn/K/89u5FrDNFBBa1ueieZ+bA
	Ea38jvdYQzFb2jOsmiXJVsuh75bYtXHQuGeZC0ZuVmW+PutDOROuFZOWLi6dFpIilpxG1mgbqlQ
	dmLlq9DONfsbRq/WgBi3BuvCd5wyHPC6cMaH3LFqNZiaBpOnHIWiIEz4AAsU9JbyNZE/hpis98U
	dXr/Ikne2IMxf6LcJEKGHz5635TDUur4ou2Vi5xdT1iR3TCD3EfIhtfGpqZ3lStME25dVhCPq78
	wbr+ExoaUBS+U3D1QJRx3DLpWYYJcMwSK5ZkP9UNn0nYL5/lC
X-Received: by 2002:a05:622a:142:b0:50b:51a0:f745 with SMTP id d75a77b69052e-50ba380b9bbmr212931241cf.6.1774956885816;
        Tue, 31 Mar 2026 04:34:45 -0700 (PDT)
X-Received: by 2002:a05:622a:142:b0:50b:51a0:f745 with SMTP id d75a77b69052e-50ba380b9bbmr212930861cf.6.1774956885413;
        Tue, 31 Mar 2026 04:34:45 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf245e4f5sm28283132f8f.19.2026.03.31.04.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 04:34:44 -0700 (PDT)
Message-ID: <66739d18-2c3d-49d9-b456-2e8c1b81385a@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 13:34:43 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: videocc-glymur: Constify qcom_cc_desc
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331085521.37337-2-krzysztof.kozlowski@oss.qualcomm.com>
 <ecd73358-70ee-4ddc-ab99-aecdf084c172@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <ecd73358-70ee-4ddc-ab99-aecdf084c172@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3boqiWLK7NSHfRW_Anw53SNHooZbCRgE
X-Authority-Analysis: v=2.4 cv=VInQXtPX c=1 sm=1 tr=0 ts=69cbb156 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=5A7uYVEyTbBfcqsGeEgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 3boqiWLK7NSHfRW_Anw53SNHooZbCRgE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDExMiBTYWx0ZWRfX4CZT3u4Xp2Dm
 55MZF0DjruY/nU82H3C0LkYpYybeQ852P/n5JeYQXduqVzY78sxLR9LEv54UveNFgaQowy/geDA
 jeTWg/rqILC5Lc/9ZNfK9Uf6AsdjLxwRu0sPA9u9DO25EzsYQ1uXlR09+jjZE42s3wBn7YU6E/u
 2Tg1hhsOFEanEswb+7TetuC9sYseeGyYgn4lgMHL8GMQlxneXqxVz5vYac/gVQ7Eoe6gIy7/B//
 wmt2HOoGaxbgvWj7lPYUx5De6szUJdNHVzMTaemfV5g5eMs2AzCgolsxFSegb530PDaJNvdYJyG
 hkYt1LxWwKuB1Wkxsv9VVEe94BV5nPAalGRjYysdIPKsVgcH3xjNWL7qGDmVpNkRJRIZc4GJMqY
 MfoLoxsP72qPnmGM1zFdTBVzs4NypCnbVvo2awRkSHpC8zdjAGKbAEcADwLB9VRQMc2ZM4lCbQ7
 IAc4J2rrx9Lb/y4uvJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310112

On 31/03/2026 10:59, Konrad Dybcio wrote:
> You're free to contribute to the internal template that these drivers are
> based on

That's a very reversed logic. I don't use "internal template" because it
is the wrong approach and I am always advocating against it. I am
advocating on basing your work on UPSTREAM work.

Additionally, it's internal, not open-source. I could work on many
internal things, but they don't matter, I don't want to touch them, I
don't care about them. Actually, I imply that no one in open source
community should particularly care about internal stuff.

So no, the users of broken internal stuff need to fix that broken stuff.
Job of the community is not to dwell into internal Qualcomm templates...

Best regards,
Krzysztof
