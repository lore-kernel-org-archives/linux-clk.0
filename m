Return-Path: <SRS0=O5DU=NX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73580C43441
	for <linux-clk@archiver.kernel.org>; Mon, 12 Nov 2018 11:05:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 367FB223D8
	for <linux-clk@archiver.kernel.org>; Mon, 12 Nov 2018 11:05:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="JX1X+uhv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 367FB223D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729238AbeKLU6m (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Nov 2018 15:58:42 -0500
Received: from mail-it1-f193.google.com ([209.85.166.193]:35238 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729233AbeKLU6l (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Nov 2018 15:58:41 -0500
Received: by mail-it1-f193.google.com with SMTP id v11so12606855itj.0
        for <linux-clk@vger.kernel.org>; Mon, 12 Nov 2018 03:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=n982l6oXM3kdM5qUZjKuHx+2C1ot7ZYP9H/FzF5utqc=;
        b=JX1X+uhv8dcLCUPoOucyu61DCJrFcJuGumQV9QSg/nuB451zk30K6jCB6LIopK8RGa
         JP0Z+Qgd4ys9Ph5/0u8Pi141RSEOiss8CKIXkudZgqaWvoNU+xkq2L456byErqZU+21w
         KG4YUciToBmiIuJM7GzdVBt4tJdQaEY9zSUxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=n982l6oXM3kdM5qUZjKuHx+2C1ot7ZYP9H/FzF5utqc=;
        b=nciOihxAKeL96pGwdnKMumgIhO05k7HaGpiB7RbO9aQ065WoZzSh9NGmjwcY5Eu0mA
         S/I4/9I8HWXKuEcs+pcT53Xz8nXjCaoIztsCJ1N7gOxiApTKtBnsEkgR35jiRBxCv8EW
         SoLdPuudxk1wkodHoLPHWWjFKThwIZGVb5qiKdB79PeFlU8uIo2E4ls22l/2oWkseYy+
         uPWrvlRUMv+di456qikXRl9Z9/CX9HXt9DayYlz09/k+jRlUcvq/BJcfG3o2l+ZKSTZG
         Ymb/oWBQoG1/5NuLPjOhb3lCvL56GdfkdRcUL082NJ7M7trHWmd0v1KhGimRNQuwyhE1
         xQuQ==
X-Gm-Message-State: AGRZ1gJYnueqRPFdG/Ul/ngpb6JnUkB385B/TwTAq7UDKUD0laz+bdUx
        Ln+VAtzpyowrOGt29xkTdrQ5vbknqGe47oFpih6VKg==
X-Google-Smtp-Source: AJdET5dUnDUJLpz2nD+ktTVbS2HsES5fJ79ar2w/JGv9uFNGVPOrWDZYtfuaSVQfGbucV2/J+OwuUiM11uKhU7nqNyc=
X-Received: by 2002:a24:d4:: with SMTP id 203-v6mr10687508ita.26.1542020755780;
 Mon, 12 Nov 2018 03:05:55 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a02:38d:0:0:0:0:0 with HTTP; Mon, 12 Nov 2018 03:05:15 -0800 (PST)
In-Reply-To: <20181024222301.21455-4-chris.brandt@renesas.com>
References: <20181024222301.21455-1-chris.brandt@renesas.com> <20181024222301.21455-4-chris.brandt@renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 12 Nov 2018 12:05:15 +0100
Message-ID: <CAPDyKFoTa4mUQmKrn+T_Qu5sbWCFxZZWYL1U9daA+bTJMYU3nw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] dt-bindings: mmc: tmio_mmc: Document Renesas R7S9210
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25 October 2018 at 00:23, Chris Brandt <chris.brandt@renesas.com> wrote:
> Document support for the RZ/A2 (R7S9210) SoC.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Applied for next, thanks!

Kind regards
Uffe

> ---
> v3:
>  * Added Reviewed-by from Rob and Simon
> v2:
>  * Documented that R7S9210 has 2 clocks
> ---
>  Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> index 27f2eab2981d..9391ae9a1d9d 100644
> --- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> +++ b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> @@ -13,6 +13,7 @@ Required properties:
>  - compatible: should contain one or more of the following:
>                 "renesas,sdhi-sh73a0" - SDHI IP on SH73A0 SoC
>                 "renesas,sdhi-r7s72100" - SDHI IP on R7S72100 SoC
> +               "renesas,sdhi-r7s9210" - SDHI IP on R7S9210 SoC
>                 "renesas,sdhi-r8a73a4" - SDHI IP on R8A73A4 SoC
>                 "renesas,sdhi-r8a7740" - SDHI IP on R8A7740 SoC
>                 "renesas,sdhi-r8a7743" - SDHI IP on R8A7743 SoC
> @@ -56,7 +57,7 @@ Required properties:
>           "core" and "cd". If the controller only has 1 clock, naming is not
>           required.
>           Devices which have more than 1 clock are listed below:
> -         2: R7S72100
> +         2: R7S72100, R7S9210
>
>  Optional properties:
>  - pinctrl-names: should be "default", "state_uhs"
> --
> 2.16.1
>
