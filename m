Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C4F27D771
	for <linux-clk@vger.kernel.org>; Tue,  2 Sep 2025 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756807857; cv=none; b=avMPvVX4hjfTDj4nKL782RBeDxq0e3ZvLqLFSRFlC+hfhVEW82wcA7v9yty+8OubQs21ewHL95Kq3Mvo+3C4DZO7msfzd1M0zgBf9S8BmCv37mtfodyhuduxsQk6d2v6vHBlUd0gk7LExsabcOlOSoIc9Wrf7I+m6XYRCZ+MjhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756807857; c=relaxed/simple;
	bh=uQRbZpMZzS7UYewybYgEDAYd6OeeZC4wMAAbwE42GwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rO+iulO1KfHaVk9Vpo+Wgz9ebzkZYtWI9FO+sqDpsfry2fmYVJOZqsrs+Ocw6JcFfxmTEjyV5cr+mtRNbwfuaKsgh3GywzEoVD1J0Cp9mBbq/kb/7X9YoBIOXp13BP6kS8aODAWQa2A7BXbFNd2pevr8yRgckjgnLseqX41nALc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XhwSZYx1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XhwSZYx1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822SuZZ016548
	for <linux-clk@vger.kernel.org>; Tue, 2 Sep 2025 10:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	THYxMAXcq3NlTG1/1Gxwv/IFrQP4eSDyIsfIRZHUUKg=; b=XhwSZYx1QCW5reF6
	LbAAnpn1ls2qOpFm35u+EM53VOPIEx/4PSSm9TFFi3G4YRioKHDpDmA/DRpuXfjA
	K7y33/f9OvhcYb7/7pVednZgXTe0bZtDqTtSXFYpDLtyHXBwfdaRXzT4bicKRtPD
	3ln/yIOaawRA3iQHSjUF5ckXl0ALN+4i2GZNcxQl8Q1PToazSxA4Ve7TTtfzMlSM
	xJDJ+eazKfkM/nbSJ7HVkGpW3iyaeCgKEqfPYbaKswOYh/ZColeG9dw16Ln/MjQV
	QsopGXLxJWTvedAO6Ow+rOdmqTIHoMluNHGolD0K92515oDRQXfPZDWWBePv7HD/
	wjfvXA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urvyydx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 02 Sep 2025 10:10:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b32eddd8a6so5411901cf.2
        for <linux-clk@vger.kernel.org>; Tue, 02 Sep 2025 03:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756807854; x=1757412654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=THYxMAXcq3NlTG1/1Gxwv/IFrQP4eSDyIsfIRZHUUKg=;
        b=t/HVRkMcF5IM+ROPZ7SMFaHvONogAcRl7SIEbjqqWEw1CMA7bJUHHMIYKxUhx52GSB
         IJKYd+Ek6BUdNWRC7iP3qZaeFBk/th9x/SdX9GXQR1QE5iZnFpquz/KC8KyjY6ZtrBTH
         QYXuyc62r5gsRATu0msk3IVvDVJK5PcZJRfesGrIvCF8LaZ1PINFIolAbgB11mY+MMJ2
         pi0Y5cUDbr6Vk+5R1LO7lKA0zA4gL93J+StPrIMCv+uLg9ClLUm/1i2Un+i3/QP5aqo0
         Y3lD+nC+vEjwFWnQOBTF4DxVm9tHNUsMh6BrzVb/XkZM1lzm4H959NAfyYW4YrWmW8eB
         NXVg==
X-Forwarded-Encrypted: i=1; AJvYcCU/6GEPK6bOcfRlkPzx9KIa7v6F8uFvcPDws2KzR6WmxmMTxQk9GU3EJCofQShUeUPAkVyuAoWVO40=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKClB7q6mQW1gzi17/yqnRh/YAL0tc5i/4Yhba8dkPFPWjB3Kl
	dtvp6bqdCBRg7lTFn2OzHZy2kQz7KBUKhjPOPoG/JiXfX+BHvajkTuQskLGJbXlk1tg1cdJ+puP
	J3EmcY2ra1ID4JcEZ8UovfZlvJEJIu7uMrd1HDWhZABmKKq21OEwBGeWaVAcXyIk=
