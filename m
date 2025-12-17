Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15B331D366
	for <linux-clk@vger.kernel.org>; Wed, 17 Dec 2025 13:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765977789; cv=none; b=NeZJlbdgkee5RWhPFRlpzIMcxFHAhjN8mH1wAq/gdlLWOTP0KuDJKCPv3hZ+jNpUwYj5SEWtGPDHRr98XFd/MzG+yvJ0HA/bEWZRnKCTCzmacjmlnt2xJrrQUIgV6Ug/fhE/u45NEP0dz7q9Jm73Du1NwRFkhnNnbEvtbhmlU2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765977789; c=relaxed/simple;
	bh=Zlc0vBXqq0Irlne4XboZzabyObkVAwR0n1DevPWYfaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p8Wwc56c1nLEY4GUdh10yWjIZbFe/ovvfrsjA4tE1XcCYlxUkvjWmpPEaLSRj+1rA5pFOAap50Sq8gDNBnWAaPye/3LjsKJPrltVfHoMQyuWeFCZYY0sB9V/wD8sKfwU+vxNMpJrTdYKi9Ktq4grtZnrnH2dUx4ohuVIqpuCQRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vh0VhrlR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NoTWZZBM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vh0VhrlR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NoTWZZBM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKuTY2764479
	for <linux-clk@vger.kernel.org>; Wed, 17 Dec 2025 13:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bs68MhyXjy7fggb+VYhXusf+j0KV8hvgnqpT+o0xydA=; b=Vh0VhrlRe+qfdspW
	Ke+P6MKuPj3SkYIbkzCss2knZCvJ57jGNEOImc+7DLIZBSqgdy6B+Mc+Y/e7KFZb
	DLhGjmiNDw+C8qqyuLVK2qnURttWKh09KVZ8UYJUnbkPqYpogVFNGzYZbnJMLRDc
	cyaynSEmqSHXVokaJM1+xzD43eYtRdRAlMK4YZwT9nSTCtdCDUrEll+kEUorsTH1
	NhnzXfiPNRGo41vXulp88CmIMK6wd/ASjDkk2huGxpgn/NXXVS8OCfATGfwic4sG
	/7pjJUPg1vm24XLtan8VSK92c/DlxLcYHiqmuRCkgfud/IZoWQxVPILZozhugJZR
	hZ/74Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fefjh0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 17 Dec 2025 13:23:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee409f1880so11558161cf.1
        for <linux-clk@vger.kernel.org>; Wed, 17 Dec 2025 05:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765977784; x=1766582584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bs68MhyXjy7fggb+VYhXusf+j0KV8hvgnqpT+o0xydA=;
        b=NoTWZZBMZv43B5wAqdgxB0Qwgz+SyYcsTnOWpP/Goo2CJHY6/5n+rsUiDh6pYJVPcG
         PCXKsvNTrNnP2enJSs0Xe7AowKnwsV2oqt56JLdkfE1dyYF2tW+ttjgR0cYJvH7M9/uO
         NyOSP/5FqXZ2nmgZk92rDlTOtIITtkd5X0nCIt7BOoiUGJ6xtHFhxv6Kkl2ImWNfrHPU
         0pGWq7wEjiHCC8ns59LY+CQNbWP/xbw9cAdFhJXyjx3WnKae7Z058i60Zvje1Be3IrGx
         SBvD98BkxY4c/knPrf0HH0jC9MJMpowy+IFHIFaM/rBX7AiqwOShnHBZt555KuJ0g0CA
         g3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765977784; x=1766582584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bs68MhyXjy7fggb+VYhXusf+j0KV8hvgnqpT+o0xydA=;
        b=tlaUZp12jkqhAD5rDhdzhT5YNztQs4J70YxK90N0NzveiL6jiZ7sU829gX0T/pTRuB
         yyhWMDlKtTqeXoIEt9GwRt0KddrVsPuzjbt1xJwCxBAUAF3nUE8wKSMtlNhv4qgGrOXo
         B4GkNO06/yK6Rq27l6PGYH5LpFTB9+fkE9fn+R+UXUyawM3V74tDMa8UsmsK6fH4wQ60
         s95pX6205d5SnPQtIe4KSUJMV+LS0wtTvZlfa0us+CRzjXi6Un9ZDLOMRGOMB2qxYL6I
         xqu71CBg/9VXsDDra618S0JsTCeowHcHYuVG9UJHmLWXfBZq8PlBBq0E4DnGKuG985Hz
         QQIw==
