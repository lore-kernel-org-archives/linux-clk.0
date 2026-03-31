Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132DD3CE4A4
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774947602; cv=none; b=umD7bKW0Fz11z2HC7gfmmSs0vrzeDJBi9gJtiaYvYoSLjSQO/GcII4KR9xd/TYzCKzUqWv/Q5grP2wsitg4PCt2DwQ46Qxg1/yQDFQFEf12U8mhRRKUGxNfryy7n1RRPeYZXYD79Ci4FJ6mgSFG1F6lau5kpNRSTcyRLQgrhNJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774947602; c=relaxed/simple;
	bh=Nw6CvUR4lBTq+KjmAXfNh9TloDcbkWqAc4JX3cArOOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=g57phAX6IeDoBz48ufplLDntZggyna7nLdLZlgqdGum8vZSQyFDL4dCyZ5Ak8idI2SQX0y26q464SAy75hlci5CodbHc5GinbDhGpI3C4TZxrFVA0mxm5FUvYLmFWSFOFN7cBbWOvGNu+UoJX7dyijA7MwKDyt3O7EB3W3GaxHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XGmo2eZP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EcNdnx1G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XGmo2eZP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EcNdnx1G"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V3Ftxt4013755
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+umjxZYh200XgoH8vUlqwPah+GLYkZTyQNf/mkkIb7c=; b=XGmo2eZPtkb2ZiVO
	S5g4n+UvjaNWH7wa6G2W+kFfuHbzHQe9u5SiA/3inNfwyA4HY7PVkPZNokQUxAoy
	IY8LbqMxmuTS0Y35gSdiuBb3S+jUmiGLqhKlgf9N9Bw0CA1aE3kdpw4Thw1cYAFu
	E4zyNp3sU57rxo7A7OQk30+kB14kGfKGld+aXHk5tYzKpHC1bSQYmNik62hR3UVo
	Bmyapy7EhUXWw6LpbzypwwpymBpUTdTFTdh+/acEAaGxcpeqETJTeS878WWigSbW
	wWKlE7SvB847dSV8dQh0EgTH6kfTnhXZXJH5XrD+zJj+sGdM5jWozJ5DaLL1/3Om
	b6JD2g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7regvf5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 08:59:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89ccb129547so19090266d6.0
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 01:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774947598; x=1775552398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+umjxZYh200XgoH8vUlqwPah+GLYkZTyQNf/mkkIb7c=;
        b=EcNdnx1G29TUlKyYRxImSB6o4UY1QuoZJmkwgIpNOJ96cQ1jdfKV9ABHewKRDw3IhG
         Omr5qo2GD54pJ3F0PWtuNDaEYmz2H4vT/+AWEbhYBpyKuiv5rkBl1v59/zAsvtnjxfwI
         /2rzbGZ6HzfnRIy1qxz3v9ivpf8wHMqfBLdEyTcTNQSqKRX19BYHT768Sgk6F1RSNpxo
         vFLtZVdmss84UYO6Osc1J9WmrEf3vNqVv9FfvBNUB75j2sB9NXjmLcJyYHNJADrJ5JqC
         Tyg/MOv8x5M2hyGxp99ejNG1yhoxr/M6fKbevR2nvCacy31dOsJxdGCMqy1jUiOzDMoF
         iFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774947598; x=1775552398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+umjxZYh200XgoH8vUlqwPah+GLYkZTyQNf/mkkIb7c=;
        b=igwZqWv4PIQ9Wgz1TLIQ7SfhJ30xMnHZdXYQVF7x3xlHl0te7LdhPmGXDC1Av0R02+
         4mEw3METCt7rPVx+NJpWGXcG5uC0iE89tMLj7n5x1hzrlSfyiJOGdZ7s780udKMeT8zW
         txDfQi9VQe2892rMQmYuKCZzRH9TwhwRGuUYTu5bz5wdObNm4gaKoyQAJhhUAn0cwRbN
         6NDZ2HwepwFdA6xqLPThWetAEt0hZldsrwKvHimU7ZT1Cf5G1ev4Dn2shIyc81aVpP5R
         6YtTWTtsuTSbWmX41vZumnWtKE6LGRLx7JD/YlajiyqZzJ0yZQeQIj9JTAF6pbEIxzVv
         9sQA==
