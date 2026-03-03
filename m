Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A3348A2A4;
	Tue,  3 Mar 2026 15:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772551530; cv=none; b=kDCy20GgvKDHtSRCOxN6KcJjLl5QyhOt1SZNo0CA7jtYGxKfju1fnyEh/Z4xWZue9riXeq9mrCgGyTXsdi1WVEUWPckljH9FoX8PvIgrNr0VK4Txb91OO0esTCi9E2F+zoIwDpO7Iegk6psZ60ieu3lJVwOR6jbIeor+TsHhDYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772551530; c=relaxed/simple;
	bh=TRGk6s6ylyin2THyiDIzNgZx8bR4vNe0YyHTbze5eS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sFKQJ03pNEs8cBUKCvPlnUWCsDMCxz2No9w53K7GxoPYuvYk49J+uD9GP7uxjpeK7Lxb9w+UnhHUOPHSAmLOp2UiGN93/HeDMPOWM2F69GfyJfnduBbOcwOUA18L+HRFdKNHmctBJ8ciDcpFTVQ4OV3KTlM6Wi9PfTKl0OuIxr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mOfY4rk9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mOfY4rk9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 637E7C19422;
	Tue,  3 Mar 2026 15:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772551529;
	bh=TRGk6s6ylyin2THyiDIzNgZx8bR4vNe0YyHTbze5eS4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=mOfY4rk9aN5RqwVUliICOBRgxgejftDwat8fvHJZVxAj3UcjNfYHzVr5s5q0G3JHM
	 KiNuRBJBcvvwNiuHD1NrQWXqPjYCvo9Y956ewe38pH1ursgcIVrkQOJBocRsztTh65
	 4VBWV5G9weHS64XaUqUAjqSLfvNcbITjKm2kV8mroJlISCD/FaxCajgMSmlRGyZTFm
	 8ADshNpp6OyE1g+h3wFJ+W2U48obBxQ/Zp8vOZ3ac+E57O+PrWe7TLc9/bRQfbDO3t
	 2qzbPqSieHy5hVqg1JAQyNqAV95cm+knZzIyVvNaLD5nur6BQVzXbVfIGy+znqm+Xj
	 YtHo/0Bl+PNwg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 534BFEDA680;
	Tue,  3 Mar 2026 15:25:29 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Tue, 03 Mar 2026 16:25:18 +0100
Subject: [PATCH v2] clk: hisilicon: Improve deallocation in error path
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260303-hisi-error-v2-1-7cd9b43d8fbb@posteo.net>
X-B4-Tracking: v=1; b=H4sIAF39pmkC/02MQQ7CIBBFr9LMWgwFI8WV9zBdtDBtWQhmaEhNw
 90d68bl+3n/7ZCRAma4NTsQlpBDigzq1IBbhjijCJ4ZlFQXqZUVCysCiRIJJ+XgzdR5bxTw4UU
 4he2IPXpmVtdE76Nd2u/6yxjZ/WdKK1phlBmd0daOV32fn9s54gp9rfUDCipp0qIAAAA=
X-Change-ID: 20240329-hisi-error-c00ad7f8dd72
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Tao Lan <taolan@huawei.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772551527; l=1298;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=W75+ROlkJ4ctU6rXqjndz3tp5n4Jy0ZaYQ7i/ITwlZU=;
 b=ZW94RwJBH7x5SH05HYGS4Nfr3uEkO4103SkA3Ao49766KC6OpDmkSAN/Q34LfIWk9OL56bjvU
 9GCViRxRSbBCtllj36E+Frki+qDa/vHLcIyUgIYd06TOrNWZ5nI7LbB
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

Unmap 'base' if an error occurs after it has been mapped.

Reported-by: Tao Lan <taolan@huawei.com>
Closes: https://lore.kernel.org/lkml/ZNlSH+eWV8Sk3FYn@probook/
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
Changes in v2:
- Rebase on v7.0-rc2
- Update my email address
- Reword the commit message somewhat
- Link to v1: https://lore.kernel.org/r/20240708-hisi-error-v1-1-727bc7399b63@gmx.net
---
 drivers/clk/hisilicon/clk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/hisilicon/clk.c b/drivers/clk/hisilicon/clk.c
index fae65127cd4aa8..08050ff1c8cf9a 100644
--- a/drivers/clk/hisilicon/clk.c
+++ b/drivers/clk/hisilicon/clk.c
@@ -70,7 +70,7 @@ struct hisi_clock_data *hisi_clk_init(struct device_node *np,
 
 	clk_data = kzalloc_obj(*clk_data);
 	if (!clk_data)
-		goto err;
+		goto err_base;
 
 	clk_data->base = base;
 	clk_table = kzalloc_objs(*clk_table, nr_clks);
@@ -83,6 +83,8 @@ struct hisi_clock_data *hisi_clk_init(struct device_node *np,
 	return clk_data;
 err_data:
 	kfree(clk_data);
+err_base:
+	iounmap(base);
 err:
 	return NULL;
 }

---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20240329-hisi-error-c00ad7f8dd72

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>


