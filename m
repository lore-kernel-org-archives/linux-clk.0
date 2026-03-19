Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373973A9D80
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 08:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773908965; cv=none; b=hh7qOR5XmIp9OI/K158XyiDmSpBTvug7s5Rp/7+1OCJtFoGKqNfF37HndmEngYBAsLup4+2oxgfxkR3bQqj/UpNBGrKfCIYRhQPs+00i5Wt+dD/gHWM9tr1Oshep7aN6Ceh0guJV+GY3oqqmSEAKA7H0269I+3NZ7xE54/SBziA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773908965; c=relaxed/simple;
	bh=HW+1mQPA8oYfzTe9t44JNwupxY7JfgaIBmoMLzDp0N0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=COIkbJIXtbd183z/a9kv0FOrMV1FX8RnwjVEUh86cFbW4HiZo+59CeT69SarXLq7u4UULxLA6a5dUzIOAIJsspNsBJWEV+qMY0gKoyc52n/G1lNfgGE9lIkWWRdsO2yiTS0j8A043EloekInzHTCc1XuwmwfWzc2dFBOdtlmBLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CThDwErA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kbVUqk4n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CThDwErA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kbVUqk4n"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J74a4i1772607
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 08:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JOrDNuieEhfjIYd+QTVn2lGl1FnZSe0fgUIkFDBWrzY=; b=CThDwErAVUvEwJA+
	9yIwD14V+mG06051HYLrV6weFoBxUP16g0yhDOn5gQ08gi5sw9fjhIqOA8BR4WTs
	TX/qren7ZQF5sAZcJCkOmR3jeHBsNT2d4JpZg3cc4rpegWIOF9v8vxG3ZAUMtVsx
	RmnSa2RlTKNutSxLNRbvEOo8Qtwx57P/GIJy5G4BVppkuqhIelt+0b5+lrZ15/BV
	2Tbi+vUILeH+XXq4BzcE8Pm3HU1UJN2Es1EvtA32MW8BSFGUYIA1Wr9OQbwx70zp
	23KD7eA+H6geGG3dQhYs+QWpKKumlli/0n1OCVthBk4jfZnpa6o0aG9GYIkzml9x
	SNwSeg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyy75tqjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 08:29:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091782ab06so105345241cf.0
        for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 01:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773908961; x=1774513761; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JOrDNuieEhfjIYd+QTVn2lGl1FnZSe0fgUIkFDBWrzY=;
        b=kbVUqk4n/dydtQSUCicQG2dk2Kg6edwMQLgjuf6JaeZ/p0MV0TxNa0gMYtlNAr8ff1
         Ekia7JLXpSef2NtRsY2/ksRTgZ7DxH64VV/K4FpoWLeHNphfIt3dWV9vQsL85/D1Qkd4
         Ngf8kzpYZuvzkHFgb+fiLENFmzSRcg3/7jmhswP/7crw0FXnkxxg29XrGik6Zx6RRWUb
         XtNan3FH8VeYk0HittmsyKptz2UmGBMvTHzCRyi9ieam0xbcHicGhuMdlAowqMIj2HBz
         ioInZTbauK9j9u+KZs9gzHnI1VyGUJ7Yybbyf/kV/Wq+StF5W0t+KuqdsXjWYnDgL7x7
         MUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773908961; x=1774513761;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOrDNuieEhfjIYd+QTVn2lGl1FnZSe0fgUIkFDBWrzY=;
        b=dVsw0lMgt37J8ucHc+nbNNR/wXA4/UyObxYevFjDhuuCC+24ue/I8PKVFRMPmfJHBz
         2SvWxmjWNqKhQsU/iN8bE85fXn1SgK0qtmMQIdAg7+A7wjvPilXdlRXFwnnkRzfCGY7n
         zY1d3Zx67IJXM1TB6tZn7eQ6moP0qC+aXxzoH4gz1ilQ2bbus61ofJP8UwE7EKZGBjU9
         zKvgnMdBH7MKlMlHl2iPFiN47AJaiP+QxEjLNnRZ5DzxJSCbAIoEfbYJEew413a/1GtH
         i7k5qdkwC06jkt2dLcB81g4drQNdPVotEdc11C+O+fo4Kg9ZMs0w2esw8Sd3N/fmndLd
         sdIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1LxgLDXfehqGyaWsTU8XNhPAsBKeZo/6Tg+y2AHhaCB7OTqKZmpEEP7i61qo41/xlLAYrNhhYxTM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK9OGJGOutqNc6SmHOs7xWFR/8W+HBuxwwt0w1RHTj5rVqu2r8
	UwcFQPy7EnuLxkCfa23pzjJjvQzouR1r/4i+6q7lOSVKIhm9Ubmo558Il7S3dccGBBL4fdUoBxv
	ejKaWLSQanJyFY8Ju1G3qW2kecg8N1v8ZjWwY64ZQNIudNohdDR6qaPMANLSs8KI=
