Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29EF4DF3D6;
	Thu,  8 Jan 2026 13:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767879626; cv=none; b=Gd2y5FaNu8lmmMkA+P6CH72eeSYyw3Gw8i+iPV8qsZyBbuBQUIBgrgFb34+aqBi+iSCU7WmoK60CLxAR/j7tBy1KMPnoRcDeHoXlVzawTTQo1P/qNlPjlBNf3PTfZqH+U0xxQXpf74KGQm37p5ZUqE61Wcxtq/BYwEi6xMFbbqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767879626; c=relaxed/simple;
	bh=1H8Z3f7ZzM80z/iMzeQsDFj5WxSrKZyntFw1N0hz2E4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kI9y4Ftc5D7jnmLYbdQBc4/FdnIBl8MTZhjOQAHLlSs90V1N9zMuJQJbp9qzVshhcce9cBvaftxC8RlCGNoVQfNvEjB7VmpJJkQw+UPCNmiP+XsZck+HRJ7RvVDVf+uF76Oh1oC5zww4/iI1cPSh72nHyxVHjJtU2+MtXvPYPgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3494C341ECC;
	Thu, 08 Jan 2026 13:40:19 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 08 Jan 2026 21:39:25 +0800
Subject: [PATCH v4 4/4] reset: spacemit: fix auxiliary device id
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-06-k1-clk-common-v4-4-badf635993d3@gentoo.org>
References: <20260108-06-k1-clk-common-v4-0-badf635993d3@gentoo.org>
In-Reply-To: <20260108-06-k1-clk-common-v4-0-badf635993d3@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1394; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=1H8Z3f7ZzM80z/iMzeQsDFj5WxSrKZyntFw1N0hz2E4=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpX7Ou6VH6nun8PKQLWXt5Ac58rGXOK5r0iKto4
 WcVU0dBwyGJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaV+zrhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0LeQ//f826Vjtrq9fIHoahuT856hkDj2NVqRN3NHXTcOkZyS3uUUudjEUiY
 ZKZeoP2HBQUbLY1NeEXiwrtwIww3azIT6Xqtlk6ZN6KSRpTYWxwydqWPBtRj/LRadXZaJwSJOcS
 enxpiZHkzJZBzjmrQ+LDQoOa2Lc21PGtjmxqd9Im/4486ZFB/Ma0TUQjhDDiF9WHt1U3gCR0JQZ
 5QBgChycoK1o+G4UJSpUTWt2b9HeR+ymAbj2sv1H0xPpK2v/Shek+2N3+HxDyzoIK2g9Q73FMYI
 m61NuNlscttcozUH6+LKTp2GCGMCscJpLiaV7c3ke9cSuKjA2EhyC5yg+urigai6m6U1qR/hOuC
 Bnq7yGwXbJ9WE/DXF8wmWCvMO3KEmGYCiGI998ElinPAlD6tnhmGrkBF8bJPC9CKbPmpQ2o/Yz9
 /m+dLpOHMtC1qhiR30rnR7Bz5Ivg3aRqJuOx8CSjMRYRKjCzfb1vmE5x4D1KKHIs5z5o6UYKz/1
 481AHojGbvUMwHiYTo7TScIxcc4iIP6if6hY8Q0aZ6iCH3VaD0WhkMHwuSOYMGD3EpcF674yx1K
 ttLBE5Y4mm0e5tYSndNYI873Id47FX9J21hzpBMI0TVycek1+ZrJA+ZSfi0rqR1pQVH6y2QSXTQ
 ZQKhssjoMpCS27Pg1vw8YGO8NJZ/5I=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Due to the auxiliary register procedure moved to ccu common module where
the module name changed to spacemit_ccu, then the reset auxiliary device
register id also need to be adjusted in order to prepare for adding new
K3 reset driver, otherwise two reset drivers will claim to support same
"compatible" auxiliary device.

In order to prevent the reset driver breakage, this commit is necessary
as a post-fix for changes introduced by two patches below, and should be
merged with them to make the patch series runtime bisectable.
("clk: spacemit: add platform SoC prefix to reset name")
("clk: spacemit: extract common ccu functions")

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/reset/reset-spacemit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
index e1272aff28f7..cc7fd1f8750d 100644
--- a/drivers/reset/reset-spacemit.c
+++ b/drivers/reset/reset-spacemit.c
@@ -278,7 +278,7 @@ static int spacemit_reset_probe(struct auxiliary_device *adev,
 
 #define K1_AUX_DEV_ID(_unit) \
 	{ \
-		.name = "spacemit_ccu_k1." #_unit "-reset", \
+		.name = "spacemit_ccu.k1-" #_unit "-reset", \
 		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
 	}
 

-- 
2.52.0

