Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098717;
	b=guQAJR8D/amdOIxeOsPUDDdG8tSBTa/rUHOGDHw1sxMWinGEpe28sVDf5AJTi46Y8XqJ
	 MP1N3pYKiAFfCxoXOFi748vpvZeK1MtOlmqftsWRuPkbC5L9nHkaCmF9v0gBi58T1DybE
	 2pZTtvli9ORA5t8qCsWbBRgl1iZOB/JYlpVas/29gyTqv+e7GBHQVHX+bJ9uxteC42U19
	 gqlardtYKDmQutRmZ5dGOnt0UVcifdvGthuyaImQ7TIgtO6SOYrq3vYOt/2gj/ig330LQ
	 BkGAOvfEpBF1DKxTZADPGFRwNhmeGT5pn8jTR8gFuNdYNt4BUpVQOF8PDvjEH5eoIhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098717;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5EcasOAWbOKIUjjsy8ENhgR4jVwsHVMq/E+4MI5OtqI=;
	b=VllL/u2iWBnMQWLOeOK/wL2+23AQs/l8iuPAdP+SkZt56Lu45MyD+qmH0IBu1wyo7SoB
	 Mq4jvrJh2xMxVcvk9zu2hN0nhC4lg+cYtil/jqnT8xg0PjC1l23ECDQd9LaS+vik/WIRH
	 rdoyiBP/vnRtSGtavXNnHhQ+oNAf8xMsnjPCUjh31tsTcRzgg3X2JWbyOeKb4Rl2S/Op3
	 Tz1jXrolMs+7rToeiC9qWjHiOcZaZInagOkrC+wiLqswkRpWgnhHt7dbJsum5tFebGIXe
	 sT5YISKmWzXhreOqdF7NNATRDJ8n7CiVY41Ob5a5t+7zuJCABIzTY4LA2VCwmIpmtSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="oJZoJ0/9";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YxZ+9AU0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5F0606A322
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 10:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A5F0606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oJZoJ0/9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YxZ+9AU0
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeBRw3011968
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 10:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5EcasOAWbOKIUjjsy8ENhgR4jVwsHVMq/E+4MI5OtqI=; b=oJZoJ0/9L2pXvJCh
	+AVIw8DAlppSxDwqHmA+ztXhBrZicpi90xg0i4uVbavLGD4TxqfW4/8pnYY3uoLE
	5TP82RxR+ZdichJeAgtBHVgVVdPwmXGyAS/pnUYqaomZ6IifePzOnCZbZRUg3XNe
	BCmBU8fy1eqcFAxQJiHEF+L7WNzkD8Zlht1A5g4QCt7LAG8rnuk9D3ZttRD3x/hT
	uafdrht6QPuzHefl4I+tYtfovrcJ7XuYWfnNwZpjQk1s5jC+SXeh1f36cnBCBO+I
	LWTS6Uu1Od1RU+YjJTHo6AxspH1gZJxt+EyxXgUGQ+7YzUlFsgQDzuO4yoROlBo1
	p8fCng==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3danpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 10:58:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5350173dc7aso12981001cf.0
        for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 03:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098716; x=1793703516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5EcasOAWbOKIUjjsy8ENhgR4jVwsHVMq/E+4MI5OtqI=;
        b=YxZ+9AU0VWUhUTxy5+MWk6jSwVJhXN5gU84lM+ID1BdggY5/RIoS48VhcRSsn6nOmw
         R9BGS7M361GlVeqC1Na+Ij85G1zmi+7gFfd9jk0Qd7ByfFAadk8rrxgP6qXMrj0CpMQu
         L8BKXrNXin36EpO65ne+d+Qbc3LyuPeJ+GroEa8uHQxt+dsetoIMOhU4QGLT19r/B1rl
         b/ZzjyjROy74Vl1/ELEtleM5XW4aO3RiY5dRUrwjdtxWkjrj8vFkbOkIVDTh7Nw64iv3
         hP1Nm3fYeuAPS4z57pcwPHJtGEHWUi4CM4tfZ97Rut4AOTiZOuDjZwlnO2p5o5ZCtdZ8
         MC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098716; x=1793703516;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5EcasOAWbOKIUjjsy8ENhgR4jVwsHVMq/E+4MI5OtqI=;
        b=QpbyJjyj5CFKGtrE6LqeXDDyiFxxlVS562KKXE8ApNBZgnEuG9syeTJaO+CsjLMYbA
         vGDkwMGE1mUlPvuVqgwdFA63S5oYxmCbyUHooL5J5OKciFvd7puYZ/RxP2D+I9uTyMdF
         TjASBpkKxE8w6rwmzRE7JYD7EI4J4GypxEG8hzckRLaT2j6/HiOdfSI3a18xyaaTr/9m
         vBBiCSbcUMF5vFVceWpq2SLAbb05RCLxcxwA4QVxiPesUaWp8KcOqB7BEsrADzGKsPaU
         7hukXpkd9UdbHJjatQR29f1xkEinh8/GmsE7thkxb/72XMVgiZN3OJCBYnLUv6xJ7D03
         UIFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuP/HCWoD0yDl6oGS9/43uMJmFSqqBWfdSZJz9Dq24CLqVTyDCNirac769algVeCl4ujt5N/8g1BY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmJwYxUUzsrvGR+wuk3xe95QcxFSJr4Adw0tbwknFxAg65+PIA
	yAcb2Y5I6QzNm1Vj9kO+ArPqNHIyrlBMKytsGLuZjPaLal2r04yosMvE/w5fHSIb45cxF6TnYXI
	o7VwLDibq5ZHawKSY2lUP+8A7NuBR+mxQkWReeQ0/kORFBp4TwhiP4cRFruyMVKU=
