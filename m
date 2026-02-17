Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A70B2D4801
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771315100; cv=none; b=CnLoGDb26t1e0a9B+ZC8AD1vb3zEm+3lI3/4mmdmVHPuFySQrjaHj3NXICRywwCHDen495nqfo8DDn/Sz6T/EL3obRYazA+YnmaFuM6rFdQeRtKqn0olkWdiNPCEfmWsRj9l978uFDm7lK4yqCseX9hK10Ip59TFbmuE2tkgOpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771315100; c=relaxed/simple;
	bh=PP7Ry4xWPPTpiKYcF3WwBZsgd+2mhlHGV121XjD2Nbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRtu63nSgS5ZUep15TvvgG7DvvUNCEmxrjBqrjgxYvg/7wttGKGvVc64wHD2PVVVd7DBPO7zoJrbbn7KUkxUxgba61CvrJLxV4pLQIp4JkxBtEJAQA6BwvdNsyA3tR4fwzSIvVqUMcVo/KFWxSfYwzhnVUuamdwhSP3oGt7Jl7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mlxZrvNX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CahO/gcG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mlxZrvNX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CahO/gcG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GG1g2F048812
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jMXGS3zNtFR/HePL+Mu2Beew
	1OruhKTFEqLUcfWgo0I=; b=mlxZrvNXXFvH+hDPgd3a/Gy5xthkqiQtzCo7qf6u
	aZ46lxAOW4Sojg0Y/qOUDPGiXXe4/+gmRjqP79iUJ+dn29/MWcnPWuc5h+I2popk
	7ll/Tj9x654uccLmBvrXXsExmUT+GpjMr31wsoMoQvlUepNzOpV8ehL5adZAPhty
	zeYZ5QTIBylif6T3uJWpqlydeo3rqoKZ0PaEPGVcPD6dtH6ZHyTtB0kEZ+2k9ZZC
	hfCT/WiqlHOmOUxU4vgXYpw/fKBKKk5wm9TSdNYGFImtj58VxKoxmVNu5fzO2Sdm
	bguog4JzA0WjDPs4g+v5ira+tg1vgWGcl1mxvG71AEgiAw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6d81knu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:58:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71655aa11so3271638485a.3
        for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 23:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771315098; x=1771919898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jMXGS3zNtFR/HePL+Mu2Beew1OruhKTFEqLUcfWgo0I=;
        b=CahO/gcGsU+hFTnKMGMnSIfffTEbRBJOQA4At+AwXUgkY5yignNu0Fbqsl0G1EGjCq
         g0hsYmYt+ZBhjq47fSTYMDeL1YQ9M8ChbvE/7tiygu15d2iExIR0m2A3CoUdk4q7QFSW
         ntdBrx2pacwQv3pqeDGXWgYTKxDTkPgagogXLvw7Su1JRjRIUhrtlkYp0IwRTOfuHXsQ
         CGoMfLkdscxgFxp7h9utqtE32i1G0PimYV/y/jlG4QSJiFomWW/ztftK5zo13RJXdoVH
         X5VNPxqgAcoLEzH2qSF09uN5EHK8mH3R3v6FAPgmfmiLqWGeivXaY7l/uJELqNXX/HeF
         Rs2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771315098; x=1771919898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMXGS3zNtFR/HePL+Mu2Beew1OruhKTFEqLUcfWgo0I=;
        b=LxMkNYzvM2IwICBMl9Xar2DgIkAlSBh4xwC8TzbdlY91WMI1PLgoEafEhTuT3Phc1i
         205Of3XxnXIIo6vfMGTS9ImPzUOoK4gQjmTugqNmHaveuHuPfnqSYtBGS8xnjmjR9B1U
         zbIVfc4lW2fn6ccfBpspN7EEdyNIru1fYTVeXVFfWHVvpqmXvc8HhCFb4hcDPTsZZY3Z
         c7VHfuu5tjcrDDmZWMGe7n2LqQXMH+Nt+OSjqMzWt1LnkJOAv0/j2d30HnawOi1zcUw9
         ayNjVFkwu5RrQ0yLRYIVcQRnp1hlCC4oI44LRmzWl6NR5tuImC1n6RCQkaIcZfKuGGVc
         gOEw==
X-Forwarded-Encrypted: i=1; AJvYcCV4xLSijxKFclKGtCkSiNxnQAudHTyb9Kl7tHQekp5hkNURFb99NFqHI0Ei4g5tD9me3S/dc1gxHYs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZc0SVguijIGFIBnCcApIdv45YXhFtlMbPrslSLDodMw3cZ03u
	nghosGXe5TGPuJeh2axPwENzmjhKPC25SXViMGjKTbF+GUIDfruJR1rBuhOQ32wTQXgMCVOp55P
	csHTmmVIRMrwE4QR+guKfFlG/hXn6pAc032oOGCP0aTqlBkuazWBnN5dmZnfpJ7s=
