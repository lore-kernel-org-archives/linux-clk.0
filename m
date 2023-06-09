Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9042CC7EE23
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jun 2023 03:13:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbjFIDNE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Jun 2023 23:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjFIDNC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Jun 2023 23:13:02 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EE4430E7
        for <linux-clk@vger.kernel.org>; Thu,  8 Jun 2023 20:13:00 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-19f84b396b4so283601fac.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Jun 2023 20:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686280379; x=1688872379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ONtBub6zTiGILsFXcr0jpjnAmwxvEv6wu11A7UAraNI=;
        b=B4nvrHXK0cAyGJjc2LNvkucxGZZAODju1NqbN+tckhBktUlwq/S3Y1q9feNKei9fhX
         ZjZF6NPbxCNbs+4vufNM5dDylrddi9gFYb3fWQoLjWHycDGFRHGX9ls+y2uKBRxXd70M
         7IuVG76cS0nskRksP1Bb+kdtF3s9heKPtChnBxDTuKGps0c+PX/qS78uvL8orphlDI/N
         qxXkj9zmvfDdTwDwbtatXbLWpwRbQT2z9nmqkX0zOrmzi03/UMWCdzv6wxQ3zYhT8uN6
         6SF6RX0lA1FF59FjtK8AKb95rcoVAR9cPlTlhEbFl5agH+3sdQ9J/z5Mzmjbmtb4B/BO
         3GMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686280379; x=1688872379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ONtBub6zTiGILsFXcr0jpjnAmwxvEv6wu11A7UAraNI=;
        b=gxUb5WPHLLwMC4C9+Ef8nTtbzvon4NPkUN6kBURX2j3W8Vxa4dILrqUQYKQAhhuC9Z
         m3zQzNMrJ+sXEpvN7cGPzGBOhsWQYxinOl+NDYYRvTptuEFeHfjEBT7kkXTNZzyxk745
         smfRWLv7fzFgmUm1tWYG3rfNI8q2sXxIU+6x2DYWVWT/VtSZTCCec15oDXjuxw/Xwfip
         lEKILotSupMJZX8TUsMy7DXOB3hQvIXtBl5997wTQatfBJS/UyNOCaOtrGJw/9Fu+cvs
         zZbIdRpBjURenHT6+jn/tX7USzawQ6Enx3AHU9gQ6gqGH5kDKtV1EM7d4aOUF/pVxJ7m
         67AQ==
X-Gm-Message-State: AC+VfDwiuTLuHgGK2zQzjDCPK46HErHLHT8XwzVBQvIMN7MBZ58l4qrL
        ZhTQxXv8azaMz/eqEh7KO3t9B6Zsw2E=
X-Google-Smtp-Source: ACHHUZ41TMdV0Tfhj5Yxysosp4JSH70wcUCY+rg5Yb3fLSqQ2c8Mqvz0ynPU20LxfJGzm2gEl/gWUw==
X-Received: by 2002:aca:3d83:0:b0:39a:17c1:97ed with SMTP id k125-20020aca3d83000000b0039a17c197edmr191847oia.4.1686280377926;
        Thu, 08 Jun 2023 20:12:57 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8c46:67c3:a757:2399])
        by smtp.gmail.com with ESMTPSA id r3-20020acac103000000b00395f5cd1a0dsm1047493oif.9.2023.06.08.20.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 20:12:57 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     sboyd@kernel.org, abelvesa@kernel.org, hs@denx.de,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 1/3] ARM: dts: imx6sx: Remove LDB endpoint
Date:   Fri,  9 Jun 2023 00:12:47 -0300
Message-Id: <20230609031249.3692841-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Fabio Estevam <festevam@denx.de>

Remove the LDB endpoint description from the common imx6sx.dtsi
as it causes regression for boards that has the LCDIF connected
directly to a parallel display.

Let the LDB endpoint be described in the board devicetree file
instead.

Fixes: b74edf626c4f ("ARM: dts: imx6sx: Add LDB support")
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- None

 arch/arm/boot/dts/imx6sx.dtsi | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
index 3a4308666552..41c900929758 100644
--- a/arch/arm/boot/dts/imx6sx.dtsi
+++ b/arch/arm/boot/dts/imx6sx.dtsi
@@ -863,7 +863,6 @@ port@0 {
 							reg = <0>;
 
 							ldb_from_lcdif1: endpoint {
-								remote-endpoint = <&lcdif1_to_ldb>;
 							};
 						};
 
@@ -1309,11 +1308,8 @@ lcdif1: lcdif@2220000 {
 					power-domains = <&pd_disp>;
 					status = "disabled";
 
-					ports {
-						port {
-							lcdif1_to_ldb: endpoint {
-								remote-endpoint = <&ldb_from_lcdif1>;
-							};
+					port {
+						lcdif1_to_ldb: endpoint {
 						};
 					};
 				};
-- 
2.34.1

