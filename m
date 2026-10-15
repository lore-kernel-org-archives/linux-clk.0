Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE7137F30C
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 10:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059717; cv=none; b=GQPw8u30/ZWUpK785cpPrnHqkOfjrFJL2vyYtJiiVJfzGmtwEReXWE0kS6k9dqHCahlrHi1RFyU39mmBVdOiR5piZCy3//nyKX+j7bguQm1wSftZWOgJHocKKDwwH3ulat+PDscyojxvW2mwQ1wC2vSpxo4Kd7AIN2jQ2MmmlQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059717; c=relaxed/simple;
	bh=gDixHkkz/FSuEw67VpTGI72gcynBkvRnbSZ64oA8UOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rAFP1SDR1F1Ulp3ztPcMZzCqy9Wulu4ohob2F9uAMZAv5mwkEWBj6zsnckoo0aEcAsZYVn6Ha7+fGkBIbgabdAEL6/7TkfUQ1cGWP+XnRIKrAAZD4v3PMrodQQtcynA88setL5EhfNCUYt4WErO4iTz+YUcB+5N0Mwh6Hb/Ip7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dhGGS4IV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AJJAPrXY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dhGGS4IV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AJJAPrXY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jStT2662626
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 10:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gDixHkkz/FSuEw67VpTGI72gcynBkvRnbSZ64oA8UOg=; b=dhGGS4IVacD7U72p
	Y/hTqljAPCqOuYlH9vi5eG5d9VrMGeoSOqpvyyJjufi8kmd+VGUv348y5BioRvmU
	guIxAdcdkOPCK7F3E2WjrbGKOEAvw9lWTnKL3Lupe1+sZT4Im+Jd+bbGzMy29RGt
	iJhUbWKyXq7V7i9Vs0bvQU0l5odM2JyUqNqo0JQ42qYsFMkx8ZH6eFS2F+Qj2La+
	iRJ51i/iqX8E/4eXTVIyHqGEvYuDVfMbH1pj49fERNYjd/4lj8XCd10fnxvGYAfK
	oPKej//88tw2br+RLal7CWqdVt96z4sz94bWmYD+mC5pNK4K+QBgurr8JPo87Tcs
	QAFoYg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda1ha5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 10:21:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917a04d1cb2so13296496d6.0
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 03:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792059715; x=1792664515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gDixHkkz/FSuEw67VpTGI72gcynBkvRnbSZ64oA8UOg=;
        b=AJJAPrXY0nrW6kox+JMev9iqyzycMjmjCDDTnjLQHpxYn9sGjSaFwpgAw1OmpDn8NJ
         K7Dt25PJUyJAx+v/ly2Gv+8jqDNa/IICgpPJFurwi3z3w4cnxJ3NKX83dO2lRBCJmrz1
         OdSljBQ9Hzrwys39ee9vxOxDlgOa/eK1uVeQkZPVbkMqRixI09Ly6lCCGCVx5RRKQbpM
         w9pkmShQgQiq1eL3LP7SmA7dwcf4MIDY95b2T859bwfMurMFPkz7THET3ltBIJsxvu47
         TOZREWPkNYnBys0Mx5XI0PwoEowa/oAyWPLBBpnlJuFHiR1SUyp0AlGc4tASna47pRlv
         b3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059715; x=1792664515;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gDixHkkz/FSuEw67VpTGI72gcynBkvRnbSZ64oA8UOg=;
        b=goi309FN2MUSjshVITnHkgSkM+Qz5umwWJVtOzpBE+nk5iM8AvJXRWAiunt07Wz4rI
         u1MKWiImCRhXYRQopiR1urr9f8xxG/5ShvNDtAzvSY4y8WCSv/b1unxpoBDkb/DcQyMO
         JuRtKeICsXTB0WyxsdqgmIU4s7iacY8xdKY1bAThjkXo7UyjEjelGoqhWE4J5lRW8yhg
         SKO8rXjTwDg9haMsHkxNuYf3cijCfIUzcla54HhE1EJ4xN9pQLaFIGZoBKkX7Fl2Hrjt
         CVa0ew4XCANHfpfvfpjeVEiepYDIS6LcKaCAOTGcGP1Rpj/8nNGaYzyBcqWxfHke6Hyy
         DNCg==
