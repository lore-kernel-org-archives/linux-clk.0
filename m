Return-Path: <SRS0=Jypq=TV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A6F5C072AD
	for <linux-clk@archiver.kernel.org>; Tue, 21 May 2019 15:01:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3F45721743
	for <linux-clk@archiver.kernel.org>; Tue, 21 May 2019 15:01:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="iLz1uYNN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728784AbfEUPBh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 May 2019 11:01:37 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39284 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728787AbfEUPBh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 May 2019 11:01:37 -0400
Received: by mail-wr1-f65.google.com with SMTP id w8so19023713wrl.6
        for <linux-clk@vger.kernel.org>; Tue, 21 May 2019 08:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cOkHldzyBFH9X/HosQWb1+4hRM7Ru7GoP6WYL8SoxXY=;
        b=iLz1uYNNrP1wzBd0TtjfZdiiXyUgafCaZPWzdqW1C7AyvgRQwNgYlnaB2oVq1fgvGC
         zUJGOHNaStkp5rxJtlAiNrMXntlQnmnlSNVHbdeiXtMKsI1xEPZ3yFVAYaB2QsoMHTcF
         4ptUEp+iYLSvFypp9o1FJ+OcsMQyC7ODhArXmCmmoY+3uaCQMNAk8MQea/UiDncY2VT5
         Hc3i1oAruKqXtJMHCwrwwjIzxbeycv14H5cmoulfEKDUZAPLikUWDFGVYxFa7vndnoDU
         c7UISO884tWxdVq/zw4M0UAHznZmVPLLg9vjY0yKsdHQ1D4C39VeZj4WvM/X/kkHB+Jc
         s8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cOkHldzyBFH9X/HosQWb1+4hRM7Ru7GoP6WYL8SoxXY=;
        b=Hh7iPh7qPzWz5j2UkB4Sy36gTB2nwgosZRfEz7i0tUiRH4YZW3kzaGmBUXm+feciJp
         i8I1ByQLjf3m5EVHgYCUF2Wkpw5AgnjqE/51jzuUYmSsaC8nchu3ygbPhgbRSAOYViC6
         3ta+ILAuofQTBrQtxJ3DfNuSboepZNr352I/SEHg7dWntMqLDQjhQNZU3my2TRASutkV
         G3/kpQ0FuM4u84N6Bk0vOIYcMe3C2MIHJhwNr38f3Ab6dm6q6LzWNApjgf4ZZuntP12M
         taCdfgkXGf3vAT2VLdea9JzIbJyLeF5XjUT07+l7SXa/zXeCsAWQHr6pRL0eE84LwnxR
         KrWg==
X-Gm-Message-State: APjAAAUek8Aq8tPJtCuw4sAZDs6qw/ThDHfzuN1U1dvUo0aQ+NMm5iCs
        qbaj7jUyx/qj9xp0pwoNro50Iw==
X-Google-Smtp-Source: APXvYqyIk/qrN/n0dkOKQIYiCuXs1z6aYIvyyVnYqLMYI9XDoGTJxEnIDige/eKJnv1im9nxaSSdxQ==
X-Received: by 2002:adf:b611:: with SMTP id f17mr52412220wre.162.1558450895175;
        Tue, 21 May 2019 08:01:35 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id b194sm3407505wmb.23.2019.05.21.08.01.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 21 May 2019 08:01:34 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, devicetree@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH 1/3] dt-bindings: clk: meson: add g12b periph clock controller bindings
Date:   Tue, 21 May 2019 17:01:28 +0200
Message-Id: <20190521150130.31684-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521150130.31684-1-narmstrong@baylibre.com>
References: <20190521150130.31684-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Update the documentation to support clock driver for the Amlogic G12B SoC.

G12B clock driver is very close, the main differences are :
- the clock tree is duplicated for the both clusters, and the
  SYS_PLL are swapped between the clusters
- G12A has additional clocks like for CSI an other components

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
index 5c8b105be4d6..6eaa52092313 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
@@ -10,6 +10,7 @@ Required Properties:
 		"amlogic,gxl-clkc" for GXL and GXM SoC,
 		"amlogic,axg-clkc" for AXG SoC.
 		"amlogic,g12a-clkc" for G12A SoC.
+		"amlogic,g12b-clkc" for G12B SoC.
 - clocks : list of clock phandle, one for each entry clock-names.
 - clock-names : should contain the following:
   * "xtal": the platform xtal
-- 
2.21.0

