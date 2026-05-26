Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0963BB10D
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 13:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802761; cv=none; b=uMS1mJkhJzCEDc7FwGxTjFWjWJJoTBCHqmm3C6Qo6m8h9e8ZXIYAiAyABhpSLifL140Nm8tVtGlfZe4J6t7fPCxo/Ouxwn6xdakH2az5gz/jRp7iPSmu0LZPUO+Yiu/oVIzJYwzvXIQHeVYcdQV67SdTrF6cReCdHl4E2dzeQmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802761; c=relaxed/simple;
	bh=LKc7E4xyh/YipMFv9PN7qqgfG5S7nb//eEcppSYthyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O41i4ZsFBndshcy5/vubnjrOY/rOuN5Y+OtCRgdjah9dt1yrwORcgyGyp5U2EZtOWGl/GdDOJAkga0y30ONZmh9JJS0RJx4l8kai99wb8O7hiz0vM0KQwdJHOpEaGkCM+v6tQw5d/wWodzEXA21CNc6t7Xo6N2fxQbX1b+/L7XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CX67yvdg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=St1MLkVM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CX67yvdg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="St1MLkVM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsVAI2385467
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 13:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HYokdGbi02H97EDVnPIo/4aG
	E6yDYmZQWikQTVVIxw4=; b=CX67yvdgBUDc3Y/9wVk5s2x9pcn2DJWoMO8MjsUb
	DNWtkyFvdmRVVrj6hKtEXsRCvR/U91g5gsw7uLkhsLNPOx1jQP9r8FocYh5K/1UE
	QMQ2u8W02Iip9JaZ5qDLqJrE5XhEO1dhQJmdaXSr3u5Y7rTPBOx+Akjo2w0AmEjX
	4GKLuJEP/eSdKWGNiwPlARIayE7euznBQIZ9m4JZvVCg038K+ZnU4PAFoQB0TLog
	Q3cBTQNmGoDTPKofS3WOlMWYgvqw7/p2p3ul/Zyv5pds53j0GccR1DcCO0EcpbfB
	3s7/K7jdX3jrvQETdnZYdmqtqvalPBRl1XlYmDbsqAbLDg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecnhs4ywd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 13:39:17 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95fc346e02dso16733353241.0
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 06:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779802757; x=1780407557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HYokdGbi02H97EDVnPIo/4aGE6yDYmZQWikQTVVIxw4=;
        b=St1MLkVMfScLVtctRO/lWQWhSd3cfNUegXLFlmyE2mN1IvFMjoG/nioccz8aKqGg0y
         n+DGzC0MS0kvv9XE+AZ1zl7wN7aQPo+Hb8rxVnXKpORNyKZ//wjqhkq5WuhC1uFALYBs
         Mm5+hQn6q6kBpEJZk2xyaxbe50A+MQtWfGLcmJmWKyIawcsh/tTFrxwqRU4DjkE8PA1T
         8dk7b3y5n90uuKgvZuYNeTQKbQvQowFJfLkajlttJPqjZ1BCNpl2PEsUNW7DOHcoKA9E
         kgpN4fQXj7Zbjcbmp1YzjgvgZ729xkm+tgoNhMa3pLK83k5wilEX8qEqCSvf/3g+aPwK
         bHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802757; x=1780407557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYokdGbi02H97EDVnPIo/4aGE6yDYmZQWikQTVVIxw4=;
        b=aXWqwE98aY+7IqgGSqZAiBXz4Uj5NoKCqdg8nvjgxJSOg0yojqx6DeF4zE+g0Jf3m4
         Vza3Q2D85v4CRSzkze3nAkOM1j+oL56F87PbO5jGUJTe0f3V6/6QbObXrDxzocFSgXAi
         Nd8lQNCZ0c0gDMta0ktcXd8tsucFgIVDy9e2VN+mzRYh9aT4G57b82dWmVWhOFLYeI5t
         rA8YhHjwCaGpcVvv4JJzNmdHKz6ov5z8pr0WFol0J/ZWAIz72crRtolOdAr7qwVoGw/1
         2jFb6BFlmgR6rA8i8VpaFemPCtmMPv5ie2SS6uhmVOTFGcPCif/wU1Pc0SX5fApZmq2l
         5U6g==
