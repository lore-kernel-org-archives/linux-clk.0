Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA15C4332F
	for <linux-clk@archiver.kernel.org>; Wed,  1 Nov 2023 15:05:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233139AbjKAPFT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Nov 2023 11:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233137AbjKAPFP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Nov 2023 11:05:15 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC30B136
        for <linux-clk@vger.kernel.org>; Wed,  1 Nov 2023 08:05:04 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5b499b18b28so1247597b3.0
        for <linux-clk@vger.kernel.org>; Wed, 01 Nov 2023 08:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698851104; x=1699455904; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U5JMfft7VRMY1/SH83cz0n5I8SgamFYvIt7Euj5oTok=;
        b=vb/OrkogrFazXb8du6WiG8E0f05StPpyjqDevqHkl+dhnC/v6aI9MM4ptn6M1VnKAb
         ol0SrssmCWlsXvehDeI63AvfYVcf4QLzaRKlCO0IzJ7Zdh/dyOWrFsmWHUGoXOeEB/FV
         bnN2T/nWDWzfF6JobVqOAdlWcEyzqYT08iZoKvMpSMrc6DmAn7V5EaD7Z1/h0bmDWQnF
         IoP/1yPJ6rFtuG/HxvixktkQfGQAElU2G86HHBPKIi77nv2hzvsDV4IYfqvYRZcflFVa
         AzgrfN/6lkPCG4y6JB36rBRVjLwP6i5fqoR4KhBESu5h2rJa7rFDdr04K3mVFG3hWXVT
         AEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698851104; x=1699455904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5JMfft7VRMY1/SH83cz0n5I8SgamFYvIt7Euj5oTok=;
        b=rl/4lNa0dvTLAFN19/vIwq/Ym8yCoW66u+tN5FJdMHuDNCQ6UjB6qZ+Il3eQwgmEpy
         fAGifHJkdLHFgRd44jOvDgBJu9k8TNbKFrPdQdfFga0V3RWFcV9eh0bpfUwS1cb2N7q5
         jH+ivoNn4WPPtF6V7kPdZeBURzbCaN+igBwnOBfuadi5NRlUklwW4TFmq8xaexjAcOyo
         VSD34dwBIElw6LNiMkR5XM5yt8RbQIqqE6hdEjTqlcGCeehkYHWe734zvT/L9/tTOVIk
         SJQ/8Xk3iP8y9VuV7sKyzqKA4P2DkwbjbolFh4TvMhFni8f+pCPMv1xWf6k+31GMSIdy
         uVvA==
X-Gm-Message-State: AOJu0Yx5wwzlraTLWF7etF/kPN7RfmwE85gvmJjnW8AxmGgJmX36/UXy
        BcoNR4DPvsnt2mocXaVmO70+d+LHGOP/KNAMQcmdxQ==
X-Google-Smtp-Source: AGHT+IHrEbVxBY+XzSn2ZBZ3zONd/D9hLkWbWEz2PmPQjq4oRq/WXW32g+UGBWQxPQJJGRz72RQQCoxr/sfuP3nW6FA=
X-Received: by 2002:a81:a906:0:b0:5a8:e303:1db2 with SMTP id
 g6-20020a81a906000000b005a8e3031db2mr15856440ywh.23.1698851103748; Wed, 01
 Nov 2023 08:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-3-Jamie.Cunliffe@arm.com> <3cc3b66d-7190-477c-af04-a5d06a0d50fe@lunn.ch>
 <ZTLH5o0GlFBYsAHq@boqun-archlinux>
In-Reply-To: <ZTLH5o0GlFBYsAHq@boqun-archlinux>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 1 Nov 2023 16:04:52 +0100
Message-ID: <CACRpkdaAsC6Uj0nKwGFANWrf5j68xZgKbaVaEB02iJ=XQoJt8g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: rust: Enable Rust support for AArch64
To:     Boqun Feng <boqun.feng@gmail.com>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, steve.capper@arm.com,
        Asahi Lina <lina@asahilina.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

[Andrew wrote]

> > Network developers have expressed an interesting in testing Rust code
> > on big endian systems, since the code should work on both endians. It
> > might be easier to get an ARM board running big endian than get access
> > to an S390x machine.

If you mean ARM32 BE I have that on the IXP4xx systems up and running
mainline kernels and mainline OpenWrt now, but I haven't
seen rust enablement for ARM32 yet (but it can't be that hard).

Yours,
Linus Walleij
