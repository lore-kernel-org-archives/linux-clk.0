Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52DE20309
	for <linux-clk@vger.kernel.org>; Wed, 27 Nov 2024 18:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732733285; cv=none; b=GseGNDAaCd3A4sop0Xx+wjvTLXesOmQRWGCiz2qTLEuzGRdp+jO5/g2f/pgGVlLd8aWi2bRhJFhuN2phg72VKeGHFObCB6LgSXYcPT/u50JxNoPxrni5fukVhTUgwk5BfmNsT0TkiqBPOEo/fQimyBGl1RunJ5iQu7WTTqKy5kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732733285; c=relaxed/simple;
	bh=NRkynitJcItte924uDQklomHInx09SX2d6xRgfzqXGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qXWv/RUKfm76+djlpouTKC05w2QGT8oy9lkVynqFIjMhoDaqdxN0TsK0Nlfi1vHcyNMvriPZ+8O9kJ19cCgLc285XL7OcJxbFis6r4UjkpgfPcEJVsVFUveZrBC1ESKgcoB8I7gW6VoT+3hgImJEZG29i+vf0xH0YYSdrtE+U1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qBdWizEb; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qBdWizEb"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4349e4e252dso33753115e9.0
        for <linux-clk@vger.kernel.org>; Wed, 27 Nov 2024 10:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732733280; x=1733338080; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jcpw02mhb64jdwB+dNNvFHOzRMCWmmfGsK3Mw00EgFs=;
        b=qBdWizEb7/PmB2KYH0aKUsVMt5+xEV2kXU+eBfT4gkxQf9V6fwJxlaI5DlAODFuI8U
         JIV6GDa++/pVOKHk8QojSbyLl218mMGbS2x9Z59XJ6QihIqOwM/b3Dxof/4TfdCnepQU
         HOiHVPbUXb5hvvxhEjOcKiYyCfa53VXOZjflpUFiS2yNT0FTZ9FmHBmY6a9IX7LYGef4
         9njDh9Rn8mAc/Kj2dlYunXBKCIDhvPcoJxUaQF9ZEWNapO4baUDvLXNw1QS+7OHUirnm
         S+YjOgKdphsPSeAz8F57drzIkHgDS1Xcl9/+Uzc2FwglrXCO0I57wn3YklomGx1oz2Yh
         zwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732733280; x=1733338080;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jcpw02mhb64jdwB+dNNvFHOzRMCWmmfGsK3Mw00EgFs=;
        b=Gg01/gMd70VToKoIOnUhfSckjKwrAQ/p15doM3Zm4zoduQxt1gFnX4ICxCBlenlYtv
         PgSUvOxdFYsJljCaMxdxcGQ9AjmhBgh3IFzkZihRefcJC9qP7kzylRZCWin8zXB34kWw
         cPnGBbsqMwIxlP2Ox/i7VGGVD6eC1T2itjrMWdJhTrS1uVCbZ8/H9s6MOr56yV3FOwM+
         CdY29irdCkikP2NK9vV0VDs07EohMLa0ceTZCqyIG6nMrV2uxP3TZskX51ReVjnUlTE1
         5HT9ix6LFpZNO4xGDyVxHW2jk5n/LjsbPu0vsrjH7wKDXcn2xqoSjIkm7M7qTnpkZ7wF
         grXA==
X-Forwarded-Encrypted: i=1; AJvYcCXyeN7k9V/rWike0X/QxI39qFYTquCtv/W5Oc6nSR39U58za16Y9p7gTBn/I8vvvjS0u/xacPQLXiE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1e/WjV6Vi8iz8qPaFUpeO573Rsd4S9hHaYhi4+kx18M6ZXbsY
	Yi62tPKz4B8Vfvc9vtnZu6JgTMs4MzqHfNSVcLbJPaTOn9AFOnSklTUJ/4fGp2k=
X-Gm-Gg: ASbGncvEP5V9+nNGkix/1Q7MQbNqX3FM6NBpkPCfF5rRvHO5LOAWtMPD3crvGHoCRhX
	U3/sFepxJSiRz7HeByM/mbRNvlbm1n09T5l12Uzuq3f8QvyAFxvXu/giyBj6Tth3Wczio74QFEn
	czs/sRs2um1hPVzI47LU3hEGLngPxMbtwhDrMDHIam0vHrz0UXbpQ8DtHLNtIu0Q8K5ty/9tAVW
	lBBxIOfJf3xDJMDX9Nts7/16dB6QM/eJN0hOyb16a7gazJnJLYe7XDhgBs8fslQ
