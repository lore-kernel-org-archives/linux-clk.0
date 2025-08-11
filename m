Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94ADB270EA5
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908435; cv=none; b=t+HVHyyGVX7xSTUtUhrgFKxo94LAZ1/YcdVXQREkhEoiPZ6ntjKr7sdOtS2Qn0KigwU2nPYW9L3tOf8I5m5Jm1aXP5sDTsAFTHJqSWhh0ATTwY4C9Q0bC0ZNvUWAftvMLNz+oyZTPUsjqCdR8QfZBUmWUrHybJxUyeWHpcsQM00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908435; c=relaxed/simple;
	bh=n6bYWBbuvYgd7Of4AkNGNr2HVdrMAtKaVoR0TN1D2LE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UUeUr5/iT2cRFgE4+pOeKNL5IIOQO+BLnquhNTpL88hRKiU51UyM9WcLwBL4SxVKepIT6IKnAq7Qq2mYdOg8+QVC/3G5fKeh99TYl4ITCpgKFZ6FALID8ewmh8/VN2vPQ+poJ1QDgiH2Vi/SQad2db31vNZK+ZFcPBQa4rYkwzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDV5h0nd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDV5h0nd"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BAGGlY023606
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=; b=lDV5h0ndMZZUeAuz
	0IysO8UnRQboBN6aqIGD9Jg9X3+MijLbMAA+Uab6Nf7FA82Jv8fXiU+QRYyzzXTY
	MpsLtYG7yHFlGthLlH+RamQCEAmEXi/n9212GiRtUqe08WkkXHf31r8mfulJqSIH
	hTmRm5xTc8JmaG8LynS4/k73FpXTWEkJVBI5s6YmNlVFYVMS42nydyWej9nG1eQO
	yS6g3wRIZs+UiPdwvBS2gad/iNpqa8sQ+nORwYYqurup35SULgLo3vfwICoO3EO1
	yFP6OaBQ4C8f2hbrbohrj13gelABMRCrN9BuQ3FT6j7hlaLWtmD7FVZlZNfLttQU
	S1enwA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem481bv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:33:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4af23fa7c0cso12399021cf.2
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 03:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908433; x=1755513233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=;
        b=QhzGQCuroFOrAbWkyIsGXUykYEnHRwDlxDjPizaswmmlfoOY3sf3XK6t4zogVEhEE/
         VA+vS7NOLi6EIraHS6k4wY1mSWnJuAh141bc10Mj0U90RsX20//KypV5hSqDKn5YkEF/
         XkVPoGneShkFstmYTRny8c2HQmQiMtPoyWSR0GQUWd3zXwbjRYhrEA+wU7qk3E3pu5Q+
         7etQsfnjjzktUZUffWWLH8srITIcpIulibJ9QzajueK8Od3Mp4nyorDlSGe/n1CavSpC
         497gW8b/jMh9LLHFDtEULRU7L5aFcT9azIduMWkjYeUPkN3X9/8PJqfL39bSm0r63E+G
         HZHQ==
X-Gm-Message-State: AOJu0YwLVVoEVoSOeo1p7OsVWFlUIeBTuq4VXzpfV5G//hqhpZNsB49n
	hy8+L2+LrgApjmPSkAjxPgXu1ibIORcDsHl8ZD6L/QL88sjCjHU4BELUXsAZANTmtkVgPpoZLZy
	stSq/Oe6XQTaL+aerv2vCiEMWA4CfO0dGqp2p5Ng7x89P+deijnlW5E0Tu104+Qc=
X-Gm-Gg: ASbGncvpYuMmGU+SS+dgt6AXb/AgrLHlbHXpZt2ZkLopAO9C6asEslG2W5VuVnanS7A
	gyzFAA5TIUjqvw35CS3uzLXu2weKHU9E3PH4CGsLaN9ans1CP44clZdC9SXwdp4JPVT1C8tRLwI
	UOtj92LzT0/0ymmkVzMyOnJjfg6mxleBaD5O1wbbTEzde35YWlbsrZxEvDNzTRi+81MduKXhRr+
	WweJWYbPUb4INIjcxJwio9YlcT06X1JZdmUr+1fra3+ofCnTq1Ejr+fl+hs4RnBZtpsCGqFBOSt
	pdW415OZCK+7gXYIdhlbuv6UnbuEC+voqRrMtKb0qwLLoa1b0QeFHlFRHI3qOZqvsuUVStJyMrJ
	ddxVlL8re/16lxFCoDQ==
X-Received: by 2002:ac8:7f83:0:b0:4b0:af21:80b2 with SMTP id d75a77b69052e-4b0c16c4306mr54913881cf.0.1754908432535;
        Mon, 11 Aug 2025 03:33:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFWzMOx5lf2Y5IZtNHNRwVFoW5v7W5IA4jlN1pRSARbMIRwDiUHjzbS30nEqXIzqvbxbYx1Q==
X-Received: by 2002:ac8:7f83:0:b0:4b0:af21:80b2 with SMTP id d75a77b69052e-4b0c16c4306mr54913671cf.0.1754908431941;
        Mon, 11 Aug 2025 03:33:51 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8eff60esm18546387a12.13.2025.08.11.03.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 03:33:51 -0700 (PDT)
Message-ID: <2a74d3d1-62ed-4a5f-823c-e1ca376ba104@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:33:46 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] drm/msm/dsi_phy_28nm_8960: convert from
 round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-3-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-3-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SKkiGx6ckp1EZe3icjTxdIpxWRMFAJI2
X-Proofpoint-ORIG-GUID: SKkiGx6ckp1EZe3icjTxdIpxWRMFAJI2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX8x9VBl7G2LbP
 KtPIQ7GEdm4/1aJB5F10V68XnKsc2xU6fUyKiu4KoR9l37P2l/+f8LsjD2YgemC5VxUZ6zDEZMI
 e6YxmMGwGoTD/Rej7Kjh/x9+Dv9Gj47E97uhdnbT1dqSmc25X48RVotMt1fVYMrPk+e1m6Tiprh
 sXItJuXds0V1GNp5Zffx7+5vNIRaKk/Fm4R64uJ42KXS0izO3H/6inNulqZzzNeIwraKo9K+I1Z
 fYbKttvLSXjC/idMba67gqJDg7qO4OH8VDoFkipDCPZF0u7jfthgvYCuM/1/GyInDE/CmJbkLKR
 2oZc2qsV9gpOBVoGhBQ40o0bsfhCh8x17piDnjGkeM6MUO7grcIDYc2SPRGEJVJyJjmxgC7i+c5
 X90uSNs3
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=6899c711 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=aS93HcZ8ji4XsMPHnqgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068

On 8/11/25 12:57 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
