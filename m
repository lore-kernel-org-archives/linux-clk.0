Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CA6C4332F
	for <linux-clk@archiver.kernel.org>; Wed,  2 Nov 2022 17:10:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230468AbiKBRKs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Nov 2022 13:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230487AbiKBRKr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Nov 2022 13:10:47 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F631CB1C;
        Wed,  2 Nov 2022 10:10:44 -0700 (PDT)
Received: (Authenticated sender: kory.maincent@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 71B8910000D;
        Wed,  2 Nov 2022 17:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1667409043;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9im9oukiPyG1+HKqvVPIahRf1Gk4Tnzj4mBOMEVT6/U=;
        b=MP1ZJuZIRRtvKLUTIW44RnwT/MDtN3lzY7+XYfXQJsNwZ+tYDD6eXfaEfYo2xaf6vxDftF
        tKSt1UVCRzzIAew/wSbcORmLRlNb48m27GEcXRLmNnYBq2az4+b88/ErYIO9uiqd8RlFlN
        xKC5/8Mdpabl/fHjN+fQZk75aYTNhWxQD3Woty1DSeHzDSRjfD+9xnKZEs9yWk6HkE2REj
        SHsNW48fSzaRqFACCiPWL3v9XnnSIDa/aKim1P7Sbl1zuGwwZjk/qCdKTNETVAkcobSQH7
        tkN5gzcPXvFl3X2Pg06JCMwWLJ1jEL3KP1dzZRhZDZoTi+LqTFvjblw285jkTA==
From:   =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
To:     viresh.kumar@linaro.org,
        Vipul Kumar Samar <vipulkumar.samar@st.com>,
        Vipin Kumar <vipin.kumar@st.com>,
        Deepak Sikri <deepak.sikri@st.com>,
        Bhavna Yadav <bhavna.yadav@st.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Kory Maincent <kory.maincent@bootlin.com>,
        thomas.petazzoni@bootlin.com, Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Alexandre Ghiti <alexandre.ghiti@canonical.com>,
        Rajeev Kumar <rajeev-dlh.kumar@st.com>
Subject: [PATCH v2 3/6] arm: configs: spear6xx: Enable PL110 display controller
Date:   Wed,  2 Nov 2022 18:10:07 +0100
Message-Id: <20221102171012.49150-4-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221102171012.49150-1-kory.maincent@bootlin.com>
References: <20221102171012.49150-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Kory Maincent <kory.maincent@bootlin.com>

Enable the PL110 DRM driver, used by the spear600.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Notes:
    Changes since v1:
    - Do not drop CONFIG_I2C

 arch/arm/configs/spear6xx_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/spear6xx_defconfig b/arch/arm/configs/spear6xx_defconfig
index 1cf0621d2154..3e2c2abae5ba 100644
--- a/arch/arm/configs/spear6xx_defconfig
+++ b/arch/arm/configs/spear6xx_defconfig
@@ -40,6 +40,8 @@ CONFIG_GPIO_PL061=y
 # CONFIG_HWMON is not set
 CONFIG_WATCHDOG=y
 CONFIG_ARM_SP805_WATCHDOG=y
+CONFIG_DRM=y
+CONFIG_DRM_PL111=y
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
-- 
2.25.1

