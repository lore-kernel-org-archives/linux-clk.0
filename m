Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEEC3E6DE4
	for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 11:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776942996; cv=none; b=kThCym8pTNHd2G670sDtfKg1v7KMjx8GE4Du2Mb1aNzBiUPbg4JbpuItVLMovISjXokE3G6IHwxi9LU7jVqVMxEz2yHP1BoLnE2+Ou+TJbRQz1vG9A/QpQjN10+FwDsk0QGz6MKI4aIyduySqTQcMyWrJt3MzAv6gmTs+sbgNNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776942996; c=relaxed/simple;
	bh=QdDejc48UM8nlCGxSIpUbXieNxzvddb1KXMnMSUPALA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tcijfF6FdA5SeuwmNChbm8CaoxUqa1R4mRaaZu2sk1hmKy3cHj0/+lTXn3PY7gVQ7UAe4RLR2vIQSWihBg8K5y9qSRHAOhSWnMFCHtBWIArQQtwlVGL/+631mDsfUeQoYsXmNV1IOqz00InrazBOg4dcry/xSpaoQmwNNtZlkQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AcKEJtIy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DLxbRHvO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AcKEJtIy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DLxbRHvO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uFL43044120
	for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 11:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6EkrSS+3VgEY8uSY9jkXaDneMR0EApwn3j4Pyi4BsvM=; b=AcKEJtIylYjWGznS
	kQ2pCo51oFxbcCiuMYCIK8i+1xfPfG3bN+IjtuUnMIMBeyLUxvz+URxenh81SNeL
	QSrlcI2rv3+NKbKdrUfGjQTOs7mAF3dZIIxwitR9aEVxbufM1L6I1j8wJdrg4oTd
	tqgO+OcoBuEaNS7dej6fedA6eped242wzXu4psRkioTxUrCADqt5ZEBL/2OclNU+
	eqG9Z/k4loLPOTy2YgDl6jSc+K1aORFvlMfAwNGvgDJgsqyO1npP0w81LiOXanXk
	IPsWI68+JM0jCwv02C8l/wgAfVvDxjbNPG3cP+qnuivnGA+AroySVHWeBrphBHHQ
	7fKv1A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh3jqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 11:16:34 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5fa75a19f21so10805754137.1
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 04:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776942994; x=1777547794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6EkrSS+3VgEY8uSY9jkXaDneMR0EApwn3j4Pyi4BsvM=;
        b=DLxbRHvOsXaUy6FzcjcDMeUZTBvEDxBF0IVwlxx2whT0GCdg9wKNPvlVCCMtNErZEy
         6fXCyt2193r3wH6yPYsb61crjZXw07LXEhmiwLoxhVtDVIUTBFumX8oBhu/bx1AhiXq1
         ncW0O+B/bn4+NUdkh+6IujV16IffYy7FYhC50iYVDeK9ghwM/XWBdJjIQbEIPhk2VrUn
         pumd6kB5SoDM+uTmKQ+JGPWsCJu4NPKPElnwDqyLhozf28DzqJk2nKscXQBKDTcVeLiw
         jJ3OgjuFqeOvbz7oSK0hV9H5PDUxtpHHCZWXxY5K8mflzsw3UQ4pQyfFit4R4zlKHpXc
         6qaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776942994; x=1777547794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6EkrSS+3VgEY8uSY9jkXaDneMR0EApwn3j4Pyi4BsvM=;
        b=DXGjyv0oU/rIPlRQQLTN2sTcrB/MrsMp4sOTh84Oazde7umIeH/eOK4+4unyn5woQj
         4XTrA3/dXBvdIIiEd6FAKsUiiq8T7O9+2+T2hkwyE9jpDOzEYMESPocxMPWHF9iZMmI/
         Z4ylfZvKx9t3Nc9MnpEzQhzkJCgjOk0n2SaJtT8dIhKPdXKkIKD90nmnZHpzJ4MZqCat
         bf3YyEE7ZmCa8oORaoftz8pAPdZygtNd+HRSCcSrRqvnB+ui4/X/XB31lvKOzEqmcuL2
         S9i2m/bUvYlElS79LOfXeZ97H83PqbDdKH524eZDQ+65z+Iap46FGsOwu51gdl4sYLAz
         HbjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+SqaOSfYS3VoHHVZ6w9BG5njLOK3Tvd5ujuDvO3a3pzOmdDyApGO0mi/YrU559EowIOfATCuTqXiU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6SzkiNJojtqjtoBFVlZS+0Qpfy17G2dXq1VA6kOamHDDd0wKH
	FMfEtcwHigltoNW06WSdAyoNF08tcKmC4OJ5IB3Vby7otIOQqTWIYhCSNZs4uLv8hlMTe652efT
	EUrmPXLeJxnxlp3Gg5Y+EqSEJLLGfVXYjQHXxs1WwCq2ul7+kCoLf+rGp+tzpmP0=
