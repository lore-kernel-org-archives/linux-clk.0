Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74EF1C65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 09:35:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 35DE72080F
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 09:35:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="ZrMis8t0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35DE72080F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727892AbeLMJfN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 04:35:13 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:8147 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbeLMJfJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Dec 2018 04:35:09 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c1227c80000>; Thu, 13 Dec 2018 01:35:04 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 13 Dec 2018 01:35:08 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 13 Dec 2018 01:35:08 -0800
Received: from HQMAIL112.nvidia.com (172.18.146.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 13 Dec
 2018 09:35:08 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL112.nvidia.com
 (172.18.146.18) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 13 Dec
 2018 09:35:08 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Thu, 13 Dec 2018 09:35:08 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c1227ca0005>; Thu, 13 Dec 2018 01:35:08 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V2 08/21] clk: tegra: dfll: round down voltages based on alignment
Date:   Thu, 13 Dec 2018 17:34:25 +0800
Message-ID: <20181213093438.29621-9-josephl@nvidia.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181213093438.29621-1-josephl@nvidia.com>
References: <20181213093438.29621-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544693704; bh=/9b0vccXVbSsPPDgtuaNPJXlfIPgbx2xijk4gBTdtP4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=ZrMis8t0yZiUf6YoPWFFZXWj8rD2JtmIpFwNciC81dTuEal6h0fUEo890mdsqPDMc
         9StlYhTfU+oeXBnROymY1+nBafyGvyJYf32Xgj/okQe5W/RsU1xhQ3c+zmsanUuq7m
         Xjb2by8tnj9mdDcDvpBOfsVn8hg3i4+fI6Uz/lyyZFLYsk5syzbtKqRk/xwquM+1To
         u6Ir7wnLWEWCbunZLh9dHPgN5DSt+JKYtOPm8q3L5dSgKhEnarIYV1ygWWj4aPC3be
         11XAgAH0kowXClce6f61h+UBGRF/11EQBmdxA3dy+JqF0LUgrcPurINagI4I8gExGm
         lkhye8XRtoaNg==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When generating the OPP table, the voltages are round down with the
alignment from the regulator. The alignment should be applied for
voltages look up as well.

Based on the work of Penny Chiu <pchiu@nvidia.com>.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
*V2:
 - s/align_volt/align_step/
 - s/reg_volt/reg_volt_id/
---
 drivers/clk/tegra/clk-dfll.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index 72e02898006c..b3668073d9b4 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -804,17 +804,17 @@ static void dfll_init_out_if(struct tegra_dfll *td)
 static int find_lut_index_for_rate(struct tegra_dfll *td, unsigned long ra=
te)
 {
 	struct dev_pm_opp *opp;
-	int i, uv;
+	int i, align_step;
=20
 	opp =3D dev_pm_opp_find_freq_ceil(td->soc->dev, &rate);
 	if (IS_ERR(opp))
 		return PTR_ERR(opp);
=20
-	uv =3D dev_pm_opp_get_voltage(opp);
+	align_step =3D dev_pm_opp_get_voltage(opp) / td->soc->alignment.step_uv;
 	dev_pm_opp_put(opp);
=20
 	for (i =3D td->lut_bottom; i < td->lut_size; i++) {
-		if (td->lut_uv[i] >=3D uv)
+		if ((td->lut_uv[i] / td->soc->alignment.step_uv) >=3D align_step)
 			return i;
 	}
=20
@@ -1532,15 +1532,17 @@ static int dfll_init(struct tegra_dfll *td)
  */
 static int find_vdd_map_entry_exact(struct tegra_dfll *td, int uV)
 {
-	int i, n_voltages, reg_uV;
+	int i, n_voltages, reg_volt_id, align_step;
=20
+	align_step =3D uV / td->soc->alignment.step_uv;
 	n_voltages =3D regulator_count_voltages(td->vdd_reg);
 	for (i =3D 0; i < n_voltages; i++) {
-		reg_uV =3D regulator_list_voltage(td->vdd_reg, i);
-		if (reg_uV < 0)
+		reg_volt_id =3D regulator_list_voltage(td->vdd_reg, i) /
+			      td->soc->alignment.step_uv;
+		if (reg_volt_id < 0)
 			break;
=20
-		if (uV =3D=3D reg_uV)
+		if (align_step =3D=3D reg_volt_id)
 			return i;
 	}
=20
@@ -1554,15 +1556,17 @@ static int find_vdd_map_entry_exact(struct tegra_df=
ll *td, int uV)
  * */
 static int find_vdd_map_entry_min(struct tegra_dfll *td, int uV)
 {
-	int i, n_voltages, reg_uV;
+	int i, n_voltages, reg_volt_id, align_step;
=20
+	align_step =3D uV / td->soc->alignment.step_uv;
 	n_voltages =3D regulator_count_voltages(td->vdd_reg);
 	for (i =3D 0; i < n_voltages; i++) {
-		reg_uV =3D regulator_list_voltage(td->vdd_reg, i);
-		if (reg_uV < 0)
+		reg_volt_id =3D regulator_list_voltage(td->vdd_reg, i) /
+			      td->soc->alignment.step_uv;
+		if (reg_volt_id < 0)
 			break;
=20
-		if (uV <=3D reg_uV)
+		if (align_step <=3D reg_volt_id)
 			return i;
 	}
=20
--=20
2.19.2

