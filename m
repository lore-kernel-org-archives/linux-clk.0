Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A3529993D
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 05:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774244117; cv=none; b=TFQns7qkZC3uoqz3Q1dj2n3C5IKvkyAEwbV/iK2MFc3gLq5iAfPldeprbVlSvpnfyLAC0k/uyoL5eEu3INpKKwIEQKLfvslHmkxOHSaUjRx4vdOsyNmHhswptFj8nTlX57sNpOXMa/sGaAFUFdu/cIe4+VS4qHCLDhQR3Tiy0iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774244117; c=relaxed/simple;
	bh=pUd5WS/jGJRC5RrnfNLBW5nV8opvGIA/bXBkxA2/7Us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ruovM+R7Zr0t5uZU1mOF6sZByHZJU5sIC5cH6y9xC8a+Z0+VlrPGRRIJrKSvszkCs7XVQTRcbrvIKNZ1iiuHI4HW7TiZ+016zUTQM/1m8T75uMg5QdzXPibPLL9TxKCoNIt76xaSfUgPVgRhsd6ADNesOzHQOe84PVKjrMMZXTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnjhdgOF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GR1g1+iF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnjhdgOF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GR1g1+iF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MNrCYa443182
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 05:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XOZF3t7xM81O0Basx1IyEzMH
	oAKaQM3FfWIZIUddVhg=; b=KnjhdgOFcmpqFytph7mRSF0RGWyx89QkaXSfhU2K
	YeAbojOJS/FXSn9Yt0mHS3eyyQ462KUCXpP7l0Wy6DQ8EosVVD9kZlu8sGbWRe47
	/PIKmKlWs0pSX/ZdIdoCpT5wGIPe5jCjwX23oowvqDENHKrofv59HNMW1qsBpHjT
	g3FluyfakXCOrKCSsoySJj/HN1ARoiz6iwjxftLNAx6+FYA0pKt0V4Ipu9iOIaBo
	5hRWuISRU2ynd1QWt/ur4KVmOdQYetZggD2u1gz5/SOVAKrWfRpeJwM1M4zDHoRS
	z3a4NjDG9S3hpMTSMtT5b9xRqZ++QXbvth0BMlO1vLuRww==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1h1e40k7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 05:35:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso147560321cf.0
        for <linux-clk@vger.kernel.org>; Sun, 22 Mar 2026 22:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774244115; x=1774848915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XOZF3t7xM81O0Basx1IyEzMHoAKaQM3FfWIZIUddVhg=;
        b=GR1g1+iFlTt14S0LhbBMP9ZGgTwhZe20R3Ql+b1wVoVvF0gJIOIJtdQ7yyAg+ZcwWF
         0DfIwukTTJDI3DuTLB6zLzfczLBfPJAmd/wXtCL8ox/6OaxzwXyK+ALMrPyesoaNyPeM
         GMBBl6Hggk5EG31rADKHEAIqSQljqNQW7SAqtKgQ6003ZV4fWYgUOC0bKPnO9a3soAEY
         SUm4YWmCM6w8bxktruOeXjbulF3QpV0bVkNYZyKKk3Zjgvxkt3/1rJOxoM0S/SdSw3gC
         FcyLVloj+UWSxqrud/2/0/AZTPZLCwj9vEGLlChtm7+IMNChXzqzweiMBntR+FI7rBkI
         mVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774244115; x=1774848915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOZF3t7xM81O0Basx1IyEzMHoAKaQM3FfWIZIUddVhg=;
        b=OQFWMevqX7qRqvJamyCi+gzcZuFfCz2N+SBEVHrU05RCkkmyOLxBEiLD5qm07slTne
         5a4P5V9ieJPbdE/J1ISBLPX8FzDNgndAKzwY4JMHu/aDWjyxExKStg5wDVn//Oc7e4S+
         KxMVhzwogVl1qRx6wQP7oyPpMP1eWdcHZKdVsATmdnq/xU0C8qDKRfqRn+pbW5+tpBpK
         hcVEXdASC2FpqLaT5HLVEJrzCLGwP5he8zRwMuexr5wOwcgDDC3crzvyfVYqhrAW7xdc
         4Zkr3YVQWjmFKKpqSiKzQajww81PwJugwsbCu1TKVNGUlxdD9+Ko9Ylfxi8+H2RfbGNN
         nUwA==
X-Forwarded-Encrypted: i=1; AJvYcCUqicfW4HmNk/iNuNiIPwLeu0+3l/9/4gkckP+HBVu6zR5TBRriO3CraCd7QHoimu1GX76Ua89Rmuc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUXS974BC7+Y0HsCVdyDPKrkIgFYd8fT3l7GPzgmrmRWRjg7ka
	JvO89NrUd/Nw0tB01U0aSqm86GIAde93Gwc1Qz0JJ6yVVz/HUpkktRsIbmhvBn3tRDkIBntzPQs
	oiFAOrsQ0nKvYjP6ZvQnO++tgmCMeE72oxk/u6cU5QdTX1kJz1nc1Z2t5uLUIkbc=
