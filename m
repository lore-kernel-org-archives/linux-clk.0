Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6789A43F4BA
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 17:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223884; cv=none; b=LwTQhfpl7jdsheg0lbFfyOBshNEryiJc0PCFiHobZYfoNa2qswlVUS7JddZrVbrukL+MfDWsmpGU4eMnPBWLJlr7643cCf6GGegkJuewse7x+17AkIGeyq4YXJNJtSzSpQA45VgTW3b1S8niVwT3jIGYkWkAkIR+yAcCS4Waq80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223884; c=relaxed/simple;
	bh=8gRGck/CPM+mDyna/x4Z+bVM95zYh/qMbgDY8XnLj3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=niR3rippV3yjg9gQnx0oOQzhp9BMLKEpDjCnklaafW/R/dAHawfyf4nUwPPS3JNs72466BCWQlE4l59cN8VvjsXwARySxey7/bZWpVTx6k+38sdsLosme/mqXTpKaPKh6+kN3pLi5xwtg98VHMdti8dbVOTOIVsLi7lEkvDQqaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cy3CXKAV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RxVXhzQt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cy3CXKAV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RxVXhzQt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSfeS3481352
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 17:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Zlt3WjfywfZcqxp35j7nwTTwzqYUsZk6IdE6jAe2Zs=; b=cy3CXKAV+lWNAeS1
	BbYv2wt72eR2rVXCPrbj3VbochcYJB1vC+UcfX/VqnhHG54zSmInldOQUHbvSJJU
	VMTuIT9ANhH/+6bK+IhJ7vjQlcmb8eVHVBnlsPtvJ8kXy2Krw7XHffxF2cr0Acyg
	jUY+7aPpn9m+32Jwp1nUj1P5kP9+VfRUV1YJYuKWNAXtswREKywUOfJicEa88BDV
	yaro7cVdCGwS0QJ/I90+lmSoPEvs6TvLCPUel+xt+4VxH8DNuGBAg0/xq/DpSvs7
	3oQvMa6UeYUOwixXtjGk7NW3a/H5/gtuKU822qjgafkT/2+akOlzYlc0mhhPiUhS
	oc0xbw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetcf2s8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 17:44:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfe75b7dbso17126671cf.3
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 10:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784223881; x=1784828681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Zlt3WjfywfZcqxp35j7nwTTwzqYUsZk6IdE6jAe2Zs=;
        b=RxVXhzQtS6WIXh1Lz/kdo41/QtWC/YFvhMxouCEFlkJ+xY1URGYSMqQF8nOSSg4mqr
         XIQJPHNtHMVdcwiWy3HNZ2L4msNa4Z6Af4AkF29fvelCcYXNEBUYuHFvtlR4O+7XoqHX
         uvsADjnPlKgoyVnEQxtFi0zUSsOJxw7JB5A5OObQEVPE79DhxcfniQdgNWdgd2s/asCe
         azCIsijEPXsxIEG8ZoFHwMCkdZHnZfvKBP8wfEhiGZxNKNi4msgJERDwvVhXVjn4aJza
         6BUt4dZFtPTyp48EiquLhkvP7k8WLP/pW3duqYAvxYvm4Xm8L9+sRO+A9BCjww5xRtze
         hG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784223881; x=1784828681;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Zlt3WjfywfZcqxp35j7nwTTwzqYUsZk6IdE6jAe2Zs=;
        b=elgus6mjD0yPwbXo9z884Kt18oNTCmRdOUy+eEFiupWkXevRWptrYlCrDJZslIpQB4
         CG4fB+NTUSGixGVr4LrJ60RR62QBnAOSuxZ4vSha2ljQMKlF+GyCi+QWrstZaIAAQEhB
         cQSdwzdW7CUJeMf7uBoXLhCDEflXsKrurvqDxdd+XKzy7fp+VngCns9KYVNLB/lielrL
         pgDAjL5febaj4BG06YXNRS4Xp7GRUOTTWuAwfZhBw1nnWFCNtRzxHHO69NNrvVLlTs1/
         kTwnn24irxROl2roMny7wSERJ5vSmhvcwILrxIvs7B6IHNB5uv6hqrIKB2+ufHeuZ6+L
         jW1g==
X-Forwarded-Encrypted: i=1; AHgh+RqVx+1ahSYTdET5N+Sn61zfSfMQBxm+cN46Yjbclt6bgQKHO3NHHEbsUJh4aGs2rgcImX6J88kx+fI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUg+Rgufvdw9jA5bYZPnNlG3tkkFwex0uNGgYHc9q0Bgbh2GfM
	dx/xCQC5+w8SmGgbyAZeQ8yWnFVReQCv2+xvPlWYETQ7TJD57o5ju1zkeFykMEUmgTJiGZPs/st
	9XgnGWfehQ6v4cDeu4CJytKBywKOmYFT7jnICPdg2FjkeYyL0pOpommuxBEZZkCw=
