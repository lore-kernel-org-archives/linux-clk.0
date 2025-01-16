Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DBE22CF3B
	for <linux-clk@vger.kernel.org>; Thu, 16 Jan 2025 16:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737044660; cv=none; b=WSCt6UBADr2WRuAH1ho4zFKVTh8pCGkwTkVejRssHVFHuXoUuMrBkHynURsjeitOtKCI2UHxIhHp/a+gyLTBKgBFSBueC2QqCXrZ5nrLqqmP7yu4dDZJZKj6WZQSNFhe4iMcn7ZJxGxDPxeJjKsqp94/HtwyRXe4bJ9yWh6OYA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737044660; c=relaxed/simple;
	bh=CKgS4ooxmnjQVhjjaKiNaYLSGzzK3FQ6JFbFRSkEAY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nc2hWe/IbBRjuBLRqnQkaek2cmhzMepwJjqCp+lvf9YwWUhjWhBkoaIPH/xhmY44Tx9rzERP5WeMjXFLNNjV77tX0U4Q4MR/zgQUng9lXjBjncr0LpElcIwXMQDvspmUmzamrZ0Hoa0GEM7jxkEmZ3eBiB8fhnDssG6Sm41M++U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=sdcd7TCB; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="sdcd7TCB"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38a34e8410bso621449f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Jan 2025 08:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737044657; x=1737649457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uEFDRD3uDacyEzKnD/0X8FofWYQVCs9dgJI0dD/G5mY=;
        b=sdcd7TCB1g/xEpy7TOV9OHsW6+WqtsQ9hWN8hRNiRz9C8TBOVdoblIy0aMeUs99a96
         1glqa3RezGgttLFbiW+ZDdeBrww1KHvZbMY6pPe0+LppwCLCCd42mCQ7RdZe8FY9pRCE
         xY4R05d/it2OjkVXuT578k4ODLSSIGxUc8yEEMhVxXnSgnw+TX2PiovkHAtcc4Gx6txl
         yYbtS0CtiTQuDYKaRHQVDWWlGIaRhBwHCour2vaE3JUn8iV3qclNLwlQQYp+H8BzTwMo
         z0h4xvwvt+3NCJlZcdKU5XlVkjaMeAaBlvLWpngiOTO8DpoZPMwtHDtq+p5c7aW3fwvP
         vMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737044657; x=1737649457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uEFDRD3uDacyEzKnD/0X8FofWYQVCs9dgJI0dD/G5mY=;
        b=sPs6bop10qPMvTf9401t5arw3j4UUlEMLzy6noPlMDBfT6jX0rP0BH2uvYkrwWI++y
         zSdfHlZUiFMsO8Gkj13Dl8I2YLhxqQeYXASEOxaPfJ/ytpqshWinjpMseQOpjkI06DQf
         Vknjvy3cvhtRXiTX44aOJyaNQoiTUA4QhN1apOXDLE5HDaBJrnEtu273MgbaexGkVCGh
         iHkC/MCX8HpNYKhu0PVlvA6EM0/VDJNona4o1wXbxpz4vM7brVknS55U0Nt2rejx5GoJ
         2zhSQDjNdPoT4CuVA1tC/SNQXZ0Vq0PuoJpheuQdfrslma29ANZpvKV4LwHtNHH2aF42
         XiOw==
X-Gm-Message-State: AOJu0YzzfbIL/kiSegnM8ehe+c4lGnnc0A2xW+JK8ttLLQKdiaYoksfW
	J7VWy8rqxJzYnzBpyfe9gyPexZDstjDqrVVHilwrmYINOi61ftYzeH48WHHb9Eo=
X-Gm-Gg: ASbGnctfrPbmjwfboTlGt5F4vawUGij+iSuZ7MgCXeelTxd7kvZdGqj7NxsmlJm3gJU
	Px1whydoSvv1VZLzXQTioBocnksv19UunB7kfC+2EQYzL/GIjqH6N3QQ7VhkJUUvo+/b57Lq4Vq
	oM6+Q4Z8xxqVIHQQ9O9cd1FN/UpNHGG0e3AKQMHzuibFtXLsbX/JBzo4zxOsZoO3SACSc9vgMhe
	uPq8+gvD08fdKSIMrCQNmbxkicvLoEWTbjnF1NC+QETrdPZ
X-Google-Smtp-Source: AGHT+IFvRvbv+LmIOWTmcellM9NY1ElhZhfaIceOIssMpjdEdZEj6E1fUiTUX+H5C5fFTitYvcXPPQ==
X-Received: by 2002:a05:6000:1844:b0:38b:d7d2:12f2 with SMTP id ffacd0b85a97d-38bd7d21481mr15783737f8f.54.1737044657080;
        Thu, 16 Jan 2025 08:24:17 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43890469ba8sm3715955e9.37.2025.01.16.08.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:24:16 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 16 Jan 2025 16:24:11 +0000
Subject: [PATCH 4/5] clk: bcm: rpi: Create helper to retrieve private data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-bcm2712-clk-updates-v1-4-10bc92ffbf41@raspberrypi.com>
References: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com>
In-Reply-To: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.1

From: Maxime Ripard <mripard@kernel.org>

The RaspberryPi firmware clocks driver uses in several instances a
container_of to retrieve the struct raspberrypi_clk_data from a pointer
to struct clk_hw. Let's create a small function to avoid duplicating it
all over the place.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 9f716b2223ae..b12d86720207 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -56,6 +56,12 @@ struct raspberrypi_clk_data {
 	struct raspberrypi_clk *rpi;
 };
 
+static inline
+const struct raspberrypi_clk_data *clk_hw_to_data(const struct clk_hw *hw)
+{
+	return container_of(hw, struct raspberrypi_clk_data, hw);
+}
+
 struct raspberrypi_clk_variant {
 	bool		export;
 	char		*clkdev;
@@ -176,8 +182,7 @@ static int raspberrypi_clock_property(struct rpi_firmware *firmware,
 
 static int raspberrypi_fw_is_prepared(struct clk_hw *hw)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 val = 0;
 	int ret;
@@ -194,8 +199,7 @@ static int raspberrypi_fw_is_prepared(struct clk_hw *hw)
 static unsigned long raspberrypi_fw_get_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 val = 0;
 	int ret;
@@ -211,8 +215,7 @@ static unsigned long raspberrypi_fw_get_rate(struct clk_hw *hw,
 static int raspberrypi_fw_set_rate(struct clk_hw *hw, unsigned long rate,
 				   unsigned long parent_rate)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 _rate = rate;
 	int ret;
@@ -229,8 +232,7 @@ static int raspberrypi_fw_set_rate(struct clk_hw *hw, unsigned long rate,
 static int raspberrypi_fw_dumb_determine_rate(struct clk_hw *hw,
 					      struct clk_rate_request *req)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk_variant *variant = data->variant;
 
 	/*

-- 
2.34.1

