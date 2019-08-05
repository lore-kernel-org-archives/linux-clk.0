Return-Path: <SRS0=R3Mk=WB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9518CC433FF
	for <linux-clk@archiver.kernel.org>; Mon,  5 Aug 2019 10:36:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 61CDA216B7
	for <linux-clk@archiver.kernel.org>; Mon,  5 Aug 2019 10:36:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ja3y/qCc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727230AbfHEKgR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Aug 2019 06:36:17 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35256 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728239AbfHEKgR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Aug 2019 06:36:17 -0400
Received: by mail-lj1-f195.google.com with SMTP id x25so78940003ljh.2
        for <linux-clk@vger.kernel.org>; Mon, 05 Aug 2019 03:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WMDXKniohFuBPRLguP0pUUrpe4kGWQLXsJ2UgVzEajY=;
        b=Ja3y/qCciaFzokLgL6u25vb1VO7Jhd9hDVgi831a5t9rj9AH9Un97C+tZ2f0nZEfH6
         4D1vVJRh9qg+tqEo+zKbHUZq8lWz8hQOwwRPR3gomDMkjUS4pRhVtqFhPNrain1SuaOr
         N6vly5/z6MlhpO1oDoBNJG6X5kHjq4Esv3E9SaDVBY9KSAZ2swaRFmzu6u/e+0ZHK7pZ
         k+CX1SeKUVCBajhNjiMExFEk5RgmYg9qiXnYAXCD3PbiKWZnJIZ3tDIm5MESgqVbbjN9
         eLdGt+lPl19J3ik/4xmhMzMB6BUjfJjxYQm15K+vO83/Te5WnuvP+l1NmhkMYq4cUeXT
         Nn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WMDXKniohFuBPRLguP0pUUrpe4kGWQLXsJ2UgVzEajY=;
        b=GXm8AO5s1JCztcxtmXf0mmI97IpLmivJquDbygSpyUvm2AsKemkEcGhKleWzD5y4Af
         dbVoerqBQ1/h/VxTtxjhrbS6ebEZcmH12sS+Eg+moDRgFofX46/sZQEA5fwyGBxwJEq/
         CHcCN5s+nnC9Romo0TXU5LoTL02XTEq56A4OG4MXotzCD0vT6V+VuG/H1/F1bU77MZnh
         yUVMPXLEV9TXD4zaqaYqxGUe6mPTDcbBF56btrK8kie6tadrQ4URkh6Cuf53NKhF6K46
         n6nm60I4ePZyCMLp9l+l8E+Yv7/gQ2glKVcWmpcgQZyQStYqE0rFosDgV9MWqqSWmGzl
         Vs9Q==
X-Gm-Message-State: APjAAAXNxTblbnGobN0O5UqBgdv/784esQFLwVQArVU7A+uMdzxoxBMf
        8A5bP9jk87d+Mtn2l2fA8FXuxK2Xn7R63pw46GKjCw==
X-Google-Smtp-Source: APXvYqyB/49/aeHh2mx864HdyglYXRLbeplrleopj5uZcs1oTYM9hcI7bKMIk3eFK+kMXyQkKYCUTOCwVkAKT2Az3D8=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr16472034ljs.54.1565001375393;
 Mon, 05 Aug 2019 03:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190728031227.49140-1-icenowy@aosc.io> <20190728031227.49140-2-icenowy@aosc.io>
In-Reply-To: <20190728031227.49140-2-icenowy@aosc.io>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 12:36:03 +0200
Message-ID: <CACRpkdY65Ob-zbd+c4reUzYtXdk441horQ0ykL08YeBrgXWqQw@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] pinctrl: sunxi: v3s: introduce support for V3
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Jul 28, 2019 at 5:13 AM Icenowy Zheng <icenowy@aosc.io> wrote:

> Introduce the GPIO pins that is only available on V3 (not on V3s) to the
> V3s pinctrl driver.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Patch applied to the pinctrl tree.

Ypurs,
Linus Walleij
