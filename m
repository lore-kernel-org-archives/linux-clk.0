Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210023939D7
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 15:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351267; cv=none; b=oHw4m0Agbjd7OG/QuRTSIsrCZ20cG/P0tFXBOEQV9ogJUqcGRhzybijnGkgdSMSlpN42qnW25h9wNt5E/utb/oIfLRQe6K7UARCSMN5LI0AxpZVQ6IY2PZ7DqtXbRuJ0AISMgMkEiL143lW4uZ7ZzSbSadgOR1y6yd7zyRNKwYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351267; c=relaxed/simple;
	bh=n6ZpxRZU14E+7+A25NQhruw3U62Kw8+/vBlkDNEX5H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gs8NWrjkLHgsHDtp9DLQHRZrMTN9L0kHEbJFTJ0LComkqvpA1FbXURu0U+2+OGgNNqZNrZd32dFpPwliNbB93bNqjBdZJluWnumWdlU2lLBxX1/7e0R8WLgwHGXSUvvuSup/Hvrths6I5f/b2UwDBEtOVu9LlMGYKPfEjH/CG7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cqf6P1Mq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APEir3nI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cqf6P1Mq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="APEir3nI"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PD3tpE289475
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 15:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cpP2+xnejZW6ZVcS0rDuSfZA
	riRIlFDBK4YQ4B+TXW0=; b=Cqf6P1MqnEpo5I+VTmXXNFOCJoRF7T2TQ34MnQMP
	MDGD1WapnO59LHJ5xN7xESLKMSgCuMQ00HFd5FTEVyEoDIAB2iCpUceZ2dDObZUj
	Htqe42d97X7EDTl9cvkVYDZMjJ87Ja1Xx4Ys81aO9v7wJc9WHbL6Gx0r6lOl1npw
	DoLGOAtvat3Orv6Ks8Iz+yANLAR4v0IV54BgtNYAoDe+H+p6gFgB8CSKLxwXKT0Y
	Um+/1Z0KvwM4ucC7+MfMcYUzTNM4WoYCBvt9P5ioPHsT01G3+VY0JWBpG6OR8iZH
	2Fh8eE/9dEez99n3v9HCHKtRYqhFi4WKhTf8udxh3I46qw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881v9fg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 15:47:44 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97cb32961e3so658888241.2
        for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 08:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351264; x=1790956064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpP2+xnejZW6ZVcS0rDuSfZAriRIlFDBK4YQ4B+TXW0=;
        b=APEir3nIEhCpaavwpLouCXiFvDjd+++sBgJuMMgGurbuWudMchm64jh6A8DH2NRhOP
         a236dt3UHTDK0cO5tUXtZwpYdXdKFWAaQ4QhmoHnyfCY6AAxff2wEBquRptpmh2CL7bb
         WQl7E5FRaAPYGFkNhXnBRfH/VSTmB2imyV0Et9LdyE+LHVk6FGQOMfV4ojhWH+wv/yca
         tKaKiDPIL/lui3moBSpXPjQKfF4KJ6VYn0r0Bke8aN8PdbqyB6vGfRxzaUKSyGtSnoH7
         2yFv/Tf71jxC8LYDipytVuGHF3zO9rmZPNmwsE/QhaTuNVSHcNM//xqXDMvbQGs1rU9C
         APYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351264; x=1790956064;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpP2+xnejZW6ZVcS0rDuSfZAriRIlFDBK4YQ4B+TXW0=;
        b=W8xoedKFIBphc10BMus8P1vRFyVDDDAskoL/n+qzFIKtjhiF/x+pEk9YQ3JfEvtJCP
         nSDP4105gqUlyMfrjO2TThFJxDazW3y5g03ZddCBK5FVJaX9KLHK7z1rFh5agbLElyBp
         nbSd7iozpf6UeeDgGTWwffarT8bcLiLvFs7ST06FTJeXDIWUtyDKcv/HL+6eiUOe49YZ
         OSssLLobl6fyvlJ1GJitAxiaVobiNE9C1mwLishGFh0B/mvqryyV77oEorkRZUphqMzI
         Jl6K5lvSTY2MChSlawSU7OIFJxedUCK/jHP53MHpWObN3ViqQglRa3fEQT1yxbnZsts2
         81ww==
X-Forwarded-Encrypted: i=1; AKwUvBw7eBthfUmguqNUBgQd7VyZFmEl3/4hudcv+GYRtmI6RNBMFgjdhM4eYZFv1Su0FQw3Dx+g/LwLKy8=@vger.kernel.org
X-Gm-Message-State: AFuF++lMQnb+fkJQf3uYaubr1M40HuTY6wWVZTRh5+EH+V/KiXF+YIbD
	pRr1txmeACxopGF3IEwwHavNqsllrJlJdwhch9xBpzojmrsNAy1tOHatVNLCp8v5AxQU/uCZkr6
	0KrEBw0WloYoL4PXaHNtjVs70L4+g9Haoaet/08N2Nh/jywJJ0JHTov/5N9gKNTs=
X-Gm-Gg: AYBFou2bYopzxS5YzTrlCUA4ihCgqcHcO4XLv8Qe84EI51UQnZ+tnyRjEI+SmEI4MXa
	I6FJEDuu1aiOZ0+6WM6rqoGE9zsvVPMa+40ldUBPcHIbWowlZ1sZEPJbDp0EXtWffM/CEksbRVh
	yB8/oe9QEHA1lRy1ICkFSJAaK9WiFCv2bG3fLm5rvgJ6yEIcXBdUeCjjWvOkgO6AFknwjTFFjC9
	i4ZM2v8iJs5i8uFm26GrMN21H+sgLtIbv4kkQXLjsSy1Bg+Oght2mUWrck5YKPCBDznxUnhKgX+
	+Xm5djnIenq1vuU5xqUwcy4lBOGAuMJUbqToO2/PW0XwLK95oxiGkqOW2pddsbncX/Yno3c8WAz
	tLvfCT9qEJoUJ4dc=
