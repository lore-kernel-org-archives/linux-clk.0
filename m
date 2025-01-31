Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FFA1C4A16
	for <linux-clk@vger.kernel.org>; Fri, 31 Jan 2025 12:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738328182; cv=none; b=Zwz64Swd0uYvqtzUGuX6lTFwDqhXCYsBIf5cmDoVdM1yUXFtpuzV1I6f9QenqOM0rGB60Du9L0ZWvuyfFmkj2rlUJWEHibV7dHyBsN2NAPNEbTylCKuPuiioWfKU241APdQftnvflGHaHzXDQVRvBi6DQFLppUsbyilCtj7G9lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738328182; c=relaxed/simple;
	bh=UsFe8VlEZCmQ0sbihU2b0JFZi9Ej2TKBlU/qdva3I+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lKIwuQ4ActeDKwayeWIIAACQKD5cOvtmpWOoM9kp+llSAUWPAqPAeSKnoMfJPaYaOTeOuu3H0q9vRAQ0tbJTCutF9X8ycM1mdU41ljuttGd6Te9wDgxtLo7owxlg5Q2SvbHUe50E6HMKoBzkhwbOl9Kx6cTR/0t7xvUo3HImdxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgN5Y0x9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgN5Y0x9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VC4pRB007349
	for <linux-clk@vger.kernel.org>; Fri, 31 Jan 2025 12:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	plPbCbgdcFippG/lsXp/DeHtnj+WORRPmcLa8nmWJkc=; b=jgN5Y0x96Go1UduD
	qPTkezkZNl4TjSCDabOLqPG5SZpYJING4ZSY53LpGiqCD/dhk9v1GP59UPmwgzNg
	+bXi/QmM5eFMpVyQIzOnRDDEFF5U4dQHmTgDPFRpZ2Vp2U8HGDZGWoFCL2Urw4az
	p4lNBIpcgnxP17yQXy1fqHgJ62AuhkgMjI73j+9z157Q5D0gqPuecRaUixIg+IgL
	tT1YM/zKcW7hYfzJWOHsUqd5VEcQN21F35FpUGyXHLRK8hisiJe0mxdFHarc1WP2
	uWAICI+NeTRDsDgFmpPfDCyd07xNij4TExRPYphccjqkMmxeZSIvNfRAWXppEIJ8
	iOk2Tw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gx76r3j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 31 Jan 2025 12:56:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6dfba8de3cdso5550626d6.0
        for <linux-clk@vger.kernel.org>; Fri, 31 Jan 2025 04:56:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738328177; x=1738932977;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=plPbCbgdcFippG/lsXp/DeHtnj+WORRPmcLa8nmWJkc=;
        b=MdmpJ6O2m9fW/p/b0hRSqDHD4HzEEHnSg8kQVMq91LhmBGA2emGIhft/Jm/J9JFsss
         xohazF0FZ/sPEa0Ybkmge55PvmiKixP3d9psMin0HM+dDdh74SiIIBN7YMYP9m3275+v
         G1AfZVS+Ih3bauv2f7XUddQICrGda09kq7KmIwmoXREzqQwRejA3YOMSbxcG1GdRyLeW
         pRQ+TfNKD++DrhJXDzPeY2L2kE9plpTcZM7eeSywGouq4H7ASWXRHr3v9bfZ4dxfC9Q6
         44VwoH3k8DB3RsKMm8crqpXk8qraEywBXIBVqm0LDO2Sezur4sPKjldRQtx9YHGbnN+D
         zEFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs81mWJVJGkPtV9rtT2fvUsG+NijEQvcaKjZIWhJxUCa3mT3LDe8sU+vYssDGMu2/svcr7QK+AaVk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxemxeOyp+6II286o5nEYXFxhL6400zH+iiJ4DlPpYBQi8wi6o7
	n97DTSlyW8XQaTuQMufCYjlAQFooDtyO6ub9GC33kYZQRsGCOOVwJ7Sk0g96f2kzXgKIkM6vfe7
	GMLtt5BYVY4WGPFscuHH5YQL0grz/96EJ/CTg0K3/dccr6tXb1aSdRFzoJPU=
X-Gm-Gg: ASbGncsBWJaTxEgLs0y6N3Q//DIydkqJex9MMt15YQV52rufJgMjQwaYYTKea5vQP9O
	CDfxnxnvF6bQnTbimBQmnD4mzYvycUvkmgcyRhI7wByZf/gUKG4OnPSqeZeNPxpKjsSRm8wyoZi
	f8d7j/ttoWr+enEYpi0gbtqlimGHdubGAguEze/hq6d7QFP30V/azUDXCF6V88Pdj2ir2ako1pS
	vXCdIraba+z67Y4tYMclbxpEq/KSROhVtdRLPU99phl76b4TxtnsI1pT7m7nSvBUMqtwDGLH5IB
	Y84KH6j+q/HooX+iaw4BxwC8iOcNXCWVFBifH2+HJQJ8quCuNLx8gFP1WU0=
X-Received: by 2002:a05:620a:43a5:b0:7a9:b8d1:a26 with SMTP id af79cd13be357-7c009b37be4mr397853485a.9.1738328177122;
        Fri, 31 Jan 2025 04:56:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGm9+/5z7jb7xy21B+AJ8JUsYwxTcI6SmhkN7nHUwGclLh3z290C8ViPSJPsRA1U3ApIjkHg==
X-Received: by 2002:a05:620a:43a5:b0:7a9:b8d1:a26 with SMTP id af79cd13be357-7c009b37be4mr397852185a.9.1738328176714;
        Fri, 31 Jan 2025 04:56:16 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a31531sm291583566b.141.2025.01.31.04.56.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 04:56:16 -0800 (PST)
Message-ID: <e9fb5ee4-9ded-44e7-bbfb-cb2f897015b5@oss.qualcomm.com>
Date: Fri, 31 Jan 2025 13:56:14 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: qcom: gcc-sdm660: Add missing SDCC block
 resets
To: Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Craig Tatlor <ctatlor97@gmail.com>, Rob Herring <robh@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20250129212328.1627891-1-alexeymin@postmarketos.org>
 <20250129212328.1627891-2-alexeymin@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250129212328.1627891-2-alexeymin@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fV9MG1IXTzLZUNOYFAZmlZGR9tOZEkt7
X-Proofpoint-ORIG-GUID: fV9MG1IXTzLZUNOYFAZmlZGR9tOZEkt7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxlogscore=834 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2501310099

On 29.01.2025 10:23 PM, Alexey Minnekhanov wrote:
> This will allow linux to properly reset eMMC/SD blocks.
> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> Fixes: f2a76a2955c0 ("clk: qcom: Add Global Clock controller (GCC) driver for SDM660")
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
