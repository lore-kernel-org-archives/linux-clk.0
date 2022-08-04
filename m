Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D90C25B06
	for <linux-clk@archiver.kernel.org>; Thu,  4 Aug 2022 14:38:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239511AbiHDOin (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Aug 2022 10:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239931AbiHDOiK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Aug 2022 10:38:10 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B72FB4B490
        for <linux-clk@vger.kernel.org>; Thu,  4 Aug 2022 07:38:00 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id h22so14994696qta.3
        for <linux-clk@vger.kernel.org>; Thu, 04 Aug 2022 07:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=7+IHbVKhZDeIBaRjLawIcx6LVul+QTItAJZIivf7gqY=;
        b=ufg49NFoFDlcynz7pWTVmRZhy3xSI5kCn759tZ9vmnuuILMCnEORQp/wBS20nhayS0
         0V/i9wvAy3/uIPea3V1Dc3KE6RFzKLuc6hvXJCqHND9c6lE2XyrjkibgMVbhDeCn1v2R
         gyUSdh5efbQF1Kfqv/rldgMScFGi1Zexm0JHNJFrnmsrmNTcqvJkS+57bkDuzgzP49qa
         9fpV2hKosk1g95G4qPSblTffq9M3wpMi/Fp/BVJkOYDM++1irp2TinOWITa9Hh41mj1e
         Md8QcHg4Gk2QOv3qB75ic5zv5DgccD9sqiLfEBzzfZ6NHDB5JxQX5smDIAnM9m40i0vL
         VmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=7+IHbVKhZDeIBaRjLawIcx6LVul+QTItAJZIivf7gqY=;
        b=ysaKvwG9iJXG8X1FEBXKgWA0iuAaugJhQ2NF9jBxrBCepO6qKUvD/Qrti2ZBqBHPeu
         5v0pnIpfWPwb/dVLgJZspF5fPaT4O4G9huKsSa0ACVPtUDfB/2O6S8uJSQ4SB6smPze4
         InUuC6YrlMR7xsJUwm3C9+VAF/3/PLac7YHUNZnDaOM69HWAKHRvXEnO/rc88KVGGr7b
         pIATug0fKWPhx9HPF4pazp6MyX2ITR4diunUhNv8x5Y8AYJ/r8T0iBtvpK/UnTT4Kf93
         z67LwMPe3OucoktfIkiF+8KtVNIU0JD+W1ku+l0QaQABn/8oxkoNzLH4uPXz4APyScWi
         mN5g==
X-Gm-Message-State: ACgBeo0kD3LAyLtLHduFX3d4c4dtBB97xrxEmltEKNqosPXg4jenpbrL
        q03vO4blNh3SJ/mxOmUTVpR8I9hWwbTxoRifyAJSqDCTXwo=
X-Google-Smtp-Source: AA6agR4WNXQ2KgIruLMHS5Z92OaFYRF1mhbz0dJnN3rCVTFktyanCvf1eGyY73ch+e2FzcsIKbVSG1MHLbE2q7LsGcE=
X-Received: by 2002:ac8:5942:0:b0:31f:39f6:aba7 with SMTP id
 2-20020ac85942000000b0031f39f6aba7mr1755983qtz.295.1659623879819; Thu, 04 Aug
 2022 07:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220804103456.3176943-1-abel.vesa@linaro.org>
In-Reply-To: <20220804103456.3176943-1-abel.vesa@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 4 Aug 2022 17:37:48 +0300
Message-ID: <CAA8EJpoYrXNBeZfDTAmjhsHaMqO+jeUVt4BtQkKy=T7Q0EuH8A@mail.gmail.com>
Subject: Re: [RFC] clk: qcom: common: Detach the power domain at the end of probe
To:     Abel Vesa <abel.vesa@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 4 Aug 2022 at 13:35, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> None of the CCs actually need the PD attached to their device,
> but rather some GDSCs registered by those CCs need that PD as a parent
> in order to propagate power gating and the performance state.
>
> So lets detach the PD from the CC right at the end of probe, after
> everything has been successfully set up.

Would it still be possible to read the clock registers if we detach
the device from the domain?
I think it was the original issue behind putting the dispcc/videocc
into the MMCX domain: to be able to poke into the clock registers,
which are gated by the MMCX.


> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>


-- 
With best wishes
Dmitry