X-Received: by 2002:a05:6102:441e:b0:7a6:a24e:811f with SMTP id ada2fe7eead31-7af1c79966cmr3211544137.7.1790351263803;
        Fri, 25 Sep 2026 08:47:43 -0700 (PDT)
X-Received: by 2002:a05:6102:441e:b0:7a6:a24e:811f with SMTP id ada2fe7eead31-7af1c79966cmr3211528137.7.1790351263242;
        Fri, 25 Sep 2026 08:47:43 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff2884552sm51233485e9.10.2026.09.25.08.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:47:42 -0700 (PDT)
Date: Fri, 25 Sep 2026 18:47:41 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
        robh@kernel.org
Subject: Re: [PATCH v5 23/42] clk: qcom: gcc-sm8450: Tie the CX power domain
 to controller
Message-ID: <kfx6o4tcdkdxy65nl4qq2ecqahd2zsp6dqe36uhosm3glwkhyl@lex2azg4sybm>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
 <20260924-qcom-tie-cx-to-gcc-v5-23-38732033e5b5@oss.qualcomm.com>
 <20260924111126.511671F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924111126.511671F000FF@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab697a0 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JOqecPiLsEwRwh-fJcMA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MiBTYWx0ZWRfX9cGLc53zoAGo
 rMNku0BaCAoHOFZ9Lpbsb420pAKVw1FVE+Uj4m8gev+0ZWgANuN7RqKNDJIm4X9URDzeivTGPER
 WwQ/iOffpLxbuBEs8/Tq9N9D4UMCPNr0lU0ml+7m4Ll1IofMKOZdt0wHGzQoUlVouIgA/n1qpLm
 K091tR6C1DY4dDmHd75Fd8/GbDaZLSH1ziYfPyz25eliSgokukIrIhMpnlqMc2W7E+FI4HaSqtO
 AoDxlCCGoNrUVB2LW4a8ilVMZKWSIAtByUtC9FYrDkPNq+YS/rVH7BbSG8GqfIVYps5QGDinCJ9
 0hjkcmqozYsCh7D8p43ILlz9qOBqPVlvn4KH0DlJuLAca98T+f9il8WbAahOUu9W7XLS9UE65O8
 vPtq4AfY7j1s9DGSfiT/Z0bpR/qikFRVm5/0rKSLL0+NcP3EcweJt5cdYslx/Gq6tn/uhHBvinQ
 y8w840tYYP/El4j+p2w==
X-Proofpoint-ORIG-GUID: xkmABWCUJ3bebtP3GOr8nRMTnvjJMw8R
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MiBTYWx0ZWRfXxCg/2pvmyOF5
 h10mBHRrgOq3NxXBzAXILp5rdRtaoYYkJn0rjXoBbYg50lOkGZlknGLTQR6F6GIIszwIliXq/RI
 /w8XAyymw2RFIbXBIHqiMYxDnvUvIfw=
X-Proofpoint-GUID: xkmABWCUJ3bebtP3GOr8nRMTnvjJMw8R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250062

On 26-09-24 11:11:25, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] clk: qcom: gcc-sm8450: manual register states lost on CX power down
> --
> 
> commit 99d5496af370ec324c5f350b6121718a0028abd7
> Author: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> clk: qcom: gcc-sm8450: Tie the CX power domain to controller
> 
> This commit enables runtime PM for the GCC controller by setting use_rpm to
> true. This allows the CX power domain to be powered down once all consumers
> have released their clocks and GDSCs.
> 
> > diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
> > --- a/drivers/clk/qcom/gcc-sm8450.c
> > +++ b/drivers/clk/qcom/gcc-sm8450.c
> > @@ -3400,6 +3400,7 @@ static const struct qcom_cc_desc gcc_sm8450_desc = {
> >  	.num_resets = ARRAY_SIZE(gcc_sm8450_resets),
> >  	.gdscs = gcc_sm8450_gdscs,
> >  	.num_gdscs = ARRAY_SIZE(gcc_sm8450_gdscs),
> > +	.use_rpm = true,
> 
> [Severity: High]
> Will this cause manually configured register states to be lost during the
> first runtime suspend?
> 
> Setting use_rpm to true allows the CX power domain to power down when all
> consumers release their resources, which resets the GCC hardware registers.
> 
> However, gcc_sm8450_probe() manually configures multiple always-on clocks
> and UFS PHY settings directly via regmap operations, bypassing the Common
> Clock Framework:
> 
> drivers/clk/qcom/gcc-sm8450.c:gcc_sm8450_probe() {
>         ...
>         regmap_update_bits(regmap, gcc_ufs_phy_ice_core_clk.halt_reg, BIT(14), BIT(14));
>         ...
>         qcom_branch_set_clk_en(regmap, 0x36004); /* GCC_CAMERA_AHB_CLK */
>         qcom_branch_set_clk_en(regmap, 0x36020); /* GCC_CAMERA_XO_CLK */
>         ...
> }
> 
> Since the driver does not configure regmap caching and provides no runtime
> resume callback, does this mean these configurations are permanently lost
> after the controller resumes? Could this lead to synchronous external aborts
> when the affected subsystems try to access their hardware after waking up?

Nope. Dropping the vote on CX does not lead to configurations done on
probe being lost on resume.