X-Google-Smtp-Source: AGHT+IGr99n2pgmmmlqNTfnISk2hQpeyV5JpHyTyMj3WvVC6iQOTmJfEucqeLNOUYv2B6leOlv1B8A==
X-Received: by 2002:a05:600c:3b88:b0:434:a765:7f9c with SMTP id 5b1f17b1804b1-434a9db839emr37961625e9.6.1732733280392;
        Wed, 27 Nov 2024 10:48:00 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:e571:5afe:4e1b:8936])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-434aa7cd343sm28854325e9.22.2024.11.27.10.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 10:47:59 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 27 Nov 2024 19:47:46 +0100
Subject: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAFFpR2cC/x2MWw5AMBAAryL7bZO2xOsq4gNdbFDSRSTi7hqfk
 8zMA0KeSaCKHvB0sfDmAug4gn5q3UjINjAYZVKtTY79MmN7Wt5w4Bu9HLiyCLsRVVeozBS2TNI
 OQr97Csr/rpv3/QB9Wvy8awAAAA==
X-Change-ID: 20241127-clk-audio-fix-rst-missing-0b80628d934b
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1632; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=NRkynitJcItte924uDQklomHInx09SX2d6xRgfzqXGA=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnR2ldNqnF+hCENTkKMXcIyoeqe6vo64sANMP3G
 v8+TpjiOVeJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ0dpXQAKCRDm/A8cN/La
 hSHeD/wMqPZGojSkTOSnh93vp6D1DDTdHNlEehKY7SxVGlFjp1RIE64G28ltFd5voZCdRTuaaRG
 E7Log9CTOmBf0nReg2WINO1FfRKR0AC929HkeUFdKngXVIBSieROtVjvz2cRJJ5AAVFs67a3g22
 cFaPyFy1rdmlP+rqcA2RyfjXtFohm2WsSKtUrColYXMr1FLcCwvjWrX/KFUQTeol+pAwtk0YjMr
 MGn6ucKC8BmGeLn/AIsUjy9JJJSAt8EcB8X0q0+6lgIpOIjm0R8Lcc9RnFdBbHVb/Sx87xHWoNV
 chtT31Nt7LScLqDuUJOOyZCUPhFQ1WuF/SzPK/l9AjXBW9S0s2tPEsG7AMV5Jl6rlEdKRTuhT+S
 MYRfsbw7uLbydPEDIY9g+NjUBdnpPOYqFqrcwb/pJKqAq4vu7bKaYrvZoeew/YFho1WMB9gZMCu
 DObmWT5CLGisIXCmqTfsI7oJM3n8RwRHjxXrkYGl3M/IMiItcT3pi4o7jEzko+wlO1MqplRrrPS
 NN64QqczvMiS90HpiHmFxyTEJshpkD3x2l0HXE5dmwkcRN/A8xczzcuTU54dL66wNZFXhwcJ5hI
 GkGP98Y/CD4Mb/BTFu/UZrpZ12QdJTqzWMaXWCjtE1BYTnHwGK/SarH7xJJht27F/rdqDsSY/Sg
 i5TH5EzTDzIOlWA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Depending on RESET_MESON_AUX result in axg-audio support being turned
off by default for the users of arm64 defconfig, which is kind of a
regression for them.

RESET_MESON_AUX is not in directly the defconfig, so depending on it turn
COMMON_CLK_AXG_AUDIO off. The clock provided by this module are
necessary for every axg audio devices. Those are now deferring.

Select RESET_MESON_AUX rather than just depending on it.
With this, the audio subsystem of the affected platform should probe
correctly again

Cc: Mark Brown <broonie@kernel.org>
Fixes: 681ed497d676 ("clk: amlogic: axg-audio: fix Kconfig dependency on RESET_MESON_AUX")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Hello Stephen,
This fixes a problem introduced in this merge window.
Could you please take it directly ?

Thanks
---
 drivers/clk/meson/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index febb5d7348ff07c2da0cb5fd41d2ad2607e5bd5d..ea16bfde0df2d7bfebb041161f6b96bbb35003ed 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -106,7 +106,7 @@ config COMMON_CLK_AXG_AUDIO
 	select COMMON_CLK_MESON_SCLK_DIV
 	select COMMON_CLK_MESON_CLKC_UTILS
 	select REGMAP_MMIO
-	depends on RESET_MESON_AUX
+	select RESET_MESON_AUX
 	help
 	  Support for the audio clock controller on AmLogic A113D devices,
 	  aka axg, Say Y if you want audio subsystem to work.

---
base-commit: 6f3d2b5299b0a8bcb8a9405a8d3fceb24f79c4f0
change-id: 20241127-clk-audio-fix-rst-missing-0b80628d934b

Best regards,
-- 
Jerome

