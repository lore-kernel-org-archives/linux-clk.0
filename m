Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD22446064
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 14:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786457118; cv=none; b=gE7mu+hwp6Rp+nXzJK0N5L51D8ge77dAIYLI+WPjz+m4XnkfTBT+NlKV3k70H89cnHqKA9Oq6XXPX5pIYltIBofPWE2VCtO5o+tQI12EOUa0hKJDKE+jr0nJiVgxSKdGleLOBJwKN67KRCkb+Luw3QZjIBgepxncb5FBupCs9Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786457118; c=relaxed/simple;
	bh=+rbrWplOQUk/FiP8xN5lpwFUzK9G5TZuSDlUqlo0pUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LzMKPGW4Xso48qVk9WeYyyWQ5gZef7c2E5sWFKB0cqEZY4oFMQld/NBMNRKXV7/8X40KrdvcvbPOzCh0fUI5elRwWsJHZAD4n5jHIZj1kdLsPElecnY4S0P7U/lIPpb7j2BJjUnBzMVCjS1wGAWaudrRlwTupBlBHplhsVrky4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EUoExjr+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ac3EmoDU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EUoExjr+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ac3EmoDU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWUDJ409825
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 14:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nxmc0t9fxOdqcLZd0PYh+n6m
	JbD21/9HxGe9yWwmSKY=; b=EUoExjr+ON4eoiuMKz9/LIdcdbcYgqxzoRK2o+qj
	oV/qlbS06ZsA1hI6mo2ckNVx3PVl5ImtjchA7MZYT0qT9wf798r9ksS1RSbC3WAY
	2TCYqYrL6l8FPvMWGC011YguWIfVSw9il92z510MCYbtY2TOsQduzqLo0wh9KqR6
	/LOEI9vM6kshjQNlAypfkeyScPjBIFm7Ga0ttxf7lM4fTGWED91wMmIgvAGfcvQh
	Ou7IQgcRtSGYjabX5LAIOlDFk2hL252IvKbOd1WaWX6b2i2bS+fjITPpwYGcpmo5
	uV5zzINeAMwoWvBVV/OFJrFQ8r4TOOjWt7KiMm3ZzBCt3Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyvcra5s3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 14:05:15 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73986bb438eso3148589137.0
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 07:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786457114; x=1787061914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nxmc0t9fxOdqcLZd0PYh+n6mJbD21/9HxGe9yWwmSKY=;
        b=Ac3EmoDUlmrineB8DE9NivAnJU/SSF7Ihl6F0QPMWx+vy/TV6DZFI+kfmdGlXylzoO
         0aoQHgzbZIJKwJHIjtByDY4wXdysWV4VaMhY2OnmIHp5HRfPDchZ00VYFz6IsDaMeCjg
         Z6d0xCJfISBN1kjmZo4pLUkHsdublD64tPj8+VVsQYTfp/YPeUetf/OKw/uMlyl0gT9M
         +n38Nmptc6bKSXQGbG8LajokJDXksivasFm57DyFYB9T7prH1onJFmRsKCXVHz9JJnaq
         RZmY+LjmZYP1yjxJrxcU5cRfYDDPKUNcdBXcwPvN+uB+CfhOzRLu4d1kKH47R6ds4oLi
         Dzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786457114; x=1787061914;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nxmc0t9fxOdqcLZd0PYh+n6mJbD21/9HxGe9yWwmSKY=;
        b=BN1A3lnX9BYN71RnS2jALKi/dZeXVQRbO/4hFYB/mwkWpgrUVwr2G0uNmXegxNFn8+
         uIZhDGtmbBJTEZ/XAYz9gDbG1h7bwy6WLSRuJxCibH+y5TNTbtPNmOzNHonyX6l308nc
         xfEghpEPJZJySoUXVa+aUaExv7eszamCado4GnDdiSEyvFRxBW/SuDtWAVajBLcLmWBE
         2nlyl2bBG6Sd6LAy9ZyoO7gOzdcH1IhTQTIUcs3ePTBuD+X5/fZ5y84Zw131/DlvDO0b
         RM3hEtFBf+gD83pBX2RThTfkPs1MelmFKuDjZAheIpNeEMNJJLu9TZOam5+zhF7wggs6
         e1MA==