X-Forwarded-Encrypted: i=1; AFNElJ/mG01A5LoJDJEbTqP8olcgfQK34RJMdIbhd+JNLVBU304w7S08fPJ+OXVq+LgqUYPJ1J4aLiSpAH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWt9+R860uZFsWxXDLPD1uz18ig09HpKN+rZlzygJbXyYbrPpl
	NYyK8b4Y5S94cTwW+xiSkwn9ZG9xG+55M2mC4O9LZf/y6YWFZpuAVAArWGAKXkokVhzlKZ19E+1
	pL53kRyIpLpTloGg67stHLsvPoYjZ+gM3a8INMU9uZnIg7MH1lgqTq9tUwPKJgAk=
X-Gm-Gg: Acq92OE3CRmubA6C92b993PvoolPCbTiiUhU9yQIUv1MoocdAqx32d1TWUm+hexR+HK
	9FiJfoAxboCjiX9fzlA5fLhHY0BM+SR3+YwBFtbDvHHx2JuL9j1Fb6c0dRC+4DhO1/xcNl9cCFB
	pWuXaxY/kD6RpbJSkLJa7VIW4y5+IuRQa9U/3pozi/z33TQNOnsLZD5FVFW6tOhro5h32pCx63h
	PWw7X1wA8tqdTP9kYFiLvIWLH6k0EWp1BUkSy/+VW8x5djnaRJnsAer9K2o3oxb3kJjxSPU8yOU
	2WMTTUE48fmtGZtKU0MFetd7eOJx6cUxLYFxrQnZoY9B44hqEfcBa03MTthWRmO9551zL0O00Pc
	V7827vqxvnkvbss3UdEA67hwW+dBt4vOnlvFUjg8Dhc36Mno9Ma2/zYber2BmcKyCNL0gG0Asl6
	mzWreZJVVA76ufaGBZQFX/seISO/f+qXklmwo=
X-Received: by 2002:a05:6102:b0c:b0:635:420c:9b00 with SMTP id ada2fe7eead31-67c7300c912mr9734161137.10.1779802757131;
        Tue, 26 May 2026 06:39:17 -0700 (PDT)
X-Received: by 2002:a05:6102:b0c:b0:635:420c:9b00 with SMTP id ada2fe7eead31-67c7300c912mr9734129137.10.1779802756554;
        Tue, 26 May 2026 06:39:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dca7bcddsm28672771fa.16.2026.05.26.06.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:39:15 -0700 (PDT)
Date: Tue, 26 May 2026 16:39:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: gcc-shikra: Add support for the USB3 DP
 PHY reset
Message-ID: <hxrwzxhsp7j325m4eqslcgprfzcake52kr7kbae25u2oxucfpe@urnoctzbiwos>
References: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
 <20260526-shikra-gcc-usb-resets-v1-2-6d9e7fee2998@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-shikra-gcc-usb-resets-v1-2-6d9e7fee2998@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Vd3H+lp9 c=1 sm=1 tr=0 ts=6a15a285 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=5L6ES0iTLAyjbOlHcnEA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: 5e2JYy1E2E6-CTbFAFS_0UqqMRZzN-10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExOCBTYWx0ZWRfX5nOUO2FA2sJj
 0GrBPqtbV5wpjJdqIEQitaqBJ+rOv0BEMyU6p18+6BED4p19SPvvQwlIDwoGkpTe39HwIR7eUoz
 dhehwhyiX0SL3Hmc834+hl32z/76VJzwBkEQDbos449JllxSq4kvgx/J1dDkOOFkDETvMia9xdn
 w+Nev7SkgH7wao8DUN5kJ751Xaj3DOoSuXSg8oho1ZOJsppf/rZtJi/+7TfNRFUr/889p9U3ekR
 28k1nRgmIxer0moH9mjzKZo0nvckfgko+p6VFqSbB3QwXpqNQlEp0kIqivuniB05vJTO1ifrX2R
 zJx34z8aHsi1xdzsWHf8SKxizOJrQOUk+CpxFRFGGaFBXaMret0yWFQlGPN/HIEc3hcCfU7vYn4
 4ilXz9PU7b9nvchtKPA6qnCYVlCpsZ2CcTVnCMbKWkAhD8jaNR8kCd8ckXKxsB11sKj4xyb4bjW
 3KSyx3UqDHJQ+OL8nzQ==
X-Proofpoint-ORIG-GUID: 5e2JYy1E2E6-CTbFAFS_0UqqMRZzN-10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260118

On Tue, May 26, 2026 at 06:24:45PM +0530, Imran Shaik wrote:
> Add GCC USB3 DP PHY reset support for Qualcomm Shikra SoC.

Why was it not a part of the original submission?

For the change itself:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-shikra.c | 1 +
>  1 file changed, 1 insertion(+)

-- 
With best wishes
Dmitry
