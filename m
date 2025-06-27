Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BEA2E9EB4
	for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 15:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751037038; cv=none; b=rfSPTjsk0bW/v6PcQFu6nWVbm25CxJUPNOBokJJ+yR0PjHsktVX8yvwGkv1tWkXE6ZtZJ8ZKQ5KUPrusGBHN0a5LlEbR/KRH/rumgQjD11GdNRN2RTxMMBqCWauZO7pk7tU5EIToBr0GWJRLrDyVLdFNB/5/ULDn8QHPBdndysc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751037038; c=relaxed/simple;
	bh=MWOFAHHtN7/qggQnBgYoOfr8mbDkE0qE4SD4dw5rBus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xt/XRhG6CmY5TCVoFw38zD8w7PGaNSAhfi4ahGKCA5+KId+TtB+5m+IAxMGox1hEkE/T3akPTfHCLUSNL8DNKKBSmM73sOQHT5BWNIekl2/uHm8QYcZNR2D8D7DiU9ILnRt11RerHAEUfhpQnO1ii36zWnOh7XV9yJuzxz/1Knk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IgeYq4NB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IgeYq4NB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCkBIw009894
	for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 15:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZOLf37uyXC+Xhgnqp1gpIpFUGmLHpCI73UUQAx/mH9M=; b=IgeYq4NBC9HCybCt
	lQalD6M2OzUujYzgb9RKXdXzCvyAqcfOIoeMhk+lNX1Jy4fPkz17P9iB0Pb9sDcP
	XImdGcrY7CaEjVQDB/teqZGDPSoWqGYfxz/Y4Hy5YHzZbh559E1PIa6MYZ67TC3k
	t5JRGKkyfDSFLXDXcG0Sn/GGy97WALDbqSbk5kEmPcMWF3StxVBg9eNKVNzJvw2E
	9G/KPQkdR2jazPlGlxCfpABzws6mN1Hdiv0mqfqZVo4x8hS5Pabu3CRFJ4iddjpi
	r66fLXFOEtlXmqB+7GHg0tI/znt3mBT6NUfWuc7iFX+kFo3Eayt/DTnxd2hPC5Qs
	GOZLMg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fgyg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 15:10:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d440beeb17so18563485a.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 08:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751037033; x=1751641833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOLf37uyXC+Xhgnqp1gpIpFUGmLHpCI73UUQAx/mH9M=;
        b=n/JiEK2iAJdogIgvd+ig+ZyivKn42cNddnZuvlmGrwF0k31sjYkPnA4NBkOyD0r4H3
         4oKwpUcfYzprK1ur67WjX1UqYeYzTQ5EgLZXN+Ucx+gigkke37t2gnUo5npvcLeNE40E
         HZrs09HhP41YSYWp/2fInYGjmkXXM8Jbdn4RCTAmKTjSzpMXSpnscL9qwsEUMYExSd8q
         zzAT2E8Y9dM+WHktFoofObl2z+j4rDVeYrxqJMNZQOte0Eg+Ii7o9kDWH2ulOtjghCJw
         jZQ9hfgnwwRb5/dgKRRRddaFaudy0wXsZc8xWmooUfEOENLhy9y4Kcklag/W7uj2+Mud
         /QLA==
X-Forwarded-Encrypted: i=1; AJvYcCX/WSAEdb5JMKBLeiCOj2VcYygwIZ9f8wOIPAOiWFWYtdEmY4KABoitHblN3erkctvrxDRoRYwykMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOBueP/IsYyRicGlLH07qVhKkypO6lX12TGzwnx7MplsC1nlfP
	tjQxeHJ+B+jx+5ve0LFS+f8jS8/NK4+xhv8dB32g0ZGhPExx0ISsUJH/PWzZDY5Zq4wZgA26PAo
	wt5STJJteQuJOktEyBJYuAUzYHj4rSoFjUnzxOzcBNRrts1xQDShJEGAG937jwgY=
