Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7979275870
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 11:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773660971; cv=none; b=Zjp1iujai33bydtCWOD5XcEhysZYt2Y1zxl6/ZXkUnppSbCsti+KtBE4jzxGnAIXwpr/Kg64QYTEyoFWtGW54xgJWODk1y41O6FuZpW5gBr/fPcFvQFzP6Qd3DYFN0OPcbXVh8LyQl8hTRrSQr7yPqsJpfZwHHAI3bMRKY2rai4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773660971; c=relaxed/simple;
	bh=8FwFRyaHE17f2syED6gekJanvTHmxZfOiXjWXeA8/o4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TN6OOdZsmg1BzvjLMdd5Jx6fkcPGw9hfI5SzkJ2vIv81jk5Ob0Vqf4haoknsUq98ZhP/6Es5KBGE29gOyiPdvOi3nvaJZJzcCq0zCsM2EPrmpcfMkWoD760zZCQYta3MREUqJZl97Og3FSw/WmzoLy1OUMVPH4KcBZWq2Vpnq/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlp0uamW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hr/oDIxU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlp0uamW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hr/oDIxU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64kxm538960
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 11:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HEmu8x7YnoGavOpYqOOjOXAQEDNHNRQLuY3SU6FWFNU=; b=hlp0uamWMev9OyoB
	o0tQQONbuz2tkrVmFz13Gd4x912ovMoiIcyJuTlGeCUPF7m3UudypJVXUvi97/Wy
	T+mi+oTVwhPQXI+NlAQ3AD+DfHrDrumAPQpK1iphK1HvTQas/dAj5/7vP2BjN9ga
	zhspsejeDWSPDAXgIlvz1+IMkgdyHUbMzhn7lfoL034Yu6VVtpBQBFExGzYZAVru
	uht8A4cMm2t3AqzzsfH5PCs8p5cTPQ6FRXjg9D9cK3eJMxoB8EV6JrIDtB+tkY1z
	bBFn0zk7h7Wo9JRt2ZeKLs4cG4s0A7NidVhuttAms6tq9hnU16NO0Am10FRIvBbK
	aPNtvg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyy5nfm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 11:36:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a01982dc5so42978216d6.3
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 04:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773660969; x=1774265769; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HEmu8x7YnoGavOpYqOOjOXAQEDNHNRQLuY3SU6FWFNU=;
        b=Hr/oDIxUJzXnJn1i2Jg7OknNknlNpaewSjP88KmqrSK+cEA94wik/BC9OdyAHGPeJe
         wh5xJI2xIkMwFg4Zz4zv0awgaZSS965382SSqKbi4WtCYVdnNJ5iuhCbMbUsg46EnjQJ
         WBoX2JAnqL+6ycl8YK5wFHufL5Ia5tumhgnddii2HAUsegLyZ2ufQVVhhPffSyBnNd0i
         gpKUCpNhII7Jb40PtXRGSAm6/cbn45owaeCzHf4zpopCXJseI+wx8RCxfHOCHZiojDls
         yhDGhIH4jGSqMA9/6z58mjIAbTh/cx4y25iUqi9q/fcscULg0iaC2CkTiGqwJeI/1R5L
         gRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773660969; x=1774265769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HEmu8x7YnoGavOpYqOOjOXAQEDNHNRQLuY3SU6FWFNU=;
        b=fW+zyC5XMiATc4pcriJrDvKUDjVBJ9ob46nqNYlutAxdgDA2fnv+MZkC3I9Gb3wEsA
         WmJNtSe26sV+hMl6bQdUivMtQl7XfxhC6rzR4g909E5NabO4r6Sto3KmGN6n1gMaWTTP
         axjHxUJGakmXXVnAPE1gYyJ8vTbfsamFqHkd6w3MDKtMGOY1i3vipgCuC1nx4JHNxPVu
         DGtJK07cqtszD3re24ACCLA2r/cojyftRtJfwlvwWzlcsMd9xNWVwKnO1fKLKix4WxOY
         is5AQDs7Dom0HbLUeUOjbHW4aEzGeUu9IV4C/wsk+Qu6ZXTlZOCUGYvJLGxbW5jJPChI
         qHxA==
