Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8396FC4320A
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 15:54:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6559560F45
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 15:54:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235643AbhH2PzH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Aug 2021 11:55:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232311AbhH2PzG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 29 Aug 2021 11:55:06 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 812F4C061756
        for <linux-clk@vger.kernel.org>; Sun, 29 Aug 2021 08:54:14 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id s16so5151192qvt.13
        for <linux-clk@vger.kernel.org>; Sun, 29 Aug 2021 08:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2lFAxhd8GYho/4ODjYlv7uZMw/0eD5pCCmeHLl+hjPs=;
        b=mhx9ENQXODT+mzzMPqmHKUrwyDP2qJQeuDuWMS01gHPl43XhTaDa7GIwT5EZrzsKlW
         XYrJjSXdlg7yFUzDfgrCTeHHFsuK2dGZzpV4e6dDVB43n3znpV5NEOSV5Jb1W542jRuk
         3Ofp66c2GUjahl/LYi4ixx1JYqgz/DPjN3n81ynmXWItJ02c662hvQlZJ1N7wNrBFO+d
         LdaHQwaSptg/CV5S2SQ5h/HKx10wJDGKG7Ca5b+kZqHAA7E2f6cJi7/dwGX3PtU2JrjL
         3R1ypHe5H4Nhg5SwUbFTCZPhLiX53TmhoEGWfqxj67tEbpLDIljuQerpXkUz8qslJ05v
         IL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2lFAxhd8GYho/4ODjYlv7uZMw/0eD5pCCmeHLl+hjPs=;
        b=gs0Tch2zY2PtdJvDAkiLtuvAEXzTWTC/c8QPnBRd09+9Mm8qtUdrY5GH1xiwG9WebF
         avwWXU1unhB7DVE2xGaJUkEeoIQ59TjvCEM8mTDvgdlnlvr6br05gWC/oVWz5XoYwz56
         UPyyCvcLWnPDSK2HGkN684MjNiQ6OEb7GAZCKRckWRVEjcOHBF9uXUXNbjDST34O5NRi
         qMrRvlmXpWNTQeX/NEfYoBJke3TVS0b1H6DpX3+La8O06td11qmQXBd7wWBhEYYBVasG
         SYvZanvY6oMQ0kypj1QdlaBppsS3pww3ryiobEiEJjm2wy/XAw6oXL3uvaPQKvrEMCsS
         Pm1w==
X-Gm-Message-State: AOAM532a9VNq6Co8hClV5lZX6n1oUv/laeA08f6qyCaKPfOFotTLLrIA
        U23fvnPSX9Cq/mC8ZrJ+cOwOJ2rvE7vg7wn0cRtfQw==
X-Google-Smtp-Source: ABdhPJxe1bgF3xh2bIKzCa9HbcdEnoBohTsx5XK2a6WNzZeS4ponlbCpnvpXa1C9Dxt2513WX+SXZNaLMUhG2s0WPzc=
X-Received: by 2002:a0c:cb8f:: with SMTP id p15mr19218569qvk.2.1630252453659;
 Sun, 29 Aug 2021 08:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210727202004.712665-1-dmitry.baryshkov@linaro.org>
 <163000270629.1317818.2836576068466077505@swboyd.mtv.corp.google.com>
 <42c3fa20-7ffa-255f-ca28-6f0aa2aa4a13@linaro.org> <163020909027.2218116.11109424225803296345@swboyd.mtv.corp.google.com>
In-Reply-To: <163020909027.2218116.11109424225803296345@swboyd.mtv.corp.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 29 Aug 2021 18:54:02 +0300
Message-ID: <CAA8EJppo8Zze5ViYOWooHy=RR4ueXNeWiBFyKdtpUcm5Cs69ew@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] clk: qcom: use power-domain for sm8250's clock controllers
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 29 Aug 2021 at 06:51, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2021-08-26 14:56:23)
> > On 26/08/2021 21:31, Stephen Boyd wrote:
> > > Quoting Dmitry Baryshkov (2021-07-27 13:19:56)
> > >> On SM8250 both the display and video clock controllers are powered up by
> > >> the MMCX power domain. Handle this by linking clock controllers to the
> > >> proper power domain, and using runtime power management to enable and
> > >> disable the MMCX power domain.
> > >>
> > >> Dependencies:
> > >> - https://lore.kernel.org/linux-arm-msm/20210703005416.2668319-1-bjorn.andersson@linaro.org/
> > >>    (pending)
> > >
> > > Does this patch series need to go through the qcom tree? Presumably the
> > > dependency is going through qcom -> arm-soc
> >
> > It looks like Bjorn did not apply his patches in the for-5.15 series, so
> > we'd have to wait anyway. Probably I should rebase these patches instead
> > on Rajendra's required-opps patch (which is going in this window).
> >
>
> Ok. Thanks. I'll drop it from my queue for now.

Just for the reference. I've sent v7 of this patchset. After thinking
more about power domains relationship, I think we have a hole in the
abstraction here. Currently subdomains cause power domains to be
powered up, but do not dictate the performance level the parent domain
should be working in. While this does not look like an issue for the
gdsc (and thus it can be easily solved by the Bjorn's patches, which
enforce rpmhpd to be powered on to 'at least lowest possible'
performance state, this might be not the case for the future links. I
think at some point the pd_add_subdomain() interface should be
extended with the ability to specify minimum required performance
state when the link becomes on. Until that time I have changed code to
enforce having clock controller in pm resume state when gdsc is
enabled, thus CC itself votes on parent's (rpmhpd) performance state.


-- 
With best wishes
Dmitry
