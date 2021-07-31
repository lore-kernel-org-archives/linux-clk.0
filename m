Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66648C4338F
	for <linux-clk@archiver.kernel.org>; Sat, 31 Jul 2021 08:45:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 490FC60F39
	for <linux-clk@archiver.kernel.org>; Sat, 31 Jul 2021 08:45:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232728AbhGaIpk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 31 Jul 2021 04:45:40 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:46068
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232725AbhGaIpj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 31 Jul 2021 04:45:39 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 2A8533F23F
        for <linux-clk@vger.kernel.org>; Sat, 31 Jul 2021 08:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627721133;
        bh=HpikimZJ3+N1KHx4n97v9ZY8Mpfh1GCJC1kFvVvcZrc=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=J+0iscnl1f6Nl4fBHx4PEW1tQPMRyYzHoTWEkk4Jy1d4iVZdW3weCOtU/cJHd0ocs
         FvYvakymOh9rOjpPkMH586APFgSCSKGddk63TADY6ombqOnCGDdMK1dePNo3x7xhoW
         hJ5qr0z98uGy/z6GB9yCGQhAGfhREqVNT0jLgaEjT1KmdvwKYDe/vVdYMJ5iefXrls
         g0qoklNvrqbXHBv1JmHqAOrtbF6+S7tTq1ddbvNgaIOXJsvyJGvgVqakEUsJL4hdBI
         ONeSSOubIzQO1XRoe6MxZ25E1rY3au60JHFxW8nmFmOLZCnQmsppFSgO7dWwnUrQ73
         lwuE0+8psTjKg==
Received: by mail-ed1-f69.google.com with SMTP id l10-20020aa7caca0000b02903b874f26036so5812451edt.20
        for <linux-clk@vger.kernel.org>; Sat, 31 Jul 2021 01:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HpikimZJ3+N1KHx4n97v9ZY8Mpfh1GCJC1kFvVvcZrc=;
        b=VG2nGtYI82Rg1da7Ay0lIUinF1iNLxUJO0bgiLofWx0/puAlgtIgKvv0+2WnEBeQpq
         e4HEntt7ScFzw+OuVzpYhEDBmlolA/VIJOFcG97W/pdgKN29q7TpnnhOh74J2ftS37Ge
         GqRQv7UMl7g015XkyvhLCF1mJfvyn+U/AI1MS7o3t4Un0E/wnFUaa1Q9DsGA4xKk0BTJ
         FO7vOTxkFdXFx4Zof//GIzYk83OuRz92iUjtU7TU1Z7vvnUc7Hc+JkIF1qcEKiBl4L7L
         BlKmA3Uh/2V7vL3JyYLS2LM9IhMLYD1HCTXKwcoIguROq1ov1L/sp0IcZh2CYs//cGLR
         aChA==
X-Gm-Message-State: AOAM530UD5wboMny3arUxXaXgMJ0BLkKsJ92e+vdxr8xLI+/TOkk9b+V
        lRYbZcHb3+VmdptC52Xibf7XlwNdJEUVxnu/I3bKRGvWbI5at0vtqd7eGsm2EYVpqARgQXdurPg
        MnkyKYCUn03u7MelcGV+7kHof2LSoj+ZWWE4LZw==
X-Received: by 2002:a17:906:1f82:: with SMTP id t2mr6494545ejr.499.1627721132520;
        Sat, 31 Jul 2021 01:45:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhfyQHtQpkTYQbl8JV0BuJ0MetHqfQ6fFXdNuJCV2ubWaz/d0aGWkgl0x0n4Bo8PaJzjHcCQ==
X-Received: by 2002:a17:906:1f82:: with SMTP id t2mr6494542ejr.499.1627721132370;
        Sat, 31 Jul 2021 01:45:32 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id i10sm1888409edf.12.2021.07.31.01.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jul 2021 01:45:31 -0700 (PDT)
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-12-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 11/12] dt-bindings: interrupt-controller: Add IRQ
 constants for Exynos850
Message-ID: <d603be80-4fb6-1bad-1963-c9fa7d1e63fb@canonical.com>
Date:   Sat, 31 Jul 2021 10:45:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730144922.29111-12-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/07/2021 16:49, Sam Protsenko wrote:
> Add external GIC interrupt constants for SPI[479:0] for Exynos850 SoC.
> Interrupt names were taken from TRM without change, hence double
> underscore in const namings.

I am not sure what is the benefit of defining these in header. Unlike
other DT consts (e.g. clock IDs) drivers do not us them at all. Using
them in DT does not reduce chance of mistakes in numbers - instead of in
DTS you can make a mistake here in header file. In the same time, they
grow the interrupt property in DTS making it more difficult to read.

I also did not see anyone else using this approach, so it's not only me
(Marc also find it confusing).

If vendor kernel did similar, it's not an argument. Samsung LSI /.
vendor kernel has terrible code quality so usually it is not a good example.


Best regards,
Krzysztof
