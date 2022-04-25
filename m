Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D46C433FE
	for <linux-clk@archiver.kernel.org>; Mon, 25 Apr 2022 08:40:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236034AbiDYInM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Apr 2022 04:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237120AbiDYImp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Apr 2022 04:42:45 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D936773061
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 01:39:39 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id gh6so4123902ejb.0
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 01:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QU0P/yAfdxW/XnE/c78tJbGnzMjRbqhHEjthPCSj6z0=;
        b=uKKuhcN10zjj5rrz8Ng44AmhPCp+HTfJhDmESFQEvFhtKVvzut4wXwX+gFe1UkPydE
         DceCNtbPYwS752H65OcgKMSFq2nrvLuXT5AIKDXoJxZdLU2gBud7LG8tK4bemyaHh2Sx
         hVA1nWcqKkeKhybwvOxb2T0YoMX/C8Vmc2c3F4+BnxtF5N0H1uq1mANt8pFZb/h7ICqI
         TCUeSxdE//BYw5wO3XJiCnlOdH/ikEPfvSxZW1QXHf9isRRZszCz/llXTDqdUv2kStAt
         +fv58RIKjAwUx+2fVM4a6VAklPEnGQA0YNTHhTQ+ovu0QglGZvLMVNniUibZFu+h72BI
         w7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QU0P/yAfdxW/XnE/c78tJbGnzMjRbqhHEjthPCSj6z0=;
        b=BizYo0QdCrVjjx/t6awSXt4v2sHJO5J2ELZmsrDypfd5eXfLOg4PFqqKPk0qaggXl/
         DSKeJAoHP5v4OBR3aPpP+GSe65BmrlMQjMNaye+3+xg/Fpceydp47Eg5i4k0iUSFzCli
         idXWNmrM23HhyKx7ueh4E2tlVuZ1RVM1M0n7JxNYtbZeOnAMvqKTvSQ5UMxf//I1s9Jy
         E30dleh5aHXu/pkL0rbzeGzHN+CFwa60/NFp0lnGhteCD3Lzzg/b2i4ou5v+ea21z1vJ
         S5yaHHSnGW/0VuDmTnP84BeEJpRxw294Qh8ImSepDG+fpQO5JeWMyT+Z3xf4EE3uoNkV
         +H2A==
X-Gm-Message-State: AOAM530G6i8Ky3MURKWXWpz/Q0sSbyeqGDgvcdsVYlZX3mrQ5HU438cz
        RflXy/2B/lTC6PvxIXNPue/5Cw==
X-Google-Smtp-Source: ABdhPJyQUNqDfJDw3xSJNGHEn0eczeJmWdHT3pf53j2e9iW+bgV4YOfUt0x2JDGAg5L2QzbRAANsJg==
X-Received: by 2002:a17:907:6e18:b0:6e8:c408:1bfe with SMTP id sd24-20020a1709076e1800b006e8c4081bfemr15347193ejc.467.1650875978503;
        Mon, 25 Apr 2022 01:39:38 -0700 (PDT)
Received: from [192.168.0.240] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o1-20020a170906774100b006efef41ac0dsm3360787ejn.215.2022.04.25.01.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 01:39:38 -0700 (PDT)
Message-ID: <925fbd8c-d6a7-04a4-c5a3-ae9d84883749@linaro.org>
Date:   Mon, 25 Apr 2022 10:39:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: mediatek: apmixedsys: Convert to
 DT schema
Content-Language: en-US
To:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Sam Shih <sam.shih@mediatek.com>, Ryder Lee <ryder.lee@kernel.org>,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Yassine Oudjana <y.oudjana@protonmail.com>
References: <20220424084647.76577-1-y.oudjana@protonmail.com>
 <20220424084647.76577-3-y.oudjana@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220424084647.76577-3-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24/04/2022 10:46, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Convert apmixedsys bindings to DT schema format. MT2701, MT7623 and
> MT7629 device trees currently have the syscon compatible without
> it being mentioned in the old DT bindings file which introduces
> dtbs_check errors when converting to DT schema as-is, so
> mediatek,mt2701-apmixedsys and mediatek,mt7629-apmixedsys are placed
> in the last items list with the syscon compatible, and syscon is
> added to the mediatek,mt7623-apmixedsys list.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../arm/mediatek/mediatek,apmixedsys.txt      | 35 -----------
>  .../bindings/clock/mediatek,apmixedsys.yaml   | 61 +++++++++++++++++++
>  2 files changed, 61 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
