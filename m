Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9773A29B79B
	for <linux-clk@vger.kernel.org>; Thu,  5 Mar 2026 06:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772691262; cv=none; b=Pd8h/CotJwXnoANSlPUgaEIC97kWuZPHNY2xZYkaEGmwD2/W68UvrIHlMId+luFG5evMZG+4IzmdBTmprezHc1N55ooeSFpcescsibN1ShXaAfYNhoMhfHgAZUDU7fQRNiBm5PGnD2cKt1yIy7uvj+9H6SRn+Ow2ScjmtzU4VFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772691262; c=relaxed/simple;
	bh=4BYvVO/iDWU9EMNQernU+rQFNIn30Ov/Eu+EtTd11LQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VcJ6cTElBHYsG8LI9EcFpnQ7caML7IKHiHIGaxs4ez3DhUtTwAmcnqE7VJH9eo7r4QkN1DpB4MbJ0LCThpcp9j84uWQNOuJad3zZX4J/zVBVqLWi8O6GivQULVCi1MHmwi5wwOLKClk+Vr7aaiwN0PUw0C4tPSh3Q2hxFZnDCaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=muAfd2FG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WgpuyQgW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="muAfd2FG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WgpuyQgW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251Bgox021039
	for <linux-clk@vger.kernel.org>; Thu, 5 Mar 2026 06:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ahl00og2ZBWHRNyL0TO0ijloE03SK4ZZ9U+ZClDCZgw=; b=muAfd2FGinoeMt8e
	pwbVnxtHBlQ7hmpCqZF7e9t369gMBxgG6GCJ6By5HLCeW2AESoZfvoFQCz/G9Ysj
	Z1sCiI4k5f/jpJIEiveHRTnDHEyScXqHKoIIZsWJ1K+4j4AU/2UouNUFoThmNcpk
	Zm7bBBgpyEfxbxGIY3s/+HO6biIxgs45KgntMoS37uGsAB9jx8KJQqzOhHunvyAL
	iUvC5ya3UuocF7P68fyKf2t0/IAGIG38raFTjAhCl1a8swhfkf7J3ceWVGeZL8El
	VKe+HOHiBovWY+rWBretbMVByvxtFaMIklsBSmeMcMp8b9Ib3seM6iVckhB/4a+r
	pSlyKA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpupthepb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2026 06:14:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35985522c1aso15301116a91.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 22:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772691260; x=1773296060; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ahl00og2ZBWHRNyL0TO0ijloE03SK4ZZ9U+ZClDCZgw=;
        b=WgpuyQgWrhuy+d1ReY07jOfQI4EP6Zw36uFxMypTkC+0Zz04RbIOfSdDf8x9Q310Uv
         BQLcs9YbyHEKQfTTU6qrH2olUukwO8OoMJM/0oEFOzynh0dTn5qJ4dWgl898Q9ck/Hz6
         4uQtYDk5goMq6t8mMSJAEsX54wYjcIf/dSlAjW0KhaeD/hqqitOWGcsDIkKMooXuk1wv
         AUNqHK8/615HND+29mlpCNl/NCh/eoRLyBoue/NNdiEWBnaOLVddGNjnMbkbHClT6ncO
         x5lnTHyHhPqJhivfBNfc2BAzB1yeei4OzGLZNcwA98cgqd1tX8PAMM9eEus2+ky10pjm
         qW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691260; x=1773296060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ahl00og2ZBWHRNyL0TO0ijloE03SK4ZZ9U+ZClDCZgw=;
        b=d6+bHX3CIOnwxsP96DnkNm9ev05AzTjQCXAplv3Z1V2CkGY2MCAESNn3FL31n47xeN
         5VO5DVtHe5J0b2Sk33a78GdDm0QhmQZJew+OxZEibe8VKgDYPdSw3QNwWqoHjIULYlOm
         ETViAOzrxWsb3B1Pony37jwkao6rTFhuK0Qv3p11HiYiBZ6eLq9B8C+/+PQZXDcwy16E
         LJgzBXsLUeGw7sULYf71VL+cO/HDgFzop1+e02armg8YLGOx0/vH0IasBiNJ9+2tVRL0
         3d/ON5bjF0cOf4CxQ/DB4iMe1yiiLqqGqgmjeeeEQG6qYB05/wjBs8jGkdDToOcBH5Vt
         Nf9w==
X-Forwarded-Encrypted: i=1; AJvYcCUbTBFYfzxRGP4XA3IgP3IRZPuDyegX2Q5r0v/rGwKPzvvCnu0xd7GXNs+jirE7KGMD0KNak8tyycY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiZArNXEbn0XfRMrp4f0zlrPglg5muRUs/xHoBdhS3hUwlPU7v
	6c95Z1V+DeRLhSwhrX45IArz9c+UpFiZk1VC/11g22GoPMcQuo4TS3s1ujL/N13OAgYE33+OnJH
	MofKUax0NpY3t3sH5Mc8dnUOjMVOL+8qW+/BETMFAsxV9gvVFarm35h6WqD1oYew=
