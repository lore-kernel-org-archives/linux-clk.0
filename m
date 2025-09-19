Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB3D2236E1
	for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 17:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758302685; cv=none; b=eksqHBv9XBUt+2XtNjUoXibbSDiQq9+6yG8z6DiIr+Gz9h58Axxqbumi1QZmtUUwvhaHZ5K/+wfuZjzV0eWdPzR81IYFSs/WrgBLQ5oXJbp27HFF6fFqkPHfrjtsrbpjXqIpq4ndn1/pW4I/h8a6dBLVBCHzwJbvhiYpEejes8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758302685; c=relaxed/simple;
	bh=nUD7Mqxyf8HCKjbUfGSDdYOrI3tSww+l2id6UKdAl3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vztp2UUxL+j4ErpZ5+qWDjStXmd7+Ut6wTGE9adQfpCLKWDnqPkUxATLzLCR6/5L9SMLdO6J/935ua0QnuyNiYMNc6xqqZ3dUuvTTIUoe+JVwPi5raqXzE0sBPaOEXbjjGE+bvBLgzPV/bLjzxZQJgXgrxsDu0hmPyTgyOyMImM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ikQ4kj6h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ikQ4kj6h"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JD6lP9021451
	for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 17:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sfLD5wKH1cWrD5Py300UeP1w
	AIwntjYTUDEiAKCdHnY=; b=ikQ4kj6hkhoL0u2+k6v9AMXbWc3X8wz3SI+61fBU
	Pvu1zC6WvMpSOJo2iT1LaHTIY8tuc/9uUanb+6PsP86oPfo7HEjZ6L7wS3guFHEw
	cuXs1LMlFPRC4h1EMBEBqpsCDm1SStENYT3/OyUQvyPccfncqPEfkDUELxZP3V5j
	yB9XKsqLZdT0es6V7QQ5zymT9OgpAF7uzrej8kQtHdGKDd2UQFPKJD/nrrybDU/Z
	W7FSdGzMKWxN8P/5nfNDsvfwuRHfxzFfijjjyxR2EptuGd7HPPUvDNw5nRZLop3I
	IEDi0bFSvnlsMQ2hJ1RDWhpZJBRGJb00JsPw45flk9hJsQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy5k9qb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 17:24:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5f818eea9so36679511cf.2
        for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 10:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758302682; x=1758907482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfLD5wKH1cWrD5Py300UeP1wAIwntjYTUDEiAKCdHnY=;
        b=wkTV+VY7uoRydF6uHmOresgQRzZiyPhpCOX4EsQ5U1I5oFR9nUqXOpwj1ctNICXode
         5KIL5xKvijwNHQo/BPtwyXR6dLdT1tTEizUWCLKGCw3ecFo+QRHUTDckoSFoQBnWYuVC
         CE9RkPkfBTOOZW4Qf+b9TbgcRsjoencpxX4EpLrtCiEuOPC1uyGd3dXOnBJQ8CngXy5W
         Bpwl6IZM+lylmteViJ6K3sMvFTe96tU7NaNnqUCPN+R9QVmLzo7Uo7sBjF6ccHlop3sN
         RvBpogvwhF995vnEGA+DgV1o50X0s4u2qlr0z+6SbqVqT3cQRC6ZpUtp4NUj4yYA+xd0
         8/YA==
X-Forwarded-Encrypted: i=1; AJvYcCX76l8T2UpD0ZXSumE66X/WwCWF3oZhDPYQMibejbqnGIAfGSr/6/ahkON3b1N/n3caJFFUD4j4wyE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywin9uBkhf0lKWGOn8uLIzJ8LRVx6cd6hdOl8a9MRqrvAFRJLHb
	Tsw9Gp69ohtutO6HkwaJZAgEJUTQE2slWsTKTZsP7KDyuph62zyh9usY4JBCYKRJ/pnq4SqjZZv
	1lX4MzfxoeYoDI63imSb2Kjgb5nI4FS2TrOMJIi+CHS53yDo9bNwejjkSZpVnmUc=
