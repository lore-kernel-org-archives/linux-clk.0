Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E06335DA65;
	Thu,  8 Oct 2026 02:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791428302; cv=none; b=ppfsEzpFgSUX+r07OXopobEABuPMAXG8DNzBZd+/mT8vo2NoO+XB2LBWfhFw9feGF/7bU018eh8+txPBKaYNrEwQ75PJXbAsfOwdX8JSYyszEPhOhxPXE2W8ID4UKuEh53ol9wZWUn5QdBlSAoGp85XcwtzUeQhjUxT/GmHCI1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791428302; c=relaxed/simple;
	bh=H7ZCKYOgp3C41MQBZ7N1uzwtq++DacOm3eo3KL4+HX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eLzxjhEd2lW7fx7LibbrmGMRJZ4R0yLfQh2jmpksE7kcIsyfDaRdUmawu+iycbX1hvEGSNVUBufMsxCLGa3RnF0Em22UlkrLks29QTQz9OLL8s1Kno0ymci+gxQuDNb4PU7jE0avKtqVD+nL+BKoSEuZx1mVDq8t8lLI2+x4z44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJxiFcDK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJxiFcDK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C211F000FF;
	Thu,  8 Oct 2026 02:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791428301;
	bh=L/KpMPW/cfYhU188gUGG66uswSsQntLXpfBhZ1oJPlE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BJxiFcDKdQZuelGxj1C2JSIT6Wd2F0VMbLnrNME9HWpxAKIZG2F2cvZ/3SsawLSsl
	 oNT1BugEouBTcDk46i7Oq8JqnDOPQTL97eTIBfmdVdZUgmFx8OOYncvkM5+FxlXzxe
	 dErBgnyziUNqjii8xu6Wd6YcMNhQhhjD44xholc1spQpx6Z5ydo8+6RT8nt9xMOG3q
	 1KvTAf8sQ1zmMg+qmeEIbaHNrQrcdfzsULX0JUHMS0Xs9/4ylgJoSBvAqW1uPmuDg8
	 ZAco1Ercm0BOzXUSBMLlRq3/ejwRd77BSVyzik01gLFHqCwMZsiwzSbAm1eBcntHak
	 +xrK3riEZULbw==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 08 Oct 2026 02:57:56 +0000
Subject: [PATCH 2/2] clk: spacemit: register pm domain auxiliary driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-04-k3-clk-pm-aux-v1-2-8372d7307694@kernel.org>
References: <20261008-04-k3-clk-pm-aux-v1-0-8372d7307694@kernel.org>
In-Reply-To: <20261008-04-k3-clk-pm-aux-v1-0-8372d7307694@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Alex Elder <elder@riscstar.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, linux-clk@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2525; i=dlan@kernel.org;
 h=from:subject:message-id; bh=H7ZCKYOgp3C41MQBZ7N1uzwtq++DacOm3eo3KL4+HX4=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqxwa+ElFiik+kEh7JOJaThddGv6UwjQMqdEY2I
 WtdU0bhKNWJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCascGvhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1RoRAAlzmQewOqmd5qcGC1pKazht+H7nTiQQ5uPaGj1drxpNxlDRbL9WfZj
 YzDMykU7DaQYlg/s5LpbCSBPgHRYljEkvToZRAKxO76pW8RxLsNBW0G9UAwtcKM7WZlBNplXLCF
 qaL9kjBK2Vc1ceWzpypqnuOjPMat26Uy+Mmc4U48hgX4H8bdkXzfvmPtN3Y7fG832Xt77CkTo4G
 zH6sVAC3htDtjuC54/Kx3V2MtFWRSuJZHKlNpSbbZaxUa94a7juEGHonALfeSWPAIBm/dcZaphZ
 h7eYdd9GuYLs2Uky3Zj2ecOWeLXMdzIXSd/aP9pwWn5wuFMIvKp7u50LDo8TpShK33K8YDedJs0
 dV3c2mR0N6ZdH6mT1qg7YMrvpAylj/TADKP4czCQM3UUFAzDzk++1N7oBrS0UHXFi9ooAOhzt6G
 HdwmoE2kwZt8gER/41/3rF3amL+sl+HNDFbEADak/mz5OCHA2IiqrYMXB9WiJDJcX5SK3DoEXbf
 3Z9Lg4BwcJA0ZISK8O5JT8KeiVDyREVcza6QTAzhpM/DpLaM/1aljHORiaL6lW/MWjGoSp/ls7Z
 JU+1mFc4cUyr76Dcx7iJXksZLgPzvRWTzZVHSvIgGXy/WS4bc2zIfB7Cqbj1Nnz67/rRoioh35D
 NQFJduSurYk4ht2YVjdS5XkQo+LHN0=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The APMU (Application Subsystem Power Management Unit) register region
block contains the pm domain management capabilities, introduce a pm_name
member inside CCU data to register a pm domain device via the auxiliary
bus if that is needed - if pm_name is null, no device is registered.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/clk/spacemit/ccu-k1.c     | 1 +
 drivers/clk/spacemit/ccu-k3.c     | 1 +
 drivers/clk/spacemit/ccu_common.c | 4 ++++
 drivers/clk/spacemit/ccu_common.h | 1 +
 4 files changed, 7 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index dee14d25f75d..9e2727521916 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -972,6 +972,7 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
 
 static const struct spacemit_ccu_data k1_ccu_apmu_data = {
 	.reset_name	= "k1-apmu-reset",
+	.pm_name	= "k1-apmu-pmdomain",
 	.hws		= k1_ccu_apmu_hws,
 	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index 92b930d5ff30..e895d3ee6a28 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -1449,6 +1449,7 @@ static struct clk_hw *k3_ccu_apmu_hws[] = {
 
 static const struct spacemit_ccu_data k3_ccu_apmu_data = {
 	.reset_name	= "k3-apmu-reset",
+	.pm_name	= "k3-apmu-pmdomain",
 	.hws		= k3_ccu_apmu_hws,
 	.num		= ARRAY_SIZE(k3_ccu_apmu_hws),
 };
diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu_common.c
index 56f3d081857e..38577fb7776a 100644
--- a/drivers/clk/spacemit/ccu_common.c
+++ b/drivers/clk/spacemit/ccu_common.c
@@ -169,6 +169,10 @@ int spacemit_ccu_probe(struct platform_device *pdev, const char *compat)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register resets\n");
 
+	ret = spacemit_ccu_aux_register(dev, base_regmap, data->pm_name);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register pm domain\n");
+
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(spacemit_ccu_probe, "CLK_SPACEMIT");
diff --git a/drivers/clk/spacemit/ccu_common.h b/drivers/clk/spacemit/ccu_common.h
index 8691698e007d..221a92117b94 100644
--- a/drivers/clk/spacemit/ccu_common.h
+++ b/drivers/clk/spacemit/ccu_common.h
@@ -41,6 +41,7 @@ static inline struct ccu_common *hw_to_ccu_common(struct clk_hw *hw)
 
 struct spacemit_ccu_data {
 	const char *reset_name;
+	const char *pm_name;
 	struct clk_hw **hws;
 	size_t num;
 };

-- 
2.56.0

