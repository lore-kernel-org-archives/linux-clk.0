Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741BE3E8C78
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 16:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776183610; cv=none; b=WW1UehatEt7b2BijPhNHqhLziXEWzLHhcS3fVS4DuMgA5XPbmiexJ0CQIciAPdiIC0TAx2LR95ZSZpus644KRNQ6aPNtRbL2EaPmOz+k2WYECWRr5JREtiW6giuVp0io5zFhcAUOrRCpPaQwiO3Zp3st9hkkMp0UpZd2GRSX2EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776183610; c=relaxed/simple;
	bh=txOq4UZ0M9dkA/lPV+LEOE06DUusaR/ywnIKzIYbdx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U5SS/QKKt7XPBIWfCjVmsUJglSjMyATDyQjArwzex8KFXVuqk1582XpmOnZBrNVL6pWQ0v8RahPd9h4NYRkCpNPPMlDJlfi6cqx4LlpBLnuVLqKDIM8mcxXUhkxCrCUALjy+5jK7yl4yE928fIJ5mQ8aPFvmxo3petSE/LHOySk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i3gLXet+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e0L5HbNS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i3gLXet+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e0L5HbNS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EG4VLb2005540
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 16:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eZZfQAV42/8HOHv5lacfx1mg
	jGrHI1LHwa/ZyYNicN4=; b=i3gLXet+Mx/5Z/gUyctyHmw2sPmxL18GMa5pO7ZW
	46e0018sfXaQYgiD8Ph3MVqy9rKbhjVGoMg3a5Ixv24a4C5Yf9HYpicy61JPOzxo
	O/OWNGkOJxNIoqXZC/2SC0ecxfEDiHBcy7nIqadAjvs05YpB2vpd8AgbNOQxRhLZ
	CJqb5DSV2JM/GAz8suK1J309m/IUu0swqMC38hXPCEpm0qHtX9pj4OgmUigJyO2j
	Uhtn7F1eRyiUJTNtPPw4sw1j2gTfar3+K6P9q8raBUFFTtPrhGIWcJsniYvBOnPo
	BNHs+4ZOcqe4eYHwLLs0nxSoyN4CYLC/xsCsUmZ920r7Sw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrsjr2ey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 16:20:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50df4c130dbso70054401cf.1
        for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 09:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776183608; x=1776788408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eZZfQAV42/8HOHv5lacfx1mgjGrHI1LHwa/ZyYNicN4=;
        b=e0L5HbNS2DHMy/audXMDhlV6NFtrGk/pO/7vuTt02DNqZCFKceRKc+r7uFMPklsho8
         9oSy7J1RzH35KmZA7npRufA0vfDNv+bp55Ell1Xj+RbU+b9TwzHTJXwiaiKMKCn2iK5V
         WdffTME01cPJT/dPd2Vc6UZoVPamzy8v32gj7I5biW1z4ZjFlEXv1QlefBmqXw7480Ga
         VINBg0w6Yv8OSxd4ug9uugQMx8s/q93xVopdHbU4zbG9XgIJiWNL24tngOa85hKAS/Gw
         fEpMD2Zkuj9vmIbh+qtNPALScw5RyFUBuOSmjPQCY4tQE5khuyswr4hhmumzaCs5HWn5
         +odQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776183608; x=1776788408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZZfQAV42/8HOHv5lacfx1mgjGrHI1LHwa/ZyYNicN4=;
        b=O08YeMqLBvGsTaMM5nu9HfAXxZyk2VUbcMVywVIlA0lX2nusZlGkFW/5QDS0RiFbnc
         Hc8TuLcLpuVM2156i5ISJAKWyB31RIyFCDwggXqjoWbQAxpkHbiEBI02G/A6BFPFvc8I
         c3wHukl79Ba4U92M19S1sazHqorX9IQ1GOnHkbRIExUu6pxAn32nW2ueiMNwPNyRK6VD
         3XROfWBFDp1rFKjA0gmCyazzatA1epFQwXn3zfZbQI8y1igcf/COEwrjINRTBnVE++eN
         eMR/g6WMlrK/Hb7Gcu1XZzEeaoSrc+HdMKUhE/4jMXk1u4MfFZph7mwW3BvZZPAhcmCZ
         HO3A==
X-Forwarded-Encrypted: i=1; AFNElJ83US2iyOytIJlPTrjo+giVhFrDUO+TH4JQ+HI9zByyouQjU26CH62JFVegPzdTFbmc0fzYMCuqM+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YygQDvz6rjK277OUzE7MA6tvvxKYO7gb66QcVaLivrofOxYQFdx
	Togv2hikmYJPpvGWfpVL4QjWxmhEXxwxptLzdTMlfYXSzIquKqF3NDnfPWWOLxMIZKTRE7fuM/e
	ttNxqvWmS8nYUpO9jUtxDVTZYjQa22yfujLWudjw9urCDe62HzVnICZLEPvqWm2E=
