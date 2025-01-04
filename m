Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA4914A0A4;
	Sat,  4 Jan 2025 07:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735976446; cv=none; b=iF1bbCB6BxpWFw9JDSztVgjvH49QSLiHwUyud6X9ny2XblPpH89RFlMGidfCEGEWBMSfHkUCVwlNE9Q22EPkX5vrPiXf0/caLMWhS8qKs0P+LheeonVrssJDBk3K172WQQX45riw3AoXMpfSbniL61AYfkg06kX0ZWojH5fGV58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735976446; c=relaxed/simple;
	bh=RfLscubGTBY69+mRUuhbjHJSwn0LVQ7XlGs0ZPQCMek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nI/9DouNYV8F+BzfI7l38M47ILgrDWeD/jRjrqBdmNdYFaSh1145T8IdmIwc4RqyuAwcwWae2fX/aXYaLeKMJCjNV8wtZ59VOTWRIT743Qf75jFP1hvrDeCEPJ761YmuuGiQX99HbIyr9aqgkGej/6PKdHOR6kZTFrEmc2Z55SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAOG3q90; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAOG3q90"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2167141dfa1so177661985ad.1;
        Fri, 03 Jan 2025 23:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735976444; x=1736581244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0utCftucvwNjjKL9gp7cLeehqJP0aygJTF/mR/QXhE=;
        b=JAOG3q90/G2r+waI/ZAI5ZcNVFCGBYsHFk24bHBguB6kbRkntHToMFdH0jFFcKFUlG
         cf160Aab93yVijLuxmMupFdWA4zv/aJUQ/2QrZOXnr6Mfa+PVxY2rO1kb8hAaT/Yac6z
         mG1Ju+ONit0n31cMBkLHk24CI2mQqloZ0kQZxYBqvjL+7LGlcGmYGa6aqNoGS9reGNZn
         s1D1KGG5qOyhslCN1B3AxiG6bst/wmiCENuz4906Fj+CBbB+Rp4v1cKTs4q0RBjRB99O
         7Mch1gLTQ5qzAEtX8rKzKVxL23g6Iqst5iNjqiShD/l4Q3zJp7g6utX3Xw0lQKub3MqN
         YIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735976444; x=1736581244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q0utCftucvwNjjKL9gp7cLeehqJP0aygJTF/mR/QXhE=;
        b=WXniGKRJZ9ZCCtN22ER74522umSRcA8JcSeOgHSQdMssRqqYJhhchQZnBztROqE2Ek
         760Yt3XamPNG2I55U2H4BGhPNJZjuEmETRQUL4V5T/60h0xQq95h1xDr6yAIw7Y7dLvb
         BlhUF8LRm+/wx/2qiTGE+4ozJR8tn8EbARYzoVp6TD/5viRezW8kZL8dFtqHHMj9GxiZ
         +cvIImoPy51LeyWRFyPSdvJCVu024crTDscGnky0Qkjt/x0gNNFlmUVaKhb1PgP/SuMI
         RgI+9L45OWbG9iwQ59ba1zbsqsS0sbBlcz1E807iniIrChSifTgGO/FEz9/xAjDj2NK/
         14Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUjWJm+kznHDm2VF9qKzHInSClJ5fC/JQWUNNUOv22PNGhKMaBWifKiHRxSm6RrIcdWrR4uMwTi25O8WbiD@vger.kernel.org, AJvYcCV3LvxJ6peVnNfDdiaOTEzoQ8iwiCcG8bh05ka92hVuz4H+UAyWF2YlFs2C4XHMelMNA2mD1yPmDl16@vger.kernel.org, AJvYcCVxGd0vTcb+9AU6W3NNt2U7SNXsRqiiP9qhgiOdfVOzSVrYxr4M8mvW9+0yQpbZEzQdFuSL0ZxONAyR@vger.kernel.org
X-Gm-Message-State: AOJu0YwoqqkAbar5amAGcvAHQMm09taxZVt1ojyOG4mOpPrZ5DRXt6jy
	nhDfkYWgri5cx014eX2hE+E8LwyC39euQMI8wg1vI5o9K4FOMTwS
X-Gm-Gg: ASbGnctq2bGHupSrKnLQibJy2vWCpX/wOAF0BnSgmw8W3LGACXT1qrdnDd7Eywqueec
	V2hjwJ3E9qtHMd4D4usdY8nCK1q3nmqb0xZA3Q6lKu+1hoggrNzc+vTl0/ZF267LXiHhy/wSPR7
	O14ep45as+O5nnjhwBnBNa0X2ViXDzG1xJ9jgDPNaELtfPh08Pnk2D2jB9do+slo0aPSniN7TUW
	ZuOx/p7zfTfzVt5LqZYFFA0TihDcyH9DZ4yNNqwjuAaMbZeEw==
X-Google-Smtp-Source: AGHT+IG16aEsUt31gOxPdEHIOiEhly+PPdwAHUbVPWapyCabc4BBxAcFCsLxS2WeCaHdQrCno+H+/g==
X-Received: by 2002:a17:902:c408:b0:215:758c:52e8 with SMTP id d9443c01a7336-219e6cd83eamr662739295ad.12.1735976443882;
        Fri, 03 Jan 2025 23:40:43 -0800 (PST)
Received: from anarsoul-xps15.lan ([2604:3d08:7780:1ca9::398])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02b34sm256562565ad.252.2025.01.03.23.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 23:40:43 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Roman Beranek <me@crly.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Frank Oltmanns <frank@oltmanns.dev>,
	Stuart Gathman <stuart@gathman.org>
Subject: [PATCH v2 1/4] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
Date: Fri,  3 Jan 2025 23:36:57 -0800
Message-ID: <20250104074035.1611136-2-anarsoul@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250104074035.1611136-1-anarsoul@gmail.com>
References: <20250104074035.1611136-1-anarsoul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export PLL_VIDEO_2X and PLL_MIPI, these will be used to explicitly
select TCON0 clock parent in dts

Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
Reviewed-by: Dragan Simic <dsimic@manjaro.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on PinePhone
Tested-by: Stuart Gathman <stuart@gathman.org> # on OG Pinebook
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 include/dt-bindings/clock/sun50i-a64-ccu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/sun50i-a64-ccu.h b/include/dt-bindings/clock/sun50i-a64-ccu.h
index 175892189e9d..4f220ea7a23c 100644
--- a/include/dt-bindings/clock/sun50i-a64-ccu.h
+++ b/include/dt-bindings/clock/sun50i-a64-ccu.h
@@ -44,7 +44,9 @@
 #define _DT_BINDINGS_CLK_SUN50I_A64_H_
 
 #define CLK_PLL_VIDEO0		7
+#define CLK_PLL_VIDEO0_2X	8
 #define CLK_PLL_PERIPH0		11
+#define CLK_PLL_MIPI		17
 
 #define CLK_CPUX		21
 #define CLK_BUS_MIPI_DSI	28
-- 
2.47.1

