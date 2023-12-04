Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PnzWPAXH"
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5764A187;
	Mon,  4 Dec 2023 10:57:32 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6d857f6f1c0so2688823a34.0;
        Mon, 04 Dec 2023 10:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701716251; x=1702321051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jS34Td6ydiJu49ocw1zXulx/VuEOGYfI7vU1+EDroQA=;
        b=PnzWPAXHYt3LeXkZb4OL/l5BerD+0jX/oVOCBsrrVka+XMtK5QjiN4ZxAJc5mAepzJ
         KwZvwPTDYY1sy0AJ4nWISmyuW9XahSaTdL3o+HJQLLU428shcl4TowHON3AQvrK7rz5A
         xjKdGKQSJFowU3xCpU0U0JGnptwrbrylBWLEVFi47/ONDs4za2DIVcz3g/V3+Fu0xXPX
         tdbvp4XXCyC142lmntOebxUlzp7JesGev+pOfWyIaGTqnnnyW8YPS6AZxEfaDz9/ae29
         JcWGtA0XhKHuKmB8vc+o6oHTBDADs3ysrhsyXW9GorlGMRb7YYfj5dCoj8jAevPsLHgI
         QPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701716251; x=1702321051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jS34Td6ydiJu49ocw1zXulx/VuEOGYfI7vU1+EDroQA=;
        b=Qub0WqQbs3eJ+xr9jVJVTrJOGNI7+hXrgMe0KY5ZTVIw8fHML6Fo+8l/7GYJbxa9KF
         IRJH4AiyIEjaL2Lg32d3h6MBOERZ+5kmHI+XcExsMLZUTSXQf7KZVhnh4r367B+rncm6
         qOmdT7YwNZbjIv8CNm9RcquJBKirpJroInfOLZj5n0pG/bdUf+4oZlxzDkQuCl+0i5tp
         Z1tq6QsJX/vC6/aWnU90sfKY7k0YlV2+uYoqaWn2tmFbOA2++JzaBIB0phzvGAhVqSD3
         Td873ceownRtPf34tQa58FzFUQiiE+ukzxdVFgWW0IGNoFdHWe6RMJzjf38RZTc7kn6q
         9J4w==
X-Gm-Message-State: AOJu0YwwrBwHfVnz15YEdK+xLceA48WZ9SX7/mEOMKuniUt2ifxK4bu0
	DR6JbfnbPPSGTMsVw5EXmBv2ty6Hvxc=
X-Google-Smtp-Source: AGHT+IEUm8NisHgqn3y2rfnvd8YPgGCJGZWYz3Vvoe+MmLVG/2AgljpOpgZvYnOCvaNysMml8E1gGQ==
X-Received: by 2002:a05:6830:d7:b0:6d8:74e2:5d22 with SMTP id x23-20020a05683000d700b006d874e25d22mr4372548oto.75.1701716251596;
        Mon, 04 Dec 2023 10:57:31 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id y25-20020a4a2d19000000b00581fc1af0a7sm2073303ooy.28.2023.12.04.10.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 10:57:31 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	daniel@ffwll.ch,
	airlied@gmail.com,
	sam@ravnborg.org,
	quic_jesszhan@quicinc.com,
	neil.armstrong@linaro.org,
	javierm@redhat.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 07/10] clk: rockchip: Mark pclk_usb as critical on rk3568
Date: Mon,  4 Dec 2023 12:57:16 -0600
Message-Id: <20231204185719.569021-8-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204185719.569021-1-macroalpha82@gmail.com>
References: <20231204185719.569021-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

In the reference manual under "2.8.6 NIU Clock gating reliance"
it is stated that pclk_usb_niu has a dependency on hclk_usb_niu.

While the manual does not state that this is a bi-directional
relationship it was noted that the sdmmc2 failed to operate for me in
mmc mode if the pclk_usb was not marked as critical. The parent clock
of the hclk_sdmmc2 is hclk_usb.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/clk/rockchip/clk-rk3568.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk-rk3568.c
index bfbcbb744327..c4fa2375dbfb 100644
--- a/drivers/clk/rockchip/clk-rk3568.c
+++ b/drivers/clk/rockchip/clk-rk3568.c
@@ -1595,6 +1595,7 @@ static const char *const rk3568_cru_critical_clocks[] __initconst = {
 	"pclk_php",
 	"hclk_usb",
 	"hclk_vo",
+	"pclk_usb",
 };
 
 static const char *const rk3568_pmucru_critical_clocks[] __initconst = {
-- 
2.34.1

