Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D4A47884F
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 11:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790249759; cv=none; b=YHwTEV8AwJnmhLqe/5eImxmUFblazOsC9IIB7UMDMZa5hX5W4PvnK+ceuYamrbwDEkIqr6Y+bQta3eEOjWS9VBo92x76rRMnsLoy1qCGBc2ziZxAJcg8ypsi3jDCxpyr5qRQuyKXa7ddmzhtNXHtwK6mSYxxOrB9FMtePxtZ2zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790249759; c=relaxed/simple;
	bh=XC3g9SfcpSuQ2UnRkRL38hKZEYdHmgPnxGy3AaH3AMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qx0jnDBvwYJKxj/nR+FtW8gL4vGrbzAaMIhxxRBv877I9nBeX4mF/TI+liUJMUrqIjhqNJ9DLjz+bzYfniLfcCEGlsHp4Hg2xGwuVLcsgRU3BmjyqSXc6EVLHEZfPyx4rt4OW5BLLZfxzeVmFdTbQvlhJmeLATmpJOcTaCLboGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cNx4Auht; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MS4LcUFV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cNx4Auht";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MS4LcUFV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA3IQ72483598
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 11:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d2NGtpxUDEm3znMDiFzPNS5o
	aL/oxJhvkzadrxY1WCg=; b=cNx4Auhtm6HmZ+p6qR+mYt6+6tWpWH/Pzgac274C
	kg2woD1jZWVa6/3kLB7Km+5ac9WYx1nf1N+6NktewyNsT4PPO0BXtv4Lm9gKyHaU
	5HCLEYZ2+jBFS0NisKbaTE/AWd0DNPW+x8PcKLaAZLLik4IKipsUeJ/nT8nUie3v
	PzAsTf+tWhk4rr8hkW4Uqo/jO/J8yPN4f19gdRPwMQ6WrF3qXvrtt5QjExVjsV/7
	vM0dSYkSXGfLM3LGFnbvX5y9+bK7DH9aO9bZButgWEzGKw2q7KLmxQqsiR11BbOi
	xsCmAngqwI09r0Z4GzV4awsi+/JHjI813RYplSXWLUW+cA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1s90aw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 11:35:50 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-79285c98038so1706898137.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 04:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790249750; x=1790854550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d2NGtpxUDEm3znMDiFzPNS5oaL/oxJhvkzadrxY1WCg=;
        b=MS4LcUFVErpBjyuRgY4pMhU4pSeC9SxAFKgAf90nDYwEMtoWNKmhZkLNQ/JgWgTVsI
         ZwE/WINEAcyjOC7zl7borI84lZTokLiEV0LTXi/XVSehmflsDL3LP+krMmBFNRRB2T9d
         vydlYYgPfBynSEzckqo9dN+cHQuvutxhDCRRJKkw5A1K9wXpZSwGpwrCF2/II+BWIumD
         zMe19Db/CRDB67OAUqm1xPBYus6kcd1Lg1Xr+iC2zYXR/OK9ec+k0/a80dMLS9OlkfrF
         naza90wxDra/UtQ3Hq/47oWhSGTI0nYGaidWEeyxh5YL6oUHL7UBBlITbNykmz9W1BA1
         eMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790249750; x=1790854550;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d2NGtpxUDEm3znMDiFzPNS5oaL/oxJhvkzadrxY1WCg=;
        b=VaU3Vdcdq0oHRgz6tG8Dva968ebYrBNSLP1nN+0YCpDaIqDLr/vIQJCS9g/+H3hFnT
         KdYZuv8Eo7P2ccoK5JfUc2SPNYliIbj2BDCAmgPQqHhbtVcYC8GIO9xZVZM9kAyBVSPc
         JkWAE+UDfK7yIJlEyIzkeiPr1lYpGMA9EXrrzPt5To+9r4V8eqfOVLSHEa5AQJLmq/Mg
         y5pOsk2qBOu3lQn6hnB9v3qpdYNUbBG1U81GCDZe6Qw5vYHmnxT313fAwHI0Fh+/l2Da
         7zPfUf/Ov+S+x8uWbVLonLhfE0oSFDUrOeGSxlN1Wjn54ONVO9Peq597T11fLqszuINt
         ER7A==
X-Forwarded-Encrypted: i=1; AKwUvBy9NbpZ0yD2UEk4QhDrfmgbylixh3DcebzlLA0rZdumdPJDbVoENtHceIUa+29lNBdANaiFPxoh0dE=@vger.kernel.org
X-Gm-Message-State: AFuF++kOIIYGufWrJM/dBwenvg+GusSQEonDsCeYsLYTRujpv0PZ7Zyd
	HovADbI35E88i/WiZ5hfLLkWQLrfIvC6/BXCU5dqMkpQrM+juQn81FACLHgWBcwks2wZG5hXTBT
	ZX87gfq839uQgJZo6MUUXEM3ODy/LHC5mLVgMmftkQscPMS4/GJHWTKpGdRKC6Gs=
