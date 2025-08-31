Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDC1190685;
	Sun, 31 Aug 2025 10:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756637808; cv=none; b=OwdK3UAPLByuiTy56DnYBdfgJeT+9RN1F4HFV0YQlXFZ6pvh5uHTL+1D6PNpmrjFjUIyZch+WqJyOx8mNCbJklGZLxMGxnUepiDOwM/gXh4ZpWTfNgjE7eSxVXfC8Ti4vV4EVS9A6MBUFRzoTnaT6V6pag1Bo20moQqgg4Ydjw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756637808; c=relaxed/simple;
	bh=YzRRWyV6bE8vobZ2LTVx9a2gRLkpQFNliGHXFBZK+ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fC2CGzpyW3NK9GaUcXrpDUAjdoDu+t9wZ7lP9NAKLW+gkgw6+7bSGKusOPpEBWSoG1kAGb2ZM1sGeY9epYOcBPoHzdaB2Qx7oRXwfzi46DrEQzf97HUedwIAN7CypcR6cVhnBTR+2rT3m2WWQUylp8Vl8yU4zwgjtobKqAXmW2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HnZFdk8x; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HnZFdk8x"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-32326e20aadso3746804a91.2;
        Sun, 31 Aug 2025 03:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756637806; x=1757242606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zkrx1I0KHeK59HCjuGuKLaSLiOWoMbbq+JSXoCLeD00=;
        b=HnZFdk8xMY4skW5o/ExYeJ0U2nBHN/5Dis8lT2R0gAEgAoznaFJCK6Iob4vhwN9svr
         wC3446thoWyvDvsJPtyFCre/Ag/g+bnBTHy1k029peFbKyV5oEhN5lYIERy82W//6N/E
         QUjK+JdvbWHyDydYifawEx2lSEch9mStPI4NhDQONH1+D04gA3t2g6n6rOU+CSuJ6gFg
         HApp1Dr+VRgzukz/rOPRCXyEeKOgKscmenS16EyIaf30RAjfk1wrVIr1+msneOGti6Ev
         NfSLrhwnEiK5P2oNYJ68sqxukb6dsDr/6neFTvT0pxDQAhwmyk5MV7nflOpSsjQwP1bQ
         2fUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756637806; x=1757242606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zkrx1I0KHeK59HCjuGuKLaSLiOWoMbbq+JSXoCLeD00=;
        b=YWDdp/aJxBdtJTgh6bHicb9CDSPMPh4UNMUA6aje6Cb8GtqbEwr5W0/gN7fbFQ1t0P
         1gj/Yv3bdGpzXkbAV2MzgFHxJcZBreJaVNUa7pL/fBD7mv9+SgDvwy3+dMRinV0RT1HE
         Q+JgqDGLGNUnNbe+2AE7Wf8LerOoc0xjZsDgVbANn8/wViej0heLzAkbgAghyn/6oIHM
         dpZYLT3HFBkXcIZOBmKQazHQzyQQ/TlF+5ygYAGKV6TecGxJJPL+psFpji0LU0X0xVPp
         2TvKtXXBg/JVvBSBGyBNDeshWxXQXYXEOgzmxkdd1oPqmcpJnJhX12riVZgDWv1PGBOT
         l43w==
X-Forwarded-Encrypted: i=1; AJvYcCUxrbC74GpQ7LP67nR1RJsZcXWyEyGPFO7470WGl2Wt3yVvFNIFSc2z8o6xXqhp7oEVv8zmMWo3TGMO@vger.kernel.org, AJvYcCWhuHw2XBWm8C/twmNXW5hBiqj7p96FNkhv5h1q/4ZKK0p4J/gMaizOKHLxU2Ff/Z6cLwEoHSJZStT2@vger.kernel.org
X-Gm-Message-State: AOJu0YyVg/7j5eTzL7S88eGoFp7wqExjUfxYUZLd42CNwj66jajMFv3E
	nLrkmLl/fQ0XUkEQcnXyF63E7eP1kzPMGqvKeHA1RiacGZtwCKHwan4m
X-Gm-Gg: ASbGncvE9oVL/tobco9S284/kB1yFHhuzdaz/r6T0IhCpIuqru5GZLN6ZInuIt5P+BU
	2/WrZkUHPe44aJf7sQuDzVvR68pd1VGEoD1f0+PabFnE3N4+h822muvMeT59NKCSgDAOEOv4qLO
	VCFe3JinYZiWLvl+eOEePZOIRpp5F9FkCjF3dUnF0Y0QJOTqClEtY+0Y8dgZUEY4UgXCvejFs6s
	QS62vdY3gEKV3hBXfGiFfNhs5I+a9vur0BXlFLz5zZ3b6WophxuZ8Jwef8cZoEJWvPG+TD/vZpo
	Y/4xuUOrvPoLa8j8XoAI0QGCFQfW1QGCrzH63X9yo5AY+XAkaUrV+fHfvI4BLOKlTpVVlNWMA+Q
	Iy18iaWuROLutFB8Ekd4CR8Jlg7BRx2NivfhZI85cAgbF2MIUlQ==
X-Google-Smtp-Source: AGHT+IFKpeplLh4uLrvMk+zHJGuhr3o+bHub20dAlEwu8c3p/nYRP2DnhcBdxHUgO8wMnVubNgDUDg==
X-Received: by 2002:a17:90b:278f:b0:327:c9bb:be45 with SMTP id 98e67ed59e1d1-32815414073mr6055958a91.8.1756637806467;
        Sun, 31 Aug 2025 03:56:46 -0700 (PDT)
Received: from localhost.localdomain ([240e:478:1c78:352d:7cf7:15e8:f0c:9846])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd3669d76sm6638260a12.49.2025.08.31.03.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:56:45 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v1 3/7] dt-bindings: clock: rk3368: Add SCLK_MIPIDSI_24M
Date: Sun, 31 Aug 2025 18:48:51 +0800
Message-ID: <20250831104855.45883-4-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250831104855.45883-1-cn.liweihao@gmail.com>
References: <20250831104855.45883-1-cn.liweihao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a clock id for mipi dsi reference clock, mipi dsi node used it.

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 include/dt-bindings/clock/rk3368-cru.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/rk3368-cru.h b/include/dt-bindings/clock/rk3368-cru.h
index ebae3cbf8..b951e2906 100644
--- a/include/dt-bindings/clock/rk3368-cru.h
+++ b/include/dt-bindings/clock/rk3368-cru.h
@@ -72,6 +72,7 @@
 #define SCLK_SFC		126
 #define SCLK_MAC		127
 #define SCLK_MACREF_OUT		128
+#define SCLK_MIPIDSI_24M	129
 #define SCLK_TIMER10		133
 #define SCLK_TIMER11		134
 #define SCLK_TIMER12		135
-- 
2.47.2

