Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E723532E724
	for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 12:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766061413; cv=none; b=MdMQQiaPR//dEmlj8ZEwsU79R5rgoFaUXyBMEi0lN1+klou86V88IrnPemsWxKGDBqfCw2iAFkoGXC56MPcnUEsazCqUUtpuUys2E5LuRFUQ5V1NUM+TDvVvT0JFBpg1RkZRbutdUFoT6bPaGdKKpEBqWOEGDLkgnivu0+SQUl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766061413; c=relaxed/simple;
	bh=QnSNkHZMqSocCnOOSd2hbilQvo79VjEjtlT9JqsJZxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cVIex9nPT5mF1L5KAjxqXA4/JQ2Djpx1op9JaBVD6NuIeItdKcvthoSFJJKRvYA5iUFSrHrmPqtMv6NkhmYvRg9eH4dvQI8o7wwZMY9ZlHsWSfhVHc9QTVjqzfFzOcc3oUPC285NFI0uOwoPorYA4PQcS2fi8HeOTH9gPGFXkdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i5WubbSa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TvmLKRR1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i5WubbSa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TvmLKRR1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI96E6V237507
	for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 12:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CeX7zdkTKzUgYrUHEXvo1kAjNi9I0TyGt1y+5V+nf5A=; b=i5WubbSa44riyiyl
	9Cr7zftRPg0APa58lJPGyB3kZhakWN8hPhnLrAfeAtESdi12ku0Im9fs5tSHGAcw
	mlypYhdThrD++/Rwkd78eUMroJrwudGs4C3oxvHmJ3urkhwpRDWiVu5Nh98c48/6
	hf9IX2GAGhBClL1nbnmLzTvfjNJE6EvKtHC93nkSwtYikMFH9iILehx+tntQhGRa
	pJHCZ/yxV9Tv0ithUDFwqoPbLGWOz0jM2ChKFP/Pc4noli3JpzrjRmeefdM+hqQn
	EizDmsCzK4RpeRnTxS6JfCmWSXHJ2JLLNRDcyOu6xUCebviJUSpRH+BJYraqR+tU
	6ycJNQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b44x3jcqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 12:36:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1aba09639so1406091cf.0
        for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 04:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766061410; x=1766666210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CeX7zdkTKzUgYrUHEXvo1kAjNi9I0TyGt1y+5V+nf5A=;
        b=TvmLKRR1IBwYbVC5KJ2iEPPEKstu66d/3Jpt6jqDQ2MGHOZu3jEZJgYjAgqTYdrh4p
         WiDJQyMdtiOtwvR+7WZFHDAWKFB9uy73NoBaaoq/m0nWRTfELQSAD+d7IJ9aidnFOPP2
         hik2pwjs2LCv52KV911rJovbyx/qTG8g7ny8Q5oUiTEw87/+UVf0OKXL9COIaao8LF7v
         wB1FTWb3Fagkvu7Skovb4kgT4gZrMZqh8FnKqv7NA/HV8vxmwtThF3NPjjgqqa9OV1Q5
         3+M0Vpq8I1TtK7iceIlyRpcuKIJXNHmUCWXEkXF1nU1Hw1NC4hYl5lMP67Z75MxjBAe0
         jTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766061410; x=1766666210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CeX7zdkTKzUgYrUHEXvo1kAjNi9I0TyGt1y+5V+nf5A=;
        b=RQqAiZX6onRrPRc28IcYcifLTlysChrcMdF3xM3YdflTZLvdsv24/huARLf205ZUzJ
         5HxqpjCwdXDwuuei3GrTaGLss8Cu/7FbBWlc9/rxvd5BC+gxH6pZQAGQn0P+c+wuz583
         Lti59iKbMtVOOo+jYirJguvFgOHw7lIkJN9660P4isAVIi/lsrO+vqS4KTUWWfwIPg+g
         VY+LvAQRYt2iZ02hBOiN9+4WYBi2QPNjw85aeB1lSGnjOVHwReLaOmScljns1UlvO6+o
         Re20bJnNlsttmBgSghIMN/XpkBPqWG2VlQK/oTYMGvwbVsM8c/r2xV8Lqlad5Sw050Z0
         tjHw==
