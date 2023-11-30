Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KA22Zx/y"
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC41E10D0;
	Thu, 30 Nov 2023 07:56:36 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6d811615efeso671003a34.1;
        Thu, 30 Nov 2023 07:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701359796; x=1701964596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TvmqJO0ppzl3rJXfbHdcHrgR5dQ8u3NxPpJslKQqqYw=;
        b=KA22Zx/y62DSGy7H16ukGGo/9fl6MD3mu1ECd0591zngDlAWqDpuT28pBHPXf87hBi
         D7j7LqfJXhn1rWNatSHes93ULQCY4izmqK6LXh9lpoU6+IPyci77RbOjS1hO/bF3Z4X2
         cm4gfBwBkP5L9wv7ft+JyZQah8LEGbJb6+byV+Na34WG3+GdqfCQ0fOviq435sNtjgLS
         nVWNUAegw1PLZfm68SCwyDwqHftZPm0yrDiJK9ksiPUiLMUYY1wt9+C5Sr8WpiXHXlvR
         WrVDudHVCB7V6A/MHPFTfel3nAoqcuABfz6Kd+vwOwDXoAShhJq3dQNLNVfLD3kPgzOp
         M8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701359796; x=1701964596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TvmqJO0ppzl3rJXfbHdcHrgR5dQ8u3NxPpJslKQqqYw=;
        b=H91qKE6fr9yUl0HRPpUlgxU/xg6NhyNKVJ76UZCy5MVj3f4I6xLmAYze9bzxfWxfcc
         svfZsjK+FoGW9pnoGiehrOtoqLZ5hk+IcA/bs7lMbMa6GgVymPfBFHTev4dDMURKVXXS
         kaf4Gmci2H5fgSViZsBRloULl6gRFse3Coe3maFJQ0L2+feT2xX4nr8/PUopzBhGJ+IU
         XlXWLikQyi44shUrO0mzezksy4QnmaAak6KcfJMGnywPk+ScFoPc9fq0iERzkvArpSxq
         GYlFY3n7dwnkLiqFPnP0ODx7B2H0I0RErjPnoQd2HNe99mf0LXl59n5cBd0H5EHhjE5U
         km4A==
X-Gm-Message-State: AOJu0YwNpGXjFwgZaZ8HxBzVwhnwS/EHnl0QBS5KleCx1APCf8gd1nvG
	Hu579nhCIcyX9yO/gYEwqyY=
X-Google-Smtp-Source: AGHT+IGETl/gTp4AkG0pVc3uLa1QNZZM4WQtChA8x1bd0u1DJ9TEu3j4YaOt3w6rwoz7iauW3gsExw==
X-Received: by 2002:a9d:7416:0:b0:6d8:17ea:e48e with SMTP id n22-20020a9d7416000000b006d817eae48emr16937254otk.30.1701359795998;
        Thu, 30 Nov 2023 07:56:35 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id n25-20020a9d6f19000000b006d7ff27a47esm187852otq.77.2023.11.30.07.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 07:56:35 -0800 (PST)
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
Subject: [PATCH 0/9] rockchip: Add Powkiddy X55
Date: Thu, 30 Nov 2023 09:56:15 -0600
Message-Id: <20231130155624.405575-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Rockchip RK3566 based Powkiddy X55 handheld gaming
console.

Chris Morgan (9):
  drm/panel: himax-hx8394: Drop prepare/unprepare tracking
  drm/panel: himax-hx8394: Drop shutdown logic
  dt-bindings: display: Document Himax HX8394 panel rotation
  drm/panel: himax-hx8394: Add Panel Rotation Support
  dt-bindings: display: himax-hx8394: Add Powkiddy X55 panel
  drm/panel: himax-hx8394: Add Support for Powkiddy X55 panel
  clk: rockchip: Mark pclk_usb as critical on rk3568
  dt-bindings: arm: rockchip: Add Powkiddy X55
  arm64: dts: rockchip: Add Powkiddy X55

 .../devicetree/bindings/arm/rockchip.yaml     |   1 +
 .../bindings/display/panel/himax,hx8394.yaml  |   3 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3566-powkiddy-x55.dts | 926 ++++++++++++++++++
 drivers/clk/rockchip/clk-rk3568.c             |   1 +
 drivers/gpu/drm/panel/panel-himax-hx8394.c    | 180 +++-
 6 files changed, 1084 insertions(+), 28 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dts

-- 
2.34.1

