Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C27C04EB8
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 09:27:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 86A8820851
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 09:27:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="qktwJkGq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86A8820851
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbeLDJ1T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 04:27:19 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:3742 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbeLDJ1T (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 04:27:19 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0648750000>; Tue, 04 Dec 2018 01:27:17 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 04 Dec 2018 01:27:18 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 04 Dec 2018 01:27:18 -0800
Received: from HQMAIL112.nvidia.com (172.18.146.18) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 4 Dec
 2018 09:27:18 +0000
Received: from HQMAIL108.nvidia.com (172.18.146.13) by HQMAIL112.nvidia.com
 (172.18.146.18) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 4 Dec
 2018 09:27:17 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Tue, 4 Dec 2018 09:27:17 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c0648740000>; Tue, 04 Dec 2018 01:27:17 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>
Subject: [PATCH 19/19] arm64: defconfig: Enable MAX8973 regulator
Date:   Tue, 4 Dec 2018 17:25:48 +0800
Message-ID: <20181204092548.3038-20-josephl@nvidia.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181204092548.3038-1-josephl@nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1543915637; bh=Jw2G9SmrFUt26WmWgjXCnnyrPuOPmpOMPrT1wFjPAQ0=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=qktwJkGqZWXwYOLEWycGsoqyfWyctpI8vhvy65nU2lsHUuHRQv5GfkrmVANudIzjH
         DSEWYukcwwfa9gymy3hVJJrqZv4oKmhMED4mX3efiz+yr5bll+Lfz7hAFZU0k6K03j
         Ku7wHzIWg6z0SgG9U1f7S3rsDC7LUc6ZM97CeqabFI8REEVNgFnvzgjpHbZCOZ+uM4
         dKqE+iN/lUfh6ZTzl9oW5wHP83D/IACzr3ooEG9dhIdl65usJ2atw9KHMAiURrvYvg
         j1Qtp9xSvoPX+blYvN30+RBMEnThT7927CsooUQX3h1g+sR98RUAv1RXs8JQqK8X6k
         LQmC5r4gT4Dsw==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Tegra210 Smaug board uses MAX77621 for both CPU & GPU rail. Note
that max8973 and max77621 share the same driver. So enable this driver
for the PMIC.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5c2b1f6842f8..8dab129395a1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -420,6 +420,7 @@ CONFIG_REGULATOR_GPIO=3Dy
 CONFIG_REGULATOR_HI6421V530=3Dy
 CONFIG_REGULATOR_HI655X=3Dy
 CONFIG_REGULATOR_MAX77620=3Dy
+CONFIG_REGULATOR_MAX8973=3Dy
 CONFIG_REGULATOR_PWM=3Dy
 CONFIG_REGULATOR_QCOM_RPMH=3Dy
 CONFIG_REGULATOR_QCOM_SMD_RPM=3Dy
--=20
2.19.2

