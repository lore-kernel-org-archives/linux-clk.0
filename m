Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93D34968E2
	for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 17:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786640773; cv=none; b=CMNqd3zRmei0lWzvBrn2cAn/FJSufr26Ivn80h4bXpTaXnHttiQkROazCL2Bs/M7vmQB39chtIq1AvCj8cuTYWyqxfmoO8bslk9frHWkYZVBdsYUy/i+zMgviQfKoZq7y0+1onDk72AyVhj8yW3B0YJJNjq4DnVzkwJEDCdezEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786640773; c=relaxed/simple;
	bh=B36AwCUnWoIPs+VzBRY/WKH+1J5rKdSdeYvYsq0n9r0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HN6Ecjrt7jygMjca2PU01W64zTKWF0L6dhzW7LFhEEoLrGSg9BdcMTfqNwsPW8kv56JU1/2e/XBbmbwqfDMOVwOE8KY7S6uIZatWIDUOJzPF2XUBzZ/ziI8zYL+rqXtZGoQQgryKlDasHHs4caxfBZZIYmDFmEFMek08N3thMT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X3uV44kY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XoApxam0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X3uV44kY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XoApxam0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFTkG43707340
	for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 17:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cddrscBfzbjs0vy6WWXuqpnU
	tgMOMnWbwDcitMMOPPE=; b=X3uV44kY2i7QamZLhCDB4LKDftGTTFVNk2Zdb2dq
	qFC3OjKKltqMMpnF13ZIERSeEvwBJm65jqAS/KJZE5C3UqAQt1WWiCAKf+RWY19h
	onxZzvj/pQfLpVmhHyHcxbw4V+F4+IYolURjP2xhNswseOCwx2tjim544b3EFkKT
	gE1jeWJbrz9IR72nycjsaqobWZ8PZp4e2T6sX4KdrveK85cWq4FTDX7wLHMk8KWn
	sz82GHbbndhoBAKi2NICI4i8mZ1J+5V+HKFSTZt3L+W1/F5MmjDz7UriR7uYltrB
	Ci//flbJLfbI6Tn34E6B+S1MshRiEXRKP6t8wPXg2vmtMQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g18c5jvdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 17:06:10 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73858d44c8aso29601137.0
        for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 10:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786640769; x=1787245569; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cddrscBfzbjs0vy6WWXuqpnUtgMOMnWbwDcitMMOPPE=;
        b=XoApxam0e0Xd+BWw1vmlbJAb5DYOhv+bsCf6NKW9HmhIDyPV+Pal5vJb5Tob9u3K77
         u7ohqtilvCPX8gzPVAOWl+YvRfmC8z8o7GIPTKtn8NcyQN1MHF5APKBFpm/JNHWMhYio
         nbs9/cRRTiag4BWzBTuhx+iqDFe411FB0cKyqNkc2hURBWQ4WTtEr9/W+P+1f1lLFMWs
         2LD9DNaF5jGvVedkhs5rww3MTlgijzxEl0mRS181C/HgeAuxbf71iuaQHJDxSe234WsN
         g6wZS9nlszUpgNhX0KGBbKT91W0Z4Kh7o/PriH24vSxU15IGT/D2IiPKdHQpyuq7HP5k
         vvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786640769; x=1787245569;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cddrscBfzbjs0vy6WWXuqpnUtgMOMnWbwDcitMMOPPE=;
        b=jeKkkMVGB1rkq14SLrjjwB01MhvhnEagy5C5vPbtlkJL0iRmFEq8ut3CnMbi81Y4kc
         X0hfJPlsZpFWT5nd9tH6N0fHn8deqCN5vw7MLsacoYMqQkI5UNksvmeRwFZzxM3yCL95
         cX7VoG6nzq8+ctZHqen7BNQUOiM025PkKY7cfV/J2W5jaY/F0WrEuI+GXnZ64vT9A54V
         wHTaEH127rQ3+bZSmD8drSz9u6aABaLm/U3l5PXi6GCclQCx/j0nh2PS2VUY1YQv5mDe
         DcZS1acs+/NzkcRh9UZHZG0W5V9+yUUcwqpJbB4mlPlObZdn9c6U9dLmXn0F3sjVepEr
         ji7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq7z3lRI69lTtOx000caaEmHu8APJs0DcYZZlQAdgAx/JMIZssFmz7CI1+9rQTADdC6f4EXuUCv+hA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRUM4NWzAgJzw+K8Fx/OAwfAhK257+vLNIWtDVsY4wO9j3oRN6
	f5f2flH5ys0b3w9ADXnx1xO3JOY5PTnQNaTjX5GwImaDZSzfgoOqRlMlg78DkotDf0Q+5XwK7QG
	0VjDxX9OWWEdCkBtYo/Un8RisdRn46LkKIrmADqHV/2I/ZeX+J8wATZX0YMPVJGg=
X-Gm-Gg: AR+sD13THivLlu1Jv0+ciPRCPlnT2r5rm8Xalf8MpVxZj0UGjXNiVA5LOsWjVLoG/pP
	hJPXX1tuTzH0I+Do72c9jE6OPXY4mCm21qMTeiSPMx4CA3Pu+jdohY+1ksHknyzbRn3aipLcgQJ
	aqdnKl/frPr4vFgQ70GcBI4+Ey8KGiYznnzMYMgwy/Nxk3DZGhP+XZtmtA9dBSXuEc5DXqr3FMj
	GZLWVlUtBwMoxRF9hg0JfnD6arLaO60FkCjNFKN2wxjDgM3PaqD9Zow5zIXkRVOxZbJNQ0lbpWU
	/9vaqwPfGX2cGKw/CxQjnxUiT+oaKTQ5Tgj1LZdBSva64C53+k+GW20TXXFyikGVfmHvA4hLl15
	HF+X0BTy5I+rRUvyI9ol/aPC6vsKpRcu40MpvlZmlVVMskAOMI3fNXiF8pLSc1LDHsgDoK5Ofxu
	J3nZumGPxlUJm2
