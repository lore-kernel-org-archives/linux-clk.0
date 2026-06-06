Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A9D38AC64
	for <linux-clk@vger.kernel.org>; Sat,  6 Jun 2026 11:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780745546; cv=none; b=Wci30HcEi6AJvkcwXXoGDwMqBCtH+19okKxpKKWcmBr5cFrKWKvpSrYSPeZ6wG7650LthEta30QiolBopo5vCuU+jHKISe0MSoa7c7dLrzEcUtoEiClSU0Mx1+l7C4aylORusuLhWiqghxzOP8R5+gRorMAoqJA4UuonK1B3aQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780745546; c=relaxed/simple;
	bh=HaxKgkGgNYx0k9XNSRNrvt/BbgC1++5qnpO6UiN+C4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aV0r1GtauEWakL3xCk3suxwrlI4vHLL8w69kyqxHSCghaLuooLzFAgOwpwYcNJnHODWufoJAmrYIInigqjFRb8LY6iNl83S+OWJgv+S4tY2tGwsrc0JET1Ji9np6u6l5w44eSIz55jKmLBjhmLlSkp95uSijSIxdiYZeJHgMU7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+n9r6bn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=emRfwZc6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+n9r6bn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="emRfwZc6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BDX9G1330569
	for <linux-clk@vger.kernel.org>; Sat, 6 Jun 2026 11:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nvXT/1SfUOoEE6ujMaH6turp
	9EtLMNdFzLZalWYo4ww=; b=E+n9r6bnlrP10pod15j20uxn8JcrvuRDXcF69D/x
	c1pRhGk+THtylw4ppFLTU0dfX9GedtgbizGitF3NpYThFJUTTd4FdAEugQ35lQuL
	d0a+aCSxw1wt4iK9eqZ6krc9fQjPz1/Q/ipp/ZN0bSR0+ReyC4iijfaJRLEG/3ke
	Dqtlx0OFr+LOialjOJg+7mw3Uz8eT41oTPx0Ov0yQc6XOkxzYf6MQ3Pgemsa/lzN
	BmU9CBsLsXCLQQ14C2Cyr5ZWpvyhB2/+YUjFFOOWLVoAr0hBh8V0BWmBSgu5jEh9
	t2Ci7CkSZwox7Jl0SVXSMY5PNoCPKEGXqztsnudl6Pg8IA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98csfaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 06 Jun 2026 11:32:24 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963c12f125aso3177625241.3
        for <linux-clk@vger.kernel.org>; Sat, 06 Jun 2026 04:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780745543; x=1781350343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nvXT/1SfUOoEE6ujMaH6turp9EtLMNdFzLZalWYo4ww=;
        b=emRfwZc6T1rZ8c+87XzFAEdecTLVQ0zvn/UvNIkNpjg24MQ/d9N8AYjlmoH8i05a/e
         L3voDdESBJosFH4eIwjBkz4mBh0+rP4yzlkRrfFMZpAt9RPYPHqpfGMcLOre4+DAceXq
         UiKCgV4tSzS2IMSGrzvXRppwe0/awXs9W/pZ+qu8IfuY2pUE+ZXnqfmhR6dK38Z0eJl2
         KSY5gSyad8Y4YIaab7o7ajPN3NIZHOiuT8z4ApmAZunPgi8Vti4WupymoLAv0B4lwXGb
         3LzmbzhILi7OoIOcMcr1o1COdLFvKiEqXo1mFATOGl4gYFQT0BYb+jdBRIhblyjP8Oes
         l1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780745543; x=1781350343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvXT/1SfUOoEE6ujMaH6turp9EtLMNdFzLZalWYo4ww=;
        b=PCtT2H0iNe8BIrXgmKuPbuCFfbaBEtvKGvIManFfFJ1pHMkDmEug+FULC3CwAhsNwU
         MT45Fp7WbHS0S6ETnqnNNL4CRjVt10JzAMYWgTyXxWnX4On6xjN7aIWW4gORwGM/H49u
         0xXd1/BKdButsqPYycKo3CpEyBGKxdvO1r5jm5cwrv+DsLaE6KkMMtgKnapkZpsu0Uw6
         tLIZUTvD7qqwZXvXwwXx5IAYWEwFW8Xty00LXcFr+VKfIZYt1XWYRru85ij+owA6Mn4L
         ujqy56/mXhlrjFsL9WAAJ54rOpAeWk9Myb5XD7LD3D8/UYzkbHV4BNFbkVkI82cNRhMI
         vwUw==
