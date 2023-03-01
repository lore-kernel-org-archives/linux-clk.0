Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EC2C64EC7
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 00:51:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbjCAAvp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Feb 2023 19:51:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbjCAAvp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Feb 2023 19:51:45 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B012F783;
        Tue, 28 Feb 2023 16:51:43 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id o12so47425519edb.9;
        Tue, 28 Feb 2023 16:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xfiiCeT6CH9N3GnRNK7XSOpj4MNvbXSqN74H0hX4Zqw=;
        b=VcSOZCZF9v+xln7mYQsVhNnq3aFNMCZQt7EyYMsQ6NkzivikabFgQ5nFjZTBam19J1
         UcJeSoHkY8LFxkbaYoUFT1PeAwgrTsF+vbwhgq1n/GpoYqdR4jC3JfVig6IS5qvWyuL4
         vj2e7623vy3kM0y797YHKDYXNDvrc8u2BRSzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfiiCeT6CH9N3GnRNK7XSOpj4MNvbXSqN74H0hX4Zqw=;
        b=yZ4Q1+NeAOcw/ZjK/BtwSxzSclDUJsCvUm6QRzn7pVcs3dp39sl2JQG/h4mJFMn/xw
         bbnPi/j12LH5oJ50SonH85S9wcnnCinYc8HcKHdigAfQs2TnapiFnEv3x21MDM59r7tf
         DEAqh4TvWkQ7bfCeqMdWD9Vw3hoVRuCB7V9H/zthBz/p1WIDys4XfhetcSxkLFN8CVu5
         9cH1qP5C0I/jzyq/2f+0AyTYWyeT1MVR+nZb/ZAe86+SsMC7by6HxQuXNxOMJN0jLSep
         ojCwlkM2t6NzK/AQgm1xfzrLAHMnRSK8GXeUz6mawOOBRRrwJrMKPvfIEDSEHNYkg9jc
         Hk2w==
X-Gm-Message-State: AO0yUKVw4cNuzwUZJ3N2gPoROAEEgOtg8zgxIUb4UhD2sq/njNYEtw7m
        5IiybujSftX3gVs29MFCH8fPDqwfVyA6iZKfD6g=
X-Google-Smtp-Source: AK7set9s5FuktP6ww51vIQDgV4nv05F5vO++W6aPiA8dIhzXb4YekhREHSxdBQV37coSS68KC1v14qpix80wFiu11Bs=
X-Received: by 2002:a17:906:a84f:b0:8bf:e82a:2988 with SMTP id
 dx15-20020a170906a84f00b008bfe82a2988mr2346734ejb.4.1677631901768; Tue, 28
 Feb 2023 16:51:41 -0800 (PST)
MIME-Version: 1.0
References: <20230228091638.206569-1-jk@codeconstruct.com.au> <20230228091638.206569-3-jk@codeconstruct.com.au>
In-Reply-To: <20230228091638.206569-3-jk@codeconstruct.com.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Wed, 1 Mar 2023 00:51:29 +0000
Message-ID: <CACPK8XebiPGe3o7uQgvpOyQ5tzn+o-AyugbJOqUh+4QzG8QgrA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] dt-bindings: clock: ast2600: Add top-level I3C clock
To:     Jeremy Kerr <jk@codeconstruct.com.au>
Cc:     linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 28 Feb 2023 at 09:16, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> The ast2600 hardware has a top-level clock for all i3c controller
> peripherals (then gated to each individual controller), so add a
> top-level i3c clock line to control this.
>
> This is a partial cherry-pick and rework of ed44b8cdfdb and 1a35eb926d7
> from Aspeed's own tree, originally by Dylan Hung
> <dylan_hung@aspeedtech.com>.
>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> ---
> v4:
>  - use contiguous clock index
> v3:
>  - split into separate bindings & clk changes
> v2:
>  - reword commit message
> ---
>  include/dt-bindings/clock/ast2600-clock.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
> index d8b0db2f7a7d..dd1581bfdf58 100644
> --- a/include/dt-bindings/clock/ast2600-clock.h
> +++ b/include/dt-bindings/clock/ast2600-clock.h
> @@ -87,6 +87,7 @@
>  #define ASPEED_CLK_MAC2RCLK            68
>  #define ASPEED_CLK_MAC3RCLK            69
>  #define ASPEED_CLK_MAC4RCLK            70
> +#define ASPEED_CLK_I3C                 71
>
>  /* Only list resets here that are not part of a gate */
>  #define ASPEED_RESET_ADC               55
> --
> 2.39.1
>
