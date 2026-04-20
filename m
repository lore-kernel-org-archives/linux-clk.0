Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC35A37AA83
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 17:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776707254; cv=none; b=eqb39GoPuWv6oI2ilGmuXDlhXhQsyqZuQxWEVq+0GirSvxkTHXIaMVqULT2u0OiovvP2Wlnry4Y6jEm/4tLo06XUeIM49R85HFa4FYCoAHOU2o3ap8vhqOyluc4atBFREuLHJvKoeWFGMKMuDYMWOuKwxh+/A7ApMnSSe4usTE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776707254; c=relaxed/simple;
	bh=Kx9n3XoxEb+C2eGxfAW5ADUZqnIXKow7DegyLtDquO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dut+39NtDhNLmIjRrIWQdFMWDp5Mjjg0RyAIDQdLiW1fPZuJmLLtuWcY/vv96Fg0HRAqdkMVSp/OrGb5cd4eMboNhH2LrjlRA5h05J0/TotrHzVX3pdqYs88IpMOtfghTCE47jqPdsT/7D8tX6N84OzpgJtLDDDRyWetcZ2C1kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UNIz6hdk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/Af4/0p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UNIz6hdk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/Af4/0p"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFpLcQ2281651
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 17:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QIAE27S4JIeRv4JiqJVx+ebt
	OvkF7hDqjRG8Zy0XUyg=; b=UNIz6hdkA2+qJFn63obwviJOwG6cF6ZvGU/dfVf8
	YddIJQAeskjcpTZEfzhdiDdAuC2ty3lXXpmAZyoLucu5Q3wWtSy3bft7YSZ4ZecV
	BMfk3LTVt8H+taJN2lTMBAMjlB6UqY5UXwNjgpkLM+fCP7Qrfa84AkHxuKbmx/Me
	ZsdFe6iihC3Rzy5j99ontQTUhUMfU0jSw6K5/PFFSMPa/cvoorvKyoQrdeij+/nL
	u172lj/w0VNV/15SIljakdb7nnFcjA0aIb00kx5e35jhQAMWi93S0nP/V/ZvVvH4
	WtN+GHONwcLzv2x1kpEDbKOssEox6F9qYoux9zs0+CHV0Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh599y2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 17:47:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d58bed44aso41290751cf.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 10:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776707251; x=1777312051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QIAE27S4JIeRv4JiqJVx+ebtOvkF7hDqjRG8Zy0XUyg=;
        b=J/Af4/0pfhGWkJ9nVhe4l/svOTspSv5uRY2qTKvyNSDzm+TttuqCbWjGjGpZ3DUkaU
         YFiT5FYz60FuRR1eo1Lo5qFcD8DQ40pIQqBaY6F3hEKKAZp+Q9duo5YA346h0i6AbWWC
         GJJsAqu/sanTjUI569REVDRpHBHTV1M/g4KSLpzvhLnb1trHmMe3UOPtRHbIxixEF6sE
         KOlrWzfgXn4TbjeMkuf/dzWNALqQRZuDehl+HvBwPaXISgUIawB9d5z6LAJX49X0Y5S2
         GBgxGuibRej2zI9oTLldPrstuJhPi6DyneZkeQgAHDSovQyxeEMbNXLCeqbHpIMXVrYm
         nHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776707251; x=1777312051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIAE27S4JIeRv4JiqJVx+ebtOvkF7hDqjRG8Zy0XUyg=;
        b=RkEP356s969jKCSzFDrLnjrVyoXwDpBra0/+/T45UjWcl5i5+eTpeHeZ9npDAbZRVZ
         AhYg4J+JRt1wfWr1IxXZvy3fqQ5thN9XolZd+nElqlRHqgfVB5ZVwoiSJECE0IG4uowC
         LkF8e2rOod6PLVF5Ew9X9xSncsjMZffJ51RmifQ6Dfm3Ve78+KJzErWt3y38tjEP0D45
         biU2RwG3tm0Hru1f6MvTE5cz1LtvWzYoeD8UaVCshA0khpfTACtyNIJr5KCKtcX2k1kv
         kBQe4Ko56FQzN/spef6LXwXHm2HzHMgblR/sT3yePI+fDOBYbtrRbTwyePhMp7LzQSRC
         7mbg==
X-Forwarded-Encrypted: i=1; AFNElJ/+Y8wpfEFgXYnRUCMJF/iholqMOYEnRB3mx6nMw5Q9pFmU9xUOviKNG5k4DT1sWPoi/NCVcgWu4F0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUc/P3wYNRsumA8nQ9LO+/ojjeEq0cLUKJARxd5KSnxH2xYM3r
	mLq87/tHe75oPYRuL4zqgxDYEOBK0H9uyhlRCfwk1Epv9aAiFoAss0ZLQuMIJv6L9yDu0ZMXlKW
	PbmJqznRkVISZgj/meJD9jGkGNqmo5pFVIT17qVv6PtYvONnsRIenJoyLqa/1/48=