X-Gm-Gg: AYBFou3SGwpuYDRL9hG/q4C473l+/3TJIVElnu/9iMrAfBgdd6H89HX6oW4pphWPmtE
	SZVYJFPjOWzlC5zp0Hk+6YdTQeGpPq0NJOH/LvpRw/cXcU2J4S//6v5vFhD6S8jowjV7mLYwh2j
	kA7r3jfAPEh/9wNSlJ3uMg3+6wxcFcXiZXkLCqiAHdZxTH8XEC6YBurmiprsg5t4f/SFM2X1bp5
	u1lgVWcqZfwq6wzPkI+NIwYOotIhSnq5Vuq7e+HQJgv6XhGUBzGUMw2l88d0pOJ9yop5McicuRO
	em6jPtCRReRva4Y2IhGzx52C3jMDGIs992+qoFteHCIOU4TcQsleQfZNT3yxecsjTdrNaFNPAwn
	AnMDfz/hHymMWJO8=
X-Received: by 2002:a05:6102:4b11:b0:7a5:e455:182f with SMTP id ada2fe7eead31-7af1dce60b5mr1133955137.26.1790249749646;
        Thu, 24 Sep 2026 04:35:49 -0700 (PDT)
X-Received: by 2002:a05:6102:4b11:b0:7a5:e455:182f with SMTP id ada2fe7eead31-7af1dce60b5mr1133943137.26.1790249749046;
        Thu, 24 Sep 2026 04:35:49 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c267sm13914254f8f.16.2026.09.24.04.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:35:47 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:35:45 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc: Fix GPLL enable register offset for Nord
 SoC
Message-ID: <kddqvzlmiqgqhz3hftikxyu62p55c3oyg7ftfpgd7mqul2hrqr@4txuknia5zt5>
References: <20260924-nord_gcc_offset_fix-v1-1-230ffad2dae9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-nord_gcc_offset_fix-v1-1-230ffad2dae9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0OCBTYWx0ZWRfX/yMRY9D/14cf
 8OnGNlv4d2pr3ZSoj9RJQD4gKKwBzNK7ndtQSrHgXUKzJkGX+TVz6OdIshl9/rVtzjIHrcJ0NVp
 r0lpYiEQxm/Uo+Lss9scMYHkcmRDm26UidCJ8MLQS+8+juxab5tqU8LLV0tXNk3HqKaJBrJwgvj
 IeclAoFduU2tE3gQzvtoE3xN9liw/Mz16g0oUlD0y/ZYTzX/uBDcxki/6IkccmeQ8ofG6IcPE1n
 tsqVVH1hBfVG5E5gy+EMmAXcmVbVP3yc6YgpQdtfN4jI+BLM9nbC2XRM+2KHmmeZwXoblYb1PDk
 t3smFTrL8Tjj/ovGJXSRr3GP6dvGgqOzLA+eAUgEjxomAIus/9Sh8NhsRHPPdclXLCddJM1GLjY
 uVXPzSBZKvSat0TCLcD4xw90+b5I2jYytDxDNypD/JPIY3CcWDsLzr/S0YR28hIPv4y56dbftSJ
 qSWFRnoHrPw2VBfiNEw==
X-Authority-Analysis: v=2.4 cv=VPxIDNPX c=1 sm=1 tr=0 ts=6ab50b16 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7o7Fz_jXMTEYJjNRgMcA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0OCBTYWx0ZWRfX4eX8hyjl56t8
 A1bsylUwgTZ4FW4Y1asf2Jru7IrzXmUmGH85XEqT59Rfk2ICtZEAYFVm2NPHRvsQC6oJH42rGnO
 2NmNw0ayhODv3whOI70X7fcgPZfuTVs=
X-Proofpoint-ORIG-GUID: MkuF_HllBIBD2HhbPOfWCHcX5RXaRZk1
X-Proofpoint-GUID: MkuF_HllBIBD2HhbPOfWCHcX5RXaRZk1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240048

On 26-09-24 15:09:56, Taniya Das wrote:
> The GPLLs in the North-East, North-West and South-East global clock
> controllers on the Qualcomm Nord SoC were registered with a placeholder
> enable register offset of 0x0. As a result the shared PLL voting register
> was never programmed, leaving the PLLs' enable state uncontrolled.
> 
> Point each GPLL at its actual GPLL_ENABLE register (0x57010 for the
> North-East and South-East controllers, 0x76008 for the North-West
> controller). Each PLL continues to select its own vote bit through
> enable_mask.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
