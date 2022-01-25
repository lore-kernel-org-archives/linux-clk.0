Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A58CEC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 17:15:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1455905AbiAYRPs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jan 2022 12:15:48 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:55152
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244497AbiAYRNe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jan 2022 12:13:34 -0500
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F3DF43F20A
        for <linux-clk@vger.kernel.org>; Tue, 25 Jan 2022 17:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643130713;
        bh=g7yYrXHImPhCQwOj0UskOn25n3xq1OGmRzWasb1bHQQ=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=v58fsI5ZjRXi8vtti/QlBrn+BOsq6CYW2107452tJfEbmRYd/yeIC4lINq4Gpk7xV
         zLByh1QZLgsg55tDec9WEl42LNlGeG5a69Sy+dMtaKq7v1nCunln1mbB1PqCmw6qBG
         oHskFQWoWurXCpP0ssQCkzfod6Oad9uX3uwo8Z7Xy1AD4VNd2FiNWrr2epthotjm2O
         WRR+OVU6rLvhDOeBwHyrNMn1EzG0PLFvegzJOKol3frUPG+bJJyYwim1DcrN0fQFmG
         zmePwj03jL6YGk+V7a/kl00wF8F6F4C/kBknk1f9Z7byUmgb0nlagLzk/V8XOuYAv+
         495H4f76fpd4A==
Received: by mail-wr1-f69.google.com with SMTP id c10-20020adfa30a000000b001d79c73b64bso3349176wrb.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Jan 2022 09:11:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g7yYrXHImPhCQwOj0UskOn25n3xq1OGmRzWasb1bHQQ=;
        b=QW07L3khgU4QULjPK/ihAZqxz9J2f8riC6dMBpV0FIqOPhkUmv7um3ycsviNklwWDh
         6qMfEis0fd13LIx1xICAcyxuEEpN9b3YrTcoyYheWgDA3uycGuSRMwmiYGaBYCM6iOKG
         5ld1sC2tAW4CuWu8YUY4OfzfamzAvt69UQ5JW+5YkJknGNBWzFu8IvimCwIjePAi6RFJ
         3cdQ9dM3Ow2eQuuFLAQJUt5lTz6J8x13+S8SmNwggAaTlt+dV2dD22WN+ArO4VBdob/1
         HFxpHU65jVpU4N1DYZKDOqTGSxfZ8ZiVS3QO76K5TqjbO/Dv8CXLGoEwreRYNMNYQIR+
         I15w==
X-Gm-Message-State: AOAM532AEUcjDfPbKHE1n+bD9ZPSh8SswA+bLkULgFloaFrwOOPYe83J
        kAJMrrS6OodarB+J0umjeEASDUmr0iQ61caZ8mT+31vL6Tryj6JF3ezviCDEwZUr+tRIRPYw8AK
        Jsp9fAoxXeB6tcLt9AxxTJcRORvY053zo4lFGFA==
X-Received: by 2002:adf:e592:: with SMTP id l18mr18490671wrm.217.1643130712410;
        Tue, 25 Jan 2022 09:11:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmNgL2L2/wufXJkt0M/aVg1sqAVlqZZAkIIrefWSMS+S6RErnsKS/CAuAI5H838RBZZxTQ1g==
X-Received: by 2002:adf:e592:: with SMTP id l18mr18490639wrm.217.1643130712199;
        Tue, 25 Jan 2022 09:11:52 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id f8sm1185826wmg.44.2022.01.25.09.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 09:11:51 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-arm-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-fsd@tesla.com,
        linus.walleij@linaro.org, olof@lixom.net, soc@kernel.org,
        sboyd@kernel.org, linux-clk@vger.kernel.org, arnd@arndb.de,
        linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, pankaj.dubey@samsung.com,
        s.nawrocki@samsung.com
Subject: Re: (subset) [PATCH v5 13/16] dt-bindings: arm: add Tesla FSD ARM SoC
Date:   Tue, 25 Jan 2022 18:11:04 +0100
Message-Id: <164313065136.81319.902005401446620690.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124141644.71052-14-alim.akhtar@samsung.com>
References: <20220124141644.71052-1-alim.akhtar@samsung.com> <CGME20220124142951epcas5p255712c3a9e37b9542687587d8114bda3@epcas5p2.samsung.com> <20220124141644.71052-14-alim.akhtar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 24 Jan 2022 19:46:41 +0530, Alim Akhtar wrote:
> Add device tree bindings for the Tesla FSD ARM SoC.
> 
> 

Applied, thanks!

[13/16] dt-bindings: arm: add Tesla FSD ARM SoC
        commit: d25c5eb511df3439cd91517bcbce4b274f8972b9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
