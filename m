Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304F535E952
	for <linux-clk@vger.kernel.org>; Sat,  5 Sep 2026 05:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788587365; cv=none; b=tSCjRR1iQVhDwzidOSQACBs1J19yw+wRqeNuafc7pDyG4PsQAqHJc4gOP1S752EA2oSN44frVM/94HrYDhoOialZ7BcnkZr5NDdmRboVsqVeL/mVW4vnvwyzbRVSHM/rEnxLRBu1jdRbKY1cBYuu/wKIYWG+3Kx3FIlyqaqBD/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788587365; c=relaxed/simple;
	bh=QsTgVmF9fGNlHhs8Dotl41agIQun695iLSHi1YGphuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6G+bCdaW+bDtSibRzszP6SYDluIA54q8EU3ODvrNxttWry7PLoFPlkfGnM+t9cjgCqD27bsFrzFxUIiUPAEi0cclRMYCuB1HUHO/3Usk+NSCzIq3GzxBRafAzBBMrzY5I7AYtTXunLjf8uUCbONIOed4zoQ/Kzr/UoW17aNoWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVKqV6re; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q3riFkxP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVKqV6re";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q3riFkxP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6854pxZc1970851
	for <linux-clk@vger.kernel.org>; Sat, 5 Sep 2026 05:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=52LwPd8oEeP8aoMnp7OeFQ+L
	TBv871tOQHiSe7XaJQc=; b=mVKqV6rexTYjLUQtZchTmL4fsv16ScWTpEQc+2Ep
	QL/5jAT3so9YJwRPo4L4+bGCqy9eq3eXF9+Q8C4eBk5Nbso1/svOGkctGFy/GX9+
	JoyQQRrBkFb/e8t2iHD18rWAE3IFZNY9TVfs0vDGB9KQY7KAUTXtUy2VmlSrlw9l
	1Tmt/3jWRC617sPZMJzrEpmijiKrwCizA8ST+bcaXK6dTX3c9FH0Obm+vtuauply
	ZLuph5byIU8KTyQQ6BLphCJm1Zf7rlX0kvc4N0FN/hmsekSDoA8AAHzUGYqIJT80
	LiokmLwxsH6gdckFgg0y6oci40Zrak+4t8AYFhdNDk7MQQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggany09w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 05 Sep 2026 05:49:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so292400085a.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 22:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788587361; x=1789192161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=52LwPd8oEeP8aoMnp7OeFQ+LTBv871tOQHiSe7XaJQc=;
        b=Q3riFkxPxsFwHnHbKolsH790zFfjT0EKDPTRxN9HKpPdQwRT5a6FCV2kO344z5vWMB
         AufGKbadGvPAww2exxpUvXBriZUkjrUcNAx0Odx/PtYPAhrYDLkcHtkRCZOualaV2Gto
         Mdv5Soe5M8cBwpBumu2DpA9uXDLZ13VsdhPO3wWbXgw1GFClBtZ8E9rAOmWinYOHLPEa
         VzO6jKI2dSZ30e4Umq8EnLbrpUy+RNy9xFd21r+WtPPZJwZIVKM0ls7z5KRomKeb3NWD
         +WVzFKs6uKJM9fSaVP+eyekPU0fEmCcTA3I/nFLNdYCCy4ArVWt/ROJ1O+9CFr01NnEJ
         EuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788587361; x=1789192161;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52LwPd8oEeP8aoMnp7OeFQ+LTBv871tOQHiSe7XaJQc=;
        b=P9qrBrZZd4ISc2EDTQvr66IXLPKx8QbL3tyAqw1d9eurh4zQX0gxCoEEE47j1eRk1v
         OjZpOFyORKXyqxnua8+vSjRC1vvzKNcWVl9hu7xYiwAnkPxDSImIQvBAQdkmDoS2wloh
         FUW+84cg+0yzlEMseAZxNSaQSSYhwD21Ie2lurTI1vZP6/pHx7eZxy3e0voONYNJoXhw
         oEjpwqoZP1rtDGbf2pG7eSHx3IkwiOJHYeIUzdwFChrhAs7wN7wirfb3S8epakbFrigC
         1/PbpJP8VeI3Xn2ELw7l56ksWon/ZydD+gkzTKR2galhfkTp/i4ycDEyVetCfWhwD09o
         /BVw==
