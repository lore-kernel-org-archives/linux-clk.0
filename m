Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E80383321
	for <linux-clk@vger.kernel.org>; Sat,  6 Jun 2026 11:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780745232; cv=none; b=LazdzNtkp9pzAAoNGB5EQcq1jmJ0hJ/yNS65We3r95RCGzTKIoMNqDJf1O4LH1ZzhG16H6TwrsKdp6oH1svDI8c6kefdfhHeV1fpg8DRfcJ8mR8mWUPQWvPDK3LZ8fBzWRYZtu3HN8B1iXTrwj6VZm/ufWJdSXXPK1ifaHiPEKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780745232; c=relaxed/simple;
	bh=FdVULs37rn10bkN8n51cMn1RVuRA7F78VvXYpWTSit0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dErq3Q2hl9kyxEMnsbzzSwMCM12x8fmxvF9J1XvdLvyFio7RdGUGUprtZUxbjyNxomCra0ks/bAuOKF2h7qvbhcwicX4SjZUR5/HJAWNdEXgAUeNMiPdN1RtJFgjRXRCCUa/F/KwrTCCAaEmSWmKwFq/QWi3cyQqQkic2Cqv+Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OoDMoWSa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FsuxzjfK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OoDMoWSa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FsuxzjfK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BGGI21301582
	for <linux-clk@vger.kernel.org>; Sat, 6 Jun 2026 11:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8WOWvEFcDyV3Cr6kRzEoTtPQ
	IWhythJtxxOpwTuHVI8=; b=OoDMoWSavCeT5ZKWTo+bxdyH5c8Rp8eiOHTjJh0v
	pff5Pd/yKd/sP7VN6TuulodNOTKHskwVXACx4jmCwqYnE1krAdexUyYU2ra+7Z1r
	UKiMDh/Cvunr4NyjauTssUYsG4DrmJMOfvKP2EvNwAhNCuy8bDqIY8RcAxn84qY2
	JDZ9Z5wsAqhYttBMyupdIYDtfKXeXIcE/x5AtFBs+bAWLdsaE0GW5uv2NQwX0ydM
	mw+XA/EBJoGl5ep814f6uwyWqRoOTrKS1UAFCDVgB1K9lENwNRErNuRiaI0knb85
	92WDiT/B7kQGGTRc9o/NRMlzm1ZmRYwlxi2A3P7+PDiZMg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx68tyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 06 Jun 2026 11:27:09 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-96396d1f745so2875414241.1
        for <linux-clk@vger.kernel.org>; Sat, 06 Jun 2026 04:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780745229; x=1781350029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8WOWvEFcDyV3Cr6kRzEoTtPQIWhythJtxxOpwTuHVI8=;
        b=FsuxzjfKPa9ClK/muHTxjsLwHDT6/ZoTSs2LoEyxbbnAGrRZFCljAc2OvE+qyiZOX6
         Dt5mzt7tRNU03IMEzUNbwxM+eKcqq2DF7VqubYUsJ9ZOmxkFa0ucqiwV6jhFQw5o36Ye
         TP/s/begfRPvTQWwscpsKpjT3ZuZ3G++jQ7gS3+Gf42vZkzYBVeH8XyGYFf3ZH7LM2zi
         wKHK+fRzJb3js01MSk5VbyB1j+pje2Rb8Q12mfYIYZttGJ5fGjfvxHS/o3F8fhh730Dt
         jGNGzSFmOcCVc+Vwh++2ybo7++ydYtI3wwJ5mOgLBStrMYm/9jp8H4xuciNKI5Ra6yGW
         THDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780745229; x=1781350029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8WOWvEFcDyV3Cr6kRzEoTtPQIWhythJtxxOpwTuHVI8=;
        b=XEg7aSr6Ng+0hYzqa4oBOwQnndvPNWQpTOkl0IX4DAVlfAc081bxRuyiTHlwunEMgo
         S5fwIydtcGpSvTQn//5ESdgzrJG0TUSBSS9ZLHqdEzBeaGwVqrTnMUUOMrTTqjnH8kLy
         v7GkF0AICsZYaOfnrHJt5H/ysafjC7POBBdi1S3TFLJqGTYb6GQJ1wU7pDFso+63FzvW
         leD47JTaCPi/ODlkvMXm6AoPwEJhi6JZDb2+jNrMhzkM9wtQQDbdi9bgFye54GTmFCbK
         Vxi3+BTLJsjnf5tFMXUSlHlb1WN5c4kOxxGXDTfzBhjmquIdQ6CNHU4/pQ6Po5wb7pLF
         oKAw==
X-Forwarded-Encrypted: i=1; AFNElJ92zAeAk5VyKbUeaUUMxAIM3XoYB/yXTSZqMwp8JYaQGt9NBgej3niOFUBG/q0MGnHiVlP3KY4wj9o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGcq8ww1uSzM5tslXmr/an5mvtjClD350Dckelk/gAbXEGAUcP
	JwEZMJeGUFBg4eTuuOAQ4y4u4mgFyMcE4w/skrx/G2n4ZBaagaaArJMhVzMvVepDDFiG/Tm2ohk
	1xRRUo+2L+oP7uDynNdkjrqGSRWxNX6hqLbEteW32ZjA9p6ndhkToU+B5ihDCmTQ=
