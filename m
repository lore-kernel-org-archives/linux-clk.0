Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5C31B87E8
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 09:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757582870; cv=none; b=W+LYi1RaFk64A3D196wxPMrMAg51JAVvX6p9Ly1k/+dByv6LchgQnKfxBh/zdTjHB/CutiFJGa/DPa0BK3SSSRxa7LQ8SusmJbX1nbh+YuSejZHJPv3RATZvEMsb5a7figP69Z/ICMG31JIowcE8+bFSSASzlCvpXg/iPwM6KNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757582870; c=relaxed/simple;
	bh=m6pAp4M4VuJGO/7ZNH55C6eth/+eqyqKCY5NaSTNUY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=udzeV8IIyYUOUkkJPx7j5uiYe0Pn6E6E4QoS5XbTBIzYvK96OasolGCtgotQmqUq/En2BvDdGHr5a2P/2SsWSX5K7XH7tT4sgkdfEWK27bik3X23aWm/GF6eCeVhiiUY/EjmORW+x0TG7MSKObjYDqd3dWctMiwM/cBSE1T9yeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I10uxBEg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I10uxBEg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B4k2A2018851
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 09:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+XjtRX9W7ekp3Y8Qr02gly2tUmdnuvJNT6c8/8CmoGI=; b=I10uxBEgEFiXRN/U
	Z9NZoHD9A6LRgybL+gVVDYxybbg6lIE+oB4CYsaaucLeceVuc6PcAT/s1y2QJDYl
	RtjypXrhbHMFppsaQMRsIfvUjeAU8SrwTx4ZifBqnpM438FcPDr3SeX/nX6qUZtl
	Guj7ENTrOBKWdXfRvmDhepADts6EI3mdti0r5aVftTdWjPJqWCKDOgEX3rsDKCpK
	jTvd3+EsEMHJrqL3GSZUxrPOB3rUAMs7RTJbYRM/GMRJMZ7pwQSGnF0tMzOXbU3X
	Ur7lu4zwOHgcxWY9V/dr/JSzmfX03WQY2SIs+zjWcJHPffsGrdWPO4G1KTai/O1m
	ZNJ7eQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493qphrtbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 09:27:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b6027bf032so850891cf.2
        for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 02:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757582867; x=1758187667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+XjtRX9W7ekp3Y8Qr02gly2tUmdnuvJNT6c8/8CmoGI=;
        b=offZJ5+We/3YIAyzD7PedgY2rw0rIbpbZK12RZLEik35liV5lSHDPq5KXSP1Utkdf2
         dg0a3h4ezvVBw3NlF8KgVnTh0KEJuPv0F6x/LyBld+QgkBBnJ3KYs+aSVTiXt2oE3K6D
         rbgz/8mKy9+eMaS3myweydrGJJ2WcDLgHC14MK7dvkrX3vw+g8VObu8PJMaN2+q/EAb1
         dE/A5IhhQ1V3qYARRPixfo5VPGXijw4xxtO9fPfeo2+c1yILncXTyTSSYHVDnkZRjDOa
         Gl50twpqOwb6Gw3nZpuQtQd2xb3YOt8XZ7DpY4dCsFvvKM5NxTVY2SMPObw47/qhrO4O
         QikQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfjlqUyd7D981HxJcL4BEuEns9/C/eMKOaMvNSaFTm3zSBDEyxBgWjapuHGa7LTNxgU2HCvVsQo1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzKFeNovyhB/XziJbivjcAWeQkleGTokkxmapwCIZ39XSTLz1E
	9O8nTma2mCE2SyrAbWdAAKjG9sPT66Gp8ZAzRV95Py/I+2oMN2zcui9y1UQDt79gbuAIepb/gDu
	gKdqhIqSXvt1CwNuMXJ4iwnqofYD5N72g+3IRWe7rfJR6Ss5Bqv5xXokFR9V8XEc=
X-Gm-Gg: ASbGncviFkhsDvPGw3FhrCevLTV0UIFXJ5OtScC2pxc0WunKyyw2D0C+hbZycwTb0Aq
	9aTPHY4Q29aIU5aRnDf8JOU9b1zefMCunSDSlq7Qv+KACPLqCbrPNTsyx4XP0anpLMSfLp6MFi+
	fdhlTZZbnPrxHM+NtfuNZ/j5xSNx3iUd3TF6WQeCizDXL8M9t+cxUg4W4+xe7nm/vsaRqqBqdK4
	QX7+C24ndVnMqwdQsX5IYopBr1RGtVYy0hbMapIF9htvQ75WDPizmBN4Ab8vbAfg5oZeFVWG/PS
	896TZ13UZGaEXqR8/9+CAsb0TMbMNVhak1MkUPLwk4yYt4tAzv2yGXxv/lxm/aJcXLIGF6xFc8R
	sOKtKK+WLgYq4/6cyWpZPIw==
X-Received: by 2002:a05:622a:350:b0:4b5:eb40:b1c4 with SMTP id d75a77b69052e-4b5f842e182mr152502121cf.10.1757582866683;
        Thu, 11 Sep 2025 02:27:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE849UrKSKJjqhI05tzu70gw0sAz2sb0i++Amqc98Bmj5mWMe6WA/bB3YZXeJj0zWPqM2katA==
X-Received: by 2002:a05:622a:350:b0:4b5:eb40:b1c4 with SMTP id d75a77b69052e-4b5f842e182mr152501941cf.10.1757582866128;
        Thu, 11 Sep 2025 02:27:46 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b31715fdsm91195866b.49.2025.09.11.02.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 02:27:45 -0700 (PDT)
Message-ID: <01ec7a6c-d258-4382-b689-a64a29f7e94a@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 11:27:43 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] clk: qcom: camcc-sm6350: Specify Titan GDSC power
 domain as a parent to other
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <20250911011218.861322-3-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250911011218.861322-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aPDwqa9m c=1 sm=1 tr=0 ts=68c29613 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=LDDDIuMr0XRAt-0CmwQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: jAPysiuJH_aj2T8kTtVMHT0Oj9Hdvl4D
X-Proofpoint-ORIG-GUID: jAPysiuJH_aj2T8kTtVMHT0Oj9Hdvl4D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA0MCBTYWx0ZWRfX5d50fWwX2svl
 oZ55jWImy2iK3SkhfO1gl1RTtrcmMpo0Os9AWTX+J/HmBSJYpfTMIxx5SxJ3FMf3Q1hkgWF2vaM
 xd0ti2Al0RtihF0xVhRYbIhnBMFyGYLTXdmsjc6uRQ1XzjfbhGkqnqbGYnsmaktwhZ6y0ri0kzG
 vJcnFW6TpEtKK10dNje/4+zgbTeqAbsCiAKMeZDeCsneNMI+NZuMV/DpIji6IVRE0AolGRkYwH7
 HjE/hzDw6fO8kggfAjncO5JHpmIEo86H2ln6HKBMjoYtU7f7hO7nNdfPx433dcmRq+fav7t2iXi
 8ycVfy2bbVUME7KHZrgTCaUV518m8rq2sdPfF91i4W6gVfT2/ElUYh5JCCLXvmcMC8t73XSSESV
 oudJpMKd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509110040

On 9/11/25 3:12 AM, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SM6350 camera clock controller to enforce a correct
> sequence of enabling and disabling power domains by the consumers.
> 
> Fixes: 80f5451d9a7c ("clk: qcom: Add camera clock controller driver for SM6350")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
