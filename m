Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C803E5596
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774949623; cv=none; b=XkNeEPImkpDu1ZlDDez6ffeEYKB1tx7PVsbkCdIt0dMjAjkN22U6k5RHU9CGaXhun9hP1qMTZDGzuaW8RyPIOilsWqtzQikNMtvukfxhkalXbXvwGrAsnYTULMFADpWgPZpjGkPBdsskX5PhzPxApS8GvGUBa93xnn4BtUEfmIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774949623; c=relaxed/simple;
	bh=+IjoPXtlxGaqcbteH7Xoi+XamXOFFIwQU6B8MI8bFd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sALKd1PWdZv7bww20gxtooDYs5GMeeWxTAYo27ALoUhRK+IDhafjupMI0TPtOKzDxzRuyvjPNEFgHYLpOsNHgQjwdttd7qGI9K1p7Q/mpiU0X4/8LWxBCmcnfJm5nMeQDuqhZjTgHtu+UIKIHO2WVrmWt2Tm2oOyoPTM+VdvxiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gYURW5u8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WIJGoNmz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gYURW5u8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WIJGoNmz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V9NDhj843300
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qbr1GARxBMsoXWwR9sIPZisrIlDf6DQwHv9fzbstqNI=; b=gYURW5u8Oy+FvkAV
	iV6lj1t2gyDq2TyCPN5xPmOqrKfh4g0cVxLnBL5w+fuLUXgFDkIRmo8Fn7AtGe5X
	WgpJooLelIuKRBFqZiousuqAhqvLT2s6ikMh85ii3ZTPCU3FUMQR7rfD4ux+ddzL
	uDG6jMUe5ZOXx1Lw+KHM/fucy2cUv/jWn9fuuhnd3yRLRqRgOJ3A6t7OBHUIRD0t
	inlW3BVWBqMTRUUD/7g8L6YP/JzGRmB4wTgPV4jBcTHx6JdbnyEqgl2FUC1f3kJU
	xBPOJaHKh6mcscOX+CYbIQRHFx0lPaTVAr7dgtBxP/P7N4kQXFkCeklGBjhyorUv
	iWQo9Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d86nt9bgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:33:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cfe29579d5so212088985a.3
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 02:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774949620; x=1775554420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qbr1GARxBMsoXWwR9sIPZisrIlDf6DQwHv9fzbstqNI=;
        b=WIJGoNmzfWWIoL9g4P75I+aHn/gl8qyunkMyBbN6YBQjFexXwjPf51ijN9hXUD+MrY
         LLkvWh27CPDpC7WRhGUFNWxAN28XzZKJCLoWEz6Zt0p7SZ1oiO9W6yyLaalIbFYTgSyA
         CuXd6tnICBWJ1EOJEhD0JKyZkYyPgBFqE7yB8CiDjlCxHsQyHt+ti8eSWB76rsseHmLJ
         VVc613KJg4cSaQj3uQLiIBWwYUL2XXKAB9wx1Z9I5am2Gc9xHaAtIK3N9hWf1oij2p+z
         wyghh8Q9oVNpjGto664idi8QoOabtqaQk53Z7qcQ/tX+jN0v/wsejnZ5clgZ2NAPh296
         zYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774949620; x=1775554420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qbr1GARxBMsoXWwR9sIPZisrIlDf6DQwHv9fzbstqNI=;
        b=VTQKkjAvbYSM6Bhsz8GDaN2M1wNR7FL2xKLuCLQPlaOLdVHDEMBatbarzUe95PLF+R
         PGcMaXOuKV5C/hNsANIhYKUuYjzEBfwSZZhawxqwGE6VcaSQ0xBqxUjy+uzFEzdWFJa8
         PYiMsrXBWT7baoLTHsbT4QEUIbjlCtOZMWAGYO10rBUSzcVUYG4yYJdB9q7WeHyKLUGD
         6lafK4ANiaVh3Y+SAtVrHUTplWNwzwOUEAbaFgkM0xFHoFfX/rbiVauAhHxZKcClMzfS
         oJDBR8WUz5DGbDl6fA30X94tfsPbKXXi/w+LWP+eQHukCg4BrV++Gp7tv5eDsbwk9Cor
         Ujqw==
