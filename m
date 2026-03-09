Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23A726AA91
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 20:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773087441; cv=none; b=P4/mNasb4DFO5uDd/572Ewc9oUWa84/BKr70L5ZsWcasCLgrkOV7lMhGBjeYB/gQwE00IW+xSDCQdJR7UyUXRN8xg6xZzkTp3cFQDDGcPedh+z2YugVtTIOCXSaZvoLzRkzer6Dmhg/fw07fcdhGg+ukn0KzkVdQGPK9ccw+Q4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773087441; c=relaxed/simple;
	bh=gPiX92NT9mKde0zMMT/God8FXw+kFh6poVE4X8mEfeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uR2HMT3FC2XETMQLz+s45FtaHKh2+t2phYT+jDsqmTyi2hALbkykbHrAnCY+gWtKqlPB6r3R4pPyD1cjNGHvZDsmyUVVJKx53QzJokbVJS3M3r+eUdElLC/+u02LGwHQ2rjBAVMTs/XjR0Dg5Bp8K8eGHR9gv7Bs8GRyRhKFw3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFXCoAsL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YzufRY/8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFXCoAsL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YzufRY/8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBrkH3148251
	for <linux-clk@vger.kernel.org>; Mon, 9 Mar 2026 20:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1bl733rFNVoHjnY3FJMPPEyn
	NpusuvQRv/qTulZdrOA=; b=BFXCoAsLF0mgw8ieUsfxpwKDHQqw7+1m3KKuLS6z
	4Jot9CZ1mt2cVx9+ElH00mbvWAUjHYXk13fBe1tQG1odJaHEzCgv+3mJergFGSEg
	94cr/OjizUlpgNxN1oqw5Rk5bC7zxTAqoL6eFiMTz1QQFmLHfhRWsgd1dPSjRXPC
	jZPc754xamjazxe90POwp+spiI1rUO8ISmdk8O/sXN72wzX4+I9j+f7YvRXbFAX2
	5lhzc0TpI78iNUxh5PM48m2JLwUl423PWVvFFhSmCnOO7kzgVm5mSF/yqDKjBJxH
	zclxk4868t0A8HQnBrONpAvWPHxnimNRZijH7FH7oChB/g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csv5ua0a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 20:17:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd80c4965aso349539385a.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 13:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773087438; x=1773692238; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1bl733rFNVoHjnY3FJMPPEynNpusuvQRv/qTulZdrOA=;
        b=YzufRY/8IUcKfGIUyTcJBrV+3Vwzk94odtc1RB9BLxVVEB4E5eJT079fGS9z70ggz+
         Pw4XDGdI+R0AwbEIc97H9Wxcu60kdXnZypXQ2w+1hrR9+K0CsIjJWs3MWXth+KOFKbIa
         sf65DAiJRYsDvgZsKb05HQwqp0pIbcp8C4WpZNaLmI/d54NvzYGMvIA+fW48bm4wKoTw
         PGAtSbP7gwjw5AA3Zmu6Rv0x5HII2q3NG2i3fHHms0Vb/VuCw/y60AOuE3ybA3BxAGyu
         eV5YEUKHwgWYCCOnTCuymiut+Ocybx/VustUmYP2E6ot6wwotD3LbeIMIKWsXfabUfNM
         wj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773087438; x=1773692238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bl733rFNVoHjnY3FJMPPEynNpusuvQRv/qTulZdrOA=;
        b=kNalzz0Flif4eSzC29cIkxab/f8UadDoWPS1SzJce7q5CTs2inrQIrJe39dU9HOrBh
         1cCUQpe/qZl42GlOUdYEH3MfpA1h4t5IkW9N5CMqIEXLh89IvjGGZgugXFD62ZmL2+0P
         ybdV6+G7RhCDXV5KOqEn0G8MqIYwj6w7IyfmrRNpCjRewaKnxI/gcm4GfWITFONulvB3
         gO/q8uccL+VGSG3EWRQhWMIkLSZ3EvtX4pUw+wV8KeOaAGC+VF0LVK1ZbZyKr9Rnc8tc
         MuzqumjctL5s7Wgfv3SBHl4HD8MKIHAW6N3cglOnJ/JHIujzWsKlVI6c8eMUDdtKPF2Y
         jtNg==
X-Forwarded-Encrypted: i=1; AJvYcCWRwxTFJL9phPhlQ+8BRY4G0TnKrzd3rv/au/2Hg21ZriWel0dhdjJC0U8lxwO4A5JgKCN0pqRnovo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIOfjSM0GxZ4DQivjN7Vd8rYvEVlI2mpaGRqr4ctPmEehgsA4y
	D+6GzfTeh7le3syYQML8R4jQ0ZGCxt1WdwS18wSxJNDNNJQzSbQHZgwomaMtu3nAjafAQpDbjAZ
	ebhvY/vL5AWz6NYeQRmjZUBxHEqOGjf0iwmqsU3PKH+RFLmHQiTWWACK9pcWjtyc=
