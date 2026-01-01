Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B580917B418
	for <linux-clk@vger.kernel.org>; Thu,  1 Jan 2026 18:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767293906; cv=none; b=tqiZm+ZWH8mhKwShWeNpGZ75Q0UZcT1Kym8KUoCahDgVON0u1lNxrzrTtHqNHstpq3IboqDMbck96Pc6Epl8tkLyz6+XlsVpmBk4eoqa0tWXQz1uNf0pcV3GtN+dw+wQ7rTNW7V/yZOGqHBkjQRg85D9lku7vRk9bjbl9+e6Xgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767293906; c=relaxed/simple;
	bh=xGYY8pAd1/La7BQ0Al/8JnTwDy9NU7Pu8FhVHSk2N5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CXEvpiyjpq8eBDpWKQmi/sgCPhIw7r1p0teRXDOSANQFgpN2K3djoHu82MA0lXGqWgk0GNt2g/z2Hny0mEYSlnbIuRsuxIiD5SU7N89IM5DnnG2DrkxLNKjyx19XYKCnkO8JwzUfKVfVaSY7qIXOHlpUG4xGgfIy5L9MtMrMemM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5zFDOko; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AFyCQPJ4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5zFDOko";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AFyCQPJ4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6017Fc8u1590537
	for <linux-clk@vger.kernel.org>; Thu, 1 Jan 2026 18:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L+kTzgKoY0Dwz7vj+LASxcFM
	fom6Hwg6dqD1vHeEEMc=; b=A5zFDOkoToOFvysK92La4leHoU4+v8uKymJdwNzA
	Py1Lw+snnHL712MYeCkhCZG6UE3QIbCd4UO0VJh9KLDd3U+7YbLso1Jkvtf+JA9g
	pllWTVyEnHk5jeuXt9AFJUHmeOK6poMUq6MyZtIehwjRTQn9Nz8ThnqEZqJ5wN26
	eG3UzzSSiCBI97wUDSjWPboKe17lzLDmwJuxwlAOewMTt5rFDy65XT16DvQwoeQS
	qIse5gJtHN6hkoDifISLnwJC7tBZkyv9uiDyhAWG4S22Rcb6GwBptKt2j2FyoZGe
	5xzDX0WpXmTLMJ5lJdEANWUvtkKAOr2zR1cAjQ7I5vO9ew==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcv4ak6jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 01 Jan 2026 18:58:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee1b7293e7so433971841cf.0
        for <linux-clk@vger.kernel.org>; Thu, 01 Jan 2026 10:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767293902; x=1767898702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L+kTzgKoY0Dwz7vj+LASxcFMfom6Hwg6dqD1vHeEEMc=;
        b=AFyCQPJ4g3oFSAAQHllNW20BEMffvHJw60S7G2tTPgQicfoDrfSaXwMjTAa032XUw9
         p52jE8bKzwsQ4mKpe/CfxvplzAVBmw3iJOnXc3aKCDFaPZN7rol06EqkNfQwatlt0NUb
         qp7BHss5gKVXn2frScs5TQIWWlPfmNU73f9HqNaSo/YlxjWlG9WT87wSZ7Ryr59ytC81
         qzYWrWaH8qZkKxFp3WOhZPFPwPxjiggF3KMrXkajjItPk9VKyaQTsw3BNuCLFEYEAWFE
         EqzGg9qJfCm/ilLTy1E03VU0WZyS+5ox4e/GqbB+/g/rpX76iK3VlWABWDdwy6OwGzqo
         JDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767293902; x=1767898702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+kTzgKoY0Dwz7vj+LASxcFMfom6Hwg6dqD1vHeEEMc=;
        b=BJwmJ+wodBCUWJQE4e7rANZWc4k7Y3skqjsJ94LqT9YHeEdhdIsAlpJo3Yju4R6mX5
         tLvJLdf0c54W5x4NY9ccdSEay6T5++yClyxsSjnp5lR8LYMzuIfwG+BPNBtnxauY1Q82
         U5o69wBdzzEzAKxQtfuNo3qlk72FtY8PvGgvQAmt+cJ58d1fWn1qTkEF4evecbhDpulA
         tcK9BScupvPaRhtgkv+pF23aD4WdMTtVSLAS6A0sFzPEPnVmrrMFfoWwdJJ3dTnb2r/r
         7acif4XCuIUSR6pYZRFf6x1MtxSFP316rEIu5iI049ghhGqKTF5JMPGcvpEcBQo1PaCF
         cRtw==
