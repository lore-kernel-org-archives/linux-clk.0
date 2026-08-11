Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C82030FF08
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 00:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786409917; cv=none; b=Xnppk+Y4FtK8uGuHO0i0pS2BeL5b6BGDWkaRxfN9WeRpeEiVdgTq5a4z2foHRaNHbpS2N/DKmXvqHoFaJUsVe9dBCgxr00CeRMrcoaq/Z7VFImGMu9z4cceMwz8sxDpEBtW0VsSkBFvwdGJYxticYhWHQfJnBtH0Rgyrrxv3ttQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786409917; c=relaxed/simple;
	bh=pErCnijODy4fEgUHDnc72g3nTdTWc7uPAXgFC+YdY2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZkQfWNK3DxMGWklR/TkjBbq567vkc/RgFlGsTtbuVTZIwqSv545S3yQhDVX5n9auqV3XondjV8ynnoY3QxjZzUrS13HkQ4kVkm19StUDGC3DFpq2cZmEz8In/rIru9TKh81mSzkrf+M/Tox2CaCv8XT3tSc6utWwQVbreE9CvZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cu5PUPsN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jp4PjF4d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cu5PUPsN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jp4PjF4d"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMpuWF1751851
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 00:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pkBx6g0ZwIllK7kPvgkzwBWW
	DwY+Y8f971ch+fkJ02g=; b=Cu5PUPsNJ2vv5nMJOVn/TWvRx3ePaKRMbudwcJwg
	+Po/S6NdQAo12XAgFqZQyZ8jrVsF5SIQdezznxr2ocljEFLhDDUA3yJIoK1FOGta
	VByxyKdnG61FbeAmaN9DRFUmu+zUEwx5AhHNIVMANEeYaVLDQJgmyied/jmizJ/n
	GzE5JItvcFnKK47Vs0dfcbRSBeRjUAVcdAtYoGWWjjliJOJnkHBx6pWHXOcRb7wM
	uCDX7yakeTXgDmy9SX5KJcJhm/wSFE6gEc+ygg2x/Zpz7Dlcyzkd+5MIM96OyOXO
	N+ran2TizBy+XC03fa66psVMpXdAT83CJb8gi+KSSH5RyA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fycgeugwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 00:58:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1c7f135bso41378981cf.0
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 17:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786409910; x=1787014710; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pkBx6g0ZwIllK7kPvgkzwBWWDwY+Y8f971ch+fkJ02g=;
        b=Jp4PjF4dPaL39MdU+R6rfFKkRdoiYGnr1M90Kk9RGWHWd/IcBWiN2+iaaag9+2wKZR
         8IBHxUttz5GbMWzjtrmhLkwF9Um2HSz1PSBQEa+ox6CUuJyOhOnJRnpvBeaaT1DmmAtp
         DlBLkxSiPkV1CRI7sQtYX+EsIuiAf2e8aqaAhCbshR2bqCNF/p8vfDtwBmYIetcXMCu0
         ckpn5XB0VGWG80hyGt2RCvKWSgVmnOec4uvnVnK+z8agd3bQl7h9VZlS9JnJyVqkVmJx
         KL3J0dUyzsw/2FT10XG+H/XR5ov0bz10XDT65G3wwGmkzWCbdaL+WyKcM1R0GTkMH7P5
         lmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786409910; x=1787014710;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pkBx6g0ZwIllK7kPvgkzwBWWDwY+Y8f971ch+fkJ02g=;
        b=pC8NU78+r4ydxz74Tzprg9clhgWysQz1rrkJW9f01/XCXINDoq0m06USOicX2dUaYs
         wcR/YjotG6Y9EuJRwZ7hNBMXkz/MeSciegxw74yYZXdaq6eiR6OPk/6U1hAuqN0M3QoY
         jrfIp0vjf171Rg7q9fCIFLR7blBtn1mlmk2Dm1025HBsWVHL2ssCxS0cX45if4sF9JQg
         7lm94L049M5aqxMylk8DMsK9SzV7XBMVTM/zwRZoZ0mZfv2GLyr6oD373N2n5eAof+x+
         IP6AgYlLGptqW0yxcOFnXxO4TE+UeiB/32l4WHjHESCFmrS3PmsvV8sIvuJsx3t99MPQ
         VWkw==
X-Forwarded-Encrypted: i=1; AHgh+RrC6226QCLeZ7cTTjS+p5JfM3+8XXpdjsJm4ADZSq71QltUXOTO3g7/2T454kSE0adwEULqj1HHxEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJm+kydTyOKjB5Z+HTZLJjhwm/lKm1P2X6bSPAkMxjtchR9X3M
	46laPMua4wD38a6OkrToRQbAROrpiaTfIf7c15loKGLryjl0fTKCuIzI+GUbdA4PMh+EUM9uN0j
	Q/w9oHVywN4cHYxj/rW1XZCrPolCIjGHBfY2oZ40L2fzNNQOH9iEoJSIcaTZRaK4=
