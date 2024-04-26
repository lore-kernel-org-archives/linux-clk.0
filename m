Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F21A13F01A
	for <linux-clk@vger.kernel.org>; Fri, 26 Apr 2024 09:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714124163; cv=none; b=EdjFIo4azqOBgdbkcRRkNEHb1wVr91Jt+OFlLIHUCLGs9CwvMU9zspdMQ7AFynoddiGL1RJITKlC+UaBSY6RYf7/vknY5m/zyY0HgEMUTa+LC0zktDA7f3Q/Jbxn4SyL26N/IHSOsMS3oHFYTSDf3Kr7k87TMniqlVH7wc1KcMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714124163; c=relaxed/simple;
	bh=pN3yy4CmQ4hSslxqgMrAB2AztZnKL7xpwpzx81cP/aE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s4ahK7N1bchknaKqtHaV3iztvm2HXDRpWPK5mc89meMtyXTiwGMjNrssGWTXjEa+VZJKRHT2RKYO0zZ0l6PiZ+2mZfsewRPvYQ0N1fI4DBTtyW7MQCrm6OMA5LVyxsQgWMTgt4k0NJaud3t0i+wP8yPNBs2IBRtxNjIcgdLumuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HktyPIZd; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HktyPIZd"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-de54b28c41eso2178896276.0
        for <linux-clk@vger.kernel.org>; Fri, 26 Apr 2024 02:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714124159; x=1714728959; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G7WFcySPvcg+ldo/VhFJ6svW9p0g+/3RSWp3xt+xPYc=;
        b=HktyPIZddmdNrMPSXGExNh3sAJsGhQc/kPgoAn5CjQZ+QSzX5uvWofpTBpte5TlpvF
         rKEvE8oTnS07mnTS0PcGyd6ldLK7wJny9HCqRh4Ar006hKZcwF7L7kMpceT7AvbeEV1a
         J/y5Bs+1OnHNqvd9BnnFSVUTCL2X8ZndLnVHWq1bcvH1IWE69ivpgL3avN03X7qzGWr1
         vNZUkQv1stl26mB5ATf0tWCeZoqMKY2uBCvd+ZUa2Yzst6/DX8rMn+yYuzzvxVm/MTAo
         yQ2vBTir3s+NbvkS95tMCDdRWfY79hKxARNAzF361+dxcQ1kmAwg1vc4XCl0OUSZ50B7
         6T9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714124159; x=1714728959;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G7WFcySPvcg+ldo/VhFJ6svW9p0g+/3RSWp3xt+xPYc=;
        b=oH2IdGwvSPMDhQdE3I1A/6CKW60SMs2gCDKogKah6RLXInpPthS2gL+VSAIMVmjZ1a
         g7f2pcjNjOOXDsvk404poOL9YRS0mBU69AebmWdtgzsRFr2mNpFIt/MyLWHNlREuNoH0
         ockJCXHZCTLD99Lz6qgqnOehUOdn/0GPlJfZD6f7bCJbzn9/Fsq+pBRV+ZSb0LDspWoe
         OJO57AOCyEBGt0kusE977s0jhOWaNTJAG0GJg0OsrPiubAAWugcZ1yug7EaT/z4AphMh
         Ywf7VuTLtO0tQGIC3xkou2sGFsRH0nJuvHquaZtF9P9cDMDbwrTCEgvUSZvCn7xTJkDj
         p1aw==
X-Forwarded-Encrypted: i=1; AJvYcCXtOkj8BN/sHtL3c32Do92oCk7jFIz/TmQZ8rNX+DgjDrqvSMXuRlBgkGGQ3lzWyFhcif06/Ajn6+Z2mdvyYfIdFya3QTl4gq0p
X-Gm-Message-State: AOJu0YxGkTkieFa1dSM1vPMEYm62KT/UpKpGxVhEJQWSZufFaz5k2vIj
	RotF+F87bHzORx/0E2+4p/PUnLfEQs8P3HLx8/ajqUfAOUHlAfJwsjvh4mWjLlwvZbUysUCKR8E
	pSrJVziqpTIxRLtG/s8ta3f/LzebRG8jaK44pgQ==
X-Google-Smtp-Source: AGHT+IGRxb+h564OecbbHaINPtM7+aIceXzejpd3vORJuXQEIFRy1ifQGFmUA/Nv+Pgt7RnHaz3NbXj1yxxbCy+Q+7o=
X-Received: by 2002:a25:9392:0:b0:de5:4a94:b027 with SMTP id
 a18-20020a259392000000b00de54a94b027mr2063862ybm.53.1714124159108; Fri, 26
 Apr 2024 02:35:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416182005.75422-1-quic_ajipan@quicinc.com>
 <20240416182005.75422-8-quic_ajipan@quicinc.com> <CAA8EJpqwrKcgm7c57=LpxS7+CfrN2UxNg8k_46auBrdZG7vQnA@mail.gmail.com>
 <ca017ebf-c099-b436-f062-1341f765a08c@quicinc.com>