X-Gm-Gg: AeBDieuGPOSnpJwAOGgNdVX3xLylXeL+QygjIhYP+kdQWR9C0+mv3Hy281WcLxXs86h
	mVgUHB46YPh5pSADQvcHojQk4l1MQjLLSUi56MKRrGZiUgmgVlOrPiAh1JRxacYSOdZtcwqbhGY
	+QhdEXm2Sur28kCnwl0ZimWiGNhdZz/1EXokdFQUlaIBU9cLmB2Rup6WIq/NvwfNJJfXHKumXIV
	cYrHCVz0yNIUC+JCc2oO6oQXRFVQQ7k79+Pxok7yiQDUH+EiPURINLczq3ObmzoUjcHEQurbW23
	6AySlj/RoAK9mF2K7RE7LohYIhF2lArqVVGg7Bmf6oqa8RxPCx4QFMh0DKR9ggy6PjrH2w07Tia
	dSeZ85LGbWFfNZcceNPgz0TBlbjOyFjrXH7aODEiu8HZbz/pAp+4wpHoOfFiAi4FohqJEgQ1Ais
	essp/X1Yc3uLrR6YfqqJlQ6KLWgMVTMvkDwgWYpPAPiRYQ9Q==
X-Received: by 2002:a05:622a:1647:b0:50e:6165:11e5 with SMTP id d75a77b69052e-50e6165143emr51086541cf.2.1776707251214;
        Mon, 20 Apr 2026 10:47:31 -0700 (PDT)
X-Received: by 2002:a05:622a:1647:b0:50e:6165:11e5 with SMTP id d75a77b69052e-50e6165143emr51086131cf.2.1776707250766;
        Mon, 20 Apr 2026 10:47:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ebfd6sm3058993e87.78.2026.04.20.10.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:47:29 -0700 (PDT)
Date: Mon, 20 Apr 2026 20:47:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH 13/13] arm64: defconfig: Enable Qualcomm CESTA Resource
 Manager
Message-ID: <vvvvrh6vmgd2g2m64hae42xlc5e4lbfjkwjsq72geyhwckelxr@3n25nm7ultzo>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420172803.4124418-1-jagadeesh.kona@oss.qualcomm.com>
 <20260420172803.4124418-2-jagadeesh.kona@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420172803.4124418-2-jagadeesh.kona@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: BSfBLdkMoC-5wcS0Qiw1P2a6wJ2mpwK_
X-Proofpoint-GUID: BSfBLdkMoC-5wcS0Qiw1P2a6wJ2mpwK_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE3MiBTYWx0ZWRfX0gjPBFciByQe
 ZvR5PJskv7NX3EkuGo0LGUyDHy7Vbu2Uh588iB1JyFpP9girPOVRJIqZbhCszXN3GvjdaCmKKPr
 BQmK977vVS+xYYY6j6HemjlZqf1SWn58xfCMlqoRTJpFWBKy2HsIyBxerra4TLMjdjbhK1Ada0k
 1ZxyxOG8k4CaO5X1Xhzy0klcqfmqO4JsyDnfpOOt2eyklMM9Z/j6175+wnwuHo5krrGwSO5HMXM
 NrAJdr5UvRl6gTpO/LYUnOcIR1FF8FR072FQaAYolDphicd3e+o2CzEVdgB37hXJ1AxMIYb8zjt
 545tLeHOE16VFZ3lAnO05SSVldUkznz3eIJFmx44csYhBIKqw46qkKmtEUVdl5rF4YbllcD4IZJ
 18ua1VTqkDGD+Q/au1wTCpKPnxg7q2zKHPWG0TsmHHHoLn7M155eCz/da7ou3A6jjjARSpwv0aS
 MGKl7p/Fh4ig8MnpoHA==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e666b3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=yNzVkroMKOiLu5OKkJsA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200172

On Mon, Apr 20, 2026 at 10:58:03PM +0530, Jagadeesh Kona wrote:
> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
> 
> CESTA Resource manager/CRM is used for local and/or global
> resource voting on Qualcomm SoCs. Enable as built-in.

Which SoCs? Which devices is it going to be used for? Why is it a
built-in rather than a module?

> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index dd1ac01ee29b..94d226693004 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1658,6 +1658,7 @@ CONFIG_MTK_PMIC_WRAP=y
>  CONFIG_MTK_SVS=m
>  CONFIG_QCOM_AOSS_QMP=y
>  CONFIG_QCOM_COMMAND_DB=y
> +CONFIG_QCOM_CRM=y
>  CONFIG_QCOM_GENI_SE=y
>  CONFIG_QCOM_LLCC=m
>  CONFIG_QCOM_OCMEM=m
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