X-Gm-Gg: ASbGncuX5EF46cGMSUwW6U/I+kJUwn6tpg/0nyNsLvsSxS9zrwux+OGZEAFrsDAQ1nQ
	SQqvMDz7+8Jh8TJ2BGDs90SNUsBpzk73VOuIoxt9MYYWYXATwI+OlYYoACSArgAk1MnhTqdrdfh
	oHrfd4lZ1EPrZu+ytVIKNJ+NoaKs2vqAIZqGfhfquCUVO+kGBLBb5w+tgNortjbfee2ijP/VlhR
	sR1nb5S0Q+47tsieg8KfrZ1dGDABHNzaQvHsAlo+ZijpKbhOrIvbCn3BnfWORfmFSHvm1pJ63ij
	DPHpkIpJ+48i9pe1O04qjI2XQvuYc+R83jL2Mq5QrBW1/w3FsUjxqzw2hbjyhHBC7A6JBmgWIaT
	ELoOLIUFgbGekBTTyHQZqig==
X-Received: by 2002:a05:6214:252f:b0:70d:fda9:8118 with SMTP id 6a1803df08f44-70fa1e37ac5mr90373126d6.3.1756807854233;
        Tue, 02 Sep 2025 03:10:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXA1MX+R32DY7z70Jxh6Fma+swPbMAM/TxTka9ZiM1Mii2YSXZKJfvdjD4E/i8Haz2dDeEoA==
X-Received: by 2002:a05:6214:252f:b0:70d:fda9:8118 with SMTP id 6a1803df08f44-70fa1e37ac5mr90372936d6.3.1756807853750;
        Tue, 02 Sep 2025 03:10:53 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c7a8fsm9210260a12.3.2025.09.02.03.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 03:10:53 -0700 (PDT)
Message-ID: <f65d7789-198b-43d9-8d2f-eed87c32a984@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 12:10:51 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: common: Fix NULL vs IS_ERR() check in
 qcom_cc_icc_register()
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <aLaPwL2gFS85WsfD@stanley.mountain>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aLaPwL2gFS85WsfD@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zMbiCJ-gQZ53RtC74pxgLbiy_x239SwT
X-Proofpoint-ORIG-GUID: zMbiCJ-gQZ53RtC74pxgLbiy_x239SwT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX/mUrH75KdGO3
 0reo6foRfkOG4jGQTkAsHqHT+ZElyUykYjjPRVzfkT7uc80sOTpY4UIUAjghS/xOoekc06GF27Q
 vzR5Ojd2dIhUr0ugixBH5veU/vTGcU+/qbSeVq9/hqFGh40Q4Qq4PZq1Bofp9zbQUGQWB6Lm7Yq
 CSSWowQ56/nMkf7f1Jstqtoji/V/gAANbFiL4/zZRH9U2M2IU7zpvBkijvWsurwj2elnH4S7roK
 jLXMbgbkmF6JWakN9MPs1MV8NVDKJ91n2xHVP1A1R86O81CHYzLli1ghrt4z6iTqO2P3+XrinEb
 JbN0JpG34QJyKgMShGu/dOW+bWQX5Bq+rpKmp14TnLl6mYJLabzd9kCxz99y0F7saRkS2LxkDYp
 SbMMBRL1
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b6c2af cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=8T--ygq334zCgzS6G-IA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On 9/2/25 8:33 AM, Dan Carpenter wrote:
> The devm_clk_hw_get_clk() function doesn't return NULL, it returns error
> pointers.  Update the checking to match.
> 
> Fixes: 8737ec830ee3 ("clk: qcom: common: Add interconnect clocks support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
