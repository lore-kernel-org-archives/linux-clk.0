Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0AF1553A3
	for <linux-clk@vger.kernel.org>; Tue, 30 Sep 2025 19:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759259674; cv=none; b=IZDRUcpDw5bTY2Xh/Uxxyvsex4GuniKMmqkeraVMtDIQ3utyRE+TzcHGd79eR2I7Kfnpxug9BRoQNw35lQHModk89KXnrEkEXB8vzFhNsrFTWzE7zmS786nBKAh4jldqmctDRgILciUEyqUkl6rRMsSSUCnRHxl18z6Iw5l6p8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759259674; c=relaxed/simple;
	bh=RFw7rgPy/P4Y4yF7T5QMyWKKqbgPJOvm9kCEWIoxQTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlwRLdmyA8iSedqRMIjZBn2Iitwiw1TONMoD0iE65sWRYYboYxfxilWTSnCfbSZc/Tty7Oc3MqM9vt3rQ/OyeNUWGJirqmahHJOeRKjZDLNgdZR10bQkcT64dU487wGgWfOhPGdeoTsP7JSvnVaWt5qp1dRsqZtV3VdkLVfz2rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hkBZ3nWj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hkBZ3nWj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBdcTS010699
	for <linux-clk@vger.kernel.org>; Tue, 30 Sep 2025 19:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aPq1GrPwVVO+Dr1J6r/OVSsY
	OTBdmX3Nsu5MO3vxHZw=; b=hkBZ3nWjZL29Rv1MU2IlMtR/QQYsKIBbq57Wyz3T
	p12csA79Qt8gY0YpzfXNb1YIDzJs/0C6U7KtPxgXTUumhXkkmJHb0+DY1VjLIjdQ
	QyCVr7D1Cv/EYSZVTGvlZP0ch+TzYCODstwQCBdUj2i7nOL8GOmiBkqcVBtSqwTt
	dG89zeFJzxOMxCe7DMUlriVwnWdxdcL6IUW8jwbJn4IIfcKX2ntIIgr599ew+X/z
	6k9LqXcpSAz57WOgJZeuLCOnh9Ktm+nTs1BkbNgdEUu3HTpIH26reOq7/3N7Mf1c
	n/NniQ34Zti9YCLkE35/kGjj6tfJJBRjUqmwCM68YkLUtQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e5mctj37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 30 Sep 2025 19:14:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e1f265b8b5so46288331cf.0
        for <linux-clk@vger.kernel.org>; Tue, 30 Sep 2025 12:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759259671; x=1759864471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPq1GrPwVVO+Dr1J6r/OVSsYOTBdmX3Nsu5MO3vxHZw=;
        b=Z0Ua3SekaGKCb6aMZacaTnCvpkz4o8Ir+kam+IfiB9hKpMRIsvx9l/6IyrrDbzZVob
         Dc5TotRRN5t38zV/Hh04t88SD03gqhiliVGq77XQsA2dWL9LdmHu5tjl2JXnkb3g2dxA
         A8S8dBR9u0dER0jv5qeanZ/JR7QFYJoWDHvyNa+JCdTF6z5SeYbBHAtZjzY2L9KnPVXS
         c7ViupXng0POyjyFZdFlXDrktcNz8vkSqRphP5cSPvYgPaZeSvOEbEde33EQBdYIfUTt
         R+kRzdMY3lHpzy77prPH6aa3goGgEYKdcJi0WQTaxTkqRhbgtBVTELJGEBg202b2WYeK
         Am7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWkvu32juShV0TZ3Zd4L4bp5y2/joTHfN65sBSw+6aX0cFaToeG/kHNBVfKUeYUzmPlsAVa6L5ScFI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXDCYNvFXDEhMy1S8soDodnH0QZFlcn11rj47PawjNa/4i/CsP
	VFwVo74L9wheQhobyket+Vuw2jhVjOVX8nwMWWY2NbvTZhNjdgQ9CXF55pHIJGVrNbIFBqqnBSH
	z2/P35utTmCyXqf8g/bEIXyvQxUtFP3Gd9FiizdrNlQEZAPegcoakQEVs29iXhW4=