X-Forwarded-Encrypted: i=1; AJvYcCVl6El3FkpCHXUUiyJxoVe+PsD6AMir+kosZUL2JFFo0oNldBD/WRuV72IdLYYAB99LZMm4RHMR9q8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFgOLSDuS7vwI43Tv1peYXV2GnGX1crTX3lgYQd/3RteQPz2Pl
	t1Ud5ScSm8rxhGt5gfkUXsjXHcU3f8y4vkt0BuOupaXwZTjwBBz9xr/a0kDm+Otyyf0ntIYFpjC
	Zhk+rkR7cE2IyMjWPKEqeKJifAOinfu6FmGhAh8bhfJNiakuGpNi7eTRuk3xNyDc=
X-Gm-Gg: AY/fxX4qNfmUZKDe9qXQutirQfZwP51MMuq/XH53uU9UL/lBBp/bLFAbsfDw2POM6jZ
	TtV9G6/bzylujxMiv2iKWObLgyF0tdlBTWeNX/7l/9fYt0b7h4a16zIhNC9Jp5CWZCGUl4+YZ8X
	+LaO0M+9gy67OGOgPklHLnfAmFUgGDZDU7KsaVwd2Ib9Vf6cFhCGR25MV2lg18vmyaNQDuCiOae
	/dAojmVEYrcPsGjy1Cltmcp+xRcr5z7SfoLTBMmdvaJPW01m+KBLvmcQESPfNmnB4141Zis7t4x
	zzIaOXN3PjNtIALhnVTThHWVdata/v2QHd7VOawNZfw43bqZwaXGyxtulHNsODFRHSMvPZkRyEG
	KKCJAVOx4IF064BJbQG37awbj9EpvQLhrlqwtTd7uiWlUH+XTEYeM+zsdvmJ73Sf4Fw==
X-Received: by 2002:a05:622a:4b:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4f1d05fc5acmr193029071cf.9.1765977783895;
        Wed, 17 Dec 2025 05:23:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpn5aLn1iOCruV7FBHk9VV/Ny6pCd5cdcHqaZz8vOqqKcrW2tjqlTPVxasp9W9wjhhdHf/Rw==
X-Received: by 2002:a05:622a:4b:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4f1d05fc5acmr193028721cf.9.1765977783290;
        Wed, 17 Dec 2025 05:23:03 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa29eb76sm1969402266b.12.2025.12.17.05.23.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 05:23:02 -0800 (PST)
Message-ID: <ed17edd9-fd96-4562-a3dc-45cf7185f66a@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 14:22:59 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] clk: qcom: Add support for GPUCC and GXCLK for
 Kaanapali
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-11-fb44e78f300b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-11-fb44e78f300b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwMyBTYWx0ZWRfX+yHIzYnpr1yR
 bid2e3ivYu9n9NM+5cCeXqgrXQB2chbDuZh1NYR50j37a9ZJgIwsQlHkHZcelh1/X4/cUvgHwsL
 XV+UjANhnNJd/cIFm6ZciS03W7PkWT6WqM5jo6Dxma9qdMO5iB9vp7x9G0M/1aBfE7YXT+pIlce
 pQZLUNd4HyV0rtU3wl8Mlaaa0izXf3RsQJMJ731VtKS/luIozU/4TGhqRUxjiV3aVhHwKuJ6giy
 TlrVC5mnFlk7qRfI71XHMgAc2xT2rMu611X9JpS/f00sLPeKX5qYu9lyOudOaBhQUfOiI3mw8fs
 efqOgVMthm0DWu+VjtB7GZ0E4DC0YIQ27e/59R+pAWoAvEFRbaWTD4D2RKSJ0XXFOpfGir3noxi
 wkgOyqJy4JcPiA+fRm9UIzKAa2eazg==
X-Proofpoint-ORIG-GUID: Oe5JgzS8dReeTZ-Qca-nSFuQq8rN_4eW
X-Proofpoint-GUID: Oe5JgzS8dReeTZ-Qca-nSFuQq8rN_4eW
X-Authority-Analysis: v=2.4 cv=R48O2NRX c=1 sm=1 tr=0 ts=6942aeb8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=91OgtvA7_0Jf-gwRHFQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170103

On 11/25/25 6:45 PM, Taniya Das wrote:
> Support the graphics clock controller for Kaanapali for Graphics SW
> driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
> block dedicated to managing clocks for the GPU subsystem on GX power
> domain. The GX clock controller driver manages only the GX GDSC and the
> rest of the resources of the controller are managed by the firmware.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig              |   9 +
>  drivers/clk/qcom/Makefile             |   1 +
>  drivers/clk/qcom/gpucc-kaanapali.c    | 494 ++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/gxclkctl-kaanapali.c |  76 ++++++

I previously proposed bunching the little guy with the other
object file:

https://lore.kernel.org/linux-arm-msm/20250723-topic-8750_gpucc-v2-2-56c93b84c390@oss.qualcomm.com/

And I still think that's a better idea. Alternatively, we could
create a small "gxclkctl.c" and make it common across all such
platforms, but I'm not sure that makes sense, if for each one of
them we're already going to carry a gpucc-xyz.c anyway

Konrad
