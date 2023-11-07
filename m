Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D522D1870
	for <linux-clk@vger.kernel.org>; Tue,  7 Nov 2023 02:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cDPWvasy"
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC80411F
	for <linux-clk@vger.kernel.org>; Mon,  6 Nov 2023 18:00:16 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5a7c95b8d14so56054297b3.3
        for <linux-clk@vger.kernel.org>; Mon, 06 Nov 2023 18:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699322416; x=1699927216; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=srgMrDERDuArNaxuZd4HI4TnsAEBPNaQibROPDY10RI=;
        b=cDPWvasyZHWw5JwFQatpWvqBq7EV2FdYKftGLVRTdfRxT6UVmlH+BKL5TCSkiaqReq
         hPlOPL4JnFGqY4ffDczDW3IkqLT6eCQsd19mMssJWsFuR4lNxFv88nl75hGANCDFzcDe
         OFCdYQxhuZdxNjXNg6AMrF/UyjehDqqQpTsY0PbUcu599AFvid/mRq4bBWhbacmQKs/6
         85Zf4n7P3I3Ljg9LnqtrWsIcPyW7e+Qzefptg8eYQbTLIS/Q67MP2xXE7yw3VOnAkwZK
         oV4R8eyJ3lv6tA/FSZVAB05YJ6CPl9Zq9kUsI31rKZ8Xe+RKTv3hiS6DWjnujGIZlKZX
         JncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699322416; x=1699927216;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=srgMrDERDuArNaxuZd4HI4TnsAEBPNaQibROPDY10RI=;
        b=Oc4TEKqNtXjVSLEpWQcnebrViMFMpdcaCKSIqKTgExKX+kXBPepvmhOEfq70yT18Hb
         NZmcKSnpIl+Y4j01R0Y8QJZNU1Gr+cFhCECh79QJao6hJGxf9pnTjGnlUk4lfjJ4lSE1
         fXUco7KjlA+GA+JR61hHBWNKwNlGtDOeDJ4f4PapoUnWlK507+h1cXErFhXwNyTnUTWf
         QXl/Tyu/5Et5EscsZ3Bke8Jl9BDCEir97Ug1eoeRN2Z2RD8szM0piPcNiugXUHryYuOc
         aMWcvZ7Qj1FmvpaHfHNCy2mxiZfwoL9xBNdLyOIcm70m+up6Xd6llO7h1HMISkcKliKT
         ZNyQ==
X-Gm-Message-State: AOJu0YwL73MnKGf8/uP9+lPqrsg8wF3F+RpC68ETARdTsJqZhsP3gp93
	lydrBOq/BkZoL49O0UMl7M/Lncv6Os3znxlmkvolVQ==
X-Google-Smtp-Source: AGHT+IGAbwSZWyye4E84dHHgparQ8O40wfiIiUoHGpNlnz9M5tSIRTKwGliiUOzCtSfXVSHBz472Uh2ULr30uqHoDxs=
X-Received: by 2002:a0d:d8d1:0:b0:5af:7330:9f1e with SMTP id
 a200-20020a0dd8d1000000b005af73309f1emr9610473ywe.28.1699322415998; Mon, 06
 Nov 2023 18:00:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231004012308.2305273-1-dmitry.baryshkov@linaro.org>
 <20231004012308.2305273-3-dmitry.baryshkov@linaro.org> <2346f541be5b8528ad1a16df256a2f50.sboyd@kernel.org>
 <1290a5a0f7f584fcce722eeb2a1fd898.sboyd@kernel.org>
In-Reply-To: <1290a5a0f7f584fcce722eeb2a1fd898.sboyd@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 Nov 2023 04:00:04 +0200
Message-ID: <CAA8EJpq_pvtCxuPKrHmUOgsDFmDeG8cuUcynvvk-0SJNY3HJnA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/3] clk: qcom: implement RCG2 'parked' clock support
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, freedreno@lists.freedesktop.org, 
	Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Nov 2023 at 03:36, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Stephen Boyd (2023-11-03 18:24:47)
