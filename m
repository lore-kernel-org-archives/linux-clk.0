Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A73CC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 15 Dec 2021 16:22:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234880AbhLOQWI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Dec 2021 11:22:08 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:55208
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244736AbhLOQVz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 11:21:55 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id ECE9840D47
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 16:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639585314;
        bh=UQpra13r/imnuYK+P2IbZ5XGTwYfQ/5zZ4iMI2bSBTk=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=GzvKAZkxxlYT7X3R+dnU2AfMFq4aLyoUrAhWiZuPlL8LbER8dJ1ovWIpXAspMWd8o
         UZJGf3ZiHuC5FIf5gDhPzkHhlHZBjSjWxyQBMzPYSVvwzkgbLiOg8Ap5PlfM3PWyXB
         k2xgcFSajHtDtD3WVaEX2md89HCTUnYj5jLq1da7jXkLlyYek1VYouq5IOdFPGv2K6
         Fof3EE9rZ3g2rjAb96R1dyniMoMPmHiphZGoIow8Q2jeXOdPEKxvbNG10yzmy9jLK1
         jgpkUgtU3xEpTxjhH0QhM0OAZzasyQryEwnWVCDXJorvLQCNTOE/0AL85E5if6AByC
         Eibke0aUZnPrQ==
Received: by mail-lf1-f70.google.com with SMTP id h40-20020a0565123ca800b00402514d959fso9840329lfv.7
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 08:21:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UQpra13r/imnuYK+P2IbZ5XGTwYfQ/5zZ4iMI2bSBTk=;
        b=4BObFefdkmUsxIbH+lf3HEbBxREXc9L1VEHcVjrscluJPhY0ytxUAtlcmKmk3iCkfa
         wMbiVNmp4anG6TWGXpxJSOqenyNsDPD7FChJBuI8LUfQM08AkHkAPLwKyIk/S60S3/9p
         tnV/uZyaE6Kv+JArYLLT5tRvClpycz5Bl44BxgM7k3E/Py4zYn0I0oMMoYzARMTM2cIK
         VkCZIpqNSZ66sZZzo8aVtVWOu1npXDoh7qy2vxMHHzj0fsgdpNQw3UQiUimGmFbIpqam
         Tv7Rr0AZ//WPbDZot5e6VsxxS1vlKipsrGeDpgwvEI1Zms3iIl8wDxx0DJXSCCMuZD3z
         l6eg==
X-Gm-Message-State: AOAM531PnpI8UzGQWPo/28vXsMbBJnZKeGKrjqqWQ3MnMPty4rZh9xeH
        8P9yeTNYEL89ozyb0Ynw2nkPROMJbDDfBAtwCmQdBVSEwOio7FeAWVe1wkvFtQFlU6OkXK1t6L6
        t1O1+fjDJwMXgZmcdbWuK5p+fVSKiw+TWcekNhQ==
X-Received: by 2002:a19:d61a:: with SMTP id n26mr10578624lfg.313.1639585313507;
        Wed, 15 Dec 2021 08:21:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxRxyxjrUFbKudwdQ61hGbDEEI0JDnv9cU9sfFXGEl6TAeZSdjkJkyUrkdyqRBNhl+99x1pw==
X-Received: by 2002:a19:d61a:: with SMTP id n26mr10578610lfg.313.1639585313346;
        Wed, 15 Dec 2021 08:21:53 -0800 (PST)
Received: from localhost.localdomain (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id l4sm507392ljg.60.2021.12.15.08.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 08:21:52 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     David Virag <virag.david003@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-samsung-soc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 3/7] dt-bindings: arm: samsung: document jackpotlte board binding
Date:   Wed, 15 Dec 2021 17:21:16 +0100
Message-Id: <163958527260.183299.17749602272220762675.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206153124.427102-4-virag.david003@gmail.com>
References: <20211206153124.427102-1-virag.david003@gmail.com> <20211206153124.427102-4-virag.david003@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 6 Dec 2021 16:31:17 +0100, David Virag wrote:
> Add binding for the jackpotlte board (Samsung Galaxy A8 (2018)).
> 
> 

Applied, thanks!

[3/7] dt-bindings: arm: samsung: document jackpotlte board binding
      commit: c96ebc5fde274edcc02543dcfb6a1ee097f98070

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
