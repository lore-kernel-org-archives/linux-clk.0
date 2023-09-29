Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D22E743EC
	for <linux-clk@archiver.kernel.org>; Fri, 29 Sep 2023 05:42:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232963AbjI2FmZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Sep 2023 01:42:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232915AbjI2Flq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Sep 2023 01:41:46 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2049FCDC
        for <linux-clk@vger.kernel.org>; Thu, 28 Sep 2023 22:40:07 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so600376a12.1
        for <linux-clk@vger.kernel.org>; Thu, 28 Sep 2023 22:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1695966005; x=1696570805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xXiyKyVdmulgskvngsG0f4x+X8ooUvk8Z7/M7XiExk=;
        b=Eh0BMORPMv6+dxmW4W4x7kbsmtI5Ug63fZ4Uc3ntgapa0nXoKp/FXcTWvgVJa8x2mM
         oG4hEdVXqoLSrrarBROBQUjwV9653V94/sw3Z6hJL5WZlA/ApJD0UhEqq0aPxa9Zyl5a
         Bopyn2jocnZuBMBSF68+noJPp8FTgkLxEJF72mPpDBlPJpWLH0bLoZaYoD7+5FOSt0sf
         vBqOY2f/DYhrtC9OELIehG4hUyJLfW38X0iMhoVMO61rgkm4093XZ3aUymiUQjvs9b5r
         1uo9y2MZLD2jF1mMaP/rJoyuckHjyM2p3NUoc6dvZqds7W4/4JB+I3v0YxEyRkqCiS8t
         WK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695966005; x=1696570805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xXiyKyVdmulgskvngsG0f4x+X8ooUvk8Z7/M7XiExk=;
        b=Co7Wzidwf3oBGwCdXa5TYONGcortMY6H3CeFvKXmjERbCF023hWOk3vfZx+gEv5xt1
         QK5ZXGYFUmMxSBPE3rCWhAFa416kF0hnp23vbUYCf9ZON5dT/iadhYuBF3rYwUbszLwn
         E4ED4AgW7TrMKWCQmMDnmO4phWcNgHvsoNC9c3W1g5KwzbibrlEezhQBxSs7tO0ibKod
         p5TarJaNkIR2qfupPn+KdVFEw9sP2va9iRvjsLhIhhx4m4NZaH+rHMpIdsKG0DBMyM4o
         oy3DylHgiSHoJcZubwIQVNV3lbvtuXtb4cAeN0u1PRXO8DcNEh4cq96wSKrWnL1THh5e
         P+Vw==
X-Gm-Message-State: AOJu0Yx1aeS0tGHRkfxjNY+MZO3fa5/CObbc9rjB98WFXuZfLQqYIlGn
        l52ulWv0+0EGC19CW2g5N16j6w==
X-Google-Smtp-Source: AGHT+IHv5+jFxKBL09urolkWpi8BIIK1xJDAniaPk6CdWJwEYb4I49/rTk0G06L8rsb9HDHO7NWXPA==
X-Received: by 2002:a17:906:9e:b0:9a5:d710:dea5 with SMTP id 30-20020a170906009e00b009a5d710dea5mr2713502ejc.17.1695966005473;
        Thu, 28 Sep 2023 22:40:05 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id z19-20020a1709063ad300b009a1a653770bsm11971992ejd.87.2023.09.28.22.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 22:40:05 -0700 (PDT)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea@bp.renesas.com>
To:     geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org,
        magnus.damm@gmail.com, catalin.marinas@arm.com, will@kernel.org,
        quic_bjorande@quicinc.com, konrad.dybcio@linaro.org, arnd@arndb.de,
        neil.armstrong@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        biju.das.jz@bp.renesas.com
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 23/28] dt-bindings: arm: renesas: document RZ/G3S SMARC SoM
Date:   Fri, 29 Sep 2023 08:39:10 +0300
Message-Id: <20230929053915.1530607-24-claudiu.beznea@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230929053915.1530607-1-claudiu.beznea@bp.renesas.com>
References: <20230929053915.1530607-1-claudiu.beznea@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Document Renesas RZ/G3S SMARC SoM board which is based on RZ/G3S
(R9A08G045S33) SoC.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- this patch is new in v2 and added as suggested by Geert

 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 822faf081e84..31d0539bb168 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -480,6 +480,12 @@ properties:
               - renesas,r9a08g045s33 # PCIe support
           - const: renesas,r9a08g045
 
+      - description: RZ/G3S SMARC Module (SoM)
+        items:
+          - const: renesas,rzg3s-smarcm # RZ/G3S SMARC Module (SoM)
+          - const: renesas,r9a08g045s33 # PCIe support
+          - const: renesas,r9a08g045
+
 additionalProperties: true
 
 ...
-- 
2.39.2

