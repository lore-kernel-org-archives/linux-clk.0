Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A468C3D6694
	for <linux-clk@vger.kernel.org>; Fri,  3 Apr 2026 20:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775247774; cv=none; b=Kq7AEkjCaj/J9gTofwFkPdVArnvQYSRjRHiGizrovF/FN/y5A2JJK/7FvVp0oE4XowlghrcCHkc8mNrnpq33fDsRh7pr/BzZ0cZVarb53emF2BH4fXnDL3FbmO2Y1PsqE9o0CTOuVUEc/EGenpClQewSMZV+MkenM6BkW59/jfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775247774; c=relaxed/simple;
	bh=izIZUsvbEAV/0fCfYRTbm3ulS6qw1DIy4b9hYSIb/SM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZDqRWb4UnQvwG7h2S0nBK41mAF+TfNoG7swaq0Ob/HXa2cCTSBhUbVyhnWv7kvYIVMIeYd4q3cmwbVhIAtbnfwAlyaFAjobeeMkxANp/ikpMZ3pc2NHnA9lkHs3J73pjrfdOIeMw3b0nQBuycHrYFQO9HBW7nwdfi2gl2gk+8bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h8tvSY/l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IiFAibC7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h8tvSY/l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IiFAibC7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633JxfTp3355162
	for <linux-clk@vger.kernel.org>; Fri, 3 Apr 2026 20:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4yDt06DKkjZYPE2ZQ7EPO/ds
	rviXxjbdzSBRuroEz6I=; b=h8tvSY/lEIg5f86ErkOrj+54LUrEUnGRTm8GX3OI
	AAUUcIhu8IvXk5rEaV9Mz0DjE63F/e6IADsUHEEAseHO6R8cpxgvM/tVToCC6DKg
	NxjDr8V9GbiwXZ0u/dp4HjFIYLud4+mZgD8i3bp442Qd+jOR9mpYFktJ3orsnI+E
	oY4ya0ZUOOWFxAyntDISdkmTCxhkgIS7wG84K+1Bw9fwF0/yvNUpIA/Wr2K92cMS
	B1xk1Lr/e/tqbIcctUw7uoK+K0YPPm4+owErCqf6IFU6A9S9w9JsopYP5vtoCbWq
	R2VprTMMxxYcZmKDf25fBN4fPpxVrUPFtYF45Id4wvUnCA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9wcs4405-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 20:22:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d4c2906fdfso76169785a.2
        for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 13:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775247772; x=1775852572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4yDt06DKkjZYPE2ZQ7EPO/dsrviXxjbdzSBRuroEz6I=;
        b=IiFAibC7oHHv4n9LsZLi1RCZ74CsSO9P/lLwrWom1tnpURTpo7ZqBZM0L7ZuuNk6CL
         7OsPr7/KOfegACit/QwZi27pqux2Z5XwnLkrB15QgYiwpPSyIYgqJZkpqQf1m6AM2LCJ
         rYiXYKyrO5uIBQWXbWRgmC0vVYGyzc57hFcdox7Cg7/of8m5Tp/Ne5C7exy6ULvokEYl
         /X6AjAKiOpU+NaCa4/FGfhPyQkWSRzvLisaa+KoHCi685JZBY0upjfO1UK23qTmSCIXl
         yMpf8bqdoQ2C39XjChWxPa4eWJDWAe5J3fBsBsY9J04wB+vMuZTi7xl3/ui/8wZKTror
         nIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775247772; x=1775852572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yDt06DKkjZYPE2ZQ7EPO/dsrviXxjbdzSBRuroEz6I=;
        b=rVO9WQq/fwzpEK8iTle0sZZRh5cr8/EIckrHGhrWkVIieNhi+DJnMdEnLkFPfqC0Q0
         DPN7lBckwIBAWa9WrQNU4TGC4fYzX4P7EGqOhoj9ejI3pXQDymM/awGm3Gygmfa1sW8u
         JVjeUMhe00WQdpUYRFYXI9xXZn8VRGr99AdrLMkVdHVH3AGf+GwgzKAQitz03wm32zNS
         jQGmlDRF4oHryIkMqiBcMGrgmOxnMpbQvdat4AEpV5f6IKQh5Jt3qaSwCGyh6Ke8N+Ps
         g4eq7Kp2za0b6Fwi3yNmqBXk4wykQBrla+8juSufSfB7+WnLCEk/pN3qb76ING3oh29f
         bh9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXKZjW5nKTsv/ba9GS3D8gm7A7SQ/sM20BssMP4gawE6/gDSm+q7xssAg7L014fbdIJq0DcUmwoIc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH/GHHt2Geu4cZwGu0OpCgShxWvN5D/0uToGwz0txl8d6mefhM
	P+MJ3OMpfTe92rHyXbknWAyAYBt+QGZCULvnD+i1mvasRoAuznO+zQWGHPMKz0cxR6Q9sGl8Khy
	HrZZEGxmfJqNM4D2fgTzLV2S6qCqa1QRi2l6m/IEufN7seLXMIGlxY/vWkYI0NB0=
