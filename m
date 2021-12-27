Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C942C4332F
	for <linux-clk@archiver.kernel.org>; Mon, 27 Dec 2021 13:36:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237080AbhL0Ngf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Dec 2021 08:36:35 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:39732
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236945AbhL0NgQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Dec 2021 08:36:16 -0500
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 578343F1AA
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 13:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640612175;
        bh=3AbZgxGDXgdNiIa0Jk7Nnp9ACqroRk58o0FdzMEMrPY=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=hcFzRTVeGyuEiNCIrKYtINddTewEergq5sWGmwhkFNvIwX5HPHynD7NfXnLZDCnSS
         1YZeV94RiHp0refr8gIfYY94BA00BX/zNUYYGvH9kfuDnwB84YWxo+/n0byzmfQANm
         HQOBL5iltGp41HojuH2NvjKkRtsMepAk05dO7monp/fB2WkpwzJQjEugBoQaKyoZHu
         RCvFucIAceApTtJfIn59uqtkM1vAKnXIE3O3KwK6Xv48W6IMpdoXJYDezcLf6ATYAK
         wwj0pFJxUUUQ8uoYIby8kI8OrRi77htR9EWwZpq7Z/I3SzGnwTh0XPIuE+LeGCcbnG
         xGf8vWxeNLQXQ==
Received: by mail-lj1-f197.google.com with SMTP id u8-20020a05651c130800b0022d6dad0418so4973320lja.11
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 05:36:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3AbZgxGDXgdNiIa0Jk7Nnp9ACqroRk58o0FdzMEMrPY=;
        b=YEnJ9ZWg3jo3Cd2lP88djnruEih4ys6mD2wPQXiNsH2PnU0wnNNi7hcfAEXZD0KUta
         XMRZKAEXxIh3sR/cToTOyDGc9u6sFXS9mxZhOnAREN8G7kPZuc/ch7cQKZPmpIlvq6Fq
         HShSstdlwPVJ5/Xo+IXtY2aU7IJ6gBWNMPnRO3EQj+iwjDNHSY0KsamxfcRV5JXxnOJg
         FmtPdRn3GQ1v15i6XogLHtTD1Mz/CFd7Beymf062xHQgciEZd0oCQTYbzLxq0KfN56e/
         bbRa2C7xU252yi5tAD5PlLntV4UIYeB8G5Q61ta0qbrMauhazt7lOCAGxcstJOgjYT9Y
         RHuw==
X-Gm-Message-State: AOAM531qUmIff1oyKXabUsRtngFvanLmA3sErjtuGpaxNhqgw55YwPSO
        u6xqTxshzj3BvYuSOczfMw+vuaqOK4+5HTqhzJbQmq8YO8wN/nDwrW65CiYjpoU2mOJVOe5gqFV
        5CTMbKkT3DIsFmXP17E6S6Lq2qejIAULFyDi6GA==
X-Received: by 2002:a05:6512:12d5:: with SMTP id p21mr8942038lfg.569.1640612174870;
        Mon, 27 Dec 2021 05:36:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfQu6n8QDkb9KxZ3wkpoGs+rZ8DmC5Rse+TWkIV2qUXfeuDeJNbHXLY+a1Sk3njem4BbGbmA==
X-Received: by 2002:a05:6512:12d5:: with SMTP id p21mr8942022lfg.569.1640612174714;
        Mon, 27 Dec 2021 05:36:14 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id g18sm800107ljj.124.2021.12.27.05.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 05:36:14 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dinh Nguyen <dinguyen@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-mmc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 17/19] arm64: dts: agilex: add board compatible for SoCFPGA DK
Date:   Mon, 27 Dec 2021 14:35:56 +0100
Message-Id: <20211227133558.135185-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211227133131.134369-1-krzysztof.kozlowski@canonical.com>
References: <20211227133131.134369-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Intel SoCFPGA Agilex 10 SoC Development Kit is a board with
Agilex, so it needs its own compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts      | 1 +
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
index 0f7a0ba344be..ea37ba7ccff9 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
@@ -6,6 +6,7 @@
 
 / {
 	model = "SoCFPGA Agilex SoCDK";
+	compatible = "intel,socfpga-agilex-socdk", "intel,socfpga-agilex";
 
 	aliases {
 		serial0 = &uart0;
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts
index 57f83481f551..51f83f96ec65 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts
@@ -6,6 +6,7 @@
 
 / {
 	model = "SoCFPGA Agilex SoCDK";
+	compatible = "intel,socfpga-agilex-socdk", "intel,socfpga-agilex";
 
 	aliases {
 		serial0 = &uart0;
-- 
2.32.0

