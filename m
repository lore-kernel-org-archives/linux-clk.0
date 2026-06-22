Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC200331200
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 15:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782141185; cv=pass; b=U0uqbiHMQFmlIl+7tw/D6+x9WQAX64zvL5+B/8EvLidzGfdpgib6SGr5YaW6QyFuNjDNdhJO70gK5LYXtK9xdJkuhhlOhi2sk6OxmyjSC9192+rtqKCw5fDdP7EsT1XCd6lk3LEjf7gm0DJhohHD91ISHSSVT6+6XSKsfLVgLxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782141185; c=relaxed/simple;
	bh=jnnOTP98RJSIabIVnaNQSG6Q60LW9M63DltF5shduyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VPUzZ12rwt5X2C3diOGyG37bBcYdPJyNe0XOmO1uDenA2kHxUvO2zfk0Kdy8JmXVA3fC6xrjNxqclLQTvcCTAQ1Yu9FqNloJwHZAtWhwF6c7dD9wXMiVrwODB5VwWMsIBNdFce8j0txShLiuQPXNXva9xHQI2kG29fQuwso28Ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EOCmz3Hp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QFInNeT6; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EOCmz3Hp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QFInNeT6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MEgogh909948
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 15:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p5YHH1cPRNvLPXQXevUlrGJm
	18UVfu7zN2fXkcwzJwM=; b=EOCmz3Hp6PTVojOiJ1lRZkNJuHYUT07OYy5kVE63
	Ro2cAkN/StUFvMaVmbEz74IduofCSrfTLC8MFWuaYti7+h9oZ2A1YiPIuncD6Mxc
	HnvwrSMu9UgAYeablvF5k5tsCFHvh3zRgYp8Eo9gFfgoYzx/yS/W2ferydWAb8eK
	X5jaPGe5ow8qnM9vYHKFEx5gxSBRK9YHqoAU2vEOam348mEbFPGAvFYSbNZPY50b
	WJxF8CN7kN1BUXkkWxYEJXdPqyX8O86X0Z+b24gSXwg/t/j0B2enpvjEggHFl8yq
	aL7Qabnls8QaqWLcQJk1xUy4G4rKPBqeCr7zw80F0C5q9g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey729r3t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 15:13:03 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8453031c57cso6344896b3a.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 08:13:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782141182; cv=none;
        d=google.com; s=arc-20240605;
        b=H2veyORz3QAEGwGYYHsAuBoleYIZjCifu0ppm4JZDsCbuje+DnRvn8C4C/1CUrmHmM
         1oRYFqnE5NMQirha2Q9AnFfz9fyBxtxcIy8qXyWIqM9Oj9YSqGuRmKnJvDbuJ9yZS9B+
         OAmRAiWIxKa/s7TV6YWz0sdAAUP9A1uGxvdfHIeEqBcKi5T/mYdTXK9wmU0pBodRSc3p
         yKYBq426bSb9NIPDvaUE9+2rti8TXSacj3TLExmcC1Cq8FEW4MldqCnbclUgUm9VlP+F
         jGq8gwV4VfJ7U74N5tjhPVDCRQOCBHKzLIL+5l+9xjaRyxBEysL8nl1m5skjP+yUvBxM
         jcnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p5YHH1cPRNvLPXQXevUlrGJm18UVfu7zN2fXkcwzJwM=;
        fh=YK++Er8Njq8DkESlJ2kGbd20eYuKpClOJSI7LuRroXY=;
        b=BmHke123nsPb5+iB7z/qRTBKQ96+NaOJLdzCnPX1DeXPyjUo/b27Z7M1wN9RaQnX7w
         8YYfsArwiVUpWTJnq4uhoS3SBTHbS3b10f8c3XdjV11rbwtoGPqyg/rT8OPbWKQgMc71
         00LtUJbjJ2AEsOmXpjX+oRWctbNEFPjW5SgoOS1fa2d+6TAhk8JDuz8KRW3QbdnO7S8v
         l1ZBl5CyNfvk8WxUEpsksAwU21UTIp1UOsYFT7vxyXhjAxWWIdb6GHu5z9tF8cRnkFIq
         CIZitzR+on34+p/+DB2jNQkk1IzclDM7utrXEhboCwO/PapxeleXIlecZBPt7iqAe3Ku
         Da3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782141182; x=1782745982; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p5YHH1cPRNvLPXQXevUlrGJm18UVfu7zN2fXkcwzJwM=;
        b=QFInNeT6ux150QBG5huzdXml04LSWrox2JRQy3q2Wxy6RMg5naagRXOiT++yuH/FdT
         A4WUU5RwLkXBYI1YbVZtijvAmz/AcOba7S0BDkeBDISoAGGsSC97nb3pKEhiSfDihZVy
         jd/UvKF+fI4MufRzAgfDM3X3j9mGWtDoK5tCo/t9Duu2kdUTfoTHsmB9fFbDz45g7w5/
         InkXsQijtviXmGy0q2pZmvNCo0dudI2VPaaHTkzKF/nM39ePU3pSoER3hwYU/nmNeiby
         VzmIxfi+1HrTXxzjDcWD92x6vRywEHgj1Ht/PDX2TDGWpmQ7k/Wb7oPbVGzwboDzmv/b
         2/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782141182; x=1782745982;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5YHH1cPRNvLPXQXevUlrGJm18UVfu7zN2fXkcwzJwM=;
        b=T60SEC7TPgzF6cpZhYX7scJKO8SyZQR1e+gm0Z23zHqeb2TjGrpoDAqPmz5IxcuwN+
         C5F9yWcTyDbarkytNRFBi/NLuX+BtX83AcxQpdy81MuxPoCLP9IBwrHmY5OxPM/xJVi3
         GDEUx5TNdh0RSxk8FCnA3FsSRdPOrlUG1HLKGQxQzR9uZsRypCfY4z7jofSKuSnAiuew
         FuE6E1s3CgdqZmAi20kPVMphX5R4FEeQzdYmqwPjaNVWAqU3V7ZYta1gsiDdyoqbzRmA
         r4fIV8PzjYL/vCg87gqFjBWFKqa/ycdNy5uSPkEzcFpeMyoyczYrvsMI74m0dnE7Q8t+
         Aj/w==
