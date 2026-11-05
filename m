Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.92.40.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884270;
	b=RcWXSFggRIOdaZa1jGW+UH634rGO1R3E+ifys28dazGcJz8df9qOl92hgU78snORUE9Q
	 w7K8Vkn5VmdwNrDi6mKufZ4jYiFqr38FSdWBGfdQ70qRMUTXboBEUwhTkFtXVGaw7h+10
	 ERl/zQZaXaKZQDzGIfqHYZ1Q3vADF5aS7KmEjoswxRJCrt09rQKjG2eHQmdDnG3xZer1u
	 vtjQEtgEIWLotBsMqfWpBLPNUg3xlbOJUNStifJlEQ+EB4MY+M+3rQPqSJVUPler8E3Q5
	 lOUKLyOiFMeiaU5hD6WrxyQpzvW9uCLbErHxQIHBvw4hPBGR6dRw4RsPKZB/lMad/Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884270;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=K1eZUXnvIe9BgiUSgLvU7tBvXR94fQjJ10/PgyPe++Y=;
	b=gb++LWJ3NyNl9UscRw9Ps/xRcYSc34zeRqkPHleekfUA8GsRd5V3sWXw8D4iS8y0F8qq
	 U7BAWBDwt/uR59T3Of1aBbhLAWre7Ln+rlry7gIM35Rref5GWAtHDxgqMMj04X5yQoIQh
	 HMncycVwhisYt4Q4zY51vlrS/1TCP3Pwmxoc2uVxCzsxwei9vaOr7pr0DxjAh1Ex2t6B7
	 gXmsrpol5iOErvo8AsFW6T41SsllNk+71W3UniNfhnlRzbqJbIJtce4E/sVXty+xEtC+8
	 jbdIXBek9QM/fB1WOlgUKlIcf8p/M8i2J2/IGpwa6+DkOEmEdJb5QAutp8H/x7uhM1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=thorsis.com;
	spf=pass smtp.mailfrom=thorsis.com;
	dkim=pass header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=ZWv03Xks;
	arc=none smtp.remote-ip=217.92.40.78
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13F5606A328;
	Thu,  5 Nov 2026 13:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D13F5606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=ZWv03Xks
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6538614966D0;
	Thu, 05 Nov 2026 14:11:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1793884302; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=K1eZUXnvIe9BgiUSgLvU7tBvXR94fQjJ10/PgyPe++Y=;
	b=ZWv03XksS5RMtIpZp76Cs5dyR4dnRiktzAQ/OCvrPA7UzhQNo7bSeyJmRkXBNbTcR2Tyvu
	mxULv/iEyFjBJVKIiIqNvZA/pDbZ8N4zhoIp16snok6HymHFka9NFFWcDm+sWLyJWCoTP/
	unaTRd6MclSO1OZoyfuUK8bkgcuuPiUR4CQnuv3DADR8CbT15IYzeuhDpNBtRG2hoZGcIR
	vGjdYE4zulfTosxhqG8na6zNp0WU4gov7LErA7Pq+JhR+nJ5I8q1NCdLHKIyNWeLCv2eL1
	w2XqMI4+NL1gcte3izGDl0nk6YldiKPhb4kTmXUJXm85QO/2u4b5UGPoM5n9Gg==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH v4 10/16] nvmem: microchip-otpc: Enable necessary clocks
Date: Thu,  5 Nov 2026 12:06:46 +0100
Message-ID: <20261105110715.2486432-11-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105110715.2486432-1-ada@thorsis.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
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
X-Last-TLS-Session-Version: TLSv1.3

Without enabling the main rc clock, initializing the packet list leads
to a read timeout on the first packet, at least on sam9x60.

According to SAM9X60 datasheet (DS60001579G) section "23.4 Product
Dependencies" the clock must be enabled for reading and writing.

Tested on sam9x60-curiosity board.

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v4:
    - Removed link from commit message and added Reviewed-by (thanks Claudiu)
    
    v3:
    - Rewrap lines
    
    v2:
    - Rewrite to enable _all_ clocks defined in dts

 drivers/nvmem/microchip-otpc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
index bf7e5167152cb..4286365686563 100644
--- a/drivers/nvmem/microchip-otpc.c
+++ b/drivers/nvmem/microchip-otpc.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/clk.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/nvmem-provider.h>
@@ -241,6 +242,7 @@ static struct nvmem_config mchp_nvmem_config = {
 static int mchp_otpc_probe(struct platform_device *pdev)
 {
 	struct nvmem_device *nvmem;
+	struct clk_bulk_data *clks;
 	struct mchp_otpc *otpc;
 	u32 size;
 	int ret;
@@ -253,6 +255,10 @@ static int mchp_otpc_probe(struct platform_device *pdev)
 	if (IS_ERR(otpc->base))
 		return PTR_ERR(otpc->base);
 
+	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &clks);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "Error getting clocks!\n");
+
 	otpc->dev = &pdev->dev;
 	ret = mchp_otpc_init_packets_list(otpc, &size);
 	if (ret)
-- 
2.47.3

