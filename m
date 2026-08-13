Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71BE380FEE
	for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 16:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786636897; cv=none; b=srzO6sxrWdT/80X/t1L/4s05bN6bxjLwt2EC/rb84EwuihDDZ0oiyl5oXL74WwK2CGChR4TbaeFyk0v1Af4K4edqcKqDUL/p5JY5hzF6DthYfKq8s5BnjmURe3c7voaHxSl5CCMa1ROkmHfGgAWNfCa+lq5vT12S26XpDZ8PsT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786636897; c=relaxed/simple;
	bh=RusOvcBFXx6SE72ZSRuUQFYQliPeDRYlYBCL3AZMShM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnlUkNLNkcxWsWs9h0S+NDkG+vhqKx9fK4Y4f2PBEEkmo/NJHQD1Ry2BwB2pFjFWH/yYLlIxsnA73/1dn9MbJWKMb4fKfbGWJYpQ7Bsgj3CrXGnt91Iokx34B2HZ7Sbg5HkVYqpTjh/hrPS+FIzQ85ZGKAdiloK7EypiqeuIKfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQ396+7O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YhP3l2wS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UQ396+7O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YhP3l2wS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFTNRN084347
	for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 16:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vrxU2QePt16cQDKb0SuC0GCw
	XAGtbpNoeaisWIEP/BY=; b=UQ396+7OVjyRMuYv5P6MZRCkabHXplnPXppfYvpu
	6PhVqvk0+5llxA5F9ONsu8oxyyaeKZM2DIiaI0WXcBuAayj9OMDET9B/k2TIYEvS
	+nN9yGMgvqFg+yhhAd6R/49BQ5cmcGHo7KOwsWskd/yv5VceoOg1Q/8x7lR4OUs6
	fCNCJsutXVITKPXmiYJZcvc1+Tp0gZeF53gq/9wcfQhRF0xTiChLpYQlXiZgtm+C
	1nmEKjZDnxvdnbXC3bImLvUE1naiMxKD3ABYCfhiw/p3dUYJLewnO1GEOv7htVH7
	mrkOlSReZvpavHbpsd1wzFqRcH+wjdnBUdzp6ecwgKz0Zw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g152mb9ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 16:01:34 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-737f1f1e1bbso14219137.0
        for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 09:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786636894; x=1787241694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vrxU2QePt16cQDKb0SuC0GCwXAGtbpNoeaisWIEP/BY=;
        b=YhP3l2wSdRqqt6XsG7pqyhcbJWBjzqwukfMKpylHN5gTL0qRnoToMJKStMKEJSE+DK
         6mQApJlllijAkRibz0f8WztTmTuyq2Vrn+0Ti2zPvtBQz8dbMYb0xhmvxgKN/cHoYXyv
         jD8KDeupPwlJKtCGU+E9+/yLxzNvztwHF01o/gyKSF+eEdmoq3fqYszmF6SaSz426kXo
         QIPP4TUJuQTpFxksZKSH/2NXly2ruZkGuVeeVULM/iDP+4dzQHnNYyvUF45Xi7+wi1s7
         eEU0gS/z9bUFwkfHsi5SlgYevzih98n0lAlRICeYQ3FsbwnZpdNU+vKWNOLgns9H3Cvy
         X5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786636894; x=1787241694;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vrxU2QePt16cQDKb0SuC0GCwXAGtbpNoeaisWIEP/BY=;
        b=stU7hsxANxfyC/G0upDzHqnxQ+wzz1cCyPaQGT7xR5mICTt9ltKv3jwDvDFSFo6XGQ
         cH23lQrLplKe3Mi1uuhOf9twtrHTC+vrmpfIL4ackIV42+ZiL2jho59JCeb3XerKfHqD
         C9fz02HBmRxYC9Mt/ZMxbTQ6vj0TgCslYgstdW3YVrepi8Vjc3D+CBahn1l/ZSiBYKGT
         dniYoek9b+UO5sT4NMbmQQrgqhOZeRA7p0kSzunEuOOvtn0o6qlr/LRppfzSHHaNCDWy
         K070Er1MVPSPkZZE+Hnhl4ZMaLVtAHMEKvrr2uDyWeufAdr0N39a8gXv7+m28GTzHJ6L
         ms4g==
X-Forwarded-Encrypted: i=1; AHgh+RrhOCJpXsTzyVW7w82x6kggGXQyMD8t3nnPPYFobIiwb91epuTuY+y82HDFu6xQ+heHsKyfslZCsCA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2B37S6vYm8Q4nK2EWXPltdwl6uiMVHZyDCmUkHoKhHQ6CjH/7
	Y4/Q+JVErWplFXE1CzObC0zQF6w/DcNhbHvknGbmbrbzy4LV2kWOaCsYIrqVDdR+fTN4Qgwitts
	jjJZF2+E17hFWCyucwtuBtUA1dZIJ1ILkl1Y3HK55xN06RzZxVNo0Y/pH/Q72iFI=
