Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED28B368968
	for <linux-clk@vger.kernel.org>; Fri, 12 Jun 2026 07:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250346; cv=none; b=QchspYgGCAL11HPxNlOPSLpKgQbKkZ8zIa8vknBd/XRKpUZQam116n4wZXakpWaZodglfLnMie3zcJtHun2vQJ63+oxTvPrTKBQd/IZWpt9rUOHBJkViaFRfCciCNYYcD1gXXBocapC789RKIiiij9yls6/7rq4Ev3INlozMS5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250346; c=relaxed/simple;
	bh=oqyAAju77rL7I9tdHbdL32nVK3skm76C4Ttw12VmQpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIBjpcXkxRGth6uvmmIIjETe7HHy75LcZH/lNb3KONqQ/6wyJqyrRuCLXvapDveBIBPXxWyCtd9Vjeck16OVhM1vZBKW03tcANzUI7I67cyXMpNtEzKWE110H0TgpWbu7IaYo3d6ORew+71qnLLL8tn8yyqljuXlDW/SIcSBswY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XkAEE3f4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=es0+5dGg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XkAEE3f4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="es0+5dGg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3C2GX2534202
	for <linux-clk@vger.kernel.org>; Fri, 12 Jun 2026 07:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ZyRBCSN/hk3H4ai8tkv77y4cvsYinOfExSB9fWp4Fc=; b=XkAEE3f4TnrdvXCt
	Hm010cWpKbdklM8bfvOK1brDH5JLTw94l1+cAM9KYo2EzJzUVbKGaEtK6Kn0QMid
	Egj00FXymG9ZyzC469iuO1begwmZB+PPmzGS9WpIxQbb+AfKaQGQRtrD9YvPxzW8
	x2Tm6u/6/m0WLINOfgpMiW85Cirkw1MXrx/4UmNIWBwVc/gLWdh75daImhOsvpF4
	wpOhFOvTzygxot8LW6Y/jmi/C04/sYpMrDBEC2ZRaA3rE+XJ9UffcUGKvNUxsSWB
	rbPYeklWjTKEQxd7RgObdirOn2EmN0IQLTMy/t4xWAHvxQilBS/fOCqds2OUGmJb
	6FpBuA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2u421kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 12 Jun 2026 07:45:43 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7002d6c3426so766957137.1
        for <linux-clk@vger.kernel.org>; Fri, 12 Jun 2026 00:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781250343; x=1781855143; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+ZyRBCSN/hk3H4ai8tkv77y4cvsYinOfExSB9fWp4Fc=;
        b=es0+5dGgh1jFDQQ1iggg+nqQk4zRWkNrd9ZVwuKZEgMbTcUA3yzE0WIMmU9JXMmz7l
         HyzU8AbbGvqzeGoDOEkdWCWfey612eJ9HFpRyQC8/LH4CuXsNSsEPukCYpGSok51XV2u
         Rsrm3XQAhieCZ3Bv+KeBVTQFmAKyA8dW7ZeBkAHKBQfPXH1Waw73ljLVk5yFje5rHHuI
         +iE89PGhnGQYS/+BuM/P/eGEDuup7VKKeLIRJsmq2iAqcyxzOmVPs72P1Ra0SV8vY98M
         kwNodIOpiiPHhL83TjGL9IZjand6uclu2eUJvX2aHNJQYzyJbkIRGZfXYO0TaULVUWd4
         6JVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250343; x=1781855143;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZyRBCSN/hk3H4ai8tkv77y4cvsYinOfExSB9fWp4Fc=;
        b=OB1FelbLn1NdTkgO4d1jKVREPBxchGjfwU7BFPxxHjYVnsCfrfbeQRywSO4H4pKZD6
         7MH6TtIYPJVwlydWM65thtcWzl/ke3hmCWclTv/24QSdn4On/MqUdj0yUZEHo45ybbI0
         Ib1luw+IQLPrcvgM/CUOxY8eShT3akPf3ylzaO4/7xTyEY0ZTMnc1Mcwg/4QZGp13bA4
         JeWiFJzLj9fj6/TsZcpO3WR5fFHmt3xSrq2QCAgTSbnMob2xYLHnJrEMxEAhRTYP+iQE
         cZbtengvEUjUXyjkgcjgMK6r/vZJrsfytvthwKVuOmzVYVWJ/da5ZIaHFVpmevNv208z
         CTaA==
X-Forwarded-Encrypted: i=1; AFNElJ+3uKPb4e44l5O6kVeKMMff9DdCslB6CmFinVGtfU9veZnXVifCOY0WCykh6WrGfCDl8bLb57Eu/wY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdsW5PSu8iAFaoRrO+2UhkEbejX0WxSaybI/WLXIsCmQ4IlHdQ
	QeftUvEjhsrLxfhgIxwDsM3OfmDYrULvvTZtP8f6Toy9zxemA/Jr68c6n/6MW4w5TwMvzxWwGTL
	41qmgzW3DHq7Kj2jU6ToQZptJVPu+YVMYHqxWHA6ETconwBiwJ5wQ5d4RqQv14N4=
