Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC262D23A4
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 11:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751630099; cv=none; b=GBGgKH1Yq0bSvp7tMwrdOhyOQQ6bq2eaDx5kt3Hku/jXszlroH1OTLYz9JBQSqXEnQpNK78ll5JxwNnBCldRScLMoO1MKYsN89YTTavY8jfV4G9bvzrL+ogL9eKDxDKri8iAKLE22SVr+hx1WcsA+6cZsIWxPpDn+j2lNvAcMNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751630099; c=relaxed/simple;
	bh=kBoOViu98NWdps6fE95Kh19ydZRURYbRTNtdY6TKgTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vwt/V+2m/jG9/Tp0Gm5gNiy5TTQjIdLCMEClyTWqb+adRq8xdc7z5+4IsTWU8jmx/L4SoyrhWOt8bSLVN6mlPv8x6IxqFiWYWpu4rsGUJsLl7JIguYMY5+8P6rpq2hMOUPARVzxRDD0rSzUHd/ZRoaeou9/GZpI2UrZjlg9F7B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7NN3DMR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7NN3DMR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5649C4SG022207
	for <linux-clk@vger.kernel.org>; Fri, 4 Jul 2025 11:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oVnribtGvRrx2U99+sp4+4pkR9y3Diock4C2VMk4//I=; b=o7NN3DMRbBRXx2gi
	VU5j8BTAxMMc5atqI3LYHpskCl/6UCWFnYQMlN6kSSnxL4NB6vsqruywF4BcKoJC
	kqAl/7K62ssqXzmvNmn/ufM9zbwz2ux2k88KhulKnP3+57cg/p3RDckgvF10kB9K
	9zOTHO4cC/DmMt/0ZwhqYvHw5MSElt+LAIxgHxsCCeSq+SxgKptwUvir+6Ha2B5O
	yTBjTrE4v4sKpLh/qffMXIb0MVjsQLO4UgcgfBKuGRF43lbr0P+Q0/PWM9L9+3Vk
	eCbveVIiC4nqgHxO1GFAwvRLZyeW3THUMiJyI5x/Lib9iupTMh9qV66MlNpxfmwq
	Km5zhQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bw40js-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 11:54:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a5ae436badso1672881cf.2
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 04:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751630095; x=1752234895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oVnribtGvRrx2U99+sp4+4pkR9y3Diock4C2VMk4//I=;
        b=bi59o6neJH78woHGNqLECxuCOELZLjibAtTXi2EdglPzklWhydcODfP1xXdyLOOCRj
         +AVuVGTTri7pLD375on2I9u0Van7dVpxsQb95EiCZCP/ZT+ONBUR0wROjMu5qHCVFrDd
         5GLFqfHd7UUMtg0+AjMyGaTZm4xHEYISt5d/NrGtR2/XrKfpczTIenRsEzhw+p+3EqN9
         D18CV1QuvIXbwJa/u2D11snfpNo4k3J2gXpg97+0agJOHW7EGF7IU0c5vElpQ0qgfOEf
         jIDqauUtTgmhvDVb5fIyOtWW8vQGJwOKSwdDPzl1cRzgSMwGvswIcqOupm+Wij52A25R
         dzTA==
X-Forwarded-Encrypted: i=1; AJvYcCXvNd/fYUV8sGRCf8tQGeBFawTiqQSlbAYIkC5LsxTOvHw/kLofftk8tWDaXwkvAjB6RCoNnPGOp44=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqzUqgXKMfYd66EEFZC5KfwmzZNUVigrHQwqMNz/nyHcBzgvwK
	wb3CdcufyeRz+qFNAMBzv0KReBHNnvKMV+ZIn1zKGqtdz6OpZFnfxkXcUnmdf/hM3t9iDCiEQaj
	Cf63NPbuFpCv8f6hXVEzO0xZLdlQqduRZPha/tjddavy3HDs1lCQRlBvK0iwDUcY=
