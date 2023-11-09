Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDA11096A
	for <linux-clk@vger.kernel.org>; Thu,  9 Nov 2023 09:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YuVgd8Gz"
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA03F2D77
	for <linux-clk@vger.kernel.org>; Thu,  9 Nov 2023 01:00:26 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5094cb3a036so727189e87.2
        for <linux-clk@vger.kernel.org>; Thu, 09 Nov 2023 01:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699520425; x=1700125225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CvmOEb1ckbbB9zBBB0o82fMDjd1uz7C5pNwKHHdJSYY=;
        b=YuVgd8Gzc41JIRQcZkvYL5Xz0gEZJjhQmxmsiqaB/LDWyNxPabWJf+TspVCUjFtRNN
         Fh8zE0xQrWrB15fLZdYYgjuJr5HuD+cLXnBHH+eJXMWaipYgViXw116e0d53CWTarS5S
         xK17cllJOwqc8GxEXdzJ74XUwj9d+/P8dXhdvQNNxJ5wLJKlXvQFgkUY8ba4Wz5h24u9
         QAaqzaGn++ggHwmrqti0amLMS6AYbZWNtaRnGYMg1t9LRQoClnK1x5stiVg4hLynb4jV
         SgT9fiBemyp5d67ssSrHgQPM4//b5bT5XsNbNkjlDUD4pfYsUfuOX8c7+/OQFICaiPtG
         YKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699520425; x=1700125225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvmOEb1ckbbB9zBBB0o82fMDjd1uz7C5pNwKHHdJSYY=;
        b=HATJHTUFUQ086yT+3r/vThZsB4p6N093NH0k8G1jqQlHjJJxkZ3UjTvFj9W8qfyokN
         /abfN92Mgz8wUcOa0pTHMEXMO/tmxekvhSyHJWipRgtSDFIHqNoTxBvIcbifrWcdqrn4
         6nX1aA+jLcFuiOoAxGoAz5vbIQDTKpFILD0UdC51H1H2pINaQ6kSbmMdaveMGCrmd6K9
         bnW3q7xFQqczbgnl7xaGPqeTWJpwHyuOvmKKFmlRiCCjRICLXS2IjNuJ62px6jC06lQk
         HlvhDZIj/VEB9kYa1lOcJ17pqN7ioGty8ZO6ezGdrYF8Vi3Ulpi/AFtqJJOAqQqm7eLs
         /hNw==
X-Gm-Message-State: AOJu0YwYf13eG+9mE8j8XsxrKOEG6AImmmp7R5/Cn0CylJPoa9QStUr0
	/h89sI+jU4SRQ/pZozVrPEn9ln65VA7JlxezLLtgSQ4h
X-Google-Smtp-Source: AGHT+IGXqF7rsRdCM+jnVRiAOt/RFNLh/BPKYViJgYib8D+5TeLhy81KbMIITHU+3iLnWSKCwHBgfg==
X-Received: by 2002:a19:7908:0:b0:509:4b04:6331 with SMTP id u8-20020a197908000000b005094b046331mr865761lfc.55.1699520424824;
        Thu, 09 Nov 2023 01:00:24 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ay36-20020a05600c1e2400b0040472ad9a3dsm1428484wmb.14.2023.11.09.01.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 01:00:24 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Nov 2023 10:00:10 +0100
Subject: [PATCH v8 09/12] drm/meson: gate px_clk when setting rate
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-9-81e4aeeda193@linaro.org>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=6wj78w5SzMRVYfTnHYpi/keB3/pw6jAwnhprIG9LUDw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlTJ+Z5DW4LqZNMoa3WMtTQHFwXqgZtKvOnapnqjBc
 XjY70PqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUyfmQAKCRB33NvayMhJ0b8BD/
 4qh7M6HzQXLHJtRURxnlOaG9F4oa8yHB8C3zne8wFXHXAzpEyuOgUsfQbYZdJ/W6aLUUqtjz2U69ln
 Y/l2+MK15fZaKRgdI7irQPXCvywUoXrilkjUAMJs/tRxO22tPDTfZz85GYpP5+cZps9ktRitls6wYq
 7JpWIRjMgijfbYm+J9YYYgTkjuqdyrm04HY2Kq5X8JURjowxDXuuZZ+OsPOfZVKgimlwLg9dGJhSbG
 7n29v/jdbcNnP9CK797lllMU9n9ynTMVXfGx8x0rXniM+qEjosu9w/TGJLy1TfcuY54BzVSQ/amfP6
 1pzZa/mqNKpGUmD4ehEkFAQ5RaUEtuPGvK3mrT2p2PW5PM2VPjYXVI3bUpOfDh5RbeWKK1Y7s4KK02
 03UXzUWRmzXoiUj9wN+MM99wBbF+BYndZvG7mWID3eD2Nlozxn8IqsFdFCPaNNLpQk6wmujhMtAvEK
 dHpHXrGJFfU9Pkrdasyt6L3mJu8elLjk7U9OrLJn8eHpFiTMcWpeexwqh4Scs3e3xpK5vCoC2nWQz/
 ZJqyJowaiDk04eQVFscV8y16xXAOt1Qz4RpalktRwQvCXfxHehWn6gLxNLzfhuAFtzcJWCrsd1Ag8b
 IAbS1A23BtxkuI3+WDf6pelXXBZwIqo3bvutoZVwON8abaKmoZIId0hHg3LA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Disable the px_clk when setting the rate to recover a fully
configured and correctly reset VCLK clock tree after the rate
is set.

Fixes: 77d9e1e6b846 ("drm/meson: add support for MIPI-DSI transceiver")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
index e5fe4e994f43..72abe2057ec3 100644
--- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
+++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
@@ -95,6 +95,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
 		return ret;
 	}
 
+	clk_disable_unprepare(mipi_dsi->px_clk);
 	ret = clk_set_rate(mipi_dsi->px_clk, mipi_dsi->mode->clock * 1000);
 
 	if (ret) {
@@ -103,6 +104,12 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
 		return ret;
 	}
 
+	ret = clk_prepare_enable(mipi_dsi->px_clk);
+	if (ret) {
+		dev_err(mipi_dsi->dev, "Failed to enable DSI Pixel clock (ret %d)\n", ret);
+		return ret;
+	}
+
 	switch (mipi_dsi->dsi_device->format) {
 	case MIPI_DSI_FMT_RGB888:
 		dpi_data_format = DPI_COLOR_24BIT;

-- 
2.34.1

