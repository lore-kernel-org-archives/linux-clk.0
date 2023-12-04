Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qo2DVEbj"
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F09A21726;
	Mon,  4 Dec 2023 10:57:25 -0800 (PST)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-58cf894544cso3215481eaf.3;
        Mon, 04 Dec 2023 10:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701716245; x=1702321045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m3EZHczOx7koya72sYXSi8rdiO9yIL2IVq+1IfTnxCg=;
        b=Qo2DVEbj4sKxe0B5KHgI8eMEwg8X1xmz/ltQcsmzuZn2YW6OLOUKcd2kG+1SIDGfDG
         aGpj+DOCTv3kZwKPQPPmeCtjJS8fC3v/65w9+rFtx07bzdU87sv6BWxk7Mb+hDOLWOLu
         lFbGRbSakbdzDLVeguo8nENQIQKzsPScH6BoOQtN3eXOjpqaXO06tBNhpsSwe9hv0eP1
         W1b9PajhXY/nlHMcrJxG1G4q9lo9xlDrrM9Kkd/r9ervi8Kpx29tLZi4pMMmHj9HoZmk
         Md8D8+T3t6jFZdJtp6PaTcgDDPCgQzXNEJtdw11xtYtKhv+BSfyXDdtuWeVs9chG7Ytk
         iEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701716245; x=1702321045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m3EZHczOx7koya72sYXSi8rdiO9yIL2IVq+1IfTnxCg=;
        b=dJky9vLpKICzYgfRroMt17zI9aQfRgc1Flh0LHImRaglYb7cZ5PdUcFWm3hVGughxX
         aHShP1A3//ZWhP1subpV3SQohAwOZo83lkOP06hxd9cTDJuxDSgmPG9kr870mk4KQgLM
         0USKkEO62Ee5e5uUOvFlccuU2IHymEjAh24PlGmzB7hbjCNqslN1ugp1QCzPn7vEuRQN
         bXTsChJYfidaZ1BS+OezQEXyL2U5AkXImvovCVW7r+Od8t0NsGTqSSbLDXf8aAycNkSQ
         7JrJQR3vn0hFu91qbAcZWrrqCLxhYsO22xGySpn8N3Ybdx4/v5fzenK7MNGDOJ/rCzp9
         m0Vg==
X-Gm-Message-State: AOJu0Yzx4Q8Fq2VXLx4Yd8YO2Hn6vieP4MpBALHtFwkOxqikhtoRBzLp
	cBTr4zRrSEUNQ0t4WwYeO6s=
X-Google-Smtp-Source: AGHT+IGsVHwRrAfqq4xLIPsN5oERcixtArTe5wxe1Vzbkpi/n7S980Z81B1TUUr2Z5wVehMBXeBH3Q==
X-Received: by 2002:a05:6820:2c03:b0:58e:1c47:76c7 with SMTP id dw3-20020a0568202c0300b0058e1c4776c7mr3120244oob.19.1701716245016;
        Mon, 04 Dec 2023 10:57:25 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id y25-20020a4a2d19000000b00581fc1af0a7sm2073303ooy.28.2023.12.04.10.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 10:57:24 -0800 (PST)
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
Subject: [PATCH V2 00/10] rockchip: Add Powkiddy X55
Date: Mon,  4 Dec 2023 12:57:09 -0600
Message-Id: <20231204185719.569021-1-macroalpha82@gmail.com>
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

Changes since V1:
 - Corrected a bug with the DRM mode flags for the video driver.
 - Adjusted panel front and back porch and pixel clock to fix
   issues with display that occurred after correcting DRM mode
   flag bug.
 - Add a new clk frequency for PLL_VPLL to get panel to run at ~60hz.

Chris Morgan (10):
  drm/panel: himax-hx8394: Drop prepare/unprepare tracking
  drm/panel: himax-hx8394: Drop shutdown logic
  dt-bindings: display: Document Himax HX8394 panel rotation
  drm/panel: himax-hx8394: Add Panel Rotation Support
  dt-bindings: display: himax-hx8394: Add Powkiddy X55 panel
  drm/panel: himax-hx8394: Add Support for Powkiddy X55 panel
  clk: rockchip: Mark pclk_usb as critical on rk3568
  clk: rockchip: rk3568: Add PLL rate for 126.4MHz
  dt-bindings: arm: rockchip: Add Powkiddy X55
  arm64: dts: rockchip: Add Powkiddy X55

 .../devicetree/bindings/arm/rockchip.yaml     |   1 +
 .../bindings/display/panel/himax,hx8394.yaml  |   3 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3566-powkiddy-x55.dts | 926 ++++++++++++++++++
 drivers/clk/rockchip/clk-rk3568.c             |   2 +
 drivers/gpu/drm/panel/panel-himax-hx8394.c    | 180 +++-
 6 files changed, 1085 insertions(+), 28 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dts

-- 
2.34.1

