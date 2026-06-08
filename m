Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC773B47FC
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 09:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910460; cv=none; b=IiiIz+XxSBoCd16joOH0S+iOjg4pRQBfWk497uj5VxIIc50R3hXYOVoPc2tfDHC0XXM8HiIdfuHd0urpQf/QuygkWna9DP6X6C7Iis3npEXlZkbzWyS5kGpa9cAa7cGM5lr9kBkbNVrAAaSDoJyEhYcbQHrvZroSHwRifyms0e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910460; c=relaxed/simple;
	bh=V3ZB7tbh/dBJlzSpmCP9KFqGD72MYXvj7vP8C9/9tWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j52/rganleocSnv98RwWgNosI+1ZJ9n29r14vUe1HO90VKczDPGl9qlkfjinSAK8roCoibQsP0xsMaOyeKL30qZ0DzimsUOvLaxggutWdjazuEkg/5riJrAkfpX14pEbJvgTq0gsiagVA4DAnykXoHDZ/M41ITcMetTzAMWKlCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n2BI9SLn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hrJDt6ou; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n2BI9SLn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hrJDt6ou"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Ot722832922
	for <linux-clk@vger.kernel.org>; Mon, 8 Jun 2026 09:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dm76rGTSr3btxD4sk+JohwPzQz8nsVTx8rS21SkE/iw=; b=n2BI9SLni7ikwF5l
	4FyToO9jutAaAsYms2egJWXPeBRwIBHpqdGz5w5yPNw/OS9fJFgfA7fq5WzkpS0M
	g17RchBt4lvPnkNFre05zDt9kDERh7im5BUBe5ketl3HgShcj+MKOOkku6onU7wN
	7P5vDz+2TXRdh/RuNBlaANPGjZxCurbPI3UzyUmONPcYIUE9WaKwMcniL06aHmcY
	S+tQr6FFqiWXeIPX2E+W43tFDTzUX3j0T5I+uwelmXI9QJsDzyCnrSeS0lQaQrvu
	I8zU8IQul55tHSdCwAV1bYh/8x11AHmm+Af0KhijiRGDAs+enL6VFaDV9bGvkoBJ
	OjzLKg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrf424-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 09:20:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5178ded346eso7664321cf.1
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 02:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780910458; x=1781515258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dm76rGTSr3btxD4sk+JohwPzQz8nsVTx8rS21SkE/iw=;
        b=hrJDt6ouObnNuUHWUs1NEGr9juyXhz9fNTZdOVwa3wyYw37SeTLJVXeMMAQ+zhe0cq
         6MYcHzRzIIF9/h8AjQRj7huSumb2xV9PFfTWTgC1RN2bZbMhxl4UL2Q6nfimu0TO5Mcr
         MiNeC5t18F00LWwceAaEOPpPR/AW90osCIQZBOE1a6SzP684ut2LSijcwPwNfjIAClpQ
         dPYV0BiV8ekiRdL0BfTt5RaWKxJ+DfFrDFwdelIxNKXxYRHI51gyT5g9clnxPjiAqe7G
         y+cq9kOYDtsLu1um59Ul/fAVKzS3B2326AsuV4W2xOTrleFxD8BK4t8TATaShBr8x5bs
         pZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780910458; x=1781515258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dm76rGTSr3btxD4sk+JohwPzQz8nsVTx8rS21SkE/iw=;
        b=ViD8ascfYCBWSNp+mB1yjRHkVREnvTgYT/XaSPoiJ5ddx49D4agpi+2L4XkcxGfOfC
         POFXmDBL25n8QjbzNNpZFYWzWgnrKiISV96VvzgCKiLIri5Po6jnoFInkmcOf4uFeHfA
         7x7uR7cOu8IAHSsM60JECgjPiAbozNYYMdqpmZxDOkVCCVhhuXZNy4KKgqi3pHMKGdW3
         7/XB4I/vs+6W36hIF42fDUcgx8nau6l+qh6ewx7GV2YQmNPOMU9vyVPnLcfy+4ClugXy
         t5bVoi+WnxWBamkSrTEYKXaY0mYMbo0btunq9GLch9KVg0Hp787cwXhcFdGa34sgITtr
         QkzA==
X-Forwarded-Encrypted: i=1; AFNElJ9rC2Q3KWAK+vr66lX+YRWgFYgL2ZyMjUBQEg4rWekzlTdykJYO3UuAFoBjdppxuMI2yWmNJ4tBuWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyacep/iuQ5F8WIsVvfgHHBtw1lA6CMkad/lJFxi4KVOpUTXYDG
	GIoFLACBFKOX4YdGUOgWHQ0iOHdsJRBLbUtncnSowl73xbYH0UfHhCJf/eXdDlMV9VSS8GUW+11
	B4s907nJqrXyAQljxc+D0S0ncoSkbvvLYxCUmCJNapnhjL5dYl5F0URaEnh6/PFI=