X-Forwarded-Encrypted: i=1; AHgh+RpeLwnsgiBrWVKCeNZmMpJqRSXArS0U5Up1ineaPkZI69vnUZlQrRl1I2lw0N8NqC2XaD4oFMSEQlo=@vger.kernel.org
X-Gm-Message-State: AOJu0YweMer0gbbfkfgbrvdr276YgUFAkF8WcSQg8qO8J5OMzAn2DDe3
	7Um42v7UmN+mThI+b9Oyyi+fHKsbynJC8EDiyZ+vScYsk4UQ9w18aQwn1W1lbmd48JekzN0BNhZ
	WZgevhGtqBvHZ480wrxr6FSbf2/LUFhbPiugh/pz+MDhECv0xdCr4u/wAK+8kMeg=
X-Gm-Gg: AR+sD13TTYX3pfT7B1C0glsZ2XPBPZKnT15bnjsAlQl3QCLFvE99t0G12tQpHWw3IZZ
	vIkuttxmxxKWVgA9E3UdFQ/IfUDOGwylwL7h9vDmpC9fxfDNA2dPTwMnLMXibtzQleqDeUJeb/Q
	63mwhseQbNENLZlTdIrd2ATvRNr8cb3poppRj30pe5wpT+AW2ZbFj3mI/gHVG0wjsLtt81K/WW/
	WlXnEUffl3H5a8YIwb+ysKqRJOogRnaqReUqNyofMQ9VVv0uKMmUoIRVv1Xtw5rOKJGr5IRnuR4
	en+iG8LLg8vD2bGrc0hnsthiAWL2zml2xcL6LznKuth9ntlfNvdjH9r1gTGYmNlQVFFTpjcwTQw
	x/RJkKZIU4z0hIOxHqnA2KCCvdUbTZ4EOs7Dgzmye6Hww8pQnITQD68FRqOWcFjxhaqReYS3YJF
	rrI3DCu6zk9rp6VQ==
X-Received: by 2002:a05:6102:4489:b0:737:bfe6:3b03 with SMTP id ada2fe7eead31-76c0a79efacmr150978137.7.1786457113736;
        Tue, 11 Aug 2026 07:05:13 -0700 (PDT)
X-Received: by 2002:a05:6102:4489:b0:737:bfe6:3b03 with SMTP id ada2fe7eead31-76c0a79efacmr150957137.7.1786457113300;
        Tue, 11 Aug 2026 07:05:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b448724d16sm324566e87.51.2026.08.11.07.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 07:05:11 -0700 (PDT)
