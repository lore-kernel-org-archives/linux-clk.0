Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62722C43217
	for <linux-clk@archiver.kernel.org>; Mon, 20 Dec 2021 09:37:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbhLTJh0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Dec 2021 04:37:26 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:55420
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229725AbhLTJh0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Dec 2021 04:37:26 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 46F66406EA
        for <linux-clk@vger.kernel.org>; Mon, 20 Dec 2021 09:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639993045;
        bh=g6qji2pb2cXYir7bn0MZqaQvSo0VOIHA4X4Dl0hqX8Y=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=GJBGnRJxrxfwNXqruE5A7WLXQNugeC4obxwCMGSR6+oR7dy5Fgoqo3/LFk76pofHm
         SSoInQGKvQxwE22zOqOa6UYpEjLstwpNbSmROIGtXdl+qo3zPAtF1e0/1yZ3Whp5G0
         r78hyd+4LDAOuOeUktuL9qFJFp3j3Wv/5bmkTCPMyB9ZWUzhfHd0FTZ5I5xYz3HJos
         HJ9KnGb1Mv+ulHLKK3hYHmm+gDYgl79Mkx4C1e6P8T6wKvFyJc6P0/D/jky83TO4Yv
         BoO2CBjoqatCuBqEzupXGhOcHcIjorsSdlLAaRNYIglYddtnZ5TUQXD5evlyeZB7iF
         Q0RVedezuSnpQ==
Received: by mail-lf1-f70.google.com with SMTP id r21-20020ac25f95000000b004259e6ab262so2354238lfe.6
        for <linux-clk@vger.kernel.org>; Mon, 20 Dec 2021 01:37:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g6qji2pb2cXYir7bn0MZqaQvSo0VOIHA4X4Dl0hqX8Y=;
        b=8RncZ+HPoZuyFp5wmeNfuhknFdDLXF28H1kToDuukGZT/5O5y5NbtLpaqYV0KU+p2L
         qvBkAkJRd9qjtFNlIXxss37LAU9Hn5Q47vXaUk4bv3MYMt44kwr3+yBLO2bIWPAsVARK
         pbb2yi1NM2u3UUZGCbr/07RLKiz/UxXropS4HnXAvXhqOqpL3CfI2Hho8EVJnpXTI3E9
         pda5kuRsZV850BtEeFTOkYjdCZOmUIh7Pw2eg7UuW2n0A56D6c4mka++Tlk1YZSrK/37
         d0W1CsNb5JZqNMYOjdX6pt3+agjC2OwhbBBPxVX1nwZVUCgXqJwyv+twQdNxQc4JrAX/
         TRyQ==
X-Gm-Message-State: AOAM5319QKDg/fvPlp1de3j03qt2vQ7YKkLo+6OGSU2SDKX1clvC3wQ/
        KZq1ViqN75BvarBRqgpFQ1wNfxtQZp3fFzIm8nVtyvsXBRKzcwYh90Wjho8WBFGnFy5yCmAFb9P
        Pg4BxNyR2UT+P3wN2OPIwGZZ652G4S7WJx91cAA==
X-Received: by 2002:a05:651c:1031:: with SMTP id w17mr13802003ljm.112.1639993044795;
        Mon, 20 Dec 2021 01:37:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcb4zCkuksbBh2a+v2wndWfr4lS0Fi1HqUBer1cJ9x95qXKkE6G8NaCPHqp0YjKf8Gv1eP+w==
X-Received: by 2002:a05:651c:1031:: with SMTP id w17mr13801996ljm.112.1639993044655;
        Mon, 20 Dec 2021 01:37:24 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id h15sm93443lfu.103.2021.12.20.01.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 01:37:24 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-clk@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        David Virag <virag.david003@gmail.com>,
        linux-kernel@vger.kernel.org,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Daniel Palmer <daniel@0x0f.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Hao Fang <fanghao11@huawei.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>
Subject: Re: (subset) [PATCH v4 4/7] dt-bindings: arm: samsung: Document E850-96 board binding
Date:   Mon, 20 Dec 2021 10:37:19 +0100
Message-Id: <163999303689.14127.12844004374381607436.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211217161549.24836-5-semen.protsenko@linaro.org>
References: <20211217161549.24836-1-semen.protsenko@linaro.org> <20211217161549.24836-5-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 17 Dec 2021 18:15:46 +0200, Sam Protsenko wrote:
> Add binding for the WinLink E850-96 board, which is based on Samsung
> Exynos850 SoC.
> 
> 

Applied, thanks!

[4/7] dt-bindings: arm: samsung: Document E850-96 board binding
      commit: e1ba2f940ba4c4c3b4d0a520301a920591c421f9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
