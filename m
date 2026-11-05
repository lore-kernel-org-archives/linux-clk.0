Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.92.40.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876851;
	b=2LZhvHh9c0gCshM9MjrNBSIfJRjj3PNTTYmLUcYa4cXwzdc1xVdT917rqZcwIpIt2kLy
	 ufGvv/+A5QSHLuHy5x6nra6IgGCnmqAS6JHLosdEx3voklxwzPnRVv1n1OmA5wUCcOx//
	 DxrnLwprb8mT7X449fEzhWco3KaXhINZBbHpNnvJj7LeX+Eit76Sld646juiu/W+LfDDu
	 mspn+JMgZyZuDq9TXn983WJY+77908r7FE/xwkVMaCdz0KVjy7DD9hX7HUvuaO8iIlIfs
	 rng7QX6nJ1wgYlcXrehzFEPXSjgbwJh+3APgv8ii0hm4CWcVbN6cFWXAnzHFXFnevMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876851;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=1cjL0JCpaDIHIZFe4xaYZge0ytMZ6yU98tvuRPdMz+g=;
	b=yexX1jkFfRBJRQ1Bm2LW1N8d60J9gKxgxEaQYTZWOB9PZcfBPkqgBE399oUzzela1VhD
	 nqTeK4zXoPY9fsmQHmcyCq5TB8T+ArCzJFTZ2JC+3W3oL636fyYT7LjELlSdlpiUjjVIJ
	 KJsk1UskQj6L1N2IVyU49VkAV3zxY1GpY8pYvo0ql5k1q8Jy6KOdbpvpNQJTbMNUVy6UY
	 rJpFJaP0CtSghl0DkiPHLrBy54ntmZ59KK1xvQ1qwdxdB+vXaGlnR2/Wd+hUp4k2Ipgb5
	 wDPImtbwdcuMYb4hewSpr1SYOuSi41pf5myFAMHi3mSp6tLTtGoaYcZ5uSKGaS7sWVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=thorsis.com;
	spf=pass smtp.mailfrom=thorsis.com;
	dkim=pass header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=knrI72jy;
	arc=none smtp.remote-ip=217.92.40.78
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F775606D81D;
	Thu,  5 Nov 2026 11:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F775606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=knrI72jy
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F95F1496635;
	Thu, 05 Nov 2026 12:07:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1793876873; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1cjL0JCpaDIHIZFe4xaYZge0ytMZ6yU98tvuRPdMz+g=;
	b=knrI72jy2XsW8GAfy6cErSlBfoXL3yRP4sNgRDtKypmi2sI4ke8VGz9ZCyNjhg+Nzr1L7G
	hHaEFS4O2UTNnYeqA7VG8hXE7oDO4xMHIBM6YBe4hTsfdF3Bb2rGMe2sjDSd1j9QpzP1cd
	9WUsOemv7EEVN7eTkRZ6EwJLjcsbT793H4Itl6zMt06UZiRKESvHdTeGnjTUhLHlWh37Cd
	3VhD6nywiogQvtrb3Uvb62AVWrmGGy1WfbUR7RkkF7GF1LHwnklMkk385baTbb/I6sz0vL
	4VeWBRlisK+u3bgbcjwWETijl8xaoinS8u8z7j0sF9EAFrNgtJY+F22tvrz8Uw==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 01/16] MAINTAINERS: Add sam9/sama to (AT91) SoC support
Date: Thu,  5 Nov 2026 12:06:37 +0100
Message-ID: <20261105110715.2486432-2-ada@thorsis.com>
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

Will catch previously unmatched files in include/dt-bindings/*

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v4:
    - no changes
    
    v3:
    - new patch, not present in v2

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065d..3ca145c68e0e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3283,6 +3283,7 @@ F:	include/soc/at91/
 X:	drivers/input/touchscreen/atmel_mxt_ts.c
 N:	at91
 N:	atmel
+N:	sam[9a]
 
 ARM/Microchip Sparx5 SoC support
 M:	Steen Hegelund <Steen.Hegelund@microchip.com>
-- 
2.47.3

