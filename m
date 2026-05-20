Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF883DDDB6
	for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 12:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281155; cv=none; b=OMAZil22mVxGPzlsOJdjurCGna5dK0k2P762imTA5hK03IBTBK2c64dxQ8ZUqWjRcLS9FD3c2sE9YZiy2d8uCU26+UPWAFQhR3490PqfO2TShCDjKFV3cDcJG7qlvYjhoMrD1qzpzpD6JHpqbX5JHFPOd9JESUtfNfjxXKaRdRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281155; c=relaxed/simple;
	bh=cLaTmSKhZdE69LzIgcez/DsGhTPNYNcrI9RL0CruJ5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/rDcswoLprXkkynoBHFPsdo0SiTTNkWTC5VyDGtdJt1GavEgQPnxd+nykFXE1PFCWy6ejeuGjFRBwMTwXcHrOljWywK3FQOb1egnXs8dwPyESnV1vO5P06ZduJkBKnGHeGj3oxTnoIT0Sit8MIRNYf2wHMCBif2FtPZ+6iBp/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bJKrYH+H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZmZBGr9h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bJKrYH+H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZmZBGr9h"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6uri11238004
	for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 12:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cIZhTAzDt9+wu0W7bhluPXYB
	8tTK/ULqj6C6vI+4RFM=; b=bJKrYH+HZjulNKG2nXTbJFE5pY6emoCZ1RcOpXoq
	HXkHQ92QHj6os7+z3O3bpOMY7W7DN2TN5b5UPzpda9mZLuAS27CGgatIBNS2zqju
	GsocGnD0zr81EiY6gImdXecz/ASrZh+Q3KJ9MYSQV40m+CKba1NEfY1Fx6Jn581i
	BYMdzKMfiHVX9JzdXNuPq1z/nwOHC+dN7T1UsVomfbWvcM4TXyC2IkNZx7A2OYnP
	6Vn2mIf0a/P+mKl4lUz3haD9lB4nJTzamlD4g9W4XrBsOExzMLvlxG21UUkpqZHF
	m4pVbaO/Vee4X9P4PzNse/kXjwj8uGr2KEg3Nh0ZaIqU9g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3svty9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 12:45:53 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5760d43e659so11634628e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 05:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779281152; x=1779885952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cIZhTAzDt9+wu0W7bhluPXYB8tTK/ULqj6C6vI+4RFM=;
        b=ZmZBGr9hCRJ8sHrQXwQEA8zcRy6siYS3ekwjNd89jFYGQGQ0mErIzDfrT6bMOd+nub
         H7xBMJWPk1N897u5c1mLablto7GcrfYuIoUs/5yD1pPnQfpzprlZT+OKRRzizFsxbgZw
         DHb78CULZD60IDJ+hNWpjJGLN9UWn4fdbyoDLtgNpAd8fS5aNuv1GRKDUxBVP77beY3h
         ytxmwU83Lzh4x6V7Y77/Sy4qs9i6sBXtwjT6D+JsEZOVGuvoObbpTSWNlQrfGjeP7d5e
         HH+6IHRJ97G1ClIhdZOFWsvteyJFaM1DH17duzBazSHU8PZhGhLeo7IvhP8cTMGo9AOp
         DJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779281152; x=1779885952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cIZhTAzDt9+wu0W7bhluPXYB8tTK/ULqj6C6vI+4RFM=;
        b=EQ/XzOVZXTwilvuRC4BLpRlEpA8ez5SWbrenSMaek8BCYlebT8SA2cGnUub6+dL+K+
         keEF3N979Mf09elH+PB5I5XiBUS3vHZw+gr+wmngwKefeOvqAZ0xNWROznv7sLvnYLKU
         fe8XCFgZgEboMo+J46QHhRvunSBecxcsEGG1R9U9aZwyWKs1Kd+8n0Ww9iXODvT+Wxjq
         +G2izQGOKyH8e2JTRlcMG2EvMJG+fkNeFPZ5geVi0uJgC7Srd4ZjSyohwNfkTVtMoM0v
         xo7LUmMPuXhgGFHjk5Cd7U+aLT67XxzMgWc2WREdH/Hls8jDLZNuZ1YzE3IvgrkTUjW0
         99XQ==
X-Forwarded-Encrypted: i=1; AFNElJ8gR/C5GnzrIhQr/gn7t8RYPBIdtynZVm014VlZ36oX4zeC4Jy2PgvL2Xt9otuXN0ZId3Um7spJd+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxlDk2z6M7MB8QAyD03QCRDQVmyrLfOQ903B8gdsDwKmLoTBLr
	0pnX3lGPXfWM4zVM/DCB8l24ELKtooKs3FfnzhTGC5H9fjUtroY5fOy9QZ201j+gRddkpuaav4n
	u20fdQCyVBiKG3hiQIethOX7Fh2CR5unsizgzm09Qcx5yIDiJuNNAQII256xAoAA=
