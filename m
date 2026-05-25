Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146CA33F5AE
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 10:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779703795; cv=none; b=EFdFbUOuzbOKAgWlyc+Xhdd5OfCJXg01yuJxTWgeO+UPOc+VRKDrnU5+I7kJmnkmAF4HKibLkhRjIU2hWz9VmzgyMqknPFHp12qK+v41A/NGDoUVW8EQcEr8a2SRdcaVI+8QIiiC9jjxOmK3PSCRinWWOHHUK4l/P3C8g5sMKbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779703795; c=relaxed/simple;
	bh=mP8Y9pKy6yJKgyXfuQYJdFdo9u6cmecZID+dcrPajTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YrS6LiDscpy8Pdh0q5LkHayV06W5vwvZkhko83JW85RTZ5H3hGExcubKIQr30F6+PFoaGLlDUpjcMyMl3ASd05Ltf/MsUM3MpDLuV396uL/IBJOZYaCVjgT4Mu8FGAZu3QziBRipTbNkucUR6HyKsLyIPVCA+mWad9EuWBzEaTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DbrYRItD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PgCIpdlr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DbrYRItD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PgCIpdlr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7ZVqo1927545
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 10:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/8Z7uOlX015yIhJn6y1raKw4
	TJYwaNZ3Kd7c2AF+C2k=; b=DbrYRItDZPi4Ok9ci7h70thanEvb5HZcUAwDTJqj
	Ib61Bb24gvaDJebAKCuJfQ4B4N8VtxJaBXjbcMq8ENrL85N0soMjH3WC/K6aN6Te
	VAZT7qhSVMgH+Ko6iviPHeR7GPxiRPq6kFqCf3FeUM/6ODvBXZ/yuNm3nmrjgFZi
	xIcHo2bARsqNRN7MkQ/mKYgMRVAdUTbGYmpGKOG4TxwzmVTWeNDTgF/bF7DCQnpi
	HJxRrQVRhCRrduGG8tU66/4xVM12ela50VDp3kqlRMOVzPn/eFsHlyTvtrdVIrVN
	ovOLXGoRPjnJg7QcL3B37ytKWCzWfuzR9oZzB3aP2cTISQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0wd2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 10:09:53 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6751c50552dso1398703137.2
        for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 03:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779703792; x=1780308592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/8Z7uOlX015yIhJn6y1raKw4TJYwaNZ3Kd7c2AF+C2k=;
        b=PgCIpdlrRhHtd3AqWCPIimazxY/jBaKoSF256Y527FyylKP8KY2bCzm18kgqsC/6Bq
         ggJBRW5AQ8PYvWa6I8QwcLtzmFKGxtht+WqVgg5vVG7Hwhz09Lh79AOu6oymGfOBTaBk
         p3e25CLOgUGmv+i4WNIO2OQWxYhA/hb6jFGdrkGLl5R2Vz378r9RH+CTj/Ly7qyeRD99
         pXvcFibS6x2zpzi4eLCeQb7xx3InXM50Skx/1wEkqgDUM0FoObAD/oOj6pbP0nuQ8qkw
         4tUUX8Z5o5GawgNtPySB2EvDA/Ktx4keNblGcG+kddMrJNVvOFHqAy/dVr1EHADw3HkM
         H7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779703792; x=1780308592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8Z7uOlX015yIhJn6y1raKw4TJYwaNZ3Kd7c2AF+C2k=;
        b=DR/XpXeAqB2PUkgfibKSC+AQxJQiZ5SvRNnRvyOp5usP5HwEilVue3voSQsncDPYs5
         Bia6k2uWcBHIo8YYRhxAnhBybkfOUkciMoNMhJIrBoto//1Bm3z002BwXBj7t/F3G//i
         CId0r+1+rH4Y/tRVheqCrjZoX4vNfsEbNuFCKB/bJe8Q/qS603YPtswXc/BAh27kNpjF
         lSoXbZ9KzDhtw+wRTCvs0JvknxXlnpYyuUQTgnGpeJvaEq9rYcvlQ6WvWJY7IPFDTK2d
         aCfUH2ioYH00WHQwKdJHc7eiBfnXJKSEei/thAnHltyYMlcbI6wqxaRkDf+XCpjoUwER
         KuWg==
X-Forwarded-Encrypted: i=1; AFNElJ8qs3KpJhoyrWzlFwbm6z5Fq4T8/7PJCSqTwPtAgUhO4DMTdaa6cR5xc/sFrw/jSHMHoL/QFHNXiwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVWRVJHWblB8dvfk+Q5bcyQZG2yCJzJgb7EnmHz/odg+d3xKL7
	wpNo2qhejC9VXOMOR7x7r6IdQpErmdZo7PPdoE5I9UaJYOTC27Dy9GB4K/CWqk5M5232aXyOEiA
	KCcwXPsPrCk7hAyYbBC+/1He47peizoaNh2C0QxEOxVSb9pLCLcJSOsyhy87CC2M=