X-Gm-Gg: ATEYQzx8ClynCyywn0N9dRX6ZoQ/1qnWY/8UnGWVIcc1YyVGfCjroJ1qxGye/zHueV3
	kFpkQfWJ97qebdTseHkASWkkroTadb8G8cVkNeqOTiY/VNe/sH1JiLSxKZh0Tb/Ezl+zGBMmPnf
	PeUok5/nOTclHGSZn07zy2pVXud9KRt/KE6mFS2ZcuX0n/wqpSIh8tmhLw7hi+RtKZ6pcdUetw2
	O38WexcSqJF1lhv6FXNESGLw+kPjeeubolX5qC0T/O6GA5QLY+TkTyJQSwkHyEUSPIpvDjE3u3w
	re80MuNUlFf1gY3ocbdz1/1hxLPOv4lGq+JWWWDaLZnrEffpqgHI6UBG9VPoF2gXIHEcySvwSb8
	LdwhvIWWHfZvSa/bvYZb2Lrmm8ZnNCxUh8Rv0WddABXAscMY+MgXJnKB5tlBU9p0D1GBvnBSBfC
	ZROK4gyoUozUl8OGpJwRG5X1vXH5Qr0unbPwI=
X-Received: by 2002:a05:620a:c44:b0:8cd:8c3f:af1 with SMTP id af79cd13be357-8cd93b3cbd9mr99037485a.1.1773087438298;
        Mon, 09 Mar 2026 13:17:18 -0700 (PDT)
X-Received: by 2002:a05:620a:c44:b0:8cd:8c3f:af1 with SMTP id af79cd13be357-8cd93b3cbd9mr99033785a.1.1773087437839;
        Mon, 09 Mar 2026 13:17:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d085ee3sm2281593e87.62.2026.03.09.13.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:17:15 -0700 (PDT)
Date: Mon, 9 Mar 2026 22:17:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] clk: qcom: gcc-sc8180x: Add missing GDSC flags
Message-ID: <usvdz7ocxyl6erj5aay4ghix4h3x2hklfmkg32fvakuzuoj7vw@zq66ysfqgte4>
References: <20260309010214.224621-1-val@packett.cool>
 <20260309010214.224621-6-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309010214.224621-6-val@packett.cool>
X-Proofpoint-GUID: W9bkdyd4qjayk51sU5KQ3t8icZXwhfUQ
X-Proofpoint-ORIG-GUID: W9bkdyd4qjayk51sU5KQ3t8icZXwhfUQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4MCBTYWx0ZWRfX1F1eOUgjIuTb
 LDy8IXqVsWXEBSDT3VNl1KtTEv/ItDW7CKGV7OIrfzqwjB504lvQBJHrBLQxVM5qH9rW0RL0+CM
 23gRPoegXc46CniZjg0GhA3jxmC9a/bMDDnL48b9WYioiodP2o7OUpoCVeyO2kOW9swGvjEUh7j
 zJB7dMaSjrRNMgyrX7mi/boX7Kd1sU1ZL400CeupWSdQN23Ct+5K8JD+M7mJpoI8noVuFMliLJ0
 pR7ycoVvhcnJKaTvKzH/tLmQ8Ed9zBv9KsOX6tqVwGgpegYOMMbX+DG2/hjJwCBta850SFEGFpB
 9uU2gZ8IiMRAh/DTVtr8KScB5QO4Ow845ZSg++o+KPmS4XdxZ0NivOmTIP9f3KPPEGS8CiYK+eu
 ePXNzS9PedLkcaTyAIfeVB1OeDud+QmWwX49Jw/5GdvNSAb5D0tIB2hMZ79n1w4NwRdogW/6fb9
 lYHFS0rsUoLTOYEn2ew==
X-Authority-Analysis: v=2.4 cv=Xr/3+FF9 c=1 sm=1 tr=0 ts=69af2ace cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=YcTtKlT3hu8PWQJ1XPkA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090180

On Sun, Mar 08, 2026 at 10:00:27PM -0300, Val Packett wrote:
> Similarly to sc8280xp, the GCC GDSCs can and should use the retain
> registers so as not to lose their state when entering lower power modes.
> 
> Fixes: 4433594bbe5d ("clk: qcom: gcc: Add global clock controller driver for SC8180x")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/gcc-sc8180x.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
