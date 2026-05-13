Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2668C38BF70
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778683876; cv=none; b=fcMOE4k2y+2bEbg7wVpwxssWZh+xPnZdgzT4ToRC/Ds/jgxTCJD2xZ8sKYeUJxOgX/QttKY2oQQewrHBuszvAT45hyKcAOlGogMgeeCm3sp342PTDAxLNRNBr9O11L3y5qgaR/OfkpdaBrO4qoU0q/QtI03qGyndzNzJ6BmfVLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778683876; c=relaxed/simple;
	bh=X533S4orIOcyH6d6QqDplEDIo0eDwal2V08+BLKYfKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J3vxSRivLb3bAemamqXRLXjkJmA5bCKRFLOGM8TQXlYompFHi+OTVvC7X7sR7kPakz5XWfkHsmcD95CJf0Nx5HBw/Dfb0CzqPqKQWi8VDbMCRkSpQuFXcS1Scqqeq/0F/VFd4mHo4dhd9ugqE6Fgs1a9NV1uy/ysjgJJD63Gdlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtfFiIIy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H4cP4Heg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtfFiIIy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H4cP4Heg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8rL1I4082617
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xzfLZa8B0chDGUqP+XPMbNKLlQOwhpMumklJOcLO0d0=; b=LtfFiIIyCCGAxDXm
	11yr0oW0B3KX7VliSYCsHTsLVFrLJ+SLP9i2QjTR1XhKXV6rNQIdqVXn78AdtHYB
	H1Ewqi8ZPZJCKKlO1z8URkbPXDi+vjKYO6cG1E9x2zumkfhSHD4K/6hrUMEJoqqL
	WTKXvt0JJgKLmr//e9XQp8+aqyufNFLB0MyoVz8NgXt9kpSUM9stMNIZxsbWeBmU
	l3m2X7K60GDp4pVIn6aJ0ny/2SIXCx7hVl8XtfpyhiVxobOJMEq1un0e6Gp/vmJz
	LBLwl/TGocix3Gd/Ys+jgV0hiBe+ZPD0YpPslOf21hJqz7mlZKR+Eim1fhrxSObI
	fOkN1g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p6e1c7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:51:08 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-63142e319f7so318071137.2
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 07:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778683867; x=1779288667; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xzfLZa8B0chDGUqP+XPMbNKLlQOwhpMumklJOcLO0d0=;
        b=H4cP4HegIfjJ1+cCurdr3J5gfKAJUI9Yw9H+vChCk82Ly9e0HQyy1Z2QKq3D2/A4K/
         TN+jYpARIN4XSIt0HdGzi9lLbUGjh5ZRSiP9WG0XW2ATP8kH4Ov+ktmStwm7PRMzs6k6
         Gy7RkhKoFRdlVzDceGFnZ9YOQTDyh9rZUIJn1UlAMp0bpXuPi2phYP1RkuGvLNWwk4li
         A6hrUuF/y4TiwOvMcX1i315Cjqp6AOP+K3ke6kU3tDvE1HesJv75An0JS6mkNNLX49cF
         HtF4Q8yFk0VLN+l0o1KquwuSZHrIomtxBFDNJ3B7zTO61HwGiMa1HgCVVZSPavVxiZg7
         +Heg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778683867; x=1779288667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xzfLZa8B0chDGUqP+XPMbNKLlQOwhpMumklJOcLO0d0=;
        b=ZB7A9Ltc81pXmlHqgHvNvbZHa+2ng1m73D4nYPr7/x+YapXrpheP1KXCo/ktVZoomz
         SbOzoYGnr3OZ0FibuIzvcpNiYjeByXCMACJ7XfQln7nqeBbzb+UjFsgHw4KlSxOszjr1
         VlvGQ/K7bhjVQuHCLkngO6l82qh0wZZKucGMHa2jw5w0WEgu2Xz7yn7devjAu53FVSxW
         58wth5oZOeIPvYm1tviuQBqjUgbIQhyS6USgFzZofKXfPxIIYZXpVKnWxBSpRoK+bgl/
         8IHHxhIOEv+Ftrzsj77qaM3vdEavX8j9Gq4k8pcicjnVOqisCx2e9f/riob0+VirDF0/
         su3A==
X-Forwarded-Encrypted: i=1; AFNElJ+9lC1EMX++tHDJzJpQpIkLxKAVQbGdVoW2hH1KiojK8tp+/gc7MBvYxlwWSAgNyMtzuwePsqod/j8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKHx6aqzm+t5f0mQE8VJD4C1oy/Nf1fXyLBarlRK9cAKSWJdQP
	1mQzdlACekto425DhqL1mGW9XJpZJjI0wMW7PgybTkVnPNL3nXX+P1l7aunoVmSOfX5wTSuT68x
	wdLEjW+iLoTB3vfi6IXhNXprmC6l5xo6vUNMV0rsH0D7D3l8WzXc7BIVsmwMsOgk=