X-Gm-Gg: Acq92OFDh7r/aRbf+arEGARPxuWETHQHO8RmACEdCZgFY+opXJJI78YfLOLR+5gsJk2
	Spoh1JRSRET5nWAIygDoENzYNxsf2e4D5D6w3GSznC2TzUinZ4DxStcSr1yiOjCdOXmv53HRrbZ
	OBcc1QdjI7PzRDc763PjkLnDnUB5cLaoDzlh43jNJ7wlYk7NKUfmQPXszrVMifJ5OAzxKKU8Y1f
	sHydTHuEMaOYJKKFUSUY2xacz0AHCN5yac6lrQJ2CHZ0MXVzNweS3wEn34wUTDxBPX0YZ2CrYEQ
	kvzPEbAFLtEBQQLDF0KNgq774imdpsA2LiqmT4xgrbGbHy7VSDN/ujHIAl7Os9/+azbYHY0WtSC
	IsAnQKID/Ut6w0IlksWrx012lzFo275mUF1mpuw1ZhtyalqHEzZy75VM+G6YLrPmLabSrC7r1Lv
	Yh3TAcERRKHngK/Sccez2vJ+4wbVEQ003PcfM=
X-Received: by 2002:a05:6102:5094:b0:631:44b7:b88c with SMTP id ada2fe7eead31-71e88d9512dmr679179137.20.1781250342888;
        Fri, 12 Jun 2026 00:45:42 -0700 (PDT)
X-Received: by 2002:a05:6102:5094:b0:631:44b7:b88c with SMTP id ada2fe7eead31-71e88d9512dmr679165137.20.1781250342454;
        Fri, 12 Jun 2026 00:45:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f3a7c2sm4277131fa.28.2026.06.12.00.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:45:39 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:45:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Herman van Hazendonk <github.com@herrie.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: qcom: add MSM8x60 MMCC driver
Message-ID: <odah75s43zzrl75lh7sl6pmhoy6bd3rxy6h3fl37bjnmbscnvh@h4ehezi3abn2>
References: <cover.1780148149.git.github.com@herrie.org>
 <dae03d8bbd4a9cf14622eff86f8f83460fac5e86.1780148149.git.github.com@herrie.org>
 <a3a6f1a7-5539-48cc-920e-5a555ba04e7f@oss.qualcomm.com>
 <5umlewznxfu7pmprbvbprsqt5uwjzb666kw5gwdxethpfgur54@mlggwypljii4>
 <CAD++jLmm6VyFCrxYA14e-Cbj_7dQu1OkkazYiWS_=tSZgCRqyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmm6VyFCrxYA14e-Cbj_7dQu1OkkazYiWS_=tSZgCRqyA@mail.gmail.com>
X-Proofpoint-GUID: iv0rYkJHpAPojZt4hQ_PKK6paYS7_VPi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2OCBTYWx0ZWRfX5+798AHRZAra
 SCD8qnbyWhWv3Ex9i7a16KLKKDrZc81GQzGso4JoOyJ7ibTrpEOw7Uf7G8zDqHXS1gYOteoXzDP
 4z7dokHVr0/qlI3JyCHAj/Csp6G/wvg=
X-Proofpoint-ORIG-GUID: iv0rYkJHpAPojZt4hQ_PKK6paYS7_VPi
X-Authority-Analysis: v=2.4 cv=N94Z0W9B c=1 sm=1 tr=0 ts=6a2bb927 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=cTwmTnRGAAAA:8 a=G2TPh9Oh8OHQQZjzltAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2OCBTYWx0ZWRfX4zsNMbAabjfT
 UMwcQfHPsyLMddv9fuEsblvYxu83Ze/EAvK8lWLeotWerB43FkL/r/olSTLdj0Nek0s2T4fls9b
 iJaZqKjMa6Z6k09XcNIcfgj47QFwc9lVAv8oUFyjme9uZAwvRwY1PA+CMhcq7D6NKBZLQbBYeml
 XcDLbTEqxtktpyiUi1AX8oAwJ7KznxS50tzdQ2ofgo4n96z8rQW44O2CtTcRIrRY2/3t29VMxpU
 Rji9mAaNDe3hNyNa8rZsDqF//X1YgguGsxq+RPM3COQEVS6R7xiQL0IMlARd7V3lRcjfuS2c7WN
 JXdXnvPvse49V8SWJsq84P5Ge/ujTXsYJ4skRymghr8CXsV16LrA1fQplm8hhkvIXLBDduE6wtq
 0X5Ckz4y9ntf6aJqg0CMXV50VxipTnIe/JVOFDzRJ+As/Zpj3eMEUbHLeVdWAf2t+qVp2hBOPwS
 AIkr9tTbP/5RZmkdMIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120068

