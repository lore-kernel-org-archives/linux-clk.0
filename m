Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623062F747A
	for <linux-clk@vger.kernel.org>; Sun, 31 May 2026 15:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780242385; cv=none; b=hBG3vh08lOhrQKe/tQ8axTGR1x2fVZg7UYN4mME+KNLbrb2LwXu01ASyPh49sQMum6tVReQih+PkOyJ2Hj6a5io6lHKFYDD8YzL7Vbj8tXbuLjtSNOkWZnyP5tG1OZmzn3JT/wAHTBsF+LjUvhYDrtUUJ3zbFPk5oofm30IXhcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780242385; c=relaxed/simple;
	bh=tDRhPY72eH1MEmBS1nOw9h8VQfe8ypT8HiV/251brQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAyEWqnbr1Cnf6XFPwjDS4/AjYnTAbpZ5kyN7NOUlGCmiy24Ovw1XFt7Wutbg9YZ19T8MrusTdTMhDGp6ddhAXD8Va4aNME75u/OU4GnnJKhsHA4xP4fSmQfT1NgcrE/wn6wMv6WfbZjoyXiLNMB84xODN8mulQyHwFxy2IcIT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FhZHHD05; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cr3DgQEj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FhZHHD05";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cr3DgQEj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64V5vg9o746796
	for <linux-clk@vger.kernel.org>; Sun, 31 May 2026 15:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=epu/m1cvWH/gMxE1VHYbejyh
	UddjLIYqkFTpjmCCs0s=; b=FhZHHD0515LPy1LXnlyjOV+nVDT3mUfKiDOXzM9g
	qUfnOY7do1N2DAm3batsMoalFpce7/Kw1AQalfdYJHaM6SFXZYKOPIXOB3eBamdp
	wKvDesaDkwSIp9LRITI2+Nuvzs0nPIVt5TJKe+UTc+rDN9Tod/XoroOK2OHLR9H0
	JFTIx2oUXmrXaT1VeFGyJ//k8k0gC8pDqfwzNs0eKwMo+53R2dfb3Fgzv3BP8Spg
	KeHWb5hDERAvXLrzkWSdeFHiV6ENNnqddOocW7DUTRr8GiYgs/2Gnv6NcE8VD0lo
	7pXYUAZwVXqEq8EPSZTLE/oetDRne/xDXjwRtHiOU8udXw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efn8pmhs9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 31 May 2026 15:46:21 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c40601e2b2so1969876137.3
        for <linux-clk@vger.kernel.org>; Sun, 31 May 2026 08:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780242381; x=1780847181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=epu/m1cvWH/gMxE1VHYbejyhUddjLIYqkFTpjmCCs0s=;
        b=Cr3DgQEjAdqo12++XZ/RBCYVJ6Y+bTKgum86LcRgBjpHLdELXQqJ1PnlTsMLxzdamd
         mQvL7gKS1xWx7TZZzXlmTTby58r9BC5FAeUS6a6eaUEWNcjj3URj03h7N7InOIzMNsIG
         9sjgNvhQrOnCdQw5VRXFxuWUHVFnypB+QuBfNsYChA8Zb8ktcy5JE3PYoxNgayDHZr/q
         t7X3TMR6Dd9ksyZOa11sRNY+3hOot6qvpYGjyJPyjqTAwmVYV1q5zeZx9uAlxShpIgkl
         fNOHLqJ9Hk6AfE1zHL1ek12FKt4DD53/N8B7ovTHJk1y7wOYRLIAcqymkW/FBmB0Q0Uz
         iL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780242381; x=1780847181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=epu/m1cvWH/gMxE1VHYbejyhUddjLIYqkFTpjmCCs0s=;
        b=DJah2Iia6YZXgZQhbrhIgrIP8gQw/UiCd3GXPKcILuWZha2nbEsVbG7vaNHPh5+Gcs
         wUYn/UWmWZqnCpWNjxN3X9fGq1ZjBbtz/IcpUOgpceXyO+NeuCK4VgjQMwT8BwKv767P
         y/isRbeQB5n9yFzeYpOtR6WJeF6kFvtxoaVLeV8CtHHDA3GkSGXRw+1SNnkPOoXlqHxW
         nPv5QAJp9JIbq7knzYc7bg2eWsdkqz3NzSuBJUnT72UQHmERvQQoEaUcrLa6oHjkMsh9
         bsviYibEUAwREziFE0vZJveKazyKSmab+s5gcnisACtvyLUpKr047KsRBzslTGsC/6OK
         XVEw==
X-Forwarded-Encrypted: i=1; AFNElJ82bhI4L6dqGMVZMNAXeOor4PKnt1rc9z5mH3vKycgPv7Rnx2rUzXcx7i+qX9NKAzCb+/KbXbghgrI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ3/iPDey4fxLsyAE8/JDPCP7DvbzXblD5jjATydfCRYVSrAZq
	2KLPZazwKxFhLk8kRRCgZHuUEJ3KSJycvjNrRwRcbSsm9VkhvEA4UsZs2SuUZLOy76NewRMfR1Q
	rxpNHg+XSh3byDJiUY9XRutjtr1AsJl5OclxS+lqk9ywBVFKh5CncfZEkFyQWsLw=
