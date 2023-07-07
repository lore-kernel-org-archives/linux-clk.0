Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0820EB64D9
	for <linux-clk@archiver.kernel.org>; Fri,  7 Jul 2023 10:59:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232066AbjGGK7p (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Jul 2023 06:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232396AbjGGK7o (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Jul 2023 06:59:44 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C9681FED
        for <linux-clk@vger.kernel.org>; Fri,  7 Jul 2023 03:59:30 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-c4dfe2a95fbso1830292276.3
        for <linux-clk@vger.kernel.org>; Fri, 07 Jul 2023 03:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688727569; x=1691319569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNa38uLhZwXSXeQR3Wi76tw9kKPxoD61t4HFzT7PJWQ=;
        b=gjItutFou6ZsZG3k3XeGp/GPEHXtYq9Dkd4W9qWWHIksev2IYZFIQvzlGTFQt33Gvr
         fwZFEIu6gYdkGca9lnnGs3rQjHt/Ef3esKw7LWa1RRBjv8DItmVS2F6Grn7fLpwceSug
         hw8i8+HLx3vGXC/plgkUwKzXbMTxQLyCGPLRFodTWNpSrqxPQsHD47p8wNwt2Zrjx+98
         1uVhnSxRA4qodYSHUY35MZXgaFqLzk2eGbutYTVPmYRRPYP9RG1MPm8w93Iq5X46k9SG
         Sn1iD7z7mgvdInqhznvfXTGnbgCbteQJW0v78ZwL/gGMYpVmokg3IbB9UJw0Agy9V/E+
         k93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688727569; x=1691319569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NNa38uLhZwXSXeQR3Wi76tw9kKPxoD61t4HFzT7PJWQ=;
        b=ga5J6nZBR5Fu2h0tr2ymoEJBzocKWpVgp8SMH7YNTGtBKYFMM7/cMRAGN195EybmWN
         dR6e4Ks7GMbyGWP7ccLvgA2VBZOomqbr16Poew22OQXG3uSAaOjUop2W8mOMJy9EvlMz
         UXPW0MMtT5FzzpI4DAzzYzIUw4FMqUaNuSvhIDiIGqFjRuzEQhwOpu2ZMEJkPUW6fCBz
         MSQVnIaY5iXIe3yZU1KEWGGxdUX8v+fljoG8eSWr4/e/oxtO/UHd1Fn3eMUDA4nKeFrS
         sz5lNPcGV2AsBHMaCsiEssB0kTUH9YUwmawv2kwdc4fw6Y7PV/6qs97m/i97AB3zqinb
         P2mA==
X-Gm-Message-State: ABy/qLZKMRWSOCWKwvO/mibThby/K0ENntMgq9hv+mIX1qnJoF526IAh
        p1ADYKITX6LlMtOgUQEdHuPPsRrRfBM7ZfJQljp5vA==
X-Google-Smtp-Source: APBJJlFVY2c1x8f9yWxGFi7Gqjx6YiNx+1X2xzMvRwI2WDObKD6BPTw+1rw3u/qJggk4NmfAhZLLEMhGTHOiryp/hiI=
X-Received: by 2002:a25:f302:0:b0:bc8:9925:9c1f with SMTP id
 c2-20020a25f302000000b00bc899259c1fmr3867943ybs.1.1688727569479; Fri, 07 Jul
 2023 03:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230702174246.121656-1-dmitry.baryshkov@linaro.org> <CACRpkdY0WKDAx1XP6fq2WZeoK6kH+t_weYJPJm1aMnMKb7ZayQ@mail.gmail.com>
In-Reply-To: <CACRpkdY0WKDAx1XP6fq2WZeoK6kH+t_weYJPJm1aMnMKb7ZayQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 7 Jul 2023 13:59:18 +0300
Message-ID: <CAA8EJpqsVH+pvngLGLXQ_=81hB16MiXnJu-7W4Bf+z0gkqdtTQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/28] ARM: qcom: apq8064: support CPU frequency scaling
To:     Linus Walleij <linus.walleij@linaro.org>
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

On Fri, 7 Jul 2023 at 12:34, Linus Walleij <linus.walleij@linaro.org> wrote=
:
>
> On Sun, Jul 2, 2023 at 7:43=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>
> > Implement CPUFreq support for one of the oldest supported Qualcomm
> > platforms, APQ8064. Each core has independent power and frequency
> > control. Additionally the L2 cache is scaled to follow the CPU
> > frequencies (failure to do so results in strange semi-random crashes).
> >
> > Core voltage is controlled through the SAW2 devices, one for each core.
> > The L2 has two regulators, vdd-mem and vdd-dig.
> >
> > Dependencies: [1].
> >
> > [1] https://lore.kernel.org/linux-arm-msm/20230702134320.98831-1-dmitry=
.baryshkov@linaro.org/
>
> Just because it looks so cool, I applied this patches and the prerequisit=
e
> to master and booted the result on the APQ8060 DragonBoard, and
> it still works.
> Tested-by: Linus Walleij <linus.walleij@linaro.org>
> (Mostly for the DTS refactoring, which is what affects APQ8060)
>
> I guess the APQ8064 cpufreq and APQ8060 isn't actually far
> apart, so it should be possible to fix APQ8060 as well, but we
> can take that another day. I always wanted to fix the SAW2
> regulators.

APQ8060 (as well as MSM8260 / MSM8660) were a previous generation of
the cores, Scorpion vs Krait. So far it requires two items to work:
SCPLL, the core pll driver, and the fixed AVS setting (which might
also be required for MSM8960). Let me take a glance in the next couple
of days.



--=20
With best wishes
Dmitry