X-Forwarded-Encrypted: i=1; AJvYcCX8F5Z8Xb2mMcR4kF62ZwBaL5E/CxKPNmPG3RpjpglIMfGKCMwPS5xjYKuA2jINCqzO6H+aok3AsWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrL+mKGtXtqu5qJUFoTL9HL/ELGMlrX1LvZt7rirPOM5ou9tew
	k2X9DlFjbvaTApbyYfxDjjJlTzCVvRhaxLHyzIaQmLImGP+A6LWVPa/6rg9EkpOih1Idg0vMFxz
	zPLlfNl74oSWmRtOG/cI5cQs6qXpITrbFHmrV+C0q7Duz5DhThCbJbrGHFFrGnyzYL3sn3GU=
X-Gm-Gg: ATEYQzx+14vjo+8Pt1K0EXEAoCTMON+1uq/M2lA9KZZ43Rcy91uOa8m8Y45Icet/ZUv
	VJ28ucS8e+5wVfTzoOQklZBgR/cKHAF3Llu6baJqVHCkeXGop6qTHp6OsbhEikRCqay7vSQDvK/
	jXud7Mxvh3hViJmfby8pyldNDe31MsfUFMvq70QIDjINWzTByQcjcR2ZpqcMwR/NtrDOfbRP00t
	KOumW9Cy44MgwXU48BCGQ/+7mIcLt+Ws6QRrcIrEuedk3baMongb8ycfvkqs9j1hADQgCquW+92
	kCt/9JHaFltr2SdDhpZEJ7CKuQPXqmilGQXgfkDmE8oqb8/stIaqkEAxOtEOoc3g1/ptb5I9Xpd
	in02lA+QUfHmpyhnbw0xWcXLguqavowKdqm1aRIExf66XL0xT48KYQipG1VsFE5+Fr0dcHjfpCU
	BzN50=
X-Received: by 2002:a05:620a:4709:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8d01c7e1cf5mr1572459685a.4.1774949620371;
        Tue, 31 Mar 2026 02:33:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4709:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8d01c7e1cf5mr1572457285a.4.1774949619932;
        Tue, 31 Mar 2026 02:33:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b72762eabsm3602840a12.4.2026.03.31.02.33.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:33:38 -0700 (PDT)
Message-ID: <a746be68-4f5d-4792-a896-bb693d029ea4@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 11:33:36 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: Constify qcom_cc_driver_data
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CBdKZajt6F0q8Jh3Kpn17OPOd8jTsxrX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5MSBTYWx0ZWRfXztsDHC/WRCn7
 0Iu59mbshUuHUUyKqBpVNJDgFdIt8OZG2gN924j4r8xMKMwhE4t+7oK3TEJordPbxDbCkcJbnUf
 LKm+7gJqd2GM1KpVHv2DwdeAU1PLag99irYYvzsjTTnyLJILlqdm7wsLBYD4AMgmny3H4ifFdoG
 94rW3TEsju0M34jI4xKJozGqfIBbDaeZ+mUhdhNVqfBJou8dLmlxyMpjHz0hX08VHiWF8fCSubr
 HyICQ0OexEkg6SNpiDjbVdy4Hbb5LWMXR9XyVTef5yJg7L/kst5wepnFlSORdL22a2ynDrRSgG8
 HSCvo+agVtcuiH5+RIwHVkXvp/94W8DV4XQDJJDxYzChY/m3f7axYFBSBH3Us2Xc7+/zOFh7N1s
 A0L/2lLHV502TI+Xt/wI+s2IWXhZ3exU5/mtzsgmw8K7Fd5mBJ4LlpmWF2zJ/VxOkG8nHgl+BtF
 D8YO7K9wiBY4dKJEBqA==
X-Authority-Analysis: v=2.4 cv=IswTsb/g c=1 sm=1 tr=0 ts=69cb94f5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=n83Ni56Gs3YPKE9ALmUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: CBdKZajt6F0q8Jh3Kpn17OPOd8jTsxrX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310091

On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_driver_data' contains probe match-like data
> and is not modified: neither by the driver defining it nor by common.c
> code using it.
> 
> Make it const for code safety and code readability.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

[...]

> --- a/drivers/clk/qcom/common.h
> +++ b/drivers/clk/qcom/common.h
> @@ -49,7 +49,7 @@ struct qcom_cc_desc {
>  	size_t num_icc_hws;
>  	unsigned int icc_first_node_id;
>  	bool use_rpm;
> -	struct qcom_cc_driver_data *driver_data;
> +	const struct qcom_cc_driver_data *driver_data;

This can be a const ptr to const data, even

Konrad
