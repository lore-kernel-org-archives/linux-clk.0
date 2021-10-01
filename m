Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9811DC43217
	for <linux-clk@archiver.kernel.org>; Fri,  1 Oct 2021 09:41:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C31161A8C
	for <linux-clk@archiver.kernel.org>; Fri,  1 Oct 2021 09:41:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353118AbhJAJng (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Oct 2021 05:43:36 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:46586
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353126AbhJAJnc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Oct 2021 05:43:32 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8095D402DB
        for <linux-clk@vger.kernel.org>; Fri,  1 Oct 2021 09:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633081307;
        bh=AbbCj9W6fgvQ0YX3UCQV/nDvOLaUQu6puIQCBSTWMLI=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=GCsjuBOvV8fh2yMPyArirrxsa3EOsPaXaDp5CjIAri1uO0BGKJM1+vpj8aMa7BFWD
         VhCRK0fzoVAr0wK/ZcV7aS9/ZMOuht0xbbRLZzM379yhC2TkxGc9Itgaz05/I5bXgR
         C2/RU6UWCGfdALv/oq8ewtiRY5wKcxIQ/9oIX/izaeatVheAFaJvFHQ/a2CbuCCT6t
         +0gavhZbxNipRE4beFbkUsxMUJ9G/zgmKO/dF3lOs66QTysjSvMxx1o73kgYSHRkZp
         2OHCfcfBMNrENqamsfcMkPJf4Yq8nWx9EwvDPTYIeL8JBkjQ60HLGqgDpkY99xUx8H
         7L7Oow34FFoMw==
Received: by mail-lf1-f71.google.com with SMTP id x29-20020ac259dd000000b003f950c726e1so519901lfn.14
        for <linux-clk@vger.kernel.org>; Fri, 01 Oct 2021 02:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AbbCj9W6fgvQ0YX3UCQV/nDvOLaUQu6puIQCBSTWMLI=;
        b=tyJOFBPwbtPYKDCipx+2gAY3DuR75pj5GW/qYF30km44ohVenAnNOCDskN3DbrJyot
         atlsu78F4cNlJOfLsnVVCmMnW6sUxeLQLQ1hnwbtj0ref17Zif2yIzBVyOFERktbYLVG
         EiL5dwXWxKqcnJlYJK/fYca+BwJHrZ8VSmdbcD2xsS49WRDqw3qzD/8z4YxBqHbINBXs
         JcCGCRQEzpoPjw6r26Ei74y/Lj602cUrx/8EqdgakDoGIyeqWqOjz6TyQys4OAcykNOq
         AdA2xsElc9xqmdlEYkCxE4XKCOWuZtTLEE6ER8BPX08RkS11J2otIIcz619b9cuFcp6q
         CHQA==
X-Gm-Message-State: AOAM530Hqfuxa8qdF2rh+NGdm/cGzQE/umLpRqli1xgZ2h548xWGn6So
        8nse+FP00ztrrS1V2VvkDSM3oY5N7Y+orPvtn/F6PM1aOUhf/umF6fzFTSOZ1bde9Yx7/Ra/FyA
        bVjKbWML+/G+wLIjCGe0KMqcsqA5XIyjMFEY2+w==
X-Received: by 2002:a05:6512:234a:: with SMTP id p10mr4595015lfu.558.1633081306799;
        Fri, 01 Oct 2021 02:41:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyg7W1xzgknYSesTbUGNII7OW6AkXeOJ/Dcs6Zcc8B3ryexy+M7AriWK9TeCvsP8l3FNeeRw==
X-Received: by 2002:a05:6512:234a:: with SMTP id p10mr4594990lfu.558.1633081306628;
        Fri, 01 Oct 2021 02:41:46 -0700 (PDT)
Received: from localhost.localdomain ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id g29sm673784lfj.212.2021.10.01.02.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 02:41:46 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     stable@vger.kernel.org
Subject: [PATCH v2 02/10] regulator: dt-bindings: samsung,s5m8767: correct s5m8767,pmic-buck-default-dvs-idx property
Date:   Fri,  1 Oct 2021 11:40:58 +0200
Message-Id: <20211001094106.52412-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001094106.52412-1-krzysztof.kozlowski@canonical.com>
References: <20211001094106.52412-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The driver was always parsing "s5m8767,pmic-buck-default-dvs-idx", not
"s5m8767,pmic-buck234-default-dvs-idx".

Cc: <stable@vger.kernel.org>
Fixes: 26aec009f6b6 ("regulator: add device tree support for s5m8767")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
index d9cff1614f7a..6cd83d920155 100644
--- a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
+++ b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
@@ -39,7 +39,7 @@ Optional properties of the main device node (the parent!):
 
 Additional properties required if either of the optional properties are used:
 
- - s5m8767,pmic-buck234-default-dvs-idx: Default voltage setting selected from
+ - s5m8767,pmic-buck-default-dvs-idx: Default voltage setting selected from
    the possible 8 options selectable by the dvs gpios. The value of this
    property should be between 0 and 7. If not specified or if out of range, the
    default value of this property is set to 0.
-- 
2.30.2