X-Forwarded-Encrypted: i=1; AFNElJ/0a+jPpAmO15xoS0BVNItpfH+I9ev73jQzpkHBwgiKK+mpteBt/wTATQCml7Y5MKVaAirNY11e3R4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtZAdHadnjkv+n5fWLd9rSC+3G1suKwzqflvPhFDmecz6MUMOU
	NTAUm231IUNUlsbDRMb2pDrowRLmF6u71hbK/sRHcUE+SVdNTYDVZ/wa4/dhg8hzA0ShphoXSW1
	Ywv5z6d2OwfburZHjZs3rwWzQK5tNzL+ghfgQOnhI5urBCIdJ21Yv0XDrE3QtASI=
X-Gm-Gg: Acq92OHUARQthGuIU3X23/cF80Wra6WXy5f0/ykcwTE3UKWlVOLAZLVaVuYHJrlvPfx
	ThiWlBODBJwtKE4pZWnNc86bnpHLOvBzdb2nE0155FMX2M5d5xz/vSSmzixbL/UNJm6ZbgF+u5Z
	p0pgXwDFnrtCsUPO5kmGKZ0u7NhPzHrXK9IDEfFck5/GQxYvCkuE9c/Su2o21PEOGq6tAfbv3LY
	8Pl/jCsbN2K53zsa0+0XuFqsn/13XIxp1nke4nF0VnoysMTXuuWJN3ZS4N3YNaZgSxiGlS+NRbC
	LZ5a6/YFvH6p/gXzz2r/iC4j2jdh/5AfBiFFRG7zvMkuqRV8RT1yjlkuQcOR6l3kstjohIK+obS
	nEUtvqbdzXidyzYNeroallhG0z0FtY4MbIEolygk515mdYYYCc7ImFfSlppfuukCeLBFsmUrp9Q
	WPWp/RvjgFPDSzl6Czcc1MCLdUKB2I32JkK4ROSYx78s+FCQ==
X-Received: by 2002:a05:6102:304d:b0:638:944a:49a3 with SMTP id ada2fe7eead31-6feff817b15mr4051915137.11.1780745543266;
        Sat, 06 Jun 2026 04:32:23 -0700 (PDT)
X-Received: by 2002:a05:6102:304d:b0:638:944a:49a3 with SMTP id ada2fe7eead31-6feff817b15mr4051910137.11.1780745542847;
        Sat, 06 Jun 2026 04:32:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b985a4esm2372309e87.56.2026.06.06.04.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:32:20 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:32:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 12/13] arm64: dts: qcom: agatti: Add DSI1 PHY and
 sleep clocks to DISPCC node
Message-ID: <6rrerd5boc3x7kwuwatxk53a5dsirjqzndptskwfiyli22ds5s@dvmondtb2mfu>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-12-8204f1029311@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-12-8204f1029311@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExNCBTYWx0ZWRfX7LBVLXDw68Lu
 J+wp+V/rXlqsFXAlYdmVZ9IPvC4hZedEPQMX9WdbVSe9A33ulKP9i6LL6HAUJoxbgdN8AJFWaXv
 E7mOnWgeQPLZJASs8y7XdQLmR/oQoFwhsa7frPsTy/bRa4FzSOr2svxWVfjiZCHx51nGdhVnn1M
 ZpDfaoK/bFd8b+8FWvmavXuY30d6HNaXwiwoSSlrLaXcjkVNDvm67J+omY5Ty2J0Bep9V/6JaJm
 x+/DHtnY1lWdij1TBH1+/4aapLtnIoVQHN3z0gjX2uCHtDhCusYd/KhWV36FusXI9DxHNszCpXn
 e6N03tFN7J9Brf2j/S0cFTGiF9jVpuhsVrm3vAuOSvyYCdhEnZh3HiYGiGUFTjOFkJe0ofa4mG9
 4lPREw0ATinnQMfznuIFoTTYuTzaOjOUxxlu/i/118SpN3s4143Kp21OCpxtPQOQ8fuWWkg1+LZ
 rSXHIYEVaD9xBK8/iyA==
X-Proofpoint-ORIG-GUID: -SqlTk0HsnTDL7Nab0DpzIiW_5dZzMAb
X-Proofpoint-GUID: -SqlTk0HsnTDL7Nab0DpzIiW_5dZzMAb
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a240548 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=MnNUYsW2gAO4r4gG23sA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060114

On Thu, Jun 04, 2026 at 10:56:18AM +0530, Imran Shaik wrote:
> Update the DISPCC node on QCM2290 (Agatti) to align with the latest DT
> bindings changes, which adds support for the DSI1 PHY and sleep clocks.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