X-Gm-Gg: AR+sD10R/IYUkktImY89SJx1VcpJeYte2RE17j7jy+p8drWKtnfiuC4ZW9MSIP09MdR
	LneqrtmwzTslkTILPlyIy1gqYHIJqUf338dgpbjEzp3E0/i90bjZ+YoRMYDx7y2pLDw9i0/viF9
	yb0Ox6daUAimRvEgcxniBtqrskO4XEkvBE1w/OeOGdfmtP6YUCy/E9W+HST5dVQcajB14aAQ8pP
	lqtz//r2Kop1CCPTAHLwdMDV3uIcFPctSJSccRwYcAdCHCBqu9lLf6py9dMmkdB+eeJSK/iHmzD
	XYBc10KlbrobJYrkKEd30DMMmyiZ/QUkKzQVXGrjj+Pb1+wWuwWktwP35x/i4CZB7ItngaJzfTH
	Qodim/AwDe0gHI00NTWfpCE9uA49PTm9BH5z/wbrSJHLdUC5vr4JdsMn4yj1M6QpzJ51utgoFw7
	z170Xze9KNrtx8
X-Received: by 2002:a05:6102:5547:b0:6f0:3ba3:7d84 with SMTP id ada2fe7eead31-76db5c7523emr1514583137.5.1786636893621;
        Thu, 13 Aug 2026 09:01:33 -0700 (PDT)
X-Received: by 2002:a05:6102:5547:b0:6f0:3ba3:7d84 with SMTP id ada2fe7eead31-76db5c7523emr1514553137.5.1786636893152;
        Thu, 13 Aug 2026 09:01:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b453a54944sm578211e87.46.2026.08.13.09.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:01:31 -0700 (PDT)
Date: Thu, 13 Aug 2026 19:01:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
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
Subject: Re: [PATCH 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
Message-ID: <3zqx6nxp4wmzej3nokfggoji7nihosru6yyaquvwjfvtylf2fq@ucr235faztbl>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-15-5e0ede4a0c72@oss.qualcomm.com>
 <wjzyvt7q4vpirxclbwexrhsmcoi23hmsqbjjpfto26ofci23t7@uufz7ilar4qk>
 <20260813-generous-romantic-asp-be92e8@quoll>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813-generous-romantic-asp-be92e8@quoll>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExNSBTYWx0ZWRfXzR+JqdwaaYhf
 IGcfCKkYcE9CrUAb/Mmnv2jZtvty+0GVjDe2LidDVJef0MCjS882TucTkNvjKsK0mzWtDtybd7x
 k3U3Q/6PeuxuEeGn3vrVb0dL4HsQ8B0=
X-Proofpoint-GUID: V204YcgUjxasagsvgT3GWWw_CYyIAPu-
X-Authority-Analysis: v=2.4 cv=D8R37PRj c=1 sm=1 tr=0 ts=6a7dea5e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=foydBGwHzjCcBrRpJO0A:9
 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExNSBTYWx0ZWRfX1Pd5PY1zWZW8
 fr9TmyfGQMpKkYbFR2GDnXALgDRVn+257TOwRhgyf8h1MCahvEx0VFYsMJFeBTuOTIlXs4S91Dq
 Teizpam7hbKFi/ENBVBl6ck+zeaF0jb73EEHaU5FT+GWvWXxpB52/5TeljDW21kxmpGNmjZB2h7
 Qgcrk0bidmu9ldXHZ03HoJpuHBYM7vy2Ih71ozTny8MAjcMa1N3gERj10wwNVX7tojxtL6F7RWE
 qQoG8/zHcn71cxXndjNKEuOJlp8uzcZwhdWnmsbREhvEzKMYrQLhREm7bo4zvishZDDgCz1Nnab
 RZtQ2ME1eDBNx54U2K6yfozCLPygixzof9iFG9yIgeGRa9esfMzEF5Ifn5CvzkR2AM0PPtYaph2
 OS4XahWl7oohahGDEq/fSrIyKENFDrUtLjyylxFulMURW5qHXaiJ4HDL3ianivYtupgwqlPZEmc
 lT+sboy4FtKq23I6MRg==
X-Proofpoint-ORIG-GUID: V204YcgUjxasagsvgT3GWWw_CYyIAPu-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130115

On Thu, Aug 13, 2026 at 11:44:28AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Aug 11, 2026 at 04:13:40AM +0300, Dmitry Baryshkov wrote:
> > On Sun, Aug 09, 2026 at 12:57:14PM +0530, Hardeep Sharma wrote:
> > > Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> > > (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> > > 
> > > Peripherals included in this initial set:
> > >   - Single Cortex-A7 CPU with PSCI idle states
> > >   - RPMh RSC with clock controller, power domains, and BCM voter
> > >   - GCC (Global Clock Controller)
> > >   - TLMM pin controller (110 GPIOs)
> > >   - Interconnect (aggre-noc, cnoc-main)
> > >   - GENI UART console (QUP SE3)
> > >   - SMEM, hardware spinlocks (TCSR mutex)
> > 
> > This is pretty limited without any storage. Does it NAND?
> 
> It has serial connection. this is enough for a start. At least one
> communication interface is needed for early upstreaming.

Yes, but then, as I wrote, it is pretty useless without the backing
storage. Also, it would be nice if we new the future plan. Is it going
to stop at this point? Is it going to be expanded in the next few weeks?
Will we see a spread of conflicting patches 'arm64: qcom: kuno: add
support for foo' with foo in 'USB, PCI, remoteproc, NAND, etc.'.

-- 
With best wishes
Dmitry
