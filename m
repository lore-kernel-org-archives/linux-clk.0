Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEAF378D88;
	Thu, 29 Jan 2026 10:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769680952; cv=none; b=gjO6E11eezTc6Sn3sKzd5/DjxTgY4lM6uGhOdYEXL/ZG2p7/YgGzIlpq7Z1H9P0KCLnedhdcfZkREA0qzZ5QwJWOjYm9rNcWrKga1JrvdfXAqZ/+D0qz0gcaiKwqWYsOLY+gbcVJSAMroddfiUCWiUpSLo9HUG9hv0LfhGsoXKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769680952; c=relaxed/simple;
	bh=F9jhq02S/WkA1AOX8d+Bitd7ryXfzf+yzTo6wqwXnt0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GIipTFuDcuTC8h3xruveJILKQCiCACmyZuzYc84YJXJlpydzkF0tEWO8nH2jJT9avNLXIFfL+5Aq/qkii3iTQIpOu+EqpZkuKn1rhbSGGF1ZGKaE4riB1leAM4fH6k2es02Cg5XxxZjzJFkS8J+xVUWD0HVtURRloxz7RV2gSkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=etKeGBIJ; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="etKeGBIJ"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA7A010F7AC;
	Thu, 29 Jan 2026 10:55:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1769680503; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=XTRog+IwmrYHyO0U4dmJGbr+cuA3smR5bAwagjLcAnk=;
	b=etKeGBIJbhp3ZjkAy6wEW2Thn0m6ovXAVqJzCVf9HwqlS/mhE3vRB98jlJbYbQXo6iqyZt
	33670e1EEYC+j1ZboLTfZL2yP0G8nMIAh9Uw+nYwmS9rHU0dQgNPDyX7s9TcwE8rG0mqc4
	IZNgUPccMjGMVXdlNYBdgZfKgdeUTERLpus4QoND4bBlkEdUkScBjI87gwWfZfmvoIob5M
	ISuI+UPYVfdCkIxBxeNJJMyqULct/YPX5+9nQitUcPzibSqfrmSM51843NOeFD5WbMksgg
	9wkrd5k7dXljYESulF3dTqSWAPTPvZhKv2HTculnfqwS288pgbgRzg/thiKEXg==
From: Lukasz Majewski <lukma@nabladev.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Lukasz Majewski <lukma@nabladev.com>
Subject: [PATCH v4 2/4] dt-bindings: clock: vf610: Drop VF610_CLK_END define
Date: Thu, 29 Jan 2026 10:54:40 +0100
Message-Id: <20260129095442.1646748-3-lukma@nabladev.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260129095442.1646748-1-lukma@nabladev.com>
References: <20260129095442.1646748-1-lukma@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The VF610_CLK_END should be dropped as it is not part of the ABI.

Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
---
Changes for v4:
- New, separate patch
---
 include/dt-bindings/clock/vf610-clock.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/vf610-clock.h b/include/dt-bindings/clock/vf610-clock.h
index 373644e46747..c91fb86fa9a1 100644
--- a/include/dt-bindings/clock/vf610-clock.h
+++ b/include/dt-bindings/clock/vf610-clock.h
@@ -197,6 +197,5 @@
 #define VF610_CLK_TCON1			188
 #define VF610_CLK_CAAM			189
 #define VF610_CLK_CRC			190
-#define VF610_CLK_END			191
 
 #endif /* __DT_BINDINGS_CLOCK_VF610_H */
-- 
2.39.5

