Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91873B2A0;
	Wed, 21 Jan 2026 11:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768993363; cv=none; b=BUm6vMeihgc8+b/6NVEzH9MFatPUt2n6IrCjTHqc1ymR4K8LVVz6/f3IxcwO8Yc2qDm7D2ZA9c1ltnw0oQvTRVFe859l8maWnI7abY43PnZ7R1DjeKjRuI/FLC278HhQUGmgvF1YZhvXdkDz/YNaN17yEZCIVu47BgMGG/TaUbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768993363; c=relaxed/simple;
	bh=/uNHHBKP3Kl5uisOYfpa8YIX8N3P20gKqmpXE2a11bI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UFM9hve6UOcesX9BoeBWq/GgMBzIidIGzU1zyD8FzxdYHLy/sf38yEegd0mUwluPG1x7BWzZjodKackGgmB6LyCiGoS8vGDLmdUpxb9d9AsnT7akZlVB0wNbxaz+fuTuV7TDHQPN0GYjiHwZOsoHZoiWKbqr/2GfTY8KKj/kK9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4203C19424;
	Wed, 21 Jan 2026 11:02:41 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Marek Vasut <marex@denx.de>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3] clk: rs9: Add clock index range check to rs9_of_clk_get()
Date: Wed, 21 Jan 2026 12:02:38 +0100
Message-ID: <287354a12cf8ea0de0c81b059943c21ec7e37cfb.1768993323.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rs9_of_clk_get() does not validate the clock index in the passed
DT clock specifier.  If DT specifies an incorrect and out-of-range
index, this will access memory beyond the end of the clk_dif[] array.

Fix by this adding a range check to rs9_of_clk_get().

Fixes: 892e0ddea1aa6f70 ("clk: rs9: Add Renesas 9-series PCIe clock generator driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Add error message,

v2:
  - Just add the missing range check; the conversion to
    of_clk_hw_onecell_get() can be done later.

v1: "[PATCH] clk: rs9: Convert to clk_hw_onecell_data and
     of_clk_hw_onecell_get()"
    https://lore.kernel.org/a6dce17b15d29a257d09fe0edc199a14c297f1a8.1768836042.git.geert+renesas@glider.be
---
 drivers/clk/clk-renesas-pcie.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index f94a9c4d0b6700ff..6650e3440c7492cf 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -277,6 +277,11 @@ rs9_of_clk_get(struct of_phandle_args *clkspec, void *data)
 	struct rs9_driver_data *rs9 = data;
 	unsigned int idx = clkspec->args[0];
 
+	if (idx >= rs9->chip_info->num_clks) {
+		pr_err("%s: Invalid clock index %u\n", __func__, idx);
+		return ERR_PTR(-EINVAL);
+	}
+
 	return rs9->clk_dif[idx];
 }
 
-- 
2.43.0