X-Gm-Gg: AeBDieubTSIS/OCk2ZkRW4NMnMirkBgtp+UsecQfTyH0EoRF6JLHKqfhxStw9nTCqD1
	J9DSTtVAnIpOkkXEBez52GfZLlB3LhMJthOZP6BuIMJC5lRmcBx5UAkluOQViSJdHvcRXf4b4/c
	xOOtesDxL+ywZiojghgFaF6dJzVqpKg8Du+9veoDlyYi4Iyv1ntNcyIUgFbfqp+X4Y+ILrQ7NZF
	uoGzj4yQcf2tCqkscfv9RGa3PEtCXCjBCGAlb9gaMdtBfPESrsaI4q0zXJghRg2V3QUOdLpVsLD
	pcG042C4ANrlx1/H9B6ArVQmNAZwrLOZo4kP9DHL90N5qilI4JzqbjEDd5C6JWM5nb3ulwEW77j
	xQnplIlPX0baP+MvnDQRM/1NVvLWD6JvPJjDf3eetM1hVYv82GJEUm5gehxtwTC3nqL9eiv7aP7
	yzw3AKbA9bgSqYv2TUDRv8aTcChbSEhpguAwCoc0DrkyUpDg==
X-Received: by 2002:ac8:5955:0:b0:50d:84ce:e339 with SMTP id d75a77b69052e-50dc1acd899mr318594031cf.19.1776183607596;
        Tue, 14 Apr 2026 09:20:07 -0700 (PDT)
X-Received: by 2002:ac8:5955:0:b0:50d:84ce:e339 with SMTP id d75a77b69052e-50dc1acd899mr318591331cf.19.1776183605398;
        Tue, 14 Apr 2026 09:20:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee864a2sm3355630e87.2.2026.04.14.09.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 09:20:04 -0700 (PDT)
Date: Tue, 14 Apr 2026 19:20:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: clk-rpmh: Make all VRMs optional
Message-ID: <gt2huchpumtefjnwsg45ddyj5x6axibqytuqsxtvuwipu7qa2j@p6sw5htikfrz>
References: <20260414-clk-rpmh-vrm-opt-v2-1-43c1073d109c@pm.me>
 <2c1da6e3-a7eb-4c85-8933-84ba9ac7a363@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c1da6e3-a7eb-4c85-8933-84ba9ac7a363@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WKhPmHsR c=1 sm=1 tr=0 ts=69de6938 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=tRzE2P0BVMUdLtOBgiIA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: pYkDnJLIjQPocModMKCbjfvlyFF5m2yo
X-Proofpoint-GUID: pYkDnJLIjQPocModMKCbjfvlyFF5m2yo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE1MiBTYWx0ZWRfX75uciSbL6jjr
 1utTTLsAi9Vt79RmAJDo5VbfqTg4MD0FrHxYihp8TpBdvImdopQaHQNYwInm/Nd9qGkNFGfV888
 RHPxHEvWp25ay85n+R0dwOH/GQsAUEJmYCj+D1bC2zs+ORs1RGCeFddzHFzNDQbZv8VtqJri7nF
 ElSIWSbjNp0QAhIlyGOVlnJULXEHE3fmEuM6DOr+zWiGDhbBPrBzHY8bhTg3+F1yEP9VwjgNld9
 t6mxXjvg62MwCx0sIMZl6bEbrMQgAayTPuXsbW1O80WkWlbjQlXAU2imV6LC3h3Zk1V8RKa0BEb
 KZQHFF2pwbxYx2O+1El30ZLpqSQlynjM60wDja/5LoN7gRdH+QTRiDkmvqPXrM+oUodJ3hzdTfE
 zOR72p0ab240GesnpOa8oZuCdd2262AThNIfBARgkuPmv6yPGUnjxkoR4t4f07HtHPurpDjnDmn
 35iwd5v6k1/O+XVT3+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140152

On Tue, Apr 14, 2026 at 01:53:01PM +0200, Konrad Dybcio wrote:
> On 4/14/26 1:34 PM, Alexander Koskovich wrote:
> > Some VRMs aren't present on all boards, so mark them as optional. This
> > prevents probe failures on boards where not all VRMs are present.
> > 
> > This resolves an issue seen on the Nothing Phone (4a) (Eliza) where
> > probe fails due to RPMH_RF_CLK5 not being present on the board, this is
> > due to this device having a slightly different PMIC configuration from
> > the Eliza MTP.
> > 
> > This matches the downstream approach of marking all VRMs as optional
> > and makes the previous clka_optional handling redundant.
> > 
> > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> > ---
> > Changes in v2:
> > - Squashed clka_optional revert into patch (Dmitry)
> > - Simplified patch by just checking if CLK_RPMH_VRM_EN_OFFSET (Konrad)
> > - Squashed cover into patch commit message and expanded on background
> > - Link to v1: https://lore.kernel.org/r/20260412-clk-rpmh-vrm-opt-v1-0-37c890c420ff@pm.me
> > ---
> 
> [...]
> 
> >  static struct clk_hw *glymur_rpmh_clocks[] = {
> > @@ -951,6 +946,9 @@ static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
> >  		return ERR_PTR(-EINVAL);
> >  	}
> >  
> > +	if (!rpmh->clks[idx])
> > +		return ERR_PTR(-ENOENT);
> 
> Hm, this is going to surface in some places where a nullptr has been
> happily accepted up until now..
> 
> Bjorn, Dmitry, WDYT?

Yep. I'd rather drop that part.

-- 
With best wishes
Dmitry