Date: Tue, 11 Aug 2026 17:05:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
Message-ID: <lugf2oh6ocycg2uavba3ws3p7mawkfbiyxya4fqba7jc2vokhp@nt3egjsh4jph>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-1-5e0ede4a0c72@oss.qualcomm.com>
 <7f4qs6su5fd5ilecy4r72suk6mqvj7oouz7ahgatxthqavrfia@wxilczij4unf>
 <vxpntlaebf4an2wgebgbwk2rdkingzjecdgylqv36wmxtyqju3@hkip3wqgendw>
 <c47b3af2-d265-4e9b-b843-05b5e63fe5f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c47b3af2-d265-4e9b-b843-05b5e63fe5f9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNyBTYWx0ZWRfX03HlGIm/WBCr
 HHHnQHAjFGmlE14IC0u+EWlWt0L3imwXWAYSfwN7TwObzeSmbFlmCdYYhMNDSZypngswPYTpUHN
 G3TVElpp4LWogF0W0dY+sC6T+XkTKwFpxpTfH5puM0VjpA2YBquw7hQ1kRE/37HhNBU/+y7HzbK
 A26+/+htW9E5VHnC0OhbubXz/mdVrpHHDvLkBrlPgaOFsVw9oL+6ImPRQjJdDDzcqsIXs55h414
 0PYZJRM4Vw5CrFYFb7+Nq8l6ENbvykvC3eYMXvKqzDt6CB6jKQ9hNfMCKgbU6d5VJsGLakVB7GI
 cjCG3hUyyWIN39+k86o0Gp3blI9ki212L0vjLzEmj7d//w2PUo5d3hL/xxwHZs8NQKm0mdPcwKC
 0t4L8itZ7TH+INXYdwS28CLNG0nQD6/Gl8LZzdalavgQvhWHStu3bR0Cra8B2MJmpP89lrXf21Y
 G4dWPL0dgWqWNV7yexQ==
X-Authority-Analysis: v=2.4 cv=e/A2j6p/ c=1 sm=1 tr=0 ts=6a7b2c1b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=DpJPHJr2yjW4mJ3v9wcA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: sls_9Ex1Bp8jh6I-h-Fuvuep1zGtbsBl
X-Proofpoint-ORIG-GUID: sls_9Ex1Bp8jh6I-h-Fuvuep1zGtbsBl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNyBTYWx0ZWRfX5wAS5KnFE19c
 wLcRt2i2Xc7sq/8cgmXsT8XTNr41ATvxqenAVquCuBkZmqUDhdx+U0SNGyzNyPxu4nxLNHtUHBi
 xqqUrkJiUZMei6PMw7QDy2gv3WxT1ak=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110117

On Tue, Aug 11, 2026 at 08:37:54AM +0530, Hardeep Sharma wrote:
> 
> On 8/11/2026 6:45 AM, Dmitry Baryshkov wrote:
> > On Tue, Aug 11, 2026 at 03:48:00AM +0300, Dmitry Baryshkov wrote:
> > > On Sun, Aug 09, 2026 at 12:57:00PM +0530, Hardeep Sharma wrote:
> > > > Commit e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
> > > > tightened QCOM_GENI_SE's dependency to ARM64 || COMPILE_TEST on the
> > > > assumption that no ARMv7 Qualcomm SoC uses the GENI Serial Engine
> > > > hardware.
> > > > 
> > > > Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
> > > > wrapper for its debug UART, so this assumption no longer holds.
> > > > 
> > > > Fixes: e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
> > > > Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> > > > ---
> > > >   drivers/soc/qcom/Kconfig | 1 -
> > > >   1 file changed, 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> > > > index fd4d4ecd2df0..5b3c9d31fd7f 100644
> > > > --- a/drivers/soc/qcom/Kconfig
> > > > +++ b/drivers/soc/qcom/Kconfig
> > > > @@ -39,7 +39,6 @@ config QCOM_COMMAND_DB
> > > >   config QCOM_GENI_SE
> > > >   	tristate "Qualcomm GENI Serial Engine Driver"
> > > > -	depends on ARM64 || COMPILE_TEST
> > > depends on ARM || ARM64 || COMPILE_TEST
> > Or depends on ARCH_QCOM || COMPILE_TEST
> > 
> > > >   	default ARCH_QCOM
> > > >   	help
> > > >   	  This driver is used to manage Generic Interface (GENI) firmware based
> > > > 
> > > > -- 
> > > > 2.43.0
> > > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> > Hi Dmitry
> 
> Thanks for the review .
> 
> QCOM_GENI_SE is a child of "if QCOM_SOC" which is the menuconfig entry that
> guard (almost) the whole Kconfig, and that is already "depends on ARCH_QCOM
> || COMPILE_TEST".

Then the whole depends can be droped.

-- 
With best wishes
Dmitry
