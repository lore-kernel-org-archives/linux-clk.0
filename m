Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702A737AA7E
	for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 07:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776411441; cv=none; b=lshIco0u8S3w3cXGn17D/woSAe2fFubQpTCrCr2BL3go683hEu+SCSRNEADq9SJkN9r6uyRfi4PJKKKzvTForHXDTWdyOFyW6//rLrK7K776fMhrXLtjGdmDE+ESXfssY8i78Fd8few530swrX76r1hIH4TVnleXs+qeA0CzAiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776411441; c=relaxed/simple;
	bh=ntjX0N5F41OJckwHhjFndO5tDkiyPj/m0ruzo3MkSbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cfh0OYZeiVQNvhxvelFhM+8RkFF0XvLJ3bmLLskWMhN5yiRXCWaVNHTXWjllvL6ctd8qjzpGw+pFQxarebP98Z8AtFkQlUJ6VxLOrvp59DjSupEbZRF50evg51ybf/XBq+D71rVhySI7oANKSgAdDGkxV60uTIAqUlRvn0edwuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9EEjVpq; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9EEjVpq"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38e7d983f91so4031751fa.2
        for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 00:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776411438; x=1777016238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pt779CeCGZE6QhsteVfBznH3GnAaSQgHdsYoK27GZto=;
        b=X9EEjVpq/Xq3yNvXcjBcjw95UpQ4maA8e2T7l4RfOKVJx3CoVyQtgIRDZbyWRVL6F0
         iH6XvhVEhzykk4AVWkBOW2GEEHaVIu+5mvvIXW1jNRUh2hJetJCAgXXbV0d8E23qfPjj
         /rDhVhZhw/h2o/FddR5RTIZA1r7kiLA0kd954iqU2e8TbO6UrTPNVrFeVoqtmDhKA8P5
         JFL9O6M0m94eyVuIo++scZKKUrbP2leezdCogVG8I92YHH8dIR+sFAI/dpXZaozCivgw
         bP66/PLaNpk7CEASzAzsv7DrTJd824jd8B+0IfSnWBaM0VsXbnTCzdSwFc+YGRD08PoW
         b2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776411438; x=1777016238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pt779CeCGZE6QhsteVfBznH3GnAaSQgHdsYoK27GZto=;
        b=D7EyMwOEAH4eEYjdfEQ2vGERH9Z0gW7Wo+wn8qsA2mZaDe9ikF6CHX/2PmXGZwA6kp
         UP4S4DfqhVLOFSuMk1ln8x6z48mg7x8wjfcBumUdpbSK99LGka/mY6ykffGltBAudCeG
         cEgJv0bMc3+aulB1Hsw1MI0peLfFl+pyUPmdB1p0Q5cpMmwuN1QcWafobzYO5HI79jG3
         iVCqbSz3EZtQdLKBcSe7FiJXijnUhIK+xEe+/8n+s0so12QlIRAseAjWvjm8EO71ZhXr
         sb+8Ty0/i55/NvDsbjQBcP5lN5wOCHePDnMtffnZvZTtvGdhVvdVIGpFSsG++b9gasCh
         CT/g==
X-Gm-Message-State: AOJu0YxgkOcMMZh2kx3UIr4J1K8hQWtRIbeD4dNswCLVMcMj9t7cLnVF
	IPahGxCjWNLtV/oZEpd4rVKN4Rz57M9rsNmpQrhOPi3OW8NyEDQ0pkkk
X-Gm-Gg: AeBDiev4wjGV7KHxiD31osabShrXXRp1GKyHtUEcGqg421HWCjfjepQ9/5NriDcUpiQ
	tzVI89KdMgGVbqGurZLI08Yvnw2IBx6E1yyq9UnhqPIz2ak5jcj3TCCHKL/GCktkdqWTj/tX3JT
	yzzvIOXijxjD3YSIUs2OjOk62gye4RtUQw8q2vcIWr2oo71Y6up9d7o0sfbrJ3EdAjnn2y3cYSk
	V7TDjIuljLY4aMZOCI/EPnLb4OVLVDrGx63vBKR8HRXJ6nwz/5Zf8WO+OUi8VbV+siS88ut7xm0
	H87BMJJmzvLO8e+qeYNuvx+fXP6IrRVdQjYOwsK9UwHWvxX8Zp5N8cFCFCtFNWqkv9uICKb7vmW
	bo/gprdOBtWI+tPs7PrTnJ+69QPl22FpuetTFopCdPbzrMGEWM5hSD6oBCaWOVGGldUSi/Sx4oW
	fjnZeALGVuAZB/Z0W5UbIFfkU=
X-Received: by 2002:a05:651c:19a1:b0:38e:84e3:3476 with SMTP id 38308e7fff4ca-38ec7ac74acmr5569871fa.25.1776411437544;
        Fri, 17 Apr 2026 00:37:17 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f64ebsm1692661fa.10.2026.04.17.00.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:37:17 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] clk: tegra: support 48MHz clock for pll_p_out1
Date: Fri, 17 Apr 2026 10:34:52 +0300
Message-ID: <20260417073452.23342-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417073452.23342-1-clamor95@gmail.com>
References: <20260417073452.23342-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Dmitry Osipenko <digetx@gmail.com>

UEFI on Surface2 sets pll_p_out1 to 48MHz which is not supported
by kernel and causes BUG() early on. Fix this by adding 48MHz
clock support for pll_p_out1 along with 48MHz support for pll_a,
main pll_p_out1 descendant.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Jonas Schwöbel <jonasschwoebel@yahoo.de>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-pll.c      | 1 +
 drivers/clk/tegra/clk-tegra114.c | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index d86003b6d94f..eae732320bec 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -564,6 +564,7 @@ static int _calc_rate(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
 	switch (parent_rate) {
 	case 12000000:
 	case 26000000:
+	case 48000000:
 		cfreq = (rate <= 1000000 * 1000) ? 1000000 : 2000000;
 		break;
 	case 13000000:
diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index a4f40533cc43..6a77742aaad2 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -363,13 +363,15 @@ static struct tegra_clk_pll_freq_table pll_a_freq_table[] = {
 	{ 28800000, 282240000, 245, 25, 1, 8 },
 	{ 28800000, 368640000, 320, 25, 1, 8 },
 	{ 28800000, 240000000, 200, 24, 1, 8 },
+	{ 48000000, 282240000, 147, 25, 1, 8 },
+	{ 48000000, 368640000, 192, 25, 1, 8 },
+	{ 48000000, 564480000, 294, 25, 1, 8 },
 	{        0,         0,   0,  0, 0, 0 },
 };
 
-
 static struct tegra_clk_pll_params pll_a_params = {
 	.input_min = 2000000,
-	.input_max = 31000000,
+	.input_max = 48000000,
 	.cf_min = 1000000,
 	.cf_max = 6000000,
 	.vco_min = 200000000,
-- 
2.51.0

