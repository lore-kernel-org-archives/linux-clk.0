Return-Path: <SRS0=Ii/d=UG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93B2C2BCA1
	for <linux-clk@archiver.kernel.org>; Fri,  7 Jun 2019 23:08:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE60B2089E
	for <linux-clk@archiver.kernel.org>; Fri,  7 Jun 2019 23:08:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FkVCVtLw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730484AbfFGXIg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Jun 2019 19:08:36 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34139 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730617AbfFGXIc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Jun 2019 19:08:32 -0400
Received: by mail-lj1-f194.google.com with SMTP id j24so3108444ljg.1
        for <linux-clk@vger.kernel.org>; Fri, 07 Jun 2019 16:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CJjAb+Z5ioBZ0AM/8mCFtzkkLn/OKSEL3IHSOtuKgfQ=;
        b=FkVCVtLwoVP2xNToV3V9nLLFBH8qK0uahCMEKeFCpaR2z9IF0rpEg8YFqnUmGXZsgq
         DfvxttPbgwKv51MItse2JF1YQ5TsRI5GCwNHRb9IYez7H3NYfXRNHgXB0gnp2gTndxNB
         LwkbDBxTrRmHrzyvFF13obVOy9KBAFVFFzTocL3+JUOgAFqMpgZ+U41+ABtrRyWnIodz
         eqN5ctPHY09xzgpkZFV2Tez9dxUvSL4e5wfFHFtt31VxWoUedzV9qMV9ZKUB51qacrdz
         tTCqV/urQYCK3kC4ka+GuQTTXl3BE0wjaSiIPmANYwxUqfk3h0q8w6gczsAnBL5+4gOe
         vC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CJjAb+Z5ioBZ0AM/8mCFtzkkLn/OKSEL3IHSOtuKgfQ=;
        b=A09MmB2LabtK1UMpd5fjAFE++TuNw7cbxxxUHcQOzrfFxQmxkaKdZiwva0PaCYnAvE
         th5yxmJ+0F3ADM8fMnRgbZjsxMdd661ceRRqPbmV0TswClxStOEg6IUza+iS4ipuZSHR
         1Q7QmQyWYYe3/1z4olryMrbwhEjRK3soJ719peAAxSN55siMS7/X1B6q/+6Orw1QQ+UD
         /ZhrNZUOP7O+VNGjM0vJ2wz90vL7iLx6Bbqm17vmJeITNMFouiAZfWbSDBG7iR4XSHV2
         gc0VnIR4eBoYmT99pKJ9ekKrsFnCPtXhZ3GzwYPYTRzcLAKP/0Nnmg6fniOaM7nlXxPe
         x0eg==
X-Gm-Message-State: APjAAAXKr1A43r4U5kqJ0ctZ4eu3iVfZlA6swb+A1DqYfQ4CotWn5+6V
        1A3MBD0YE6itI1BtCgrxYkuJMboHMWagS2udOMUROg==
X-Google-Smtp-Source: APXvYqxUOi2ComwroPYJqL0+HmrxnRaNzTbxCzwrLY351hzZwjGfd8PvKzmcThTDM6zJHWY6X2LcwPf0/66wKSkFxIw=
X-Received: by 2002:a2e:5bdd:: with SMTP id m90mr19985474lje.46.1559948910013;
 Fri, 07 Jun 2019 16:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
In-Reply-To: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 8 Jun 2019 01:08:22 +0200
Message-ID: <CACRpkdbxUHR8Uo+M7+_0v77Pg6k_jmL79KeHKNzWmFhtq+mZXw@mail.gmail.com>
Subject: Re: [PATCH 0/6] Add minimal boot support for IPQ6018
To:     Sricharan R <sricharan@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jun 5, 2019 at 7:16 PM Sricharan R <sricharan@codeaurora.org> wrote=
:

> The IPQ6018 is Qualcomm=E2=80=99s 802.11ax SoC for Routers,
> Gateways and Access Points.
>
> This series adds minimal board boot support for ipq6018-cp01
> board.
>
> Sricharan R (6):
>   pinctrl: qcom: Add ipq6018 pinctrl driver
>   dt-bindings: qcom: Add ipq6018 bindings

I'm happy to merge these two if I can get a review from
Bjorn Andersson on them.

Yours,
Linus Walleij
