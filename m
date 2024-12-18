Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F036D1547FF;
	Wed, 18 Dec 2024 09:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734513143; cv=none; b=QXHPa7MQK0J8f/m+4hSMFNJTKM2i7bEg3isxLIiKTb+7YEJtsit+1Nl0bcXL1dI6ghVHoFJ1AfTN5+kNJdtJWFRO4xxOGJRll/f5scfQQC8AKX0LhrzRq48NkBPPJDnl1hFOeZaDKnbEgr88E7onXMs3V6MEg+P4fPYHmVgu+oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734513143; c=relaxed/simple;
	bh=fmQi5yW5kHCy1X7Iwo5JVwtqfOZ9e78/hQ+Y8gzlekE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YUjw1nlaRWK5LZnxaF11tsJaUyN4kpZbQZk8j0m+pG7CBnK4/97OMDlpfY0PMy+QSUoO8wIhfqtoKZhdU47uZaeAqVwv1USf8L6mgFYD0yQMZE39srk7lOOt2N2NYysXnPyxARL/fFxw1l9nwIQ4t/h3vCBgqdHhzX7UH/JX36E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OEcUTXQi; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEcUTXQi"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-432d86a3085so41397885e9.2;
        Wed, 18 Dec 2024 01:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734513140; x=1735117940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8D09SNzz+WyyXsaGNK5e8Zge6Qu66UIaee7FgqWdY8w=;
        b=OEcUTXQiMOKJ2nnqoKHRAjQFwn91HHhrHTpcs6aRpQ6ni9hy7ZVFt62XLM+rAAilQu
         pJCMMG07iD5iFfL9EYPaSNUzW9zqiePC7UHotNivpsQtLLrnYBU19D77ItszlUJTzxeG
         qlC2+9jWJJSG6llSZCckNrxc0DnP59YFK+vs1czl+emupSfSwTszAqxgQ2dHbpS0XTWe
         05WPQf+620HyVoHGV+/XGOa+jh4wqNZT/2KraBAfDdlLfR7Z2hw8eKWkW2qUfZjmKBoH
         SCyS71QRkIiXJp0xWy+cs4EkWTlsdcIG//AOBmg72zU4sEGFCw+qDlpunFZrQQq0wLCv
         OiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734513140; x=1735117940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8D09SNzz+WyyXsaGNK5e8Zge6Qu66UIaee7FgqWdY8w=;
        b=CSxNnZjfjsMvCq333VT/bUOIsKsvN3s0eCb+nnmkNkIf3QvGQl92CONaEzyJ5kAW4S
         WQgMdkMsnNCJpyJWlzJ2E5G4rogZWrLg6OCMoDyw9laPyDDLaX/5+INyR6wPW/yBP0pC
         sTGLo9S6+85I3/v6IAOTfEkIuJWhaZ3rxU/CMvgnMCxIYlgMmSlXxJVjwUsMyoKlnVxR
         IMaVJVMi57yLPt7iiVfASzbVefArgjUG/lZ0QXriX2AzCS3wBaUSm8ufhCKNI6PipNzE
         7ieZw2SvpbYIVNgyU95JrWFSM+8PRSfvbpN0lgHMtXLjRE+jyDpr3bat/dWhbFjdDXhP
         gT2w==
X-Forwarded-Encrypted: i=1; AJvYcCWspqAeMpG8StSVStWgG5pNJzgIWrhTyKxkCTlrFIqaIFKj4g4in60je8993iTetU7O7O43G9tOK2kM@vger.kernel.org, AJvYcCX0JlnPK16Ezd+HvxnY5uvDNw7YYUWw+GlzXkyVjQ3mCefjXXvXkJDA7x33K8l/yOHIvPeZY7OUXxTs2VDd@vger.kernel.org, AJvYcCXQeOcDE0PeMzDBRfTr4ZjOPY3sPxVZTkVCD26mXYkjKPOs6lk3UnDSoPZK5WydioFrgj1lqVuEZT2d@vger.kernel.org
X-Gm-Message-State: AOJu0YwmIrT/3/rjTi6FfCI9EElh5Ybv2m9ETTYbxRFnU2Kd/w0zaujT
	a077CbLQWLLdHjGGTI7TtZoD7fdEI1QlAiq4+cE/x97f6LaFdHBF
X-Gm-Gg: ASbGnctbWCClnmI4h9+EBtXMhs3CszImIKiHUn3lggNTaZgQNawkdbpoByePif75TXg
	+fPhoCrwcKNA+iNBYt0bpoJDPcMLQy0KinfTTCvW6zmeLhcqfJzHyyHk1T/NWp3D+JSYepui3AQ
	AG+O1BHoBJtHc6KMPViAXO33Mi2XrvL1rGHhNCDeGRJyPz6QODj2e/GmoDFJmK+yYyDsJPe3hQF
	ZvTHL+siFToYSnKcWd6gB+cBRvlvgKhiERIlzLAtpkRfET/ZBk3E/ELXClxbZUZacBlquM1V2QP
	ukxYSCwSfqPZO41PoXZbAB44kBEZTGdYAtkZn1wLWuk=
X-Google-Smtp-Source: AGHT+IE5L1P9o1kOM+MCGo4KPzvUiYxkBJO61jQ5RXtVJxZCx4aNlJyuPGKtiMrd4B3xboRKNBmj+g==
X-Received: by 2002:a05:600c:3109:b0:434:ff25:1988 with SMTP id 5b1f17b1804b1-4365540cfd4mr14336255e9.32.1734513139995;
        Wed, 18 Dec 2024 01:12:19 -0800 (PST)
Received: from localhost.localdomain (host-80-181-61-65.pool80181.interbusiness.it. [80.181.61.65])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-388c8012034sm13325339f8f.22.2024.12.18.01.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 01:12:19 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	upstream@airoha.com
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: clock: add ID for eMMC for EN7581
Date: Wed, 18 Dec 2024 10:11:33 +0100
Message-ID: <20241218091153.30088-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ID for eMMC for EN7581. This is to control clock selection of eMMC
between 200MHz and 150MHz.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Drop additional define for EN7581_NUM_CLOCKS

 include/dt-bindings/clock/en7523-clk.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bindings/clock/en7523-clk.h
index 717d23a5e5ae..c4f8a161b981 100644
--- a/include/dt-bindings/clock/en7523-clk.h
+++ b/include/dt-bindings/clock/en7523-clk.h
@@ -12,6 +12,8 @@
 #define EN7523_CLK_CRYPTO	6
 #define EN7523_CLK_PCIE		7
 
+#define EN7581_CLK_EMMC		8
+
 #define EN7523_NUM_CLOCKS	8
 
 #endif /* _DT_BINDINGS_CLOCK_AIROHA_EN7523_H_ */
-- 
2.45.2

