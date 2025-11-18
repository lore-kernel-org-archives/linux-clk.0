Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C486528002B
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 04:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763440489; cv=none; b=ZIYWvMiJ/65W5cEKXpP1Bs1W90BxIjQKHZfrvxviDC6cnnTewTj/TvO05uko67BIMkzMc69C6SvCNyoDIZExMcyNh+2DuQ/5bMPuXkq8CUPKDyIl9k92yBFS7zupvalJ51goYpWDDUMkeP0skE8SXa8Z7gMvYXW/2H0njszppkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763440489; c=relaxed/simple;
	bh=eFPmGiNcQ+eKpI3pIVJZQEIPer6AtMRNpKmkQqg1LpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xh0heJtWTy+JWa0I+ZrtCGPRrIffvj6A2nrWH82pGd7cbVUdORPlDPg6odQ0JpVsPssy77DdTh7P92KgN3GZurONymJn6t0xeI5s6EDwLfRpkkXYorDn4rZKtWeXhOdPSEtmzxE3KLCJcTeC8B5L5qHoRO5kP0+VpxtyphuqFg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgypgRjX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kJvd4CAj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgypgRjX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kJvd4CAj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHKI0Ev1106928
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 04:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	96sL93DbfW75iRtuX3LpfQmBg7hrqKggau4HYAGX3mU=; b=pgypgRjXry5mXmY7
	5MVNibDYj3m4BrQLGxkOPBO6eZS7VItsFhexohNW/ua0U/aabmmZ6P4HjSOpzlZj
	Wlg+T+A9tLyDXUuwdBhoQFBKQF3PKy+XPYaeet580IT4kO9IekrHSnxejO0PQPzA
	HfB182To5jOaEozE+WmK4HLDx9tf2WqjBnCMzXHtrEffLbfjo1ugh5ak4yqmuxIv
	4QZsNaENV69ogsemYAG7rSkaaEChG4pZIi16F7YR1KSy/rg+lcdrzB9QrrNMNX/r
	KbdTaPSzxLVVZr6OQDrdO7mHWekf4h/aV3AHlVTScBo5IzRerhzzPQtmIyzDk6pg
	v2KUZw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2hpaq9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 04:34:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-882380beb27so49317076d6.3
        for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 20:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763440486; x=1764045286; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=96sL93DbfW75iRtuX3LpfQmBg7hrqKggau4HYAGX3mU=;
        b=kJvd4CAjm3Y1/x58S4xNtoEEfN8Z+GMyZZydEg5qFK4Hhx9MmWq2JJ0QU1Hjq13i3S
         JdfrOj8nXUhJBqhQnd28xvE0tcxAl89Ni4M6m2LkZ50B3TXlUp/ebduJTUVji30/MMWt
         PiDR+UTtRluo813eURCZJPVbcaWANKKuUpWB94ZypNyecJnGu/HryAz1V4sJKsCDMokR
         YONWr0ssacF/MfQue8u8Mqng+mJlWXqgsSCIEplFJguUlPQp+rN4LO9ngRcFuHZNbVsc
         fUo2BRg5MMq5/RlxZnXFC+GjzOex31K62ikggQdANI2t21Q5f+5Ty8O/DdjDQ/dxN9tZ
         zgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763440486; x=1764045286;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=96sL93DbfW75iRtuX3LpfQmBg7hrqKggau4HYAGX3mU=;
        b=l5Wje4Bxy+m46fFws5Lw5LtZzlt6GY7cAoyHhCn+Zl9X64CD98wiEDTQqGKAnZiMCa
         sj70724RZDCzCcFJokYtCIapJKtQZ3P++JDl+hSSi6Mri42/aTGsD303APBS7X7/BrEh
         34UAuKKhWGI/BQ9jsp+ll6dW5t4W9tho0x1+ZbceJeFelmc3rF9QMK3+eBul4ye0GDZ1
         sjyUYRZRj7PlgmHOiiVF/9HHWstE8jB962+P2Phsho23lBNQuF1juvyk/5u5j0sx2VS1
         3LD6+TORplIbXTIA6Irg4shpBqIh/4Aw1TYiWI4qrvGNaEEj6W8DX+wYk2THOLkY5BO3
         9HMg==
