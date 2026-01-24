Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C572C25F995
	for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 20:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769286168; cv=none; b=JMdAl9X9m3ygXVgla0DZQRjfDkbK5Go0QAcSGS4J5pfiKrKz4YWsRXcnPWZMIa5WXr8jSkBexQUQ85v+N37aoZZwuF6LZjp0UdV44lFupAl92eqKUMlS9SmbMCfkOibsryHPnfijB8Uz0SVt03fvp31VMYqW6ahkjvM8uwQH8wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769286168; c=relaxed/simple;
	bh=SCT7nQE/hYMoboU+umD+G3VmYfCfWPktmmoJSAp2Jw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bl1VaE5HHvrUHQJ4AjzVcI9g401I6wDwFWdV0P2oaFezuoaE6u4xlMq5DecYEagLhdno4zz0TXG9kBMOcXrsS3ewnYH7HC+WzRVNNVcvvzOa8n0lXwDcGuAoyHl+vf8mmZI3W+MIFAchki/6/5nTAv81TtN/UY4+Qtur3jBBdXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWoWePvQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SHQtNnnO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWoWePvQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SHQtNnnO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60OBLvmr258308
	for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 20:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oFPaTDK3TLri6Kv5yIIBf32t
	fJCORMMg2vmVaMPtZIs=; b=lWoWePvQIOI7JIoR7sLr8ieyUi1ZnWmKrOMPShTG
	XwfYpC6+J8hjFZpszixxdJwuMtJMSCp3U3pzat7kFsENUjLaLnibaRdLeoOfmfaZ
	dj+zcktWne/b8wVSxyTojUGupn2dac7xMJ6OKZGIiq0NAUfD4OEWjMD9z6e2jn+4
	PeCbJracr29gF8FAL3iAKBNsabnDO8a48B8XxLwhWEJMtk4abZBSWgl12ctIpZA3
	KGwRy3XqJOB6p7L5oANLwPAAsTvML8wkdR1L2ZoQSvs0j5pI3j/qtplVyAH8G9p9
	lL9NxoPRHewyKN+USjkdlLb5R9xwXSZXaL5CrnNIUq8vxQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvw4wrm97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 20:22:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c5329ed28bso769203085a.2
        for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 12:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769286165; x=1769890965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oFPaTDK3TLri6Kv5yIIBf32tfJCORMMg2vmVaMPtZIs=;
        b=SHQtNnnO65XMmq7Wf6GfNPiBn4DA1QfrcdrsRs7yBG1w9La40Dk53QTfpdSrw7LNwk
         IgRqmnNrM5JtxLRl0A8Exir60qy9zaLEvzEbRZY8F7rRuvaFxyNi6Q7amhMaTmM8G2zh
         /kTktNA2aDuZfkhfnd5cYkEeOrtxtNbjPE/n8EiC7QtHPkEf5T21gUvm3gXlRFVsK4m0
         rSoVBt0cGMbuXLO94eEQO7dvlEXljoiCA/VlA+g/axgvgbMDDeqJj2mg7qqzx/eq9Z3z
         S+Hy5kqXQ1DIKhuy6gf3v3XOf9aPu8IXIa66eSr5ZXumvrp9ZPlB9LKQ/7NdtazuqExT
         FDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769286165; x=1769890965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFPaTDK3TLri6Kv5yIIBf32tfJCORMMg2vmVaMPtZIs=;
        b=NMQL5dx670ga9hLljTBA5wgHrQeEr/rg6+IvhNPWOk2IxgT1sfPR8dURahVjN5plXN
         GDQxmg12BwqzQPJEfjvk7989OJlswZDAnhA9ahPFvBO12v6YDkIKva14J7LtZc0l3eg+
         LKAkU7IIYp2BAQy3qG+tmaBj43olOmVzFNFLoV2t7NUjNqZaUBSTeIRvSvofiOBGog4C
         AH2jq5kAHKQEJxvVu97JQHWBOrGjqEEEP/hoH96HSRNpzEFTI04gYAc7BDiSTZGK4Lpw
         OVxQyn0QZsz/nhSr3ZE5js1hftW2RXBfqQboMAxbMpnUrZ3APrOF8YPK0/Brs8uEuF1h
         xVNA==