X-Gm-Gg: ASbGncsN6c4xhYiz60mzJbm6wtJpD+vxk5/UcLOuSgr3HbRxPvFFZxS7fVymMmF9+C0
	ERyeWXe++Gf9nKkd3ql/im61v0/8pUgza59Fqh516MKURYYA0mTYHQVh/XV0RKjHiYcgsk8UZiw
	f0d0trJOTGtz2v1FFeI4CA1EcBKH/TI0dVsRdj65cKk7Pu9JjCnrODsWIPZTrAN0DbU0n/nQE1z
	agrG6uUDicWzLcMIZy+JsXvA0c9o36CuTNOKTucXx+mrubZjASdH552ZZS7nc49elWRCsb4NBYC
	3iGPrbdBdFDyAnjz3hwOrcL3upRhxSaXyTHUip4acCyUgfdNtUJgQRWgrPtz0oLWoBw/b9qlaQc
	cQXkEEQ==
X-Received: by 2002:ac8:5812:0:b0:4a7:4eed:6764 with SMTP id d75a77b69052e-4a99775103bmr11747041cf.15.1751630094608;
        Fri, 04 Jul 2025 04:54:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIKC5nuUHGEaQphhIaG6OtNpGo0pYpdEktZFYxCrH4FwUf0Uz2dPk01S6AnCTwJ8mF/H6C1w==
X-Received: by 2002:ac8:5812:0:b0:4a7:4eed:6764 with SMTP id d75a77b69052e-4a99775103bmr11746751cf.15.1751630094122;
        Fri, 04 Jul 2025 04:54:54 -0700 (PDT)
Received: from [192.168.1.106] (83.9.29.45.neoplus.adsl.tpnet.pl. [83.9.29.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b64e9csm157844666b.165.2025.07.04.04.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 04:54:53 -0700 (PDT)
Message-ID: <ccd6352d-8c98-45f3-9acb-cd8b2d8d88e5@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 13:54:51 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] clk: qcom: Add Video Clock controller (VIDEOCC)
 driver for Milos
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
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
 <20250704-sm7635-clocks-v2-11-9e47a7c0d47f@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250704-sm7635-clocks-v2-11-9e47a7c0d47f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fiGGQabFex-wJLvYHeoFgMOIcHfsoMwy
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6867c110 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qmfFy4ndMtQ753Zl/n/b/A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=4HQsANGw-NoHm5yINCEA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: fiGGQabFex-wJLvYHeoFgMOIcHfsoMwy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA5MCBTYWx0ZWRfX6a4bjn5qnmVT
 7GUq69nYkRzQRLfHh9+LKvu6zp76w8PaaLUZhly1QwMdKjk1YUQdAQM20M4Eyxgno6i2KZO0mdB
 mV86qFjop9C3VBRVJP4u0CrbClLnbIIZg4lcsSuJzczgZyPVqbgOQg+nf3JvTZlve2ZvS/fqimI
 MeJFXQJixXm7ai9kEj70D7fmcC4vS2fTNmgZR0why63P4ZBWTuUaLZBWx9+O3hwXV7eS/NSE8Iy
 ORjjqXDnC8whJd8dYMa4nrbuFqc0SycjD0eXM7+jnd4xqGaADQIZ1F+PkAjZ22/DHAl9dxDVMdM
 1KsnvqtEqbAr2dE+kgHdH6tcXmaZEU0z2sfF853UnbzXSWWsFOu6rYzD/M1dFTQSNPNg5aLqGEe
 EjJ3Wt+DfCe113khTUNdysBZH1bxl8GN9NeZ2hnbMbADHs5/4Ti2k0l6cNN681+2Qa6/Nxjy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=920 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040090



On 04-Jul-25 09:17, Luca Weiss wrote:
> Add support for the video clock controller found on Milos (e.g. SM7635)
> based devices.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
