Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4199EC83F17
	for <linux-clk@archiver.kernel.org>; Mon, 28 Aug 2023 09:52:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbjH1Jv5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Aug 2023 05:51:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbjH1Jva (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Aug 2023 05:51:30 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32327118
        for <linux-clk@vger.kernel.org>; Mon, 28 Aug 2023 02:51:26 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-d74a012e613so4144320276.1
        for <linux-clk@vger.kernel.org>; Mon, 28 Aug 2023 02:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693216285; x=1693821085;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ij/ixhJNQiAk+bZwLk7P9bcr0ExdcnJdmk1KM+v6qMg=;
        b=TAtmfieieDUstkl2+NwLV9lHYB8MR8y86Ya+cRhD66lVUKtZ8EmNZF611vDNhycHq6
         RAG9YCGyf5KRI2LCzKpcq5N51m6B+ww//48yalTSPVEahCsIPhVk5Y7jNkx3TMAAo7hM
         GNYpIMnakzcKBQGJNk3U3pbrIfiQN2l84gFXQfxRmSgyzJXXh9o+3vFPcoPTLrlLLHjg
         RCAipHpoEmuhzZRUNUxaCz8elPO177gsFoEn4ez4AXAUpStsLMhgKReoNpT1Ygm5577d
         lvJ2MrwXuPeEijl1V1cqxfkJjUefkiisNGHGr5Th9UoOIOcgC+I6+JQtSYmsE4FPiAj+
         m5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693216285; x=1693821085;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ij/ixhJNQiAk+bZwLk7P9bcr0ExdcnJdmk1KM+v6qMg=;
        b=ktydSisYweJTAgHAGSwI/EujcCHmF0laIlfIZEjfUn585s9cpC/xNCPn8QF0mGXWbR
         C8x01ETqV5a3kHxTSUy7LASVFEkiYgkke6q27jleM1iRs/lFtHaZFJL0Z99LNYkWP2W2
         wSUrl09ymCz8xM0AONR2U/2wJky6xLP5gCA0AZMaxwwSrMwx+QKM836m/Ndl0Vt0BZT9
         8K7xN0c9ZLtYazR4kXOaVPmELutLiCIoAwKoN9rJCW1F2qBsixB0pe7pqDCsHbPd15/p
         JpQLiBSKZAUWcT04UX1gvXBhmQSYLdf8GOgno6JO6nv1BJ/nXXQgJSxY6VJg3uGofdMP
         UatQ==
X-Gm-Message-State: AOJu0YyQdXJF7Z/FCCttT6lC0lvxkRPNl6HHQA6FEtPRL914LElxHpQ1
        RoxGIiZhjtYkrIyGi7FTjLsGRQUb/aXAHS/O89xFvw==
X-Google-Smtp-Source: AGHT+IHMMPGzXX2cW5IcOCKq4arQnF2HZdkyJNgtpKLsJixMwGCtJEqpnV0q+I1Fh+mNln2paZJzihB9mbHFdSX6FLc=
X-Received: by 2002:a25:ac19:0:b0:d60:b5f2:9824 with SMTP id
 w25-20020a25ac19000000b00d60b5f29824mr23015952ybi.23.1693216285191; Mon, 28
 Aug 2023 02:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230827032803.934819-1-dmitry.baryshkov@linaro.org> <ccd35516-04e4-4e24-82cb-8502d4694e8b@linaro.org>
In-Reply-To: <ccd35516-04e4-4e24-82cb-8502d4694e8b@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 28 Aug 2023 12:51:14 +0300
Message-ID: <CAA8EJpo2HppmyaYtWPxsvpwm4RX+kXQa=3WbByvOpmv7SQah3Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] cpufreq: qcom-nvmem: support apq8064 cpufreq scaling
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 28 Aug 2023 at 12:43, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 27.08.2023 05:27, Dmitry Baryshkov wrote:
> > This is a split of APQ8064 cpufreq series, as requested by Viresh. This
> > series includes only opp and cpufreq parts, with the DT and soc parts
> > being split to a separate patchset.
> >
> > Each core has independent power and frequency control. Additionally the
> > L2 cache is scaled to follow the CPU frequencies (failure to do so
> > results in strange semi-random crashes).
> >
> > Core voltage is controlled through the SAW2 devices, one for each core.
> > The L2 has two regulators, vdd-mem and vdd-dig.
> >
> No changelog?

Missed it while performing the split.

Changes since v3:
- Unrolled loops in krait_l2_config_regulators() (Konrad)

-- 
With best wishes
Dmitry
