Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644003A0E80
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 12:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270004; cv=none; b=TBRlryE7+vai07O+gS0M3sKt2b7nEX8rwBVrQssrlfnvl/fYVEuOpBDTHyUUMf7q2HcdOQ9LmVRgP75FzRlThLT8pTMosYYIZgMkTBJEY31TYebphD8J4F2IT/u7cIlwi9Oq5C4iPDBOHEG3UOag1FvNfezJ/+ObMTqyFK1JmDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270004; c=relaxed/simple;
	bh=E0jjYOvnUOby2Y7SZRlZDVbQQDz7XP5UIBx2kAgRPq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BWjJ3WNkwXjitcz1gTF6xA0sHJzP273h5QXGmsBAN3q2IKPV+alb21szIlwVGn+9YdbhOilSM6NkfaaSKlXVhqc0UJk6qRSlbDOTUij5A+h/aIaqiS/pX8IRrWX+I8ZIJJiuOvvmQH+FsqzZQIz/tN6sEv1TJxLU0uAwRNSIaH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kOGFEeaz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gu4Ylt/P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kOGFEeaz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gu4Ylt/P"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7eMUT3503696
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 12:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OPpDI+20CmpGqDJiTGA01Z7mFkGhsPpUYB/uL5YaIfc=; b=kOGFEeaz6f27YdYo
	TjaWKrlt2Sl5gTShyzaqiD35ZRlIWR4XL3Cz+ktzskh2npxA69CzI6aiCAEykeBz
	efiXMmmPuWykPuggy5f52ye1Od+vJh6WuZ/bAfKhvVsy9hMj+kCCLUZtaJsD/wG6
	3NImOxUAk5jiymO917pz5ablhT3ohIcsQExIz72eKj9Yt9dIWLR/6dgoxgSYLC4n
	GRjyDssZaXZ1RovR4wCFOit9kB7gBEfC1WjN1C6WY3qY3GkT6NUWo6vRdbQ6YW6L
	fSCucSfCwmTqw/9yIKIgBFhziylE7Gq2L7vPnlcb2LMEUcaDi+CI1EaFADT7VAcX
	lhMO+w==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jng5d6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 12:46:42 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56b6a0f5391so702289e0c.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 05:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774270002; x=1774874802; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OPpDI+20CmpGqDJiTGA01Z7mFkGhsPpUYB/uL5YaIfc=;
        b=Gu4Ylt/P9c2h7FajIK4CBp+HEaOuK+b1/7sLZmflKxKZgnp7eHFthHp7rJudQ0suxe
         XFItxoXIClanfFLvFWlB6dZthb31FjgbWSv8htjN4OVP59klzqf0x4Ti5sQ0K9cs5ujU
         zmNKc2xbU1zfpGUyKojyWDnDEH/qV50l1zainnErk+y+XQfZr+qvln0JrelWnhAhBcON
         1396zXx72uMwkrLmHFg+tuPguM8nmWBtCJIG5usp4KhY1kPqLcrl2asQi1Lwir6Lb9e/
         8VNn843ly1uI7u9hC1pICN7uYFFmmZjADnW3sLxU34WxTTV10rkZpUPc/m0kiq+UJlWE
         bPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270002; x=1774874802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OPpDI+20CmpGqDJiTGA01Z7mFkGhsPpUYB/uL5YaIfc=;
        b=iWXt2+8fYiqVBjAZ3IVoN5usIa0FI2LJ1LYEA/Ad0k9wYIgvTDjPC8C4TqpsSc7xLq
         RqgZgZ0SAiYAVHA7AAndcfFvnhw20JNaWJ/4IDavVB32rJz/uugc0ssUSh6Cu4mLgVA4
         w/di4qIp/0w9qxfTDl/nAk1XHAvvPuiDLk/Ta7TOj895jlSBAsgRaJJkL4mXJDrL9Ff3
         RULn5WWq2xarjOOnpDImxemeYCCLIEN1QIYTDISOKlyVtGFOerSyWuFE+ICYZxuE/KhN
         ysFHvcOtuyL0rv/P7KY/4iTNSp5XjEgl2bUSdR70xR1H/Xrmq4lvO2Ye5Bem8ZE2ldXB
         J6bQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+teeFpOmqHBaF6FbU64rOp1ATQMOXqVnxudtYx0ECwIS8jx5MI9liKFHaq6tp0svRcX3wE/qmmFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyONL9n+wVIOadOBMWOddFgt6KXuj4x0PzbsLXejUYrbuF/PjBj
	8fu5kboZK45Vj4dgipuiIw9nofV6OaCDG92yRK2FfzM7aXfnonE/iBhW2ynfGYIm2G9j73vSXFL
	pBSxGS/ql+hm1VTxWdsqpSAHiWIXjfaJ14A1vlRKA6/D0qMff9yzZ/pPqyft8muk=