X-Gm-Gg: AZuq6aI+gx73hasze3UJmilj5BFQQCD3q+Q+GkZ1KIWVIuZvOEedOIouCoAoxJFiaRn
	UtQS7ymZuXf2jpInhrGkgGCYRDZQ+edqgSlLtVeF6ViL63I9Lf4fQV3DNCvW0QDW5IfcWyowvAH
	+MCzWJCDz5Irwx6JcLj/jkLMD4WIigjepYMvHSqLkfSawTAE7ZTi4MrJfLFKqTC/STmq9wqP94G
	NeX6zBi8rQebBzMZO22Moj+K4Z79OJqosyx0gb/3GFqTsbWIvWMNbDW5k3uwv43UcYE/CIwo5Y3
	IZolkGTeSUo/JmVM6ZOQBoBI5hYENo2Wtv3o6TO3C5P0ITfrmqv91jjIY907vgfE4hz4QF1d6jV
	CX2hMvdSCO2M74xNLn35OwyuoxJ7rykM1hmjT
X-Received: by 2002:a05:620a:28d3:b0:8b2:f1cc:a14b with SMTP id af79cd13be357-8cb424a6736mr1563528085a.87.1771315097584;
        Mon, 16 Feb 2026 23:58:17 -0800 (PST)
X-Received: by 2002:a05:620a:28d3:b0:8b2:f1cc:a14b with SMTP id af79cd13be357-8cb424a6736mr1563526285a.87.1771315097153;
        Mon, 16 Feb 2026 23:58:17 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac800esm34625082f8f.27.2026.02.16.23.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:58:16 -0800 (PST)
Date: Tue, 17 Feb 2026 09:58:15 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/6] clk: qcom: Add support for Global clock
 controller on Eliza
Message-ID: <iepxnbk7h6yti7biozcgw4uq6l6fmtaxrgxbt2tmcjxf5x2lep@expe5bgt3oin>
References: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
 <20260216-eliza-clocks-v3-5-8afc5a7e3a98@oss.qualcomm.com>
 <d6392cb9-9ab2-4743-a13f-7432ec03762c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6392cb9-9ab2-4743-a13f-7432ec03762c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bqVBxUai c=1 sm=1 tr=0 ts=69941f9a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=H1luOFva-Z3cimKgmEAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2NSBTYWx0ZWRfX/EOAc1JcNKQh
 8UbjXYpO0YWPa13g3rPeF/CJxKs+IUOkq337iF82N3IRYxE/htBJOPfQNQGtu6/tVKoS3W4XeOB
 6oeo3/2u0d6jZuDQOr7vxwVKCV4HydxOo4Qc9/G0DEMAeWr1h3DCaKpvKyNazEXduF3tPn0k5X2
 00a7pyej+JYro0+46sqR24Df9g1tA/oBxz1H9gN8X+eKY32bHWIa2MaU/O3Nnoay0s2ljWwIWPg
 VLUC3Cana4fiXmP6W6zIOPBG3fYGHizb/VXTy7hQmXtoUk4fzRrBWWpzBwR3J+l1/MqL0pnuila
 TyX6LE9Uy8gs9YWO1A8LaY08U+PJrKUfrd5VYDOSywZw51ZdcBQ2I+k0RjoPa576GYr1I5ja2dh
 e53UA0YBJj14hHJvdCqTkecH8sXzn3PtQ4mEGPIRngW+XSEG6isUcjGRNY97NDV4CCvqDHXvqPh
 +294ueHU64aFcZwv6QA==
X-Proofpoint-GUID: wEJgoF4kXs_CjXLMV7737Xxh5bkszAG9
X-Proofpoint-ORIG-GUID: wEJgoF4kXs_CjXLMV7737Xxh5bkszAG9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170065

On 26-02-16 16:38:15, Konrad Dybcio wrote:
> On 2/16/26 2:43 PM, Abel Vesa wrote:
> > From: Taniya Das <taniya.das@oss.qualcomm.com>
> > 
> > Add support for Global clock controller for Eliza Qualcomm SoC.
> > 
> > Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> 
> > +static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {
> 
> This and a number of others should be struct clk_regmap_phy_mux instead,
> cross-check with kaanapali and remember to drop the then-unused parentmaps

Oups, missed this in v4. Will fix in v5.

> 
> [...]
> 
> > +	[GCC_CAMERA_HF_CLK_EN_SLP_STG] = { 0x26018, 1 },
> > +	[GCC_CAMERA_SF_CLK_EN_SLP_STG] = { 0x26028, 1 },
> > +	[GCC_CAMERA_HF_CLK_EN_SEL_SLP_STG] = { 0x26018, 2 },
> > +	[GCC_CAMERA_SF_CLK_EN_SEL_SLP_STG] = { 0x26028, 2 },
> 
> So SEL_SLP_STG=0x1 allows setting SLP_STG to =0x1 to assert the ARES,
> otherwise if SEL_SLP_STG=0x0, it's controlled by the HW state machine
> 
> I don't think modelling the prior one as a reset is valid, but I don't
> know what considerations we need to take wrt dis/allowing hw control
> here and what the consumer expectations are.
> 
> Taniya, would you know?
> 
> Konrad
