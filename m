Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89378CCA479
	for <linux-clk@archiver.kernel.org>; Tue, 28 Jun 2022 12:55:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345599AbiF1Mzg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Jun 2022 08:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345989AbiF1Mzd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Jun 2022 08:55:33 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C696F2F3B4
        for <linux-clk@vger.kernel.org>; Tue, 28 Jun 2022 05:55:31 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id o19so15507217ybg.2
        for <linux-clk@vger.kernel.org>; Tue, 28 Jun 2022 05:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zmWEZn/MDT8BVlOf2j/0dbSY8mXMBqqiVxeYK+9B6lQ=;
        b=JhUf9b2e4wqWDqQ8nebU+X8F21tnUWwiBkQ3caAT8ggv5nqGzZBBSIs1fyVqGmgTSz
         P0bx2uU/Um+sT7/JMfPoyd+TMY/C0h/HDqX3iWSan4x+3gVgOFqQqxl7uMlO4YALgj1P
         axnMd8R2aq8xen9gsHvKZXoB+QewakVfuJ8MoMEhQLsS7rq+b6tDv+KHy0ssO7jdghqo
         YO21b4nExNXO9RgjmR71guAnd6SFsChnxgBNFeKm96PNLhb4OobEGJJroUD1rrau/T8h
         1IW/3R1VEMOEupRLy+W8KoRPDUYOoNLb+cC2bED7huckB8a5gxeW6VgpiKBa8TJCGma3
         hCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zmWEZn/MDT8BVlOf2j/0dbSY8mXMBqqiVxeYK+9B6lQ=;
        b=c74KL2bi7E1cu5fQZWQkvyk5copJskOMt3GPvWHgb/cDrLiqocbrRyTOm8mS7DdNw1
         3KObyvymCm+4EfS5ObqQVc+rxFgvqXSQa6sQeSpkOUgDfF63KoJF/KOBdsZl/9duBv0N
         DIMBvlhPVLRZvSclyFJw6LaLnUojK9XmTAat6MuQ8aVXgAJrTCcrPDkn6Wo/mzE7Z42C
         yRVklY/iX2DtnWsx+dw3FtQoBhYild0wglE22TVGbwofeZhvR48RTmuNeeANujpsk01q
         Y0tHKeGk7vBuqK/2mGQrbdAgG0YkqqLCWhiV3vN+zxnc5eFtY7zzqjvvL8Aa3KxGG+RQ
         csTQ==
X-Gm-Message-State: AJIora8FEJ7j4Tdyy3hTkYiPEiAUK1xRHp2ePdpjB9RJsRYDjA67XREQ
        SqQr//7yVO/TYpp2JYnj9IOoeRdxXE+OboZSHByGng==
X-Google-Smtp-Source: AGRyM1tsaB9tgNaMSUle5S5+neod2eZjuTku0yKoAV6tHrXr5lM2cYOKc71QeSQjdMvN2lSTcPjYvD5JGxKdrp2cnJY=
X-Received: by 2002:a25:cac5:0:b0:66d:2c32:8593 with SMTP id
 a188-20020a25cac5000000b0066d2c328593mr2819682ybg.626.1656420931032; Tue, 28
 Jun 2022 05:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220621161126.15883-1-quic_srichara@quicinc.com>
In-Reply-To: <20220621161126.15883-1-quic_srichara@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Jun 2022 14:55:19 +0200
Message-ID: <CACRpkdZs=kwFciZaNGWR3t=Q4Vy08qg6UNH6obcyubC=6jkYuw@mail.gmail.com>
Subject: Re: [PATCH V2 0/8] Add minimal boot support for IPQ5018
To:     Sricharan R <quic_srichara@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, catalin.marinas@arm.com, p.zabel@pengutronix.de,
        quic_varada@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Jun 21, 2022 at 6:11 PM Sricharan R <quic_srichara@quicinc.com> wrote:

> The IPQ5018 is Qualcomm's 802.11ax SoC for Routers,
> Gateways and Access Points.
>
> This series adds minimal board boot support for ipq5018-mp03.1-c2 board.

Pretty cool!

>   dt-bindings: pinctrl: qcom: Add ipq5018 pinctrl bindings
>   pinctrl: qcom: Add IPQ5018 pinctrl driver

I'm happy to merge the two pinctrl patches separately to the pinctrl
tree if I can get a review from Bjorn or Krzysztof.

Yours,
Linus Walleij
