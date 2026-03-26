Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E0E348866
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 09:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518016; cv=none; b=nqUddiIHOjfByksBnn45jv6yeTHcBVHNbBqzSYYX/vRDKvlWVfc8th4qheonByZGaBf7/oRu44ynDHR7vJrMYchQAlNlf3qXoKJn111UdmfckLDKUHqmPR42GZKK4HUQjodRTtk3EWozYvKzWjqi9P07pOWlKu8FrrmX/p+qUiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518016; c=relaxed/simple;
	bh=cIepne44jy0x2zDmcPWadh5Ql6TCY2pHBP38cCOEhhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RhRmsaglz+E8u3aNwk8I7BCEn9/vMvqPBKsHQh1fMqW13R8/ucIq60hG2v826GjDR4QGxxF4k9cWDtkMqb1D3cQv9uxuIysB9do27y4Pri6oTxOcYSeJ8zjKNJ5DUwCBcoB1/wIfr/YKCb9yxLV6J5lIN/XB1Ind8NUJyUMxmlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4q2i3cl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CNPli95R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4q2i3cl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CNPli95R"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q8AN7Q1554524
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 09:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W5C8gn3OXoKblaVTn3KFquVs5mlGk37UmobM7aTAmMo=; b=b4q2i3clmFLWLUal
	Fw9ajmi1yQdy0w3xl3tJimwEnMBh1MXHGgSBxql+fTAAkDJzrB2L9xRaVxP3hbUQ
	LrpgOeVS62PLtU8ag0E9FP6NQ/S6JdjnPLw7F+Av118rTWkuhZfKPlKG9CWExApH
	iXjkIFdScIL1unNnPdPxbqSS5MPLEN6gsuYKxr291SZ7TiFOcBDhbHIGAGXbqWm5
	8i5lKH/v4mZ48HSdUB7QE+HSF/uTVemzb3WquA2iwEAucOPiBttksnMTEP2mLwWp
	k26hIWziTGYqLQTMo2FT+7sxUZzSmwFRbZ4/40wLkE/Q3GXdjWfhxDRlvu2ZC1QL
	4WBX9Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4gj7bv08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 09:40:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89cd541c0edso3430816d6.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774518014; x=1775122814; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W5C8gn3OXoKblaVTn3KFquVs5mlGk37UmobM7aTAmMo=;
        b=CNPli95Ri1ZDalFJJWpVS6C3KvkNdkhblbnz0l33osZvNrRVYXzG23Emix95Z/6XxO
         SkmQjEakwBh1Thk9QnpYhXhjjZIUge50wUy3bTV3ddHaaVOb+g2E6wGLVrRvBDCkW36S
         PnPgIOkWevldPkOgSubob6fB/y/ql3a8WsJ36Bks9gAX/wVEijbxXwRIPrHwiL1XKlo2
         /+hm8keoQbFt5cqVTeyXcnHDXCjODlrIy98beX+mIeCaTqH+zZyW5bCGtaAh3NKikZlv
         UEWvST+MuNYQAaVgxk8tq6hsrSEwag1wPKQ/2EsGcHsmc6hfC/9s9OUdynjbl99B1HUl
         U1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518014; x=1775122814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5C8gn3OXoKblaVTn3KFquVs5mlGk37UmobM7aTAmMo=;
        b=kJWsCfJfbwoj10kl7wcK219OrwSb97sEBa/1ZJD8+ZfT/vd0hQiQ9h0MLww2+XxY8C
         ePxdJPSEYdeETdBddZkLt1gvQrnZRzvKbhNgR1LwLtEBlEdPbx+tiQOq17xArsCvdun7
         2fPWDOQ0+s6d22M93KUaBsKsonwvE0ImL+raxqFuFS5oNGwKzSye31tfZfixpf6PK6A7
         7yMriDgC9KWHp4+SQJheP0xqHWnZbmBvMlrLH8eHlpB4mGKbfMlfc6oIiRwxDeyfHLKc
         +ENNCYw83NkuOdco73Oln+xb7LOz9OgO0NAnhgOTq98cgMg+iNTPZSV/cYKOxyIOyF4N
         ZA2g==
