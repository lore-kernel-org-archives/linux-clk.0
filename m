Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CE9274B50
	for <linux-clk@vger.kernel.org>; Fri, 21 Nov 2025 20:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763757636; cv=none; b=iQdxKOFAnW93IwxcbMuW990T3srqan5SR3DNx8Cuf+WJ/5qPuAQpj8gr7b0VvsEblA3A+N9gkXvJkj7HRsAunYIMYKFrEwjSrZVYXG56bqX3WLjO0TZCNdlPHQN5gK/6M7czeaRTapXZVoPafFdcUrGmuDmzAsoALwi2+thjDME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763757636; c=relaxed/simple;
	bh=CeaYPnXEpi11E4tIRMWLororUh7TaehfquaEohMSCgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l1534iQJw56gzahtw9ji1/sOs4tC8T+swSwryv+gZtB66Kn8C/0VW46v3T08XoyT6lGUYAiW3c1vHXtbQugUWSyUlM1STY4yv76iXeuW6T/4ul8LouCwQkCa2qAnF9SR1lzKh/EAruDAXjnAmiowINH9rrns4HWAK6t6zRR2Y1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=byTrml6F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fk+TCOHj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="byTrml6F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fk+TCOHj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALBoJ4B3008988
	for <linux-clk@vger.kernel.org>; Fri, 21 Nov 2025 20:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M2KpO+xhIWNRnALhdVFyNAsp
	CnW41dcR+dwkMx6MtBE=; b=byTrml6FJbkXSL3bblv3UCnZJfL4FnD9Ec3pPAou
	/RTEpNt8cZSBdRcNKflVU0cNK6L3rJBmXtc3LkYNY5EZ0oefbITl2aBdW9dBlMhU
	/D/DrEW8UcoiTjJcpxciGWvwZRb0WMbhAaxRPLo9zZTJM7Gxi5KRZ9R7Kgjbdwgr
	QgytQu0P79MKZmw9elOUpLAcvmL0Kfv7BZ4J4u2eSUAvl4wy544Kv7yQRNtcEv5R
	n6Eg54ugtnC5TJLEH18nad7vMfVDOHImfpIzIdFaKc+2ZPQOIhUEfvK+QCBKUGce
	OSklnfoeAVDvf62nr9ne61j0LtbFNJUZ4ej56Ur2PaVdnw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhkf2ut1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 21 Nov 2025 20:40:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b24a25cff5so674301585a.2
        for <linux-clk@vger.kernel.org>; Fri, 21 Nov 2025 12:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763757632; x=1764362432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M2KpO+xhIWNRnALhdVFyNAspCnW41dcR+dwkMx6MtBE=;
        b=Fk+TCOHjJMDDpqZCnpgNjHovXS9GOWN6OVf7xHdmFvn+rfbAJsL+NW6tpDab8qtygT
         XylgNmqM6bZkIIPdZzaSDUEvVg9LtJkU3dVnZWu5Q1mQk7RIMPPG34i06jmSBM/3fPzl
         8xVe1PJVu98s2RyZ/kh7yIk/y+YXVeAAXcCpTwOkCDsvJXhl4yi+CwqG5s5arA/uL53v
         t8KGXxQ5uM57LfzpkJU28FH8gb25Rx3azl5wVztLRf2NjY3JC6J4R/GduLPRN0vlQsPR
         uG+liKHa196I49RyrJz4CMfdQTt9YBMIQIDzSZj1dwhk9GP15qmyS7dGW6wspD/a7XUc
         ZkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763757632; x=1764362432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2KpO+xhIWNRnALhdVFyNAspCnW41dcR+dwkMx6MtBE=;
        b=TJfTzpEzTEdAVMfFFgDMAsg3Q+r/r4WzuXpaTlKpZfOHQ7Gj/TeFCl2P2g8e02mGXX
         0j38eYFmI8r483x713xqVADoB9BHSX0GD2cOFbg3WWwvb17myGaOa15TKB/xqM5/30A6
         0SAZh3xJSzN0sgAp83puc8xrKEBSrUClu72uS93jf3IfsctgBB9Hsv5eZn4OVWp0TFRi
         Vz3XO6DnFT8LFaSRtqklD/OqmJQfyrOl8s7joznGsKNP/j28JGgt8+ipQ4IPmCz2DHGY
         +UVKcnuH7/FJQieR2YkpLatzQtW5yEqdvT6VSjtK5FATnImzlryYCpGagdpFiSBxWBwC
         w47A==
X-Forwarded-Encrypted: i=1; AJvYcCVVJJMUACbJt7XyL03tWp9zp3SdMoKrk6NOfVWrzrYgTT7wzh0p7PSnGAgEFLtWUWmUMZ7C7jE9VQg=@vger.kernel.org
X-Gm-Message-State: AOJu0YysjZPsWTMnVLEKxQH+lfFWkvJfH73f4c2uC7xl2OqXWp+xzQXf
	uYSsJ0nUVu7As41lRl/7DGWYUlIM8P2sZbbCY05/1vig0HF6UBlyTNS5VnYqh5nLHUth1Ktgmfg
	S0HNn85zmNb+cecTgrzV64+k0otdXIE4j3aXfEsBTeKGAQqsiaa0Wsa2ywkUQ2rA=