X-Gm-Gg: Acq92OEjxv69TDdtD0IyZqnwJNAWnJ5NvRhQLijGOlZiVGoOcEOk5YY8+iJnmPAML2z
	XEI6AC0S+yZ0w+Bovr2sDujxpHxxC1O4XC7TZiPcDgtgqJDd9E4IGZ1Rpt1fMs2s5uRcStzAJb4
	Rn38JOMJqLTrmV3zZGU2XXunUjmLX9extS5JuFRFVYu0HAFup9OqB084fpuYaazvPG2WF8965ik
	yeoTv6+mqJ20Qt7/6TBeWb2WYne+weNhcv6IEsiFbppHgeXBfQry+ExSVPpJ62bBEg9uz/MNaIK
	dWubcsdl0Kr8pAILNHOwmi9jgf2uIk2Q5/FqiahR4aiMxpbYxi0ZIUczbXurzuyoKhBhiDuB3PW
	bMYhGyJ9R7YTUEiWnle1aPUoD3BwI3ADSh3l1yybKIvN0oexB7xhmrjREFJ+NHPXkLYeEMXcCzo
	O/murjTQMZhIVIC+imaoytEBXRDdH8B6s+jW4=
X-Received: by 2002:a05:6102:2c8b:b0:62f:4349:ce2b with SMTP id ada2fe7eead31-67c86c90d4cmr5933485137.30.1779703791907;
        Mon, 25 May 2026 03:09:51 -0700 (PDT)
X-Received: by 2002:a05:6102:2c8b:b0:62f:4349:ce2b with SMTP id ada2fe7eead31-67c86c90d4cmr5933474137.30.1779703791492;
        Mon, 25 May 2026 03:09:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cba53asm2589674e87.26.2026.05.25.03.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:09:50 -0700 (PDT)
Date: Mon, 25 May 2026 13:09:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-ipq5424: drop the CLK_IGNORE_UNUSED flag
Message-ID: <pa3xr7dqro6yxo2zsydnybu6fomx5su2x2ccawjndzd3yqubly@esevqd5q5jon>
References: <20260525-ipq5424_drop_clk_ignore_unused-v1-1-7ec63e347f2a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-ipq5424_drop_clk_ignore_unused-v1-1-7ec63e347f2a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: AF3LvpLjgRKld3PEONQikoiH9RNmVPxk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwMyBTYWx0ZWRfX1DQuTO0aUHgK
 q2ZfyicZWaQHoCjfwxZcEuYcSBCEqcKL3mmeRjEBDYIRNNrjmM6+WaBISf4bYdAQQQshVnXcO4/
 3fCF8LUXJmUszzMaDdBrzR6+UgOjKHgX2yEjA7Mxyu2lCOTBNTCEW2hR6C7ONgXIvFdJojxPrGj
 n8/oNjjsSMUxq4Xl6grUCFJVFMIvgNGp3+X6hduMtMzjdHv+eISoTa5On4YRo0aUzI4aTzKXSmp
 zzN0O9diLzqDhbbJw0krInc8l30ky0ZBPesVdtClQX4aM/w+hi6MITsy1/4SI1YcJtTly9PANUD
 syJ0c4UtRnqfMnt23wNTwuPrsouu9vbQpxM2IzQ3x7a05ShfUwQVXmhkdwYKAp0i4Ipt7eeZWK3
 PMmo28GBxKJlT7VNgZWmwRTV93VIC8mFW7S0XRdDuocENS+eCGCYJpOW+UL9yQJCe74EUufffV/
 ue6OhB13Zyafg33I99Q==
X-Proofpoint-GUID: AF3LvpLjgRKld3PEONQikoiH9RNmVPxk
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a141ff1 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=_oG7gLS4OdEnMWnebfQA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250103

On Mon, May 25, 2026 at 03:07:17PM +0530, Kathiravan Thirumoorthy wrote:
> Now that Linux has the consumer for the GPLL4, drop the

what is the consumer? When was it added?

> CLK_INGORE_UNUSED flag.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-ipq5424.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
> index 35af6ffeeb85..3ddd4b3aedea 100644
> --- a/drivers/clk/qcom/gcc-ipq5424.c
> +++ b/drivers/clk/qcom/gcc-ipq5424.c
> @@ -139,17 +139,6 @@ static struct clk_alpha_pll gpll4 = {
>  			.parent_data = &gcc_parent_data_xo,
>  			.num_parents = 1,
>  			.ops = &clk_alpha_pll_ops,
> -			/*
> -			 * There are no consumers for this GPLL in kernel yet,
> -			 * (will be added soon), so the clock framework
> -			 * disables this source. But some of the clocks
> -			 * initialized by boot loaders uses this source. So we
> -			 * need to keep this clock ON. Add the
> -			 * CLK_IGNORE_UNUSED flag so the clock will not be
> -			 * disabled. Once the consumer in kernel is added, we
> -			 * can get rid of this flag.
> -			 */
> -			.flags = CLK_IGNORE_UNUSED,
>  		},
>  	},
>  };
> 
> ---
> base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
> change-id: 20260525-ipq5424_drop_clk_ignore_unused-90bf48733c6e
> 
> Best regards,
> --  
> Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