X-Gm-Gg: Acq92OEO2XhDO9kjAD76hSN8355KErmZvSAqLUR+3pEnot7qSc85t4hlDLeIoA4p/Ha
	B4DguJ1PYuX4G8ZyY8WPCmgr/rIJdiZ1Q+VeHy4pbhz5C5F52JrTQFatvuv3pUTBs8QqSUirky8
	ZBHW2L/RfyrVQ9T9onQB6cqbagCnKanIiZaZur3lE8+ioNzGZLwSL5DOJORTciggXJcU1/WB8cJ
	Fbabq++muCMlVz7hknGEPlvxSnre/2KSgjgoFQU3DOExFEHFv1ZPnvJq7laG2MQjsTSjs56pVOO
	s0WTnD7sfXtgftFivaYvlbI2THHgSAhaxmX1P9NsNuKJWJ/aaR+BdRrGrapKiVRaDGlMYw3IfnV
	DLs7jT1NxSRv5HKiRip4T8dqi3/HSF0lRgwfL9jNSIZ5p/RKwCLAT4Me0X3c5Yqf30eoylSpg4f
	0SkPPYeRQaPfuwCBu5CwIX1H1t5tm2EO3Pl48=
X-Received: by 2002:a05:6122:a5c7:10b0:577:51e4:ef1f with SMTP id 71dfb90a1353d-57751e4eff9mr6283720e0c.9.1779281152529;
        Wed, 20 May 2026 05:45:52 -0700 (PDT)
X-Received: by 2002:a05:6122:a5c7:10b0:577:51e4:ef1f with SMTP id 71dfb90a1353d-57751e4eff9mr6283671e0c.9.1779281152095;
        Wed, 20 May 2026 05:45:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164c5712sm4836341e87.59.2026.05.20.05.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:45:51 -0700 (PDT)
Date: Wed, 20 May 2026 15:45:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v8 5/9] media: qcom: venus: migrate MSM8916 to new
 blacklist mechanism
Message-ID: <mvlslbtufxodehvqqcmhihtchct3tegjbfjl2nmt3bh3fczdze@4fnrrtm2njlv>
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
 <20260519-msm8939-venus-rfc-v8-5-542ec7557ebc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-msm8939-venus-rfc-v8-5-542ec7557ebc@gmail.com>
X-Proofpoint-GUID: TVqBiDfXzy0OigwZGKFiaxtHv_dQE_Na
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyMyBTYWx0ZWRfX649RW9PssyJ7
 1R2DehqrAjHneHbn3b5Imv6qb9g7aXW9P98X6xLerHun4cVDf6+rUIzZrXz6uGu9DchFNThtAuZ
 dnctBhRj3uWLD0MaaSNM5B8wo5nhXNO6SDzmQI2/y5kEMf7t/ddwbOC1/aRC2fWhDmChSs2hDlj
 vY/GKyiE1CsX8u4UKVLAOdGeyLKMCyhxUGHLq6BKICQ6qukQRQyWpIEUW24alo768U2xxy+4gNh
 Y+DL4WyXRoT7K1eqL4a2T/vtRY1vKGJlOZGhOFzUo3DBwRTyIPG8NPwnIOEpqNHnuPfg9Eer90t
 s30rAaxrLe3EZfIP7rY3gIscf1qVtuMb9bEhJUjrFgGPE3PdfKHUG/X+Gq8896OprPpb1J+hBd6
 6C5gu1oCw3c+X6/Q2ZqyKFkCgAcoJJ8JlZl0srCWR1AvCSxOSWOOTy4HHxCAJomRgnrlsI6y0AG
 KMeqPDLdhb9ilRT1Lsw==
X-Proofpoint-ORIG-GUID: TVqBiDfXzy0OigwZGKFiaxtHv_dQE_Na
X-Authority-Analysis: v=2.4 cv=SNhykuvH c=1 sm=1 tr=0 ts=6a0dad01 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=FYQP979REZT08Aj4asUA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200123

On Tue, May 19, 2026 at 06:10:50PM +0300, Erikas Bitovtas wrote:
> Blacklist unsupported codecs for MSM8916 reported by firmware to prevent
> them from loading.

This should be squashed in the previous commit. Otherwise the codec list
will be broken between these two commits.

> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  drivers/media/platform/qcom/venus/core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index a87e8afb23df..3baa6bb4968f 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -684,6 +684,8 @@ static const struct venus_resources msm8916_res = {
>  	.vmem_addr = 0,
>  	.dma_mask = 0xddc00000 - 1,
>  	.fwname = "qcom/venus-1.8/venus.mbn",
> +	.dec_codec_blacklist = HFI_VIDEO_CODEC_HEVC | HFI_VIDEO_CODEC_SPARK,
> +	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
>  	.dec_nodename = "video-decoder",
>  	.enc_nodename = "video-encoder",
>  };
> 
> -- 
> 2.54.0
> 

-- 
With best wishes
Dmitry
