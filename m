Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4051C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 20 Sep 2021 14:50:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8D80610A0
	for <linux-clk@archiver.kernel.org>; Mon, 20 Sep 2021 14:50:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240521AbhITOvg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Sep 2021 10:51:36 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:38858
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240799AbhITOv2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Sep 2021 10:51:28 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 802DF40292
        for <linux-clk@vger.kernel.org>; Mon, 20 Sep 2021 14:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632149400;
        bh=liJ7TqCiRENzp4AeNTdqrwOrt003yN4WGkD8VAmir74=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=VtXGmrVSPU0gNXtuBRXm3WnzkGyN8XsPDN+2QgO1iqUY73aviaO6Oxb7SUjIJFkB2
         CIwvRUNvlwWszVg6GcCaeHAXxfcJD6Plf+NX3qtdf+91LrQ88WKzGf/jKgfrN5+hBJ
         7mcyc6Nzmn8v4DHLlljOoim6EDAcMk7hGX39dSqFmcppXsEcl87LdcGl/Aor0jQyMC
         laXc8M9Z94jLVOcSDvZ/ic34U44SnRsJFsoN513sDEkAIXOh3CQo4QUZi5ZbbTtmDk
         uyWdC9QL2frMFqqFpPY2cv3wvTNTg9S/iAxNbXPRf1bK3C51AAv++mqBbLoNGjYts+
         TYqH4JsOhGOMg==
Received: by mail-wr1-f72.google.com with SMTP id c15-20020a5d4ccf000000b0015dff622f39so6296471wrt.21
        for <linux-clk@vger.kernel.org>; Mon, 20 Sep 2021 07:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=liJ7TqCiRENzp4AeNTdqrwOrt003yN4WGkD8VAmir74=;
        b=uf3vTPl6zsM2WPk9oSckXnhfxPgSfufVx1QzTox8KgcocPJH1mrsxpvbmtGH+ksYP3
         wAZ6HwKfnMieUKPbC5wAlbX2zIxAuPURKkODwXWAkEvXOuGwpniiUlunwAADW4QF8ffe
         +2N00VQxS6Qgd7/dOpcwu8+oPbwIm6Sc6iKQM1Fr8YF/XNIzSzenh2Q/RxUiAe3cz60A
         g/RQXgD+aOUpcDKqqaJLFYpQ3tbSpNcf3AYcH7a3oThngoHWzyfOwYEOdsM8ta3nmrrx
         E48pqdeEjsddNzigSpv9a99lKM7h5Ok/GO15UpcaJhnRlMcfTpbwtAT6aiN7A7x/sbPX
         Mnjw==
X-Gm-Message-State: AOAM531xHsuL0kuzx2zn1l7TZdU9JWJk/xQq2EtJAxaMmz4zeoiz8yxz
        bD9js1W3JcjGpeGPmpCTMMPkPzpnaeDGQRnDjUESpQbHMJyX2L4rdLtobnw4ZmANJGolnpMd1fu
        T4fQWw1DUM1b2Kg2DTENBwbWm4SVAz+g2H6nnHg==
X-Received: by 2002:a05:6000:c3:: with SMTP id q3mr28794220wrx.361.1632149399914;
        Mon, 20 Sep 2021 07:49:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuV1/6C76PaS4ktI3Po8CjUMuAt+4cyKsUSOnJVyV0IOE5VYTpW96BNfhMsoz/jqg1evXxzg==
X-Received: by 2002:a05:6000:c3:: with SMTP id q3mr28794197wrx.361.1632149399765;
        Mon, 20 Sep 2021 07:49:59 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id g131sm14752780wme.22.2021.09.20.07.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 07:49:59 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Zong Li <zong.li@sifive.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: fu740-prci: add reset-cells
Date:   Mon, 20 Sep 2021 16:49:44 +0200
Message-Id: <20210920144944.162431-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SiFive FU740 Power Reset Clock Interrupt Controller is a reset line
provider so add respective reset-cells property to fix:

  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dt.yaml: clock-controller@10000000:
    '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/clock/sifive/fu740-prci.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/sifive/fu740-prci.yaml b/Documentation/devicetree/bindings/clock/sifive/fu740-prci.yaml
index e17143cac316..252085a0cf65 100644
--- a/Documentation/devicetree/bindings/clock/sifive/fu740-prci.yaml
+++ b/Documentation/devicetree/bindings/clock/sifive/fu740-prci.yaml
@@ -42,6 +42,9 @@ properties:
   "#clock-cells":
     const: 1
 
+  "#reset-cells":
+    const: 1
+
 required:
   - compatible
   - reg
@@ -57,4 +60,5 @@ examples:
       reg = <0x10000000 0x1000>;
       clocks = <&hfclk>, <&rtcclk>;
       #clock-cells = <1>;
+      #reset-cells = <1>;
     };
-- 
2.30.2