X-Gm-Gg: Acq92OEpAvjewEaApcJDMVUaNgMihWm3bPOjwHP/Se6TcC5DOCwr3Qg/Rj1A/tGltWs
	cH1Cl4onFw1lImH8mUH5IWeO2ONwO63XnvrYqByHB0IpKIE2lRpG7wkqamsykg+4ewmANHqW5I5
	EpNcN3dPr3RHHnRH2xqSS0I9MAX+sIxJbyQiVy+2MRP2Kk4zJrv0u9dHgD6T4q28LD9wtVF49oE
	1NW/7OwCORTwJOb4nH+5HEH4TX2VjYZbi6Gd4B1nTWt/4x43oDcIWFkD6WXisJneEv5W0W+K2Bn
	RG4xSoPfVor+pQPk3EPZCSRboSYRjtC74rqdAW75cpr7hnWQnUghGTiw3OXcQf8+ynAXzlZTEt+
	bw+qpFzDMgbzyVALvaEV8763TRWbadCOhue2y7HArI6/AdUcVRRvowLW6oF1ikKqliukTpoj0A+
	hQ3+Q=
X-Received: by 2002:a05:6102:4420:b0:633:3bf6:976f with SMTP id ada2fe7eead31-6376f0b4e32mr751912137.0.1778683867164;
        Wed, 13 May 2026 07:51:07 -0700 (PDT)
X-Received: by 2002:a05:6102:4420:b0:633:3bf6:976f with SMTP id ada2fe7eead31-6376f0b4e32mr751892137.0.1778683866700;
        Wed, 13 May 2026 07:51:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd3716f396esm170614966b.48.2026.05.13.07.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 07:51:05 -0700 (PDT)
Message-ID: <1cf064d0-14b9-489f-964f-614aeed4fcbd@oss.qualcomm.com>
Date: Wed, 13 May 2026 16:51:03 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: Add support for Display Clock Controller
 on Shikra
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
 <20260513-shikra-dispcc-gpucc-v1-3-5fd673146ab2@oss.qualcomm.com>
 <n4wgnno2td3xmdsgwadvdtvr4ncitzio3ufufg5bp7wnga4ouw@mj76764e3uus>
 <dt5j7khzvgoj5qdrnfoi6ssye23jve5gjta5qx2ubuvufjzr2w@puacv5jgosmb>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dt5j7khzvgoj5qdrnfoi6ssye23jve5gjta5qx2ubuvufjzr2w@puacv5jgosmb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dRX_GWEqsnQCiH-VXSO1DU0Bqy85naRV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1MiBTYWx0ZWRfXxSJFqqktOgJe
 Lb+DD3nGp/ehyzrU/CuVJ8+xg9FsqhQ5TaObX3A0A1mkdOJySmHDgdS2JwobNC8K5q28HZyW386
 AulEfAk/k08AIL5DWmlPCkydpPir4AXClZbX7HT9bjBKxgAp3eY1LjFIkddFV317DxTW+hsrI1K
 xgVKfK9HYIY5s/DvUr22LtYU65IRJG+bD6vyMqiJwRlsgmy0laVkSuF3lSH2mEpNmFcrZthk8yL
 HWXvIA8P92tqm8Q2ddWHpmZEKmZncFTbsT4qMXQyuFNSGFOZ6sOKj9Y+YDzCAkY1gJtwTbiYtSE
 Tan/UjhRPp0yTAqJH9M1spi4sOC3glSkLKs8MDlbI7mAzKeWTeBKgki+nyEShZ6uoh3aMC3ZGgr
 HQV48D+Xn9oGfRWsd31CuQ5O1A+2yCg6i78giqPNC+la7p+3D8dJ2SOOoqpZhf5ULo0ndeayE/n
 NPf7E7SQxm7tbU6GaRg==
X-Proofpoint-GUID: dRX_GWEqsnQCiH-VXSO1DU0Bqy85naRV
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a048fdc cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hpvrPbskcaH-GHovVAIA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130152

On 5/13/26 4:06 PM, Dmitry Baryshkov wrote:
> On Wed, May 13, 2026 at 05:01:16PM +0300, Dmitry Baryshkov wrote:
>> On Wed, May 13, 2026 at 07:10:38PM +0530, Imran Shaik wrote:
>>> Add a driver for the Display clock controller on Qualcomm Shikra SoC.
>>>
>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>> ---
>>>  drivers/clk/qcom/Kconfig         |  10 +
>>>  drivers/clk/qcom/Makefile        |   1 +
>>>  drivers/clk/qcom/dispcc-shikra.c | 565 +++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 576 insertions(+)
>>>
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> After comparing the files...
> 
> Can we use dispcc-qcm2290.c instead? It uses clock-names instead of
> clock-indices, but I think it should be fine to use clock-names as a
> one-off.

Or we can convert it to use indices, since those are stable for agatti
too - the names would remain in the binding, just unused by the driver

Konrad