X-Forwarded-Encrypted: i=1; AJvYcCXKzJaBBnshfUM2xHWcDFvJjv6WFcv4kbpKXdkmmdl8mN8VjkA3EdmSQETepAbT9/1P+VWSyY6N0Xg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxSR3K5gZV5LfW7i7Kt2AGBH9R7+V31ncqqMYFwsNAAANsIgsI
	4T3bYigZqaA3HB+VgLANPc92C+gaozJCUVNyaQ9QdyMq8zQVJf3COFWOa9YU8um4jDQVl4zBho+
	+XsfFsiRGXQL/oi6hCS7fBR1YoJyqfv2TkPHmfQ4VwSLHaB3J3tCZ/+cqeykuvfY=
X-Gm-Gg: AY/fxX64JzJBD5yc0YWWLot+QXAMBjA8zdEL1ODDseX5BGrUgRYPh1ypkZOL3P3vxbq
	0C/J5h88ZSWUh3HvH97MiL+/j43UgWph6/uboIdnGnIdeKXYT6AtFPYG7mAg6wWyFkVxDnTJWib
	bFwe8h8QVUpQqEXkSyXRJegTvXFOIyd5WkGq5LlAA8Va6z7S/gx/qEfY7WN+MXk7afL8tGwh1ar
	1v4Fx2uFkxt7jC0fZXHccBEFOm/JH+n/tjI0vU5+5HX/P0nLO98rBiC9RWWB/pl97BQnrQDtMaQ
	8dSsjHr3LxVp5J7DkIjogMFJhelOAPxOizQigUKsdBYS4FJ1jGygrE0vVhRnBfIFdLchB41AMHZ
	IyEKY1Sd6nMrqAGh//0mZ
X-Received: by 2002:a05:622a:540c:b0:4ed:1948:a8af with SMTP id d75a77b69052e-4f4abd0dcc0mr592306841cf.36.1767293901695;
        Thu, 01 Jan 2026 10:58:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlz/3vyvIYgIOkkFPFLj7xzq2/9y9854ildt7H76Yqx9WzlGppgjuV1tmNsy8jExhZ7JrgVw==
X-Received: by 2002:a05:622a:540c:b0:4ed:1948:a8af with SMTP id d75a77b69052e-4f4abd0dcc0mr592306511cf.36.1767293901243;
        Thu, 01 Jan 2026 10:58:21 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4327791d2f3sm47967829f8f.11.2026.01.01.10.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 10:58:20 -0800 (PST)
Date: Thu, 1 Jan 2026 20:58:17 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] clk: qcom: gcc-kaanapali: Fix double array
 initializer
Message-ID: <z3auxq6sv4vks5ecchmgajatr3gclghvozl4wxrty27zihmpyx@kjl4bi7oyla4>
References: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: A6xN6VQzFN5T7A3RvzTtbSlKl9fD-5eM
X-Authority-Analysis: v=2.4 cv=Ps6ergM3 c=1 sm=1 tr=0 ts=6956c3ce cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=486DEghy8GcDG8TY6xEA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDE3MiBTYWx0ZWRfX8xP9jeyJZ2n1
 eDSvOCr5eXR0qO2DFp2eUTpoOQDgiiWWZ15IPpX+In2W6hmu/7BwnNsgvA4XWw+o0q9LVis3YRn
 DcV+vIWMNCgiacyduA7eE2YYLvuD/6B2C5sNY5xyUALBCJwLgYOIdDNXAPto3cWQElx3VkQJ9qL
 FGSR1uVpD3Uv4eenPMSzOovOZrYR3wMmwe+lpFRMbi2r+ZbL8eCYs2kot/xuMOfkp/wnZegk9Qw
 xcwmEIfjPH22wSITO2kojMJgqtOuNDlRyKZXVFPXHdgZVnQ2xAvJ9Du3Oj18GLuTcSV309y/AwI
 6AhK68RZ4X/EUplYUgGIYIk+yucMh0g94lMaKzE4wt0imqZ4/2lTOQ0r9uFRTPC0e86cvk2fxA+
 aYz/N72nDN9X7cNgeVVg80l2q6k3wgfSGktG9vEDUEZY9Qk/P3C6TbAXhHzw5ydIwa19VMuIG9Z
 8jvLfTlY/TIwMLFN4mg==
X-Proofpoint-GUID: A6xN6VQzFN5T7A3RvzTtbSlKl9fD-5eM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601010172

On 25-12-24 12:22:58, Krzysztof Kozlowski wrote:
> [GCC_QMIP_VIDEO_VCODEC_AHB_CLK] element in clk_regmap array is already
> initialized, as reported by W=1 clang warning:
> 
>   gcc-kaanapali.c:3383:36: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
> 
> Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
