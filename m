Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA4BC678D4
	for <linux-clk@archiver.kernel.org>; Thu,  2 Mar 2023 03:28:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbjCBD2K (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Mar 2023 22:28:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjCBD2J (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 22:28:09 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E3B53AA1;
        Wed,  1 Mar 2023 19:28:08 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id o12so62250279edb.9;
        Wed, 01 Mar 2023 19:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LwhRS8qLgHTKH8umgxJ2vm9VG3sN3u1iw/JreXfnhyU=;
        b=c3FUBFlIBHw60SVBvbHj7XbSLr+jVIOBLS/1Bn1CIxgwx7idkAzuDlReE7GgtQPLmX
         /SYNC6e+oBZfSYvg0POjv0mRTW/nD1x4FnuRs9m8xPo8hpkH7suqOSoDA3rB/YyGqZG5
         LsZOKG/nrkj8WQidhwk4C3VL5K6nRGQWfRMjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LwhRS8qLgHTKH8umgxJ2vm9VG3sN3u1iw/JreXfnhyU=;
        b=a5e/ESdir9FaF+DdVb1ewMnmaCnX0HA/h6csLQOwSqYyE8aqkq64W1h0l8wORnd3xU
         WdHAMNQ4YR+4QZT8ht0IT6mtZULcvalS3TG3OCYakg4iw55Wdf8HLoRJp0FwTk3RYl61
         Vh3DUWf4D4iU7S2TwdCx8xneS8FVlvxgwu5zDeN5GPqB076do/6js0AxEQVGJjCouNZ4
         hS9qxnj+aQf6Pg22cRw0Ab6Zji/5v0C/2qNtyeYDiJmeIuGJZomauvN67S7BBWhIq4xw
         tM5EIaWjB9D5d/ElLHZ2RtqAME4Fm3ZzuzJClIzwW+GSLRJH2BxeUChNKdNDsy35PCSo
         adwg==
X-Gm-Message-State: AO0yUKVduqXLH+D77sFaXHy/TTN2xfjRBNo1Rx4Hd2jB+3Bhn/hIJHPX
        pTUr6STn1O+uNwpDCSDFNWawB2UPMBvMwMmxFGI=
X-Google-Smtp-Source: AK7set9/B/vXKjq8akQcPEEGlVG90GcECtmmW7Git9heHEsK5qxYH2yUDSkj3xFYfLgio2WKGG7hBz19vXdJ6r4+eik=
X-Received: by 2002:a50:d743:0:b0:4af:515d:5691 with SMTP id
 i3-20020a50d743000000b004af515d5691mr5115879edj.7.1677727686782; Wed, 01 Mar
 2023 19:28:06 -0800 (PST)
MIME-Version: 1.0
References: <20230302005834.13171-1-jk@codeconstruct.com.au> <20230302005834.13171-7-jk@codeconstruct.com.au>
In-Reply-To: <20230302005834.13171-7-jk@codeconstruct.com.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 2 Mar 2023 03:27:44 +0000
Message-ID: <CACPK8Xcd5XyLc3aO2nUXWFMAZnEdooBE=z_qj6H6d+vfOrnSug@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] dt-bindings: clock: ast2600: Expand comment on
 reset definitions
To:     Jeremy Kerr <jk@codeconstruct.com.au>
Cc:     devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-clk@vger.kernel.org,
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

On Thu, 2 Mar 2023 at 00:58, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> The current "not part of a gate" is a little ambiguous. Expand this a
> little to clarify the reference to the paired clock + reset control.

This confuses me, but if you think it helps then that's good.

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> ---
>  include/dt-bindings/clock/ast2600-clock.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
> index b4d69103d722..e149eee61588 100644
> --- a/include/dt-bindings/clock/ast2600-clock.h
> +++ b/include/dt-bindings/clock/ast2600-clock.h
> @@ -87,7 +87,7 @@
>  #define ASPEED_CLK_MAC4RCLK            70
>  #define ASPEED_CLK_I3C                 71
>
> -/* Only list resets here that are not part of a gate */
> +/* Only list resets here that are not part of a clock gate + reset pair */
>  #define ASPEED_RESET_ADC               55
>  #define ASPEED_RESET_JTAG_MASTER2      54
>  #define ASPEED_RESET_I3C_DMA           39
> --
> 2.39.1
>
