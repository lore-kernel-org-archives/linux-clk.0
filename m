Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64532C7EE2E
	for <linux-clk@archiver.kernel.org>; Tue, 30 May 2023 07:39:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbjE3HjE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 May 2023 03:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbjE3Hic (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 May 2023 03:38:32 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B6B510C
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 00:38:23 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f603ff9c02so27644885e9.2
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 00:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685432301; x=1688024301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8Wj+HDjZSnhs7OQTpUP21VKK/kmLLc0wW1eKOrWb7M=;
        b=suZawle7XyCtmTwc9koewCMnKkWPXacwHsZLDFLFYQc3h8tUK/ExADY4dPmZuPA2hP
         /2Otqa3QJVnMcWdz/ZIrVBE1/wHd1C0FynszMshKwVb1eP9jz9/Xb3PFlTps1pz6OegW
         bWZiQVQtr4ErEeffk3KKdTOHQ7e+94+iSX2WzbaDAfQ5VVBgJDbfVmTLapSwfYTppFhv
         oAfHRp68hwGYopDlGIkVcrZtNJJ+XlO/U1dRpOms/isnM0jfs0bVrwFRA7RfGWK6FxXb
         452cNwWfHaqWUuoApq2gUPLFUKPJgmmbeOUh8DKRQn+XyYPKAY4xT/Lpw+Q2vBggAQj7
         KfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685432301; x=1688024301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L8Wj+HDjZSnhs7OQTpUP21VKK/kmLLc0wW1eKOrWb7M=;
        b=jZ1BABjkZ5+mElgoB88CI9CtnVLXEWTKoCGWYurjVwBlZGZcd2tctzaLmFEeualwb2
         bAEOpsUg0r47on8dsN8X/9oFzg+fBrfwolFyy/5LnGFPJhZcDr7i43BzXqGzbF3XAldb
         EjQwenxsNuVcfyzWDl+tAz6UGuL9jvat+52LfQM7toJsuhCwvOs2FyQdBylkH1WxyQPL
         c2yIjND4O/2RswzNoect2mPmy6jGgfcVVJZYEZJERI+ScGP41Mu/DuqSWu2KKElJZJ0B
         dNQ64GU+ywEzSltSFSOzRPIRsGuazOOu2UN4aymRp0frsuAKiTfNmpyH6QR3eKEO52BK
         ythg==
X-Gm-Message-State: AC+VfDzILIQYqacXLLxhzNypIdfzNqmdjCKJCrQFHv8zb56Gms4xN7AV
        9716JboA7/0zO23F/5Rzdl2FaA==
X-Google-Smtp-Source: ACHHUZ4MbWC2LdJcXlvseLKtinFpCmjk45kQkUC4gyJQ6tXM3sCovJx5aDRdYpZlfNDPK2Ol6Xs8Wg==
X-Received: by 2002:a5d:4003:0:b0:30a:f02a:b84d with SMTP id n3-20020a5d4003000000b0030af02ab84dmr898742wrp.13.1685432301659;
        Tue, 30 May 2023 00:38:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m4-20020a5d4a04000000b003079c402762sm2312013wrq.19.2023.05.30.00.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 00:38:21 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 30 May 2023 09:38:08 +0200
Subject: [PATCH v5 07/17] dt-bindings: display: meson-vpu: add third DPI
 output port
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-7-56eb7a4d5b8e@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     "Lukas F. Hartmann" <lukas@mntre.com>,
        Nicolas Belin <nbelin@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-phy@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ngaRaj/ff6scDRZWhYNPrhhh/3jRLEZndlPLfgP8m5M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkdafgrQ+d6kVlnqgthYceWHgXDRj4X3G8yCwWhqxC
 zPMd+56JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHWn4AAKCRB33NvayMhJ0eT3EA
 CaIP+cIiapaagNPLfNF2mzXan492id42Vf+UOmKe5aW23Bk7xsIVga2C3eORTyR87dGU0msoFj0M0o
 PspPAeNAg7DXsMG3N0tpN3pQU9joVnYJobwujt7fMlBo9h2LqkjTlvD1BrWSnOtkn92Amoj9lROpbd
 296eS7FzQBOybBtYOICBCbI5Me8Epuh84+WZy9pqHaj44YiDeH9U4UsdteRPYutqED/1oGKZ0z6Eet
 Y6VNtS14EwxYbcB/hIoF07ReQFwqaSkuJOZFVVCVmABEfKsP7Civ8Kr5jWI70sI6eq9Uqn+aOEqUDT
 z2nnSHtmrzR6pIp1cWb9YbDB6YXQ1HUTx/PyXxp+M4Lj9Gw3laPdn0qRQ785bQSUSqFZgTXge26B0q
 xZVu4MnknfHXLTdZ1v2tPtErmaTrvGa9G0vadKqvqHbD0oqrSGHIlsg6zkw3c0GC8lzaFKdO6ZQ68D
 fm3GGGGjDrUvhgOdaMo4clJxq0mhDdRadCdwdWAJm1KikDaVwKShkRU87r5uu/kXur/uyQD/B5JLtU
 JGE2aZD4cvNjIywneK6eobQpnxStvcZs6mI3WOUwjNtYFqXnNKefvE9oP4lxjqMak0Mux0gf8vXtRL
 xJgFplqz2XADbImv2izEtL/ZAHgG1BZhNGjXQCZT1aImRaz9rH3OUOnzwSrg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add third port corresponding to the ENCL DPI encoder used to connect
to DSI or LVDS transceivers.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
index 0c72120acc4f..cb0a90f02321 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
@@ -96,6 +96,11 @@ properties:
     description:
       A port node pointing to the HDMI-TX port node.
 
+  port@2:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node pointing to the DPI port node (e.g. DSI or LVDS transceiver).
+
   "#address-cells":
     const: 1
 

-- 
2.34.1