X-Gm-Gg: ATEYQzzwkrnLM35NIwHs3M3glUVlYLB8pj/2PZBXaL48/6eHPy8Pdq6tL4Vgo1C04Kf
	zud3CO2jz+B695H3ACSnPFM3Vq0HevMDxvsFZGwbtYUxEhQidYtPZ95EyKZg1FCHZjoKFfnZe2X
	L/v/Qomvwu984w4Jt7Tk+KUQho8sg5jn8jkISmL777l6aRfPLsfGhkIojVGzcsBv+HtoVld0MDg
	++HumbjmmtRyDkJ89oUXf0f5SbNJ1uX5k9PxGaD4EpNASrBJYtyIktWT8Jf4Ghds9jrif57fGZ/
	VvxBpMqpwqI3gb6VJ1jNuyubUH4ZvqxE/sggi+PD1Ryyot1je+M8NX2mgc+cuytAHa5g8ElNlVv
	M+A0soGD5FnGcsUP8BuGHOAOYDAI7qYTnDkEmj1y6OTOyLz2g+tJ2FzGboHebluXjwgUJFDi4RI
	DjzWi2wcL1/+9Jmh1MU+Pk2IFwRI7yP/XmXvA=
X-Received: by 2002:a05:622a:5918:b0:50d:6baa:9e9c with SMTP id d75a77b69052e-50d6baaa2e1mr38237341cf.6.1775247772045;
        Fri, 03 Apr 2026 13:22:52 -0700 (PDT)
X-Received: by 2002:a05:622a:5918:b0:50d:6baa:9e9c with SMTP id d75a77b69052e-50d6baaa2e1mr38237051cf.6.1775247771565;
        Fri, 03 Apr 2026 13:22:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c97cd008sm1357566e87.27.2026.04.03.13.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 13:22:50 -0700 (PDT)
Date: Fri, 3 Apr 2026 23:22:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Prasanna Tolety <quic_ptolety@quicinc.com>
Subject: Re: [PATCH 5/7] clk: qcom: rpmh: Add support for Nord rpmh clocks
Message-ID: <fnugbpprfyhisikdxrimmmumf7u7frjatjs253flet7xu26nz6@d5wjpz4hchg5>
References: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
 <20260403-nord-clks-v1-5-018af14979fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-nord-clks-v1-5-018af14979fd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: smycyVYfMQyTdn4L013VYz2nYqnDCXbB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE4MiBTYWx0ZWRfX/3izE6RgzrHy
 1FE/3rF90fYim18cRCKC0i1ymRbCwg4UTv+OZ1Kw2a0sSeoWHcLqETq4arRonvkJyQNgSsC1GLi
 C+N2Etg57dJe22j2Z0d6Tz97VF1druVXHWdMgpn/mdjXZ7NOq7wkz0cuiA5aAJtwUO+4+T0dgE1
 WsIdiqDSJkjSf/bWMkvvZXEPlYCAjzsdRZzF8WxYTNMXtydoLav+sOhN6RNkzWim2PGRoDceaZa
 /ErBDD5v5SyQQi19HykRQdxLxqhVu3GYbbih+2J//9GcPy6Fo6MRkpl7XXhHw8hZR/9J7q2BGJf
 EJAXFh7C35hII2KK4QVVjId/NVV1d/ywoP4ksVvk3TYLGx9Pjs0dvBS4+EDesRibtJ4EGH9h2tU
 mHlyhqMXQ5wmwYEbveUdJSt1GOk+tjFzd9HNpWJBEZCE1xtyswtG7ObKY5+zwYgp2tzh6ysy1QK
 DuYubu2UqvfT8C72big==
X-Authority-Analysis: v=2.4 cv=ZuPg6t7G c=1 sm=1 tr=0 ts=69d0219c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=BqJ7pa9g7VlX8Zvc9WEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: smycyVYfMQyTdn4L013VYz2nYqnDCXbB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030182

On Fri, Apr 03, 2026 at 04:10:53PM +0200, Bartosz Golaszewski wrote:
> From: Prasanna Tolety <quic_ptolety@quicinc.com>
> 
> Add RPMH clock support for the Nord SoC to allow enable/disable of the
> clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> @@ -1054,6 +1073,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id clk_rpmh_match_table[] = {
> +	{ .compatible = "qcom,nord-rpmh-clk", .data = &clk_rpmh_nord},

I R-B'ed already, but then I noticed. Please keep the list sorted out.

>  	{ .compatible = "qcom,eliza-rpmh-clk", .data = &clk_rpmh_eliza},
>  	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
>  	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
> 
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry
