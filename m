Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE1DC43217
	for <linux-clk@archiver.kernel.org>; Thu, 13 Oct 2022 13:55:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbiJMNzp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Oct 2022 09:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbiJMNy1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Oct 2022 09:54:27 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1987814F0
        for <linux-clk@vger.kernel.org>; Thu, 13 Oct 2022 06:53:06 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id s3so1079110qtn.12
        for <linux-clk@vger.kernel.org>; Thu, 13 Oct 2022 06:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JdJqo35BTY2tsVinmF5Y/RU3zAl6mP6wF+2gmvJf8Jg=;
        b=om9qDJ49DKA6JJ+RVy/8bJXEAYIt3k/6AU/dv5GoZmOCtocOvLS65zo9Mhq6do+5OJ
         tZED2LOkuzj4AOz4jzTLyL4LJ1rWr4pyVR0nzKq/5J0tHpYhVYBelUzkLVDmIZek8jhx
         yYBfqdQODTZoMC40xRQBX6r7vzsNNELsN7TjewgG7VnXZQIxgwJIhZHU+f26ubKbkjzo
         aKPdqxYxkJmYh+/SD+EczgnkYkku3vV9I6ICTr1Ks5LZIOA7OhrCZ+/TuEyhGixC+qsF
         i/bAWtH89WZWgatYiF82+PYYqx4/ddWpOcS2Vqpc2MFgZGtXC6FuElnMk1u+/oIyMwki
         LgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JdJqo35BTY2tsVinmF5Y/RU3zAl6mP6wF+2gmvJf8Jg=;
        b=4bKAeUt7I9uEjFa3c0rOwVgoyqyMElYtWmirmxFAmYM8kvbnXOkguNsWWc4LHFg+Su
         QsCeGIuwEFMbiN8JodbLDAixzX/azP38bgajHersG+MongLgQMtyqkyRG0e5Crf4RsFB
         jcQMdGdMFOZHvUiiKGRA/k3pwkvf1XP2Li2iFuiX1xr97jWD8GoAOSWu2olBjHo/6Jk2
         pubSbEv4Uzc4myZaM5xi9bEHKn0xs42h3HktMHBWWCHuYHsQH1Qb3OQLcV523xTvzA2y
         kvWALf2SicIPvfBUQgKmOatT8FqYMT90sX23ca3Hzmtd4pHkFZtDxMCmD9hxfKUBZHqH
         DY9g==
X-Gm-Message-State: ACrzQf3q81EzumFZozC7CHnblKFuVOor0Xo3PyBGoakwvvKywwyL8gRr
        ty46aeBZs+GlkEQY/v60hXRaFA==
X-Google-Smtp-Source: AMsMyM7XzZxu88jktEQ5XtdSihBc183iXIJ+ebQ5D44pDQVupBHv+bD+2fnpI2GsNQhLpFR9a3B28g==
X-Received: by 2002:a05:622a:1342:b0:39c:b6d0:44d8 with SMTP id w2-20020a05622a134200b0039cb6d044d8mr9833201qtk.51.1665669065414;
        Thu, 13 Oct 2022 06:51:05 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id f11-20020a05620a280b00b006ce515196a7sm18748783qkp.8.2022.10.13.06.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Oct 2022 06:51:04 -0700 (PDT)
Message-ID: <b385c210-3e31-32c9-4cbd-387bb889168a@linaro.org>
Date:   Thu, 13 Oct 2022 09:48:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 2/5] dt-bindings: clock: Add ipp_di0 and ipp_di1 clocks to
 i.MX6Q bindings
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20221013131839.1365394-1-alexander.stein@ew.tq-group.com>
 <20221013131839.1365394-3-alexander.stein@ew.tq-group.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221013131839.1365394-3-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/10/2022 09:18, Alexander Stein wrote:
> These are alternative input clocks for IPU available as external inputs.

You made them required, not alternative. Please describe in commit why
they are required (what was broken).

> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/clock/imx6q-clock.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Best regards,
Krzysztof