> > Quoting Dmitry Baryshkov (2023-10-03 18:23:07)
> > > +
> > > +       ret = regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       return FIELD_GET(CFG_SRC_SEL_MASK, cfg) != rcg->safe_src_index;
> > > +}
> > > +
> > > +static int clk_rcg2_parked_init(struct clk_hw *hw)
> > > +{
> > > +       struct clk_rcg2 *rcg = to_clk_rcg2(hw);
> > > +       const struct freq_tbl *f = rcg->freq_tbl;
> > > +
> > > +       regmap_read(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), &rcg->parked_cfg);
> >
> > I need this part today to fix a stuck clk problem I see on trogdor.lazor
> > where during registration a call to clk_ops::get_parent() sees the clk
> > isn't enabled at boot (because there isn't a clk_ops::is_enabled()
> > function) so clk_rcg2_shared_get_parent() reads the parent from the
> > 'parked_cfg' value, which is zero. If the hardware actually has non-zero
> > for the parent then the framework will get the wrong parent, which is
> > what happens on trogdor when the devmode screen is shown. The parent is
> > the display PLL instead of XO. I haven't dug far enough to understand
> > why disabling unused clks wedges the branch when we try to enable it
> > again, but not disabling unused clks fixes the problem or reading the
> > config register at registration to get the proper parent also fixes it.
> > I guess the problem is that we're switching the RCG value when we
> > shouldn't be doing that.
> >
>
> I looked at this more today. It seems that I need to both read the
> config register at init and also move over the rcg to the safe source at
> init (i.e. park the clk at init). That's doable with a call to
> clk_rcg2_shared_disable() for the clk_ops::init callback. Otherwise I
> get a stuck clk warning.
>
> Either
>
>  disp_cc_mdss_mdp_clk status stuck at 'off'
>
> or
>
>  disp_cc_mdss_rot_clk status stuck at 'on'
>
> When I don't park the rcg, the disp_cc_mdss_rot_clk gets stuck during
> disabling of unused clks. I think I understand that problem. What
> happens is disp_cc_mdss_mdp_clk_src and disp_cc_mdss_rot_clk_src are
> both sourcing from disp_cc_pll0 at boot. Fixing the parent mapping makes
> it so that enabling and then disabling disp_cc_mdss_ahb_clk causes
> disp_cc_pll0 to be turned off when disp_cc_mdss_rot_clk_src is sourced
> from it (and the branch disp_cc_mdss_rot_clk is enabled). If we park
> both the rcgs at clk registration time we avoid this problem because the
> PLL is disabled but nothing is actually a child clk. The act of reading
> the config register and stashing that in the 'parked_cfg' only helps
> avoid duplicate calls to change the rate, and doesn't help when we try
> to repoint the clk at XO when the parent PLL is off.
>
> The part I still don't understand is why reading the config register at
> init and stashing that in 'parked_cfg' fixes the disp_cc_mdss_mdp_clk
> stuck at off problem. I see that the branch clk is turned off and on
> many times during boot and there aren't any warnings regardless of
> stashing the config register. That means we should be moving the RCG to
> XO source, between forcibly enabling and disabling the RCG, which
> presumably would complain about being unable to update the config
> register, but it doesn't. Only after late init does the clk fail to
> enable, and the source is still XO at that time. Something else must be
> happening that wedges the branch to the point that it can't be
> recovered. But simply reporting the proper parent is enough for
> disp_cc_mdss_mdp_clk.

I suppose that the issue is caused by mdss_gdsc or mmcx also being
shut down at the late_init. And if I remember correctly, properly
parking disp_cc_mdss_mdp_clk to the XO solves this issue. This is
where is_enabled comes to play. Adding it changes the
clk_disable_unused behaviour.

-- 
With best wishes
Dmitry
