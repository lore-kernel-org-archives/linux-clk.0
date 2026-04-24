Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99A030BF52
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 10:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026683; cv=none; b=Z5baWNmhMjPXORwk1SyiqclJsD1UuaCrGy3hJfsdwjRtMmK1EABRhhFXyP4m5Dw7D1Eyb6yt/aPR5KY3/4chQJ7KukWtt5cT7uzQiJNsE3RGzyu/lZptHu1xNaYfeTeVmYyUFB5+UlHaAr39gp7QW5hruh49vJULtVVlvEH6B4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026683; c=relaxed/simple;
	bh=PN79pQYU0En1xYe9D+IRKMbvoUqMajBOh8B1Txg8eHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IheKN0SelRZHHPNwcoSEBxSC8VB211krpYxCmh3qD1XjSjZwGXEao483UhkYzsY+S7/7mq8GnTjY30Ej9txFBL9if74mLRGodPA5OOBd5O92rXVRunU1FpHqATW+mjfwSRolGXpwm9qBqL3lJ4zY1WAt/9now+jldRzCVt8haQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLr0pvz5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RH9WzZ8t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLr0pvz5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RH9WzZ8t"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7Z5Pk4167558
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 10:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7eORED+9/+BslFSauOCIHw6f
	S43tga0F3hzdxbVP/sU=; b=FLr0pvz5chPV0cdTmlj4y5X1fDorKDx6GiftLL7R
	ON5xQIL66MM/chO7m8Qiy7FOs4iOeq94VBQj09JTqXjRz392+Zf6YWe5VlbwrHYw
	/tyWwx8iGlreukydk+ZURNKenGyDIfC1Q4mhSb++NF5jq0zq7m0/x4X4PpLEfOec
	HGPpkI+hpT8lQrLWx67UEmrm2zdLoD0fcn+SX64/nY65xes2R4QzVzJ5ubXcF1Ga
	VQ7fL/TSESk8YYugd7lQd8eZ+AWZkgD5Vp75/zPFoy3VZFAJ/1RaaEz624eCkqqJ
	kXQT3s8a73Mp0qJupJ1Saw0SnKFLfkH7TPwVUyZr6q5TSg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr48n0stm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 10:31:21 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56eeaefec9bso7466961e0c.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 03:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777026681; x=1777631481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7eORED+9/+BslFSauOCIHw6fS43tga0F3hzdxbVP/sU=;
        b=RH9WzZ8t2yQRySoewkzQ7KSqwDkCwc2i5DdH9C1Lz0Og+fm0CewNpOkodeGQOuL6h+
         DSXzl+tuub944moI6YEFdoZqb1on6IncTkHGmD8LIQ7sR4zobj+TzuhNoBhED07j8AsP
         kMzWvFX8s0zxmbREBLMnLCEAeT532zUS4GCbfr04sgUgynxhFmEOxK3wAo1LvzrmqfP9
         wdxhKsvMbd/pxeab2OEnkjYDPSre2LT2Qa8GolUs30ot7C05v5TyteTZX4orVTnPonEL
         qBhi3QzwrFw0U6qtz+EUWCkLEqqiumu02b4r7DqsPKNjhxKR5HCoLS+GHH1eh3L+9Q5U
         F7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777026681; x=1777631481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7eORED+9/+BslFSauOCIHw6fS43tga0F3hzdxbVP/sU=;
        b=laD/9lX82aI+DN5dpWKld5Bmf/sRg3/y7YRlU/hlXpLJ1VtPIeOBqNUDM/E5+hPuJD
         0PVQAX39WH5KmvZVjwpHzxJ62SS3G6hy7V/CRzBwO7qJtX8Pr+03GNjpWXAICYvulnQK
         0Z6Y9zmizNlTkSmXR/0knakY/1fv/sY5JyKVvZBnN3oy17yOO+FXaRYJHLuoRHq3qRQV
         FGWvpVFmyVY4JFguTlXxBcgdwcUp1fQhd9+Lbg8e0wvRq1HBneFTChwZvFsWdGqwXDO6
         hYsDshqlMApMHvY4smGtWI3jmHZiID9c8PR2rJotiO/vsfL1wi8Jksp/9ZWVVCXy4VNj
         +Vdg==
