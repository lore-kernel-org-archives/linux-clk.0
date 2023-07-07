Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2BF1EB64D9
	for <linux-clk@archiver.kernel.org>; Fri,  7 Jul 2023 09:34:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232258AbjGGJeY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Jul 2023 05:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231925AbjGGJeW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Jul 2023 05:34:22 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AF6C2105
        for <linux-clk@vger.kernel.org>; Fri,  7 Jul 2023 02:34:21 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-bb3a77abd7bso1815527276.0
        for <linux-clk@vger.kernel.org>; Fri, 07 Jul 2023 02:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688722460; x=1691314460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=saX3pFAboAcYrHkIs/SI1SEfN7MogeSF5MWoGtRMhFk=;
        b=tKBHmQhdEqHIX9BwfY1SbILP0xtBAtAEBgnp60bPOiB0PARs0VGJapZZObxOAYPzob
         8S9c8CGrMLscX7N0s5/idB3/STrzWHy9oaVEktZFa0VRFGEuSDCXnQFMv0L13N4CBMxk
         p8pRTN2CHhIY56dyDbRLRTwGKtyeg7vcpr1Nd/vZfqQG4Aox5ANsXd53QryhJTlN+dRN
         xUbMEwRwinN4LxNfqAChlUJCweJmoeYFKT3v42My7/WMj2b7vvRciEuEUvn5IJrK2dWj
         hDUR3WHh01MVsTWtJqseun93zMx2WNmzS2h3kPeFm7zzQXvQznWld4vxbjD2vSpmZS6n
         zB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688722460; x=1691314460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=saX3pFAboAcYrHkIs/SI1SEfN7MogeSF5MWoGtRMhFk=;
        b=BaIz+ZtmUduv5607A3wGkoh0exJ6SAtGqPnhilngR2TC6/Z/h8/2/LafaF7F3C4nbX
         Hixohsz1TkrDk7wik5EEyuJdZL3g16ydmQ7p+1YCr2kCt6AZ+jUjFz5i1U6qDMNbxxVk
         20GmLd7BByXHYJXV/sB5nis8KXN2hxLnSiKTD77Un+d6e/fgItxrQr4lCxBXdd5EQ40g
         nQkWowF4xCQCxaHqCfoBqmYjgW9ZdWnn7BFqfdPo3GsIRufaAxCFpNUvyO9iHcDesLMT
         9vsQENLPxA7mg0XpKy1smcca89gGEBNq85r/Mz2HwfczGMY6lTIqsnmOrU9izrF4L3XF
         ioXA==
X-Gm-Message-State: ABy/qLYgyJd5uh8cCS/Jtu0uoT7OChpYkI1/OQzJ1AJpDvFInbhd3UVP
        71Dfvtq+IhE3h9sthEA4H/x3L/9wtsfNR9Njju/3MA==
X-Google-Smtp-Source: APBJJlHjQReiyHI7JmsXYBFcwy7JZZqVtQoKWdLHJhl96Gf33wc5bk2N9yTDiaKvkgT1IOsbohnign+l1TnLkzIZ4Kw=
X-Received: by 2002:a25:8f89:0:b0:c5e:cb99:6346 with SMTP id
 u9-20020a258f89000000b00c5ecb996346mr3668707ybl.14.1688722460628; Fri, 07 Jul
 2023 02:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 7 Jul 2023 11:34:09 +0200
Message-ID: <CACRpkdY0WKDAx1XP6fq2WZeoK6kH+t_weYJPJm1aMnMKb7ZayQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/28] ARM: qcom: apq8064: support CPU frequency scaling
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Jul 2, 2023 at 7:43=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> Implement CPUFreq support for one of the oldest supported Qualcomm
> platforms, APQ8064. Each core has independent power and frequency
> control. Additionally the L2 cache is scaled to follow the CPU
> frequencies (failure to do so results in strange semi-random crashes).
>
> Core voltage is controlled through the SAW2 devices, one for each core.
> The L2 has two regulators, vdd-mem and vdd-dig.
>
> Dependencies: [1].
>
> [1] https://lore.kernel.org/linux-arm-msm/20230702134320.98831-1-dmitry.b=
aryshkov@linaro.org/

Just because it looks so cool, I applied this patches and the prerequisite
to master and booted the result on the APQ8060 DragonBoard, and
it still works.
Tested-by: Linus Walleij <linus.walleij@linaro.org>
(Mostly for the DTS refactoring, which is what affects APQ8060)

I guess the APQ8064 cpufreq and APQ8060 isn't actually far
apart, so it should be possible to fix APQ8060 as well, but we
can take that another day. I always wanted to fix the SAW2
regulators.

Yours,
Linus Walleij
