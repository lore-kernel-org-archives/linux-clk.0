Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A14ADC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 15 Dec 2021 16:09:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238150AbhLOQJe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Dec 2021 11:09:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244238AbhLOQJP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 11:09:15 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A59FC061759
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 08:09:13 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id d198-20020a1c1dcf000000b0034569cdd2a2so1365503wmd.5
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 08:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u4zZ+z1pGP+Htk3E+7BpOhHUxDFBFodnyOqMJFTyq+8=;
        b=oYZR9hF/CodulLOtmAdszrJJnJs/Ny9cc6G7wkr6zvqlQgG3/n8IDv0ZAhHEwF2pYn
         k2YUqoxHDs2QsdWTBgG9BTgI5B7XYcaO7qX3xbY4Ue+E5ERkAoJdhA5UKGyGAFXAm5j3
         viYtFHYPw7sJmwt2iGdabMirVEItKAybcnfwOFXDwZo9kv/pRJ3eVk7RUT0BbQE5Cp5a
         Jhm/5wd3U0jRAVtDHfyblnc7ET6dtJpiphJxApUGm0LmDGJ65YjKx+YIawE70E3cxqxd
         Ou8FtpLxlNXUsHDplUriMcmOtYHB7J+rnH80g2SJbelkI8niO8RQ6F4R/dndd3keTgzs
         A4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u4zZ+z1pGP+Htk3E+7BpOhHUxDFBFodnyOqMJFTyq+8=;
        b=XTXJmgCttY2tl0+K86VLO9Jm7KxM6j9gPj3OMSKmq2ghUCSUwNqJqsn5wcf5jZaQU/
         yc9iR0aY7KOx2vXY2NXuq6LRLEAEbgG9fOhfC+uOH6KppSpYoeMMM/P5ek3DFWsd36ga
         tEUpmUFcVdSZjqdF0JaSkJebI/sK198MbTThkyUnlEWP+FvzPiy8eBcs0zhw8DLmtge5
         /8x4IA1HF/xOz+gmwJDF2agl7HGSKsS0is6M/vSv770Q9Qj9HGtkmzv/oUPTzUqjOSXG
         gNJLDJ7uIPImP55IIJuC7hg50ozfTH59Q/ce5oM7q6MxmV6Z3z6WmRnYQA2HjzeGg3YI
         Rz+w==
X-Gm-Message-State: AOAM532RENzJt3ROxqrwE4SvX8AjL72QHvUhCbe2i2XG9tLIARtdfMtt
        mpalJm17fcSNaUaoIkAR++bOxQ==
X-Google-Smtp-Source: ABdhPJzGSJCvZ0o2lhXsioS+2QTFi++7SI1Tfu2g1ePTsn+jn9X2ZXiEPV5u98fsYf4jsKpaPwqz2g==
X-Received: by 2002:a7b:cb55:: with SMTP id v21mr504663wmj.45.1639584552115;
        Wed, 15 Dec 2021 08:09:12 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id 10sm3034006wrb.75.2021.12.15.08.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 08:09:11 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 3/7] dt-bindings: Add vendor prefix for WinLink
Date:   Wed, 15 Dec 2021 18:09:02 +0200
Message-Id: <20211215160906.17451-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211215160906.17451-1-semen.protsenko@linaro.org>
References: <20211215160906.17451-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

WinLink Co., Ltd is a hardware design and manufacturing company based in
South Korea. Official web-site: [1].

[1] http://win-link.net/

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 932c5ded6c00..83f6b484997c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1326,6 +1326,8 @@ patternProperties:
     description: Wiligear, Ltd.
   "^winbond,.*":
     description: Winbond Electronics corp.
+  "^winlink,.*":
+    description: WinLink Co., Ltd
   "^winstar,.*":
     description: Winstar Display Corp.
   "^wits,.*":
-- 
2.30.2

