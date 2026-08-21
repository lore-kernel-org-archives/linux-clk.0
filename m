Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829A046EF70
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 10:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307256; cv=none; b=C3iznU7XLa0PbvoKXWvRs92sklDkzccJPZpNRankbaWfaHO7UDHc/UJ/nXJmzJaN0AOHMyHg/uJnW4wHX+BgBnkkqdJ1Dp9WrrAvRp9ucWlABbGHBSIrmG5F6IhCW4JBzyOVgR3re0e/QhEHCbIPaxFqwL4T76CHp/0nvlI5m6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307256; c=relaxed/simple;
	bh=ogCP2A4PXSgYixCatTUIw3PNEyUgcCxbSFOAxmJM2mE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wd+/FPMrzqZ3P+86T2v9zNbyTtXWY4SxIGU6ZMVF3YexwPMxeP6jDeaKzYjTI4JyY58jnUbNlYDGdL3NraQJPEzHuhJLuMbGZ32sgRt178RszSfKOCYNL1zsLxQ9rqumyM+9q8MCP3ikFdlSLZx+KYtCoJbhpKmUnR5BEHDA5H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ah5FHfDf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PDKR5UlW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ah5FHfDf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PDKR5UlW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9Lwe82006112
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 10:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UnYVTMkS+WWlkVK3zBqZDkx8
	gQZG7fuc4gpwBwK4/PM=; b=ah5FHfDfgf5DXF/hSIAUdVtDDBG7XH2AHqlBaQ9x
	3i84OwumBXM/po6PlTt2oZXDe8OGtrJoVZSMsJ8V9/zjS5qVavqt7al6CZoEemN4
	+8qey16CJ52DEx2uYWF97GdrNR2eO+LUjzq7/gZ/2M+w+ac1h9doRgN+n7fTGFIf
	+NADrnQRX9PSIOA9s7HDvhnQMIXiLnyzbRq96g46vQdyeh8oFi4QXF4k281ztgLp
	uHaIOgjkAMKzJTOOx4BlA2MSO+3Ntn1p9IJwtHySRCrVnae155PFaLO2nYcy0FWs
	Sid8pUfKrupwJdMnKmPQLQVeFckXf7z4c7Aj0kksOOY42Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gddh2b9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 10:14:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d7886cdso15097351cf.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 03:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787307243; x=1787912043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UnYVTMkS+WWlkVK3zBqZDkx8gQZG7fuc4gpwBwK4/PM=;
        b=PDKR5UlWjD+txUMGZXYxg/InNRardcHb0CPhtYcoUvw0wcYrYgyClIMrmhLVo06WqZ
         qyNmaLFGA7+uSVRnXxY2aCUYYoZa/dn1ez/E0c3BjrIDfOvNb3aev2NaXl0RoA1h60Mj
         FD4QKfq7zAvpaL4tR37jYGopfGgWpAT7jEHwJHNyblUTmrnT2DNkccg0eLluUZSLgdKt
         mgtDZHBkqJWdBRO4bsGimhXEnZ3P/CdjTFtT0NV3iloAzecu/oZwDsZhisMAOhTCxS+k
         b7IUJYixyq9qNqu2sjXDmdEWS8WjXALXsOJOt0a81GhuA0YWLQW1Fq339p2E2KMD1B+0
         ap3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787307243; x=1787912043;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UnYVTMkS+WWlkVK3zBqZDkx8gQZG7fuc4gpwBwK4/PM=;
        b=J8It43hxT9Mv/cArQRCIbFi4oOBTEkWbtlNsZQC5ote2ZJoMhpNMGk68hnmrYVt7sI
         YeGRah1hWnH6KhyhoxUgw8W8LTYyKBrrLEbOQJuvGSuZuMR+V6EA00piPIG/hIdfvDOp
         FsKIrRY4sOOW+Azr1mEf/ngFi+2eR4og0puG7lxFkOlxTkLLeHY+VnmwL5Sl+bYeTh+B
         bh5317ntd7f5UJiyRrfj25LYDuv4uIrBb7lWIqwwTWHPv+dSth6tB+qWkl0cP+8DHrTc
         nirpQqRCzmwW0xF1Ty5sZ6jwCsDTN/GnkWSy2HXZFxOEc0mOx5kHvWbHPAxrMy2FH8Ly
         zO+A==
X-Forwarded-Encrypted: i=1; AHgh+RqQNcLIrv1c0KzIWCel1xWD91klFSesyG/VQaz7CLGwl4af74tMmCY5AM4noR/dVPf/21p7cY7KsR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNS92tGnHZ91Cmnjsn1J7LBGPa03t3Dq4E/cQw8d4qaA7fUfcK
	G8Jo3c36Qk2DJfJYGY2T4lEzY1/gnBst5PoJeBVTKVrsOf0N1d3v2J0qRDi3H7YrbmiAL+9ct9W
	tLH4sSsVbfyZaArCRigfo1LnifluUDcP44DKJ42I1duduo2BFH+niGTkfpNVKiYU=