X-Gm-Gg: ASbGncuVYDNd4Obosj8NynwB3nJn72JJOpf7tQ7qiBr1GS9/0+r1r+IqKuUaS50ufpa
	2B+Q2nLF4twIFqgoyihhCwL7bTgcz1gH7J66CHFlybAYDJtf9uIUYqKKOUWuTPH2efhTD/FHYE3
	cCZmJyq1T9z6iUUzJCA9gATU1GqTO7DzN6RYUuW3XcpmqnRgM3MVa+NLKBEuvovc8pMAsdT2r2e
	/n7EuPkxqn8JdfL5ieQWmMlPM9wAgUop4q4uh7L0YKTMjTO6mGS3etLteTknc+wPv1XDO/s9dtG
	BDc9unaCwFQdTi82Q9APOpacd+4DKV9x+IFXtIO9qUuZkrfkmbld2InmC+OCrm8kGiMo76R3DPE
	ecBXPEFpfroNWjaAa/RhupyySB9ZYC4ZlWFlPZQBdhSdZ1tfD6IVzI1VwAA==
X-Received: by 2002:a05:622a:1cca:b0:4b5:e871:2402 with SMTP id d75a77b69052e-4e41cb1502emr12326301cf.18.1759259671403;
        Tue, 30 Sep 2025 12:14:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLNJlxjerynVd1dTh9zDT0y9I+Z5SHJ6Y4L40ldD5RmBgpMxLSvRCK4B+vCuq5/baX+cnaLw==
X-Received: by 2002:a05:622a:1cca:b0:4b5:e871:2402 with SMTP id d75a77b69052e-4e41cb1502emr12325961cf.18.1759259670924;
        Tue, 30 Sep 2025 12:14:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb4e39107sm36070581fa.17.2025.09.30.12.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:14:28 -0700 (PDT)
Date: Tue, 30 Sep 2025 22:14:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        patches@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: Fix dependencies of
 QCS_{DISP,GPU,VIDEO}CC_615
Message-ID: <t3rzsvmepjoyhlmyldvttn3dopxfgoqcz63os44by7iu4r4cgr@crkpcwpaetgo>
References: <20250930-clk-qcom-kconfig-fixes-arm-v1-0-15ae1ae9ec9f@kernel.org>
 <20250930-clk-qcom-kconfig-fixes-arm-v1-2-15ae1ae9ec9f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-clk-qcom-kconfig-fixes-arm-v1-2-15ae1ae9ec9f@kernel.org>
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=68dc2c18 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zds2va5xP088SW_5QeoA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: _OBGimhGYoCGibrk9mbhvoakyusHF0NQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwNCBTYWx0ZWRfXz/x/ROsvElUc
 pMDsk4Bn/NtqKTpllVo/R1TsDddhSfNNUzjRBA7y9bAWXTBFefpw6EW8YznpSj97Tsf3qd3gL9D
 2oOkv5HP4WrwCMoJGpxwrKsWi5JkJ0wVaC0S+DQemy1X82MlXKE/SnZafNmUjkrnTCCUTk3L1FZ
 pe4LFdQg+mFCzc4GiI8KbDWqYkLc/PRk5mgHIo1ck3Y3NygoNmREVQNHfNxGQazfCkKDt1V6Ery
 UNxvRKTUlGKhiREAd1pvvjnxvsb8fIPuliiiC7iUcD9VK52YFNRgk0GtOlGeMCB56j8KqnZfZ8L
 cHX4DJ008zwLXDstJGL8WvGEm95Y2ddj6izGNPGKEcakFyGh+KRwR17Ip/8R4Hf5EztVWnSsFYX
 HsU6E6gV3FNspVlKni4h8Ao2S1vHrg==
X-Proofpoint-GUID: _OBGimhGYoCGibrk9mbhvoakyusHF0NQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270004

On Tue, Sep 30, 2025 at 11:56:09AM -0700, Nathan Chancellor wrote:
> It is possible to select CONFIG_QCS_{DISP,GPU,VIDEO}CC_615 when
> targeting ARCH=arm, causing a Kconfig warning when selecting
> CONFIG_QCS_GCC_615 without its dependencies, CONFIG_ARM64 or
> CONFIG_COMPILE_TEST.
> 
>   WARNING: unmet direct dependencies detected for QCS_GCC_615
>     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
>     Selected by [m]:
>     - QCS_DISPCC_615 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
>     - QCS_GPUCC_615 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
>     - QCS_VIDEOCC_615 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
> 
> Add the same dependency to these configurations to clear up the
> warnings.
> 
> Cc: stable@vger.kernel.org
> Fixes: 9b47105f5434 ("clk: qcom: dispcc-qcs615: Add QCS615 display clock controller driver")
> Fixes: f4b5b40805ab ("clk: qcom: gpucc-qcs615: Add QCS615 graphics clock controller driver")
> Fixes: f6a8abe0cc16 ("clk: qcom: videocc-qcs615: Add QCS615 video clock controller driver")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/clk/qcom/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
