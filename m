Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC48261595;
	Wed, 12 Feb 2025 19:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739387617; cv=none; b=c7nEjvdH/hNJZcfyL/Mm84qt2mJqm/T5GyDBqMzaNSHu5/X5t7fogW0L27y0fx4oH0wJcKI22gq9YeZmUGei6XMJB+DdiMo7YMa8OjhuPjdQTE/moyfkYfgvG09Zy/1XY6jS8sDYSJ4jCj7dDl5EGZm4pgPM/kaNSzcP3IE4HTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739387617; c=relaxed/simple;
	bh=z0cvy7CoZI1KQjd1lQNEU+0uhGQkFuAbegW5RCbJDbI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gj7KNZU7Sk0xe5dMU8qJ8Dztv4xC7oR7B+CG9vaLoANljFe6WRm270lJILTzfHHuN49CCGqNFvZjcy5m+JlU3ulCF+tbbfFiRzRoE51LL6H/HS9a3IDReTfKoFsfYs9/Jns4gO9glLEBxvrgalhByCz6+FfE5+ZjNfYas8QyGvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRC080YS; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRC080YS"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2b8d6040598so36644fac.1;
        Wed, 12 Feb 2025 11:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739387615; x=1739992415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPvX1VZxCZTcUdSqmfcga5Y7Gcmbn0Y072+S0IfGY1I=;
        b=DRC080YS9ukTu8aa5HK3dokgxnPTC5AUdvVimqNxJrapcWpMpPDtzA7htoKUDQ2NMQ
         4BzE5riMP+LcugDqRwICb8tqrfeVmjA1jNE9denJaG195ubEKi3e5D4kcuPyVbdvkBmU
         Ki1qIb7F3OfkpDlO/CIsS3LhBvYh5ySanUDMgO/vg8yNjZLIDC3Fc+hAToLPeQQamHHM
         odWUcibqi9KUf6I+GqH1ZmmaOy4QU5EKaGdY8oEe1y+vXJ7cmTQNMQNvcsERYeovW5ya
         24qR142ljV23wCPGr9Zx4SxCJZQ1XWj/LS9ur8TOo2bRl/8eM0f+wHZd5JnthqH2cq6b
         QHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739387615; x=1739992415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPvX1VZxCZTcUdSqmfcga5Y7Gcmbn0Y072+S0IfGY1I=;
        b=dvEE5DY1/+1vwyw0GjxVy67hLVto1OZ3zHPZh5abNefJippt6v54XyxmcsPmovxcH3
         X7lIS4CrK5R1PAbRowxHTYY/ICwD5SZQO6HVbBGMjmsqlrBuzECx8Swgx9G7QGFYsPFH
         7tnjKf5/lJOFYJaIcjD+0MQ7Bk725a2JzQsYoyFT2NKon2hDZukHPfT0xzmHf02W2xZS
         zhX6uqgPbW+MRR0tgEdGLqhoNk212xHlnAMxDjMNHOQSr3/zqIwd6jyPvXUCAz/cy/dw
         ZBvaLv0vQaLazsh53dlXJ1qoBRy6LnXD74EYz1aNbRT263zv7GYjSJAXBBoDj8w8H+B4
         kYew==
X-Forwarded-Encrypted: i=1; AJvYcCWYeDucifQoklkWV3ov5kZKtjj3j+//UweupwTdCFI0TqhTVNsmCH/jbugvkCPtIxMTrWIRhOgBCV8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt3AKkjjaokxLp21Bdgrs1j3h2ckhs5PPV6OPFFaFuZhMvLeij
	cEzFKsw/SCWHYskIjzYVWW4bJf8Ycf9xmh3wgazN9EZmwwrQ1AlJ
X-Gm-Gg: ASbGncvmbCcZbd2f3q9GD+zqEOxswQDMN/LvDFmY4rDDG7RgyRira3CIEDz/mMaGf38
	TX8zDCaoNO8RQZ5H73O7t+53hOCt9+MSiN35Inr+aj+VgQhLXzmhBdGdMcp0V1WttOCFgeGeEmk
	JeaouaUdmpe2teXb2lEZCdyErs/50or2cusr3TQ2riaS+q1PLyrYZiCRpVCRS1WA27Ai0Jvk1/v
	8vO6fRfboOLYegd8KBEA+FnmipOzc9l5LtmjA0U5oKPelFIJ5nSaxC3EUjs+FdD3Wog2/viwJUP
	4qbrv98j1qiBfidRGXEKHNpWnDAdF/lNgQ==
X-Google-Smtp-Source: AGHT+IGLpGqe9PgZ1RGUz3I0EhcXiIfMGzPNXFezRNcSxivX+N1jbT87BMG4DvVt9YaF+ZUOOSmIkg==
X-Received: by 2002:a05:6870:f789:b0:29d:f65b:85fa with SMTP id 586e51a60fabf-2b8fb2379dfmr50404fac.10.1739387614885;
        Wed, 12 Feb 2025 11:13:34 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:511b:97aa:dc6:7ad4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726fd014926sm356033a34.32.2025.02.12.11.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 11:13:34 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	p.zabel@pengutronix.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	ryan@testtoast.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/2] dt-bindings: clock: sun50i-h616-ccu: Add LCD TCON clk and reset
Date: Wed, 12 Feb 2025 13:11:08 -0600
Message-ID: <20250212191109.156766-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250212191109.156766-1-macroalpha82@gmail.com>
References: <20250212191109.156766-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the required clock and reset bindings for the LCD TCON.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 include/dt-bindings/clock/sun50i-h616-ccu.h | 4 ++++
 include/dt-bindings/reset/sun50i-h616-ccu.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/include/dt-bindings/clock/sun50i-h616-ccu.h b/include/dt-bindings/clock/sun50i-h616-ccu.h
index ebb146ab7f8c..6889405f9fec 100644
--- a/include/dt-bindings/clock/sun50i-h616-ccu.h
+++ b/include/dt-bindings/clock/sun50i-h616-ccu.h
@@ -113,5 +113,9 @@
 #define CLK_BUS_HDCP		127
 #define CLK_PLL_SYSTEM_32K	128
 #define CLK_BUS_GPADC		129
+#define CLK_TCON_LCD0		130
+#define CLK_BUS_TCON_LCD0	131
+#define CLK_TCON_LCD1		132
+#define CLK_BUS_TCON_LCD1	133
 
 #endif /* _DT_BINDINGS_CLK_SUN50I_H616_H_ */
diff --git a/include/dt-bindings/reset/sun50i-h616-ccu.h b/include/dt-bindings/reset/sun50i-h616-ccu.h
index ed177c04afdd..81b1eba2a7f7 100644
--- a/include/dt-bindings/reset/sun50i-h616-ccu.h
+++ b/include/dt-bindings/reset/sun50i-h616-ccu.h
@@ -67,5 +67,7 @@
 #define RST_BUS_HDCP		58
 #define RST_BUS_KEYADC		59
 #define RST_BUS_GPADC		60
+#define RST_BUS_TCON_LCD0	61
+#define RST_BUS_TCON_LCD1	62
 
 #endif /* _DT_BINDINGS_RESET_SUN50I_H616_H_ */
-- 
2.43.0

