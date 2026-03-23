Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28BC29D27A
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 04:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774239897; cv=none; b=kp1YX8ShnABy7ZwIlqZ1+pRaUNa1Y62zIdAtlIMtZYse8S0bjPE6TB30NC+KaflrBRr15DQZ8eEz2gXewQLn/IFgYZgze+Dqgz7B5QRZ/Y25I0idCB6zbrPXGNmivT+l6eBHqkOS+jagfCWofQdWD0hRxulxWfskYoSa3BzDCA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774239897; c=relaxed/simple;
	bh=sStt4KH26WfiPlJ8xKUxjjO/or5H8BrxBwHyGMcoceU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TrX795QPeo6EXHbUJWvuI+4gHReFHCi1TkRvv9rXUBaLKGC9GO318t9sLEaU6t/U2fSEgc7a4i5svbpPkY75/T+Lj0GyneqqsFpxRGV8boEDL6eQhM4+234k5D5utkFWbKRZUgL6v4XUQVvqVihf3AgG0eF6PgomF8qj/CBRMJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uvpz+XbS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KRvnotX9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uvpz+XbS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KRvnotX9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MDUJQL930002
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 04:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MRRVKNDXEQsGrhprFUNiXI2k4AxAlepHlKddZZm9Hv0=; b=Uvpz+XbSeYJnlE6C
	g/sZez5/t3XbfjiuJ+OyHMSVS7uRdSZjq6PO5GF1lrTnWYG2ybEpr1Dg2AEifJTt
	9e0aJaYMmgAnlz9S13QeTmtzcUtguc7BB8nFDU4snHX67qTmfh4mFvt5CKvRrUZL
	YjRBGrc9CT79luTbV0jTDgnEau9Aiou2z0dAXJbS5sFLknmMS00kJUQUzg48nJ12
	EYiurYrMjMzlv+44pho5Amvl+FYC6TZEgkFkmQsizcs0JzGC+jjF6/h3p33eKZvR
	7a82C6vOLSkV+BukwuyFlXIDPGe+kKaUFUvz1tuyMuZnAEMzKtgCOC5EL54tTsf6
	NsQQsQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kdubpfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 04:24:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0554888cfso54379335ad.3
        for <linux-clk@vger.kernel.org>; Sun, 22 Mar 2026 21:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774239894; x=1774844694; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MRRVKNDXEQsGrhprFUNiXI2k4AxAlepHlKddZZm9Hv0=;
        b=KRvnotX9DGayzrsXcySxJLaC5bxBU79QzbnGM5lKgdtu7XlfwgRGAMWeCRaunRvvln
         m9rTNQZqWfNWJRgDnKqDNQf7sRbXbRKcEdDKJ//d7Jj0JmeOsHUAwNtNacKotesUOb8m
         fnqh3hTGAcuSwcHT3ItGJNSIV/2qQASn+YybnEJTF3cgQP3h6kjbyTlHQvzGucmx+jb8
         Ps91pqln3RX3H+VU4W3M7rnrdRH8ki0v8gXTCUOnOUicDDyu9XiOVJduyNUjH/CdL+17
         RhBJMu7oqOfaY6XZAW1fHQBHcoRjz/K7DI3ianHU1pZXl2ZvnkteopvCKnfxE+eJhpNP
         ZS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774239894; x=1774844694;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRRVKNDXEQsGrhprFUNiXI2k4AxAlepHlKddZZm9Hv0=;
        b=HUemiRhOI2vxDr6d57xLgFK2uvBXM1sP4EVsRS9K/zBW7wPrkchj1in8ihij4jHVF/
         q1ZpnPgHd1NQR18IftSPvPuOtR8kFOwt+nbM1Wg31yn35yrcrwT84ZFgH0jtnlX1PHJe
         zUmvGjm5yaGEd8kOAe7o0nXYfRcV/vwR5UxNgrCzr/gRuS6XU46Hq7pfi6KzThk07HhO
         OeGZYZ1ktPnVrAB/P9M32ZB92AKz5lzZb7i9Pi5G6YFneTOAyJcHtlhfxQ8JHQh+Lbrz
         JaCjdjod+26GY18i8BvjRrFUSROLzqy31hGegxM8rL4OKWJwxz+96uxN3e+7iWpqBjQy
         atrQ==
X-Forwarded-Encrypted: i=1; AJvYcCValAj4ZigpBATBPYk7VImEB925GRGOucaUHfqvIux5PvBGsON3+gPu9fPdh/w/wvwmCtMY/3By3+o=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz82pYwtztjg6/lokUsI3vhuFDSaH5paERvoNrb4j8UfAGag0u
	SAq1CwgHPcP9OyD3xFhntUvLUbH00s9cAbIPIahYDsfUsDSxePX5tOsz9l5XNwI52kWYnUd/wq7
	XHXx5Tr+JSYasGe+VZI4eeGbDzqFZ/UeEXRKx3+mqesAWgLnwOjJEXRbCI8QRJgM=