In-Reply-To: <ca017ebf-c099-b436-f062-1341f765a08c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Apr 2024 12:35:48 +0300
Message-ID: <CAA8EJporZFsjagW5CU5AwtqDsEXTtGJmRmLRedyBTZa7249p6w@mail.gmail.com>
Subject: Re: [PATCH V2 7/8] clk: qcom: Add GPUCC driver support for SM4450
To: Ajit Pandey <quic_ajipan@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Apr 2024 at 12:20, Ajit Pandey <quic_ajipan@quicinc.com> wrote:
>
>
>
> On 4/17/2024 11:35 AM, Dmitry Baryshkov wrote:
> > On Tue, 16 Apr 2024 at 21:23, Ajit Pandey <quic_ajipan@quicinc.com> wrote:
> >>
> >> Add Graphics Clock Controller (GPUCC) support for SM4450 platform.
> >>
> >> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> >> ---
> >>   drivers/clk/qcom/Kconfig        |   9 +
> >>   drivers/clk/qcom/Makefile       |   1 +
> >>   drivers/clk/qcom/gpucc-sm4450.c | 805 ++++++++++++++++++++++++++++++++
> >>   3 files changed, 815 insertions(+)
> >>   create mode 100644 drivers/clk/qcom/gpucc-sm4450.c
> >
> > [skipped]
> >
> >> +
> >> +static int gpu_cc_sm4450_probe(struct platform_device *pdev)
> >> +{
> >> +       struct regmap *regmap;
> >> +
> >> +       regmap = qcom_cc_map(pdev, &gpu_cc_sm4450_desc);
> >> +       if (IS_ERR(regmap))
> >> +               return PTR_ERR(regmap);
> >> +
> >> +       clk_lucid_evo_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
> >> +       clk_lucid_evo_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
> >> +
> >> +       /* Keep some clocks always enabled */
> >> +       qcom_branch_set_clk_en(regmap, 0x93a4); /* GPU_CC_CB_CLK */
> >> +       qcom_branch_set_clk_en(regmap, 0x9004); /* GPU_CC_CXO_AON_CLK */
> >> +       qcom_branch_set_clk_en(regmap, 0x900c); /* GPU_CC_DEMET_CLK */
> >
> > My main concern here is the AON clocks. If we don't model
> > gpu_cc_demet_clk as a leaf clock, then gpu_cc_demet_div_clk_src
> > becomes a clock without children and can be disabled by Linux.
> > Likewise not modelling gpu_cc_cxo_aon_clk removes one of the voters on
> > gpu_cc_xo_clk_src, which can now be turned off by Linux.
> > Our usual recommendation is to model such clocks properly and to use
> > CLK_IS_CRITICAL or CLK_IGNORE_UNUSED to mark then as aon.
> >
> Thanks for review, actually if leaf (branch) clock is ON, hardware will
> take care of enabling and keeping the parent ON. So parent clocks won't
> get turned OFF in HW as long as branch clock is enabled.
>
> For clocks which are fixed rate (19.2MHz) and recommended to be kept ON
> forever from HW design, modelling and exposing clock structure in kernel
> will be a redundant code in kernel memory, hence as per earlier
> suggestion in previous thread such clocks are recommended to be kept
> enabled from probe.

Recommended by whom?

Kernel developers clearly recommend describing all the clocks so that
CCF has knowledge about all the clocks in the system.

> >> +
> >> +       return qcom_cc_really_probe(pdev, &gpu_cc_sm4450_desc, regmap);
> >> +}
> >> +
> >> +static struct platform_driver gpu_cc_sm4450_driver = {
> >> +       .probe = gpu_cc_sm4450_probe,
> >> +       .driver = {
> >> +               .name = "gpucc-sm4450",
> >> +               .of_match_table = gpu_cc_sm4450_match_table,
> >> +       },
> >> +};
> >> +
> >> +module_platform_driver(gpu_cc_sm4450_driver);
> >> +
> >> +MODULE_DESCRIPTION("QTI GPUCC SM4450 Driver");
> >> +MODULE_LICENSE("GPL");
> >> --
> >> 2.25.1
> >>
> >>
> >
> >
>
> --
> Thanks, and Regards
> Ajit



-- 
With best wishes
Dmitry
