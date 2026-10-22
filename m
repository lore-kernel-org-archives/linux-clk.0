Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655838;
	b=0oPi7+xQc7wM/yiVgXtTXWcDslX+x7/u62jrRrv7Mm3nGZBZxuChs+VlC1I2IqntU6Hq
	 rxnwhQLwBQTmtMoux9eM9p8837DQ+iPQ7iHKZ+ehG/JmiMUhc2mEGmuFWBdSTL98fL1Jy
	 o66dYsQXLUf7v9imrqw56hL1aWFf//SxX08gpvP4lzqbbxBYZgLtThgOSB/mzbUBkY2/Y
	 N3cVN71cSgTK3IPmS3hyqaqpHYGTiGMOfxJhvAAy3BgqjkKq7mCsjSucm78JXDjs7Wi77
	 mxc6xPs16vHQ71ReuJqzE7OgHJSKbmCR4kL97GgQwIBfS56k7FQRt/kHt7MKtrzmUwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J/8G8u/GUEqT7hbge7ssUJBRPJYsFNJKrWSeXNi30Q0=;
	b=4dO/wgix5RMK3Qv4T/EAhvdZsSVRXoWHgzyupuOnmPb8FPFTWcaR7G05YAqp4hf6/9aR
	 1VWiCMutG4tYBXy2IgWCcU8hrHnyuvxhSwJYmZM2WnEtrkAi37ytZxVtKUX9BoF7fNSS0
	 J9xH7c9qZZ/tWpmHa6P3/QvyXleLVQ1lxr7ZCjy8vl3pu6r7OpfJg4D3bnbYK53wEqK3l
	 sgyn7FBpApmbVbnbn0+jXqLv74E1lGryFLTA3ZQm/OhAAyyJYXzT76ycoP1hGLsAJPKAz
	 AK/AuRo/2FX464o+aybE6IJBvJdTzG5VCtJaahhrnQvCf97C82/BKDnrejxs9qFzntw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ey0mmwdI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QxTi5qOy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EB5606A326
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 07:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8EB5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ey0mmwdI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QxTi5qOy
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70KVr2516998
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 07:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J/8G8u/GUEqT7hbge7ssUJBRPJYsFNJKrWSeXNi30Q0=; b=Ey0mmwdIGvQ01Sx6
	4L1N6VQ9B66ThUSSp5oRGF0TM1LuUIpSFQdcJDgxDW0qDc5I6BktlskV+x58Rjui
	YKATMBnfwyoV0P+1fHLGXony60TXEs3CbqBwCsg1kAVU0KbH67qV7Ojpn3LnyZTp
	KvOJa9D6v6qgvSV9lw9AQWYb25bdhWkPcT9usBjiNktbLLpn41LsWHePPkhrxToe
	nYlFa7koonTz3ACgSBiOlsdUdTDJ6N8YHtBj6lWnL2fR55UgEczmfRJr6Wt/Nr69
	JPRJqPiMcwICnKoZBnzZtQ7cXSBhe3hG+ndKMZD8uwyxr49+bXSWZayIdtzqolLv
	vqWsVw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a9bq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 07:57:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e629c7b16so36104585a.1
        for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 00:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792655836; x=1793260636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/8G8u/GUEqT7hbge7ssUJBRPJYsFNJKrWSeXNi30Q0=;
        b=QxTi5qOyh42Itp86UZAeExknuxu//wDA0xEJhAqdPtYl45cynBRplNhNlKJwAc66me
         iz9n+hd8tPD8O8JzjZ+YpRNBlikKev44/fxJXRohhDhs6NVoHWKmS3FO4WdT3E2TJ39v
         1zWwPZI0CQZ5+3g8KI98Bpf+ZkoSJwexGMyRSVUpVGIU2oHPlSLxX44tvjoaJdSyMewz
         e+00ilTo86PvDAYwY+CSU4gy9axNmt3qYWds3eh5mDZqvq16CGsSX3aWVGD65tHQEmnn
         10CS1WkZm6eIlrrzeOYdqoxAOohJPUCGcsvHsCkZeii5fLKoLQUmtxWTdDKxH7Lp52V7
         B7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655836; x=1793260636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J/8G8u/GUEqT7hbge7ssUJBRPJYsFNJKrWSeXNi30Q0=;
        b=xHlHkweYPRj3vWCDEELCFEhtXnLCOn8Ih8ETodplz75SjbVE4Z3/B+qf+R8n6iaKCD
         Xps+E0RfYDTYTyXwsYCVdAnpoY7zDOBtQQretwaRuBn5kB3ONZOlzenKM7Ns6jVvKGXy
         bwQhWt/IMT0l3yTL2qTk6ej2a5bydHYpCGfJx5QnNJ+1BH6Z/At8yRTiqcR69Cx822Lo
         5NMYylYMPupyofPIxvKzvMKskBnyZdzJFYfShQD/DRgornRBV4WQVOULzNIj4m8s6BL9
         P142+FG6DD2H8kBGYhVqFhOCdz2fw/mx5wtpCnHuIdcktlxJtNewdsM5fDhEwJAGVmMF
         5L6g==
