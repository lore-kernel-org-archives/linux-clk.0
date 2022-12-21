Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3CEC10F1B
	for <linux-clk@archiver.kernel.org>; Wed, 21 Dec 2022 13:03:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233747AbiLUND7 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Dec 2022 08:03:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233283AbiLUND6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Dec 2022 08:03:58 -0500
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF51523392;
        Wed, 21 Dec 2022 05:03:56 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id g7so13552421qts.1;
        Wed, 21 Dec 2022 05:03:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4p324fHX/ErZqN1fIQSXCl0+20LjA0Me1b/10VWr6c8=;
        b=rAncHgsstCCjuCsvNt+G9a+y4Mjx/wmf9P92FDRLR6K196a3ZYmsMiUwTye/ITEhSt
         Zb2/jU8f3woW17CJoO7zrTPUW0mS0Fp1oh3tS+hWXpnZOp17rMl0p7pBeD3vkv7vplNG
         7GfFsIg25HknEIag1v6GbY+hWxKyzkyi4q0TbmjMnTJ9FL2XdW6xzASMaR26VdpdQwHa
         Ohgjx0S69jOyR4VPAXnHvj9P52HAX92icucXdrMWRDh0BVNGyfLcLIgOyLFVzT3S5cc6
         dCmDGtfDSL2jWjSWRw3q7gUkvuPbmT7/wThDY1nKO8gcIvTm8ZzVDMEr9v3Ubmv8eFDI
         /QMA==
X-Gm-Message-State: AFqh2kpemyc6Hm/YV8ZUIoTmtYCvdNVw7MM/dxmEnUkxzycFhjg+cjn6
        erkkHKX27l3Cj2Fnz21hUGQVRFHtWeFmNQ==
X-Google-Smtp-Source: AMrXdXvJPYtD/sTVW+SHuOGKf42jQHPBXu/FaNIiDBBLduR22EezyIydkKeSuqFB5826eSCB6df+hw==
X-Received: by 2002:ac8:6057:0:b0:3a8:1291:a664 with SMTP id k23-20020ac86057000000b003a81291a664mr1977599qtm.54.1671627835663;
        Wed, 21 Dec 2022 05:03:55 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id a12-20020ac84d8c000000b003434d3b5938sm9073061qtw.2.2022.12.21.05.03.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 05:03:55 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-40b40ff39f1so209982287b3.10;
        Wed, 21 Dec 2022 05:03:55 -0800 (PST)
X-Received: by 2002:a0d:ca4d:0:b0:38e:e541:d8ca with SMTP id
 m74-20020a0dca4d000000b0038ee541d8camr94516ywd.283.1671627834811; Wed, 21 Dec
 2022 05:03:54 -0800 (PST)
MIME-Version: 1.0
References: <20221213133302.218955-1-herve.codina@bootlin.com> <20221213133302.218955-4-herve.codina@bootlin.com>
In-Reply-To: <20221213133302.218955-4-herve.codina@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 21 Dec 2022 14:03:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV7QNZ8Rv6iFLhj_MmBHL-vGWuWZdKB=REWba1UAWgkHw@mail.gmail.com>
Message-ID: <CAMuHMdV7QNZ8Rv6iFLhj_MmBHL-vGWuWZdKB=REWba1UAWgkHw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] usb: gadget: udc: add Renesas RZ/N1 USBF
 controller support
To:     Herve Codina <herve.codina@bootlin.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Hervé,

On Tue, Dec 13, 2022 at 2:33 PM Herve Codina <herve.codina@bootlin.com> wrote:
> Add support for the Renesas USBF controller.
> This controller is an USB2.0 UDC controller available in the
> Renesas r9a06g032 SoC (RZ/N1 family).
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/usb/gadget/udc/renesas_usbf.c

> +#ifdef DEBUG
> +#define TRACE(_fmt, ...) trace_printk("%s: " _fmt, __func__, ##__VA_ARGS__)
> +#define USBF_TRACE_EP_MASK 0x0ffff /* All the 16 endpoints */
> +#define TRACEEP(_ep, _fmt, ...)                                             \
> +       do {                                                                \
> +               if ((1 << (_ep)->id) & USBF_TRACE_EP_MASK)                  \
> +                       trace_printk("%s: " _fmt, __func__, ##__VA_ARGS__); \
> +       } while (0)
> +#else
> +#define TRACE(_fmt, ...) do { } while (0)
> +#define TRACEEP(_ep, _fmt, ...) do { } while (0)

Please use "no_printk(fmt, ##__VA_ARGS__)" instead of dummy loops,
to avoid bad callers going unnoticed if DEBUG is not defined.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
