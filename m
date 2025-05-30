Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C8A27B4E1
	for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 20:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748635754; cv=none; b=bNb0vfdIlY+cWoyORgWIKQLv0nf4xoerGrG1b8qOc1nbzHsfnsIDp/JLtbm8vt/i/W+F3DvrUx0e1vqIyPMcopMEFhGWRS9pnt8q18PxJJeIN44tF6A1YcIE/F5yd3aJ/7IfLVNjmIPaCYUJnTLTQa1ycpJemv3XQ/8Lgv0YyHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748635754; c=relaxed/simple;
	bh=gxJoteEWGrJdag0p6XLmd54/gUnvxCbINpnKlHsPOBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XiB1+JU7GAAXWKcjTm0pW+ZwgShRlIf7HoTBDtZrUVQyCvOuQCBNFpDe4iBhSKcn+WKWZ3145q4e0JoTT0biToLD60iU25xpfDgRseVr99YzV0nnpqGkFg8ET24PqAemH98aXL6oGq+1i3zsSnNDxYl64++koihgN4GAybxfXX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZPEUiZLX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZPEUiZLX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBnx5N017015
	for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 20:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lr5s1xj96hvEFSJoflxlO+2R
	6/H8h+Vs7x/BcGRAh5w=; b=ZPEUiZLX0xEsu7cUxMGrgpsmKWPYkQKTrf6Gat7j
	YmbnegfBHv6QaLORxcFpIpyRcT6nZ5MJoycaIyecuZpHrfEoe+VU0QOTmR4wbDBd
	7vQPESwRM2cTMbdrIUUpwjMyorH35adtmZqSrKsWTNLN3Q8pAV3d5JLOsHuN3I2n
	imKgrL7VgGZva380fFwysHidSFwi+UgBVtPuTeHhTUYcKk/BtI0L8GZYTXeA9UKV
	Wf0Q17X/UKHT7S6SM2DkB7Q+IFHA9Bcm4XLBQqeo8ouDHxkm1/KE7jnrTWOVL8ju
	BVXPwK4YDCykilNmxlcI5EUXISLc3kLCJBFLiUw6VX5OfA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46yc4ysggc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 20:09:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5d608e703so428544085a.3
        for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 13:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748635750; x=1749240550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lr5s1xj96hvEFSJoflxlO+2R6/H8h+Vs7x/BcGRAh5w=;
        b=VuJcmYqHtF7TepxoqBkoWS1VcJ1vcjw1tQ2i8K/k+ZDo8gVREUjhvVYwYBpKznp7n5
         O0r2Gh52sy6YjQoC1hoMAs35iLCdPHVuDnvseb/i2KiDMhXWoyBHYSAndmF9bkSUZT4b
         wzFEsGGGNeWuu3o8AVo6uz7f/NaRayzGcAyJ/GDkp8LHHhFKDvFP0TdkQ0KVwa4a1llE
         bO6osdUzqnD02izGOLF7bJ+4ilglsJ7SwIXhueNKbHJ7lGKlGG9JLD1B5yxtDQF1cCDz
         PsSzMq1nhVu9vcVAKcEnK+MDx18JribooDdDH4ZPU0I5blG774BntHq4ytYrdajWW9EN
         Q5aA==
X-Forwarded-Encrypted: i=1; AJvYcCVb03TNbq7vJTY9hO4KlD+ZA8RhP9VresWjeRSHmKSarieOt6xuY2OxcE8ApHnF6fB4j6W0h2vf+T0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcvoFVjOsktvaQOD0FKYiZf2K5wUrTNwOYjNveHm6s/jtRFUTr
	VhtznmoPwdZGL9crnkJzx5NMmifAXoTACE3qLKhkewialhlF6prQVPzO8ZDex3Is/t+U+ynUufP
	m49NR75HI2mmUTOm73VOZitICUaREOPnXag3iWCeC6+JVUqxpGXlgL7zcvr4X2+I=
X-Gm-Gg: ASbGncsl2F4WBWkOFPk0hg6STyBsbAt7q3YpyGMrrAyO2XWA40ZjBKxvjQUKmKROsUG
	mi2yUlZo8zPOEtlAomTblURyKzb1nrXLJ7pDWEWiRWmouYudrrbsFgkloysZA61F8Ozqa4s3OOu
	CHh/TgMVu75JdUBfRynEyb0b4tmqRkNIrj1uhrlNDbOMtp+JG3wTjvkvOvfEwXRVTCtHKBEmpjJ
	chk8isRWnqIiuY1lVVTZRJ673BNrH9QuVLit/Iuhh5rmaFt76gK37P92+4sbjyPYVliz51LEvQs
	9tlcUBNwa4Owuk7w0YLGUMKk+dj19L44dy9a1SDIc+6rZYEvtK9fWXd3ebrkd/N93wb8PYQOMgk
	iCmHNSDJsvA==
X-Received: by 2002:a05:620a:31a2:b0:7ca:dac1:a2d9 with SMTP id af79cd13be357-7d0a4c457cemr505535085a.28.1748635750273;
        Fri, 30 May 2025 13:09:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxr8DtUZE4WLzMYtnDXmRGwCGjTFx8RDkihvU7FdNCuG8qkr/d30/DYFr7JUuCHRCg7VWeAQ==
X-Received: by 2002:a05:620a:31a2:b0:7ca:dac1:a2d9 with SMTP id af79cd13be357-7d0a4c457cemr505529485a.28.1748635749833;
        Fri, 30 May 2025 13:09:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55337910df8sm812496e87.139.2025.05.30.13.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 13:09:08 -0700 (PDT)