X-Gm-Gg: AR+sD10b24k8i8yndX/r1O/6PkNI/SNd30Tj5cH6LFr9iOw8GM3tyqk5RLfvSIF1N0K
	jwaknjiqecQ9ulty3mFMBdz5tGubREDQHOkNJTmrdCdtehs79bRdnekOXlQoUujYDfi/w7Jhth3
	QqCpVTCcj8YXWZ8LMsYA6uJnskF9+xSqoJKtVLA4imeabNjAaYePuEu+G09x0nclP52iabqft7z
	vNwCDFR15HU9ffjgO4kBDF+3X45/ffvF9B7/EolQu+KtexdQ8NyVxvUTch2Azo4T0t1bI/s/kAF
	ajJWvbrQs5u641dM38s61HLCPqKuRbiUo1Qh8bs35AYt1Lyyg9PkbLN0IX7Yj4F0zkaE/Zo8lpa
	y7Nx+ReAx7bzfg3g=
X-Received: by 2002:a05:622a:1452:b0:52c:cc14:ff63 with SMTP id d75a77b69052e-52df5a7ae3amr44018231cf.37.1787307242817;
        Fri, 21 Aug 2026 03:14:02 -0700 (PDT)
X-Received: by 2002:a05:622a:1452:b0:52c:cc14:ff63 with SMTP id d75a77b69052e-52df5a7ae3amr44017741cf.37.1787307242360;
        Fri, 21 Aug 2026 03:14:02 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b096d9sm466632966b.20.2026.08.21.03.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:14:01 -0700 (PDT)
Date: Fri, 21 Aug 2026 13:13:58 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, konradybcio@kernel.org,
        tglx@kernel.org, ulfh@kernel.org, bmasney@redhat.com, radu@rendec.net,
        lpieralisi@kernel.org, quic_tdas@quicinc.com, danila@mainlining.org,
        davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com,
        linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 02/13] soc: qcom: socinfo: Add SM7250 SoC ID
Message-ID: <ftucic3bz5kxsamuzryt2l7xeikbbefetslatnx5xvbtvnle6t@adhwu7nxzabd>
References: <20260821081125.4522-1-sreeshankar0910@gmail.com>
 <20260821081125.4522-3-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821081125.4522-3-sreeshankar0910@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA3NiBTYWx0ZWRfX2N10LdImobIR
 dDoL1Q3zoiwyy5Nvg+CCvXoL6MklcKRs2L4r7Sps9F+fUt7azpKB77PnyLM6nNoyHFGBNQH2/vD
 qLiUx/nk15D+j5PgaxzZWKEcvAD0g+k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA3NiBTYWx0ZWRfX/HrVNMvCkzSI
 3uYinaqJTuVmZvH5qL3gEI++TC4EOBblUG7qOnC5xG36i4+gywyEXwrgUdexhLW8R/IrV4SFpD8
 phFBpaxTQjeK2633SwUsEmbm4+3rYg6n9AdzHuYpvMQ5+41rZg8WWadQAuhFRToxPs3pogG+gMm
 n/3K5nfCCviYKNP7JS67EMintg0VpSbeHCWxTvUhCfbMQQyfz7OHFYXE8g4p7F2f6Ep2AOlGqwF
 oeFZDElcGLq8E1t0P7He+rVOPna21wPK/9r8IDHA/SjSABPJbDQL821CcJBvZfO/Ygn+hpvyL2t
 lbhsv0RzSza7D2b57hsIdq4Ldb6Y5XNjV47w0Dy5Kjyd1OK9FL1KQjs8ry1r1F3JbU19TYWV9xw
 rHZNjFzvT1bbyP5uXGxgtyHM+QufLxiIeSY/ui74qN+DidedNWdGARwot8+EQRq3K3LYZTFwCe5
 WEpL/FsbfyMDMZ4o/YA==
X-Authority-Analysis: v=2.4 cv=ApHeGu9P c=1 sm=1 tr=0 ts=6a8824eb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=rSoAExJED0QYgwLJ6goA:9 a=CjuIK1q_8ugA:10
 a=Z0LeWUw4VpMA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: mFlX-dXKRqtalf4sUthbJqXhGHyY6m8Y
X-Proofpoint-ORIG-GUID: mFlX-dXKRqtalf4sUthbJqXhGHyY6m8Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210076

On 26-08-21 08:11:14, Sreeshankar K wrote:
> Add SoC ID for Qualcomm SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
