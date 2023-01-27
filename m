Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F62C61DA7
	for <linux-clk@archiver.kernel.org>; Fri, 27 Jan 2023 08:51:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232542AbjA0IvG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 27 Jan 2023 03:51:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232509AbjA0IvD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 Jan 2023 03:51:03 -0500
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E758A19F31
        for <linux-clk@vger.kernel.org>; Fri, 27 Jan 2023 00:51:00 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-50112511ba7so58289977b3.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Jan 2023 00:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ust5T1dOQ0zL+HLLGTDn3zdUYMh/5770ZElRgQ3sPDg=;
        b=obzjvlT1y9jt6kSminE3izVC8zsG+ufoMFpKAz7oy4XW4QKmvCOTcTHXpYMVmCmgdx
         fWsV39ysAELR3n/hY0ldJBfN5QUGlIpo1YvPn0O3IUMBLAQ8gycCUwKtgOJYneCL2kpB
         n6kkcVRyGl3ystC0vK5VQb9YZpsfYah8wElQpMH5ZoQw9lMipH4AWZ+yuEC2LEcnq+U6
         sH1blQqVQU790uWxsio6IAePBfsKDhlgmQtTGXjBwQjTwkwvoSifmup3B+6NntVoovoH
         K6PtteRwWGzWKmqKkMSV7uFK+0ubQthmhBIwC3dkdhda/yxh9gcWLRo+yAQuEr86HRiZ
         bXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ust5T1dOQ0zL+HLLGTDn3zdUYMh/5770ZElRgQ3sPDg=;
        b=va5TCtO8K/uwXrcvUXc0UhDJxYaPUxoRiLLh3FM+q0kiLCf7N1VwcUWvNR4WOpQXOX
         pu/3Ey/vIJOP7bedcXs+8ehml6aPvDyzZfr3nMRK99cCG1Z3HOj8F+m6B0j8/2Jhp6eG
         aATBMFwYEhsbUp3qf3PUZ/w4iCB0QQ7nODrKb/C3QQAto6sCxVOwHDzfaFdUhvRk1CPZ
         zNxBlR/bK5Yczq0w2YBmAXZQvbC/XPideYgAuE08HbFGTwereSQpr1PSEVsajfOpOuDT
         uzUv87iiH7rbJINxvr36IUuJy4xsx5KLkblBj1T3UlcWCzDcuNo/jgQ0dTYQtqdNiXOt
         qahg==
X-Gm-Message-State: AFqh2kqmN7hLRIf+9yEoxmNzatNAF6/fwXoRc5h/jbrYxX7anQh64B/l
        izHTa+dVdqO0v7QYjKPLRnaj6ie+o102ZIeSHpwgJA==
X-Google-Smtp-Source: AMrXdXsm/Hv7McSrHeZXMfE8TeNjNxQAnkGxQwfCfkr1WBI7rjZDVKp4ILbZt75wR8jNHQ/kqB6Fpz/eHIeitvmf610=
X-Received: by 2002:a81:6842:0:b0:4ff:e4bc:b56f with SMTP id
 d63-20020a816842000000b004ffe4bcb56fmr3524838ywc.488.1674809460124; Fri, 27
 Jan 2023 00:51:00 -0800 (PST)
MIME-Version: 1.0
References: <20230124141541.8290-1-quic_devipriy@quicinc.com> <20230124141541.8290-7-quic_devipriy@quicinc.com>
In-Reply-To: <20230124141541.8290-7-quic_devipriy@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Jan 2023 09:50:49 +0100
Message-ID: <CACRpkdZTMdK06jfuydwSpwMXLAeoL45EL4z2Msn-po+MjUZxNA@mail.gmail.com>
Subject: Re: [PATCH V1 6/8] dt-bindings: mmc: sdhci-msm: Document the IPQ9574 compatible
To:     devi priya <quic_devipriy@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, ulf.hansson@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, tdas@codeaurora.org, bhupesh.sharma@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_srichara@quicinc.com,
        quic_gokulsri@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_arajkuma@quicinc.com,
        quic_anusha@quicinc.com, quic_poovendh@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Jan 24, 2023 at 3:17 PM devi priya <quic_devipriy@quicinc.com> wrote:

> Document the compatible for SDHCI on IPQ9574.
>
> Signed-off-by: devi priya <quic_devipriy@quicinc.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
