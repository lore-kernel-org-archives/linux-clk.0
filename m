Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17861552FA;
	Sun,  5 Jan 2025 14:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736088175; cv=none; b=GGPc9L/4S+ut9MxoOHXv4mQAdhSjrUTHpvsuoRy7Efv2rxcVx39fF4Um9J911nrLgMESHPn2z0HXIuEqziF10XfSNstjhwN63DBI5JMlYKY41aM4SQbn0qj6keBPHGkuJ8MgTjJsRgQYdwseDUcwj7ueC83n7q5Y1OKvxdpfBHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736088175; c=relaxed/simple;
	bh=7GIQqUjlMT5bgex6Ozz6WNE/20sFjJIoGKoZOcWPOlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qhRpcJSO7D9MoIU9ZrPLEGjTGyzOHe1G5jBmeY777Rz2rhEp0+UJsK+bjebsNUUeHCE1BY7ZJhJCLoZN5PRmnXD4urvPNRHlLzvolZrq7Jvq9fErmhI1uZEXaOZMpK9NTc5Io1VVPjjaFFO5apixEArGdoO4fGm661eA8m3jBVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SF8gTX7e; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SF8gTX7e"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43622267b2eso142849435e9.0;
        Sun, 05 Jan 2025 06:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736088172; x=1736692972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2d8+jeTpX799XdIAphX2pC/RY7vgNu0VjS1hTZC2as=;
        b=SF8gTX7eAtXMffrfwhV+kuORldJCwMq/ZqpzFwQBUxg66fBkHPTwVSiMGC1rK2HXtL
         buhURSdj+xeYafG+ZUjMGVTO06lad/txFKfyOMWxtekeqrruBFJyMzyfzNWiUuaFRDr4
         NbC+nhQPKgiEqUflpfsv2NjLPnUB1IcBHKjzzxWqMrdrh0QMNVlawzoTTHbgi2TuEXbk
         jvj/Y1fFhY3dtV6s3K0pV4T3nf3RsF/Xr8az44EJA0biDH09jPoH3YwkOgXofIADpUyp
         tbhFs/RX9xJJhI0OCx5OikFDcacyv7BNQJ5jXtzJchNBIV8G1veW2czaDgf7IvGHQmI0
         Roeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736088172; x=1736692972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2d8+jeTpX799XdIAphX2pC/RY7vgNu0VjS1hTZC2as=;
        b=s5x4a0BlBbBthJMpG3ggcMQEgDAK3D6M1lHX/3D1ZtQjm9Ef/BuolMwze3ufbMLR70
         daXeq2jyb4Rchd4Cg968fVyU0uwNZC9glwLv+aZeoo8tHn3rd2++3VeSUcfNlo/GutRh
         d16ZV8X8x1rlcrPRY/4s3JzLyHi+K6knDxxhP2X3AxK+o23jeg1qEHsJb3O+KmPACU2V
         9F/J0jm++mo4K87dSyxQBWzP9hj+AwmB7071hJzqCxYeWfriGr9iebjaQQzJwSuVr/pa
         2NNBy9cpmBGH1HcLBrGhlhVeWUmOx8iRJkl9GZnVaoqrrLKFMOemIJ3q7frPUBQak9H7
         4vXA==
X-Forwarded-Encrypted: i=1; AJvYcCXV/ctfcEIbfF5PQO3Dex8P6mHh1P2PLbLmhg66SpOIl0WCMTGdXSmLVLNig0yTZaR7xkz6aapaQ4ByNwQT@vger.kernel.org, AJvYcCXkomAzB0VyX0jtAFbRXdCfuB/Lrm2Pu/ONM5ZEvrl9GVEYZ3Srgb1t2X0h95pgzFH2/w7Oup7gBoqU@vger.kernel.org, AJvYcCXoVBFJEgTaeKMRGI4f6M5ys+BDGAgrA6x2c7QiecvfQ0bwBrU1IHNnONFj+tnp/H4hfymc/2NbjS6u@vger.kernel.org
X-Gm-Message-State: AOJu0YzERSLgnpQBiQtk/Naupf7kpnWfbb68T8sh+Bdlcrinwiz68CUq
	51BTdpwWgzT3bVw4fKMyprTWe8H94JclLYBMfQz3Y/COMMHUZWNg
X-Gm-Gg: ASbGncs2xfeWZT7icBg77kiPPNPV/0moiGJ16jTO/Wjyy9GZfhGvp2bbUwxSv942Hb2
	SbeZFNQDVekXbRRanrcN2zGxWIlxakLpEuyL2k3W+zp3P1/KPeU9fSrv/3Xh18OoQ1cpT0wlKnx
	rgdBGTXOpAhID5FGqDEvVG971BZgm1CAeXmS7/yCxP3qILguYum2cs48zeubXvhM8WGGiY3qrd+
	MJ7Ir17y6SZRdFUPdhLBIftXJALmHbrq+BIkjE5D43Z8f2Oz7aj7YhCdKuLCYnNQd07q4cCUA25
	7cvrM4CNIIaWvX7ohasBBboKQFGlEUrfxk7RGApvCw==
X-Google-Smtp-Source: AGHT+IH/ngJ/94qJYlVC0z68a2qrl9BiLG+fxJwepXTHF7UlB2BB81+aDyFpedZ38wpVf2/CAe1hfg==
X-Received: by 2002:a05:600c:450f:b0:434:f4f9:8104 with SMTP id 5b1f17b1804b1-436cf91aff0mr39676535e9.33.1736088172231;
        Sun, 05 Jan 2025 06:42:52 -0800 (PST)
Received: from localhost.localdomain (host-95-246-253-26.retail.telecomitalia.it. [95.246.253.26])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436611fc161sm537419415e9.10.2025.01.05.06.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 06:42:51 -0800 (PST)
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
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 3/4] dt-bindings: clock: add ID for eMMC for EN7581
Date: Sun,  5 Jan 2025 15:42:00 +0100
Message-ID: <20250105144219.22663-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250105144219.22663-1-ansuelsmth@gmail.com>
References: <20250105144219.22663-1-ansuelsmth@gmail.com>
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes v4:
- Move to patch 3
Changes v3:
- Add ack tag
Changes v2:
- Drop additional define for EN7581_NUM_CLOCKS

 include/dt-bindings/clock/en7523-clk.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bindings/clock/en7523-clk.h
index 28e56745ccff..edfa64045f52 100644
--- a/include/dt-bindings/clock/en7523-clk.h
+++ b/include/dt-bindings/clock/en7523-clk.h
@@ -12,4 +12,6 @@
 #define EN7523_CLK_CRYPTO	6
 #define EN7523_CLK_PCIE		7
 
+#define EN7581_CLK_EMMC		8
+
 #endif /* _DT_BINDINGS_CLOCK_AIROHA_EN7523_H_ */
-- 
2.45.2