X-Gm-Gg: ASbGnctKJH9c5zL6CgkOZixdviofd+hKBHhefgEkO6R/jOZJUP10j85ve+fzCsraW0E
	GMz6o6ckWqUhXx7KSvXGHN1w9ZX4Mz5B4Os9Ji2efqoz5cVVc5434QyytEU066K/VMTeZ9Sb3cU
	L2/Y461yh15LBrztRvJOLlRjXT2RXaInllov3t/nVEwkT7D1+659dErpYrUeKnrS77Jcz2GoY6u
	Ka6DEJe57tnhqoM6DvUxoSR2pYwBVpoxuoRB+2E68FeYKFsPelZi7H0elV3ApWqE+V4k/OeOvio
	h+BiPTGqxZdhXRkJITJuRnIXkp1kLQ62gzXeVBHawGqe0q3L3bTY4BxkqF+K+DjRs/phg7mtE7D
	cUfdXnMPYFwxvpu42mUuBJSUv8BhOwtkAZo0xb9AVYPAr3gj47AJuE52Hwm8ROl/jLLjoda4pHS
	whTZVwHGzaqyNNjQvD7NkYw6M=
X-Received: by 2002:a05:620a:28cc:b0:8b2:e924:4db7 with SMTP id af79cd13be357-8b33d468f92mr521192885a.40.1763757632373;
        Fri, 21 Nov 2025 12:40:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9T/gmrFzWRpnIMdUvZ6r/CE0YqcgW+H/6QNQuDyPfFOXwwwgI9gWowiwmcGBJA5G0QLTtXg==
X-Received: by 2002:a05:620a:28cc:b0:8b2:e924:4db7 with SMTP id af79cd13be357-8b33d468f92mr521188885a.40.1763757631846;
        Fri, 21 Nov 2025 12:40:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6bafbeasm12783851fa.27.2025.11.21.12.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 12:40:30 -0800 (PST)
Date: Fri, 21 Nov 2025 22:40:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
Message-ID: <gxjidpjoc6h2rvuqpv2wjynumj6qfk6ktznte6igem5g4gt4ai@ukflachqlg3i>
References: <20251121-gcc_kaanapali-v3-v3-0-89a594985a46@oss.qualcomm.com>
 <20251121-gcc_kaanapali-v3-v3-1-89a594985a46@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-gcc_kaanapali-v3-v3-1-89a594985a46@oss.qualcomm.com>
X-Proofpoint-GUID: TGxQXLm84-aQJKb1kxk74PyyAJkBwxWu
X-Authority-Analysis: v=2.4 cv=ApPjHe9P c=1 sm=1 tr=0 ts=6920ce41 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=xhHKJl3AFlBKMczUpUcA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: TGxQXLm84-aQJKb1kxk74PyyAJkBwxWu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE1OCBTYWx0ZWRfX+UJ+24b8KdZV
 6kiP0aU1QyKNqr+C8YUOlUKAh67MsH+IceGAqzd7Py5mvkqIUAhAsKOExF4fNGQXyU4/I7QsPTI
 /iqj25Wb2K+nAWb76kRkHO57OA6SGqSrK/kF8lVGC3sydoXug8SASUOZrAJRbPRPdsFvmXh/g16
 FTD9weH/j5etIVi/lMFjyZaVn1lVcPPOCgPO9hVoG926k6xtKyekOrfZ0adpzWUhmeWyOg1P/np
 RuZUC/j8a0tbFi7KckDFcTBPnYI5vYqMPJ18LVjAfhCc2Ey/NMv/Ek40qyR05TedE+v+c2H/OHw
 WGVO4zlf417cL4tcXJ7OQGyx7dzWiEJxb1NuZn64cfcRJe5buuKGyMyaOJJ/2zKjaP1f5SzSw5U
 GrHEMc+fZMv0n791AdGD8B56zxWvpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_06,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210158

On Fri, Nov 21, 2025 at 11:26:27PM +0530, Taniya Das wrote:
> Add the RPMH clocks present in Kaanapali SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 1a98b3a0c528c24b600326e6b951b2edb6dcadd7..c3d923a829f16f5a73ea148aca231a0d61d3396d 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -395,6 +395,18 @@ DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
>  DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
>  DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
>  
> +DEFINE_CLK_RPMH_VRM(clk1, _a1_e0, "C1A_E0", 1);
> +DEFINE_CLK_RPMH_VRM(clk2, _a1_e0, "C2A_E0", 1);

This got better, but not enough. Why do we have now clk[12]_a1_e0, but
clk[3458]_a, describing the same kind of resources?

> +
> +DEFINE_CLK_RPMH_VRM(clk3, _a2_e0, "C3A_E0", 2);
> +DEFINE_CLK_RPMH_VRM(clk4, _a2_e0, "C4A_E0", 2);
> +DEFINE_CLK_RPMH_VRM(clk5, _a2_e0, "C5A_E0", 2);
> +DEFINE_CLK_RPMH_VRM(clk6, _a2_e0, "C6A_E0", 2);
> +DEFINE_CLK_RPMH_VRM(clk7, _a2_e0, "C7A_E0", 2);
> +DEFINE_CLK_RPMH_VRM(clk8, _a2_e0, "C8A_E0", 2);
> +
> +DEFINE_CLK_RPMH_VRM(clk11, _a4_e0, "C11A_E0", 4);
> +
>  DEFINE_CLK_RPMH_BCM(ce, "CE0");
>  DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
>  DEFINE_CLK_RPMH_BCM(ipa, "IP0");

-- 
With best wishes
Dmitry
