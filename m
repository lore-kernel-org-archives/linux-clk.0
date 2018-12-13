Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1578C67839
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 09:35:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A2F282080F
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 09:35:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="rDY8pqF4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2F282080F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbeLMJfM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 04:35:12 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:18384 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727754AbeLMJfL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Dec 2018 04:35:11 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c1227cb0000>; Thu, 13 Dec 2018 01:35:07 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 13 Dec 2018 01:35:10 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 13 Dec 2018 01:35:10 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 13 Dec
 2018 09:35:10 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Thu, 13 Dec 2018 09:35:10 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c1227cd0001>; Thu, 13 Dec 2018 01:35:10 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V2 09/21] clk: tegra: dfll: add protection for find_vdd_map APIs
Date:   Thu, 13 Dec 2018 17:34:26 +0800
Message-ID: <20181213093438.29621-10-josephl@nvidia.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181213093438.29621-1-josephl@nvidia.com>
References: <20181213093438.29621-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544693707; bh=HAfEKjzYprxlPBOEemM+ZU5kIUKVvi6v5gdpSPuX82Q=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=rDY8pqF46YJ0xXMULIH+P0hsiNlS6N0YZeKXA4B23l/DybOWdWguGsCW3eVJjfM4k
         h1C4+76ntDtUKo9hssCHse7unSb0ik8ezhkVy7Vef+drY4l2CovlJ0c9bjoF9/CJkR
         sQ4TcfhVRtitk2FypAlqU/IMbwf2j1OTFrXleK1OsysXBBqWtENUQGEB91zsMQBSU8
         qZWLdLQ+1QoKXFoCLnCPzCrcap3dD2Ukt1Ua75NTnqoZ79PUCFeXCgmZOQ4/8VIVLg
         +4G0r/J1brDWANz9SgmznaU2GWPHz4X+0/HT8zS+5SUI6DLIu37gS2NevgGMmoDRwg
         eWoYOFFz0LgfA==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The DFLL hardware supports both I2C and PWM based regulator. SW driver
only touches I2C regulator when generating LUT. And shouldn't touch it
anymore once the DFLL is enabled.

This patch adds the protection for the APIs that only work with I2C mode
to avoid they could be called accidentally.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
*V2:
 - new added patch in V2
---
 drivers/clk/tegra/clk-dfll.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index b3668073d9b4..93cc86f17f7b 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -1534,6 +1534,9 @@ static int find_vdd_map_entry_exact(struct tegra_dfll=
 *td, int uV)
 {
 	int i, n_voltages, reg_volt_id, align_step;
=20
+	if (WARN_ON(td->pmu_if =3D=3D TEGRA_DFLL_PMU_PWM))
+		return -EINVAL;
+
 	align_step =3D uV / td->soc->alignment.step_uv;
 	n_voltages =3D regulator_count_voltages(td->vdd_reg);
 	for (i =3D 0; i < n_voltages; i++) {
@@ -1558,6 +1561,9 @@ static int find_vdd_map_entry_min(struct tegra_dfll *=
td, int uV)
 {
 	int i, n_voltages, reg_volt_id, align_step;
=20
+	if (WARN_ON(td->pmu_if =3D=3D TEGRA_DFLL_PMU_PWM))
+		return -EINVAL;
+
 	align_step =3D uV / td->soc->alignment.step_uv;
 	n_voltages =3D regulator_count_voltages(td->vdd_reg);
 	for (i =3D 0; i < n_voltages; i++) {
--=20
2.19.2

