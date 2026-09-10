Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0568379C5D
	for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2026 03:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789011007; cv=none; b=s0QgQHz/cCMeSXykcRk7GTqRiMeId+GRKLJmX6LsiDWzoahjnq6C1WWJKImfabV8pIsIfK0IMbcNLi2F5ER/pXllThaUCPnvP+AGXP8xkilUo5/cd9M4A7DrXqXhfIWd2ilJrn07mqr22ryMXeQm4LWDCgR2OSmMVXnIYlGV8qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789011007; c=relaxed/simple;
	bh=/uY6JZ4dPGadrWONYZhC35t/6sJOFFSTHBE7n8OXDs0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ftle0remLD0W+H4EV+50L/z21ZbQlsvOEJNZ4kyGAK0k8LVrD22NYM/n2SqR/aD5NTdv77KCFZ9n2mO1dAZ2+dOOV2evwXQ1Im7nQCsnNke4B2ZjgC92AOFvCWi8I0f0asUrovTOYfxt9I7X/r+vJDipZPmtbDwMxvHTg0zwmR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXbaRAAJ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXbaRAAJ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4869b6f8629so513076f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 20:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789011004; x=1789615804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YKJjaLrDLwATiTkeesDmHnGi32ozSCfkATjDcADW814=;
        b=BXbaRAAJE9YB5jpHVoHeJ4441JJN3X8Zpm9pmOARNWfVxbuvaA4joOvYrg8pOgQAto
         sPNQKnWmK59liiLIUPfhNoOikWX1edpO6a6oyi7k/cNVKrtwwF/hAPEJWueLD/o8+dpf
         ppq6tpP2uPu+sVpAdoURZmLBVpBOCBitbFOaqds13diiHtf7PEytXFXd30B+al7zvDLc
         iYmGDcGMwOdInl8bILUqtgR0KCUkqk5cETNsQPXapRo/e+qrSseMM0DGUp9tP+BlTQSD
         f5p+pKYCDaBn+URJU5FSzI2VdvROFfW6J+XXAk2FzBRB59h3//ArJpUJ4wbvNLZKq6E6
         +QDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789011004; x=1789615804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YKJjaLrDLwATiTkeesDmHnGi32ozSCfkATjDcADW814=;
        b=tU9ZAVvzBzAZe/fu8sy6sWnu3UNl7vAsEIEe7HI273Okcy7LQFA9J8x7z1A97cbJfd
         gr37q939EQwDrEofcFEhOmu/n9K8ff2oumXBNH8/zf0b9Mg/Kdj+CMRNFPYx9tZj20lg
         aOt1MxKWrB7bMOCooIWKrwc1CcYfe8813zygwAm5UIiJdm4sRlBdYj9eFXKz73/jiA+p
         ODfUIOwurmTWKwemnY+VGd6WiEwGO6HH6W+oIpk2ZBDN3jb7fgEU8IoXwe04uDNbAHjo
         bFNBhlyUJv+yy79niEBi1kvp4KbXXewONcWDZtOxaPb/koHsYveWxNc6QqyLucL1RuYu
         md2A==
X-Forwarded-Encrypted: i=1; AKwUvBwz0knSGeFJP6xv9OlmGpV+SXuV92cRFsHg2nLTXvvSEQVesar08jOMIwpdnpPstcDGkzb+cqBU9JM=@vger.kernel.org
X-Gm-Message-State: AFuF++m9CrjmAa1rGjaf8QfoFML2P08Fnj+GLXBFNS83pTwXWc59RO8u
	qXz55BCjQ5weLY3pCeSaNn6hNPzbfYmDZSedX2aos4z5UEwZ+TukpX/Q
X-Gm-Gg: AYBFou2ov1GYTnrjOjWwhLQN2yIFWj1cdb+MBq0/6ZLp0kgv0FMzaBxt4AivJ5BHgxn
	WKRCdpS5XsLuaaQTnorSxO8qXYMHXEUJBcJEHh7eWZ47dqA5YzYI+AN+FYWDvE32Mc6Byatmb+f
	iyajHZCbRS/P1XcNa6vYPG8mf7c4eU3nYTbiUMVG7fPkgxyHiemu4Cy9gQuRPH4hP9QJtT11UhA
	XxpTIJMeQdE1a3eYI6XPJMdT4iC3JUsDozzTQyIrXBYxy3VHZfRAovWVXU6GQ+snqUf4s+6e/SX
	o/I9p5YeQymuJ13NIBHe+mP9e1CQrCtZQLFfS7DKv78WZUeHQAfEliU2v9YPeRfH1eMyl6HTshF
	FSEPivRLILV8WsymJwquseoLFI2cPy42u4jxGKv44iawVfdmFQ+mr4I9/hRgs68saN/SlP36id1
	PUeoj+6RkuRcz1gEIET+k+AGXYWaSQV6hYepCNKzimXgYdLyEmZBUn3TUeu/JUn5AdWb78V2/Ft
	Y0arJMZC71l0iV3sUfUhgD+jXP52jAhCj4t6i/SJsB9jLpAKrW4SSuDy9v1geDvySDnG22R/ASw
	2QcFi2DXD61++73PZOdD8V8s3K9ITzl08f/dvQFPYmPTOn1H2yBM6sCrS4OqLgaMzinkwDAUIBU
	=
X-Received: by 2002:a05:6000:46c2:b0:484:4769:18a4 with SMTP id ffacd0b85a97d-485872cd677mr30353937f8f.14.1789011003718;
        Wed, 09 Sep 2026 20:30:03 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b3d9-b901-0402-5aad-0ef4-88ac.310.pool.telefonica.de. [2a02:3100:b3d9:b901:402:5aad:ef4:88ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858e239862sm42468266f8f.9.2026.09.09.20.30.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 20:30:03 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: reset: Fix device registration kernel-doc
Date: Thu, 10 Sep 2026 05:30:00 +0200
Message-Id: <20260910033000.15926-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment for mtk_register_reset_controller_with_dev() names the
older helper and documents np rather than dev. The new helper takes
a struct device and obtains its device node internally.

Use the actual function and parameter names and clarify that failures
return negative error codes.

Fixes: 761bc64003e3 ("clk: mediatek: reset: Add new register reset function with device")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/clk/mediatek/reset.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
index 562ffd290a22..b09cdcab0c4b 100644
--- a/drivers/clk/mediatek/reset.h
+++ b/drivers/clk/mediatek/reset.h
@@ -60,11 +60,11 @@ struct mtk_clk_rst_data {
 };
 
 /**
- * mtk_register_reset_controller - Register mediatek clock reset controller with device
- * @np: Pointer to device.
+ * mtk_register_reset_controller_with_dev - Register a MediaTek reset controller
+ * @dev: Device used to manage the reset controller resources.
  * @desc: Constant pointer to description of clock reset.
  *
- * Return: 0 on success and errorno otherwise.
+ * Return: 0 on success, negative errno otherwise.
  */
 int mtk_register_reset_controller_with_dev(struct device *dev,
 					   const struct mtk_clk_rst_desc *desc);

base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
-- 
2.39.5 (Apple Git-154)

