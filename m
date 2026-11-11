Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434266;
	b=eODYU+m3mmdKAfRu4d7zLUDrVro7p21GyVrUIKPDZ4GCARSfektPqPz/z8IXXstkfNYR
	 rIHOSi1aL5SRWwtr7MHW84+4pwJ37YqORd/CxTWjjHhLL1BFlk6BMXQy3heSKwK7Nz6Pc
	 a2q/SoEoQdHzse3s1nd44fcjW3os3nCkj1+B+VkgcGeky6CeeKdYMmlMkO7gmzhHcRkhk
	 4W6HpkBb41KPg6c/SkqbuRd2eI2InJ4A+MYVdSCylVLj/Cj81RPW22WeesIwmRFEXIdQJ
	 GiVrsArPRCSVSK+EvTG0c7mYgJfJUFeHzS+GamfBv0qYghfFRYs7b1JaICM6sjXIBhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CsB56uTJEJHrtz+2WjYnHjiy4+fXaZizurtR1/wh/6k=;
	b=422SIHAsI5oAMnvPCSVJkEC5Hn64hCQRwVR1x7VHJgFWRU2wOFJ7BvEs5T4u5vnzoya3
	 aImNOKTa2bF0uJ1K1ox7SO9TaiQ9hcs5eoXdCDfE6JiWBmWRme2acVJPkDEJjDhzcAB60
	 wokl9xngwYuXGcb2RhToNomDCmRGrARUUYRqikfFd2WPppbqYYqiCddxWyA2phwKuKJuU
	 VhK80fz+PAl6I+HVJlKKLvoGwAuAm6rl6RE188Jh9JYJRnRPqwkclYlOGW8esdrvUKYYH
	 Yk02iQsemZL99LlfYOSMykiZwJJoMUYdOkWSdA6me5j8HHhbO9KkBne7EAYeb9OTdVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rrVIh/Fd";
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8F860A380D
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 21:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA8F860A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rrVIh/Fd
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso2300812a91.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 13:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434265; x=1795039065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CsB56uTJEJHrtz+2WjYnHjiy4+fXaZizurtR1/wh/6k=;
        b=rrVIh/FdrV8ih1hGXt254oV79FoZzhocTRet+LuCZ3i9sYsg6p+u8oviKyhrfht0Rc
         sUWrD5vMUOiVIOWKbVngXvsNsYnNk/f5YUXMJ0JYhZKgUXEQU2mimkGc8UHmU5wp1ftU
         ooQ31v06a6Pb/+YxXeU6izgiJ1wqCOP4JRMtqxJ6dYDSwyEQ9dsLyu38XxJRbDwnimD2
         xb7CC4Jf9cQpp69hjgOCbvPdsYZF9QFGBVjmhUmfyo+e1iL+SlJuyKlFE+q6nF+ZiLfd
         R3WlcvUfeOIun4ydxcXV/PTz4IAnxeaPjqZX3JHef0iPI511canOs6fHg6KrqIX583Ak
         xkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434265; x=1795039065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CsB56uTJEJHrtz+2WjYnHjiy4+fXaZizurtR1/wh/6k=;
        b=hTk/phqUnfyoI8ddHzOfP9+mgKU+TVVy26Z6RBZOUNAGj+sDIK7G96UTFAhpoFgXGo
         9wncOnBDrCYPaATx6m+p1mPOWIxYU/J0K7MLwfrUrra2TVnwvJvPVvut56XbaY5Oj9HT
         bZWDoKMdERGG69on7sSesU7YtcpP82hqpcXUCDvvzruJTOJIVgy8H8wavJKbwSUAqPOR
         xjnHmtc1U2J+3/5xFqTFnWSBf1CdnRzhzTgi9O4Iwdl7ICnBJDltF+GTNSd/W3GtteGI
         vfUOJQYG0kcHv5FaX/w+h9oNwNgKOi89yTjwEUpOzxuiE2Lgi2fAa0xMB7aEC/GyIMNS
         n7UA==
