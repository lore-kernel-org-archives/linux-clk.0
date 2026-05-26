Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB1D38E5C5
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 05:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779774415; cv=none; b=ggE+lxzyjnLvZ85WrSf8CwwlTRTPu95FvgvTGWhu5Ptb31x0L2vmSFEZp2w6XPVoyJG7MuPH2L6kL5bMHl48nhPCjgLaz3P2aWT8xuY4HIfn+DRA6UGmvfLW2NTJjRekV0QTG81nLdJSAPAMhU+ZG2FdzS5Q0Dmhub+9lxl1IRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779774415; c=relaxed/simple;
	bh=ps86Ba0cCUSFCCDq+mkUy9q3KNNVmGXrUPfYnf/43e0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZ6IG89nhQVLx+vst8o03YuXdyLP0Er6vnmLPpp3rGkBFbBVfWdHINiCQ+FkWdCoWCcI2bSRPIlRJwAPOCI2g9Jul0rYsjcGQ2f3xbMCwIlJ/IQben0dGh2bz63WQO4PT6IKXECFAu2M8HpDyRFt310mZy1TMci7C0/0DefGuZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oxat4nuD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hFMYY/h8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oxat4nuD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hFMYY/h8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q1sUX23603922
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 05:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2iFik4hUuN6UNkV/R8eN+n1d
	H5ylNRH3jiARbcS/5Cc=; b=oxat4nuDfKuQv/hYmzQCgEx8keRSfS4jWR3VeffE
	5tsCSCUxEOzhfBZ8nWPNnSyZJ6RvhBfEbZVrQTBxA3qi8IZC2ldtg3QffX1/6uVU
	Ru1OmMk/v6+4FIHFWkdXqSyCYZxXtUprpxBpkcPcZLOJOFlntNmxz+7J+N6xN/Ig
	CujLMJ4mLljpnNERKp+/iDcOkifgFJIZZYBBtpt7p2HGo2S9Ppl7hVwKxWmQsB0Q
	TI8pmc0JavRl3B+IAWwnud/twEJoOEVLLsZsJQXJJvO9kWgWKZhrOk/1fxHuWdRi
	qEkPxcn+4khWSMeEEe7DQeExVYk2q1fJmbW+fgb0Ad8mqA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqjf0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 05:46:52 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6322654bb6eso14646523137.3
        for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 22:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779774411; x=1780379211; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2iFik4hUuN6UNkV/R8eN+n1dH5ylNRH3jiARbcS/5Cc=;
        b=hFMYY/h8qa3eEtDG9IySoJHy9W5C7/7Aj9Gi9sPbNLvdHhrzlSuXoYe1Lh/bf3uvww
         URgygwxV+sCOpMNaG3EJaNzy9BJBj5VPp4LouiOrfkzu7757p3JGZBOXXXI2oNi+XCbj
         0nHLYhm7evGF31oHOoF0ncgQWX51EPuVZ2Vpx6l5j13RouBERap7IQuxP28OFFim/dy1
         K2GfaR5nT6dEhXbJo/TkNJXp/xybol2KxpkRU4rHhf9p1J7Pjl3z8YITlYE5/Fte2E3K
         hhHpDya8LqCm0tkJL3SF90urrA20ctRptcl7ME8N57VyJFyoX31qzEotZ1kFYXJFBkJu
         ibJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779774411; x=1780379211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2iFik4hUuN6UNkV/R8eN+n1dH5ylNRH3jiARbcS/5Cc=;
        b=k0NHbYRJGFYqrHlOAqG26ES3B9qMt4rl988CY5R1ByPySwkQtlR52q6Db5bH2EsQg7
         JyEnRCHXNKL2bfmZ3DCu8p0Z8EfxYBpkBEw0TxDf82ih5b9QFF/TE7HgDHgIcK9kGlT1
         Z/mTfb6CFUI6KoNEfeBoAhRF4+e4NMmNmSD3nSUvN01sQBA3ple7EQ9+xlaCT4Ac8cvY
         DwC3DUGa9iGUHkmUVJ0bsIylxq+VcSddaOM3R+T8ze4v7Lqk4pRVTL0PNZFpWXLQfJnW
         UDGzRvO9CJemK+wwahWMgZeIPg59jdK7/gH1F6Vg2LFaDQRITRmY+RJhfETCAP41W1We
         uFQA==
