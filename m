Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E50C433FE
	for <linux-clk@archiver.kernel.org>; Mon, 27 Dec 2021 13:36:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237120AbhL0Nga (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Dec 2021 08:36:30 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:54802
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237008AbhL0NgU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Dec 2021 08:36:20 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 36312402E2
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 13:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640612179;
        bh=qeUVo4OnQnEXa4nRM+7z4OtDYprQ+PGgnySdBFiipc4=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=CYea4KZ31hAkjDgt0+PlIfGNFqxFTdF7u3go8iGnUwcceFR/9cLVAdqY0iwkzrlXe
         YkwYi6Rf3GGalqXNy+semRP9yRErp3vGhsrOikBCH3Az54Q4A70qhBtzqQ4LED5cNj
         CrchDmOXmVIoqupF6HMINJIdaRngqNEwltBzZi1uK7tVBRiZThszS5UGNvV7+U7hBE
         8oAIlI4NaBFcGtHDYfMBqMA+3fTeOyX7BaSt3Yznmg7i1lxwXyG8ukB9LPcMbrbS7p
         0NafaxFlhnHCqWNFUqZzQfksiwHAqapSLTQfwstbU5lMSZvieBvl4C/1/LgVjtmYk4
         bZXsBN4ccMzXA==
Received: by mail-lj1-f199.google.com with SMTP id v19-20020a2e87d3000000b0022dbe4687f1so2193786ljj.7
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 05:36:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qeUVo4OnQnEXa4nRM+7z4OtDYprQ+PGgnySdBFiipc4=;
        b=yIJFpPAt3DyCDRlHlKrD3QYfLNukUGQwzaZ0tzryW/8FwxtF9Vmsw/5PcoSWzVk7oW
         zFI5I/AyJccIWkC7r72odANsaXiGgRG3U1kjrJReIEweXmAaLn9xlM3f7nzhHFgsc1Fo
         hc/yJFmE20tTQRVZOx3JmWANcM0wzndVU5NS6Qz42SNDFKpQi0CnEDJMws0NjhGxRXNZ
         yaCSRKP5Rtt80TvWOYM6FbTeH6F9k7wTZyyv1+gaL1SYogk9JABCP3VWQg9uY7OVZYdX
         YhhDuueKupUeZINsI8GVlKjzUcZN0oOvihwt+vFjaQXZ6H8t4NZBtBUjGd7i6Px0QxOt
         TurQ==
X-Gm-Message-State: AOAM5339WhagbBDIREdMArMAMv4v/Cj5BHVMTB/T0ItXbbYostSvZSCS
        Jr8DVuVReML83ZrLwJHd2k0k5n9/dznsQrZxTKFEQgvQW+8TdXTRm9c/ykGtQgLGMz3dpUj65j5
        g1DJBvo84uyyQkZN+GMg7p9tiZev5rqdh+iMvug==
X-Received: by 2002:a2e:96c2:: with SMTP id d2mr8014835ljj.440.1640612177477;
        Mon, 27 Dec 2021 05:36:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxowczEi1Ufuu3a5uE9n7r+scZ4hrAOHPBdBSBWoRBxEBxNhEbBQq3slkbnAQ2d3v3tOxf9Og==
X-Received: by 2002:a2e:96c2:: with SMTP id d2mr8014815ljj.440.1640612177153;
        Mon, 27 Dec 2021 05:36:17 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id g18sm800107ljj.124.2021.12.27.05.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 05:36:16 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dinh Nguyen <dinguyen@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-mmc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 19/19] arm64: dts: agilex: align mmc node names with dtschema
Date:   Mon, 27 Dec 2021 14:35:58 +0100
Message-Id: <20211227133558.135185-13-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211227133131.134369-1-krzysztof.kozlowski@canonical.com>
References: <20211227133131.134369-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Synopsys DW MSHC bindings require node name to be 'mmc':

  dwmmc0@ff808000: $nodename:0: 'dwmmc0@ff808000' does not match '^mmc(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index 163f33b46e4f..0a37821af9aa 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -300,7 +300,7 @@ i2c4: i2c@ffc02c00 {
 			status = "disabled";
 		};
 
-		mmc: dwmmc0@ff808000 {
+		mmc: mmc@ff808000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "altr,socfpga-dw-mshc";
-- 
2.32.0

