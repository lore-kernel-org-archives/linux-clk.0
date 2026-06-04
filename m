Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48F13D47C1
	for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2026 06:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780552913; cv=none; b=fdxcrrbIKYkv4u74nHK99ZDFD3evruzqK5rJAx7kJ4gUfW0X9Z4DECoiXGJYL9JSOAqnY9jOPhT7bfiWSUMhwRR+mpMhUMNqrdHWpmBTkLaDZEfUqJS0vPvYdSKapNoSLRUHaiQ+SUp4eeIIV3ND2a6efJBrzpynhmIqCECrcyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780552913; c=relaxed/simple;
	bh=84ayR4B4aJcO8wg2iVF9z+mIv5zWJb6AyHz4PJZaKKw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gStjhUzUn8plhSP/mBmEbH4fi/lbKVAtLxRYQ1/gNYfY/g4W6qIaco9rwseMBvnVzoOQpaICAPFgTnSIwhItErNAy4EYOW++fafTl/JMYgsT4rtmppFcIvyGYkeSrhVchMCZLZDRToYm26m17l/dT+PFpc7LL9IP+t7wVSgz/ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UDGob3Cj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U+SbY+uT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UDGob3Cj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U+SbY+uT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6545Eej11039943
	for <linux-clk@vger.kernel.org>; Thu, 4 Jun 2026 06:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8dgiKFbDkeqTH5aR0tttNrB6PzO3jiYE3qdTpFLIH+I=; b=UDGob3CjXLWnXR8g
	a8MND0HbYIqj8rzuTe2NfSH3/m0NLBo9WOqOdf400ZJ7caQa1WfPWd6Y1GgTHMjt
	hOn53rzZAjqzi+GOx3k3QzfeAJEXOQOqHRVf+rmhoh610M7ygUGcSXENphnJ5DS9
	Pd7/aahzVbCBsXrKPLiGkfX5812wIOHCosnhjnFDiCF5+q9ZY6tCUYIwCDOeiNIb
	DPiMMoiTct7RlOJOavRtDk0btDlq/fICev0kTIoMqw67iMkz6aL1p0aM/bZeMpzu
	hsRYk/D0NGP7OEneTCR4uq56B30G4/dHa4r84/72GZQumgPKBLzaXWZYdOeOAZrf
	I55u6g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejtj8hv7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 06:01:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf32259e0eso5482615ad.0
        for <linux-clk@vger.kernel.org>; Wed, 03 Jun 2026 23:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780552910; x=1781157710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8dgiKFbDkeqTH5aR0tttNrB6PzO3jiYE3qdTpFLIH+I=;
        b=U+SbY+uTYxNmp7TX6u7rK2E0UqSQCUSOZsZXlslM9V3m7ljZL8iScYeuDA6VYYmELJ
         jduVHetDcqKIi1j/VlM/bzvgoCj/eYTKLSPk8CzKCVlFwo8MmR5AkOGjn5/xom3/WnE3
         PtG924K6GW3vE4X12KB1TR/5ZD7B3kHUdU7PmhSxbADWaSjKoZcMf8oFvqTgu6gFTcms
         cNrWLgb4lrQe/IMZfda6PLaflEs91Xym6CbO1QZWsQDxjDViKX98Bduaa09NLXKetg8D
         DnXyszJXvTc+LwEXx0t5sG58tvt+CbWiUlegNkzk43HK/ZVp1NmmdFZF86h9D0Fx9/uJ
         iBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780552910; x=1781157710;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8dgiKFbDkeqTH5aR0tttNrB6PzO3jiYE3qdTpFLIH+I=;
        b=QVQadsMQYdCOKaA8uLwY+n1tEPbq3/knQImNWS4qKHK4F+5st29WeXyaleXVtGrU4c
         NvwNqvQWNQT8voNfMvJSw2wYfL/Gg6svcA0IXgrzAk1ufkgdEShJS0f1BKa4rfA9bpmY
         00HKLyEiqctLaTRQB3F26kvXtPEMtF1bwvZJSE8NBQSXynCQ8vw2gzW3tpc5YFawYWTx
         XU+b/3bXytrzCWKLzGf11v/eoidZ5s1z4+mq7PZa3u2wh62AAYxlfGo2c+JbaEzfUydO
         YLwnjUUpIl6Sx8PARWathmueWCD/usp8lq+gFTjgmB0B+RY/m3Nx+V5XiX0mDWOWq8OF
         1SwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+cWAlXBChx0PB/nlCfMlHIaM7IM1o8KfrxX9Mta32555Hu3X0gQjuIth161fNc+aLhuIgfWxlfa0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTn6/MDaGgASY2M7erKWVxcw10+DECIdIm59pEfLwDj4hBWI6y
	T4dgvSFW2RLoeav8hS7vvbDs+RtgVW1guUC8CQIAV3vUa7mpA94Rz7t9sdMk9Lyz1ej1C9RE+AT
	gTLCdBTqewoKx7dA3STM+l4QJ4fuYWnXxx3jYvm4mQ7H3zqzEMKwdk7z/ZtItFVY=
