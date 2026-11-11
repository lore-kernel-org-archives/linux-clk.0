Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387425;
	b=p1K6V8J1gGwhM/lY84W5F1c/CF9iNcp2O9e2Pc+wiBn9Ra69fz6/QzPTAhnCPEyE7yGH
	 oL38bpQRo+bJF1SqSjg8w2Nc4q3EemfRynelzlexh0TqxTqFB++UvO31M4eaiVUXAJeKv
	 /SuEm+lf5ABWLp7RQrWfO2UO2xGysY+hWmxbAHor3M48/fzCJZ6yjX7m7MR68y/wPZTMR
	 6ohBlo4+J0Kh+quk/Ebt4o4PlZw9bsx+0EATimO5OuP6bQ833dlfk1UV1z3YIhg8uLIAi
	 qb0PiATIAq3Lqo0ktfmJCKoJBQqcL03GmsvJzV1k4ms9Vd5Q6V5IYaOl8f57tNhAfrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387425;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Ca4JklKbmUPAZuKF/cxiCrQi6UVL+WjieUsmSP5loTY=;
	b=WyoD4DfTWtwaBMg9uScMZxhFEGarKCoZVOgeVwoz2Z+0+vbi/SSSMT7fPbE+6h68ZNjl
	 A9G8T8Ld/y718rr/iW/HZ/cQYX6M1+dj2XuPbKPfiGI6xah5HlO2kG8Ho0gruyRXdBcEj
	 aGrcfWcLCLwakXLwmmkX9rEQa5CsWlpQfN0bvztZhF+ZrnOlSw1IG3z04Z1tAUgXrAVbk
	 6WlSU0dhR+BJqz0WA+R1HJUlWUEaNx02c3SZy4W6AjWbsdR5HnRIIxXl7eZBcz6wVI9q8
	 eJ8pgiLWAckMUdLql50iukPY8cqMiDbf625O1iBxJQHe0IiITgryWjkoeKZelTogCXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF2560A2633;
	Wed, 11 Nov 2026 08:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCF2560A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1401:33fc:b262:f9a8:847e:6650] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xR48R-001TSi-2D;
	Wed, 11 Nov 2026 09:56:51 +0100
From: John Crispin <john@phrozen.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH 2/2] clk: en7523: add a reset operation
Date: Wed, 11 Nov 2026 09:56:50 +0100
Message-Id: <20261111085650.632025-3-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111085650.632025-1-john@phrozen.org>
References: <20261111085650.632025-1-john@phrozen.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reset controller implements assert, deassert and status but not
reset, so device_reset() fails with -ENOTSUPP. The i2c-mt7621 driver
calls it at probe and after a transfer timeout. Every I2C bus that
references an SCU reset, as on the EN7581 and the AN7589, therefore
logs "I2C reset failed!" and is never reset.

Add a reset operation that asserts and then deasserts the line, as the
MT7621 reset controller does for the same I2C block.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/clk/clk-en7523.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 8f63482cbb7b..eb893259d470 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -818,6 +818,18 @@ static int en7523_reset_deassert(struct reset_controller_dev *rcdev,
 	return en7523_reset_update(rcdev, id, false);
 }
 
+static int en7523_reset_reset(struct reset_controller_dev *rcdev,
+			      unsigned long id)
+{
+	int ret;
+
+	ret = en7523_reset_assert(rcdev, id);
+	if (ret)
+		return ret;
+
+	return en7523_reset_deassert(rcdev, id);
+}
+
 static int en7523_reset_status(struct reset_controller_dev *rcdev,
 			       unsigned long id)
 {
@@ -847,6 +859,7 @@ static int en7523_reset_xlate(struct reset_controller_dev *rcdev,
 }
 
 static const struct reset_control_ops en7581_reset_ops = {
+	.reset = en7523_reset_reset,
 	.assert = en7523_reset_assert,
 	.deassert = en7523_reset_deassert,
 	.status = en7523_reset_status,
-- 
2.34.1