On Wed, Jun 10, 2026 at 10:20:28PM +0200, Linus Walleij wrote:
> On Wed, Jun 10, 2026 at 3:39 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > On Tue, Jun 09, 2026 at 03:44:39PM +0200, Konrad Dybcio wrote:
> > > On 5/30/26 3:58 PM, Herman van Hazendonk wrote:
> > > > Add a clock driver for the Multimedia Clock Controller (MMCC) on the
> > > > MSM8x60 family (MSM8260/MSM8660/APQ8060) - the Scorpion-class
> > > > generation that preceded MSM8960's Krait CPUs.
> > > >
> > > > The MMCC layout on MSM8x60 differs from MSM8960 in several ways that
> > > > make a separate driver cleaner than parameterising mmcc-msm8960.c:
> > > >
> > > >   - the pix_rdi mux requires a custom set_parent op that temporarily
> > > >     enables both parents during the glitch-free transition;
> > > >   - the IJPEG GDSC requires releasing AXI, AHB and CORE resets;
> > > >   - several rate-source pairs (MDP pixel, GFX2D/3D) only exist on
> > > >     8x60 (e.g. PLL2-derived 228571000/266667000 for graphics);
> > > >   - the camera CSI / VFE / JPEG / VPE / ROT clock topology lacks the
> > > >     later 8960 reorganisation.
> > > >
> > > > Used on the HP TouchPad (Tenderloin) for graphics (Adreno A220),
> > > > display (MDP4), camera (CSI/VFE), JPEG (Gemini), VIDC, VPE and
> > > > rotator. Reset IDs are exposed via a separate header so consumers
> > > > can reset the GDSCs and individual blocks.
> > > >
> > > > Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> > > > ---
> > >
> > > [...]
> > >
> > > > +   .clkr.hw.init = &(struct clk_init_data){
> > > > +           .name = "pll2",
> > > > +           .parent_data = (const struct clk_parent_data[]){
> > > > +                   { .fw_name = "pxo", .name = "pxo_board" },
> > >
> > > Please drop .name (the kernel-global clock lookup), this is only a
> > > backwards compatiblity measure on existing drivers. For new entries,
> > > .index is the best (because well, it's the fastest)
> > >
> > > [...]
> > >
> > > > +static struct clk_branch camclk0_clk = {
> > > > +   .halt_reg = 0x01e8,
> >
> > From msm-3.0:
> >
> > +#define DBG_BUS_VEC_I_REG                      REG_MM(0x01E8)
> >
> >
> > So, it seems, it is a debug reg, not an actual halt reg (but I might be
> > mistaken here, I haven't looked into the details).
> 
> I think the define just has a bad name. You have to look
> at how it's used.
> 
> This define is in msm-3.4 for msm8960, clock-msm8960:
> #define DBG_BUS_VEC_I_REG                       REG_MM(0x01E8)
> ... and then it is used in 10 different places as a halt reg:
> 
> $ git grep DBG_BUS_VEC_I_REG *
> clock-8960.c:#define DBG_BUS_VEC_I_REG                  REG_MM(0x01E8)
> clock-8960.c:           .halt_reg = DBG_BUS_VEC_I_REG,
> clock-8960.c:           .halt_reg = DBG_BUS_VEC_I_REG,
> clock-8960.c:                   .halt_reg = DBG_BUS_VEC_I_REG, \
> clock-8960.c:           .halt_reg = DBG_BUS_VEC_I_REG,
> clock-8960.c:           .halt_reg = DBG_BUS_VEC_I_REG,
> clock-8960.c:           .halt_reg = DBG_BUS_VEC_I_REG,
> clock-8960.c:           .halt_reg = DBG_BUS_VEC_I_REG,
> clock-8960.c:           .halt_reg = DBG_BUS_VEC_I_REG,
> clock-8960.c:           .halt_reg = DBG_BUS_VEC_I_REG,
> clock-8960.c:           .halt_reg = DBG_BUS_VEC_I_REG,
> 
> and in the mainline msm8960 driver 01e8 is used as a halt reg
> in the as well, see drivers/clk/qcom/mmcc-msm8960.c.

Ack. It would be nice if this was mentioned in the commit message.

With the commit message updated, it makes sense to me now.

> 
> Some qualcomm clock registers being named DBG_* has no
> semantic meaning, one has to look at the usage. Maybe at
> some point some engineer thought it's a debug feature to
> be able to halt a clock.
> 
> Yours,
> Linus Walleij

-- 
With best wishes
Dmitry
