Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5YLjf4M"
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 888FC10D9;
	Thu, 30 Nov 2023 07:56:41 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6d7f3a4bbc6so616176a34.2;
        Thu, 30 Nov 2023 07:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701359801; x=1701964601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yvbtfdc0ukYgjaMnQaR3gnU2LYirrG4L32lYa3jmGOs=;
        b=Q5YLjf4MD9ZZlxFd/+uxbExVYRTpVt5P3ZnZZKbLHbSuTnm/JgqZejEKAcFxtLzqPu
         sZumIH1rMBpK/06P1KW1/RlXDIzThkkfEV4s6QfTHsrBqNuhlffW/sK/2hTwdzh1cxsF
         qlwuGQ/9UtIhh9QbUBUkBgbn4zAYHYUdewAqP+bPtSGIFK8PMm7BNnQz7lUCnoZPvyC6
         ARgJ1VsMjygYvirTHOVHSsfJ8+LaY/+btwy9C+/3KiNlwWffxrxFX0x0tckg+fv2CplT
         vbKqf5+RmPKbWN06vzFCLAU5zsITxiokUT3acxU6VhT9+6qme3w5/XfDWiLYsvujjekc
         6U8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701359801; x=1701964601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yvbtfdc0ukYgjaMnQaR3gnU2LYirrG4L32lYa3jmGOs=;
        b=cOsYv/ZiuuGiaZPj0X4Liq33Yru5y8tl+KvK/v+Dd95XKMi++9ni4mFuVHAxEp+U1b
         K7BLfFlzxBBJvcKp0drtxB9KCAiTgslIyy9yZhDCRccRgEj1686UpVNac6eCvYMhtRjo
         rzFya2672tcREATTu7uGuzpiMyasSye4rU6B5ou7Ri0Gpp//9I1t6Lj93Q0WbRcbLEON
         xW8CX2LFAtbYT8AJoFUu+rUyfSZhpNCARuiXM1eikdjUTpTaAsKl6IJmX/ypw0bLps0M
         Z2glwI7GpQ4ZvCdsK8P1QpQcYsvSfonx8ewPErpyAzBhsYF8ev6rHHbMt+uvSfT/9xVm
         KwEA==
X-Gm-Message-State: AOJu0YxC+O05WtcUEDoBbjVxCD13cVk0ZUrwu7AYL+DXHm7vpDuxpEQ9
	J4M1pE9zmbfQzNTdaH0aApKAqojoCZA=
X-Google-Smtp-Source: AGHT+IGsSEdgmXvkMLWehieUnhkz5DRkyYhpKW9XKjn9lAcA+W/k0ia8pgSLGSBCNZTbWh63UjUhNw==
X-Received: by 2002:a9d:66c6:0:b0:6d8:480f:7abf with SMTP id t6-20020a9d66c6000000b006d8480f7abfmr8615169otm.8.1701359800828;
        Thu, 30 Nov 2023 07:56:40 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id n25-20020a9d6f19000000b006d7ff27a47esm187852otq.77.2023.11.30.07.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 07:56:40 -0800 (PST)
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
Subject: [PATCH 7/9] clk: rockchip: Mark pclk_usb as critical on rk3568
Date: Thu, 30 Nov 2023 09:56:22 -0600
Message-Id: <20231130155624.405575-8-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130155624.405575-1-macroalpha82@gmail.com>
References: <20231130155624.405575-1-macroalpha82@gmail.com>
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
index a8457b17bc41..0e0b7b396682 100644
--- a/drivers/clk/rockchip/clk-rk3568.c
+++ b/drivers/clk/rockchip/clk-rk3568.c
@@ -1596,6 +1596,7 @@ static const char *const rk3568_cru_critical_clocks[] __initconst = {
 	"pclk_php",
 	"hclk_usb",
 	"hclk_vo",
+	"pclk_usb",
 };
 
 static const char *const rk3568_pmucru_critical_clocks[] __initconst = {
-- 
2.34.1