X-Forwarded-Encrypted: i=1; AJvYcCUTRiazDR3+BhJYyhgvYcLBtb/haZ931I4O68CM9AVVhe5E6DjKStccopyznn2KEGO4xwYU8BmonEE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpSkiHbA0arDE4wmPFpwgcK+hvuC7xEKFe3CylCrlHOs+yRlMi
	kKnZPT1bTr0kkE8/4plvdDnpU/v3Qej6QZojY5BlpIqxhXWGTwCPrDAbVd0WiHMtCXdukiL5xwW
	UMCJUxlzTFJvgq4oO2G05x0UDl/nrCS416fxbiykHZGw+CY1rVIXO/zi9AzhB1as=
X-Gm-Gg: ASbGncvX9mFVQ3FWoQVpjP91jGpG1CPT07vXjXRQ82irxBOInXHQU8rffSsfhU7m0cj
	Nv/PS2Fyx/SRr9cA0PWpY2Nwb/7g9NryqwypT1WOphjj23YcZPDS2rHoqIZ5d2UvtRw7RTtLXp1
	Z2JBBifxoVVLu+4GGN1jvwwWHoPM+DHLumyl0K0AWCcObbL+gGKcUWXZL/8ysoriGq8auqFAJZH
	hIij0BV1fhUpJbu1tIzrbr8cpBOLUgjlBIzMHaxzWFHmx6ACtDVYCaQCGmwndvpu3MrGDhUXN6I
	mOArdfhkuh2axnUdq85WgYbhVyMnlK8QjwckTW5sQtNC+g9VI5qiAEV/H/OK0VH0yk5e4uPOqaI
	S1lIHJapwJfTcAR6EOclhGCtlKuVaZ7ASzq5T9NvwBDixVr7aTNIzy/ArWfsCgFF2DVC1GcWA6u
	ABAoj3sbMSvR34
X-Received: by 2002:ad4:4eed:0:b0:882:3f45:c828 with SMTP id 6a1803df08f44-8829267b3f0mr236988076d6.36.1763440485956;
        Mon, 17 Nov 2025 20:34:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCf3qbFNFO5bHbuNUf8/Vtg4In8NKMDI2VdMnoM8rjfEpd0ZJkeFt972jCERyiubWFLdo2Xg==
X-Received: by 2002:ad4:4eed:0:b0:882:3f45:c828 with SMTP id 6a1803df08f44-8829267b3f0mr236987786d6.36.1763440485531;
        Mon, 17 Nov 2025 20:34:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040595csm3649383e87.94.2025.11.17.20.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 20:34:44 -0800 (PST)
Date: Tue, 18 Nov 2025 06:34:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, jingyi.wang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
Message-ID: <j2fwz5vgzydi4dvtzegmwz25rukazf2clk5ga7ikvv5umm2jcw@edgrznbv24hq>
References: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
 <20251030-gcc_kaanapali-v2-v2-4-a774a587af6f@oss.qualcomm.com>
 <swma6lyjfmyhl5ookdzvpjn5qresgsze5wptg45jfgj7ub6a4t@bdgfstw6gzoq>
 <380aa79f-f334-44db-9527-85247f9735af@oss.qualcomm.com>
 <2jfvrt4r7ddagh2ztbad7qnjpcvulcrtr3ekul6i26qg6zcd44@dxfhl3265okx>
 <cdbfe200-314b-4185-bb58-d528ed317610@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cdbfe200-314b-4185-bb58-d528ed317610@oss.qualcomm.com>
