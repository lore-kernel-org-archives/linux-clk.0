Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927A11F875A
	for <linux-clk@vger.kernel.org>; Fri,  1 Aug 2025 07:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754033333; cv=none; b=rK1uPJL5PngCFPqbytz4yr/AWORoVAoxZV4EjkNiKKtQU7uzfN70nxT34XuQrhGQCVZOzdMobw/bqrj2AJv3f5FyatsY6gI06a7e6+b9iXWH7e9+VMQx7reGznX13H4nC35/he4c1bCYcUvROsPEMUM8vK8Cryexy48iMUCqPA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754033333; c=relaxed/simple;
	bh=uje34Clhxc9ed3OvxabKenVPdmt0CPXcdy8D3hIZoOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RCRyUnrGq8xSZEG1sHt+g6YfAvsAbRMIMA6KQ8dqh7Iqh/Ti1ITVfSI3rgMfgpE1/Tr2z08k5yDbyMTWqJuF2a9xX/o3XGMaHB1/BfLXLPmMOA5pGp8r6QOLBO7eLXTsJj+z4QvuMyjO0O/YG8yL/IPKjKWQcAyppUsl0GjAvHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O1uFdYDQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1uFdYDQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5710u9BF018796
	for <linux-clk@vger.kernel.org>; Fri, 1 Aug 2025 07:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SEaURvMuhrpISmuLvcJOsmjb
	sYKo7gxuFeBHJJuHpIs=; b=O1uFdYDQUFjkt3tWSJopVDpW4gHMl3YUg3/ZmnCp
	vyXVwxKHRaaXtxLH6QGyC5SsEg8RstRJXYyDchnCnX2smDhEwBg3RPBb5kjbmODF
	OiCvdSTp261A82wqCsLMdQ3VjSxPY2F405rtwCCnIjInzuTxKKzc5HLFery3SBRf
	01NNE2JjX+ItOyjW8BA3LKPbAC4t1TdLDI9oe2zc9t4Mdnaw0WGFMKWGELFQNmto
	J+xw8Vd6aenmrluBIVwcDNNssypSTSLQdsPnq+5AQLb3CNp0Xez98GyP5sK/VJYg
	7MKH8I4z58tHQEmW5FjSHVbrXWyypimjJQlop4wseOFR3Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwgfctm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 01 Aug 2025 07:28:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-707722d08d9so30486046d6.3
        for <linux-clk@vger.kernel.org>; Fri, 01 Aug 2025 00:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754033330; x=1754638130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SEaURvMuhrpISmuLvcJOsmjbsYKo7gxuFeBHJJuHpIs=;
        b=GQGVHQsqk/pRcRkxA8ON/HIWVkK8chxStwACHuwUjo1lVYjtIDGv9loNQ8dQeBdiCp
         VEaFLvtNJquKEJ37TdVvqsc+JI+APRpWc4hwSB7GLN8IDdaWOgPkskBMB/Zx1o1oob6F
         z6n3sNXaC1uETMA6gd9Gm4XK3Th9V/qkvtUUWbrdRVAWBzMeH2sXG7yLXm+Y2mzLZkEP
         /jVEys3Ag+nxu0Mww0MVf/jYXVNj1pduGw27jM8BQ+3uOUI/CMAGRDNi2Mzq7n/ccyO2
         g5rQFx1Zwt6KYhb7hb0w41+rwabpeneCxRrCTPMVMhIie1+0Ec8zLyI+/mZfFgg4nFnn
         4RGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN3B9kkBLD60qsAjWhZRxM8SaPssuAMa8sXuCYmAt2mO3WjdD7RYzCbMpbEtP2s4PndL63MsatO2o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw64eu2KD5EVjQUqD10iEbdfSOEDmVdW2O2Xyv/c3FbupUa7sID
	7xATB1AIwBYBWTtHLZ+on4dMpeAxjuvzV+QP5uIwqXCpB6RZD4VCyqSZC72PbqZdNTF8MpwC1dZ
	otJDsdPhBBPVyWpqVxn6IlhnaiVRJBQMkyT5pBkoXlKJYD2Bt0ZfEi9CBOhvGeT8=
