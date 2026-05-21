Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0822D7DF1
	for <linux-clk@vger.kernel.org>; Thu, 21 May 2026 09:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357318; cv=none; b=RCVboH/LVAWnW2ogh+7o0OlxvHANuz76vJO4/YhzZYeI1JrxRT5tzn+B5bzo0Flit2gz+kVlsu9Fu3ZHnKkVoQtKIeTQRV+1EDnvRqwn5tZqjOYEI5oWC5cQC90FSOD4932bSRER3EqgASDDuBr0ft8ongZFji5TXLN/zxj7bto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357318; c=relaxed/simple;
	bh=acZGlIX+KXcHtOOGMD6pjNe+wuSPLmh6mZ6H9ohkhfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pft8LmUKf4DNQVH1nO9oQtBFeDDkjyT35bJ6m5ntBo61KFKp8ZZVheJbMwf8iTEmf1W2QV/3zrpOQNyXnD6hufQQ8ZHkkd5UNdqOoTkZvtCA+W6RgZi8Z+amyUW5aDlkNn8WfJjpaSvNMrk1ZSs4nU86BAWZ0hqpgIg6NKyCD4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R+Fh9Dyq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qlzcn1H2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R+Fh9Dyq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qlzcn1H2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AKgh620413
	for <linux-clk@vger.kernel.org>; Thu, 21 May 2026 09:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0j+pvHdvitas62dgDJHr1H+ijvn6S0ZrLgrBvSkCvG0=; b=R+Fh9DyqwH8ZNOp/
	4W25sBa2l0kCVUiDGgjTbmtXW4TWg8h3xo45PGjIvvZVsQ04nKGTVlNqDfVixU+d
	7jeX8pjDNKqTtyP+lq+vIgyHsOZmmkq+PO/W5qsALm5B4G9AWQwJfNDbzitNw/sK
	jfTC2B2IU7xtD6uYHhTNpBmN8W8VYUB6IAqd/ZCtsqhPr4H5sB7V7ggZK1YgBFW4
	ovWoF7X9z1TtRF/GCJcWrJI+2I2oMNjUP4UfcfqJEPCcavp6vhjLWlfhW8KCUUXe
	p85oPd6ErvEdQ2YNzd3iWNm+8DOUBDC4si67JuLQf0JnWlfIvMnY59GJMt3mVx4O
	iZ9kaQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu4cwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 21 May 2026 09:55:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d9f1bccd7so15312841cf.1
        for <linux-clk@vger.kernel.org>; Thu, 21 May 2026 02:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779357316; x=1779962116; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0j+pvHdvitas62dgDJHr1H+ijvn6S0ZrLgrBvSkCvG0=;
        b=Qlzcn1H2DqmeW10Hj0jY7xDlCEyo9mlKDlkjknh3nuHPWxpGW2oURn4kaNLW7CHJL6
         ogM8arz+A6tl8D2tfhDhHi2N4ImoVhzBCCD40BdTXZvUcRAd7Pw/vQymrSdLqZhHNTYP
         l0JjGUKa+Imv8EzonmnSLRPT4UnKQeZSNjP8peB6GCSrVdC61f21o4JK9H6zmMP1gZTh
         KFHQTmv2gqQhyAsqlPUMSPzGGWxcLmxwJY4mRCWfe0yFczCaOsUqneGCj8qf5buZaUPs
         WhkfOpeF2ab1a+Vu/rUw9teDACfHp+WQ7F3afKDQh4qhaVMgJQDdVe3U3zJq84r9ma6z
         UGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779357316; x=1779962116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0j+pvHdvitas62dgDJHr1H+ijvn6S0ZrLgrBvSkCvG0=;
        b=kwmvjgWXr/AFy4ZKlD1JBTvSr0pzt9AtBmABWnAIBWVfb5F1U04sqg5dMq3h55I/X7
         YKWcsdp9qw5MfommcFZZpIAeePza4T4eLe0EYWDL9qL5wwvzFDBID9/wL73VR/0aoJ7A
         /eakTrdJp/gAK/EjH4pqMynwkCHvHnsXwQeIbgBBRBRcFfjfjjMNPhgR9dDo9K94h2Cl
         SX18UFxkjBfYfj8zrDX3sTSkuL4t5ph8g56ZPKiRWZPnHGorli83Ki3OYQ+FwYLI1EyZ
         YfwynB1AidEG4jD7/K2ZvAhLPIs+Y1l1IM1rKzqrSby+GVGnjvT6YrfBdJBx0R2STSWd
         L1WA==
X-Forwarded-Encrypted: i=1; AFNElJ80J/Wyds8kcRMwundb/4v+k4S470ekGmpHhqYYynEICsXDwJJD+BrKvr5e59L/IDnDvUU1DjALZhM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA0vlfDq1ycAepHOV9pAF62YHQI4RYH/RQ0bwTeLP8lQOnqkK9
	7O5OaXa+p9LplIFTAsnLH9mjTl0KgwwUgk7283I3M1+QcULdOh5kV1eQF1lX2nF7vrZozM1/iPz
	VmAiUUqHcARnG6ZnssIR5pViJtygjYiaHEQdyg8seHQHh9SEy+F3v0OtvodCkaFxVHOHOvog=