X-Gm-Gg: AeBDieuexhfjqZ88RxgRQGoby0Ek6H7PzP/fiohZsf2nCGeXBzXmMl136TxjBoFbnFH
	iwRrHid710xZfodQkyK8MLSfCozZg7gYqWjQ14Frt5nqJ2kT14ZQ/aYXshE3z01gCqDNUYdCFFE
	8JgY1VmDLC0w6u7842vlKVBsL0AUZUG8c67bqHvwAYkL2wfT5jwI79Az6Z++XjfJq5KjsAWyLDz
	LBQLgxicn4JVcaDvrA0Lm2SFTNCtgbRnKovbvS7O7i2VxiSQgXxCTGqiJ35vALAnQ/UmvCD0VsG
	CndFKYGjWlITP+eHrn+UVd4NkibsZ+IQpM6D/hMqSLd98uYQkUmPa0Feh+IdbLpmNX1q9NHvZB8
	2VwGcDcVrh06j6klHWMWAbiyYMf0gfnyQbMjs+aomBy299+w23cVF/amxzyWz8Fl3tzkct+cMaO
	AaKlw7bjEjCyTdyMt/Mmw=
X-Received: by 2002:a05:6102:689c:b0:609:444:e4be with SMTP id ada2fe7eead31-616fe256d4cmr9351158137.18.1776942993790;
        Thu, 23 Apr 2026 04:16:33 -0700 (PDT)
X-Received: by 2002:a05:6102:689c:b0:609:444:e4be with SMTP id ada2fe7eead31-616fe256d4cmr9351131137.18.1776942993344;
        Thu, 23 Apr 2026 04:16:33 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a166sm51247890f8f.19.2026.04.23.04.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 04:16:32 -0700 (PDT)
Message-ID: <c2725698-a76a-4930-ba02-5ef656b3239f@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 13:16:31 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] Add MTU3 for RZ/T2H and RZ/N2H
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner
 <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExMiBTYWx0ZWRfX6QvQ+V2BDxQP
 85+u/PQ9NLA5GS9dDoLAgT+8SW7Ppr580qZJ6DeY1RQNBuV68NIRwvVMro866cGfyBDiKchV6/n
 FJ9RcdVcTQjFLrVwuzc4rFDLZz7i3R7nLJWwmk0bgc8l5KOcCuEU1Wc8Dj31JN/QVbmESuBcswe
 wwdOSZJLLmLSX3kGC2uyxczKbZMcP9378VmfHB6ziOKVQ1rPv9sR7x4ETu0NEUUoOnjyGw8WRuv
 HQLsGPA9AObvWSIQjSIldcdWuoNVJ8ND+ED+XvJm/zykhZ+ol3Y9wAK8/vAQ9+rQn3psn7s7Mct
 KAhks3dQyTWkfM6p/rd20pwUUxC5IVURdc8CVuX8QrXfz43VWWM4dsPsuTQ+PIL0jF0BGHuvA25
 /jggkapoh7gALgkALOcI5YAdEAaMa6IZ88i7y24S7mfLDctCReswDiJSiiZgCdRm768ui8rWyow
 4RgQYWkQ+KINyYOV3kQ==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69e9ff92 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=DZ5GKLsTfbtHXbNd-uAA:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 2CtIzpliHHKbMzJUqMiYJbc00sYK_pUw
X-Proofpoint-ORIG-GUID: 2CtIzpliHHKbMzJUqMiYJbc00sYK_pUw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1011 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230112

On 4/10/26 18:35, Cosmin Tanislav wrote:
> The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs have an MTU3
> block. Add support for them and fix the non-existing TCIU8 interrupt.
> 
> V2:
>   * reword to mention that TCIU8 used to exist
>   * squash "move required resets to conditional" into
>     "document RZ/{T2H,N2H}"
>   * disable the resets in the else branch of the condition
> 
> Cosmin Tanislav (10):
>    clk: renesas: r9a09g077: add MTU3 module clock
>    mfd: rz-mtu3: use device-managed reset deassert
>    mfd: rz-mtu3: use device-managed mfd_add_devices()
>    mfd: rz-mtu3: store &pdev->dev in local variable
>    mfd: rz-mtu3: make reset optional
>    dt-bindings: timer: renesas,rz-mtu3: remove TCIU8 interrupt
>    dt-bindings: timer: renesas,rz-mtu3: document RZ/{T2H,N2H}

Applied patches 6 and 7

Thanks