X-Gm-Gg: ATEYQzzA56EBUcL8HpD0sp8F8L+kASY/+jb3Xj4CGy/Cr7YCr+IT+cTfBav+61K9VDn
	CF7qGYCfQ1UC7QhhKS3BlVGGyazDM4pMuFuK/pu5wLUyA6JHrKLvm8XDF17+6TrsZ4pA4Pp7wgO
	sV2sKTB8xF0EEYSyPZBflP6FsbLjVNj3YI0rq1IyTvlGrjqCcBAFAddWZ6sQc6Dg/m0+VDTzWGW
	6Qn9+TTCxmNquGmoEV+teui+SJx/p6VPz/Etv+MKPrIH0vkS19AlKVNTjdu/K1A2WPiRsnTe8o9
	6FwfZzQOePdgVW8LOFpk5pivm18Z+jdED2OwLXqJcPOTf5euIEu8vmJag96x+sJ/qYClfXy69GN
	3/aKNTEksrzUJrXcn1rRap9ICvhd0aWlk3Szd96ILDnxa44L5TNK0pvGouPeLHkYYkw9KjS1byy
	o5OZoFzjz+r0zePrMoHQdf/OsRbN2GWiv6hIc=
X-Received: by 2002:ac8:5f47:0:b0:509:16fd:ac37 with SMTP id d75a77b69052e-50b24753e07mr220037621cf.29.1774244114695;
        Sun, 22 Mar 2026 22:35:14 -0700 (PDT)
X-Received: by 2002:ac8:5f47:0:b0:509:16fd:ac37 with SMTP id d75a77b69052e-50b24753e07mr220037361cf.29.1774244114256;
        Sun, 22 Mar 2026 22:35:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28519f958sm2254939e87.19.2026.03.22.22.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 22:35:13 -0700 (PDT)
Date: Mon, 23 Mar 2026 07:35:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Keep GCC USB QTB clock always ON
Message-ID: <lb55o3uw42oxye24q7wh4iqxb7fm5xhguskxqvsmapecabaf6v@id4bvdec5tbb>
References: <20260316-hamoa-usb-qtb-clk-always-on-v1-1-a29ac94f20f5@oss.qualcomm.com>
 <gvj7tsivu6w2fzfcus6oi3pwc7jcfqdrx62uuzny674mj5ftus@dpnn4pzizbqc>
 <388c4c45-2338-4520-abf6-6a15aeb5db42@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <388c4c45-2338-4520-abf6-6a15aeb5db42@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 1kJ3kDHxJT98FshyHUOHNXHoD1-6YFna
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69c0d113 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=53OENFOcBHDR1HQKrTsA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA0MSBTYWx0ZWRfXxRgOLA1UHxXY
 zd0bf8lR/qCrEp5/vkB8/0unT/TuJNnjEfZyMTb0zn03Sdkb9rrY0cQ+IUNC0lmQmj4Olj3atWv
 Qp2AJBvL/LPB12BwDhawRCuQ0BItrPEF69rv6PbgXz7OHNC0D7G9JnSQBaL2TFG5meIm0+oZUpT
 /Yu+q/zwXKUylra40Kc8lVV5YdcweoByjHnNQRdvj8zYILUCPidTgEYHvvOpp/ojmF79g+LZKFO
 Lbcmy2aaqRtINb2ILsS7cWBOcTA/2E/EjyiDwYUsnwGP8Q2WJFogDvLtfQawm3QmmYDpPbfuU/P
 sCX5tDzbJgCAsysGYukcu6MnmUHzLC+rgzCpjU5nGjZSOSt28ZT0FsjNIFZsyyWNUN6tjVrBgDk
 K1FitMEPBzPfNedFDgkFWH+Uf/c3sLbHCiuM6y6dQK06X2b5keIeDf/kI7s8VdyRKmwRz8Jjmsz
 yheJyS5vXCvu4QXdVgQ==
X-Proofpoint-GUID: 1kJ3kDHxJT98FshyHUOHNXHoD1-6YFna
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230041

On Mon, Mar 23, 2026 at 10:26:53AM +0530, Jagadeesh Kona wrote:
> 
> 
> On 3/16/2026 6:26 PM, Dmitry Baryshkov wrote:
> > On Mon, Mar 16, 2026 at 04:38:21PM +0530, Jagadeesh Kona wrote:
> >> Keep GCC USB QTB clock always ON which is required for SMMU
> >> invalidation on X1E80100 platform.
> >>
> >> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> >> ---
> >>  drivers/clk/qcom/gcc-x1e80100.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
> >> index 74afd12c158c01c121d9aecd56e65c0c302d7cd0..73a2a5112623e5190f41129af7fd76a86603557b 100644
> >> --- a/drivers/clk/qcom/gcc-x1e80100.c
> >> +++ b/drivers/clk/qcom/gcc-x1e80100.c
> >> @@ -7480,6 +7480,7 @@ static int gcc_x1e80100_probe(struct platform_device *pdev)
> >>  	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_VIDEO_AHB_CLK */
> >>  	qcom_branch_set_clk_en(regmap, 0x32030); /* GCC_VIDEO_XO_CLK */
> >>  	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
> >> +	qcom_branch_set_clk_en(regmap, 0x7d01c); /* GCC_HLOS1_VOTE_AGGRE_NOC_MMU_USB_QTB_CLK */
> > 
> > Is it used during all SMMU invalidations or only for those related to
> > the USB controller?
> > 
> 
> Yes, it is required for all SMMU invalidations.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
