Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D002C434E2C
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 15:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352161; cv=none; b=YFyVZOnTOZq4yjxENSmdX597jukX2RHqsQqsA57PUnPb4jRdfL6Lw3fjYG0eGHw+MVsfYDiiPrjUQ4BPB1eBRCnn2w3nuJ7uCnXVz7UjT1N1YYj0sjnMtwMF3YOlZb0z6tx2b8eW7UBYo0q/Vp1k3VIAMti0bwfaGNFj0B6NJ6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352161; c=relaxed/simple;
	bh=HdwwW2iPxMo55xo31PeaYKaC9C9c5lBoecOPey2HqeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GOHQMFeQ19VLFLsICR40JYojjYYfDXxaTpf2vACYfftMMZxSGoYo46zqp4OhyxwQDFRlUTdVeAmNSTjGAWmIA8k0nefbxDy8GkGgVR4nTUvdzoYlV6kCjHFDPC7t8uLQBJrzzfkwhxYKeuCDREVfzj3oNZBhjDTXGq1p+BIin/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P62yl7vc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jNZI4Wva; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P62yl7vc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jNZI4Wva"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF5f1947310
	for <linux-clk@vger.kernel.org>; Mon, 6 Jul 2026 15:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CFu3+CLuR1Wqk1McfQvrk9SrE2yO/Tatw0kE1ejFwos=; b=P62yl7vc/Mvt/dzV
	3MyUrF1pEILkx2F8C9VTrmpmnpEXKoX/nIqigX1Eqadb6Iskeqieg/r0WgGHA/+b
	YGg0RfeJMF0/JeRBjLIHBSP9/xl6Vt0zBHIqCW0b8NSXiFnjQDwV9mcP1SWiNfmj
	0ffPIkGdxV2t9iNW3ytls7tDvsO8Oq1ITDgk58jgNzMMgOwmqPd/17r0howEGJJP
	PUm829Rz6vDfXXLa5M/VyJBr99UDZODxA1RgxsU1GeBNNNC4jqzd8ooksV8p7Hvu
	myfw8om36IA1MClvpkCbcVpRNwcX3ozB82pzY8iRqM1uLzXLFtuLZY5PRo90NYJm
	evu/GQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h51y78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 15:35:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1fc94a11so3446261cf.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 08:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783352158; x=1783956958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CFu3+CLuR1Wqk1McfQvrk9SrE2yO/Tatw0kE1ejFwos=;
        b=jNZI4Wva4yedgQ8aTrGP8Q4Jt2L0uDe8MvEv0IuN4dNgA0DxjTKCMPcPlrEneNkPmg
         cNt7l+4X76yCe8ASDmoHENhPWv1aVi3Nrw+fp+DyKFWFsID+VCHBTsRs6xGqZqxq+0mw
         8nWJaphjHYd6aoakJIdo14XjnfV5u2d5HYrkDfXv6E7s2+/O3h+L7ZdQtQG/dpKZOtKX
         05Jdi5jFOrjasAIqgVMRHNfJhYQUfI9ueHmi9pNUhhX9wMBG4StwX+CzMGC7osM8zk1f
         Rf8RDBhUKdZyQUpKQHeqGLwawY7XoylH9G/Lsek8N0jE7Y8qdYewoDsn44ijTZwKj3wU
         CXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352158; x=1783956958;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CFu3+CLuR1Wqk1McfQvrk9SrE2yO/Tatw0kE1ejFwos=;
        b=jqn5i7BYxtkgdfhxSnQrRmWZbWgY/6xH4qmHhPy7sdvVLsVgxZv5Cx1V5a1C/vuxar
         fQGNxr0MFboNOXEVbQPOC6jkQCfqw863qE3p495r4s3SOe7b65tPXEU1gJAK5dAqNM37
         R+F1tp8A0dIsRZ/reJJ1p670gODdaHyxXg9z/1GdBIQXh5xjt/IyPZs5TiC921zHUUiy
         HUcBbnV32Z+zeTCxvRSCfAEHSRETWLODXHxjdFFQYkd1KPhvvGnid9ZpdZbWv1mHxxNl
         +7wXciMh/K/StYq9VEBOmlGkdvHHRjyAwxWoGecpJEo+CRl9r4Rxo/+fdwluTWQfEOJy
         IkWw==
X-Forwarded-Encrypted: i=1; AHgh+RpUExyQs5B28iZ+dW55xNY+SBE4qucbUOJezCGn5EukC5dXZgjae4YwChIkoHyoChaUufPgHNPyhYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKdL3jT3DP+ZEC1gDGP5vY19cD8uRRA9qUXUOa5gZf4Z/naT9I
	ZzVgHoEIpdQd8IKDXJvsP1uqP+vEDYs4V6E36NDbtllcpHSlRDDY11AbKvCWKKFB4jUmZxB8XZD
	TLhcmD1aseFYrN8q9y7lK+/luwRpoPcc9bPGODHx05Jkp6yDEObgK2c5UcJebXg8=