X-Gm-Gg: ASbGncsncWzfk5vVCVkqNwWOTUcCK9jkyFFle++NNbuu3TGN/ZKg06SaxfXkJ2Z6Mng
	kaCEcE/qgFlTnyucY0GiKHCDfRX9WYiVNjH30MgnmNGwNzWRNG7vrPtvgG8pkJ5lhcWN9xv7AHq
	Ife/h6CbW1y9G5IMP9R/px6zkjJC6hdK+vW31cnAhRhBCRQZIj2fBIrHSNd1Oc1UgONyysQ3y0w
	RD2bXpfuRs4QO9m6xHoBFRgASjlFZFeWredmbUGTh1XwjTnqEuLLm3GIUsaJww2WxJI8CFc2IOS
	LeJNBAo25q256Y8CjMj/X96Y8mjTNJlY2pMUvjJCUTPduxR3ggIT1OfKRlaEmBUMZkcIcCFtEEB
	piBbaza6duR9r1zeRnsJIlVnZ24Cf35NxaHrfmhTEpViV2875eX5/
X-Received: by 2002:a05:6214:5014:b0:707:5ff2:ae87 with SMTP id 6a1803df08f44-70766fd9ee7mr145991166d6.18.1754033330128;
        Fri, 01 Aug 2025 00:28:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrm4INQ8xRvxOiPxAKfgqSB4rKDWYbtrN2Ds4wiRVfGNrMLXg9m6Lrslh3Tkn/TEPfHOs1iQ==
X-Received: by 2002:a05:6214:5014:b0:707:5ff2:ae87 with SMTP id 6a1803df08f44-70766fd9ee7mr145990906d6.18.1754033329694;
        Fri, 01 Aug 2025 00:28:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898becdsm489500e87.37.2025.08.01.00.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 00:28:48 -0700 (PDT)
Date: Fri, 1 Aug 2025 10:28:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, kernel@oss.qualcomm.com,
        Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] dt-bindings: clock: qcom: Document the Glymur
 TCSR Clock Controller
Message-ID: <xkjmukefiaiect3x7b56dsn4zrddl2fvlgqtfa6yelanak4tih@owimyvx5qlf3>
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-2-227cfe5c8ef4@oss.qualcomm.com>
 <20250730-mottled-myrtle-bull-3ae03c@kuoka>
 <9cb06263-2a61-4acd-a9cc-157abb832d62@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cb06263-2a61-4acd-a9cc-157abb832d62@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WvgrMcfv c=1 sm=1 tr=0 ts=688c6cb3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=6kVuSvOnKxEqxX6I_6UA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: TLGPco5mEmBbVYbC5Vk-q6_GUfpIr7XO
X-Proofpoint-GUID: TLGPco5mEmBbVYbC5Vk-q6_GUfpIr7XO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA0OSBTYWx0ZWRfX1ZaNkBRgsOn2
 +eBPgElcp5CBEUWaqo8uJk6IDTEtcNOA/OHOyikR1Z3fFeArt8LOhpSG1ASUdOiAYqmWKBe+2Xg
 1FxSAIZDyVd9sRNtHbtQZr4sy/X2zf9Tyf0xFgYMmpKLwju3tmP4zhxFhYlcqLqFaQDN1GHM3dH
 ZgUNt9oXmUY7BlFt8hRBDKjibtIXlidbcL86v8x8cYVOp5RQy3KKwHKRVtdAIXS+0Pml6rpg3My
 xvVJ0FTncBnI13JBLraWOmwK2rpYR4wXkevCtZ/CqBYPmVRKQBm56hUMnyR1W/fu5goN9AGXrEp
 r8Byha2Czn+t3Hl2v80CuIoz2Pq2Qk3b2W3LtbqpzDadHLJF3nxoWfgAI8Yh4HyoK80N7EweHCQ
 EkS7h0r6+QnmWEX+5kVzYWaP1WtZFjQuPwBTJPu9mONpHEbn03cNAKiCqlElkIL1HkxMy4ou
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_02,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010049

On Fri, Aug 01, 2025 at 09:44:47AM +0530, Taniya Das wrote:
> 
> 
> On 7/30/2025 12:47 PM, Krzysztof Kozlowski wrote:
> > On Tue, Jul 29, 2025 at 11:12:36AM +0530, Taniya Das wrote:
> >> Add bindings documentation for the Glymur TCSR Clock Controller.
> > 
> > Same question as for v1, what is Glymur?
> 
> Glymur is the Qualcomm's next gen compute SoC.

This question means that the 'Glymur' name should be explained in the
commit message / cover letter.

> 
> > 
> > Where is any DTS using this (or explanation of lack of DTS)?
> > 
> 
> Krzysztof, the DTS will be posted separately once the driver and
> bindings are reviewed.

Same here.

> 
> 
> > Best regards,
> > Krzysztof
> > 
> 
> -- 
> Thanks,
> Taniya Das
> 

-- 
With best wishes
Dmitry
