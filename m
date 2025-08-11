Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6225C2E3706
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908274; cv=none; b=Tg85lPqbhmexDER/bvQjCcRTljSojBwl4rc3ErJ3LechjVJ/0B4+39qtvA9WICi8Y9S8yI9K6REOjUTIj5xhuYzJ5zfy1LOzUjw4HgHUPxYE/p0jnHIGan5MZao0UXmmbs19BGlkVnpVCeBQ69Yr7uR3zbN9nTeLE8QZ4UZ4ehU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908274; c=relaxed/simple;
	bh=TmbORZlcCKPc40wFUS1pF0fgoG26pzs8CG8rViTLwDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rwv3oCyciYXYiOtoqqzjxphrbIw/6N0EBib3K9wiI8s0iHrzJGP3YHuUIczXAZMWOallDkV3weumezQ2KAKb5yXs0CsTLdcEJGJCVcAZ33VJWqMjpXL6h6Q0GrBKRDILL/4UnfOjLCuFBatT+h7Qn7OUz7IePwoGzvy2xKyavE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nxd7ThhG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nxd7ThhG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9d9QT019068
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/ucSKnN0VabkHBeCyUPOOAp0
	1IU9Td+bmPEMlaDwwOU=; b=nxd7ThhG8UiO8u4+aSNd9NxDhUvou3BAn+kuDkqC
	0g12KNcGvPLBzZnLa922+aQAbCjy1re5GA0N2LweBkFOLRA+D8uL/VfU3tYcp05c
	MVYswdGvFgzsWqtoWc90iiEXIOHc2EOv7V2sEd0ekyqZQiohlxdbKUAdzWgib9SS
	dT96BvYp3AopY15+Xc64JZgnvcudlWTfSJzFvPSDrLbMD06Zp6y9IqlbdiBaRdxB
	xvpbFvtoFJuFPhFmy22IsFXejAVmNxgtkLd5hw6Ilu4ccGPcecZAlprtTxcdwVPS
	Yvs61NKR1WVjdbsB8Wm0jz+TrDKP9OGP1NN7OyfQjOeJHw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxduv08r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:31:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b08898f776so106832851cf.1
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 03:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908271; x=1755513071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ucSKnN0VabkHBeCyUPOOAp01IU9Td+bmPEMlaDwwOU=;
        b=oxM0Qx7Xhmot1fVKe0W9H0QwXOAzaevMmB0h1mZgpEwShPMrc+TREgo3mSSTeOGzVp
         NwEjANzLUezHuTj8gbX2sVSVCtQDtF7llKJkPAmdf6bCmqYE7qqnyVRmgEkM41alU/7G
         zOJjUDgBFxVRS0ox2hSgceVH2qiZw/gVcFF2oQjdS572ZpKs28XPYhdxWelXaJ7Ks9YL
         X8e8G7JjklNTeQWKjqgWM2lhKgMnJhDpu4C3UXIL8DpLiASVYlHAEShtJQdfA3VKxf2t
         ORPaFYgK1r/l3dJgV5/jmoCG/L0b2lxJ3SZjrqH+3blhZOo8dN0Cal60jxbDiz2HpAuN
         Xxrg==
X-Forwarded-Encrypted: i=1; AJvYcCUm2xX55oF7hP/mNUeQH9ZI6M9z8QsG+Yz+7jGYPqCKHgPfYM/8nBfJt28gxnp681mG8MGSa79pJfE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4dzimDAP+UY3n7LvL2BmQZiLBwJgLKThukZoBcq/QxE3GiEgT
	p4Sm9flPjxLTIMrG30q/OcX01Nsb92Tvngso+Ff6QW15PYFs5TjSbZamVQ4qcwCtWWFyo8UKF7z
	AA5GdR5KkI6GsIRbDrk/VmoVt7/aBXrfd9MaNaP9o1kbhdzQhdiW/llhyhJjiBm8=
X-Gm-Gg: ASbGncs+aLnoTsiPXAU0VHWCaOealJYPJzH1IXfbUK/bp6Wkq0iDRPgWiQXn3x5nJd7
	H4k875A3byUhq+bMfottN56wpNHOO6JqObto7QEgdMe2fqvS8tZL6e98pqrpRYnWcPVw6UCRji5
	kAINnjH5GBE/EjWSlEZ4gnHaS/FrWs1vtUpOdx23M399tSQ78mF5t+QMOu8Jb3K0S/1NMrFcBC2
	Q2FS22KlE67P4s3TxJV/TajW140G/DIeu6aXcqX/1dY+3nNZjUwwTAUnKvyURwnyugfxnAivcBk
	IlnBacI1jahT1XqU/E7DL2LrcwA/wR8Ny1VNUcNrG3CIY7UqMPtiBVSLxXVQZndR1UNuGjY1cCc
	sUgXhSzKreFvgs0ubE1aHmQWkrPpKVy6yTCtjgDiUIzZv54kA2xS4
X-Received: by 2002:ac8:5956:0:b0:4b0:7581:4dbf with SMTP id d75a77b69052e-4b0aec7e670mr172487761cf.18.1754908271527;
        Mon, 11 Aug 2025 03:31:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcBbTdZISUt9SKxmEFAT76YcvHLLyKJL2uxyoSRdkuIyPT1U4jZXtxIgMb19xtPh+M9uOHug==
X-Received: by 2002:ac8:5956:0:b0:4b0:7581:4dbf with SMTP id d75a77b69052e-4b0aec7e670mr172487341cf.18.1754908271099;
        Mon, 11 Aug 2025 03:31:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88caf0ebsm4214962e87.154.2025.08.11.03.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:31:10 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:31:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] drm/msm/dsi_phy_14nm: convert from round_rate()
 to determine_rate()
Message-ID: <23yejfrhz3qmi67r63ni7zawmpsawrb3jzn37r4h75s2ax5gki@6ngyqpqlqdez>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-2-0fd1f7979c83@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-2-0fd1f7979c83@redhat.com>
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=6899c670 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: QBzn0R7JAPPPujfeqC0ENZr5mVrB0Ca9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX/bzfnq0fvmDt
 br3VFtvflFo2veqMS7ll6/vNETJn/gHiNrWh7nxqP/xp9wFhy2k3U7ANskRv8bdfBYg4mj6eW/U
 sv1qkrFeNgpwedQ7/XpymddCzFCjyIXFr83j61d1slIeRgC+ygo5SkBSj8la0bXk8c8YUAt57hO
 feK86yvnL0xAEytli7v6JACou/uAIma9U2ktAhfBmVDlWAYef0XBCml+xWzJR/Z0nVKEuH9VESz
 bkUJUl+1y0x4UQXkgHeJg/WNoke178TZSiwj34yexBrakes95yvuUhYL4W0ITLaVyzQ8cvvNqjp
 awyokIwmO+Lvo1pqfiK0aBqjCaV74ERLrt94Ax8iCb1ZBiQPf9wG0waftotbX1l5SqIc7kMAmPd
 IPo1Krym
X-Proofpoint-GUID: QBzn0R7JAPPPujfeqC0ENZr5mVrB0Ca9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

On Sun, Aug 10, 2025 at 06:57:26PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 34 +++++++++++++++---------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
