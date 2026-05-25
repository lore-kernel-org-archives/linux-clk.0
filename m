Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613DF3F413A
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 15:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779722747; cv=none; b=sqIzhdejIi8SfxRO8JCY0F2H4JQAO+Jebt7PygLWoQPBp91dGPW32iBJwP219Y1CtSXTlZWy9BfwKkRJ6bnBmW8qTPTLPPuaw535x+ADcy+wZu2398B5X0VEoi9UI2SHx6qmzhIRpGV0Gbt47x5To+Wc9fSMluXN74/pPhdYJbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779722747; c=relaxed/simple;
	bh=s2POYjk8QAQW1VKj3Lnzj1j05Q67m2Y9kxI0+l1J/5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5MCTFlctgXsKEjYzkRx/mTsjhNUpzZ0n+kFD54nhw9nDvHGrdQpKLQHYIMuXB1e/e/uq19t3PJnXlYrkGFTrgblgY+Yu0riHFKfctIqQctSP+UFeyCGZkmcidVrJsrfHoLEmC90T/UNjh3837tJqgBrCptSg3rqKtEEuAfsfEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gFFZCQOB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J+m1dIb/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gFFZCQOB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J+m1dIb/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9cwBF1802808
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 15:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EU+opvXvK8b9RLhxTcj6h/IT
	TVsJ9OckkeeV/g6Qq/s=; b=gFFZCQOBA9rItRfKGvBLw5AsGNL8VjEhMwXHvECJ
	R3Lf13w5JuJ6M4w4bMP8vfgtg9v4qU08XMjnQYXvb1nhQQjeLgJr1EZ1Viue7+v3
	sh7qcVg125N0R+NTO8hX5aOEp4xgW+Q8U6qy9arTvHvLSZZJYjVjFNh8sQA4zD55
	QT6BKeeCkE3tJY1t5FbpL6ltr/0IQ3nQBQyxr+JvpT22ab9HJ6EYKLShDR45h0Yh
	/HjyuSjQTJcXYA8KG1UcuZ9puh92Gybhc7uusjN/gn3y3O6vFQordeQDppKPX9CN
	tgZEtl0WFihTS5+RoQ6+BSQRu9V0aQq5/u8E/ovS+Hj1sQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckyqh5cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 15:25:43 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6443138516bso13643156137.0
        for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 08:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779722743; x=1780327543; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EU+opvXvK8b9RLhxTcj6h/ITTVsJ9OckkeeV/g6Qq/s=;
        b=J+m1dIb/43Gk+L/Ot1AraDvC6a7wcFOCDuU6ISdwcYyAfbOdqIBZIjNUixv2b71kUi
         Ahabwo6e5X4CNy1ncbWZIEhjVNQv3SVsCQ0vPZ/CE87iRe2AFUDm1iQCOHY+wqcPFqJ6
         skAyf2ksD3LnurbnL3MQ/7b+mJsy4aEB2QJjP3ybyPYdbQaP2tuFd49iohe/h0Tns834
         q+VyWlEl/eXn+CiSiHBIwj/GjWli2aUXrzMBtAwFazymUBQbk5w35107DQQMBJCQM8qg
         koQSSN96B0Kg+zdWP6KoNIRMEAZl4KZKKC0FcMTp1O3HgfdlOjMm9Z8Hlr/4jked8OQx
         hLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779722743; x=1780327543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EU+opvXvK8b9RLhxTcj6h/ITTVsJ9OckkeeV/g6Qq/s=;
        b=MlBPGuJ2151rTB57U10vXzUJ79GRWFqsT5rmOVJ4WY72EfsgjE8LfZ4SPzVLNOIyi5
         UWO1G39ppx/ZGPnt5SprsOnmKbKCHT3kkrYe1CcskX94iJZY+Y+DD2NjMb/DeM0wbeJE
         J8cF2+VVDhGfAhrai5Sm/z2w9PXKSim5JvmHM9y5vUDlbQrAkR8qrWldlnPRq/FO+rWY
         Pr9IQdy9e6GpiL7vELz64lTcu3jcpTce5HTBFak7IXH8CbneRofU12/yZS8BSGj1aa8B
         kBTms3x/L7M26T725hcg8UxSim4f33KJZ6N6ppF0juF8+iR5YlzjWtdP3EmSpVzZIDTC
         Akvg==
X-Forwarded-Encrypted: i=1; AFNElJ+cvOeNN4eT3CEWd7Sur4nXQxVXUVwyW0JXJK2NmYXSxi1/NjAWYPyH3KijVE/NmLw7OOIQlXG6zuI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8s61FFQdy1ETHNpU3XpydsuycGG74KGLR8wi5V9OF3zo6pGBe
	7M9bXwRnLVjDgX5nmdVRp1Apk4MiifEeqrPn8KximOTqPDQEpsjA6dIQsAIeHHoeOnlgm96PT48
	nEl7nDpe5t5gTJwjzT/fyf1uPm9BHPNx0OIuRBNM57wjkJ+zRm77XtPD/G+5QI+qzCO14mS5/bQ
	==