X-Forwarded-Encrypted: i=1; AJvYcCUJKMKoyqVANWD9jbkTGnNN59HwHU1eLoy4gbETygKUR5TKaLSGwfXCVl84oNFTPgVgCH41ck9c+2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoGslNgeLH4Rt9R3isoJY7s3rhEJMuKXZdkrxasO6p5LoVDVcn
	WVNtqblK6OA5D+kO+Z+ly6PQz6AMKryi24a6xZPt655mzoQYMjoEB90TNHt69/F9tGs70XsyEB6
	3joz4iznlYrjMBLhsFDs6MWsOODoBTidbQrYiL0ud+ghPWlo3QAtgHCVib3K0eSU=
X-Gm-Gg: ATEYQzyoMfnDSwr+i5NlJiY15tw/Dv8EtVCnKIP+AOpOZqjmKfZ43y9QGNa8hjggRHy
	Gj08/lAKExM69/K/c+sbZI4oJIMjgSUjyvgz3zq8Is/usl5ytvfg+aOLOkw9SKlg2W+Q448chi4
	ejoHnx9Pap2eoBy+nAZWwN3dtgucj6GI/r3udn0V1PK/UEGBYQ8+3WXKsES8W9pqR5w5008d+K9
	Q9MyUECEMQ6AmByjXAJp0tcFsgiqn/L0Nb4pph0F3zeTIFY7eLJVBSiI5L2nr67TeLaFbvE1RD/
	MIlM6tY7qcUtyEU+hiyyMywSYUqoCQpf+6xvo2anCkAFlYoQdZg9Jx0FgOdKcBsKtKsiz1BsrLU
	+ZV0+gT8MtwxKxwSh1JQyWNbYHak9DJYcFz49zln207kjdUcrEZ2T+Nwi2kOxlHVY/HEWNmPj0D
	0MaRQ=
X-Received: by 2002:a05:6214:6119:b0:89a:5042:172 with SMTP id 6a1803df08f44-89a81992936mr108497316d6.0.1773660969070;
        Mon, 16 Mar 2026 04:36:09 -0700 (PDT)
X-Received: by 2002:a05:6214:6119:b0:89a:5042:172 with SMTP id 6a1803df08f44-89a81992936mr108497056d6.0.1773660968490;
        Mon, 16 Mar 2026 04:36:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97a6d8986esm288053966b.1.2026.03.16.04.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 04:36:07 -0700 (PDT)
Message-ID: <b1edb0ef-ba17-4add-871b-0903912a4ed1@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 12:36:05 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: milos: Add GX clock controller
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
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
 <20260306-milos-gxclkctl-v1-3-00b09ee159a7@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260306-milos-gxclkctl-v1-3-00b09ee159a7@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: p4-sybJT2rUF7N85AyKryYCMzUHemTzD
X-Authority-Analysis: v=2.4 cv=QOxlhwLL c=1 sm=1 tr=0 ts=69b7eb2a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=1NpoCAVN7wpv3VHWicgA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: p4-sybJT2rUF7N85AyKryYCMzUHemTzD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4OCBTYWx0ZWRfX3nP4E+5tXXyD
 Nx4pTLpbYRbFG4JBly/6B/ZqA8CqZa2vWh+0X201r49po7A0NDAjQM3w7e5AYPd6F5mE4N4xx5b
 Q8CByxR+KXULTwgArlFPcgVLa7oTUgZZrJD1+gNucXOcDeCCEFMHcCxF8Que+ifLMLhJizAZk7U
 o6Piipz1R3KwPy3n97J+sGevJtTSY6RrLWVTjd3rwbEz/cILDyoAysjbbHONlmZ+kzwpEM9bo3o
 l3Niv2/4JP2LKGpBqKEPJBCqyX1ehssPoDFDq+wq9i5X4johTLuXfk2LeQiaAhjRj/En5pohtbU
 VY+y7bSPsaMKYfgB6d1MKgr3kTddJ1Vs+S46dFNHzg4AjOcE/xi1hSbdoJ5nuENt7csaFQBvb7c
 SAS/+OOWE83cBD6SmpR4kTiijwgRDpWVF4sr6RhjHmbRqGMLTKXfe7vxyo3zTXYTW/V/Hlyd75b
 x2kk8EmgQKmB4lfUACQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160088

On 3/6/26 2:48 PM, Luca Weiss wrote:
> Add a node for the GX clock controller, which provides a power domain to
> consumers.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
