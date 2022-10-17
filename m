Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39613C4332F
	for <linux-clk@archiver.kernel.org>; Mon, 17 Oct 2022 09:47:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbiJQJrm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Oct 2022 05:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231552AbiJQJrY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Oct 2022 05:47:24 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC5CF50716
        for <linux-clk@vger.kernel.org>; Mon, 17 Oct 2022 02:47:00 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id by36so13275387ljb.4
        for <linux-clk@vger.kernel.org>; Mon, 17 Oct 2022 02:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m28MxXGYXT4qGN7nik464yL/UhJ82SzVaHoLGkQoTpw=;
        b=pSF9QYPlsSgNQPRR9XdOhQ9tHnI5i7mpZjMTTlvUq8/jBVi240La3CiktdZ9cpYnbg
         3gzgPCO57wDjxjV7KwmmBFQaXqWqjRqzXTrCgvh8wcmDIVE8Auov0FvGOGYsRXNhpQuR
         v0uxqa/yDBhbsp7XhTBM5WkFr41VnSeB1B2KgRUcNxVTYYngf4c2n+TJnNslKA3qbycQ
         3Mg/Pn05b14TDYhsHc6vl/ddFRe80qxr2PLv4DhzicBjcB9Y4NURWiXK++bV44Pf+VSK
         HuYAflUusNFJlXHC9YSfpGVok3c6YUgICIPANvYBQ/qXi+g9MokQq0B+0qEWWxPhKkC5
         GQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m28MxXGYXT4qGN7nik464yL/UhJ82SzVaHoLGkQoTpw=;
        b=eml1wl2PQNw0Y07XN84dopanlcC/7WvsWodx6TKEdq4Ix4zpYyWk63DyQdriuy7HF0
         6jFl2qLeNhiLHweQKMcAQpDESL1Hbc4MAWXAVCKjY8NoPBDOUKANKF3Ua6z20SuOdAGf
         yl9dNEJrpbWwuoitMq4Y8hevKdhyTH7PPel3kfwyj24EvoDAnjYhIhGyVhXxQqA+YJn8
         bKge080u5eEv6cekE6U0uS9uB/f7Shz8Tc5OgFBKyzw9Z7dFG9QXg5Zbldq+nvWXxCoU
         OYL3YR/sIYsar21RhoglbTzCwdCnHAyCog2HGQbv1RLLVh3eW1LJGl9DwWiwFKdqDTfd
         1roA==
X-Gm-Message-State: ACrzQf0DpHTHqgj28XoKQ7VBLHkWC1sGgNkXM0wVwvpe0AVM467KAOOQ
        Sc/XmkwnYXqayhzQCU9F/pY/4bISqXBKZQsvU3QIgZB+mPQ=
X-Google-Smtp-Source: AMsMyM4CGBR28SSkgO6sUfPaGHahhe5lagnYKp+a4Qpc5atANtQAtfZFWQQpanlTqBVMnG93twfz3+YjvG8BYu9pwjI=
X-Received: by 2002:a17:906:5d04:b0:77f:ca9f:33d1 with SMTP id
 g4-20020a1709065d0400b0077fca9f33d1mr8038485ejt.526.1666000007686; Mon, 17
 Oct 2022 02:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221009181338.2896660-1-lis8215@gmail.com> <20221009181338.2896660-6-lis8215@gmail.com>
In-Reply-To: <20221009181338.2896660-6-lis8215@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 Oct 2022 11:46:36 +0200
Message-ID: <CACRpkdZL9qWPaoRhCt3h8m1it9DaoS3TJrxPHVOzGZWhL45PNw@mail.gmail.com>
Subject: Re: [PATCH 5/8] pinctrl: ingenic: JZ4755 minor bug fixes
To:     Siarhei Volkau <lis8215@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiri Slaby <jirislaby@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Oct 9, 2022 at 8:14 PM Siarhei Volkau <lis8215@gmail.com> wrote:

> Fixes UART1 function bits and mmc groups typo.
>
> For pins 0x97,0x99 function 0 is designated to PWM3/PWM5
> respectively, function is 1 designated to the UART1.
>
> Tested-by: Siarhei Volkau <lis8215@gmail.com>
> Signed-off-by: Siarhei Volkau <lis8215@gmail.com>

This patch applied for fixes.

Yours,
Linus Walleij
