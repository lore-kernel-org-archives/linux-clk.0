Return-Path: <SRS0=Wo9f=PM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D5CC43387
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jan 2019 03:07:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 822BB20449
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jan 2019 03:07:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="bwGZLpAL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbfADDH3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Jan 2019 22:07:29 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:9096 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbfADDH3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Jan 2019 22:07:29 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c2ecde50000>; Thu, 03 Jan 2019 19:07:17 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 03 Jan 2019 19:07:28 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 03 Jan 2019 19:07:28 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 4 Jan
 2019 03:07:28 +0000
Received: from HQMAIL108.nvidia.com (172.18.146.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 4 Jan
 2019 03:07:27 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Fri, 4 Jan 2019 03:07:27 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c2ecdee0000>; Thu, 03 Jan 2019 19:07:27 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH V4 08/20] clk: tegra: dfll: round down voltages based on alignment
Date:   Fri, 4 Jan 2019 11:06:50 +0800
Message-ID: <20190104030702.8684-9-josephl@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190104030702.8684-1-josephl@nvidia.com>
References: <20190104030702.8684-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1546571237; bh=cUL37m/rzFCv9nFOio1KsIIUXrkHUsCbWPXDPN0i4xg=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=bwGZLpALI7OB9ebdx7ADFI9rh/zrdat1vrkwErZB2BT4gFOG+JO1kz51mQj1hEF4T
         V5DNUGCGnGvt4G7Vi8DrAfGApaVVgfnZO/18vCPRf7DdBMowYoi9uNCer1vBXW6zjj
         anfhPy5PYD6p+s6vtvPO5KM0nKwY9l2Eqc81RXY5RdOfcKcm0wEtyeH1M58f8NPdW3
         l2Ov78euIT6EpCdSoPJ92R2oCSUOsscBBQB1vNNEnB7sy2p4VehACHVJ4htUTPh2Iw
         Wn8fN/Hha4hEAAEJUN1Gls9opkRzTFhltTyYEclC7CJwygs8i5hW4/vddyhD95UB1f
         qgguczQEnGbnQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When generating the OPP table, the voltages are round down with the
alignment from the regulator. The alignment should be applied for
voltages look up as well.

Based on the work of Penny Chiu <pchiu@nvidia.com>.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
*V4:
 - add ack tags
*V3:
 - fix error handling code when regulator_list_voltage returns error
*V2:
 - s/align_volt/align_step/
 - s/reg_volt/reg_volt_id/
---
 drivers/clk/tegra/clk-dfll.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index 69bbf62a9eab..0400e5b1d627 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -804,18 +804,17 @@ static void dfll_init_out_if(struct tegra_dfll *td)
 static int find_lut_index_for_rate(struct tegra_dfll *td, unsigned long ra=
te)
 {
 	struct dev_pm_opp *opp;
-	unsigned long uv;
-	int i;
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
@@ -1533,18 +1532,21 @@ static int dfll_init(struct tegra_dfll *td)
  */
 static int find_vdd_map_entry_exact(struct tegra_dfll *td, int uV)
 {
-	int i, n_voltages, reg_uV;
+	int i, n_voltages, reg_uV,reg_volt_id, align_step;
=20
 	if (WARN_ON(td->pmu_if =3D=3D TEGRA_DFLL_PMU_PWM))
 		return -EINVAL;
=20
+	align_step =3D uV / td->soc->alignment.step_uv;
 	n_voltages =3D regulator_count_voltages(td->vdd_reg);
 	for (i =3D 0; i < n_voltages; i++) {
 		reg_uV =3D regulator_list_voltage(td->vdd_reg, i);
 		if (reg_uV < 0)
 			break;
=20
-		if (uV =3D=3D reg_uV)
+		reg_volt_id =3D reg_uV / td->soc->alignment.step_uv;
+
+		if (align_step =3D=3D reg_volt_id)
 			return i;
 	}
=20
@@ -1558,18 +1560,21 @@ static int find_vdd_map_entry_exact(struct tegra_df=
ll *td, int uV)
  * */
 static int find_vdd_map_entry_min(struct tegra_dfll *td, int uV)
 {
-	int i, n_voltages, reg_uV;
+	int i, n_voltages, reg_uV, reg_volt_id, align_step;
=20
 	if (WARN_ON(td->pmu_if =3D=3D TEGRA_DFLL_PMU_PWM))
 		return -EINVAL;
=20
+	align_step =3D uV / td->soc->alignment.step_uv;
 	n_voltages =3D regulator_count_voltages(td->vdd_reg);
 	for (i =3D 0; i < n_voltages; i++) {
 		reg_uV =3D regulator_list_voltage(td->vdd_reg, i);
 		if (reg_uV < 0)
 			break;
=20
-		if (uV <=3D reg_uV)
+		reg_volt_id =3D reg_uV / td->soc->alignment.step_uv;
+
+		if (align_step <=3D reg_volt_id)
 			return i;
 	}
=20
--=20
2.20.1