X-Gm-Gg: ATEYQzwtgqqt6KZsXILyWGgaSuCWySGQDVdTnAppHzziFJveQQFpRpnuWwxcQyj8uH1
	FE5nUfsgqfbM2K3JE5WCfnjrjXCj+7nHrrx22NhQpdMqAW7M1OmjG5VaJtx+4lebFahrSGjE9Wq
	ovy2MCIfJK4aimfnzQVXHt2ajKD3U7X3GMijMhnXGlKC+p6fFM7T/8bluMW3dCoKv6cok7e9Yjm
	npjOrN3avDM44110hVE6C1HJP1IWAwp3fyjAivU1uQAElCWWazWHc8SAjy6OenMvrM3aquu5Lt7
	yOKYiGLIg+pQjZ3J5+NpWP16hq8Oj0LkFh2mK/o2lnm1XTJAFdDpwRlL5pDw0/pSlXJa6eNrOn/
	AsWHI8wMDSYm7lqSpCIqxTqQD9MGdWzitUlSBUWAk4DcpuXSSxw==
X-Received: by 2002:a17:903:124f:b0:2ad:cede:3a1a with SMTP id d9443c01a7336-2b0827b3f6dmr111605705ad.39.1774239893825;
        Sun, 22 Mar 2026 21:24:53 -0700 (PDT)
X-Received: by 2002:a17:903:124f:b0:2ad:cede:3a1a with SMTP id d9443c01a7336-2b0827b3f6dmr111605455ad.39.1774239893344;
        Sun, 22 Mar 2026 21:24:53 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516ab1sm120016865ad.5.2026.03.22.21.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 21:24:53 -0700 (PDT)
Message-ID: <100b51e4-b6d5-4d17-8721-b2ea1ee747e0@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 09:54:49 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: rcg2: expand frac table for mdss_pixel_clk_src
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260321095029.2259489-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260321095029.2259489-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAzMCBTYWx0ZWRfX/Vc2Md5UJord
 yIwDu0patTW9VeldLcKyUYw7Gt9mkM3kUDHdQ03P2gp5ftnyA+qennqDPj3B8y7+1detzu0md7A
 kThTdxitPeU75bVAhZqiAvukCt/cpak1li5+12GQ8uHaaLGAnH8ksR1tOLPbhzixHZly9CeORIH
 75UAws+sbgsklFaWrqgLrL6eQ0Ds6dGxKsBMJW/NAzFFD2dlJ5goXUTzv4uYZerIgWUD1QRECZW
 24q4FjSWDIqRclbhEvrYeez/zX2nFwdflqGMAEvyzVo8i6BKtsLuG7SaK58jtfqW8nZaCq8x8oq
 O4CUaTZkU+LFo5jHn0LfcQIsoKPS2IP1PPPr1j0WHya2U9/lk+uXZkSciLvcKQIXAUBxb0WyTYh
 KFKm6KzvhcngTpkzeEJN74zUEd2rV3hBoks9jvHT+pjMSN4F5cBY80jNe6O8NlZuk0eOVjV/pJm
 K/cvBNYsjGnjwSo5h4w==
X-Proofpoint-ORIG-GUID: Ti8gG0oIsC0EsTb9CdlOK7fXi7vldfQz
X-Authority-Analysis: v=2.4 cv=Q4DfIo2a c=1 sm=1 tr=0 ts=69c0c096 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=XrWBrngNrbSfp6LsIOQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Ti8gG0oIsC0EsTb9CdlOK7fXi7vldfQz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230030



On 3/21/2026 3:20 PM, Pengyu Luo wrote:
> Downstream clk_summary shows the mdss_pixel_clk_src support the
> ratio(35:16)
> 
>  dsi0_phy_pll_out_dsiclk             2       2        0        378420000
>      disp_cc_mdss_pclk1_clk_src       1       1        0        172992000
>  dsi0_phy_pll_out_byteclk            2       2        0        108120000
>      disp_cc_mdss_byte1_clk_src       2       2        0        108120000
> 
> After checking downstream source, 15:4 also seems to be supported,
> add them two.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/clk/qcom/clk-rcg2.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index fc696b66cc..6064a0e17d 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -1117,6 +1117,8 @@ static const struct frac_entry frac_table_pixel[] = {
>  	{ 4, 9 },
>  	{ 1, 1 },
>  	{ 2, 3 },
> +	{ 16, 35},
> +	{ 4, 15},
>  	{ }
>  };
>  

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
-- 
Thanks,
Taniya Das