X-Forwarded-Encrypted: i=1; AJvYcCUyXjjn+ECzP4l7XN+1JWYWCKvmBaFQb/W0Dfm7zo95WTNS8bSNbVgQK8g/2mPIXB2WX1LJ3ezCAYA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw36ich252kD8i497+8A6nFjsiw+b7KQUP9uWGioYLFTB/3MYNl
	kAGN15N6c20wwogXUG3c6cwSmxGSx+rEmmcwDttngPXdUXP8SL0vsXwDJSbctFwgsqbg2LBBxJ5
	QcV5HUQEZKFHp6l5/yR05CawaWg7XrAxxVjRpHiUq12/MjHMdHdTCFoTRYS8Z2Wg=
X-Gm-Gg: AY/fxX4XE0rQ6+Atuwm7oYd8nwdC2E4ssB+OjcpkTPgntns7cotxrrEuZw8GpmDARHv
	ab3rzY/fqrV992pyKWVOZBICA8oKQieYj6F6KMueUqhfZpHEV7d+lvebcUvliOV92eRB8VXBM1X
	GIe9+NDv5A1Mlq4rpez9/weSOjO5V3+zelyxmN5wGzatzaUv18wQlxgxRiIJKj8kjJ7oNoMHEx7
	zhuW8jM1w0VUecWiqDIzFSB4fLyCBMpZUlEJUtSh2O4Oi/UZ6VIVKkXTXPfXFiiVTjaTGuRJ68R
	oUvVS0dtxIZ40lcDeNAeXJt87Q3ixIYT1lgo3okr0kpcM0vz/qMWhL+lytpzemr1c7ORqF18A7w
	K7MaiPNIEQiUlOIokSqfvr1c/HjXoH7aYOCao5+qESPt4mT9pRo88EsOlw47J3pDbBA==
X-Received: by 2002:a05:622a:178f:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4f36108c9a5mr17884711cf.5.1766061410142;
        Thu, 18 Dec 2025 04:36:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQu2nnxqGUnQynFrRXz+BuL+HJmQqJQwR9k3URYcUz1hnRgEtf2TKddA/5Dpw/OBBUzx5W4w==
X-Received: by 2002:a05:622a:178f:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4f36108c9a5mr17884531cf.5.1766061409643;
        Thu, 18 Dec 2025 04:36:49 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8022f9530fsm223265666b.12.2025.12.18.04.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 04:36:48 -0800 (PST)
Message-ID: <69ac0e2b-82d5-43d2-816d-d3ac31963077@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 13:36:44 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: qcom: camcc: Add camera clock controller driver
 for SM8750 SoC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
 <20251202-sm8750_camcc-v1-3-b3f7ef6723f1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251202-sm8750_camcc-v1-3-b3f7ef6723f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEwNCBTYWx0ZWRfXwO9u34/WFYxJ
 t5oZO6ycsmbZ+L4SLS5QHOUAxOqsLFm+JOWU7s8GtQAY+n5B/mWRL+G8dNK0mZgfhKrHhgcrGdP
 7RKjEYTxDMZP3AY5qvM9otjZWFu2GRKJKj/yVt7w6lkg1vpz9mMtRkurtWDmEqQxX51YDz8AAP5
 9bNiRP+jascFfJb8GGMnl9vgOTsKLk5dnayypo2gMNDg46lQgCZagnWPCbUHy8qg2lrTasTPVB6
 i9leSw/yBUd8YxKYf+4YSBJC8ilXDTzHKFWaybLwuHL09NotQlkeILtZGeLBDaJ0xlyLP65oSFs
 j+vj6w5xjmyPAOLZQDIv03NsvTck8SVvfa7qvZOEf2uaCHEjd3dis8U9d2QhPESA34C42ftbPDA
 oNMiLR8RZ2vN9hhrtmrKPyCQrkD7nQ==
X-Proofpoint-GUID: ObD4bDr52SJJLoJnJekEEk-Q12cJqXF9
X-Proofpoint-ORIG-GUID: ObD4bDr52SJJLoJnJekEEk-Q12cJqXF9
X-Authority-Analysis: v=2.4 cv=Zpjg6t7G c=1 sm=1 tr=0 ts=6943f562 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_j3VNrtD_Kzz85i8SO4A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180104

On 12/2/25 11:26 AM, Taniya Das wrote:
> Add support for the Camera Clock Controller (CAMCC) on the SM8750
> platform.
> 
> The CAMCC block on SM8750 includes both the primary camera clock
> controller and the Camera BIST clock controller, which provides the
> functional MCLK required for camera operations.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