X-Proofpoint-GUID: h6ECSzE5-kLv3tOvXyMqnq8vNCdxeTHP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDAzMyBTYWx0ZWRfX2OIELowJgLKX
 iIdmLryLUFC0xI12pkgblPsAvv76J3//3GkvCAdj0ETJkktD59yYRjYlZsB2pxYnxAaBi9srCbu
 8SMoAKe9v0tVnNGkk7dIzJUiw6Gk/d03nuWkhkEpukzS5Dtf0H6pLUq79j3VnxsCbyZx5h7fWyH
 u6h1PzBdT2Ef9v6VoRP1yBUCCk7kkKWbfhfdkbMSUTLxj2cC050QmDK7PRLHYok/APHv1gi+wUo
 fwZRRlgDBEyFO/eIbBLvls+J4L0yxIKWUiPW1C1whTL2zaVaBz7ck9uLqjdzLoMoFXvz0uQ2s70
 MbAM14SyrfbVejJJitrAHlDIYCyy4JcbHyx2FrRUM4YA3utTTAZw0BgjHhwOJrV/Z8ydGNFoiiZ
 f2xDA99VIG1/oyKb/N208OeX5W0oHg==
X-Proofpoint-ORIG-GUID: h6ECSzE5-kLv3tOvXyMqnq8vNCdxeTHP
X-Authority-Analysis: v=2.4 cv=Y5L1cxeN c=1 sm=1 tr=0 ts=691bf766 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=R_MjEz8UllVMvTsHhMkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180033

On Mon, Nov 17, 2025 at 01:28:46PM +0530, Taniya Das wrote:
> 
> 
> On 11/14/2025 4:38 PM, Dmitry Baryshkov wrote:
> > On Fri, Nov 14, 2025 at 02:13:49PM +0530, Taniya Das wrote:
> >>
> >>
> >> On 11/11/2025 4:16 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Oct 30, 2025 at 04:39:07PM +0530, Taniya Das wrote:
> >>>> Add the RPMH clocks present in Kaanapali SoC.
> >>>>
> >>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/clk/qcom/clk-rpmh.c | 42 ++++++++++++++++++++++++++++++++++++++++++
> >>>>  1 file changed, 42 insertions(+)
> >>>>
> >>>> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> >>>> index 1a98b3a0c528c24b600326e6b951b2edb6dcadd7..fd0fe312a7f2830a27e6effc0c0bd905d9d5ebed 100644
> >>>> --- a/drivers/clk/qcom/clk-rpmh.c
> >>>> +++ b/drivers/clk/qcom/clk-rpmh.c
> >>>> @@ -395,6 +395,19 @@ DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
> >>>>  DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
> >>>>  DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
> >>>>  
> >>>> +DEFINE_CLK_RPMH_VRM(ln_bb_clk1, _a2_e0, "C6A_E0", 2);
> >>>> +DEFINE_CLK_RPMH_VRM(ln_bb_clk2, _a2_e0, "C7A_E0", 2);
> >>>> +DEFINE_CLK_RPMH_VRM(ln_bb_clk3, _a2_e0, "C8A_E0", 2);
> >>>> +
> >>>> +DEFINE_CLK_RPMH_VRM(rf_clk1, _a_e0, "C1A_E0", 1);
> >>>> +DEFINE_CLK_RPMH_VRM(rf_clk2, _a_e0, "C2A_E0", 1);
> >>>
> >>> What is the difference between these clocks and clk[3458] defined few
> >>> lines above? Why are they named differently? If the other name is
> >>> incorrect, please fix it.
> >>>
> >>
> >> Dmitry, my intention was to make a clear distinction between the ‘rf’
> >> clocks and the ‘ln’ clocks. Since there could be overlap in the
> >> numbering, I added prefixes for clarity. I should have applied the same
> >> approach to clk[3458] as well. I will add the fix-up for the same.
> > 
> > Why do we need to distinguish between them here? The resources in CMD-DB
> > don't have such a difference. You'll select whether the clock is RF or
> > LN when describing the platform data.
> > 
> 
> It is more for readibility and maintain a direct mapping with the PMIC
> clock grid. This way we can immediately identify the clock type without
> cross-referencing desc as the clock mapping here would indicate the type
> of clock. Yes, the CMD-DB name does not reflect anything with the names
> here. Please do let me know your suggestion.

I'd prefer if variables reflect CMD-DB resource names rather than the
actual clock usage. In the end, platform data does exactly that - it
maps usage to CMD-DB resources.

Also, if we follow your proposal, we will end up with ln_bb_clk and
rf_clk referencing exactly the same resource, causing possible
confusion.


-- 
With best wishes
Dmitry
