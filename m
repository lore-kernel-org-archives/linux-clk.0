Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793477986;
	b=h3ZjRy1mkFAAMZyDfpHY+zzhLZU/c6fiOSb+74KrNZDDsU2ICKTwlISZazmxx4P13qRm
	 qKItl1nvn2Mb5/Kl/ewutGef1cFINYKxv4XumUsTy08PHWA7MG3Tae4SJBwJ7g4roN0p+
	 SpGHlgZpYcjfrDW6BV3KKqxY2Y3mHAvnbHQNNOG1iJfWqUGdiGhzBNpvH2t5GRFKHOYNp
	 IF3oNlrPgV6gQN4glvzLqx+ZYclL7pc4QiqAHndF8mJJNDqsL0u5QvmAnoE21MOyI5fW4
	 IhqGH5Wx8S6SzLznzW8QWGf4eVZz4hxKS8OHBIPuvgFd9wA4VeFiPnh9RMdm8cUmciQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793477986;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+VdHn6TpgZyyeQuYkzHyiAfkE16dWOMnysbVagffdjg=;
	b=qiby5O1TzPTU0IoPZsKg2r1i2iM1p0TcJf4TJpFqFz7vLJdOXTz08uPko4hg5BMH2BeC
	 Z3QwU1W5jGLGsh8AE93Omw+Z2IsJM04qsPjHRsi9n6SC2oawrevlIU67H2Jj9P420IC74
	 Pk7mODJ3uVo+CDvgqya8HM7UBysRjZ7CHBbaGDlBl5Oocvunoc8/Ca51umX3SopgxRygS
	 SnnYEikOX/htj5g2cela2n66b+XYDABX5nYrX6LoaDQZg2nP8PPbfp7+tNU/pME2QNQDm
	 vHh+qbOiVQHjkcaVk9V/auk9qQXM6xkOmpUHL+gr3CMSgV409P/4+ugl/DOFglsMTPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GcCODbWT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z3k1CXZw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4066B606A31C
	for <linux-clk@vger.kernel.org>; Sat, 31 Oct 2026 20:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4066B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GcCODbWT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z3k1CXZw
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJFDTN1890223
	for <linux-clk@vger.kernel.org>; Sat, 31 Oct 2026 20:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+VdHn6TpgZyyeQuYkzHyiAfk
	E16dWOMnysbVagffdjg=; b=GcCODbWTlGP2km+0+xVTV+4QoNXt90KOyGzd1qpv
	VmEHo6M0wl8AAH4w5jw8veoFojTJxn1cktkgQoCLR8e5FSDZIF4UqA038Cgs5pPM
	4iQxJZ4PRI5ty3Lgb0WFWg64u0dD3AQn0LRPEtudoSjFfR7VCnNioPI7q7fEMCJk
	oq1Whcbp5t9J2HZS7a42gBFJ6tIwCDFJBvdezV/RkGkn1WGujMpqEIdFSUDbKIw5
	5pza7y+5NUgSX8+4hJ/sMXVinn5aCm2ibyQ+Mcydqeg/IP8oJowmE1Luy55OfRbL
	Xzx0O5rJolN4IaDLSGA29XULb88BVxCc2BUlPnHrBRL+0A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7sxhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 31 Oct 2026 20:19:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2005ce21so252163485a.3
        for <linux-clk@vger.kernel.org>; Sat, 31 Oct 2026 13:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793477984; x=1794082784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+VdHn6TpgZyyeQuYkzHyiAfkE16dWOMnysbVagffdjg=;
        b=Z3k1CXZwe2WywFjS4ghAhSbqt3FAajR99rIjlLKx73WPDv0f/fO3QB2/9Kp3UbvtAV
         qNZEaoAtI32I3abgqsq2JaLJLj87wE7ZXL5DGyAkvFf6eQ9GEN8uP/fkhCi8O8sLtLEv
         O6jys5cqZjQzLLCFrKerrNkIONETzGFG9Mj6LmEnJtmEFa0nmBF22V08Reg1XyILCBHy
         n2AZvpstWXh9v2JjuNX8m74hxsjQfeinBBcnzs8z5Xk77WzHtjQspLyoBiU7pL6+k4IN
         j0TyICMD6+93IHwg1r0lO0tVlDQpqVOFGydnE1fxbohKSGv9Wyqgj5VqoIdxsTY7vdrG
         JYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793477984; x=1794082784;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+VdHn6TpgZyyeQuYkzHyiAfkE16dWOMnysbVagffdjg=;
        b=Y76fecn0L6YcUj7N2MbwLRBaL6OWmwr3RKFa7sNFKbERapNJvbwkcHIm68KycINm1B
         3KQEhy6nDsjEELPl464Kmm5b3HJ+vc7SNcquL/u/Jv3qPSgY3ZX7E+QSGfjclCjGZ1vk
         8rDhMK+5RXLhYXxI2LVlz1v4Py6MrajTvLtyo2k2UcTWjMhB49I2xJj/aD53snuzzijd
         jX6bcX+qongRCUI1S/Hop7Q3lTQe1koC845fNNY+yTogBEnFpA5aNNWJEw2ZmvCLDb3/
         ml5Gn5MVe6jJqDNDSdZphjqKd2RYkwK4YrmfjhcgmG/iEuiw724hjd2oxCT7pru0F9Mc
         EOiw==
