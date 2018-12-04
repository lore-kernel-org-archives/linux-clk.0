Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA0BC04EB8
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 09:26:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1D5C20851
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 09:26:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Z5UCCHdu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1D5C20851
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725958AbeLDJ06 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 04:26:58 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:4065 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbeLDJ06 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 04:26:58 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0648630000>; Tue, 04 Dec 2018 01:26:59 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 04 Dec 2018 01:26:57 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 04 Dec 2018 01:26:57 -0800
Received: from HQMAIL106.nvidia.com (172.18.146.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 4 Dec
 2018 09:26:56 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Tue, 4 Dec 2018 09:26:57 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c06485f0001>; Tue, 04 Dec 2018 01:26:57 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>
Subject: [PATCH 10/19] clk: tegra: dfll: build clk-dfll.c for Tegra124 and Tegra210
Date:   Tue, 4 Dec 2018 17:25:39 +0800
Message-ID: <20181204092548.3038-11-josephl@nvidia.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181204092548.3038-1-josephl@nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1543915619; bh=2WMlVwdYaQNvFt9k9dlLEzyBuIg4itEIC2FIiuGVzUk=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=Z5UCCHduEPjtYGIgNSwYDAUC6ApB+JvyGkZAoE70tqaT1ZIylDAMMvSj6i4M2F4Bh
         aVAaU5ywuRVfOuEMBvhJPiCkh/dfi0u+Am7XRBo5n9RdGlLhN717Hky6uwuxmV9rcH
         e5hgeWR7FxSMJpyri4ZXvrYRBzQ/8dKjUxjrSH6heboAPFj7D5iSX94GamJ/iClQLH
         of9qSzqn61luiiwwbjePP43hJG4B+mv3inBwhMTVgAtwg2DcRwIxvgOPkRiEXRu0FK
         P17zTxp3xRiRI5HpKBzfHPTit9NE5BsprgZQZOUwzp5pUnag8MeIbb3mg7JewkTktG
         EnBLg/eaNKfFg==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Peter De Schrijver <pdeschrijver@nvidia.com>

Tegra210 has a DFLL as well and can share the majority of the code with
the Tegra124 implementation. So build the same code for both platforms.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
 drivers/clk/tegra/Kconfig  | 5 +++++
 drivers/clk/tegra/Makefile | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/Kconfig b/drivers/clk/tegra/Kconfig
index 7ddacae5d0b1..57902ab43f4a 100644
--- a/drivers/clk/tegra/Kconfig
+++ b/drivers/clk/tegra/Kconfig
@@ -5,3 +5,8 @@ config TEGRA_CLK_EMC
 config CLK_TEGRA_BPMP
 	def_bool y
 	depends on TEGRA_BPMP
+
+config TEGRA_CLK_DFLL
+	depends on (ARCH_TEGRA_124_SOC || ARCH_TEGRA_210_SOC)
+	select PM_OPP
+	def_bool y
diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
index 6507acc843c7..4812e45c2214 100644
--- a/drivers/clk/tegra/Makefile
+++ b/drivers/clk/tegra/Makefile
@@ -20,7 +20,7 @@ obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         +=3D clk-tegra20.=
o
 obj-$(CONFIG_ARCH_TEGRA_3x_SOC)         +=3D clk-tegra30.o
 obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+=3D clk-tegra114.o
 obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+=3D clk-tegra124.o
-obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+=3D clk-tegra124-dfll-fcpu.o
+obj-$(CONFIG_TEGRA_CLK_DFLL)		+=3D clk-tegra124-dfll-fcpu.o
 obj-$(CONFIG_ARCH_TEGRA_132_SOC)	+=3D clk-tegra124.o
 obj-y					+=3D cvb.o
 obj-$(CONFIG_ARCH_TEGRA_210_SOC)	+=3D clk-tegra210.o
--=20
2.19.2

