Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxiD+wEm"
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 752161BB;
	Mon, 27 Nov 2023 10:15:08 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a00b01955acso654826466b.1;
        Mon, 27 Nov 2023 10:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701108907; x=1701713707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6EbGi5KYgfVG1CdJuzlcMAvljT6psfhah5arWG3Clc=;
        b=HxiD+wEmUMJ3X8IEqrcg7JnnbnQ9GS17iOVFO2IGGHuF2qGjgzyGEULtyv7GGda6NC
         wAPYXnscFPt8I0fFjACIVeX+Fr0aGJ8LTz/Y+2NtFudqkAuhcDThangxygJa+rYpDGuJ
         TL+Yl1gDpbSrd+6ac5Md8GFADYrjjblPRo5rpzOw8o1uTKVb0I/J8+jvgm5sC8fdxgnl
         asT4M8dlfKprmygbD7L9eEq4kh9p0NSN2THXCIRMmjlf2J79F+EAFksyxGvhqPTFoa8Y
         TXPcq1P7bxk24qhjLcuVGR5w6RbtdTdYyiTRdVyvcMSQU8cAkcNXSNTjZ7LYjvbiJXkT
         levg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701108907; x=1701713707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6EbGi5KYgfVG1CdJuzlcMAvljT6psfhah5arWG3Clc=;
        b=fgv/XuGvFTWwPD4GotaKCYOn4LBSQB7nVjBc+l4PovzTYerB5y+SH5mpxtm1uS/KMS
         oQtFWuyJ9S22zUcMKRx3KAdw5XMylt9Ddltkwqa10UIr11gEEF8s4qbE3amu1AyglsDv
         MHlnbNabKYJsUISf8PVKguyUs2tsm7f6/m9p0fNuo8yqWH9dQ+2UThhcFLivDIZHkKbx
         W2imFyy6yTE2n3m76l9QPfwjbikWC80ZO0ytEagw/D+hv8+eUTjGxMjZ0A0vgaWB61fb
         FsQzV+UPMc3o6kUCGAUpCzkOXvRAMVrK1qacLUCdbq2n/L6gf5XO4RRO7rXcSaUhRVz6
         oAtA==
X-Gm-Message-State: AOJu0YxDpcHMaIV/MWj2zD/KrUoZeg480d395LB0gxUt1ejFeb4x2vPq
	VjcYsRyCihR0PjkCVFz/PQ==
X-Google-Smtp-Source: AGHT+IFDKpCYOvpyu5bhY+/rib0MinbIHsR2HWXwLD7BBCXHji0tHHN2u1zt2jvfC/UPg9cKtem6Bg==
X-Received: by 2002:a17:906:d28e:b0:9e5:cef:6ff with SMTP id ay14-20020a170906d28e00b009e50cef06ffmr10355980ejb.33.1701108906794;
        Mon, 27 Nov 2023 10:15:06 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:370c:d8f:2dce:7367])
        by smtp.gmail.com with ESMTPSA id dv19-20020a170906b81300b009a9fbeb15f2sm5952271ejb.62.2023.11.27.10.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 10:15:06 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Elaine Zhang <zhangqing@rock-chips.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alex Bee <knaerzche@gmail.com>
Subject: [PATCH v3 2/2] clk: rockchip: rk3128: Fix SCLK_SDMMC's clock name
Date: Mon, 27 Nov 2023 19:14:18 +0100
Message-ID: <20231127181415.11735-6-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127181415.11735-2-knaerzche@gmail.com>
References: <20231127181415.11735-2-knaerzche@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SCLK_SDMMC is the parent for SCLK_SDMMC_DRV and SCLK_SDMMC_SAMPLE, but
used with the (more) correct name sclk_sdmmc. SD card tuning does currently
fail as the parent can't be found under that name.
There is no need to suffix the name with '0' since RK312x SoCs do have a
single sdmmc controller - so rename it to the name which is already used
by it's children.

Fixes: f6022e88faca ("clk: rockchip: add clock controller for rk3128")
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 drivers/clk/rockchip/clk-rk3128.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3128.c b/drivers/clk/rockchip/clk-rk3128.c
index fcacfe758829..22e752236030 100644
--- a/drivers/clk/rockchip/clk-rk3128.c
+++ b/drivers/clk/rockchip/clk-rk3128.c
@@ -310,7 +310,7 @@ static struct rockchip_clk_branch common_clk_branches[] __initdata = {
 	GATE(SCLK_MIPI_24M, "clk_mipi_24m", "xin24m", CLK_IGNORE_UNUSED,
 			RK2928_CLKGATE_CON(2), 15, GFLAGS),
 
-	COMPOSITE(SCLK_SDMMC, "sclk_sdmmc0", mux_mmc_src_p, 0,
+	COMPOSITE(SCLK_SDMMC, "sclk_sdmmc", mux_mmc_src_p, 0,
 			RK2928_CLKSEL_CON(11), 6, 2, MFLAGS, 0, 6, DFLAGS,
 			RK2928_CLKGATE_CON(2), 11, GFLAGS),
 
-- 
2.43.0

