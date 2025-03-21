Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E904A227BAD
	for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 15:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742572562; cv=none; b=bSGiiMUNsQVllkibD8ja7T3M7/Ep07iemVRwky+MXSrQNbYnr0E/YTVH2BeKrBxaS2GH+Te/SUECaCfLABjxU+K2RADctQj1HqAB5hRM7muWqGBC9PX6dyaHtErzphmb0TPvwqNjbexQYQB5hJAh1fLZvTD+OigWKR6ITaW/aRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742572562; c=relaxed/simple;
	bh=Jq89ASxO+RlQoZ0gTVY7HIGXZ3XESEER/rt4tTQsbOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eorZTKAak45km8BfIoFUpOAkPq2NRXbedNrAwhI5i7vc63uE6m2QPe6bUdXNKbKuZKyYLSJ/M7MRxv1r8CkGol3lY7cTe4T5mtfGM/+GmBk8ljmX21aKac0OLpRrvzCDDt5vOe1rAOfiYSxYJlX/ftQttBzsuysBh7VTNdiSUiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=paawdqxI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="paawdqxI"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATAGh022096
	for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 15:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=04I2GyzdKmUJhCQaYtdGLGSe
	ZPL6vjPt7nnOQuXCnAc=; b=paawdqxI0c2X/qEkfKLkv8o2JkWb8utkyFdpIKoX
	e+QU9xFk0jb7j4zUIMf5Ks/YlxvUK3b12oF07grUJcoqT9vOfQlQtl6QKopesiDE
	spp5neDhNK9gldpZrsRpeLafeIO6xfTMz1awA/H+7czQW8mcZhcxNHa5K25jaFQc
	g9da/dvwdZeluENvmV8d2Sg63NL5Kmnk8rxZn1R9QKtprzi9UzXEuSBhoLSP5lA+
	pe9DZRuc/2oUcq6GJgRLzDmtBb17U62CwKV9ankW9VAK85oPP+dsDfose1I1D1Dz
	G30NVTqMFg20O2tWEHCrEEu/Yxy3XgcullJRmmW5b/T6Hg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h4wph6jc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 15:55:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4769273691dso40465471cf.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 08:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742572559; x=1743177359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04I2GyzdKmUJhCQaYtdGLGSeZPL6vjPt7nnOQuXCnAc=;
        b=wX+NidqOTpKEBUwmEY/s/JoeYOlChrhzXWbcEb4eaHVunY+rTKScEON7KjmINHFSZW
         9YNhZlKc0z75321PdXoq0MVti7HQluxfplfkAZ+T0pef/KSar8PENccCIBVw2KMzvW1P
         YNsCYARqCBjJnakWhrKRjKJPsALaynBA/wBnHlKhzWHAGKeeKgz8iExYqlFrsCwU8aqV
         cZVZFAIfX380EkCu7mEoKNJylMldIbyHTG241Cb7/AOVV3fYwtLUhQDzqy1qmErGw0sn
         uJHuhSEGo7k7b3mv0QQkd+k0g6c1aEj3Vzn9wQSE3EBoauaVtb2j54lv4wdnTyk4Phfj
         GZ4g==
X-Forwarded-Encrypted: i=1; AJvYcCXOReVjTAl5oPDBxhipwz7vQNM7I/NR1TuXmxdMYejd1NwsO5ltcH2o8gYlj5wy84x8JLFO6mupB94=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHqVH5hFxphenPW1FfOswFjNH6BQiSGEZPuA9cH6CRJjZymA2U
	x01fqeHaLynhP2s4XlGywieLJYUXF6/a3G7cEwMBj0enanlDi1A9pet3JZOXo/GMtejMKuVYxlj
	uml2DVKpVhVV1NdcNigd7rwAYHtDXBZU8tFJ/88xfFT2CND4xFvq3F79IqI0=
X-Gm-Gg: ASbGnctj9pFilD38anfepclqS9IzzMvEW2Z80JgkASYMbT+FIk0LEvN0q9kD7dUg4aV
	Rrons8FOIaYcGxSSSGy2y/vU/bFo5rjjEda0a68LIF13CU283oYuxnPfau3cnGEtTYEcAArMMzU
	hnzBuAGvn8k/kylaiB/3dXB6ViVMwcKWKcf+vvBjFRQcXkgOsFQWxVCAJV/yREoZ3CjyTf44vR1
	/Pco8axsV4PlEq28Nn07SNq/yb21z97gsyTlShm4sizj8HBk11OEkPWw7ZkjEtlgJx30JW14BiU
	A+v58kgoV5wkDhHgMaiO9RBu1PdgxiLOzCbegN3YQKPwRrX7YQjoV2WyiWlKkxP45+N19ykL216
	YliI=
X-Received: by 2002:a05:622a:4188:b0:474:fe6c:be44 with SMTP id d75a77b69052e-4771dd79997mr61852281cf.14.1742572558626;
        Fri, 21 Mar 2025 08:55:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF07+SUkMs8VSdxuN5uNzjGJeTfpHG0ykEhaRVsi5AnxzE/ifh8qn7JCa0nZawf12AcsfFBAQ==
X-Received: by 2002:a05:622a:4188:b0:474:fe6c:be44 with SMTP id d75a77b69052e-4771dd79997mr61851351cf.14.1742572557858;
        Fri, 21 Mar 2025 08:55:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6512aeesm207340e87.244.2025.03.21.08.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:55:56 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:55:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: Add video clock controller driver for
 SM6350
Message-ID: <pzevgib37fgdupythk3mawmeuki6dflpw5bze4ujb6jcjvj7ar@jmjuzeabvq7y>
References: <20250321-sm6350-videocc-v1-0-c5ce1f1483ee@fairphone.com>
 <20250321-sm6350-videocc-v1-2-c5ce1f1483ee@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321-sm6350-videocc-v1-2-c5ce1f1483ee@fairphone.com>
X-Proofpoint-ORIG-GUID: zJODX51fB6Z_qS-QGGyz5B43fgyNxVo8
X-Proofpoint-GUID: zJODX51fB6Z_qS-QGGyz5B43fgyNxVo8
X-Authority-Analysis: v=2.4 cv=ZN3XmW7b c=1 sm=1 tr=0 ts=67dd8c0f cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=qohHCxWBmeq9gVc9HfwA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 clxscore=1011 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210117

On Fri, Mar 21, 2025 at 03:45:00PM +0100, Luca Weiss wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> Add support for the video clock controller found on SM6350 based
> devices.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
> Co-developed-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/Kconfig          |   9 +
>  drivers/clk/qcom/Makefile         |   1 +
>  drivers/clk/qcom/videocc-sm6350.c | 355 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 365 insertions(+)
> 
> +
> +/* 600 MHz */
> +static const struct alpha_pll_config video_pll0_config = {
> +	.l = 0x1F,

Nit: lowercase hex please. No need to repost just for the sake of this
single line.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> +	.alpha = 0x4000,
> +	.config_ctl_val = 0x20485699,
> +	.config_ctl_hi_val = 0x00002067,
> +	.test_ctl_val = 0x40000000,
> +	.test_ctl_hi_val = 0x00000002,
> +	.user_ctl_val = 0x00000101,
> +	.user_ctl_hi_val = 0x00004005,
> +};
> +
> 

-- 
With best wishes
Dmitry