X-Gm-Gg: AYBFou2zg+2486AZQLnoSVvZJjChvKxwmQtfvpLoUPFNKWtrl/qm2TWNKsKhO/yLdRZ
	FVV5Mj8Ll+cA8t6W/rn/V5BdrQp7S1oOKOScq7d0sRupDFt4f1EC1LjjKl5J7xHZM1lSepZu61b
	pH1fzx5U6ZLtRx6/HJoCDvF7Y9UKXDHGRg5LhPliWhzFpCgtv86duJTa4Z1MSHGTDTaGQJpNeHm
	DYGNODsmc6oFdkt+MeGBksj5JZc0t4WO6cjfFTUJnFHxdo0QRboiGG0rVOTtb4bAWxMMx/XU03X
	LYfVjHstD50U9GUTiQaaQcLgbDI64NnyDV5WNaStu0wzjFnjkveeh2I9eJ2IBeldFOwVof58i70
	0mZB9SxbrxdSOacjy/8fSzg==
X-Received: by 2002:a05:622a:e0ca:20b0:538:40e2:bba3 with SMTP id d75a77b69052e-53840e30413mr134148791cf.0.1793098715633;
        Tue, 27 Oct 2026 03:58:35 -0700 (PDT)
X-Received: by 2002:a05:622a:e0ca:20b0:538:40e2:bba3 with SMTP id d75a77b69052e-53840e30413mr134148481cf.0.1793098715166;
        Tue, 27 Oct 2026 03:58:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7975b2sm438661566b.73.2026.10.27.03.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:58:34 -0700 (PDT)
Message-ID: <a0f82960-be24-4d57-b12a-b6f5078ac64d@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:58:31 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] clk: qcom: ipq-cmn-pll: Correct IPQ8074 NSS NoC
 rate
To: Robert Marko <robimarko@gmail.com>, andersson@kernel.org,
        abelvesa@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, ansuelsmth@gmail.com, john@phrozen.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261026120920.1667982-1-robimarko@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026120920.1667982-1-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX05UV7uBsQOPo
 yseqqdOg/Y9iogmKIQ6db+DdqfYQ+XH+5pb+TUc4FGfvRw9D68UsfqOV8iP8woL9MWdpKRCcQCU
 wL7xijxg65SPTKjNuS2DkIbsUhjEFxQ=
X-Proofpoint-GUID: LlftvU0iNOwekwg9UdQMks167ZceEn9S
X-Proofpoint-ORIG-GUID: LlftvU0iNOwekwg9UdQMks167ZceEn9S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfXzEksu7IovZ7M
 KO5Gp8PJm5fQi/sPWkk8EW4X1jxLbU0FeL8n/U/ehWBR+bcV7rgw7fgytuxAGKJeoNj3V3lIKiQ
 mWTSOzc5ZdLaVWRAVnVOZRXrjSiZxoaikJUCOii5Ra29hmup/2Uaf/lTny62Tt/tNZ9un01BXw5
 1GsWodBRQHB0exhLmfLxwrocUmpwVJt0eR6GwkxbNg54JRMClnpM6ugPazc09FBszNGYcRVLQrp
 icc/+W31eM2aQrHILGTyr4WRhyu0na8Td1Qze+Go2pdw1ukiVktmJFH2djOinIzr0oYpcE73tVK
 hSQnpnuuF/ZDKxPbbklUSLP01VvgpS8zcdk8lvL+dHxWrMAaKO7JMukM2n1FEDYOrafYpZSsc5p
 S/n+bE9lMVTUcVyBKD2TlJzt1cWBHhL1xI793IckIf5To+18LciClmHug6vn9hQ5OnYFFnSgj8a
 a703Xe2uMdp8jsFOtmQ==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae083dc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=tfqOdNywceuasvfARf4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270043

On 10/26/26 1:08 PM, Robert Marko wrote:
> The IPQ8074 NSS NoC bias output feeds the GCC NSS NoC clock without
> a divider.
> 
> GCC and SSDK (Qualcomm vendor switch driver from SDK) both configure that
> clock for 461.5 MHz, while the CMN PLL driver reports its parent at
> 416.5 MHz.
> 
> Report the 461.5 MHz output rate so consumers see the correct rate.
> 
> Fixes: 4e36f8ab45c4 ("clk: qcom: ipq-cmn-pll: Add IPQ8074 SoC support")
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