X-Forwarded-Encrypted: i=1; AFNElJ+HZ0njFzoGnoW5fChYHZ5TnRNakKM9WwQc5Dgw/1ihWwwxQR3/kGvToX4Rk7kQvKmIq9arZO3ohQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzEongfANGQkGcbqc9MC8LUi3OMQNLPG/3yrUb+TBsHqyq0u6a
	qvHXJBIa+b+KkELy6uDVH3l//YGijZevTP6HItkng/wqBMs00Kjkyxi9lCWft7Z4LP2mJQFQWh+
	eIs7q38GzaZOj0xREvLOpBTjmBktYQW/B7JIwzA3b3qjwgkMCLsL1syxRHPTmTvZrZNngN52hSd
	iiiCU59RaCt74do8HwBFgjPofFPnk+eP0d/lX7FQ==
X-Gm-Gg: AfdE7cmHdn85K+eNw8EGeCu+ct4ni2AwGSoh7qas/U6+8x+OEpZNhblyn5o2MvowHSx
	IpXmcaFSUznsrIb8l9TketQnuw+enb94JnP56HiORqbtAwCl+SLLpF3hjCKrQD1gAb2pwyBcy63
	d97tJ2o8xjlcUq3fN2ERD/WDKu8bOTxSlz+aKs3qoLUtTRolbd/VAiWq9ZST7VGLcGnUkZ+hOTT
	xYvJEuVG+6GvDXxkqGB51OBpyOQYQ==
X-Received: by 2002:a05:6a00:cc3:b0:82f:5051:f024 with SMTP id d2e1a72fcca58-84550866614mr16439109b3a.27.1782141182308;
        Mon, 22 Jun 2026 08:13:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:cc3:b0:82f:5051:f024 with SMTP id
 d2e1a72fcca58-84550866614mr16439067b3a.27.1782141181783; Mon, 22 Jun 2026
 08:13:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-1-8204f1029311@oss.qualcomm.com>
 <w2y2wz3cbifnko3td3ovxfom26lll3vl5qgulksa7qnuvzukpf@pqlrh23sljsz> <f6264995-a6f6-498f-9557-723c39becf1a@oss.qualcomm.com>