X-Forwarded-Encrypted: i=1; AKwUvBxcv7NSvcnbqLF6GTOF/Sr/cZb5418wtidNSNVNw0VFripz8EgYaOiGTdCjC5+IBXpJjRIkr51kE0w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxD+tpbU5swcsx9KTc+N+VPZPnDbYSC92/l5KRqBhWfXVpnu9l
	d/i5WJjX8BUCw8c2wn94dM8t5Y49emTl137OwWWFlCxdu88i7CO3fxq9xp2zlQ7CFB9q4U9Cx3x
	O2Nt6YAmV2zJVWN8Wki2blqbd8IrP1WYhvYZcFb8m7EBN13QEwmniJJLK2TzUPZ8=
X-Gm-Gg: AYBFou3FfApEaAFuZTxu45VYfWxddO+p7Q47jK8zo6XsaMRnN3y4JJIF0XQsLLDg0IR
	tJazwGNZKafMpMncoiTu+A0Jm7qFQKvuIdTnQldXWWQEqhaDAwamWh60LNWSLA5IJsMisKqkgTa
	i6TcY2hpDre/KeQJ5LN3KfjVoafPFsnb/Z04+soxJGfR+Tf+JLygCC5H3IhPTIpp6GwyDecU2vY
	pysXOB+droPezxJRX5lq/3dhSjGlJ43iGmai3T5fK0s6BcoWGgWn0GSxF/pI/givO6Sc9wCteim
	oxq0CdcHrU6W52cbWkdr9gS0k63MG08vqKtsC8uuAxonpC/kU+1o6K2Nph9s54N9FhZFov9o9tq
	Sn6c4OYnvOViY4jaBBX3p81trIMu5qW5b5VlYELA0B1Z8QUftdoI22i3zN5kwkTJgntHl+Vzycn
	KNLi1MdqvuQBk2fpqw/7Uqr9S6aURnyC3/ExIxhbVCheGS5k2fGqb4qPRFfs+WbA==
X-Received: by 2002:a05:620a:2b89:b0:93e:c12c:9dd0 with SMTP id af79cd13be357-9442177675bmr987618285a.80.1793477984340;
        Sat, 31 Oct 2026 13:19:44 -0700 (PDT)
X-Received: by 2002:a05:620a:2b89:b0:93e:c12c:9dd0 with SMTP id af79cd13be357-9442177675bmr987615685a.80.1793477983766;
        Sat, 31 Oct 2026 13:19:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe072c0ccsm731601e87.30.2026.10.31.13.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:19:42 -0700 (PDT)
Date: Sat, 31 Oct 2026 22:19:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-glymur: Use PWRSTS_RET_ON flag for USB
 GDSCs
Message-ID: <crsmuaonoizluexbbfjlzaaidtun7gsveps37mhaav7uwpfsr2@xwqtiswnoj4r>
References: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: nr6njw8S2-JdZblMEvjyd3_MOYtKH2gg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfX8nrBbNU2NNht
 afOwly5XZCH/Yfv+lCItbjoH1YMYbBx0ijKaBdrb7MA1arCVCulpGmAvaRiOChNhNCCGadKg+rg
 4dr65MViB894groZaSBbYshqY6aXcnE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfXz1nSRGNLwilr
 ftFhciux2pNfZ4vIjF6Oh19SUdht7/ezaLllv4f3s/W9aWpGzWR5w4k3Nw2DBf7B0/y+Pr/6dY6
 6zIpqfMQQeMMCt2CckyUbKwGj9EYENegn0SRz/X4J9xpNz0c/+gyvcPhQUt6klIJjqtkVn85Ndl
 NUH6jME9vDyf0Df4hcrIKPrFgXXD20g8YjjciYK8E25/hBi5M0DFhF1PKk3zYTeLJVxdGmsW7oB
 xXKyq6VGhNcvXaNgJe0DvvTcj1Ucpi6YZMPuX9g6JniE9ukwpPa89QGJelMtcuLJlbAkgDZBiRb
 Nd1+lRdaBawJhSmKHXkn9jkxl48HQlrtc6ZV+AKEHkFAeAhKXKDCUPqD9Zx48Ho/a7hxGsQMF4a
 eOZeluuYACoRTnq/bzqJttBbARCAJ3DM1mV46UoyPnXwHMPZBh4ZRxgHQ+ggO8ldxRCimHDMm99
 v+JaWE5KFwJG1Ypwd+g==
X-Proofpoint-GUID: nr6njw8S2-JdZblMEvjyd3_MOYtKH2gg
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae64d60 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=XHe_ECugD20tH9J9tGIA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310081

On Fri, Oct 16, 2026 at 11:58:44AM +0530, Jagadeesh Kona wrote:
> The USB GDSCs on Glymur are currently configured with PWRSTS_OFF_ON,
> which allows the GDSC framework to fully collapse these power domains
> during gdsc_disable(). When these GDSCs collapse, the corresponding USB
> configurations are not retained in USB host mode use-cases and this breaks
> the resume of USB controller from suspend.
> 
> To avoid this, configure the USB GDSC power states to PWRSTS_RET_ON. This
> prevents the GDSC from powering off during gdsc_disable(), and allows
> hardware to retain the USB configurations across USB host mode use-cases.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-glymur.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