X-Forwarded-Encrypted: i=1; AJvYcCXNwjRkMD6W0GQcUX+wxpMIMf7eUBX+yy0rExCXlnzccE/eum9OlyLxl6PjEE8UMRx0fIXHOQDIRR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhCTUs20wC0UeYT7gOI4kCNG8fb3AJsjGn7l9SppyV+hNAjV0f
	z55pDojPXlQOXIjVL3kfU3qLr9otS2un69zovMvxMFLv6yMRD6rm/3N8Q3xr+T/+tCFWwXSQeCh
	XMRVhRYMZgtoe3vdGnjlrjYQKIDaCPVXG+fwEGJ0+go/RMsW06UJulcOkPlGRAOM=
X-Gm-Gg: AZuq6aIaQc6RPHMfRgS4ONoK2C/pt1+Fvucieel3OYfUH+BH/i9iDmIHn4I/5QpDlQF
	/xAWqgvecX+bVObGa2XxmfhbebykQcukWsO941pxxfLVCg20zQj0GTKTFKLTNyv9mWjlokQRhoK
	7s6d16or9evAXGxCrjPEjmajBkx9/DKlNo/D7g6KIsrnLUvtcQ7QHbmL0yw8XPuSx1ztBl7S73P
	lpeUDikJ8niwbGi1kGpCBYI+IlObSgHJp2G3vCw5Dg2fCwGGd0ls7JoQy2FtubY/UQqIraIt5Bo
	th6QCmO+VSsePgB7tDzXnvt9bsvVW2xdGezS39xc/qTaz35E6XtYjS6RJ3+MepOHY0cy5J27IPJ
	2t0/AcycqWTvXYsNuU5+Rof9kXNRdlzxZYWSLXdv0PBFegWD7WHRMyIkzozomWhFTnh7bDvae36
	4S4arDHth128kDO0Pj7HBQvbw=
X-Received: by 2002:a05:620a:4687:b0:8c6:a57c:842c with SMTP id af79cd13be357-8c6e2e363dcmr858945085a.67.1769286165089;
        Sat, 24 Jan 2026 12:22:45 -0800 (PST)
X-Received: by 2002:a05:620a:4687:b0:8c6:a57c:842c with SMTP id af79cd13be357-8c6e2e363dcmr858942685a.67.1769286164662;
        Sat, 24 Jan 2026 12:22:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1a6c87sm16017121fa.36.2026.01.24.12.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 12:22:42 -0800 (PST)
Date: Sat, 24 Jan 2026 22:22:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: videocc-glymur: Add video clock
 controller driver for Glymur
Message-ID: <j3jj2mg4sdm2n4d6nedpnev5tvusvizpvodfzazil6nuvwrsqa@upcpbdzv6uie>
References: <20260124-glymur_videocc-v1-0-668f8b9c63be@oss.qualcomm.com>
 <20260124-glymur_videocc-v1-2-668f8b9c63be@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124-glymur_videocc-v1-2-668f8b9c63be@oss.qualcomm.com>
X-Proofpoint-GUID: 7O_RQe1FTBbkhXyeuM9Yc4qfkhNrc-K_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDE2NSBTYWx0ZWRfXwmkA2vXj0Nqe
 CDmtT9A00Nm2+CAUhrpvQwbmXNjKdqYRWjQ85SRhasVNgsdEiQ+myxL9Mz3dVwcv9/5IwHu6RlW
 pDCjNTCVBXPmvy4xSm6PDTg7a+p5CFbSZpzS19kR2AU0GA0V7VEr+hsAB3dv5I49GwEOF5US3c6
 qzLnsbGL7zxHlWP6paIiUJaNtziWSIvJjdPhSaEefTXD7/mX2ScFImbpHvG2k85ztrKWOHGLlwS
 XjFd6e2gDz2lqtH/N6d4Fv6VBwiahinu25BmXM1ujiXMWq43OQNcF/TLyca3YT4EkJmUw6W4zVU
 iE0ZqjSVUr1X1IcK/J/8CfP8jITuo5Elx9py5bGRoMgv/sPtfM9fnsBn0HuwoASp9CbwVCb9Okh
 Gh12PXULqxDCr8YdfLAwclV869eo6Z0CrZHmpf/yh50AnoZrZhu8qRcWaSQXwQxPRA6CJRMq4qz
 pgW59YUzTX2Q1DrVj2w==
