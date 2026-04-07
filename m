Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835763B7B70
	for <linux-clk@vger.kernel.org>; Tue,  7 Apr 2026 13:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568591; cv=none; b=Nf4d8GLnbrlqQ52rRBxaJhoMTr13LzRvRbcJr0WfV75/z42aewh/fVsprZGHd+AcYcU1LElJMFVzQ9ceK3aLmerftT783iN2rvFoizV5Opg94hhQUNUp4exHKpdS/MZr3f6QGYQhxtHix72BuS7s+aDANqFAgUJb8qFPzHITNfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568591; c=relaxed/simple;
	bh=24winHpEP6yCscClPL7a8tX85b5mr13n6/UAWQd2++Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fpHC4ZzWpIoheSplJX7hTno5E4V58Xnk2zDzQ8W19hckIyJ4bLRNvKOEgkmhihnNQFGyBM63GOdhYM2TFgjw6XbtGbJHpg7eaSi0pOgbwHpx1HunvAtobGcPmsgl7uTBggJmlQRTiJNl5ycEgXT45hMNSuI5kaUeV5zU8dHDigA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pxGcSRL2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gw6GQvV1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pxGcSRL2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gw6GQvV1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637D6ODc2009393
	for <linux-clk@vger.kernel.org>; Tue, 7 Apr 2026 13:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uV0jgDOoisJMOeCaLNDInlnDVtS4gJ+3iRPk9zVjquw=; b=pxGcSRL2NmGi/noF
	OUKrEHMW+pcnSB+djaGN2gAe5g9XH4Zsdg+6Grp08r0jG4SsV8N+7+OvWDz0H6E0
	LWmz4ybvUXF5l9fdVG4zHwYWzrSfyo/22Sk6vwRtkKos0MiSLRzJ/Mp5WPvu54Ko
	gkRZo81ja7XBpjKpirTQKGs5zBv3jBZMJ817F24aqCrwzUfxKS0H1uRwpGEa9l/f
	bTrvkOQN8YqQuloIyiczkyP01gmnlzCEXoyeFP7YLas1KeUy8zYncj7CAdOu/VYk
	SvIv31nBnLYxpLYerZfmy60Pok0HGPFRUOHG3ajZqMDyrMfTdj4Cjt/EHpMn9qv1
	/d+zww==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrrtw5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 13:29:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093245c2d4so3941201cf.0
        for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 06:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775568588; x=1776173388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uV0jgDOoisJMOeCaLNDInlnDVtS4gJ+3iRPk9zVjquw=;
        b=Gw6GQvV1jqSbWkqq8xvmxNKbwDRciRmqoPRAhAfMtL6kfa0Us5kOd6HPv8ahRKtBMQ
         NaNKs9nu5njOEQ60ZD9FGY4xD/BCkpeCtXjyhQwfBwbXSA+rOfwJUEGnyANB7CZkCDrP
         9JpdgbS+qhihvQ+w4zrUu1Q9fXohkdkz2oKLqIKHU6zMRaQDpE1sqtFcXl/V2ihUbhrE
         YGKNQ4CmghU+Tvy9vAutIgNGmhlnM4m4HBb1Jx4yarZKKGCfLa9v3/Kyv8H6fOwJppOa
         NjMlDv340sZ1ehdKP0t4ugLgS+rXh6RqeX6fFkO6VlZE+cY8qRtCqzqcFjJYPOD6cwT7
         0thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568588; x=1776173388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uV0jgDOoisJMOeCaLNDInlnDVtS4gJ+3iRPk9zVjquw=;
        b=PD0Hr1bnSRBWzVt9GQOhEkPKBdOe3I6yzt4OPrIzHj0iYnYFmAuPHvJQbk0bIMhERI
         k0oJ5+2ePPMvmS37BG66uFYrgpGzpcNthf0caVWpnsPb7XzQSDEjT9u+euNcCXE57/QW
         S+eAPh3SRvOtMzqVYdZFCl9BYWytu1yPjNl2bnUfRxIof7vZeq1zyKWUGRdpwHyiazhv
         a5W7LrLlRaqGhG4Lx8zKndCVC2XsTSnbuyhuQMe7L+u8o+B6E7t+0gjU7mDqoRgwc67S
         DWZAr6EYI7x8HAkMEp1v2VG/y4EiKYKRRFFH7XpYglc8ELBAb6mrfqNWdchesUtJY+29
         wADA==
X-Forwarded-Encrypted: i=1; AJvYcCUefBB5nYUMVmghj2G6SQTfVBCcRO5ruBZCYOXtJ3UBeTnD/SWybuVdKlYO/SId77A+RPQBAovWPHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxilfbWO9uHRYgziDJiqFO+IhisZhCt1PYy1xn7WQ+aYFlXVzic
	N+/iJhhJC7MWhWuh9JcwGjj3m492TmSZlBE7nHjbmGaY5AOSMQnL72lwDNwnJaLkEDZwJQZbFmR
	8EhrAqSg+Uk0MnzQK1VJw/QcgFfuLH3OZ68rZx1xJzW7PlMhcIL1Dgt4tD28vles=
