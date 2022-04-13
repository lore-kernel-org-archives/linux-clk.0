Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB32CC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 13 Apr 2022 06:37:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbiDMGju (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Apr 2022 02:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232989AbiDMGjt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Apr 2022 02:39:49 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF4184F44C
        for <linux-clk@vger.kernel.org>; Tue, 12 Apr 2022 23:37:26 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id u15so1850085ejf.11
        for <linux-clk@vger.kernel.org>; Tue, 12 Apr 2022 23:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=L2+K9dFepGLkCzuE8Vegw2gTnmbd7yYcc2wcM+3tE6M=;
        b=TMWlkGyDuqZPBlzzAUi0m0kmdT5srlS9slVSloQvgv5BjHG2OdUUF0qlHHQ0+VfAZx
         tBsIXiOvuAmhaEL9Ezrq8hog2fP/n6rQn9JMBJprPOOzCWIeznXyaZAxLGLtmhjZ8wm+
         DObenLbe+4CZ2ulGU65S8g7iixGQEtRFF/HtLDTEVyPXryuCY/v2OtnZO86xBPjyKRLu
         mSbIKLr3dLZv1CEfyVKGZ7IZXRLA1MDLfwaWFfDYpJyBwnBKB4/XCyuM5+N1w4w9TMb8
         TxO5j+Vtb8rd4eSU10an66HKJ2GBCxIU3ajXe2PL6FIkQlFfCcNzA+fCHuASm9ZO7yHm
         6fFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=L2+K9dFepGLkCzuE8Vegw2gTnmbd7yYcc2wcM+3tE6M=;
        b=qt6VgnWjWeL2Qgy7FLj5aUoJgWqMAnaHQ51GxYaW32cwKbQyr0YpMiWlYHp9ua4um7
         V89d7ygdyETe/1LLCkwipo5y5Ub7T8qJYXKRPp1z4QkAGezqzmNNRCkUINgYJ8IOQjTD
         X05N5Eiu8w9ehmkyyI7lHdIDtObqoBD/qRKugOehd6wzE3n8qios+ofokfZZPhxqQFdT
         JW7y3QDwEFIXsJglpKGWccSMUW1fyMMVW+R7v/nPNOw2qfikZ12SGGCNw//QvgUjFcW/
         i8/gJ//BfsLxaSB7Pz7VLkLvP2tHq8Oqv9j+PsYKuSGPiLhqwtGZGDdscxmFWH9H4hCG
         e4Eg==
X-Gm-Message-State: AOAM532VZcmKrXq8Z8AIWikxF2pKmVup2sOVKTA8eYqn8+OBxaQBDa49
        Vyw8LTJynQPaDp5hOq70NPifKA==
X-Google-Smtp-Source: ABdhPJxxfRfaX+I00TqE1PWHzu+5jBnSTb9E9ARm5cWpaGhCyvb0c2Wf2r6TMuae4ZkJn+WeWD7+bQ==
X-Received: by 2002:a17:907:96a9:b0:6e0:db4a:ba8d with SMTP id hd41-20020a17090796a900b006e0db4aba8dmr38877725ejc.87.1649831845519;
        Tue, 12 Apr 2022 23:37:25 -0700 (PDT)
Received: from [192.168.0.201] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id r18-20020a05640251d200b0041d1600ab09sm802488edd.54.2022.04.12.23.37.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 23:37:25 -0700 (PDT)
Message-ID: <c2a7f2e0-1a21-bb0c-9221-c184cfaa3626@linaro.org>
Date:   Wed, 13 Apr 2022 08:37:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v13 4/9] dt-bindings: clock: Add bindings for SP7021 clock
 driver
Content-Language: en-US
To:     Qin Jian <qinjian@cqplus1.com>
Cc:     robh+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        tglx@linutronix.de, maz@kernel.org, p.zabel@pengutronix.de,
        linux@armlinux.org.uk, arnd@arndb.de,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1649659095.git.qinjian@cqplus1.com>
 <f8d5675d1bc32962af6379f78a171ed35b181ebc.1649659095.git.qinjian@cqplus1.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f8d5675d1bc32962af6379f78a171ed35b181ebc.1649659095.git.qinjian@cqplus1.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/04/2022 08:49, Qin Jian wrote:
> Add documentation to describe Sunplus SP7021 clock driver bindings.

(...)

> diff --git a/include/dt-bindings/clock/sp-sp7021.h b/include/dt-bindings/clock/sp-sp7021.h
> new file mode 100644
> index 000000000..de8ef5601
> --- /dev/null
> +++ b/include/dt-bindings/clock/sp-sp7021.h
> @@ -0,0 +1,90 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) Sunplus Technology Co., Ltd.
> + *       All rights reserved.
> + */
> +#ifndef _DT_BINDINGS_CLOCK_SUNPLUS_SP7021_H
> +#define _DT_BINDINGS_CLOCK_SUNPLUS_SP7021_H
> +
> +#define XTAL            27000000

This looks like frequency which usually does not belong to bindings. Why
do you need it here?


Best regards,
Krzysztof