X-Gm-Gg: Acq92OGEY+yG7co0vHzPn4K/RIu0KLRjXvCL5Ot57El4KAKUkuFCnkKIkX+fupnRmfY
	k30b27+eHD7XZM9sX4Y4dubJwOSeDyeQCqTORfscAHd9QpZGHeJ1FApIIkwJAdIcW9U0j5UpZAj
	e5X69Tq3198PCLF0taZ3kHL7vpp71dRD2HGdc0Bg/BTq9xt95XzaEaqBcMVbWb9buO2iD+hJtYt
	Fr+/ROfS/3uDSvasCdC7StgI+g/8BjZ0+mcqPXS7Qfd3RDPfVS4FTzp3CTfEoWWHfsj+ia+qlhR
	yohfaFBgyfg6fJaTzKzyGshI/eK/He/dH+RWvh0yTi8Lj2Ox5W2pj7QW6ryYYcz0hrLgRRiofA/
	wK7Vpw3EPutfysmzY8kCzWIUsGkbYeymGop0PjvooLIn4J+OD3abeIMnPMnI23bjyM+eIfWlhuT
	1Rt3BjkNz9+fxB1uCVdS6DkQJmxSvJy1bhi/0dmKYUZRTusA==
X-Received: by 2002:a05:6102:549f:b0:631:2624:e5e7 with SMTP id ada2fe7eead31-6c684ad0f5amr3004754137.14.1780242380817;
        Sun, 31 May 2026 08:46:20 -0700 (PDT)
X-Received: by 2002:a05:6102:549f:b0:631:2624:e5e7 with SMTP id ada2fe7eead31-6c684ad0f5amr3004740137.14.1780242380421;
        Sun, 31 May 2026 08:46:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b07baf9sm1543041e87.31.2026.05.31.08.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:46:19 -0700 (PDT)
Date: Sun, 31 May 2026 18:46:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] clk: qcom: add MSM8x60 LCC (LPASS) driver
Message-ID: <vrvmex3zvbwbtobccithsxbel5rp4agpnor62ocadfnwbasq6g@rt7hahrlp4sf>
References: <cover.1780148149.git.github.com@herrie.org>
 <10180e08af4d55e776963932a4c5e60f0f197a96.1780148149.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10180e08af4d55e776963932a4c5e60f0f197a96.1780148149.git.github.com@herrie.org>
X-Proofpoint-GUID: dSXyysNJDOEWGk_hnOUHQbZJsfpFPUKV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDE3MCBTYWx0ZWRfX49EaRsjYQrdy
 KfMewzo3iJ8hhNhDijeD++F/2jQeS/Bk3pZ+13iVeFtcsxhpR6aL0N4lUG8Ui90bOEXLBmHQnY4
 XRqV+TgLJeUk+m2G/9vV7KVybN5MYH16tydqdvjwS1UFU3326P9VPxuECeba+kcBh5Ew6ATqHOI
 3mf73uWBdvruduIk3AxbRat+AyEBzpNxU/PQUIQzFaTMHYONsViuHmX9N2O64KVWPKLDcCBgRdB
 b8gz3gcVLcHX903kCsTgxeL6e9PqlPvLklCgFeXwJ09CtjEcsij5dDgV4lJCW4/5JxrOMVonOta
 MC+RZLAe+Ua1iZ7GOAdC6pGFwsMrVN0dJFlugiKMH93hnB0ewmlJORxoL8W7zOW7uaMwGJjUs7I
 xj7JFQV1iwBBIns3oKCKCzJHYOOZKV17HlnynCZ5ycGY8PFH8CQ6z7rZzCPEAcLHz1v/CVCT6/z
 ObbZvPdTusGbshxqv6Q==
X-Authority-Analysis: v=2.4 cv=NvvhtcdJ c=1 sm=1 tr=0 ts=6a1c57cd cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=cTwmTnRGAAAA:8
 a=CMVvGDE1AiGxj1kctLsA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-ORIG-GUID: dSXyysNJDOEWGk_hnOUHQbZJsfpFPUKV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310170

On Sat, May 30, 2026 at 03:59:58PM +0200, Herman van Hazendonk wrote:
> Add a clock driver for the LPASS (Low Power Audio SubSystem) Clock
> Controller on the MSM8x60 family (MSM8260/MSM8660/APQ8060) - the
> Scorpion-class generation that preceded MSM8960's Krait CPUs.
> 
> The register layout, parent muxing and divider topology of the LPASS
> PLL/clk fabric differ from MSM8960's LCC enough that a clean separate
> driver is simpler than parameterising mmcc-msm8960.c. Both drivers
> can coexist in tree (different KConfig options, different match
> table, different device-tree compatible).
> 
> Used on the HP TouchPad (Tenderloin) where the LPASS Q6 audio DSP
> needs functional MI2S / SLIMBus / PCM clocks before audio playback
> or capture works.

Could you please merge these changes into lcc-msm8960.c? There are
minimal differences, so you can just patch the definitions if the device
is compatible with msm8660.

> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  drivers/clk/qcom/Kconfig       |   9 +
>  drivers/clk/qcom/Makefile      |   1 +
>  drivers/clk/qcom/lcc-msm8660.c | 517 +++++++++++++++++++++++++++++++++
>  3 files changed, 527 insertions(+)
>  create mode 100644 drivers/clk/qcom/lcc-msm8660.c
> 

-- 
With best wishes
Dmitry
