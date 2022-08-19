Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6825C32771
	for <linux-clk@archiver.kernel.org>; Fri, 19 Aug 2022 12:45:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349054AbiHSMps (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Aug 2022 08:45:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348900AbiHSMpr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Aug 2022 08:45:47 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E48B442E
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 05:45:46 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id x19so5967784lfq.7
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 05:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=qvXDTKscAiZiFahTRl2j0TPPmgPhdbYrghX1xTrKTXQ=;
        b=l7EYvlqAhiqET1OnR4Ql6iK5YCrtGs8RJ0ZneYjgaZ96uy1PEkRsz/Np9udIODLCeN
         gL5O9vo+TgwBSOh0H6ojZesoClRiBFbv0j2z1KbyMehWsxcrNVMOAAP6MicRQgFDI5Tq
         eoVHKgc3zljp+pf8+DIC/aGof0t4UjRwhdM7atuKItQ8zYkXkIqRoRkeGpwSvvG6R1Kj
         lddvWOunO8OmDqyPGXJ/nNYfY2Zw4keKeqKVnpHdqBTZJy+ZMMLVjsErlsQyIyQ8taVm
         BYRxn45gMrdCETjo1Ho2di1968lL3vLehYjcJrJNf1navA180MG6qI1XCFLTaz8GZ9YE
         z2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=qvXDTKscAiZiFahTRl2j0TPPmgPhdbYrghX1xTrKTXQ=;
        b=CYKettseXw7BejqwTfOVpKzbtPupyYxlr94H7XjdBwU3GnQu6utHSs5lwkE+Qs63Mj
         dVxQm7Qeyh0lqJmHz5JAxzaQzBXSVfzzcKBRso2B1m9DG9JBE7tBG0kGv8JjXAjs+Hhz
         gjOV+Adxj2+xGjHtkSfD2WrH3dIrisuj0SLbHRNd5ZMAovGqFavO+YtlAyjswBkiAA/N
         q62kpPvpxccUaNV5ji8bZVlGG3wVJv6gLdG/euZZURUy6yl8r1A8vnR8YZK6wPs7zGbp
         IhmBfaC4lploLT3Gn4UTIucjHOxiJRHy7Jvg2wl4upJb+F1DlKoJQ6ndZ2oHMeUZMmfz
         YZ4w==
X-Gm-Message-State: ACgBeo38BPAHzCPt/v+1ECkx4EWgg597QKBEKz+vbhRm40Cu1AQ0Ld2c
        8gIx/WpU7gIatbpZRvFFLdKEWQ==
X-Google-Smtp-Source: AA6agR6GbhxNbQO5V3790V+4FnkLBnhcICw3x9f7BqhylD85fTqQJiQHMCQLtgRZOvqMdEuFGfEM/A==
X-Received: by 2002:a05:6512:159a:b0:492:8c61:1991 with SMTP id bp26-20020a056512159a00b004928c611991mr2231483lfb.245.1660913145156;
        Fri, 19 Aug 2022 05:45:45 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id c19-20020a05651c015300b0025e59a76742sm607551ljd.14.2022.08.19.05.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 05:45:44 -0700 (PDT)
Message-ID: <9a2bef1f-8e5c-b26b-5cee-ee6ecc6960f8@linaro.org>
Date:   Fri, 19 Aug 2022 15:45:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/6] dt-bindings: clk: add PolarFire SoC fabric clock ids
Content-Language: en-US
To:     Conor Dooley <conor.dooley@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Daire McNamara <daire.mcnamara@microchip.com>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20220819122259.183600-1-conor.dooley@microchip.com>
 <20220819122259.183600-4-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220819122259.183600-4-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/08/2022 15:22, Conor Dooley wrote:
> Each Clock Conditioning Circuitry block contains 2 PLLs and 2 DLLs.
> The PLLs have 4 outputs each and the DLLs 2. Add 16 new IDs covering
> these clocks. For more information on the CCC hardware, see the
> "PolarFire SoC FPGA Clocking Resources" document at the link below.
> 
> Link: https://onlinedocs.microchip.com/pr/GUID-8F0CC4C0-0317-4262-89CA-CE7773ED1931-en-US-1/index.html
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../dt-bindings/clock/microchip,mpfs-clock.h  | 23 +++++++++++++++++++

This could be also a separate header file for CCC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