X-Forwarded-Encrypted: i=1; AJvYcCWdmgQoiGVur77p/kGb3xQTLt5SSMWQesrk4wRGiRVsixtbnmyAHjLtZXYjyzR4zFoDb1R5s7WmTaU=@vger.kernel.org
X-Gm-Message-State: AOJu0YykyIJfcNxO+F1srcmM6fzHj9weUzAuz6iNKZBzN4LqoHFwCOL3
	/AOMnTkhqbV1pp7z/uXYVrd7jA/Jlewcvv+euki8xUmZbxPvLJgHIqAJ7LaBFWtZYRFI77LGJIh
	D7JhqJxUUFv8BSaNXaxjKxAFGKIBm8JbZaGI2hxZb4lxnpIBpfedSC4kY/L4MEjY=
X-Gm-Gg: ATEYQzyoIvqKJinCOXuU66gsF+i2QOakCXTxL+FFjYzjVTq6F1HhCCZWF3N/vKqFnZs
	ymu8epsES5vu0HMTfIBiiROUM2kObUzsoNPMgds96NbGAqODPUwo46y2ozvHVGoEWuIX2ODRbZz
	5g8UcE67unYiNqKPq/TIbivNQ83tZIknX6lbyZGWRXhEWiskDRQIqJnESWfXyaZBHvri+kyIbYo
	/iUnDFzc+KahVMveQ0f1cEa+kF3GwHv945PY6CLnkSd3ftYh40SqLRGpQcaVpL/PmaiAJ7H+ZN8
	EseVc5QRrPX0PyOyYCrfYh3FlaFuIRLYX85i4UU3ug54i/VVxxDZ0cKWx7nV+tWphaSBGBo/PMp
	5bLzvbBF9SD5O5i+v4gXx4CBi3qQ1n/TO3eSb4OgnUb0wBwGPtWzdRJG45P9Xgug1ASSDN7OhOP
	x3AoY=
X-Received: by 2002:a05:6214:1944:b0:89c:d5f4:7b34 with SMTP id 6a1803df08f44-89ce8f10875mr171583686d6.4.1774947598310;
        Tue, 31 Mar 2026 01:59:58 -0700 (PDT)
X-Received: by 2002:a05:6214:1944:b0:89c:d5f4:7b34 with SMTP id 6a1803df08f44-89ce8f10875mr171583606d6.4.1774947597929;
        Tue, 31 Mar 2026 01:59:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1e33c0sm374730466b.49.2026.03.31.01.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 01:59:57 -0700 (PDT)
Message-ID: <ecd73358-70ee-4ddc-ab99-aecdf084c172@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:59:55 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: videocc-glymur: Constify qcom_cc_desc
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331085521.37337-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331085521.37337-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G6wR0tk5 c=1 sm=1 tr=0 ts=69cb8d0f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=lg0sPl1ZFXo_qoqoLA4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NSBTYWx0ZWRfX3HjW3XDf2lYe
 ZsgI7l9+BcsOAjoEoWnlSvl28W/4EHG6EBTbTke5sI91zyds2JLcCrxYfh95GGnj2f8CSK6ZrVl
 rAowStipR+rE7fgrYRKBa7tUi3pwczjeR5VhGChef+jq/j3ZsFgoslnuMkL42/x9rSP3v7Saqu/
 eEO3WbtGUCnTc+x7t/a4+KEEOKGErS/uE8Bg/Qn+HuRv8AsdsLpXw54dcXFG/XHLBW8FiEt4nPp
 tBmU17WsoKjOBu8eXDLrA/wHlTZfkDwlVKeeY3DzWxHjV1ouP1z1U6z5gqSwlpL6+Rg6ODP47ZQ
 eVqcqb78uTUWbxFkWDJLZgRwktUfx4/iy+IZbKxT8HKig6mPwl8krDgx4Z0tYxtfX4+Yod1SR1E
 cUOLALbDMyJWYtV6eSIV+/LgOdLtExmTwyCxzYlOA3IZIR5LRJX7x/Y3lUCAHKcM263QBbK2Lpv
 XIX6oOQzBuGWSDrU91A==
X-Proofpoint-ORIG-GUID: __5lIrkq7psEpDKoD4vMv_gN-D7DSSu-
X-Proofpoint-GUID: __5lIrkq7psEpDKoD4vMv_gN-D7DSSu-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310085

On 3/31/26 10:55 AM, Krzysztof Kozlowski wrote:
> Static 'struct qcom_cc_desc' is not modified by drivers and can be made
> const for code safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

> Drivers for SM8750 video cc had the same issue. It would be nice if new
> code is being built on top of UPSTREAM code, not downstream.
> ---

You're free to contribute to the internal template that these drivers are
based on

Konrad
