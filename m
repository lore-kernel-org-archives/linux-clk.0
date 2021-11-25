Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A10C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 25 Nov 2021 13:55:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355123AbhKYN6q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Nov 2021 08:58:46 -0500
Received: from mail-vk1-f179.google.com ([209.85.221.179]:35473 "EHLO
        mail-vk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355369AbhKYN4p (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Nov 2021 08:56:45 -0500
Received: by mail-vk1-f179.google.com with SMTP id q21so3943712vkn.2;
        Thu, 25 Nov 2021 05:53:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4+QvhBxg0GBZ3QpwSsqwAPpUhOAKF9uh752mqs5VZ/Q=;
        b=1sE9+F5I0B2xhB7OssWLlezorSvdpn/+5XiYIsm1JNDIssY+X9zLtZ1BMO39FdoM12
         1yYX1PIjI5ISCJjbAMNBlWZ5slgNDSn6wgn7YbvOhFYm7+5JhHJigLVFzZsStEMg4hJ8
         cTaOjQTPZUXdAGVIsnE0B6CaOMs0I+B8UnSf5aSKz2Qt14O4hX/wE8ge7KhPfHb+oMi6
         dAiE9OL8MPc30uZTGyPKS5c1ikkgwMoN6N5vAerYzZtL3mjjRusyAapowvO1qmuDN6SY
         B6mqqbM4lo4kd/BVtkUj+ErxYhnjyQCsIxzWSnPmEJ0Sczw+NSP4Wbo6ImW79+K2LZ0S
         NPkw==
X-Gm-Message-State: AOAM532FHglH4yJGnbae1La9gJhe5VwNvnKnWgte0Pc3n1LniyIqC9fT
        3FbgDns+6vflruP3xywalR0//WRo9VvXFQ==
X-Google-Smtp-Source: ABdhPJw0Zm2N+EBF6FYNnzEZtrssSbH1Dyb91AdA394rORBx2yFXqE19TSpDuspm2dadtmfW+BMopg==
X-Received: by 2002:a05:6122:214e:: with SMTP id m14mr10960668vkd.19.1637848413708;
        Thu, 25 Nov 2021 05:53:33 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id c23sm1723517vko.8.2021.11.25.05.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 05:53:33 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id n6so12499198uak.1;
        Thu, 25 Nov 2021 05:53:33 -0800 (PST)
X-Received: by 2002:a67:c106:: with SMTP id d6mr9818959vsj.77.1637848412799;
 Thu, 25 Nov 2021 05:53:32 -0800 (PST)
MIME-Version: 1.0
References: <mhng-2e959dbf-7344-4ddc-b133-06ef3c5abccf@palmerdabbelt-glaptop> <488b7821-674f-61ff-a960-ba3f650d3a78@kernel.org>
In-Reply-To: <488b7821-674f-61ff-a960-ba3f650d3a78@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 25 Nov 2021 14:53:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX_D_5Zd3GCoeqadDme51S1BOPYfyM+ksRgQz4drJJpWw@mail.gmail.com>
Message-ID: <CAMuHMdX_D_5Zd3GCoeqadDme51S1BOPYfyM+ksRgQz4drJJpWw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2 resend] clk: microchip: Add driver for Microchip
 PolarFire SoC
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>, daire.mcnamara@microchip.com,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, cyril.jean@microchip.com,
        Conor Dooley <conor.dooley@microchip.com>,
        david.abdurachmanov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Nov 9, 2021 at 11:21 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 18/08/2021 23:09, Palmer Dabbelt wrote:
> > On Wed, 18 Aug 2021 07:11:02 PDT (-0700), daire.mcnamara@microchip.com wrote:
> >> --- /dev/null
> >> +++ b/drivers/clk/microchip/Kconfig
> >> @@ -0,0 +1,7 @@
> >> +# SPDX-License-Identifier: GPL-2.0
> >> +
> >> +config MCHP_CLK_MPFS
> >> +    bool "Clk driver for PolarFire SoC"
> >> +    depends on (RISCV && SOC_MICROCHIP_POLARFIRE) || COMPILE_TEST
> >
> > This shouldn't depend on the SOC config.  Those were meant to just
> > enable a set of drivers, not restrict what can be enabled.
>
> The kernel config is overwhelmed with amount of choices of drivers, so
> it is quite common to restrict the choices of subarch-specific drivers
> to these sub-architectures. That's how many, if not most, of ARM v7 and
> ARMv8 drivers are restricted. Some other RISC-V drivers follow this
> concept (git grep SOC_CANAAN, git grep SOC_SIFIVE) because it is
> friendly for people configuring kernels. Why making configuration choice
> more difficult and show the SoC-specific clock driver to every other
> platform (when this SoC is not used)?

+1

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