X-Gm-Gg: Acq92OEyIJ3Hy4uMeixmKvD/v9C8r4/hZbcAWnYFkA4WL6cBX253y4AkNqM9gwNfCuG
	mB+5hrG90FJmJyW0yd2BFNe9oJsNOWMb0gAoCXLr04Kg6Z9AfsBXGl/iaY6i8p5Fcm4Yuogt+ia
	b7vWTOX8Mu+bzcdunL3x9M4EBcnBnt4yMxz9aC67lq4shbhtLnyrcy+lubblitqWhdTjUHrEpB8
	tu5058kcaYHoNS4He7a99zqTUG3GdqnkcWdsnD8lkpGWb63wqbmPpXZ32UDgBgDfbGrIPKYpjkv
	hw3W2i+wSwnMTd6J6LPGubcaypc5FD9EzKMlRuiXn0PWaBtNNOyPnh9ua98tMC0VLrgjpoAaECe
	edVB1sXA/760MkZmGRJ9PANoLZQPts0wlfSh4qekq/sj0vfmt0gXHfCy7EqKZ79HVMOOvFh7hQz
	hmUao=
X-Received: by 2002:a05:622a:607:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-516c550fa2bmr18614911cf.2.1779357315583;
        Thu, 21 May 2026 02:55:15 -0700 (PDT)
X-Received: by 2002:a05:622a:607:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-516c550fa2bmr18614691cf.2.1779357315109;
        Thu, 21 May 2026 02:55:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc878912e9sm25044766b.1.2026.05.21.02.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:55:14 -0700 (PDT)
Message-ID: <b8ca632c-310c-4647-b91d-0514feb50fa6@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:55:12 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: stop enforcing INTERCONNECT_CLK dependency for
 everybody
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260517-qcom-clk-icc-v1-1-1dc6ea8bdcd0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260517-qcom-clk-icc-v1-1-1dc6ea8bdcd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5OCBTYWx0ZWRfXzc/ehPmQwn6o
 YhbdnWk5crJ0J9cwCv/5PJyUZmCY4v8MljeIHHhlLGAbNEfxtQkVAFx026r8Q6z8uGPkohLRAIr
 fmLfPhq51Yl9+cqpoR8EuFFY/LKmT+UI9245t8j3dNrsT7j+lmZ0rlPKEjjCcfw3xfcmP9411hM
 G8YKSkN5DE3xNklhqTHYrncl9TlRHopm+vlOIxRABBfDKtYsICQYaRuzN8GyTBHAcka6xiJq3eC
 Mls1I392OSvZro6/7xP7uVsBb8+TitUxjBsNTPgbkw83Vv2riJF481NZR09eQVaN9As6K5LN9Lf
 STEyu55NqRQoUPCJolQcLdCetmsC9ldwBZ+YshPMYc3L7noW9MY0lYOlf+cLbQ/LD5CRzd0gg7g
 7HRXumjmArrDBHhczg2U2rRfO5tvZYGq7Q9rb14bUasjxKtwcsL9z44PlXL6mKvh52qp6dlUeFD
 CGZAOX30qtwJFMW/BoQ==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0ed684 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=EUmBB4W1OTKWQytM8RYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: YVAvkBlYp85E8kFRaJ_c8GxsWj-NlpSl
X-Proofpoint-ORIG-GUID: YVAvkBlYp85E8kFRaJ_c8GxsWj-NlpSl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210098

On 5/17/26 8:51 PM, Dmitry Baryshkov wrote:
> Only several (typically IPQ) platforms use INTERCONNECT_CLK to turn
> clocks into the interconnect providers. Stop inferring this dependency
> on everybody and set it only when required. As a safety measure, make
> sure that the coresponding clock description fields are not available if
> corresponding Kconfig option isn't enabled.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> @@ -395,6 +399,7 @@ config IPQ_GCC_5210
>  config IPQ_GCC_5332
>  	tristate "IPQ5332 Global Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> +	select QCOM_NEED_INTERCONNECT_CLK
>  	help
>  	  Support for the global clock controller on ipq5332 devices.
>  	  Say Y if you want to use peripheral devices such as UART, SPI,

There's a number of entries where there's spaces instead of tabs,
Krzysztof fixed that up for interconnect earlier today

[...]

> +#if IS_REACHABLE(CONFIG_INTERCONNECT_CLK)
>  	const struct qcom_icc_hws_data *icc_hws;
>  	size_t num_icc_hws;
> +#endif
>  	unsigned int icc_first_node_id;

this uint is also only present in drivers that use icc-clk

Konrad