X-Proofpoint-ORIG-GUID: 7O_RQe1FTBbkhXyeuM9Yc4qfkhNrc-K_
X-Authority-Analysis: v=2.4 cv=POgCOPqC c=1 sm=1 tr=0 ts=69752a16 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=aoCLA3dNgO5RQvRKTysA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-24_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601240165

On Sat, Jan 24, 2026 at 11:05:03PM +0530, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on Glymur platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig          |   9 +
>  drivers/clk/qcom/Makefile         |   1 +
>  drivers/clk/qcom/gcc-glymur.c     |   1 +
>  drivers/clk/qcom/videocc-glymur.c | 526 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 537 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index a8a86ea6bb7445e396048a5bba23fce8d719281f..20af4340b08f98773eadcc4a97b1669f51277eb8 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -46,6 +46,15 @@ config CLK_GLYMUR_TCSRCC
>  	  Support for the TCSR clock controller on GLYMUR devices.
>  	  Say Y if you want to use peripheral devices such as USB/PCIe/EDP.
>  
> +config CLK_GLYMUR_VIDEOCC
> +	tristate "Glymur Video Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select CLK_GLYMUR_GCC
> +	help
> +	  Support for the video clock controller on Glymur devices.
> +	  Say Y if you want to support video devices and functionality such as
> +	  video encode and decode.
> +
>  config CLK_KAANAPALI_CAMCC
>  	tristate "Kaanapali Camera Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 6b0ad8832b55f1914079f15323b8cdd1608ad4c0..a71dfd0ddf5122d91b5ab4427a9e36cdd57f7bbd 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
>  obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
>  obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
>  obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
> +obj-$(CONFIG_CLK_GLYMUR_VIDEOCC) += videocc-glymur.o
>  obj-$(CONFIG_CLK_KAANAPALI_CAMCC) += cambistmclkcc-kaanapali.o camcc-kaanapali.o
>  obj-$(CONFIG_CLK_KAANAPALI_DISPCC) += dispcc-kaanapali.o
>  obj-$(CONFIG_CLK_KAANAPALI_GCC) += gcc-kaanapali.o
> diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
> index 238e205735ed594618b8526651968a4f73b1104e..cd11470a75f3fec67c1c0cb7fb2b54a814cfaf65 100644
> --- a/drivers/clk/qcom/gcc-glymur.c
> +++ b/drivers/clk/qcom/gcc-glymur.c
> @@ -8507,6 +8507,7 @@ static const struct qcom_reset_map gcc_glymur_resets[] = {
>  	[GCC_VIDEO_AXI0_CLK_ARES] = { 0x3201c, 2 },
>  	[GCC_VIDEO_AXI1_CLK_ARES] = { 0x32044, 2 },
>  	[GCC_VIDEO_BCR] = { 0x32000 },
> +	[GCC_VIDEO_AXI0C_CLK_ARES] = { 0x32030, 2 },

Separate commit, description, Fixes, etc.

>  };
>  
>  static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
> diff --git a/drivers/clk/qcom/videocc-glymur.c b/drivers/clk/qcom/videocc-glymur.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..a5045866982554ea46a9d75033537e7771df8fd9
> --- /dev/null
> +++ b/drivers/clk/qcom/videocc-glymur.c

This one LGTM.

-- 
With best wishes
Dmitry
