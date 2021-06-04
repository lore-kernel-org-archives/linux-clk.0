Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE76C47082
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 03:19:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0EFA26140D
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 03:19:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbhFDDVY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Jun 2021 23:21:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbhFDDVY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Jun 2021 23:21:24 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 701A6C06174A
        for <linux-clk@vger.kernel.org>; Thu,  3 Jun 2021 20:19:01 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id a21so8465200oiw.3
        for <linux-clk@vger.kernel.org>; Thu, 03 Jun 2021 20:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XTLBAwmqsG3vEJ4E4BdrtXVL2NeOeIgl+wmT0+LyvMk=;
        b=AQvU2E2DBR78Ykvj2qLHtpb2LgMH7EVti1dRcbTmuhm5gNebiFl5ExGpyRLziKTFZp
         E95YFVmuiqVwABsG3QViv2WD3FMnjyYBrtHRxXBggGg/+egbDA32c0TVIUdm8KCXJVhi
         x+3T7L/CHVFKHY5dAaLkcx+s+jaxxfvZwWqWfzMapHj6SGcUC6qMRh1IupTyAdWXgdc/
         oFdikrJpH6WKufIMZMVbt49C2FJopa7z6LcOyqGEEQpUaqFqGT7rG93RUz6DWT/4VaKP
         DcL5BwQEWI62dNFNrCC/grf3xmcAEXaBySnaTHppUz4gK9Ed4gJ4MMEIxDAozUOt/cQT
         jADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XTLBAwmqsG3vEJ4E4BdrtXVL2NeOeIgl+wmT0+LyvMk=;
        b=OB1c6sYAsOWPeXgjQ4yC96ochyHquJie4Mss64K2G0hae7yswKTh3La2dKrZqrVszH
         053Qdzv0RUT8eLVcVRm1iAhzXWrOpaBRd+RZPKw/4YBxKnDeCPWq7EUHGY1eUD2aSXNx
         +hAg9EPZ0l8wLRpd5e66qF9aogD0/wSsp1E2V8en8Cxzaewt1f7vJQQj864Lc5Ou9t9p
         bU6UYpuGwJpyG895UmEPCu6w83s45oKSghrfEV7g/ylKUJWg2drX2N3KYFXQMkNe8SdX
         8maGMNLzr1T/27PC43b0IINTEGYlNEn6RotkS7wSe+rwAsr6KeYIxvGDMuD7UzXt4IwL
         rBzw==
X-Gm-Message-State: AOAM532fzp6RUe1gwKH09wxqSSX0dN0mZPw3DFW1na37CDXj0IagPzpj
        LqPUfqmoTaP0XAzFpMHeuhUly/dETq2XTUG3bJoFOw==
X-Google-Smtp-Source: ABdhPJzcMqINfAPFcCbEC12gkbN5NqzJM1RhTsVmVuiZUMohZbipEZxJMYUD0qnQChKUKe6fRlpUPJq80TheN/gzEcs=
X-Received: by 2002:a05:6808:f0b:: with SMTP id m11mr9178581oiw.12.1622776740786;
 Thu, 03 Jun 2021 20:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143700.27392-1-bhupesh.sharma@linaro.org> <162261866806.4130789.17734233133141728573@swboyd.mtv.corp.google.com>
In-Reply-To: <162261866806.4130789.17734233133141728573@swboyd.mtv.corp.google.com>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Fri, 4 Jun 2021 08:48:49 +0530
Message-ID: <CAH=2Ntz7=e8w1fvXtpe-aXUFAreOiyb=xxKvU_1pmzBHyVXitA@mail.gmail.com>
Subject: Re: [PATCH v3 00/17] Enable Qualcomm Crypto Engine on sm8250
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On Wed, 2 Jun 2021 at 12:54, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Bhupesh Sharma (2021-05-19 07:36:43)
> >
> > Cc: Thara Gopinath <thara.gopinath@linaro.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: Herbert Xu <herbert@gondor.apana.org.au>
> > Cc: David S. Miller <davem@davemloft.net>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: dmaengine@vger.kernel.org
> > Cc: linux-clk@vger.kernel.org
>
> Can you stop Cc-ing the clk list? It puts it into my review queue when
> as far as I can tell there isn't anything really clk related to review
> here. Or do you need an ack on something?

Sure, I will drop the clk-list from Cc-list of future patchset versions.
Since I had a couple of clk driver changes in v1 which were dropped
starting from v2, I thought it would be good to Cc clk-list for v2
(and so on..)

Thanks,
Bhupesh
