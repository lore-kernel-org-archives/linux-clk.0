Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0F3C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 15 Dec 2021 18:09:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245715AbhLOSJn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Dec 2021 13:09:43 -0500
Received: from mail-vk1-f175.google.com ([209.85.221.175]:40556 "EHLO
        mail-vk1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245461AbhLOSJn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 13:09:43 -0500
Received: by mail-vk1-f175.google.com with SMTP id 70so15163133vkx.7;
        Wed, 15 Dec 2021 10:09:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NVhMS8slP75NBMd9XZMrWvuSBceCIYT7fsS/uOwABuk=;
        b=xPrqaT7yC0iK9JZkUkhok6qbdYbWxWWaoIjO+ovXX+M7IIlDJD9xHqmJiAKcsax3Wv
         5xAtj/7qtlzPhVldzfWV5rlSmLdoSk7A47SXtg1KFzCiEcqHZvl60SwARH2Rd0LkjsLZ
         nNv+GleoxMZnDMAeZnBSgibxp1rA8Ghp8hNujrvmG7iuwWWbeF5P5kNt/s/ZuuFel+5v
         yj3yJWSpVP5Dfmmo5sN+NZq5qw+TQ9rFi+g+9KYMpAt8+hEVXNYhJ9VLpmN69BJa429N
         BfP2tDXoXm4n07MLdqqdTgIWJo+Nra/o71K4TDtjnRn/f8rw5VP5a5iZ72vbnjBJT1cj
         +T9A==
X-Gm-Message-State: AOAM5335Z2NjzmnEJY5mqkiBOx6eRXmgbJOf30Cyhtj+lkdjcu8tQb0B
        c91NEGXDxtbxeubaoYIc8xFy0jAeEv48LA==
X-Google-Smtp-Source: ABdhPJz+iR41btLhrczYjygtqpkvS3QHiui9brPvh/6NN+8Yg+Thndg/yasGaTlafwt09jGZekbpeA==
X-Received: by 2002:a05:6122:201e:: with SMTP id l30mr4371669vkd.10.1639591781772;
        Wed, 15 Dec 2021 10:09:41 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id j15sm424508uae.20.2021.12.15.10.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 10:09:41 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id h1so15200064vkh.0;
        Wed, 15 Dec 2021 10:09:41 -0800 (PST)
X-Received: by 2002:a1f:9f04:: with SMTP id i4mr4203611vke.33.1639591781212;
 Wed, 15 Dec 2021 10:09:41 -0800 (PST)
MIME-Version: 1.0
References: <20211215083002.1353-1-conor.dooley@microchip.com> <20211215083002.1353-2-conor.dooley@microchip.com>
In-Reply-To: <20211215083002.1353-2-conor.dooley@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Dec 2021 19:09:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX9nn5Yu2qG-HWKaKHtWvnrtcb3H73c2m3LLpv4XK1Y6A@mail.gmail.com>
Message-ID: <CAMuHMdX9nn5Yu2qG-HWKaKHtWvnrtcb3H73c2m3LLpv4XK1Y6A@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: clk: microchip: Add Microchip
 PolarFire host binding
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        david.abdurachmanov@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>,
        daire.mcnamara@microchip.com, cyril.jean@microchip.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Conor,

On Wed, Dec 15, 2021 at 9:29 AM <conor.dooley@microchip.com> wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
>
> Add device tree bindings for the Microchip PolarFire system
> clock controller
>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for the update!

Please add tags given to v6 (after fixing below):
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml

> +  clock-output-names:
> +    maxItems: 33

Whoops, why has this re-appeared? Please drop it again.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