X-Gm-Gg: AR+sD11ugrRgZyMrpM7saXpUKyOwrMKXxURNllLInMpiwCE7aBiWflBUteenijwfO6f
	vMbg+2rkcGkWKaYcc7bAye5bowgtfC/N7zNTDYuHv+GprB9T+LO3u0D7nCBLwJrPJ7csBoJeXU/
	+W7kwxVhlU5Ret0VaRItIrUw7IYy/HEyhwMIpzAPGMRaCucM4Gr5b4VEEX4/PBz9Miey6MXsCz1
	3XbcBklUCvxWt23u9E13p7SEjNIverkS2KPxfMYJgeq2fnX08nkAlL0/oI/pHjrsMHBqHLw7AOs
	HgnBhae5jhHELoUd4FoIiYWGMoJ2GjEpOa2O0DckfpRdkF2vs3FLGIhu6aegURBUMj7O667s+Mj
	47uZVZm8V7ULXnelVkKE/UoF4cyAUtynXEOGPaFjQ1M2nztCqYq5W/CohfAys0lnZfX8qpeX6mo
	64wXQI9UHt0GKfvw==
X-Received: by 2002:a05:622a:2595:b0:51c:2068:a9f8 with SMTP id d75a77b69052e-52d0b00401emr409830841cf.5.1786409910280;
        Mon, 10 Aug 2026 17:58:30 -0700 (PDT)
X-Received: by 2002:a05:622a:2595:b0:51c:2068:a9f8 with SMTP id d75a77b69052e-52d0b00401emr409830621cf.5.1786409909933;
        Mon, 10 Aug 2026 17:58:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055e9752sm2279876e87.59.2026.08.10.17.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 17:58:28 -0700 (PDT)
Date: Tue, 11 Aug 2026 03:58:26 +0300
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
Subject: Re: [PATCH 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
Message-ID: <4ovnsghrryj5gxvggztpw5qst3t2qwrxu4p54iyhm5tf2twcd6@stuooi7j4jo3>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-5-5e0ede4a0c72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809-kuno-soc-support-v1-5-5e0ede4a0c72@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: pwfJeuYNOVhfoLDoWxI-TJVUGgnuDUDb
X-Authority-Analysis: v=2.4 cv=R4cz39RX c=1 sm=1 tr=0 ts=6a7a73b9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=-YGGs88sVoTMC7_f4VAA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: pwfJeuYNOVhfoLDoWxI-TJVUGgnuDUDb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDAwNSBTYWx0ZWRfX9/667+uSxSGy
 e4oZvUT9f8/xB4RML2UAMHnMrxBtnl24i+l0LScwDIKG+G13VpPRs8YkEDsyWcTxokv+93QTzVZ
 4ErdC2xzDxnS9b1DsD+czB33uFuN0Is=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDAwNSBTYWx0ZWRfX2x52KcoPm0ci
 pU4jfo4KQ+bhoeEsDbhLgbu1ZH7qFPESTS+agVXWlz2kyPzGuSWV/OvOVyfgOytX24c5PgbHD34
 vQ1+xiNXvnf9YxIc4gKIww7j6lLNErxM+NdD3jxX+3jY5Ch5oiF2dOUBl2szJoO/7sW90dY8UY8
 dD6hL6vqDKjB9BXtVg8tfB35cleYTh5V+v/JCh0MhRBzxS9na1SlufoMCHnpla5exhK/poI6dyr
 iHoN6MecZcViCAxDQt3XNKlWtzt/qmR0Xrmpm90LrpwbNeCqFop1Xb61mD0rtxaxORtvzEKAHff
 nDJmP2NhBZuz4vCtqOGwhNxtyzFvphWC+2oStSw+dP50vEtheLH1f5UEUEmwFGmgK83ePWCyURR
 HlOVSPScYw7RCctiuNb+mFO+0KG8EXpSvSy8zBStT73ar3eG/BH8U0nlGClrEwGGf8K6vILS7yA
 VKpsTLo8wbDSQmZomMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110005

On Sun, Aug 09, 2026 at 12:57:04PM +0530, Hardeep Sharma wrote:
> Add the RPMh clock description for the Qualcomm Kuno SoC so the
> qcom,kuno-rpmh-clk compatible can provide the RPMh-managed clocks to
> consumers: the CXO div-2 (and always-on variant), RF clock 1 (and
> always-on variant), the QPIC BCM clock and the IPA clock.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