X-Gm-Gg: AeBDietDxwqj2vZGZ/8okiAltlJ7T2/bNy+QKLzQRNZxYeSvvBElzF1moTJK0GYjBDg
	/6LLBsDVk60vSnIqad8gKk7alKmRxbGcjPSCs2pmuTtE1b3y0KrZfsCkS2b+tOjB8Zvvp2JzYME
	wtzyOYzk8KsAhTiq8QfYs3ATfNtSkRoZ71hq60jXizHN0WMNXzpra2+zu8NN6ViE9VxNpEWRjZq
	/vNrAPFK2eI0+ZLjxqSkbUIXY+HDeiFN983jMABJLMghoiOxZ/3AzEyliUiguLE1Xh5+TB+EDUA
	yuGUr6EM3oyH26WVKi7ncLLfduw9AzgHrZIEejJHJNvlA/OAACw+/KJS84z/Hlf07A2oiKWKKZU
	fiNksj5JkVCNMYD77VV5br0y8SuIUE9fLiDxTmHQjxyYKgZIvfBneBd1n7NMQMe/NNxhqwoIJ/3
	Wre9A=
X-Received: by 2002:a05:622a:60c:b0:509:d76:fe73 with SMTP id d75a77b69052e-50d62c8442bmr161891441cf.3.1775568588011;
        Tue, 07 Apr 2026 06:29:48 -0700 (PDT)
X-Received: by 2002:a05:622a:60c:b0:509:d76:fe73 with SMTP id d75a77b69052e-50d62c8442bmr161890971cf.3.1775568587439;
        Tue, 07 Apr 2026 06:29:47 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff131csm557563666b.52.2026.04.07.06.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 06:29:46 -0700 (PDT)
Message-ID: <4be1efbe-ec76-458d-9abf-c24b80a6da4b@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 15:29:44 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] clk: qcom: gcc-sc7280: switch GP clocks to
 clk_rcg2_gp_ops
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260407-gcc-gpclk-sc7280-v1-1-2445c2f7a539@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-gcc-gpclk-sc7280-v1-1-2445c2f7a539@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyNiBTYWx0ZWRfX7lUL4AMPvvg4
 fVlzkC7+4UHhe+QU8CouG/bn0Kh6V0355GEO8xC2yB64pKVqygIvJPvsAoQxkeEaffThv2Bq0qh
 ZoVGW9c5UaW1gjdkoMXF2nG2vwrakrrH+ozhmsrrEgqZOhVDQMNeOEXt2hO5iruOkVXw2ihfpiz
 39nSJfn0rsLztfzVvmMNsDSRfqc1X6XG6VgJyPXTrAFmZkQ0AXDVdsSCPit8f6yZC5eacHTQZF5
 8FvGuT6Qn0lCSCVOF9kHdJpfJvLW8GePHtvYNQDeZU2DRNhPD7+9MQ3MeIXyW8BCPcp7Dgpo2L9
 KiobkogNA4US+6x2onapjIVsYpkGxwMhZCexRhqFk9iX/bZ3SkVx9ghgcteksLxY9sfJTCJJeTa
 LhgKtNKVxj11kVcwuvXiLiQOqBr0wKR5ogzjyRhWNs1dX5/ugcQg0V8mzfhZuHjbCb7w+J/dRdA
 5AgEOXNBoVBDxg+03rw==
X-Proofpoint-GUID: xgD63qlHVic_Exq4AmfOVHFJx68I6AAL
X-Proofpoint-ORIG-GUID: xgD63qlHVic_Exq4AmfOVHFJx68I6AAL
X-Authority-Analysis: v=2.4 cv=LquiDHdc c=1 sm=1 tr=0 ts=69d506cc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=ksxQWNrZAAAA:8 a=Moh2RT2aINYzgBBivQcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070126

On 4/6/26 6:00 PM, Xilin Wu wrote:
> The GP1/GP2/GP3 clock sources are general-purpose timer/PWM clocks
> that require runtime-computed MND divider values and duty cycle
> control. They are currently using clk_rcg2_ops with a frequency table
> containing only a few fixed entries (50/100/200 MHz), which:
> 
> - Cannot produce arbitrary frequencies needed for PWM periods
> - Bypasses the MND divider (m=0, n=0), making duty cycle control
>   impossible (MND is in bypass mode, set_duty_cycle returns -EINVAL)
> 
> Switch to clk_rcg2_gp_ops which uses clk_rcg2_calc_mnd() to
> dynamically compute optimal M/N/pre_div values from any requested
> frequency, and empty the frequency table since it is not used by the
> GP ops path.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
> Sending this as RFC, because I'm not sure if all other gcc drivers require
> the same change.

Possibly!

It's only been introduced recently, so it may be that we do a mass update

However

The introductory commit notes:

 Limitations:
	- The driver doesn't select a parent clock (it may be selected by client
	in device tree with assigned-clocks, assigned-clock-parents properties)

which could potentially break some existing users that rely on the clock
provider to do it..

> ---
>  drivers/clk/qcom/gcc-sc7280.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
> index 4502926a2691..e7748c468721 100644
> --- a/drivers/clk/qcom/gcc-sc7280.c
> +++ b/drivers/clk/qcom/gcc-sc7280.c
> @@ -457,9 +457,6 @@ static struct clk_regmap_mux gcc_usb3_sec_phy_pipe_clk_src = {
>  };
>  
>  static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
> -	F(50000000, P_GCC_GPLL0_OUT_EVEN, 6, 0, 0),
> -	F(100000000, P_GCC_GPLL0_OUT_EVEN, 3, 0, 0),
> -	F(200000000, P_GCC_GPLL0_OUT_ODD, 1, 0, 0),
>  	{ }
>  };

I don't think any of the rcg2_gp ops use the frequency table, you
should be able to simply remove it

Konrad