X-Forwarded-Encrypted: i=1; AFNElJ917+dYVqZza6l57MAFejqYduDmaYalEj201m7hkGPbIq1UihMWex3GkjNuc39nK72C0vV/WwY+dx0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoTXVWJLFp2Fc1Hkq6FC8Ma6bnnYtFVxU4w6cH3e4KCfdkKsiP
	JIkjeK1yCUk0OttrUDkw/QIl4zT3UhDQ4Q0B43rhiA9qaxa3B+FFan+XG6o6fI5v/C/Kw2JRiBQ
	qPDNpN4XcRYcWVBn4gJ7MXXb4QmPrTSXrZGSyPg8l7xXGGf38CwyOJs/0PECuLTo=
X-Gm-Gg: Acq92OFH+u/pKbCWHHigx6s+puJJbR6BViw94gkeRSceIwfp92GmU3vwuigZ9tBfb5G
	Vg0iQFdHABnhZn82sznRGFeAb/JTpvHH3BDBW095z0M+Q61j2cq7KsZj5HhCkobhN2QRB2c4RzN
	IvQeElntVzLrSTDVrUDPIWP/AEKTRNV9sEvnPXlyVkrH+DNptaBuEtuOC5WBAOKNLjaMYaP3taS
	C26OJFPBWcYLEupWCuE0nny/cJzgax9xrqaffmj36v+LWvC2Zr9mo0YSIq/2oqj5Wi9vVhNH8yx
	KhFHb5Iq4B/eUcKtBEUZT2RbzFfxWNQ5WIpTnlw0OhjKHDeALR+BSiB7UycvApQsY9YNEaAkzSM
	gESMpnHdg//E98RzRDSsr9vwWZSnKTAEDZc7Dr3qodkH0YeHzELCEROJnfUJoVruAg02j8XFohz
	ObScvgFkgNrFAryzmz1ChYgRzuv2Fvn2jju7E=
X-Received: by 2002:a67:f0d2:0:b0:6a2:b2a1:f170 with SMTP id ada2fe7eead31-6a2b2ef1eecmr434395137.19.1779774411569;
        Mon, 25 May 2026 22:46:51 -0700 (PDT)
X-Received: by 2002:a67:f0d2:0:b0:6a2:b2a1:f170 with SMTP id ada2fe7eead31-6a2b2ef1eecmr434394137.19.1779774411177;
        Mon, 25 May 2026 22:46:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa462e1d86sm197558e87.32.2026.05.25.22.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 22:46:49 -0700 (PDT)
Date: Tue, 26 May 2026 08:46:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: qcom: gcc-glymur: Move EVA clocks to critical
 clock list
Message-ID: <dyukhyihftgrm53tdiugcfx36tfngelm3hi2otpxy4pzdiwlsm@ixh6amjmeglm>
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-1-b61c7755c403@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-evacc_glymur-v1-1-b61c7755c403@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a1533cc cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=52tii9ovPz_KmwLdHQYA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: HUCXMNmNwvCvabE_xzCCF1UpiiMgXqeb
X-Proofpoint-ORIG-GUID: HUCXMNmNwvCvabE_xzCCF1UpiiMgXqeb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0OCBTYWx0ZWRfX4bpwgJYcuNyz
 pgcDEjjbNOBs4eiccHSTt5M5auG4TAnMs07IKqIu/Ph88Cjev22TVRkwKE01cYzcTWvSpKnRlTy
 jRAs7St5Zp8TsJq2Rk1WuLt90CM7R4EPgd/cZEZbC1vdmQs07DDH8iZXPFfC3R58Glk7BldNv3D
 cEzmFVOw1ucJporXhplQlHukLvLeIb1Fm2V6JbyDd19VPmjt9b/PFQOzUkxVcAr0xaqi35c9YTl
 eYvHcS53FVArVsZDOnBihdj2aIGemfhcT+lqgVXvNVOtCheYoTO9BNfyyUQwd5InGROHgT4z1KR
 yi3GiHJ+9drx5pdM9IxK8e5RGHM5H6xkDUW6uXj4wJrWceVHEs7hCv9SarqLWYnlx7385xiLxqj
 gV75IPYZEHykCavbtftnF5DhSDe8TFkALmR0sYc+YDaZyLRCYs49IWwm1bZiu6d0L6jBCt7k/iP
 YqN2cxe/55O9J/Ce8TA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260048

On Tue, May 26, 2026 at 10:59:44AM +0530, Taniya Das wrote:
> The gcc_eva_ahb_clk and gcc_eva_xo_clk branch clocks should not be
> registered as standalone GCC branch clocks.

, otherwise .... what?

> Drop these clocks from
> the GCC clock list and instead add their CBCR registers to the GCC
> critical clocks list to ensure they remain enabled during early boot.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-glymur.c | 32 ++------------------------------
>  1 file changed, 2 insertions(+), 30 deletions(-)
> 

-- 
With best wishes
Dmitry