X-Gm-Gg: Acq92OFs3skx8cqujiN+a6J5sK/ANQrvGn2jb4uW8HxqEMIJpoBn0dYYy0FOOcHR3LX
	ru/uRBzqf/tSD5x8EkkS4Lx85q7blosfMHhtDaQTg4vX8gEfrEK+89+0uICFtxzV3tjL27rqGrW
	XWuidEPnZIZKSsbabD0H/3jgw791np+1Cr1QIBM8XREAfXlTWwyGBz657hWelvwGxEP5PGirAYI
	9WUkKLMFEovkALYDGw1DGYofOdFnUQWLzBJPFHfgowNYhh0l7Dc1rabgGXo467r6aqADRQTrJKH
	07d+SWKvVMSMLg5mRi0wCAl1PjiFvBLcJGGgJUkQrf5GKRE/biiZ2g8ECc4qsqqhP/8fHKpNu8U
	XgIapNwW7jcKbKU13eobKkcjCnPAb/Ditzt5eyy4uUdPh8c5G+al3dAj07icl2jv7+mpnynxHFF
	cldqwjEzveKMdE52QkJt7zOQQq1pN7BmZu1ac=
X-Received: by 2002:a05:6102:4589:b0:65b:c17:70b4 with SMTP id ada2fe7eead31-67c5f48e955mr7481405137.0.1779722743010;
        Mon, 25 May 2026 08:25:43 -0700 (PDT)
X-Received: by 2002:a05:6102:4589:b0:65b:c17:70b4 with SMTP id ada2fe7eead31-67c5f48e955mr7481391137.0.1779722742588;
        Mon, 25 May 2026 08:25:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cc08c0sm2725059e87.36.2026.05.25.08.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 08:25:41 -0700 (PDT)
Date: Mon, 25 May 2026 18:25:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-ipq5424: drop the CLK_IGNORE_UNUSED flag
Message-ID: <sv6sja7rdwz6ke525e46zpfmtp4wht2vboxwwpyjnmiezibhhm@pbuvqlpkjpb7>
References: <20260525-ipq5424_drop_clk_ignore_unused-v1-1-7ec63e347f2a@oss.qualcomm.com>
 <pa3xr7dqro6yxo2zsydnybu6fomx5su2x2ccawjndzd3yqubly@esevqd5q5jon>
 <005d1637-ec56-4f4e-be99-04386efc2524@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <005d1637-ec56-4f4e-be99-04386efc2524@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RMyD2Yi+ c=1 sm=1 tr=0 ts=6a1469f7 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=cP8gHpZDPz6Z602etIwA:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: 3FLFIsan9AUx0i-OCCsjewdkFSfKxPOP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDE1NiBTYWx0ZWRfX6YrMa/i3SItk
 ZsR5rIg7Uqu/5rsWSmJDbtgl75rCF9DLD+HQspworcud8MfQv/zBs4JxVG9yR9qiNSjulQFlpoi
 /SU/Ex7lnDyqPwMYH1w6KoQm/9GlXxwga5NbcGlA8F8WK+0Haux50B1kn2jhT3gZcuROj0gWjea
 rwne0i9uisx4B6zafE32Jf5LUzdv/E9o94Ut72CJsr2sJvon3dFXDQWsJTiG6P+7l6A7slVKMtM
 EWMQGdjCN4EVr3QpjznT/VdEwR7PQVqhsu5PdTN0seK4hWkRd33/PBR5HSBVodFrDs/3qEJZPvT
 qBEAc5ND1SsLgXRvdaqrqiT9T72ey314Bw6x8CZGPioYPSqJhcmPOB1cg3hnL1I+JL5ygPrdvyn
 SW1+lPkB7SuPL1qVWtcDRmaqtakG6er4OgiMMfCObldqJZNs2hUVfMobbd193bGJznzTq9qeeXS
 X5asoXM3XkcuWf2vhWw==
X-Proofpoint-GUID: 3FLFIsan9AUx0i-OCCsjewdkFSfKxPOP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250156

On Mon, May 25, 2026 at 08:35:16PM +0530, Kathiravan Thirumoorthy wrote:
> 
> On 5/25/2026 3:39 PM, Dmitry Baryshkov wrote:
> > On Mon, May 25, 2026 at 03:07:17PM +0530, Kathiravan Thirumoorthy wrote:
> > > Now that Linux has the consumer for the GPLL4, drop the
> > what is the consumer? When was it added?
> 
> PCIe and USB are the major consumers, which got added with the below commits
> and landed in v6.16 and v6.14 respectively.
> 
> ab7f31a3830d ("arm64: dts: qcom: ipq5424: Add PCIe PHYs and controller
> nodes")
> 
> 113d52bdc820 ("arm64: dts: qcom: ipq5424: Add USB controller and phy nodes")
> 
> While I was revisiting the code found that this flag is not removed. Hence I
> sent this.
> 
> Shall I reword the commit message as below for the next spin?
> 
> --
> 
> Since PCIe and USB are enabled and consume GPLL4, there is no need to
> keep the CLK_IGNORE_UNUSED flag. Drop it.

Yes, it would be perfect. BTW: what happens if both are disabled (or not
probed at the boot time)?


-- 
With best wishes
Dmitry
