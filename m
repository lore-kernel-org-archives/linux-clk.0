Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8398723BD1B;
	Sat,  3 Jan 2026 07:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767425228; cv=none; b=RPaVOg10osTN/nRCx+J2L8KY/l2aYmd1nv20t+ot4tLG6JT4St+6of/u3+TkdrD3l08jcbgioHslojiwnZFdGsw0Pd+Kjywqmp8pXPQfRAPT3s6TafFeQH5FmJCRhT6RL2vvcPdXLAKy79az6S27px2ERbZ30i74TjXl91oRmy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767425228; c=relaxed/simple;
	bh=zX/4qEo/Fm6O0cbgUCvQ6GVe+DPSF8s25eCUmnf2qUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pfXzB2vyKmuTtE6iQ2nmnf2C7H4uLkpCMnl5Ia7Vd+mG2dV1a1Q8l4cWFRETC135125RXMnmoWxCGIKtP/JOzDeYKkQdun8rqesqzGF0WgLlUq53+6iBowNhMe8ISLXd+zQo8upzHxcCXeknPNdfqcFwJWnslxEiwd6f7iQS0IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3B42B341E7B;
	Sat, 03 Jan 2026 07:27:02 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 03 Jan 2026 15:26:15 +0800
Subject: [PATCH v3 4/4] reset: spacemit: fix auxiliary device id
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260103-06-k1-clk-common-v3-4-6061d9f69eef@gentoo.org>
References: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
In-Reply-To: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=979; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=zX/4qEo/Fm6O0cbgUCvQ6GVe+DPSF8s25eCUmnf2qUQ=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpWMStJpUS3UYf8rEdkVomPqtVtP/dlWvqu3wkk
 P61QmbryzKJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVjErRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2J2hAAgFknf+s5p+06k4LgUhusHp3VVobF4c9Ii57EJgYVCXhghn3K+8frz
 O9iEjLi9fy/agfM7hJ6b8xQvsh5w6BxatapMh3zymUh5pBBLOVo+LnXqRYe+fuPGIW2RRRfBAer
 J9zl0KF8hcVilKY0B2JJno5PXekPC7dUR+qxVuDK/18+v3yKJ3K5d45nrGN4Uh3P6gUi9R2w4wt
 bmQx1YLWCtwzBV2+CygujEeo+qOw59AaWRF0XNJyYdVY5mqtIrbE33y3ikGe469PqW/Bx7p7Klu
 y/4E9N67amhGD7N97K3tm9mWTTT6XQkEiEzanxCyFMhgQOYnaD94IZIJymhXn6Kq4DCH3BD2GEt
 oR0JCU08ymWVLfkI1H88SB3V1oOFDMY02YwDeL9KNsuCllmOFl6Eu8iNSXx33tZ5d1uzE6dVtXD
 ZQuYapz+I4I5HtTVUD4702GSZdl/lSVIw+8tAGvworOatDk/OHtfkszR5Z35cGC0pd75K2H/PHw
 p/Sz1bhFXJNRg6j7CUS4x1mlyZ8pX0Q85f1hFnfUm0ayL3K2z8H6rjINYUcCsBhlq5Wge8fM1Im
 XYeMTt4NBbwFSKHLarOdZMkXvbsfiURVrOpVZ1tha56olIFZjWQddiVo/tpdNTwIvD4gjoWnmcG
 6t9BkJHm3mJttAf0N73Wwa9Zmc1OdY=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Due to the auxiliary register procedure moved to ccu common module where
the module name changed to spacemit_ccu, then the reset auxiliary device
register id also need to be adjusted in order to prepare for adding new
K3 reset driver, otherwise two reset drivers will claim to support same
"compatible" auxiliary device.

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