X-Gm-Gg: ATEYQzwNsRmvl3WbckA4XuHpwVjgseyJXkGGGWb7nig36I0r8xDVUL/5/de4+IRt3kf
	XhStrp66tQem29tIslId9+cb1zcdcNU0to47T6vt/VKnWP9e6qWMAqtaCz69l5ayzrcZ90pwkBs
	0uThBLvbVpLu1ReFzZEodsZAnxQyGzFcMgXNKG+/+hSm2hI8ODaUIpGbKYnEFAqDKLBYOVaTfcP
	wRRdDR3MXIF08M2n2laushJQOvH77RKfurWqfR8AgLTmsmUGDOcV0RO+CSuctTrz8FuX8f7Mu/U
	A871I0FDJJBVF3KZPbHvbpztKolFIxy75QwoVq7c+KSzz4yzV0VwD81mXi8004Pj/ExbtcwL2md
	kt7cmt7u8lffa8KCNip0xIYRgioKYcgOq2SK6QiKyQs2dVPIN
X-Received: by 2002:ac8:7d09:0:b0:509:2d50:9778 with SMTP id d75a77b69052e-50b14864284mr84978201cf.40.1773908961522;
        Thu, 19 Mar 2026 01:29:21 -0700 (PDT)
X-Received: by 2002:ac8:7d09:0:b0:509:2d50:9778 with SMTP id d75a77b69052e-50b14864284mr84977961cf.40.1773908961127;
        Thu, 19 Mar 2026 01:29:21 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518a3dfasm13229910f8f.33.2026.03.19.01.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 01:29:20 -0700 (PDT)
Message-ID: <edc603f5-5db8-4c99-80e0-d2e2a75820d7@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 09:29:18 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: qcom: dispcc-eliza: Add Eliza display clock
 controller support
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com>
 <20260318-clk-qcom-dispcc-eliza-v2-2-8c05581168d1@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260318-clk-qcom-dispcc-eliza-v2-2-8c05581168d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA2NiBTYWx0ZWRfX9gZ/VkXUSM+j
 OZIJWR0GUmMcpHfuZ4a4hI8kuL2RE3qTQNzisj3w5VedqYOFz9ktV1iIalWxTf8mVNuYP5Km2br
 mYY5iLLoaStul7Wei2zqxj6+eLrnExIh303prnZiJppX9ok1vq9H1Bs8sVyLa8LGPijTmm+hdQ6
 8fQxIAG81UjFYDwiaCTA7Har5fszb66tQpl/lGZJaXhKCEbccH8ysynh6HePR8UKbMxUp80STJZ
 tVxebJ+wQJ9AGgxLwXdBkAHzm38dDBHnCwZZFF9nNkeLLnm0+XB0+4jJukjBzM2q1ahiCTGsIZ4
 PSA+MLHuVFN20s5dIih2EamPHXvmdKM2iFU/vLCzNv6VggLJs5HlhmBOWYWU+9uqEBM9UWmJSDa
 kfgo65Q4yN1IwG7R4MvJ1TKZ6qobE3SrZZbmSK7NFmE+hPLLLhvFAP67iHXhO1BHmgl14eMMzkO
 nJFGCqEKt+Fgdmi2Wlw==
X-Proofpoint-ORIG-GUID: mrsFb6dj3r-7ivfBgifQIJovLnRbuzwp
X-Authority-Analysis: v=2.4 cv=A7hh/qWG c=1 sm=1 tr=0 ts=69bbb3e2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=W2U7yqFiXcYkAsrS-R8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: mrsFb6dj3r-7ivfBgifQIJovLnRbuzwp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190066

On 18/03/2026 11:39, Krzysztof Kozlowski wrote:
> Add a driver for the display clock controller on Qualcomm Eliza SoC,
> which is copied from SM8750 driver plus changes:
> 
> 1. Additional DT_HDMI_PHY_PLL_CLK clock input,
> 2. Eight new HDMI clocks,
> 3. Different PLLs (lucid and pongo).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Just a note,

I did not run W=1 build after few changes :( , thus there will be a v3
also for fixes for disp_cc_pll0_config.

Best regards,
Krzysztof