X-Gm-Gg: AfdE7cnaIISgatUGmxu/TRWREYOpr9cwVOZxP7t/g81WpZfrjqFYAqu5W1fEmaEJotE
	zg4hHM1/bbTl7Usd4C5TcugOoU2t2zkTQWqCYnsgOaZltejkiRKtvAEbDIrguqiep9bhtbTDJ5a
	hHL+dpKLr2yw0v4vZspR3n2cohU9z4MhKTfZFHO4xPOdmxp1GTQcgcgAbHkdBDU/E4BQTp9mRnc
	L7kZODeuDIhExSMr9HSwE8PTIffb6xLDyPvMkHBamIQ1O9tdKYY5X0xD77Yfr8jAiek8Vd2kHKQ
	X6i7puoUbHrPn5eNOzR3EuG6ySK79OFUnmE4aFQNNDpuGyLqYGKYD1sNXSHqa3HR4qfIuef1tXi
	89o9f02FXJwEPn5T4UN5rYwzHyCwX14SXphk=
X-Received: by 2002:a05:622a:347:b0:51c:2101:f0 with SMTP id d75a77b69052e-51c4bda6c05mr106810851cf.2.1783352158114;
        Mon, 06 Jul 2026 08:35:58 -0700 (PDT)
X-Received: by 2002:a05:622a:347:b0:51c:2101:f0 with SMTP id d75a77b69052e-51c4bda6c05mr106810451cf.2.1783352157695;
        Mon, 06 Jul 2026 08:35:57 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6290972sm775556466b.41.2026.07.06.08.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 08:35:56 -0700 (PDT)
Message-ID: <97a4a44b-7982-4705-85ec-664838658b63@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:35:53 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] clk: qcom: gcc-mdm9607: Drop incorrect BIMC PLL
 and related clocks
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
 <20260706-qcom-clk-mdm9607-fixes-v2-8-745565101869@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-qcom-clk-mdm9607-fixes-v2-8-745565101869@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9XF7rsk7jlP_hRgUD6-q4uC-7cbdOUyu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE1NyBTYWx0ZWRfX+CaI01NMW2qh
 K3wcLHsbQ12IyREk2cc9jwuqKakxnDyWJNrIjzNAGJtkl1gS1tUtSTdODEbgqiIN2ocip4XeVCq
 90OQ9Vnyc/9nm52HUKfWtNUV9urHxKI=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4bcb5e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Sy-nuy6jZFkMOSGpH-IA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE1NyBTYWx0ZWRfX4iPoPwHsuBjH
 o0mMx+LHiLbjF1gJ0GfIqkUAe9kTv3GGnCsS5hVWqut1NBLl5iyNkMgyQEcGM4GqqIL4uNHJPCr
 zEo1jOOqXTL+jZr+N4sHN7xvahYHvg69BNnM2RqVs8oqZtKim3IRa7iNvcEaHpZ+TeKW2jtRVdR
 f3H5+HFg050cGt5sORGUOmKRcPf5YlCtIslxsdaOs42782qP67CXlnGt45U299BDEPdEZ122RiR
 YpU+x1CyWGDv5PxNI1N8TAMFhFyTMCBY6eN1Ypqok8AtBf7+g3JTR8zLZn8uWCVoBbhUN92y/BZ
 /j8hg1F+FlcxNyyullcF1sY27Q1YPU98GXVZyvyQiIIWRvEP/eV2DLYXPhyA138Q9GuRMFrJ9gG
 uTyK4YtNmMaJ6jWBf01wlwNN302weGGoNZvWgBeFoA32gKtK3Ze3AM0xuoIgnNehSA1QLdgDk/G
 3D5KwEU181HBkE8pIeA==
X-Proofpoint-ORIG-GUID: 9XF7rsk7jlP_hRgUD6-q4uC-7cbdOUyu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060157

On 7/6/26 5:02 PM, Stephan Gerhold wrote:
> The gcc-mdm9607 driver was originally based on gcc-msm8916, but a closer
> match nowadays is gcc-msm8909. Looking at the differences between
> gcc-mdm9607 and gcc-msm8909, there is quite some confusion around the
> definitions for the BIMC PLL.
> 
> It turns out the BIMC PLL on MDM9607 is actually an Alpha PLL just like on
> MSM8909. We can vote for it using BIT(2), which explains why BIT(3) was
> used for GPLL2.
> 
> In practice, the BIMC PLL is exclusively controlled by the RPM firmware and
> Linux should not touch it. So far, it was defined to model the full clock
> hierarchy, but even in read-only mode with CLK_GET_RATE_NOCACHE this is
> problematic since the RPM will silently change the clock parents without
> notifying Linux about it. The clock framework reads the clock parent only
> once during boot, so the resulting rates will still be often wrong.
> 
> Follow the example of more recent SoCs and drop the BIMC PLL and all
> remaining related clocks to avoid reporting stale status data. This means
> we cannot determine the rate of these clocks anymore. This is not a big
> problem in practice, since these are NoC-related clocks that are
> independently managed through the interconnect subsystem.
> 
> Cc: stable@vger.kernel.org
> Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