X-Forwarded-Encrypted: i=1; AL+hErFH0RtI37OB6lcaMel1Cz8K7StUaS0v+OblAKLKh46IOT63+UJYtmtYc8wOPaHxH2SfE+u3zEQYJt0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4oZPNPKaCEggE+F5i7pSfx06WcDSSmBs4+9sOKgr512a1EqsQ
	XEyQmusVqxfHXO4jFzk5XPbI7kyE1n5QF8JP3UON0OUV8s8S4YqbP+Ct
X-Gm-Gg: AYBFou2L9Xr6mHnTpEMfDdbMWfgtB9uEs8Kn+VRqtFXQoftO2jWCQy+CmymrqEJAiKX
	PUUxB8oO2yVDORPqNAnhuoP+/Z+EL/JKTklceSmUkj0zc3soL4xS5SSyDPqEcsgGXrbkRt4kWO3
	Vhhsneqo3IDYMYIGszjlt41pOW9MjvuJaPemd7NOUVDPp6xq2pyscsLsrsvxF5+KLR1RaVhHBnC
	EFqM5fciobqA5JFwKHPu2aVTwieCNYHwmSVH2IuOVvknLvH6HUmO8kXvXOCSlAjITsZoMBoLgjs
	iOTRJI4fzWmCya4Me9NMBnSPzKVGZgfyEna6ajhsBOQrfv0ZosOV20T7DLcU+6LqIslrKwZb//3
	SlBhM91l4xcMI1eYLMq0/BQtQSvo1uoMaA1VdjjzHjSPsK4sUP9PPX+H2+OXpK++lPWEi9+8kwc
	aiB4wxW7S6vBEtsx0seHvX+wR1OSHYezFp3lKrGE9MSL5BDMNtCQNB8AQpikQDVFjJ/PYVuYs1V
	SWG0FctD4PP+mllwkB9yi4YKUKarYBvj5KPc4FvNrh8hlwGDjd42zqnv4eWM14kh8pwtkSi2CDj
	pKm1gupqHf5UA75KXLCg8iQKFlsgZA95OC8ha9akLhhK2KGRlc59WnjZ0Hc+LxRF3/5+67QKn2J
	9HSpnSzPa0IklFJijxOK9y+z/WCqDZUVwhyQvkBmW7j6Cn9oAUZ+weBo9g/YrnC/yDoTdsZ1sad
	GssLpTRYAqjD3Zn5At8FxvrIE=
X-Received: by 2002:a17:90b:2e83:b0:3a7:8350:3f7e with SMTP id 98e67ed59e1d1-3b182fe6fc9mr3518665a91.44.1794434264676;
        Wed, 11 Nov 2026 13:57:44 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce556dsm965429a91.6.2026.11.11.13.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:57:44 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 5/7] dt-bindings: clock: ath79: add the UART1 and PCIe PLL clocks
Date: Wed, 11 Nov 2026 13:57:27 -0800
Message-ID: <20261111215729.10683-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111215729.10683-1-rosenp@gmail.com>
References: <20261111215729.10683-1-rosenp@gmail.com>
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

Add IDs for two more clocks:

The second, high speed UART of AR934x, which is compatible with the
qca,ar9330-uart one, can run from a 100 MHz clock instead of the
reference clock.

AR724x, AR934x, QCA953x, QCA955x and QCA956x have a PCIe PLL, which the
PCIe host controller nodes need to reference.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 include/dt-bindings/clock/ath79-clk.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-bindings/clock/ath79-clk.h
index 27e31452544d..57d966ae9722 100644
--- a/include/dt-bindings/clock/ath79-clk.h
+++ b/include/dt-bindings/clock/ath79-clk.h
@@ -11,5 +11,7 @@
 #define ATH79_CLK_AHB		2
 #define ATH79_CLK_REF		3
 #define ATH79_CLK_MDIO		4
+#define ATH79_CLK_UART1		5
+#define ATH79_CLK_PCIE		6
 
 #endif /* __DT_BINDINGS_ATH79_CLK_H */
-- 
2.56.0

