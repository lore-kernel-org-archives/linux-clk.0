Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9EB477983
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 12:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847507; cv=none; b=rcRgrRgKvjwfTs7N8Vynz2gKNBTynJwyKbJaipryFTjVXgggQC9oN7LnoaQNmxdOEXmaIWJi4d3frd5piQbSrJr7uzbayNI+CAwLHJZA8TsiO/Pbu7ToKl5EInNFVdds5LyIL92qzB7CZRl8C2cG6d5YPxT27LeqxhbiwmxJcbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847507; c=relaxed/simple;
	bh=Y92+NnwPShhzJLFZjXBc2z1/q5TAn4x/wrrX1Jcu5MU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DO/Lp7vCb2+PfFETI9p7UCaNqs0Bdd5LcOjIbfmcVcG9OIoqNnu9TsNTP9M/iQ/l7frSo7SGdxr5Zmlen5Ww1ldqmo1agW5IWE+sC0yH7LBgwrb/tfIyZjjjIRIDxCYdvrPAGvUIdwdje0ykiEYeLzRhnC+F/jOSvTC3rBjZrXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9kSmNEI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XrSkcPny; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9kSmNEI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XrSkcPny"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBN3WD4008229
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 12:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KksamNBaqVa2U64cjQ0a6DqxRRIwuhExB7Te5BU47lA=; b=d9kSmNEIqnh+MK2b
	YJSUbbcESvpM/dgfpOAgRFml+eYXTlYwIhudBwiT9zeJU93fAkrHa0qi2m8WKuhS
	e1zFWYXUSRt+87o5FgLxzBK0XvRuMqJzd2mwuX5iW2C4BIh02Ev3hOiL+kjbWcj9
	Bkun37qMYv4nPn72PvkZ7x/8ZJf0AA+au7s5BI8biFZYjX+6VLbMAcYsLBkKy4Pm
	qmjvwpsxHc4QG0f8H7/lkm7F21Evh4z6H233gkBOLmSBO+ViOUuvAa0252OtfNAW
	WiOvUOngnbdgOoP740Pol/oEXTCvQlu1ulh0DPTqhDHXNnhYxcPZVJ3wIcXYWGJH
	UYAWLg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1su76p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 12:18:24 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ff9e60dd65so698822137.3
        for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 05:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778847504; x=1779452304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KksamNBaqVa2U64cjQ0a6DqxRRIwuhExB7Te5BU47lA=;
        b=XrSkcPnyQIAVH3K7lYrhjPpbstcXOawOF4Wz06yZMksiUACMKDIPXDZfcJponIQ0Y4
         BHyBzUEsQ0J+sa5hqwJDq4t4SEiVpJc1VbFbyQXDEEHy7nmOYwTukH4MC9jtN2K1HbiN
         1CBlcJn8xFnzNv+G5lKS899YrxoC0ZTIW1LRUFVoT1Rg9V/dASB3EQXUIfkLfd1L52MO
         VEXQP6wbduoKbRYQsF+pogmnQjDNNqQjACEgAh2I2da+pqX2j1egX7ZgPiryrYrTHCN+
         FB0ugOzacM24XGB7RyQtCY2I2LLMUFScRDgAsGlNZyy7w9S+3YViKIji4LGLFmlkgD+Y
         HBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847504; x=1779452304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KksamNBaqVa2U64cjQ0a6DqxRRIwuhExB7Te5BU47lA=;
        b=Pnrab/AGz6yLnIDsH0TOOGYv9xi6ZCpRhxB0v/viT5j+WcQo/ufGgIwbntZ2RjV+++
         pZdw0qui8HXvn3bQE9Tmj7+zei0XCjpzn+oSJdE483JqaG3TSAJPF2GfmJD8Ip/oM1Zg
         wr7CPbT/gDKGJ62VqtbYCJMY+0YyZgd8QgkdnQN0YoNyY10wb3SoEKqwXZJLsNm6B/BT
         TZzS9heyzZ0VYZ7H3AX8A8tqaTkNy+TNUH/gnO1NwRH49ohy+xEgSjNw5hL2usELatOd
         AiDxCTC4vHo6398R8IYq/xKXX1QCIcJ5CS1kHlLMhVMXGkIEAnEEYH+07xOQhq69Ca2Z
         nvxw==