In-Reply-To: <f6264995-a6f6-498f-9557-723c39becf1a@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 18:12:50 +0300
X-Gm-Features: AVVi8CfSUPRz9gDGBmkPIUFQfXnnifWv20vKVxQV_ubt0A933mN-klc7ydBhPFs
Message-ID: <CAO9ioeUtpSoorLUHXXLEjS+N_AWUtdX2ZD0X+Wss6O0+gwq55g@mail.gmail.com>
Subject: Re: [PATCH v4 01/13] clk: qcom: gcc-qcm2290: Keep the critical clocks
 always-on from probe
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE1MCBTYWx0ZWRfX7Y9qjKTgHyx5
 dUD79zy4ll+rELojK451Q/BsVu0lVVkAbEzEkbieVss61LMhY9edEqL+YMURZKLUONemJFoCOyo
 6UmJJxPhPSldpJdZ0J+2N2ZYAzv0zyY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE1MCBTYWx0ZWRfXyodtB+T7XyP7
 GhdRC4j1hPidnk9GBz1WzDZDXeL89Bie0vctml9NfSncGtQKhp1RIvyAryC1e6kSteBrGNzCTuD
 1LO4mqv428Xennlh6DhpBTNNVQlNvliu4YgmA+8fg1ubQt5yc8e0CJpYv5fMWlG8rIING8vAKvL
 /oReGJlFlG6pfN0sHrMpSC96To0q0Day6U8LwROuhC10CK4XS5wTbQbEsoGKbmJzhPLWHAJjPx1
 FjAeupAZqVQGKDRZCKApA0Bd9cecDvWXgFtP1FNShYqx1k6T1v2pbje7EQtrT2V1zg6lHFXSGmX
 7FEIqIhZoDRY97B5/QBADPGofpL9AryqVf/PKh1U2YPUdsIN1OvNPM7Jgd77zWNy9feaTF3dtpj
 H4gICTzRXrKsDenkuydJ5cL5hCz3FvrM553e3xW0MHXaEygTBdLyRDrVM9TXnWgpPz0bLOSDrRN
 rkB4LTuCXG2jX+wLURQ==
X-Proofpoint-ORIG-GUID: Ci9gooJnyAy0p_djWYxxPOe02ubeZoAY
X-Proofpoint-GUID: Ci9gooJnyAy0p_djWYxxPOe02ubeZoAY
X-Authority-Analysis: v=2.4 cv=eN0jSnp1 c=1 sm=1 tr=0 ts=6a3950ff cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=hv-Y2RuR39m9dDk4NsIA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220150

On Sun, 21 Jun 2026 at 16:28, Imran Shaik <imran.shaik@oss.qualcomm.com> wrote:
>
>
>
> On 06-06-2026 04:54 pm, Dmitry Baryshkov wrote:
> > On Thu, Jun 04, 2026 at 10:56:07AM +0530, Imran Shaik wrote:
> >> Some GCC branch clocks are required to be kept always-on due to the
> >> hardware requirements. Drop the modelling of those always-on QCM2290 GCC
> >> clocks and use the latest .clk_cbcr convention to keep them enabled from
> >> probe.
> >
> > You got the feedback, but it got ignored. There is no explanation about
> > gcc_gpu_iref_clk and several other clocks becoming always on.
> >
>
> Apologies for the late reply.
>
> I have updated generically that few clocks are required to be kept ON
> due to the hardware requirements. For gcc_gpu_iref_clk clock the
> Power-On-Reset value is default ON, and such clocks are kept ON from
> probe. As Agatti is working functionally, I will keep this clock
> modelling same as before.
>
> And I will update commit text that the GCC video ahb/xo clocks are
> required to be kept ON similar to other camera/disp ahb/xo clocks.

Why? What is _wrong_ with thow they are modelled now?

>
> Thanks,
> Imran
>
> >>
> >> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> >> ---
> >>   drivers/clk/qcom/gcc-qcm2290.c | 160 +++++------------------------------------
> >>   1 file changed, 18 insertions(+), 142 deletions(-)
> >>
> >
>


-- 
With best wishes
Dmitry