X-Gm-Gg: ATEYQzwnjmpUN3bQlyX7057ZTFK8i9X3Di/6QFtl6kjjDrdORNCjSx9UNWxpDEQ/zjN
	IE1SAyds5fgucf1oCZejqaRCojZY7dPFUGHOlvrnOQ2lL1F47wpYHteSb8bGKkjG1UHiOL9WkqM
	Jq9+YqKop9roIjj7WyWSXwRU2dd15bw/6z2CcVYFUpJ9sDQYtbOGY2H1MwLb7qVUp7nd1y46kZ0
	/P5pQGsFBVY1GC1GSEShrlA8sUCbBMSSeF6jgEOSTsMSZRSg5iYmf9y0CyHQv/2T1kvny2qTfA8
	cfz1IA7os84RSmO6NYhVjVVToPdlIBXYUJ17oRmpd/AHbBQXesImybEPBzm0O34hzIbPjZJRxMW
	BJAZ4dFXWRBrKnxF3Mt8Wm9CUeX5AetApJksDOzCif0LyqQp5I+AGwRfPV49Bg6sT2T3pIUuDaD
	1mmyg=
X-Received: by 2002:a05:6102:74c:b0:5ff:c831:b98b with SMTP id ada2fe7eead31-602aea86467mr2115666137.2.1774270001700;
        Mon, 23 Mar 2026 05:46:41 -0700 (PDT)
X-Received: by 2002:a05:6102:74c:b0:5ff:c831:b98b with SMTP id ada2fe7eead31-602aea86467mr2115649137.2.1774270001209;
        Mon, 23 Mar 2026 05:46:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9833871369sm486785566b.55.2026.03.23.05.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:46:40 -0700 (PDT)
Message-ID: <050d0156-1c4a-4bfa-a3e0-41984bfeeda2@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:46:37 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Support enabling interconnect path for GDSC for
 fixing Milos camcc
To: Luca Weiss <luca.weiss@fairphone.com>, Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: B8PYmgHNyAeGtzu4-2zb0svM7RypsNHd
X-Authority-Analysis: v=2.4 cv=Q63fIo2a c=1 sm=1 tr=0 ts=69c13632 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=6H0WHjuAAAAA:8 a=_xFa7kLeCwyeeWSXsRMA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: B8PYmgHNyAeGtzu4-2zb0svM7RypsNHd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5OSBTYWx0ZWRfXx/w1RpNicmUK
 2BkCUh6EAUstBaCy3nzhZnqeQVxzBHgLkdsXCQgxtTuUlULPnGZ3vfswjc/+chjbefTAwtjjpt+
 w5nq2aIUW3s2V7g0EJL1JzfgdUG1FL46OINGqQ6pg/gf8YrVWh5j99eb5d7/HysHovW6WWBZ7fP
 OeGloR5Gwcu3pkH1fPfN5dOvNaZzIOxPJsDsqszib+S6ZMLZ3+dUu9nNR3otwINMqY9l93FDlmv
 OSeEAQNoy2f5U8AtcqbR98mzY7VtyX9/QWe+Z02ZoofshGMUX9b5jv5e5jV+3ZzS2nRK+lm17J4
 7eAVdPbt8i4G7puOe3YGSf1qUus3YdxtkFarJuznQasswsEZRhwDIqVnTVNNCynJJQUcnRUJQVC
 45+/cbmEg7a3V/457OgMPsiIeDr0wBpLtnrX7O6fwWAh8PYJA/uaYz4PLz4cqEOODxWxzG4Ycm9
 vYjGhekIvB84iAIvJYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230099

On 1/16/26 2:17 PM, Luca Weiss wrote:
> Some power domains like CAMSS_TOP_GDSC requires the enablement of the
> multimedia NoC on newer SoCs like Milos.
> 
> Add support for getting an interconnect path as specified in the SoC
> clock driver, and enabling/disabling that interconnect path when the
> GDSC is being enabled/disabled.
> 
> Then specify that dependency in the camcc-milos driver and add it to the
> dt-bindings and milos.dtsi.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

+Mike could you please take a look?

Konrad