X-Forwarded-Encrypted: i=1; AFNElJ8rJhdIzO/qUrwWxHJqFjklNSHmgqcfJiN+TOjaXVWuTI6i+HoWrbnaHIy8Qkn1OwO0hBaXJSyuKmI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2gWuXOZzlIIQIHnGn4jfKhJlEwTlkZvOlj0ueQvS1uKkD0HLg
	cL6KPZOiNdempii4pyvS747xWs9xO8OifvCGoSZslu/Ct42ewHlDbQta9Rbnjuo/hwJIkUMV+A/
	dJ2CUaylTdqXEhsqorCZyR7Z7oRPJ1kKZloQoQuf9Ab1a+LGd4+QqLtoCgfCpjAU=
X-Gm-Gg: Acq92OEJXYTAKE3rfaIWuhjwVtL9M/Ac/Y/zSJkj3SHXF54rzdkUOoHa8ejjKpYgHUG
	OIUfCkmDMi6CMXl+YHp5kdR0LI909LO+dbIH4z+Fjbmzqg4YdWjRFjbsVSefRxIwxq2z4bZeyPU
	+ygVxyjdt2tf0r86OiMl5BRAerWU3SRmN9AiclBVCwkkWKeszSPGP8AosljzVU/oFcc0VjgRoAP
	o+ymMA7phupUWweyJPqMxpAkcEfWeH4mkfoZG47jKeJOphxlXyrgxHPmMFxqohsWotDN5gRBPkw
	YBKC2BOUv4jGUr0gL7AZOgoGIyoERWi/3+NLi0KmdmVDMSyMc68/ACs3/WZyc5ZJvy738IHHvsC
	LonHZneVcvoue9DwuJpXT/rOSEPNqfbfNOkKazjHiAvs+tzdUSGqqvhuxFT5XunJQtsAO0e7NZE
	L0qus=
X-Received: by 2002:a05:6102:5092:b0:632:c8af:8a8c with SMTP id ada2fe7eead31-63a3ca193e6mr690365137.2.1778847504235;
        Fri, 15 May 2026 05:18:24 -0700 (PDT)
X-Received: by 2002:a05:6102:5092:b0:632:c8af:8a8c with SMTP id ada2fe7eead31-63a3ca193e6mr690344137.2.1778847503791;
        Fri, 15 May 2026 05:18:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4ec6548sm219253466b.62.2026.05.15.05.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 05:18:22 -0700 (PDT)
Message-ID: <f7800c43-011d-4133-8717-9134f5ed2c15@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:18:21 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: qrb4210-rb2: enable venus device
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
 <20260515-iris-sm6115-v2-4-2ab75229de61@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sm6115-v2-4-2ab75229de61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Vla_B87WbUmtDf3FysiNOZTPjKo8Sokx
X-Proofpoint-GUID: Vla_B87WbUmtDf3FysiNOZTPjKo8Sokx
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a070f10 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7yNcMj-pRB2AcvHbL8oA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyNCBTYWx0ZWRfX4Lp2J9tKOLjf
 X9N2+tD8Pm82KbPt2UOJA6qVOyFB2E8ID0w5ZNWSw7kaj+iKhTkUgW/0K/AD+I8Edo7gViQyRnw
 2llfaigaN1vWxV46lBUOs8wHiY/9rrnCFVd5gZNCWxlHxOyCWLsrZ1hBO8fCcEemIHrp5lgC6MZ
 dfelKKboFT9w+lo7N3/thvckhwYdyyc+eG4bKsj9YpqpOJlACdmXFlYCcl6GrWk3XJZMZBcNfsc
 ac+9REXBg3xsJDqBOW99kd3/JenHpcua2kIpuYUDcXiZSq//idFKgk4LBgPJa0VJ2xjdIT0KIv6
 FTOZv1O8UUxpxU+0Cgy8RxttVyutEtsXhajpP/c0UmkTTKIN2zTssdTeZJ3aWUBwwlDJFB8tUdp
 S41B3FQJarXPVsaQnN27s7xMgG5fCKbeuM/I3rkwwEwRD/MwIYMdjrM/W0lUccG9xT4AVywOsFh
 FNakFK1CMtMDhJ3zBAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150124

On 5/15/26 1:59 PM, Dmitry Baryshkov wrote:
> Enable the Venus en/decoding device on the Qualcomm RB2 board. The HFI
> Gen2 firmware for AR50Lt platforms doesn't work on RB2, so fix the
> firmware in the DT for now.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
