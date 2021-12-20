Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE17C433FE
	for <linux-clk@archiver.kernel.org>; Mon, 20 Dec 2021 09:37:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbhLTJhZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Dec 2021 04:37:25 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:55390
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229725AbhLTJhZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Dec 2021 04:37:25 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 41795402FB
        for <linux-clk@vger.kernel.org>; Mon, 20 Dec 2021 09:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639993044;
        bh=PPX3YdWz8XBg5nWlMkeTeSMy8Yji1L5ai8yIPtL4/z0=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=Zoo9NAf6Fi7jlZycBJzn+eshGHjNSYQvY5+ZQOb/UQPB3UosXgOWNJQYAL3DgmbQV
         aMaEinaxi98QfaLndcoP3XwYLuJsVs9aR2Nyqdf5qk9Tk/228+ToRdYTxcfyNuiH6a
         Wect5rO2ZktMzIbSHrhn1ICakSNXJrZMVaN3TpDzEV0FKad5ck0Tf1bJvEB5R4yoRW
         9f6K+f21h8jnSs9OSZFwuP45SUIjtNEYwfk+d665Ie0Gc5lUF7qnC1CGsu65ZRAFPI
         Qhu1Q7pNwRcnL/R9t7WioPgl/qC3uKLSahadHrP/oRDy9AsNqgsg9Gn/xobyNAKaVO
         fllwWuNbMfvUA==
Received: by mail-lf1-f69.google.com with SMTP id i16-20020a056512319000b00425efb1c65eso606092lfe.5
        for <linux-clk@vger.kernel.org>; Mon, 20 Dec 2021 01:37:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PPX3YdWz8XBg5nWlMkeTeSMy8Yji1L5ai8yIPtL4/z0=;
        b=nDO0qywn5mwqsnC9xjNxNB42LXGKec6IpLDTNdi97UMidNGLvh4yc5YA2fZQv6ExEd
         cWZc6GZJeWxdUBGcSI+ICEhTtiQGWt9buS+ij1pJAWFNS+dW8qaFSW9OeoLoP086HVQA
         p3hPRfgl+LW6Q5vSUhxIKKfNDel+6t4DsMOwwCQz+FeMNyoeAjCOW1/bSH3d1ccuAj3r
         NpU0xQyvoWuFcVsTkAcaX5O+PuQLh8EnvlQQmyvo9d0bdbRdO8a9RpOgRaL7vKHk9RU2
         sBlpkeJNWGDWCNpW3P9IvOJo8HIxXsl4VKBID6lzM2TKsvuChoGaRdVa1lJ0V2Ar3Rod
         69+Q==
X-Gm-Message-State: AOAM5331dRvI3eqOwNcw51g+GsaliBaFLduxO1mmORMgeDzn9aoNsoc7
        guztHTXTZDThbwf62J4FwEStysqjl919HxkliVfb5rtG/QYKx2xNkqY8kZ5HmsTl6xzl/oM3Jw3
        IC4zRKUltk/aqdewCGTs9xA9WtXMmxztcIsZ8IQ==
X-Received: by 2002:a05:6512:12c6:: with SMTP id p6mr15260002lfg.221.1639993043399;
        Mon, 20 Dec 2021 01:37:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXWObGuH1RsfftCnDZ0YbdrstEcS/ujGb1X7PLGAE+NoR7CrapjYRIfTWYCa3Ag4odsIBlJQ==
X-Received: by 2002:a05:6512:12c6:: with SMTP id p6mr15259989lfg.221.1639993043245;
        Mon, 20 Dec 2021 01:37:23 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id h15sm93443lfu.103.2021.12.20.01.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 01:37:22 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-clk@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        David Virag <virag.david003@gmail.com>,
        Daniel Palmer <daniel@0x0f.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Hao Fang <fanghao11@huawei.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>
Subject: Re: (subset) [PATCH v4 3/7] dt-bindings: Add vendor prefix for WinLink
Date:   Mon, 20 Dec 2021 10:37:18 +0100
Message-Id: <163999303689.14127.4038578698475142044.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211217161549.24836-4-semen.protsenko@linaro.org>
References: <20211217161549.24836-1-semen.protsenko@linaro.org> <20211217161549.24836-4-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 17 Dec 2021 18:15:45 +0200, Sam Protsenko wrote:
> WinLink Co., Ltd is a hardware design and manufacturing company based in
> South Korea. Official web-site: [1].
> 
> [1] http://win-link.net/
> 
> 

Applied, thanks!

[3/7] dt-bindings: Add vendor prefix for WinLink
      commit: 2d6a1c7d57723efcb23a345d0ea5a10d76350390

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