X-Received: by 2002:a05:6102:5797:b0:739:d787:be8 with SMTP id ada2fe7eead31-76db748fd89mr1667703137.9.1786640769368;
        Thu, 13 Aug 2026 10:06:09 -0700 (PDT)
X-Received: by 2002:a05:6102:5797:b0:739:d787:be8 with SMTP id ada2fe7eead31-76db748fd89mr1667673137.9.1786640768831;
        Thu, 13 Aug 2026 10:06:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458b9a8d4sm13061e87.15.2026.08.13.10.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 10:06:07 -0700 (PDT)
Date: Thu, 13 Aug 2026 20:06:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
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
Message-ID: <kbft23c77y4ebuivd4yo6wspoyojcv4twhazaltjws4a2st4m3@ene2fdawtw5s>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-15-5e0ede4a0c72@oss.qualcomm.com>
 <wjzyvt7q4vpirxclbwexrhsmcoi23hmsqbjjpfto26ofci23t7@uufz7ilar4qk>
 <20260813-generous-romantic-asp-be92e8@quoll>
 <3zqx6nxp4wmzej3nokfggoji7nihosru6yyaquvwjfvtylf2fq@ucr235faztbl>
 <7e42defa-f712-4d90-a328-344d9cee66fa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e42defa-f712-4d90-a328-344d9cee66fa@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEyMyBTYWx0ZWRfX/KXHx+CylVQb
 FxPxGFMDcAQ+GUbHQK7ovo4rX8lehyw3IlDCa5crZPle+2oILUbN+kHWG2aBl9Wh4V9ZcUlFo4X
 42iyxwr4AxxG4W8bgpPcgNhdV7zWM2w=
X-Proofpoint-GUID: 0ZBGnjAM0NEF7vn6JDKGK5vst5jkPRJJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEyMyBTYWx0ZWRfX9k2GIkjf/946
 HxKWOa+0kaqy2rIsqQm4RydFCpOjf0bZrokhvXAQ50nDbWBD6sQsLjv0wEX4jWTkAnnO2xXgH4o
 jQHtA6RosR2YjpmogD/VNXC+SXbyNZ3hP9pELipo3Pve7SnkwfO82cjyFQapXqDjfWCZBeFUtT4
 RM00D046RNTpFkcFMqv+9yGDSynVAUp7909ao5C1eAKfFqcWP5bvfIUyG+vjeReqLfjdB5nCb/v
 KnGXGPXXq8CSyACy6KPXgVLjQii3do3Irk2c7ls4AJbK0ydIp6Ojedh9W2y6YvoOOkOh8ES8yK6
 qyBrZUIN73EcNReYE8VgfCtKcBQGqXBbfE72N3i8a7knPtxuQwdLsYDddVVlRZQGt2GxG/HY/Lv
 nhNSyux9uacUA3QfiVfHivcocaHSG/phlJFInKWDMrzvnLvgP3gqD7Hgm+XPgelyKSbplFDhltp
 O/7MJvCIsfbkNryvnHQ==
X-Proofpoint-ORIG-GUID: 0ZBGnjAM0NEF7vn6JDKGK5vst5jkPRJJ
X-Authority-Analysis: v=2.4 cv=VebH+lp9 c=1 sm=1 tr=0 ts=6a7df982 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=yeIXzWwml7xpAbmzry4A:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130123

On Thu, Aug 13, 2026 at 10:27:18PM +0530, Hardeep Sharma wrote:
> 
> On 8/13/2026 9:31 PM, Dmitry Baryshkov wrote:
> > On Thu, Aug 13, 2026 at 11:44:28AM +0200, Krzysztof Kozlowski wrote:
> > > On Tue, Aug 11, 2026 at 04:13:40AM +0300, Dmitry Baryshkov wrote:
> > > > On Sun, Aug 09, 2026 at 12:57:14PM +0530, Hardeep Sharma wrote:
> > > > > Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> > > > > (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> > > > > 
> > > > > Peripherals included in this initial set:
> > > > >    - Single Cortex-A7 CPU with PSCI idle states
> > > > >    - RPMh RSC with clock controller, power domains, and BCM voter
> > > > >    - GCC (Global Clock Controller)
> > > > >    - TLMM pin controller (110 GPIOs)
> > > > >    - Interconnect (aggre-noc, cnoc-main)
> > > > >    - GENI UART console (QUP SE3)
> > > > >    - SMEM, hardware spinlocks (TCSR mutex)
> > > > This is pretty limited without any storage. Does it NAND?
> > > It has serial connection. this is enough for a start. At least one
> > > communication interface is needed for early upstreaming.
> > Yes, but then, as I wrote, it is pretty useless without the backing
> > storage. Also, it would be nice if we new the future plan. Is it going
> > to stop at this point? Is it going to be expanded in the next few weeks?
> > Will we see a spread of conflicting patches 'arm64: qcom: kuno: add
> > support for foo' with foo in 'USB, PCI, remoteproc, NAND, etc.'.
> 
> Hi Dmitry
> 
> Thanks for review.
> 
> Kuno is 32-bit ARM (Cortex-A7), so follow-ups will be `ARM: qcom:
> kuno:`, not `arm64:`.
> 
> This series is the minimum-viable base (console + core infra),
> following the sdx55/sdx75 pattern. Storage and the other drivers will
> follow in coordinated series on top of this base.

Ok, thanks for the confirmation.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
