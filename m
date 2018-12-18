Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B71BC43444
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 09:13:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DD407217D8
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 09:13:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Ui8UQv18"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbeLRJNH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Dec 2018 04:13:07 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:5652 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726412AbeLRJNH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Dec 2018 04:13:07 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c18ba1b0002>; Tue, 18 Dec 2018 01:12:59 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 18 Dec 2018 01:13:05 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 18 Dec 2018 01:13:05 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 18 Dec
 2018 09:13:04 +0000
Received: from HQMAIL106.nvidia.com (172.18.146.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 18 Dec
 2018 09:13:04 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Tue, 18 Dec 2018 09:13:04 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c18ba1e0008>; Tue, 18 Dec 2018 01:13:04 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V3 08/20] clk: tegra: dfll: round down voltages based on alignment
Date:   Tue, 18 Dec 2018 17:12:20 +0800
Message-ID: <20181218091232.23532-9-josephl@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181218091232.23532-1-josephl@nvidia.com>
References: <20181218091232.23532-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1545124379; bh=L81OmWKyjvSNfStsAV9bXBE0hngnsHVQ1gpZL9QEw7E=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=Ui8UQv18UTQcAAVid4QB3NfHJVfIK5RLURcz2UACGZMzMNdd7PHqBKogpB7xBspua
         aE4SNptpMJFLvyfokwyKk7uMZrggFHleumesZKxiNzf6ObC7+QGNfXVRFUy//655V+
         XlW1xlbsM3xLHQ6RkxBJ4hWJeav6AAYVGubtiY6rWRPW09my+RshADUpK0XcEz8gRA
         qrIJD3w7+1BblkPUzywYf5AyKbxHD2HKp/cr/FMHspnRu5kaPBI9yINHRL9JlmWjX0
         S/fmuy3Z7Nd5pRy+LJjdYKR4E6rvZAKmLgRYho2y++rCwk8FqH9E5H1CwL+i2vzrBL
         frPKFlNbpD6Qg==
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
*v3:
 - fix error handling code when regulator_list_voltage returns error
*V2:
 - s/align_volt/align_step/
 - s/reg_volt/reg_volt_id/
---
 drivers/clk/tegra/clk-dfll.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index 96be522398ed..ca9a4ae0d29e 100644
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

