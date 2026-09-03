Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A300247DD77;
	Thu,  3 Sep 2026 10:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430181; cv=none; b=MpSoZehvfUs4qxVQT5n66osiN/wGiigENAXu8tUo0vsCO11CBvBe0qHxZnCtHYjRdPoV9CoS9zKlzW4FSFjjFQHgF0nJXgUZu3veE5dF85jYv5iew37awdVe9DjDGgtch2eIq88DqbEyS+3V9g/W8RTya3Ae7pDSmkY7DXf6W7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430181; c=relaxed/simple;
	bh=firzj4xSvDGQhXajrKAIayV4E6r6g8TCCZVDrdzgq94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EFjmjqy51ByzK8j7OhFk2/chnqxO0g2z8pUOnUHh7esLs9qlsQSNiJ/pauPhUoXb2DR5h1kgWY9R2xoxxkiQPSrGn5Gwnxp8XHNCgDeDUHly+Wfxc9v/mKvNna+ovisvt2xnwhmu+Vs0XEuUMXOHgfF2u/eGjDEPGhbhjygWIRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E60101F00A3A;
	Thu,  3 Sep 2026 10:09:32 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Marek Vasut <marex@denx.de>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Subject: [PATCH v5 1/2] clk: rs9: Add clock index range check to rs9_of_clk_get()
Date: Thu,  3 Sep 2026 12:09:25 +0200
Message-ID: <fe0172a31f5151af4b771a74362c2ec54ab80055.1788429994.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788429994.git.geert+renesas@glider.be>
References: <cover.1788429994.git.geert+renesas@glider.be>
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
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
v5:
  - Add Reviewed-by,

v4:
  - Put in a series,

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
index 564550c803896756..f3376c29007aa92d 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -276,6 +276,11 @@ rs9_of_clk_get(struct of_phandle_args *clkspec, void *data)
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

