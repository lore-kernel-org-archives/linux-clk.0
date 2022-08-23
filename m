Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361F0C32772
	for <linux-clk@archiver.kernel.org>; Tue, 23 Aug 2022 15:16:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242050AbiHWPQ4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Aug 2022 11:16:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242879AbiHWPNU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Aug 2022 11:13:20 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32015149A34
        for <linux-clk@vger.kernel.org>; Tue, 23 Aug 2022 03:23:36 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id l21so13072189ljj.2
        for <linux-clk@vger.kernel.org>; Tue, 23 Aug 2022 03:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=yn5Cp9zoeWqGbxL3HM65C3eQTNCudh4CzSg5Uvw3JAk=;
        b=QAJc4lxwTmf0W3KWKXRjlw6qcyC3eHPyQ5QoGuhnvAn60+muAHk9sdN/Zcrm1cUMIq
         s/MnHrcCQNq3gmf9HYQNuccxGkfgpsLZL3+qnn86GSOLQoFZfN1u8KnQ3gDYLaOCKcgW
         fLKxap4SHvHxX6tr3L632x2JnYqbZa2/5J3CopLcqmYJfyGRzPyGN50TuOW8DZUOhphs
         zIJsqGjIJRIiRgqM/V447asxh+qfPATLOZ2Ic9S7QL+s5C7vfITWKfI8dfruPLKw483q
         WpUr3abO2RFu4eWv6TQUVEkjTKgPnmC0rnSEyrkHDsyWTtzGPQEzEXrNtaE6dS5IrIWZ
         Kyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=yn5Cp9zoeWqGbxL3HM65C3eQTNCudh4CzSg5Uvw3JAk=;
        b=h8og1xmK9AKbgBQupKyX6UImjeOzwUb08GnmJjsYnmsDe+TapPm0QyRda7CWBIEfDV
         XDpRAj1JnEw4pjFO9dhGc8WrNuLkhZn8BFrkvbwoX7m1phbQ2pfPzoLrp+yJ2k73Cp8W
         EG5OlkbTODmjTP8hD0ck0Xyu0b4YGsBU4lSej0ifZaTIwy/SnWkznNMekl6NO6uGdrLj
         cS6Qwo6JbrP/MRKDWmy+4bQoTGLf+NvUZ3dUJ7nB7uJ4+VUCv9XNjTPFIIY4s2Kecxl4
         mpd2G/9tUhhEw+dIKaHMZ8hWB5xi/U8mzrIE/8wt+cKeHv9mLQnqmXkbK+T2X62YySeM
         9gGg==
X-Gm-Message-State: ACgBeo2cWHi2/lytKr80eai7e8QEB2QMYLGnrjDE1iAWIXpeuoilj3b9
        T0IE2DCIzhWrkfZlSwiw0uCIUg==
X-Google-Smtp-Source: AA6agR4D5aExJIR72fiYWF97zzNBynY+4arB6wbMmJjNpCzNC+/Ov4i9Sl/PcwnVnQxQKarFz5l0fg==
X-Received: by 2002:a05:651c:114b:b0:25b:e13b:6900 with SMTP id h11-20020a05651c114b00b0025be13b6900mr6417785ljo.462.1661250214179;
        Tue, 23 Aug 2022 03:23:34 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id c4-20020a196544000000b00489e2156285sm2434193lfj.104.2022.08.23.03.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 03:23:33 -0700 (PDT)
Message-ID: <c3831c5a-7e10-2112-83e0-4ec2d70001c2@linaro.org>
Date:   Tue, 23 Aug 2022 13:23:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH RESEND v10 6/7] clk: baikal-t1: Add DDR/PCIe directly
 controlled resets support
Content-Language: en-US
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220822182934.23734-1-Sergey.Semin@baikalelectronics.ru>
 <20220822182934.23734-7-Sergey.Semin@baikalelectronics.ru>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220822182934.23734-7-Sergey.Semin@baikalelectronics.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/08/2022 21:29, Serge Semin wrote:
> Aside with a set of the trigger-like resets Baikal-T1 CCU provides two
> additional blocks with directly controlled reset signals. In particular it
> concerns DDR full and initial resets and various PCIe sub-domains resets.
> Let's add the direct reset assertion/de-assertion of the corresponding
> flags support into the Baikal-T1 CCU driver then. It will be required at
> least for the PCIe platform driver. Obviously the DDR controller isn't
> supposed to be fully reset in the kernel, so the corresponding controls
> are added just for the sake of the interface implementation completeness.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> ---
> 
> Changelog v6:
> - Refactor the code to support the linear reset IDs only. (@Philipp)
> 
> Changelog v7:
> - Drop empty line from the sys_rst_info structure initialization block.
>   (@Philipp)
> ---
>  drivers/clk/baikal-t1/ccu-rst.c     | 66 +++++++++++++++++++++++++++++
>  drivers/clk/baikal-t1/ccu-rst.h     | 10 +++++
>  include/dt-bindings/reset/bt1-ccu.h |  9 ++++

Do not mix drivers and bindings. Bindings always go separately, so this
has to be split.

Best regards,
Krzysztof