X-Forwarded-Encrypted: i=1; AKwUvBycPwrSwHjlYE9g351J0YD20tqPhVaFHnntP0vz4xTMSVsnac3+BPF3h42GaGd9MTq0HrOfbxIBHKY=@vger.kernel.org
X-Gm-Message-State: AFuF++maukyclhGu7vuZ00gpNIO72miE5z+AhvnKkT+dKjbMx+JYOJv0
	r3dAE6jipde3AoW3epFItuBO6b/xVWynhoBitljV70DzAR5GH51mCXX3sbrc5djx61Augcs1Ovb
	iwcCIIfIOpNqPDIvPKiSOjdB+w/TTLwmSNjqVtx2W7fvwixISFfwToxXMhnJqEpo=
X-Gm-Gg: AYBFou2I06jsfOoJSVX3Jx1YOTSf26J7ZX7cQovwcF94vO+H8OzR/krSwAPtPmqDtog
	mZOyPvDolXoHvMWr3h77MKfFAGR6voXRNIfhg3crBxvr1R+qmq/7siy7UZ4cUTOC7SHmFYhvCHT
	HSi7fG8LqomHmwajpmzZ7oC0jiwHLpWvblBU/ODjcgOvTP/WBCqUX3yFI0C5UVFQYsTPTKiBiLz
	RJuZ2EJY9XlsAKMBV0teNoSuBVTobwgboYNC7V9h5590O9RWq77nkYqX7ftFdEmb88PPF41TaCO
	BKaaXzgO0GOoB+ID1cig3x1DGMt95TnQUlL/0APJj33T9JPzNjdIbQOXi5l2sxIE0FoXiSwW75L
	IRyJIVfTN+sUSDw==
X-Received: by 2002:a05:620a:8c0e:b0:939:6dfa:db9d with SMTP id af79cd13be357-939804fa21fmr744225785a.50.1788587361422;
        Fri, 04 Sep 2026 22:49:21 -0700 (PDT)
X-Received: by 2002:a05:620a:8c0e:b0:939:6dfa:db9d with SMTP id af79cd13be357-939804fa21fmr744222485a.50.1788587360670;
        Fri, 04 Sep 2026 22:49:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5563c6csm200724465e9.4.2026.09.04.22.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 22:49:18 -0700 (PDT)
Date: Sat, 5 Sep 2026 08:49:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: gcc-glymur: Use clk_regmap_phy_mux_ops
 for GCC UFS muxes
Message-ID: <szdua7tz2cysqqqh2jmkds7jxbfcibdtkfmbxwzp2uozhevo4f@yyn6y53bd3ps>
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-3-cdff2c67a8c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-3-cdff2c67a8c2@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X45i7mTe c=1 sm=1 tr=0 ts=6a9bad62 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=vZgVdhwgRuDMrAwUH48A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 49DCB3kNXhLCUdHv0p_sOvq1NIDykl52
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDA1OCBTYWx0ZWRfX2Ep7U7gq5PbT
 40HAnu3JVi7w1IPi8z70V+vqCwuGmFyDKS6reDZFvKNG371tZ4ccBvzOorU08+N4W2tUZfknzFt
 rvDkdGUEyBACx/MIxtJRBSWVtOrOjxpdRkYQqnVaFfsGrxuWGorQCG+LwO3E0CODt8ulTd/x+k4
 F9kXdDnVKAK9Yebw2GVfwagU0KqsjXEQHbQgfPa/cg7ia4GFyHz4B44Xni1F/xH+1irInmanFmp
 /TCLVqeprh/R0Tz2qaiC2vN6raKpn9Ahv5hrr9h7r07JsPFR3B0ybnoCGihy89RW6LY//2MOpe/
 tgByLaS/pi47SShiWalcqGJnlaStWtlKc86CuD41/vX7jwmDpsUssbbPUNWU8SbrV9mt/ST2gV2
 VpZbDuxThPPwGgJNkNTnPgucShfhK3ix7BqEP5jYMg2vM3vDeMOQHxcuxpqmYTEFUAenX4hyXH2
 WK22hlvV38vgU7Gq2AQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDA1OCBTYWx0ZWRfX++SJLsO0sTRh
 BK0pzdDnFZ2OjOSLI2c+ycsqe9fXLHODoIMVHBtjPRLEgJTAZOWXLmylRa1gryORwKdgubI1Jc+
 ecmiAAvVVdKpXcfsxibmv1tP3k4abVg=
X-Proofpoint-GUID: 49DCB3kNXhLCUdHv0p_sOvq1NIDykl52
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050058

On 26-09-05 00:20:44, Jagadeesh Kona wrote:
> Use clk_regmap_phy_mux_ops for GCC UFS muxes so these muxes are
> automatically switched to UFS external symbol clocks during enable and
> safely parked at XO clk during disable.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