X-Gm-Gg: Acq92OH8dA4+QOnJl9xdoX4esMRcEv2EvfuzSib90JDDLQKqYWP9ko7VX6wenDafZyG
	iru6xm91xWoHyGt4WfEoX9Nq5naTia1safi5xT6N9j9AdcUfn35FjDsMkaxfWDmtiquNpjixXMx
	rJOS5VORt9B9y4oK6plQhLq9+JSaAkJBc0fNgVfzVDtBPT++5dKublxoTQ7GSRKOrNBZQkY6+0L
	7PaxSjtHC+o1PiV6ioY6L/66toPJhlc5JYAcPFJeYrgKuWRzBXLTj6vz6v2bCq8nrLLikBrkXFN
	mkEmz+K3gL4NNxSczKmmmedxEva9JgINoCpc8wziHYOen16bXRnolBVLaN4wQe9IZNpwoFJ745d
	xjjGC9/cLDAz35ZhY8GoFwodRTm1Fq24PGhifjQtRmLQKCbLhrs9PdSv7RUKR5aJjPVTgJ3ceSW
	adctdee+35s/U3/8cQrECjWNwHQiL1lolvPTkP4JR4lzUd4Q==
X-Received: by 2002:a05:6102:390f:b0:633:944a:4607 with SMTP id ada2fe7eead31-6fef853203dmr3956445137.15.1780745229391;
        Sat, 06 Jun 2026 04:27:09 -0700 (PDT)
X-Received: by 2002:a05:6102:390f:b0:633:944a:4607 with SMTP id ada2fe7eead31-6fef853203dmr3956428137.15.1780745228991;
        Sat, 06 Jun 2026 04:27:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9903e9sm2372753e87.69.2026.06.06.04.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:27:07 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:27:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 07/13] clk: qcom: dispcc-qcm2290: Update GDSC
 *wait_val values and flags
Message-ID: <66iobdkznpqqy7twf4fhu33m7mclnndlrjc4urt2em6tfe6gp4@r7wd2gnzsjoa>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-7-8204f1029311@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-7-8204f1029311@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a24040d cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=fySNQAJ5CXMXns773n8A:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExMyBTYWx0ZWRfX/Y5Yl3ZoBcHB
 1Qu8TgfrnOIUGZS4cf7U6Fceq22kiW2Q7gFt2DJ/Wk17g3JJpMsQ5Vb76AHlN/HeYdFqyw9vP0G
 eKhPLqCLNpdEnGs9U4r6m77pKLq+Y1ceYsnvBtUfLpgqsCDGo7vJmyYJPcxlnxSbHZjflGeMtV5
 /bVZHDF87qwSKbNH2bvnJ9eUBSH5VHD2Omw+4akVIS6uFBvvlg2ILyFbyHw700yoNr6+AMgu93c
 3E0vDILDEzFGSlaZSO3vxinbQdIsNP3FkE26sTnzTPt7ypGgT2bOY53iq8mPZGDxBw006LB9ImN
 ZYj81fieb9eS7M1CRdSBGuK8r8kGx4XUMOPK0EvwegkDZmVkkicN9pM1mAhf2EkakRnBnVxsT4D
 gZJ4UGFszIbvIh7CQTLP3dUTtkC3hhqk3e+p8V99FY/M33SxTgIfr3GfKGRvz6izo6m0StmeCeo
 +WTMFgxyVgRA5Qp4NAg==
X-Proofpoint-GUID: uYTrIH6bgBdFSCweZmYfMrVFypn0x1nE
X-Proofpoint-ORIG-GUID: uYTrIH6bgBdFSCweZmYfMrVFypn0x1nE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060113

On Thu, Jun 04, 2026 at 10:56:13AM +0530, Imran Shaik wrote:
> Update the QCM2290 DISPCC GDSC wait_val fields to match the hardware
> default values. Incorrect settings can cause the GDSC FSM to stuck,
> leading to power on/off failures. And update GDSC flags to retain the
> registers, and poll for the CFG GDSCR, and switch between HW/SW mode
> dynamically as per the latest convention.

Too many ands for one patch. Zero explanation (other than 'latest
convention'. Which convention? The flags describe hardware behaviour,
not conventions).

> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-qcm2290.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
> index f5dbd19d0a0334362a44f91a69229cb0f018f309..4c1eef79f41b6907fe79f2b18bcb5f6160c74a43 100644
> --- a/drivers/clk/qcom/dispcc-qcm2290.c
> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
> @@ -468,11 +468,14 @@ static const struct qcom_reset_map disp_cc_qcm2290_resets[] = {
>  
>  static struct gdsc mdss_gdsc = {
>  	.gdscr = 0x3000,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
>  	.pd = {
>  		.name = "mdss_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = HW_CTRL,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>  };
>  
>  static struct gdsc *disp_cc_qcm2290_gdscs[] = {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