X-Forwarded-Encrypted: i=1; AFNElJ8K3zu4Npx9RBoB4nqW1zthWIpLgteMfB0WjwDxUSjK5UjG3U+02/pR92B3Mbt7e5sqjs2yZANTRCs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdgkq6ENcXmd9Nyjg/BS4APQZgagH7SrDiYPAMFt4KSPeYZxV4
	rFU3FOcojRAoEoZwUJziptW+zF/xlApIGM5nAKaKQND1QOlXGkY4gpf3fPNOkJCiwQxU6WZFWoh
	EMn8IGsUstBa/NRNruk+mYGww7oUbU5M0P8oAoQqAschb+D4DwckWOQBgOA4C0RA=
X-Gm-Gg: AeBDieskQEWSecx0BUCLdz9A7/7F+4Lq2fWSfb6m45xGtYbSzs2QeMpdZbYM9HSQgEJ
	i4Q05h0A2KgXH5hsEFq+2XnU7xSzEuViOqDm+rnln7M4E30ACo2UAI4OjuEwxgV0sqtzgLSW8tl
	UXmbcN9mVG/VjBIXKXbAGJWm2teFOdP1mF9usppM5ok0uyVOtFvpmXnSBI+XtN3QYIr4XxGCyqZ
	7EEO08LtmrnrrKUBR9dRrrDjg1/gJzLiD0r3flVYPZaPGN8MGcef6Irayt91g698lZNdyE+RHPy
	4S7toBwfU04N1OM9eElLPBr+vdNviD/6D9KebrGZib60VvqSH/WXlgHFKub6WIq/ZcxuknbjuRw
	0zj+Is++Je/k951m1d2D8tkeC9BLpXwXWPLwoUQjt617XGmI=
X-Received: by 2002:a05:6122:8b8b:b0:56c:ddbf:57e2 with SMTP id 71dfb90a1353d-56fc6816e2amr11361014e0c.11.1777026680946;
        Fri, 24 Apr 2026 03:31:20 -0700 (PDT)
X-Received: by 2002:a05:6122:8b8b:b0:56c:ddbf:57e2 with SMTP id 71dfb90a1353d-56fc6816e2amr11360971e0c.11.1777026680323;
        Fri, 24 Apr 2026 03:31:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb75a913sm177753365e9.12.2026.04.24.03.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 03:31:19 -0700 (PDT)
Date: Fri, 24 Apr 2026 13:31:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8650: Add missing CX power
 domain to GCC
Message-ID: <5vwqco2zbhzb7phdtkvirytj6p34ig3ab7nm2x7jlsj6domoa4@7exxwqsyxpss>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
 <20260424-topic-sm8x50-tie-gcc-to-cx-v1-6-4b6e09d532ce@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-6-4b6e09d532ce@linaro.org>
X-Proofpoint-GUID: lXwrP0ZDxutWoHmKuf3-Vg8ItSMrZQi9
X-Authority-Analysis: v=2.4 cv=VOjtWdPX c=1 sm=1 tr=0 ts=69eb467a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Fkf1F6wwXAJK7cocUXQA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: lXwrP0ZDxutWoHmKuf3-Vg8ItSMrZQi9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5OSBTYWx0ZWRfX/M7CdaeUhrR1
 ogtBYFLfGWUMlDdcToI9irwElGeMiPLuPZbVzEYLn7orMx3oeDVuRNoQydtdA3ftEOPVllyVPx2
 HtkH5J6EZTLpBPhV4URsNUxs+YHVkF9CLUNW9vwrKnVSVcFoDXf73VTApOPNQhYPShy51bXb5J4
 ttU+iaYZt91Y210LCm0ucAwKtf6sD3B429RticWPC4ikhSQr/YhHO4MPIq2/HgGoHSxP9dR1IBJ
 lWIBNBXAhe8/UOj7zzZFbjxhaIMb9sMrh/sTeJAwTI6s201xLZLYuLwYQIs5AGeXiEDBWnJPwL3
 iXKrGsXC0oFieAHSUUZLeIcUWdAc2dMtjlWobfhTlGd/az9JdIBE1XnFWt7tbQUiTfx4/B3hw/b
 3CYjY/H6HqMxCImY1iyLQWt0pQj6okkuta3egJPIax2hGzVxaOH0XvVSS/gCe7BfwKRTH7LpLLU
 ioGIsfVaWP15qUGqWBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240099

On 26-04-24 11:08:00, Neil Armstrong wrote:
> Unless CX is declared as the power-domain of GCC, votes (power and
> performance) on the GDSCs it provides will not propagate to the CX,
> which might result in under-voltage conditions.
> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> 
> Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