Date: Fri, 30 May 2025 23:09:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v2 3/5] dt-bindings: display/msm: drop
 assigned-clock-parents for dp controller
Message-ID: <pxo635637l45rxb5fgnmopq5jbs7lp2hd736mwrqt6jfgvw75g@kmc7rqxu6oyh>
References: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
 <20250530-dp_mst_bindings-v2-3-f925464d32a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-dp_mst_bindings-v2-3-f925464d32a8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE4MCBTYWx0ZWRfXzEXCXj3sd+Hk
 fB2CNTCciS9bOpo710RiD9bZ1gx6563MUTW2KSyfuyVoaQ5CN8P/R9Ps8zMbA/5EtFBZIjwmxif
 +KENQEiozwDJXTtXsezfh8GYExLeqeUsHDQgY1nAJxRv8INfh18HHcTx6Yc8SRXVqnrlMDIyDrM
 KPPSkJMb8xNcs8XFb84qBbMqNj/2ClVUy2etvpbVDggbWAicMHEZ02u4wUPJeqFLe5SKOYe6zLE
 IU5O1TrpNBLXgCH0dZwtj6g1E76BdmhKxABmzYqoY/xgq43QtyNQB5wVKcxrhEQVkaES5NPxRMn
 mAJOzY2xALtEzAwXARvG3CuU08mFdCekhiu9mnETHnilnPdfpwKZwKQ7Q5h4ftgZlXOcm6OyM+Z
 KN9qE4t6prRjvpolIa4Wf2SQMCJP12qlSxuOvVUYXyAsFS6u/CBqyCTb3vrEIEbdixIB63SV
X-Authority-Analysis: v=2.4 cv=Ybe95xRf c=1 sm=1 tr=0 ts=683a1067 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=MHIm7bi-knHlpQ7IpJwA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 0zdxw0zLx5Vpj4x8lgR7a7PENiYH4Y32
X-Proofpoint-ORIG-GUID: 0zdxw0zLx5Vpj4x8lgR7a7PENiYH4Y32
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxlogscore=867 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300180

On Fri, May 30, 2025 at 10:47:26AM -0700, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Current documentation of assigned-clock-parents for dp controller does not
> describe its functionality correctly making it harder to extend it for
> adding multiple streams.
> 
> Instead of fixing up the documentation, drop the assigned-clock-parents
> along with the usages in the chipset specific MDSS yaml files.

Don't we need to drop assigned-clocks too? One doesn't really make sense
without another.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml   | 7 -------
>  .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml         | 1 -
>  .../devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml        | 2 --
>  .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml          | 1 -
>  .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml          | 2 --
>  .../devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml          | 2 --
>  6 files changed, 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 46a50ca4a986..a63efd8de42c 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -74,11 +74,6 @@ properties:
>        - description: link clock source
>        - description: pixel clock source
>  
> -  assigned-clock-parents:
> -    items:
> -      - description: phy 0 parent
> -      - description: phy 1 parent
> -
>    phys:
>      maxItems: 1
>  
> @@ -208,8 +203,6 @@ examples:
>          assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>                            <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>  
> -        assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
> -
>          phys = <&dp_phy>;
>          phy-names = "dp";
>  
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> index 1053b3bc4908..951e446dc828 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> @@ -393,7 +393,6 @@ examples:
>  
>              assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
>                                <&dispcc_mdss_dptx0_pixel0_clk_src>;
> -            assigned-clock-parents = <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>;
>  
>              phys = <&mdss0_dp0_phy>;
>              phy-names = "dp";
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
> index 870144b53cec..a1f5a6bd328e 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
> @@ -216,8 +216,6 @@ examples:
>  
>              assigned-clocks = <&dispcc_disp_cc_mdss_dptx0_link_clk_src>,
>                                <&dispcc_disp_cc_mdss_dptx0_pixel0_clk_src>;
> -            assigned-clock-parents = <&usb_dp_qmpphy_QMP_USB43DP_DP_LINK_CLK>,
> -                                     <&usb_dp_qmpphy_QMP_USB43DP_DP_VCO_DIV_CLK>;
>  
>              phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
>              phy-names = "dp";
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
> index 7a0555b15ddf..f737a8481acb 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
> @@ -269,7 +269,6 @@ examples:
>                            "ctrl_link_iface", "stream_pixel";
>              assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>                                <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> -            assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
>              phys = <&dp_phy>;
>              phy-names = "dp";
>  
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
> index 2947f27e0585..7842ef274258 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
> @@ -298,7 +298,6 @@ examples:
>                            "stream_pixel";
>              assigned-clocks = <&dispcc DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
>                                <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
> -            assigned-clock-parents = <&mdss_edp_phy 0>, <&mdss_edp_phy 1>;
>  
>              phys = <&mdss_edp_phy>;
>              phy-names = "dp";
> @@ -389,7 +388,6 @@ examples:
>                            "stream_pixel";
>              assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>                                <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> -            assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
>              phys = <&dp_phy>;
>              phy-names = "dp";
>  
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
> index 13c5d5ffabde..3cea87def9f8 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
> @@ -401,8 +401,6 @@ examples:
>  
>              assigned-clocks = <&dispcc_mdss_dp_link_clk_src>,
>                                <&dispcc_mdss_dp_pixel_clk_src>;
> -            assigned-clock-parents = <&dp_phy 0>,
> -                                     <&dp_phy 1>;
>  
>              operating-points-v2 = <&dp_opp_table>;
>              power-domains = <&rpmhpd RPMHPD_CX>;
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