X-Forwarded-Encrypted: i=1; AKwUvBx48agvyqmCRvbQXVjUQkQ2lGPaTKIXRRbuNsJFhh826No+YXicCnErXegk3PkdYHDmcr7vsszADl4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0iOpvQGF+3ySlxqCPEItadtLWsMzLDon+Wi9YkQlYkQKRF5en
	suGoXiW/djBpWAirsIXakmXrQrQ8kl1VHnykXeHCtBWePpe0pVgicl0Cvamhpli09R/uJtO/gQU
	aJtQTVxfNl4J31v4Z4brS5udoTZGmGxpLNwnlqE6Lgmk8vH5jroXTw8a8QdH4jAI=
X-Gm-Gg: AYBFou0RmI8y2GDIFEhAosbUAyKT0CfeIqOqO8OH1xKOckhiwFvPyO+hBG5LVnAZlpR
	rZJ73y0VRS/XZ6qaJMhrdinTt4HO7FhRuPj/bMkpPk1fu/nLsn+Jp9QqSumlqYEak9PZe3HsW6a
	88KGpvWZlcOwFShsMnfG6G8GYlf46MnEGJb9sfNYS0nfcgNyUe9tmu+CkaoWZgIa9Qf6Eup4Vh8
	FxGmY5zsHh4+Wp/OaS+6LJFsmTFC2MbNaO1I0E4ZXzht6Z4fy54M51LTmOfpdCCmE33oZ09EU47
	qdzhMDsrebwXfCfzeYiTRvmt3rjiEuKLK/M4MqRgRQSjO9VJGTLuLWqA8TK7ZRlkQJYehHi/fLi
	JT2A+QQqL1xybjtS6gRadQw==
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr3652784985a.1.1792059714860;
        Thu, 15 Oct 2026 03:21:54 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr3652781785a.1.1792059714411;
        Thu, 15 Oct 2026 03:21:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963e0dbsm106620466b.23.2026.10.15.03.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:21:51 -0700 (PDT)
Message-ID: <b30fe2b2-4d8a-42d7-adbe-a15cd1bdbf4e@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:21:48 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm8750: Fix videocc clock inputs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
 <20261008081036.3492003-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261008081036.3492003-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX27yqqs92H7/3
 keJdxdFvDz9bydTHx/XkoHlvZJbP9gSE9qZ2/LusByrk72hryGtnjz1guKSIzVU81crVKFFO+lC
 qUXTMziEWG2tWYmSnZnumNxFDWIWx/A=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad0a943 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Z62H7OANAOBda0uacUIA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 6EGm8nP0h1HhmiuRYfeVmWkIC8eduLpp
X-Proofpoint-ORIG-GUID: 6EGm8nP0h1HhmiuRYfeVmWkIC8eduLpp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX/dWRXPlweT/j
 J4QFDgwe2A07g/CDXpnVyjOd3W1NWAmft5J2LZYvw/8oKJ+usQO9hZqh/t6ZjancS1axOvKN11i
 31jeteIPFbMvYtVzyjCrwovU32EfkT6b7TBtvCrohdmCQHdX5EsRwon4zmtIWl0kpr/GSw8mJSt
 jcgX1p9WrPS6ibP9e+MbmvKqUnh6S/p4SpbSBi+4CaMZJgmTa1+4Vije/Zo0rzEuHhcWHqXDa/8
 6cK9gZxCMKZQdvOugBJ30/UgMWG94BiMXhQPoZGuiOZdr++St7sJxV53O4Gufz3JQSamL6qsp6M
 Vg0FRNszCNzMgHD7tmPbkJ9/mgNyksvoFxthKwR43hOHAyoB+2BKYTEdGp9ijeUwFWnr8yXyR22
 FbWA2KDzw0EvnAV0/48h4iM7Hxl4I/Yis+lLVSaahTLL3QjPCMgvctPPzoC3L1kGe9X4iByR2C7
 i19gwSNEv3AF3tiI2nA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150041

On 10/8/26 10:10 AM, Shawn Guo wrote:
> The video clock controller binding describes three clock inputs for
> SM8750: the board XO, the always-on board XO and the 32 kHz sleep clock.

It's not always-on, it's active-only ("whenever APSS is up" for us)

Konrad