X-Gm-Gg: Acq92OGwEfDHD1ohUmpTylsYIoEtIjnm+6SGlT+1QDy0FRe8jeKvzy4iyhrxtwCczC4
	h/Jf8Yczf5o7grvAHFK5WE0HWO87MJ+Vq+UUYH/wlVmPPXcdr9Bl2gCO5Z0wFtn/7hXYCPMIFbr
	yeIiwDNohggyJMlQDytr7wT7DRmgsoHgylkSrAiHiWxoACYEy7acKg/yzEQa2FIJy70UQWIcnaj
	uLakK9sBjZCUuZpGgIzlj5Ns21cr/uvSANlq9FTYSP//TNNt5XthNV6XwyCO5rAQch7fskX0T4F
	bQ3aX1AJsqorUeenK6TqP4Kq/vgWjqukaDBhMBiz6OSxSBDYV9DGv67jq4rGN8Cl1t4pto7MQGl
	GiPhnHTGId/Mib/mgt8Gc2BKdWOhlGqMUZZT3Twlc6ui0s/bmX2GhGZucjASPBygY
X-Received: by 2002:a17:902:f547:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2c163a3d1b6mr73808995ad.9.1780552910456;
        Wed, 03 Jun 2026 23:01:50 -0700 (PDT)
X-Received: by 2002:a17:902:f547:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2c163a3d1b6mr73808695ad.9.1780552910070;
        Wed, 03 Jun 2026 23:01:50 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609ed97sm44346975ad.41.2026.06.03.23.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 23:01:49 -0700 (PDT)
Message-ID: <29b9b286-63a0-f659-8407-9e8b5a9487de@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 11:31:42 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/4] clk: qcom: gcc-sm6115: Set HW_CTRL_TRIGGER for
 video GDSC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
 <20260515-iris-sm6115-v2-1-2ab75229de61@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260515-iris-sm6115-v2-1-2ab75229de61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -qLxPsAzx6ifE2OifyL2kHibXlWo2o9_
X-Proofpoint-GUID: -qLxPsAzx6ifE2OifyL2kHibXlWo2o9_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1NiBTYWx0ZWRfXyOjEeM2+a7zc
 s2C56bGfCuNWll1xQWWIwQrkfDfZ1kDrai3/mDGBq21tuJSf5eS/IJ4rKbudj11OswO7fkTpMrw
 Z1ZppZz3mXF83jdra9dOcHflkwBxIu1B+QFa+UK9U1H30uaIWURKVVGr9l/5lhU7ueaPqohLtS6
 IUN2h5NGPm9C5u20BOzWf64qi2D3Uw7fEPM/SXzKvY8m6ACBWQogCx/fJQxdTTGDtq2fBeeFTNQ
 gJrlefUTVH0smA0rLolt20MgW+T09Hv7z0S2wwqQCWaiOT5rimYboaGpGEIYriYsKQS4sfJtcvq
 aXuVQp6RID0VWr45rl3xE6z6HKPJXyxlVgFv8YJNyLNbC3uMwzsTiXBsdJCDRRi5epBm5Fjnf59
 f1GTJcxQqLvunR+1n446iAnmS0yu3sVywWegIP5pC1z65Yak9u9bFbV91YIc0FHd9Z/MkVYf/cq
 pq2zNV+mNnsjx97V5Xg==
X-Authority-Analysis: v=2.4 cv=f4p4wuyM c=1 sm=1 tr=0 ts=6a2114cf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=V4j3QN97b3vMt8JjJHsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1011
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040056


On 5/15/2026 5:29 PM, Dmitry Baryshkov wrote:
> The venus video driver will uses dev_pm_genpd_set_hwmode() API to switch
> the video GDSC to HW and SW control modes at runtime. This requires domain
> to have the HW_CTRL_TRIGGER flag.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sm6115.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/qcom/gcc-sm6115.c b/drivers/clk/qcom/gcc-sm6115.c
> index 4c3804701e24..c5251aff9886 100644
> --- a/drivers/clk/qcom/gcc-sm6115.c
> +++ b/drivers/clk/qcom/gcc-sm6115.c
> @@ -3218,6 +3218,7 @@ static struct gdsc gcc_vcodec0_gdsc = {
>  	.pd = {
>  		.name = "gcc_vcodec0",
>  	},
> +	.flags = HW_CTRL_TRIGGER,
>  	.pwrsts = PWRSTS_OFF_ON,
>  };
>  

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

