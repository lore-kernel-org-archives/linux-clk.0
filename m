Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDDC8C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 18 Oct 2021 15:38:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3B1D610C8
	for <linux-clk@archiver.kernel.org>; Mon, 18 Oct 2021 15:38:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232058AbhJRPk6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Oct 2021 11:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232493AbhJRPk5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 Oct 2021 11:40:57 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0BF4C061769
        for <linux-clk@vger.kernel.org>; Mon, 18 Oct 2021 08:38:45 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id y3so42356595wrl.1
        for <linux-clk@vger.kernel.org>; Mon, 18 Oct 2021 08:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=iODCAuyGzNXLGc8sQELNl8YUufgdbXaQ5qOyoIw0DG0=;
        b=vdVCDrS7aDv/1QmIP+jVThM1GW9led1F2mtEI+Ix8UMu1HdPCJR6bS2ZFTOWoWHerQ
         JLK2OyaqHG7bRTCoG/udn5WRTjuaz2xGyjq49zNxP79asgQk2ey3/TlL/1hGR4dx5atx
         cswDIKcsxqBpoOnbfTsTYFIvoWCVwIa8PbQlEpl99GibrRwajZbCO7KqTqD/pmnxcTsI
         GcYjx8158fz2iK95Myh+K0674pgAqRkI5rRgt5Aq6v6uhg33yPUVaBZozFjy53nlCLNj
         iBeP+SPZ79Qah7fxhXXzejlBwU3WCFkY3spumxHWy5HF8l1gJRU2aWZNDPm6T5NEdZRh
         uFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=iODCAuyGzNXLGc8sQELNl8YUufgdbXaQ5qOyoIw0DG0=;
        b=1OqlbYSp/iAnKeVpmgTJzVf4o9NCzKVXR/VYwVyPjzA0xDle/y4lbImsZpjDKE4I84
         w1U8xKEMYpxRIQh7cIv6Z/bQGWzmub9dBlJxxCyF9ODm57YtbThBKqpTAzUxExUF7Vxw
         tr2xM2cejbi+LlTlnVr9ikcKzuS5RTucBIF+K00jtYGPj+whQv3Lq8tksooQQfnR1rFA
         O+vskHKGnrKxBUkUS7G4eEB+jf+6ogG6a/ZuI9YZ5RtN6AnV6zWNDk4HuqlLul0PrxAo
         w/fQiRNy4OzzD385fYgSe9zbWX3lfv3ndI5uW95MnlnZSti8sw/hH5VoDCd9/Eyvh96G
         v69Q==
X-Gm-Message-State: AOAM533d7qDDnqIoBEpGyMRql3UzGc5A9SQxoVUUgX4BZzRh2/Xfgb9F
        bvGHfw+U6/Z3OzdoVv0IPRl/Ng==
X-Google-Smtp-Source: ABdhPJyZ++AJmrO3OWPFJqKeMZEiXaxcE+1DPUg0ecmoMlnp5uT5grAq6ha21GZUHmPtdvESgrWO7A==
X-Received: by 2002:adf:fa8b:: with SMTP id h11mr37055518wrr.74.1634571524488;
        Mon, 18 Oct 2021 08:38:44 -0700 (PDT)
Received: from google.com ([95.148.6.207])
        by smtp.gmail.com with ESMTPSA id c17sm13062760wrq.4.2021.10.18.08.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 08:38:44 -0700 (PDT)
Date:   Mon, 18 Oct 2021 16:38:41 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Sam Protsenko <semen.protsenko@linaro.org>
Subject: Re: [PATCH v4 00/10] regulator/mfd/clock: dt-bindings: Samsung S2M
 and S5M to dtschema
Message-ID: <YW2VAfa6koB4+eN9@google.com>
References: <20211008113723.134648-1-krzysztof.kozlowski@canonical.com>
 <YWCT+YL/9qHbF9f0@sirena.org.uk>
 <bb1f4be0-ca2a-e327-0831-f648a2ca3ab3@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bb1f4be0-ca2a-e327-0831-f648a2ca3ab3@canonical.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 18 Oct 2021, Krzysztof Kozlowski wrote:

> On 08/10/2021 20:54, Mark Brown wrote:
> > On Fri, Oct 08, 2021 at 01:37:12PM +0200, Krzysztof Kozlowski wrote:
> > 
> >> This patchset converts all devicetree bindings of Samsung S2M and S5M
> >> PMIC devices from txt to dtschema.
> > 
> > The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> > 
> >   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/s2m_s5m_dtschema
> > 
> > for you to fetch changes up to fab58debc137f66cf97f60c8471ff2f1e3e1b44b:
> > 
> >   regulator: dt-bindings: samsung,s5m8767: convert to dtschema (2021-10-08 17:24:37 +0100)
> > 
> 
> Thanks Mark for the branch.
> 
> Lee, can you merge it and apply the rest (MFD)?

Sure.  I'll take a look in a bit.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
