Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A08C4167B
	for <linux-clk@archiver.kernel.org>; Mon, 27 Dec 2021 13:32:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234129AbhL0NcM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Dec 2021 08:32:12 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:39450
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234061AbhL0NcK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Dec 2021 08:32:10 -0500
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 92F143F1F2
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 13:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640611927;
        bh=S+o/cTHgVGk8oN2RoEmSgbuWSZI8JE9I4STOFcdfAwY=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=rnKQw9yltOL7wXqtDN/5sfszoC3BqeQ5vn6aB9E7LLWE3ccy+MOQix1k6npQg0QyB
         ZemS+G9zKCHmJqZ0PouaF0o+uiMz4JwiowG+4WBz0C3RyVo93nexY4gNlt0nAGItpe
         t6mOZYKTqJdA5qKYv6dmGQ47NB/RPB81HEYwZkaxZSwugLgo1SowgQerWDu0acKfVk
         +mNtKV7ceSFQ4s9+epChcw0plzea/aWDmQfS2tObUKhMR4izASVsukaBuhJsDLEB+Y
         RgXwVhlyb5sbIdFU2enC6xJj/G5tIHYRkiGrUslf7joBgutLiSdppc/IoruIeF4i14
         lnkUc47DmFR0Q==
Received: by mail-lj1-f197.google.com with SMTP id k11-20020a05651c0a0b00b0022dc4d55f14so1980779ljq.22
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 05:32:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S+o/cTHgVGk8oN2RoEmSgbuWSZI8JE9I4STOFcdfAwY=;
        b=ShBKz94u8rk03mU/sAxvH0EKS6Ow/CZ8jwBx4SIBilhbaKd23+6omLLfabejYrEz+j
         T1eJEmupOZdCLYaHM5faPl64GmXUG47eqVjglIyiscuT3p3dtSi27GH7EInWxkkGPp0i
         Wf6Zr5hP6dCRjXSoiy1cJJ83cxgYW03VlVjmSi1+F2qBS9Dfc/raqkhW506i+mQdGXat
         fxnaxYNClUJxQwzwFDYoh2fIqcDeZW+VOG5IsQFY1GJIncgE2/towjhwHi3cZkl5M5fj
         gv+89cSNxzPT/Bmcr/6N7RbwxXsh2p9nBIsW6+8TUzlldcl5Dg/fYzxqdhH2tcweqBwW
         TqIg==
X-Gm-Message-State: AOAM530ycjaZNSa8wIAjnwJS9z2wqMss0+wOWmS90Ul+7b4dxz19EEus
        pHi+deivDeNqKzot/jPQT6dSDBDbaiJqEHO/svwaZ8OK2zgK5OCHUwq08S5CxyvDliU6iQ0QKKB
        7W9bdBG18j+dGk1RK25eR8yn+QGzq7xLeKOaE5Q==
X-Received: by 2002:a2e:90cb:: with SMTP id o11mr4607899ljg.158.1640611926167;
        Mon, 27 Dec 2021 05:32:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfR0HHsehFPMnWJ0yUHJl8w0VYLiWVXHnAJyeoCCtKtnHHUQOP+KGCTsRZ/23U6d9NTCKISg==
X-Received: by 2002:a2e:90cb:: with SMTP id o11mr4607878ljg.158.1640611925634;
        Mon, 27 Dec 2021 05:32:05 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id d14sm1433510lfg.18.2021.12.27.05.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 05:32:05 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dinh Nguyen <dinguyen@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-mmc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 03/19] dt-bindings: altera: document Arria 5 based board compatibles
Date:   Mon, 27 Dec 2021 14:31:15 +0100
Message-Id: <20211227133131.134369-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211227133131.134369-1-krzysztof.kozlowski@canonical.com>
References: <20211227133131.134369-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add new compatible for Arria 5 based boards.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 0d62c2bde053..3d7a2f699279 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -16,6 +16,8 @@ properties:
     oneOf:
       - description: Arria 5 boards
         items:
+          - enum:
+              - altr,socfpga-arria5-socdk
           - const: altr,socfpga-arria5
           - const: altr,socfpga
 
-- 
2.32.0