X-Gm-Gg: ASbGncvl9jr0k7efYEbNDHEht00DEs/iwcg7nLszqkegcnWpPEJNXNZFtF9aM9qVH/u
	JFoQAozcM085vcTCYnqkm2JanFrTEDgC4DSfWqYc4hHY/vo7rYS+Ez5IR+P+lRei14gDNKoqOw9
	0TQdTRZJzKyVlBbN8BLMVMI5oK2oK/U6crC5dWE8gmU+K4rlm7UXoNOW2LFCV4Q+KNEsyunu2xT
	E/kJ3ex++d3BdBBMhM/YyBGV5KjYjDAFaXH3dp+9audtvW+q9rYZlz+pznXL/knaj7JFY+nvV2t
	tsl0IMfj2Kjn33GS0zyUuWXmy/VIAaFMHaWtLGvZEsbyyOywredxhGcD/qi8XWL7+O4f/Pd6RKu
	PGpWwdaCBRx8Q7xRfrvKhP794HcZvxp/qZO8tfIpRDtGaquG1ac4i
X-Received: by 2002:a05:622a:424e:b0:4b5:f47b:d048 with SMTP id d75a77b69052e-4c0754a9b7dmr47724821cf.66.1758302681654;
        Fri, 19 Sep 2025 10:24:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRSDO8HWCdUU+fdlrfRlmaUavGLqtYvJYYt2DzT/Kh06TBTbg6GtLuCasKGawcjZNEMrfsng==
X-Received: by 2002:a05:622a:424e:b0:4b5:f47b:d048 with SMTP id d75a77b69052e-4c0754a9b7dmr47724351cf.66.1758302681218;
        Fri, 19 Sep 2025 10:24:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a9f13d52sm1505837e87.143.2025.09.19.10.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 10:24:40 -0700 (PDT)
Date: Fri, 19 Sep 2025 20:24:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6350: Add MDSS_CORE reset to mdss
Message-ID: <5gqbpc6ciivvp534hnymxhkaxd4dy4bkg4epamxp3t5fvacpya@k57bctjxm4gi>
References: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
 <20250919-sm6350-mdss-reset-v1-3-48dcac917c73@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-sm6350-mdss-reset-v1-3-48dcac917c73@fairphone.com>
X-Proofpoint-GUID: ijVDEW3SrmQd5cIl4QUlz6TTqIjvzyzF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX98HLVE/GK6vs
 RQ8tDlfKEPaiYNkkVHGJsAcfzbJIsRbVdel+iu+LOqZIjeOOpI9oz1Ifk2vFxY+kGHkrG/mpl6R
 ycEs/eugQW45TznmzOe/S0o4HhKIQnjMfXCtpdzwMoWCNpspFaJljrq9dvY6d6scbnIptUDCOAG
 t1D7sUL6WWO+8+zkmSCHBsB4rGmbo2DNbJHP5Xhj6ILK9pmb3fIrUBAKg8LxwQX+eSOIKlF8s4F
 zbY7L6kIfu+aAQGErAIKXE3mEMO0Xdo3GPYAx8PgYB5wSckcuM09miWJYzLC5RIXr6D4kcyHwMF
 2qAuBCkXpSSdDJvF3Dz6OaD2m5Lzy+d+7TaYD7DG36JpJVGHC591SCuZbnad6l759ax/RCh6qjO
 VHoMIEEp
X-Authority-Analysis: v=2.4 cv=Y+f4sgeN c=1 sm=1 tr=0 ts=68cd91da cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=jUxBeYcaErFFHf2TeE8A:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: ijVDEW3SrmQd5cIl4QUlz6TTqIjvzyzF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

On Fri, Sep 19, 2025 at 11:57:25AM +0200, Luca Weiss wrote:
> Like on other platforms, if the OS does not support recovering the state
> left by the bootloader it needs access to MDSS_CORE, so that it can
> clear the MDSS configuration. Add a reference to the relevant reset.
> 
> This also fixes display init on Linux v6.17.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
