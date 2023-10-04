Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B79B1E7B5FB
	for <linux-clk@archiver.kernel.org>; Wed,  4 Oct 2023 12:08:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242255AbjJDMJB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Oct 2023 08:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242295AbjJDMJA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Oct 2023 08:09:00 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3B27A1
        for <linux-clk@vger.kernel.org>; Wed,  4 Oct 2023 05:08:56 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-59f6767a15dso7568387b3.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Oct 2023 05:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696421336; x=1697026136; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uooSCEajVBYK+4N0+yQr6mZZtZ+slaSkRYJcX2gZXHI=;
        b=kDoGAw34oxM+nOzkNmfq7bdgUXnevfn7o3Z9hPM7hYXbFDy+fQac0vGhjC8i3V8/75
         TAO4U7TzvXGPdq7wRTtc1TPZlGeTdySMMHX9DXMAT51qacvtN5wyNENyqn5pWC6YjiaU
         V5qSfvKhfVCEr4zSh7pqvFyZqFeSnXe8SysRkh4w+z6phIWWy7MuwQaGSzotjS21yRWG
         PEbDRVKoA7psgdRRy4km4RKk6T1/31S7BKM0Zy0kYqZvCw526IOxOSF5D4rseTzh7lKI
         IXNrUtQpHwmqhiPOOfbSayL7WpW7wydnwrLhOb5lE2fOexuvmBu1gnfcU4jZg42pc01w
         ygMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696421336; x=1697026136;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uooSCEajVBYK+4N0+yQr6mZZtZ+slaSkRYJcX2gZXHI=;
        b=durreyl6VVe2RS51G839ACP8QcMlb0ow+CSbFsO5tc/9NhOVql3cHDfv+af0SgDISE
         CbPLeRSTl75VrKDv2GZ+u7WKHkQUkA9ne0capRVRT1GVJU3/3TjOhmc19BVc4IcIFuEz
         5OvNqu/cGgsJqVa0aJGg39lDpikINM01ks+0nT2nJEscb/5kUYFItzIAFQ+39JTsCKOE
         I2SukwtCtx8y22x8horQllYQNcea9l3vKCst2NCF10pfOc/xNaa8zNwq/sV/VRMIEkNM
         sHPiX1V8wp/y3RmIbh5orecuLiNKwzOSMvvIhfpkp1w1CtlBW567q6I7D4QIMxZ0n5gh
         Ouxg==
X-Gm-Message-State: AOJu0YwXHSaPJ0MsqAp4JNhPt70IFk5q3KQSmiOBO8AnRMaU2vyag27X
        RZdVOlfSu4Y9xVDVi76G95A1yR/yOugZ3GswcJN4qxcCHSmIdcMw
X-Google-Smtp-Source: AGHT+IGtNE8Bdim5k+kYMkJxXavlzqknUeIEsO5VdfFSg069KV3TIGpu0ks7PhJezu1+AvnccNCYRy4M1pbtuCRnghc=
X-Received: by 2002:a0d:d801:0:b0:59f:79e7:6e5d with SMTP id
 a1-20020a0dd801000000b0059f79e76e5dmr3952734ywe.15.1696421335974; Wed, 04 Oct
 2023 05:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
 <20231004003125.2289613-2-dmitry.baryshkov@linaro.org> <f129633e-4df7-4984-a19e-c16e6c7c8f3f@linaro.org>
In-Reply-To: <f129633e-4df7-4984-a19e-c16e6c7c8f3f@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 4 Oct 2023 15:08:44 +0300
Message-ID: <CAA8EJprGfS5x89FOWhjPCdLzSNbEK-U1h8qVmfiLc6+4NjEiNA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] clk: qcom: implement RCG2 'parked' clock support
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 4 Oct 2023 at 12:27, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 04/10/2023 01:31, Dmitry Baryshkov wrote:
> > clk_rcg2_shared_ops implements support for the case of the RCG which
> > must not be completely turned off. However its design has one major
> > drawback: it doesn't allow us to properly implement the is_enabled
> > callback, which causes different kinds of misbehaviour from the CCF.
> >
> > Follow the idea behind clk_regmap_phy_mux_ops and implement the new
> > clk_rcg2_parked_ops. It also targets the clocks which must not be fully
> > switched off (and shared most of the implementation with
> > clk_rcg2_shared_ops). The major difference is that it requires that the
> > parent map doesn't conain the safe (parked) clock source. Instead if the
> > CFG_REG register points to the safe source, the clock is considered to
> > be disabled.
>
> Why not have a new bit in .flags ?
>
> Instead of lying about the clock being off, mark the clock as "parked",
> or "safe parked" or whatever term we choose for it ?

The main problem with adding flags doesn't fully scale. From the CCF
perspective, what should be the difference between parked and disabled
clocks? How should it treat the parked one?

From my point of view, the 'parked' clock is as good as 'disabled',
because the end devices do not work with the corresponding clock being
sourced from XO.
We already have a similar implementation for the PCIe PIPE clocks,
which reinterpret physical 'XO' source as a 'disabled' state to
facilitate disabling the clock before turning the genpd off.

>
> I feel 'disabled' should mean disabled and 'enabled' should me enabled
> when I read a value from debugfs and if we are parking a clock it should
> have a clear means of being flagged as a clock that should be parked.
>
> An example. I recently inherited some autogenerated code for camcc on
> sc8280xp.
>
> One of the clocks is marked as CLK_IS_CRITICAL by the autogen code
> meaning "never switch off" but CLK_IS_CRITICAL stops the camcc driver
> from doing runtime pm_ops to power collapse.
>
> The solution I have is to remove CLK_IS_CRITICAL and to hard-code in
> probe() the clock to always on.
>
> But if we had a CLK_DISABLE_SAFE_PARK flag - then not just for rcg but
> for branch clocks we could differentiate away from hard-coded always on
> in probe...
>
> ?
>
> ---
> bod



--
With best wishes
Dmitry