X-Gm-Gg: AfdE7cloDB0z1z9rPPe3RmYprdRPSpEJB9Yo2vj8v7puv84rNo0OAJ3J/2KqEDKKY5g
	JmucFrfDInFRFMAmIQpd4QZ912Kt3FsjM6Wj5n0NVuD89ce3dMU+B2vty4tCHXZ8tALnHEUN2PP
	8Fa23FLy7RyGn4GyWt2+ALyvlY1DUt010oF719Rje8vwM7E2TGaAfJ2CbPe+vjRWwdOLNGyrjFL
	9yDyYTEaEaSTjHVe8xx0UYK/jLlsqIqUKbFOLagcqdc5Jo4I3JgIxg/bYexRvAkULru6YMIncZg
	m/vTWsynAx+n/6Kl3E7q8L4Fnz7RgyguNkK9KP/FBo2iTohzyEQOcwFbI0gBBBlxwok8iAW1MqG
	EVs10/jYxrI2XJWM3Wk7wdy9J
X-Received: by 2002:a05:622a:87:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51cbf165447mr183848691cf.5.1784223881429;
        Thu, 16 Jul 2026 10:44:41 -0700 (PDT)
X-Received: by 2002:a05:622a:87:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51cbf165447mr183848501cf.5.1784223881035;
        Thu, 16 Jul 2026 10:44:41 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd2922e42sm5209311a12.19.2026.07.16.10.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:44:39 -0700 (PDT)
Message-ID: <6ace3a66-3e7c-43fe-9581-fbd6cf4c51de@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 19:44:36 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: negcc-nord: use clk_regmap_phy_mux for
 USB3 pipe clock srcs
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260716-b4-nord-pipe-clk-fixes-v1-0-e4f583633356@oss.qualcomm.com>
 <20260716-b4-nord-pipe-clk-fixes-v1-2-e4f583633356@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716-b4-nord-pipe-clk-fixes-v1-2-e4f583633356@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QNNdAU7jF4szGhr0iRRRCJOmlaIHMwgz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE4MiBTYWx0ZWRfX7b+xUr6n0Ebf
 sWVErxdx2+1DDIAprPmoHXh256WDXDlfeCMiqvNtrr1ggq13n8ToasPhT2wrhKnH5xFGHbZcvUx
 qF6b27JvlyofCE1iqQ3DhfbVuy1QH/IVT2NoSA0yMV9/+44S5KnPkwfB3xfvUIBQIqcpgt+YyXI
 v5YDfLqc6NZvAJ60FAN7bAy+/ccLhA+ZPrgXmNTj+CWFe5j4RmZpMDdXoaKIvdtaRHgsBaVQ52P
 WCG3D3lkHKjSC+QIdEjIJp4xvdIRGVqO+26Oucz1lRzClADKSCDl603QKnJMDAJOlP4s4x0M30q
 VJSsRIJmQSM02j9rAfZxEo/EezIwF6dLKzRZ+RLa+kVnYbOYsk6F5kPkU1PafywyCxup7qBAJII
 Az75QVlNRwpuAZxSUJauD4rMtIQEnxopQm07tf2lJpUwRqpFKSivJZRa1YdIUrxik2I0U7hdiso
 awbNrpegglD1hZ6KKIA==
X-Authority-Analysis: v=2.4 cv=f8R4wuyM c=1 sm=1 tr=0 ts=6a59188a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=CyjPzYRc6_wJduQYL60A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: QNNdAU7jF4szGhr0iRRRCJOmlaIHMwgz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE4MiBTYWx0ZWRfX4+DYV9AD4xFC
 26P+ElLx07PBau8HPJ9zQQRC9vVZQQHwC39Bbgog/JSKP0KM7p1Hcek/XF9z/LRF7INIyCBqcBr
 QpKNuEJvZUnS/AJv5Fn5pB9028g9fIo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160182

On 7/16/26 12:59 PM, Taniya Das wrote:
> ne_gcc_usb3_prim_phy_pipe_clk_src and ne_gcc_usb3_sec_phy_pipe_clk_src
> are 2-bit muxes selecting between a PHY-sourced USB3 pipe clock and
> BI_TCXO, implemented with clk_regmap_mux_closest_ops. This requires
> manual parent switching and does not park the mux on the reference
> clock when the clock is disabled.
> 
> Convert both to clk_regmap_phy_mux with clk_regmap_phy_mux_ops, which
> automatically parks the mux on the XO/ref source on disable and
> restores the PHY parent on enable, matching the existing UFS symbol
> clock conversions in this driver.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