X-Forwarded-Encrypted: i=1; AKwUvByuoI5MOylBXadfPxuaQl48+6+ME67Vt8uIV5ra59nfMe30RjqWjzhYqZ3qE5jBpGmdJOqFGi140Bw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLo/w9R2wrXnSqeleciQqI4m/JLDbp+Zd0B6x6dzo2eO4ztIp2w
	5//Sbd13JI3WN5+8hT/ZE12zYS+decg6QHTFAogfct5FqttCuAIwnNeG1U6q9gFdTLtwn/WESpe
	ULjaWOMDtIVRv8bVudU0BM8Cpv9dP7yLpF95TlGHUpXvf8R87oZ6qPgLFdAdraQ0=
X-Gm-Gg: AYBFou3GWYjd3ogevp3NVQRIwoLj0GWXFqXAP5xa4Ido5oK/cmDP15Bv4Sj/on0HYEQ
	4iBloP46WB5pcoKmIfexJ+bqTd7nkhXT54J+qlbVdjD1LbHffUJDMN0G7qusQzBZv2I98omv+tl
	XWAkZbr5gfIIEg5uqNd5NWHuRHGu+S2mhiNp19w1U8E12II/jUnZOY8TSDNf/XJFsOrUmigt6RR
	P56FpjLItj6h1/Oau6dhffhjZRlfnb/DKFB6A9o753fLJvTZAHwGR14XsO+HlAjgKrmz2r08DK4
	7bqoGN3+y/UdRpLgIJSIdes2xcqh3fVpIrAMY3+J3dO9odMo7happ+P8wqmcUv6kGSZ1r3euuv8
	0Wh5K8lCxqgO07+L1P4Hlxw==
X-Received: by 2002:a05:620a:6084:b0:939:8148:1e3d with SMTP id af79cd13be357-93f57eecdc6mr929996685a.2.1792655835857;
        Thu, 22 Oct 2026 00:57:15 -0700 (PDT)
X-Received: by 2002:a05:620a:6084:b0:939:8148:1e3d with SMTP id af79cd13be357-93f57eecdc6mr929994185a.2.1792655835451;
        Thu, 22 Oct 2026 00:57:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a61a2bcsm75777166b.87.2026.10.22.00.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:57:14 -0700 (PDT)
Message-ID: <1b31946a-9170-410c-b882-34e8b2b8c812@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 09:57:12 +0200
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] clk: qcom: gcc-sm8450: Parent the eUSB3 clkref to
 bi_tcxo
To: Sushmit Singh Rathore <sushmit718@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020142157.1749-1-sushmit718@gmail.com>
 <20261020142157.1749-2-sushmit718@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020142157.1749-2-sushmit718@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ad9c1dc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=9Jw45f44HywjUvPVWqEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: CuzCyhobnEvjhQhpZC2AfK47UAKHU53K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfX0bQa0nfDnKCZ
 fd/341lsy/q7TipntPG7kgcQMCpuURVeGe1A3zFDpOnOhR7o39eurRGBL7MtiO69XAovc3EfMvO
 FhcVLEwM8+Rr2n4arTZBjxYiioU6AFU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfXxNW8SjwS2A3z
 s03tKQoTleAHLO8B2BYFy+wyvaWRiqP0yrxgtwV9+KvQmMr/8PtRG5P2un2tJxCKkHgfesYlxEC
 qGGl4HQ+GsT1qVl5XVOlh8C2rm+753y1YKAvV717EqAxoDdD74OloFKlpxmt43ucUAlP/csANm7
 DvWIInnKS/VVg03IPbKysGP6JmigiJeldEXH6h0t8/eOPHqfPjE3Mv5Ni2y7Z49927IcpjyPd31
 hWCUiG/jrwOuZuvrGRYM6k8la2mIjvFExrruyG59FzwRVQfAHqmzqsSt0PlDI3WDliHdaBG/sb/
 npn68HCMqWqXmxjfUKQ4KvoKT4/CW5mRPq97CfO5HD8eRjr4/wN52Wc53bImzxOrkgZh35coGrY
 Yb0LeOsI58h0CLq0I9ezRXTnGk0coY6LVasNpSo+/0TORYYU2Q2Csf9idnBsSYyobXf228xc6P2
 9eF5aB/aCaSke3Ix1/w==
X-Proofpoint-GUID: CuzCyhobnEvjhQhpZC2AfK47UAKHU53K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220031

On 10/20/26 4:21 PM, Sushmit Singh Rathore wrote:
> gcc_eusb3_0_clkref_en gates the XO reference to the eUSB2 PHY, but it
> has no parent, so its rate reads as 0. On SM8475 the SNPS eUSB2 PHY
> takes this clock as its reference and rejects a 0 Hz rate as
> unsupported, so USB doesn't probe.
> 
> Parent it to bi_tcxo, as tcsrcc-sm8550 does for its clkref branches.
> 
> Fixes: db0c944ee92b ("clk: qcom: Add clock driver for SM8450")
> Assisted-by: LLM
> Signed-off-by: Sushmit Singh Rathore <sushmit718@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