X-Forwarded-Encrypted: i=1; AJvYcCXbu88ySalklfd6TpGzu8xq6njdMyQ06VHPo19N/11dB9hTj1nDhSaSSGEtusd0PrF4v31P8wCMaZU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvonEIHhPbomX8i5fxb8km3LCEztqaDhl+Di0wLs7+JKfEPXF/
	HtigsH2svWuE2/totgLUFoZqSkKRvsGT5Hx31ceI2d5dSnUglJ3F7I7npk5iZ8/d7G+30fY5JEw
	OhkW2wf5apxcZ/ymhJxJ2d3XbXpk+5G4d/IxyRUHiJ9F+x1ydoENKvTnB1G27Lwc=
X-Gm-Gg: ATEYQzx0MdtXqM5/NkHu4B101L9hMjsxdTxyZJZKIA0ov7xUFtBxeGLW2F/i4/XDP9F
	/tZU7aIKKJHCryNGrIuKHZYCRATqcjYkz3TiQP6UmRNulxcAC4RNgrBj0OmTMq4yy7ftSsmKnNm
	TB1RmPBmqRfXeWtLPXjiibXBUkpwmTG5Q5E4x5v6u/oYV3z2bZBKL4svSeNNNMPIZfSEZZB7mEO
	4TVP1FxK8oHuD8GjFquTp+ka+rwUTzjIZG2XylMpLCvbm5n/KSuz+CRYc7SbqtXPzj9tuBe20n6
	ZwBkZeJ3UjPGhHKRO30Gpr0WCfzSWTAeCWnO58X4m1ccG2+k1v0IBll9nVVSGhkm8aI+/U0IQgN
	iORSXNkPiFTxb19lWI0D4m9rvn4KWXYwdGusO5ARmsFR9/mTtItcrI2bOogn68f61HlUeyIDW3a
	ViEsQ=
X-Received: by 2002:a05:6214:19c8:b0:89a:732e:f805 with SMTP id 6a1803df08f44-89cc4baf508mr90673636d6.7.1774518013926;
        Thu, 26 Mar 2026 02:40:13 -0700 (PDT)
X-Received: by 2002:a05:6214:19c8:b0:89a:732e:f805 with SMTP id 6a1803df08f44-89cc4baf508mr90673456d6.7.1774518013540;
        Thu, 26 Mar 2026 02:40:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20264ed6sm94765266b.20.2026.03.26.02.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:40:12 -0700 (PDT)
Message-ID: <834f159c-c1df-4738-898c-13e89df53957@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:40:09 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable
 vibrator
To: Biswapriyo Nath <nathbappai@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-1-446c6e865ad6@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-1-446c6e865ad6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M9hA6iws c=1 sm=1 tr=0 ts=69c4fefe cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6skNi_Mt2WqB1r5J5RAA:9 a=QEXdDO2ut3YA:10
 a=fFR93BqyA14A:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OCBTYWx0ZWRfX9OOGmFbgil/k
 ECIkTtVKG9z7dNTwUeMG8S5lUTa7LBs7p0PtMi1qvj1ywflPOfxQD1R/zXjMeEIsocXVlDIJd/C
 MkZX3DyGHih56Po/SDgvk8KTsoBHoa82ieYMHvz9yOyk4CIV8Ae9aNj1x4fcgC8vmHV9KzPGttx
 DGyyKl3y0NF/ia9axi4FDJi4Yu3UzMCQk4QGyTNrJkwvEB5XMbH9xPpsmkWpre5Tk2V/fStM+8G
 U00urAAObIU0x4C4a8mb8L5AQcjxTj9qEpJSefZj4VxFzCGCrAT5o7XI+4EDKSVYnM280qWclEv
 DKc3fUYWH/NEdBJ6VA7ORfUQXGs1dmmFqgz8dbNLrO6Ovjf3U/sQgnB3Z5entC1adDwzdvhMDWU
 9Z2dS6nRoPqYrHnuf9UkqCQtAl4T/lSR96eNklUW+vOyDr6OqIjWQQrEiLZ0QVXdj7tZPJUgHKA
 AlNG2J2uq9dTKWGifFQ==
X-Proofpoint-GUID: w-luREFc04It4glWQjuu4y0vQMIVAs3Z
X-Proofpoint-ORIG-GUID: w-luREFc04It4glWQjuu4y0vQMIVAs3Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260068

On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> Enable the vibrator on the PMI632 which is used on this phone.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
