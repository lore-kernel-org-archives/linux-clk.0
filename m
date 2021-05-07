Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B724FC433ED
	for <linux-clk@archiver.kernel.org>; Fri,  7 May 2021 21:12:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E6E46145E
	for <linux-clk@archiver.kernel.org>; Fri,  7 May 2021 21:12:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbhEGVNw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 May 2021 17:13:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbhEGVNv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 May 2021 17:13:51 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC7BC0613ED
        for <linux-clk@vger.kernel.org>; Fri,  7 May 2021 14:12:51 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id f75-20020a9d03d10000b0290280def9ab76so9062953otf.12
        for <linux-clk@vger.kernel.org>; Fri, 07 May 2021 14:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MsiX0491JH5IOV8h/Q3djHE853ReiHtmamJNPaM0VTw=;
        b=bM0IPTD6Uhow8CEABbb6NWIteuWPIHYv+WcypqnfaZUkylgsH17rxpX9bnnsIvIXjc
         j/3bKL+SBDonzgdNYT9lnDKViiKQwvk7lSVW+fyiCJDI9vl+YBpLezXlhGu1GwmdorXB
         ofIq6Emv3PTXPNh8CL/Hhq1l3bs5Ua9wjnZONMZLgcdhIQnKs/3GRLU66CRLQo2n0tLR
         8qqJttbvSPulNsXgsILacd30QNcHTLnfbzkPi/b6+Qpl1dhhhN9u7F2MNXcMvHqrwZHL
         qENyaYEH2B/hjJyqP5fl1nZT2tBmLG6DFxN97liTzUmYfAHCacXIDhvVbBoKmQkRiV5T
         fvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MsiX0491JH5IOV8h/Q3djHE853ReiHtmamJNPaM0VTw=;
        b=khHKEEPZxevsh13jB8FbrjRRLEXS3gYqqYRHymwbSj6dTOVrNVAm87R65JfUOs1c5h
         OZALabsyFDp8pK7SmGNolraupb7dvxNiceADuY6A+CJp2RR49vREKTJPe6Zreqv1h7Pt
         2n5N9NUpXEaHCW6aE3h8qR31zkpnxLztmvK93mXkYAZrpj+v4PTMtQuMD+pq/pPC8Tp0
         CVnBaC/HyOk9NE5GVDqBBe/VueM4vaVHxSPXQBmh7csQu7QdDXbaayqZSS6RuLHBiQFC
         hA+1o80xkx8iYtfOPHe6EOWhLPU3KPD1ql7Hs0woRH7CmTTMylBTIGtXxuv9vJztsav+
         t5Mw==
X-Gm-Message-State: AOAM532ukTd+gyu2fF5tdGSwdk4zC+Ab7321WpMhvaqIHEe6PYW9Tj7m
        JVo2Vha1VcV1gD7ls9s0YYIe21PJYq8YuVbW/dNQjg==
X-Google-Smtp-Source: ABdhPJxZbupy4cCJYrSiAUuciDj3HUdW/Zx4At+9BWzirsCJnGat2A0wTgEZlYtdVRYqdsIK8FwuT/t42w3ZeAMRJ8I=
X-Received: by 2002:a9d:1d01:: with SMTP id m1mr10113074otm.155.1620421970694;
 Fri, 07 May 2021 14:12:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210505213731.538612-1-bhupesh.sharma@linaro.org> <YJMXpi1V/2vTdJKD@gmail.com>
In-Reply-To: <YJMXpi1V/2vTdJKD@gmail.com>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Sat, 8 May 2021 02:42:39 +0530
Message-ID: <CAH=2NtzufupReL_cKFVCX8NY8syRdQTy9VJfU9B9Uxr_uTv50g@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] Enable Qualcomm Crypto Engine on sm8250
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Eric,

On Thu, 6 May 2021 at 03:39, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Thu, May 06, 2021 at 03:07:14AM +0530, Bhupesh Sharma wrote:
> >
> > Tested the enabled crypto algorithms with cryptsetup test utilities
> > on sm8250-mtp and RB5 board (see [1]).
> >
>
> Does this driver also pass the crypto self-tests, including the fuzz tests
> (CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y)?

I did try running these self-tests and they pass with
'CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y' as well. Do note that we need
the AEAD fixes from Thara (see[1]) for all of the fuzz tests to work
(so my patches are actually rebased on this series).

[1]. https://lore.kernel.org/linux-crypto/20210429150707.3168383-5-thara.gopinath@linaro.org/T/

Thanks,
Bhupesh
