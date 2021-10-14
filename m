Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1AFC433F5
	for <linux-clk@archiver.kernel.org>; Thu, 14 Oct 2021 08:04:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCC1E610E8
	for <linux-clk@archiver.kernel.org>; Thu, 14 Oct 2021 08:04:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbhJNIG7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Oct 2021 04:06:59 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:57636
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230035AbhJNIG7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Oct 2021 04:06:59 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E089A40003
        for <linux-clk@vger.kernel.org>; Thu, 14 Oct 2021 08:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634198693;
        bh=ojVn2ZVbkcgXLj7A1DRlVPqyw/Wvd+lGjqh+OPrsbYg=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=h+V/m8SE0ysBm9lknGPpnnkrr4Cm8wmFe8JqLgGBn2Fqz26H3Res69bAqugxBDn8i
         cxVbUVQU9lY7qhoZjNpgaogQm4iWpKgFXaLJhXl+GVGaHBlWJr7tc0b7UWC3mmBQYx
         H+uMjk7eAIr6ia93HNL7Nak5YBWodeB0Z4Li6X28L/zBQsPpNadka1TYjSVyRWb5Pz
         SujZ0E6vIOOGzByJyq1G6gqavCq1gYOGUeO/HezX0VdUIPjkdtnWT2diQZ5twOqEVu
         Ih1Sq9f/dED08Bg+BtLtncvk57wYW56Z82b7/kfE+70sZdSBxT0stGt75pigql/vU5
         xz/xw+AQ6IQWw==
Received: by mail-lf1-f69.google.com with SMTP id bt36-20020a056512262400b003fd7e6a96e8so3764575lfb.19
        for <linux-clk@vger.kernel.org>; Thu, 14 Oct 2021 01:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ojVn2ZVbkcgXLj7A1DRlVPqyw/Wvd+lGjqh+OPrsbYg=;
        b=1vDN58FtxUmDMeds9sypbVykL027SR1XbDZuX7d0KDHN5A6dERADfszd6lEw+FY7HW
         WhLZpsgYx0uNkPzPuhcop3HKM4aZ6xXMqu9+o8JCtZt66vA31BBVMdSFtDr3VSgIfauX
         ul4tTe8WlDOtibZN00yTj+twrkjk01iMZjDgd6wEphyk/x9KhIOwI0vbyDpHH6olU2fq
         pCm5EoXBi0VIWWKAKlfBU6wb9PowxqKv3tlJedGkHqpu0E6t4gqp+VJJWZy1wMRzw1Pu
         T9w36DFxlVuILoE5Y11YFDFFkYqUkfmdrWvWgTYmACgYrhhruMfG360EVyrtrP2JXCP1
         C89A==
X-Gm-Message-State: AOAM533moA0yC7e8zr9fyy9q5XE/pwEE1AQPZFwF64t3amA35MsyGELc
        zAC4oQTj7i3uGaxRnrj+9Tj/kdu9Qgws6eza1x9Xm7GqwRV23azYILRlRtzuP+tCoEB6A5+Gmgd
        7eic3zUZpOv96ZeoUZxMIpTBrbpiV2tdjg9zXJw==
X-Received: by 2002:a05:651c:907:: with SMTP id e7mr4525979ljq.457.1634198693185;
        Thu, 14 Oct 2021 01:04:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+fscirp5GuIbG7uOPrahokzBv9+3ns/V49MlZBkkCWBoqQbGM80foMTQ19Sle1sD5Y+4ZXA==
X-Received: by 2002:a05:651c:907:: with SMTP id e7mr4525955ljq.457.1634198692964;
        Thu, 14 Oct 2021 01:04:52 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id z12sm161733lfs.101.2021.10.14.01.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 01:04:52 -0700 (PDT)
To:     Hector Martin <marcan@marcan.st>,
        linux-arm-kernel@lists.infradead.org
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Sven Peter <sven@svenpeter.dev>, Marc Zyngier <maz@kernel.org>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211011165707.138157-1-marcan@marcan.st>
 <20211011165707.138157-7-marcan@marcan.st>
 <a9f6898d-bd76-b94e-52fc-98e9da1a04bd@canonical.com>
 <2a6f14e5-fbc9-4b9a-9378-a4b5200bc3fb@marcan.st>
 <f81467d4-74b2-176d-06bf-f04e073efce4@canonical.com>
 <00925242-b837-d75b-3655-536d45dcd4d2@marcan.st>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [RFC PATCH 6/9] memory: apple: Add apple-mcc driver to manage MCC
 perf in Apple SoCs
Message-ID: <410c0ccb-68d3-478b-2b5b-9165890e614a@canonical.com>
Date:   Thu, 14 Oct 2021 10:04:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <00925242-b837-d75b-3655-536d45dcd4d2@marcan.st>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/10/2021 09:52, Hector Martin wrote:
> On 14/10/2021 16.36, Krzysztof Kozlowski wrote:

(...)

> 
>>> Ah, I didn't realize that was a valid option for MODULE_LICENSE. I guess
>>> anything containing "GPL" works with EXPORT_SYMBOL_GPL?
>>
>> I don't think exporting symbols is related to how you license your code.
> 
> It is; only modules with a GPL-compatible MODULE_LICENSE get to use 
> symbols exported via EXPORT_SYMBOL_GPL.

Although there might be such correlation but it's not a rule. You can
have a GPL module exporting symbols without GPL requirement
(EXPORT_SYMBOLS). You can have a GPL+MIT module exporting symbols as
GPL. Obviously you cannot have a non-GPL module, as we do not accept
these and there is no such choice.

So answering your question that "GPL" works with EXPORT_SYMBOL_GPL -
everything is GPL but it works with both EXPORT_SYMBOL and
EXPORT_SYMBOL_GPL.

> 
> See kernel/module.c for the symbol lookup logic and 
> include/linux/license.h for the logic to check the string (seems like 
> "Dual MIT/GPL" is explicitly whitelisted there).

Not related to export symbol. It is used for determining the tainted
kernel via other licenses.

> 
> Of course, this is a futile effort, as ~every time I see a proprietary 
> module in some embedded device, it either falsely declares itself to be 
> GPL, or they have a shim module that re-exports GPL symbols as non-GPL.
> 

This is being removed soon (or already).


Best regards,
Krzysztof