X-Gm-Gg: ASbGncuAdLeWOLJ2FA51hFA61R6SMXlgrafZ+9Yi+HqjWfRP140h6BOtZ8aH3ZlHRRN
	WDInPh/DSosGYaZbK80HaOEKk34KHcTWfzOjWaXYYNzQHaXowk02imffYvCeRg3f/OfA1WUuEOs
	RkgJZAE4WWOpPLr70fj20ma5ZgHO30XqPGNRz7t1W2B+ztTRjRYmKVZBhJIOumb4BLYuTnIeryX
	lsq5e7CQv0rgL/aVLqVwd5m0Kyi0ZIMiVEc3619R/ZeBhkW1asE2vK97ak738+HnTi+Pr+tsSN0
	vnQZpY6Z4suCdH1THKPDEucqHfZxJQ8hzBfOyX9qc0RfWdW/cbmFVCSyFsGw5M0ZlKT2v7li3hw
	hnT4=
X-Received: by 2002:a05:620a:c4a:b0:7d3:ed4d:ac1c with SMTP id af79cd13be357-7d4439de410mr197148985a.14.1751037030409;
        Fri, 27 Jun 2025 08:10:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpSklDN1x+K68aLym6g//jIbf5D14idxyGAGdjsMuKKGvm0HIepobTHT7v/W2zzlZN6PsD/A==
X-Received: by 2002:a05:620a:c4a:b0:7d3:ed4d:ac1c with SMTP id af79cd13be357-7d4439de410mr197139085a.14.1751037027727;
        Fri, 27 Jun 2025 08:10:27 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6beb8sm139311466b.132.2025.06.27.08.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:10:26 -0700 (PDT)
Message-ID: <68056b4a-b1c3-401f-8720-8e0c3cda6249@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 17:10:23 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Add clock drivers for SM7635
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyNCBTYWx0ZWRfX4XK1r2pS9Dbk
 vZVpsA69vWOaJHMWbMgO4R4dlMN8/hliWZ90zwmDNoh/4bDuSWrlIExEWdCmdCHpqgYrJhgN978
 Lf8jPQQTRlSETyzHdC8voob+zHUE2O7v9dNV7KSBl84G7Dr56isETewQVG8wylH9RcxmABC081S
 ywbddwvzA5idnh4sIju9y9KLq6wsA9k9VCPXeHx0EIU6nsD6p1khKk5w6VSOjnJfypTMiQPVrup
 ViTuP0EIbZnBBUIwRaukhmwfxD2DtaciLt7s3DwBC6tD13J+djl16cNPvJ/4v+Po50hnJ4cfpC1
 6WjvXPjyAWTxYE+teO/2XH7InBKAQOPpOCg7uDtBBLw8dFBTAgsOvelHKdbiUHvZqgYTH2LK0Qi
 QU1jq2rv8vv/DYW2Xzm1hsxc3gMhjZe8yLgbPEwaFIXbHGQUGen9cvdGKPj3yevFRcZES2iK
X-Proofpoint-ORIG-GUID: NIZcFTSec0QbKuNCXjzoNwJmZU5W6XI5
X-Proofpoint-GUID: NIZcFTSec0QbKuNCXjzoNwJmZU5W6XI5
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685eb46a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=Z-jg4G-D8Sok9OT7mQQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=909
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270124

On 6/25/25 11:12 AM, Luca Weiss wrote:
> Document and add the clock drivers for GCC, CAMCC, DISPCC, GPUCC and
> VIDEOCC on the SM7635 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Luca Weiss (10):
>       dt-bindings: clock: qcom: document the SM7635 Global Clock Controller
>       clk: qcom: Add Global Clock controller (GCC) driver for SM7635
>       dt-bindings: clock: qcom: document the SM7635 Camera Clock Controller
>       clk: qcom: Add Camera Clock controller (CAMCC) driver for SM7635
>       dt-bindings: clock: qcom: document the SM7635 Display Clock Controller
>       clk: qcom: Add Display Clock controller (DISPCC) driver for SM7635
>       dt-bindings: clock: qcom: document the SM7635 GPU Clock Controller
>       clk: qcom: Add Graphics Clock controller (GPUCC) driver for SM7635
>       dt-bindings: clock: qcom: document the SM7635 Video Clock Controller
>       clk: qcom: Add Video Clock controller (VIDEOCC) driver for SM7635

We had a massive yak shaving patchset go in this season, please move
the magic settings in .probe to qcom_cc_driver_data {}

Konrad
