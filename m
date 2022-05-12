Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DBCC43217
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 14:12:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354920AbiELOL6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 10:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355091AbiELOLx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 10:11:53 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DD86612BB
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 07:11:51 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id a14-20020a7bc1ce000000b00393fb52a386so5236696wmj.1
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 07:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=SRwpNt4DH8DqblGWpeI/m6J/HBl7UK2S+eeIMKh0Tkc=;
        b=vRz7pNegaN7s9ys9HBCJZgVKbR7C5L5hdBVEje78wDlPADH7OwcoBwoJe5pSSFdPSW
         wQJPQ8btIA1ek+0e3nSIOG4/saxP04npfrnUgaRlbMROopUfJYN1YK9a7tTqYLEoT9C4
         MMdralMo+iefdxRWSMpSIuXOSjzIQv/refS4Pm1xmr3ukOSXv/8QglMGSh/wLO+QSWd4
         Qw+fNNaJXTH9zoZH7LidmmPy+YNNQX1qDNULasFY9OMpl7hIvDKeIt4Ti/irDm1nO2h3
         GTodUdX+gSH+/cGGqpsZ2T6aHaQjGfX2p4nxbRG7zX3+jMk92Mbjvqz9vcx51QnIMtl/
         LX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SRwpNt4DH8DqblGWpeI/m6J/HBl7UK2S+eeIMKh0Tkc=;
        b=7+Ywo2Sw13xHjQqTlb7dvUsGwOZThojNgwx6rhSoG8cil7NysV863Ci8CScrQzi9T5
         zekN0fL+rirgsktY9cTo8I6DWdy2zb1lipj7IDVZrsxBbb2GI3y0j86wBedLeazteSy2
         KomdMbLXd0yVICud6UTWU5jl/RU6jTgd2sC0BzPJv6+6b6S50/CZF93R9NNJ3WTo1FPh
         AN8eKUqsMk7bMRAbhGQukGP3R2x30p3MIt0JngrFcrnyjk3AYVwWEABfQNHUMdCgAFHS
         R5u6BuBAy8KcF0u7KCpVYtAzg9h6xCmChw+71wCroChwtsNmk7sVatIQyicb1ikz0lxs
         QPlQ==
X-Gm-Message-State: AOAM532VYYwI8WnBrMwm3wCsXajdory7K02+hBxlgFsns8DYi3n+/Mnp
        9M0lgJGBgGpob/2iZ4heVlD84Q==
X-Google-Smtp-Source: ABdhPJxbXnBKFPQ09ZKP2iaCL8DUkX2cQXFCc0U3GkQ6NUUF3YBxMC4DeHvJ+itvzyH5DnaZCjP1Bw==
X-Received: by 2002:a05:600c:4f95:b0:394:8919:7557 with SMTP id n21-20020a05600c4f9500b0039489197557mr3001wmq.166.1652364709980;
        Thu, 12 May 2022 07:11:49 -0700 (PDT)
Received: from [192.168.0.160] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id w9-20020a5d4049000000b0020c5253d8cfsm5165586wrp.27.2022.05.12.07.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 07:11:49 -0700 (PDT)
Message-ID: <8be62b40-077a-7634-7d34-7776909a2abe@linaro.org>
Date:   Thu, 12 May 2022 16:11:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH V4 0/5] Add initial support for MA35D1 SoC
Content-Language: en-US
To:     Arnd Bergmann <arnd@arndb.de>, Jacky Huang <ychuang3@nuvoton.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        ychuang570808@gmail.com, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, SoC Team <soc@kernel.org>,
        cfli0@nuvoton.com
References: <20220510032558.10304-1-ychuang3@nuvoton.com>
 <CAK8P3a1k8y8U99bBmqBYE1vYAc0q-UeaM0oLP4tTHZCpyYNOgA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAK8P3a1k8y8U99bBmqBYE1vYAc0q-UeaM0oLP4tTHZCpyYNOgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/05/2022 09:07, Arnd Bergmann wrote:
> On Tue, May 10, 2022 at 5:25 AM Jacky Huang <ychuang3@nuvoton.com> wrote:
>>
>> This patch series adds initial support for Nuvoton MA35D1 SoC,
>> include initial dts and clock controller binding.
>>
> 
> This looks fine in principle, but we are getting close to the merge window and
> should finalize this quickly to make it into v5.19. I see that you don't have a
> console device, as commented in the .dts patch. Normally I prefer merging
> platforms only when there is at least rudimentary support for booting into
> an initramfs with a serial console, but this is a flexible rule.

I disagree. It does not look fine - does not pass `make dtbs_check` even
with Nuvoton bindings...


Best regards,
Krzysztof
