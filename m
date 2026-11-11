Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387422;
	b=G9CxaHNqxr/SIseHgm4WlJQkLVdzKv+RUCUsrtT/a5SnuPBFAlF4xpZV93IDNTs2qo/Q
	 kkNVfEOUkehvSJ5q2ZPZ8N4fkrogD88Bs/PRq8q/wyfWOq0Vl5Ua8Pml3HsTY7+sNhP/7
	 4w7RYBwEZ/BoNNpRh1PNRfik9W3C8/wfHp5Bwjcysk9Zfyl5ejmwSUqdOHxFkQwC7wRP2
	 DTSWGWvqbCkvj0MDys9fTfNlPWsdTsALbl3lPpgPp9iXPeDDNNyZ4HQKbDHkh5VUt8/C3
	 7h2gDFuDNl5/9ZNx22hja53WIxYAbkuMNciR/zM9HxX1jyyIJdvCQCkZ/Zi7lmho6nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387422;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bq4bq0oT90GXoLgNGE/Tu4QxnayujsmVrhNZxOI8hIY=;
	b=hASWZSx+kfLeDr1sEWRV8Zs2XhyjfJpgiS40TkLweSOCJkvZH/4j06WdaEO6+v21q9kE
	 0PCMwmeXcj9a5iuxOQxScyTw2a4CRLkjqtWY57jTFze9QV8KLy2aAcrizK1z3zijEnyN1
	 F7o/AObiAGfmiW3lmX6x1SpfJaHjcNN2ivEzoRMiTpd1Vi66M1cp5KUIhXjUmBoXfI4Rw
	 DyySJmUjbXqC3TA5NvFIJatn1E2HCnwqPp+BULrqoRFT0vW2G9tgoy6AGv4IJ0I9jPFon
	 9F8icyov9sbZzO+q3jKUT8JOdmsUJiAGEdxxy/yXUo0YJkxLuokIHhRZv4LDA3vsXDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C0760A2609;
	Wed, 11 Nov 2026 08:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34C0760A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1401:33fc:b262:f9a8:847e:6650] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xR48Q-001TSi-38;
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
Subject: [PATCH 0/2] clk: en7523: two fixes for the EN7581 clock and reset driver
Date: Wed, 11 Nov 2026 09:56:48 +0100
Message-Id: <20261111085650.632025-1-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
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

Patch 1 stops en7581_pci_disable() from sleeping in a .disable callback,
which the clock core calls with the enable spinlock held.

Patch 2 adds a reset operation, so device_reset() works for consumers
such as i2c-mt7621.

The series applies to next-20261105 and has no dependencies.

John Crispin (2):
  clk: en7523: do not sleep in the EN7581 PCIe clock disable
  clk: en7523: add a reset operation

 drivers/clk/clk-en7523.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.34.1