X-Gm-Gg: Acq92OEj39Vgzq+GxrQMbCxjQi83z8IKltibGfKWVCnkom/hKJO0MjAMlITwc9Vq82+
	wGz9YtzFMhQoeM6rsAqeE3X+qjTkFWkoqaC63xnQdpCB+WcDkBoRMSkN+USFi7bMHOmUphq7BZl
	GJiZGxTYEe2J0TrlA7X3DYRxwsqUeUsAhXNZyjoSuAsXYj2u3micHgqpkonjund2CI+535uCs/T
	9aRhL0NFqbuc5ig9KfskVR+hb4SjI89LLommazbNorRGqnyNqxdyCKj2YVv6anDmB63emv7PenC
	2QQeYOU8XiQKsEv4moB2WVaj5nSe2UPu5l4h7dUmADG+rbbplloFQAA2FRySwLOHnsE+L+hHomW
	woSERrx4fblbEXARCdjO7AO3rxbRHVW0Fjh5qJwa7S8VVfifb33tntqXv
X-Received: by 2002:a05:622a:904:b0:50e:6311:7380 with SMTP id d75a77b69052e-51795c0d8bemr108304261cf.6.1780910457735;
        Mon, 08 Jun 2026 02:20:57 -0700 (PDT)
X-Received: by 2002:a05:622a:904:b0:50e:6311:7380 with SMTP id d75a77b69052e-51795c0d8bemr108304061cf.6.1780910457279;
        Mon, 08 Jun 2026 02:20:57 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051c8de00sm852347366b.20.2026.06.08.02.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:20:56 -0700 (PDT)
Message-ID: <8bcdc105-4393-45e4-acc8-0faae3ceaeba@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:20:54 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] clk: qcom: gdsc: add LEGACY_FOOTSWITCH support for
 MSM8x60
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260606-submit-clk-gdsc-msm8x60-legacy-v2-0-187a32d2f015@herrie.org>
 <20260606-submit-clk-gdsc-msm8x60-legacy-v2-1-187a32d2f015@herrie.org>
 <yv5t2llliqz5fv35cgw55o7usamrpujlnh3msmpz324l4p5yfz@s5pr4dos7sh7>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <yv5t2llliqz5fv35cgw55o7usamrpujlnh3msmpz324l4p5yfz@s5pr4dos7sh7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4NiBTYWx0ZWRfX7CYrIs+CyitN
 ewWq3dymA8Jihcwjt9blhobL/pL+kWG9QTSR7FHW7YqQwEEnZlmIXE5JWLcCVaMcCbXZ2oZN+cL
 QHFFFZyRhM/csmHV4bG+v2P7fceGoiXZtU4wa7HY5Afs+UN25OjWo/JtQKP9O8NIeHIvojijcrA
 JlD+SteR0ZppXxJWyE4MhPbJcD6ijkhSxQVfeePaJVb10yzx+15Hwo5TOlxhEe0/h/4N0TDHyk9
 0nABDUu7Sr9wHVJ2t2U6CRGmdq7jP5IzvVx0oh3MF4B95p0lTB1n02/UAqXMN4LEZsrmsFkbElZ
 lnsVXBPMO8I0xyxkOWgCNW+Y40AF4c7cwaEAsVSGH1wvf/beCUMhka4fCOmSaU/WfLCZhe8f0Oh
 sUy510DlTELqP49KkV4L2cbt/DNqVEscDJM0o8FDUCUTl5c64gKvWk4o07cIHF3m2LCwN7Q1/cc
 F9BotDyU/sDHXVwDX6Q==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a26897a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=ISS9l3P2gTKgTzszIxwA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: gl-64WFIsAJ5mFFfD0PMOwpOOmIjuTnV
X-Proofpoint-ORIG-GUID: gl-64WFIsAJ5mFFfD0PMOwpOOmIjuTnV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080086

On 6/6/26 5:17 PM, Dmitry Baryshkov wrote:
> On Sat, Jun 06, 2026 at 02:34:26PM +0200, Herman van Hazendonk wrote:
>> The MSM8x60 family (MSM8260, MSM8660, APQ8060) ships an older
>> footswitch (FS / "GFS") block that pre-dates the GDSC programming
>> model the existing driver was designed around. Adding GDSC entries
>> for that family's MMCC power domains needs the driver to understand
>> the legacy register layout:
>>
>>   - the CLAMP, ENABLE and RETENTION bits live in the main GDSCR
>>     register rather than in a separate clamp_io_ctrl;
>>   - there is no power-status bit, so software cannot poll for the
>>     transition completing and has to gate progress on a fixed
>>     udelay() after toggling ENABLE;
>>   - ENABLE is positive-logic (set to power up, clear to collapse)
>>     rather than the modern inverted SW_COLLAPSE semantics;
>>   - none of the modern wait-time / HW-trigger / SW-override fields
>>     are present, so gdsc_init() must skip the wait-config
>>     programming block entirely.
> 
> I think there are enough differences to mandate a separate footswitch.c
> file. It can further be used by MMCC on MSM8960 and APQ8064 platforms.
> It might result by some code duplication, but I think in the end it
> would be easier to read (and it won't clobber the existing gdsc.c code).

Yes please, gdsc.c is already a bit convoluted..

Konrad