X-Gm-Gg: ATEYQzy4k7K48nzZl7MnUmdh264XPrQgDmGBiVCQ1UmPLHhumKKrAmRAsy06pEgWd8T
	CWTG2Z2A6crld5Dn2zDx5SKB+e3VhcyVBUJvfvM+0WgZTSETMnJzRgcQTg0DLPf+CcznIR6h81d
	netEkzGyWkWrGUSKAmSd8y+WWxi+0z87T7c5B/jmmhbGwGcPe0lIGdq+Dxwy/UIJJt1eiTozDOH
	56JQ3haW6SiR4yLL3ZqPhzFPx7tWa7geFScKue43Ie/Qg7KLWxe8ru9oOqiJwzjapJ1c1bT+Mbd
	xUrwbMOB/Z42GjKq6gANiZG29f7HLX4OVEW1eZXNcKuY/8A2pho1BAYu9qwCLay8d7VjOgWjNh0
	e4Mg7gtMynd/lCY0tnm+48m59Gyh1roY9ucL21AP7KtCd7Jjb9A==
X-Received: by 2002:a17:90b:3a50:b0:359:9014:99e7 with SMTP id 98e67ed59e1d1-359a6a66f35mr3289499a91.29.1772691260267;
        Wed, 04 Mar 2026 22:14:20 -0800 (PST)
X-Received: by 2002:a17:90b:3a50:b0:359:9014:99e7 with SMTP id 98e67ed59e1d1-359a6a66f35mr3289472a91.29.1772691259793;
        Wed, 04 Mar 2026 22:14:19 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2e14821sm792326a91.17.2026.03.04.22.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 22:14:19 -0800 (PST)
Message-ID: <061dc51f-872b-469b-8df2-13385aace063@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:44:14 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: dispcc-sm4450: Fix DSI byte clock rate
 setting
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com>
 <20260304-topic-dsi_byte_fixup-v1-4-b79b29f83176@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260304-topic-dsi_byte_fixup-v1-4-b79b29f83176@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA0NiBTYWx0ZWRfX1Z6bWnuhei3t
 oVucq2xJkNAWfdTsEPpnekelXTQbYYriEePzsET6ia1n2uP1nz7p6RyJBJ5kZtsDpS066T6XyMY
 m7kY5aftPDzgCpk6Xx/u3m0PRMJok2XH37Y2bbZUPSY5gem0nd04Mg8f42frgOE0Br1cNVcqgvR
 5MMtNKR0dwq+jGx36cDrSgGpUI630fSk3uvHX8I0HUMWr+4PQ/V8sMtodJYjf10JIcVGPh+jJ5J
 kt/5rUE5DizjV/kuk+uGN2qQXjSyjsJ+l0SYX9WEKX1f2hOYDkcnXm2LdT8T6V8fC437hOd8byf
 yuwMylQ/jM1u+EvXS8HbHciqvGgRj8zrlj2V02DLbeqTzt/5Yr7jsVZ/SfVYYXKOdm+hKN0ZABM
 sQXVruPhj4LT5Ly0EnqZHbnJmjqhg1pCk7d1bFRg9FUCPG9ZGYgiV42ThN9hX6CB8YGJ7gMowii
 qE3kFmg7XwLHtSvO8oQ==
X-Proofpoint-ORIG-GUID: FGcjAQFClSZJaFy-YCyrRQFmnxvICP0_
X-Authority-Analysis: v=2.4 cv=Ddsaa/tW c=1 sm=1 tr=0 ts=69a91f3c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-moZBm4D9L3eB_LYtbMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: FGcjAQFClSZJaFy-YCyrRQFmnxvICP0_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050046



On 3/4/2026 7:18 PM, Konrad Dybcio wrote:
> The clock tree for byte_clk_src is as follows:
> 
>    ┌──────byte0_clk_src─────┐
>    │                        │
> byte0_clk            byte0_div_clk_src
>                             │
>                      byte0_intf_clk
> 
> If both of its direct children have CLK_SET_RATE_PARENT with different
> requests, byte0_clk_src (and its parent) will be reconfigured. In this
> case, byte0_intf should strictly follow the rate of byte0_clk (with
> some adjustments based on PHY mode).
> 
> Remove CLK_SET_RATE_PARENT from byte0_div_clk_src to avoid this issue.
> 
> Fixes: 76f05f1ec766 ("clk: qcom: Add DISPCC driver support for SM4450")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

