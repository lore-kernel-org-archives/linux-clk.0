Return-Path: <SRS0=Rxbn=UL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB24C31E46
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jun 2019 12:12:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 79626208C2
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jun 2019 12:12:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cs1gGg57"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730021AbfFLMM5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Jun 2019 08:12:57 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38441 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbfFLMM5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Jun 2019 08:12:57 -0400
Received: by mail-lj1-f193.google.com with SMTP id o13so14898077lji.5
        for <linux-clk@vger.kernel.org>; Wed, 12 Jun 2019 05:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ELkeEswy3RryzFI9wP7fvpF8yJjPUXwtrgXJFfzoWvc=;
        b=cs1gGg57RFwsFNBg5Wz1FxALZjEjnWdh36wZ2+m8aRNowiw+keszis1eGyPtUSycfJ
         jw4fgGS36H0s7D12QWk4cu5sD72scRy++h1LTxCTbcVox4Xjha4j2VqTkBupv8Ta2Ui+
         irn2QLfGeUryARGROwaNwQt9HbqFNSh55sS39e3e7IdSxoAb6RCUk7ubQQvb3BRpq9Qj
         ysE9d/YnTN4UNmKzzslol++aPGqWB5P+7Mqsp3Uyxu59iZ4oIRaUFQbuwvNOAOUbDXwZ
         tgQdhfyVIfSiIroPFqotYYUROmQXrYohGNecKnbB1jB+kRnxiMrUHi3i6HtA6P0t39dW
         WtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ELkeEswy3RryzFI9wP7fvpF8yJjPUXwtrgXJFfzoWvc=;
        b=jMwMN0yXQTs67q+5JLScagiL2e3GwUJODvN6SqTm63w4UeOZZEG/JdLAgu35/rinL0
         U9lof+XGr2nUZ6nIVsvpaT99nyKmNZWlCobWoh/5MtmjzWFSQa1zLotAszwLwueMuJz3
         SLm+1Q4sniT+en7vz5gzMotJRaQNex1Nwktfis9hkGGAKhNd8bZxFtHkpEFzJlHIBnP+
         k5qjrHIvo6Fzo3a9H7LXPImmpLdxSfEItzGOy7rcGdZoJRCAyYrdSSCJN9nJQ98f08fe
         sbfuMuf8VqOb+Mb0aakbSIUbc9bXoJq5S597SKsgFwYN3v4pennXC1j5sGyx5JM0TQAs
         +xXA==
X-Gm-Message-State: APjAAAVlHpod1/znrrwQmNnTTvaswiMRH8yKGRXjTJMDKdDldsZfZCGI
        THd86qF8xHCElurN83hi1stML2QnEaimsGEVIyTOqA==
X-Google-Smtp-Source: APXvYqwX/cz4Ov/rw6ige4uWEBhHtZdC1FwFiYjZbazDExi8Yz+Hq0FkTVaZ7z4h+4ZcFlJnGyli0LLghmuu6GyC4p8=
X-Received: by 2002:a2e:9753:: with SMTP id f19mr4505822ljj.113.1560341575429;
 Wed, 12 Jun 2019 05:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190611140940.14357-1-icenowy@aosc.io> <20190611140940.14357-3-icenowy@aosc.io>
In-Reply-To: <20190611140940.14357-3-icenowy@aosc.io>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 14:12:44 +0200
Message-ID: <CACRpkdav8F0F=Kepa6YskZbFEC6vfGxRe89VpK+bw8o_+dgAdQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] dt-bindings: pinctrl: add compatible string for
 Allwinner V3 pinctrl
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Jun 11, 2019 at 4:11 PM Icenowy Zheng <icenowy@aosc.io> wrote:

> The Allwinner V3 SoC, despite come with the same die with V3s, has more
> GPIO pins than V3s, and a different compatible string for pinctrl is
> needed.
>
> Add the compatible string for V3 pinctrl.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes in v2:
> - Add the review tag by Rob.

Patch applied.

Yours,
Linus Walleij
