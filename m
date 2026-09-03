Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27523372EDE
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 22:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788476368; cv=none; b=GKwD0fY5ExTA24mJNF0ODLazqGLVzgfuwOcjtNGm9XgeBg75tBQVOke6MkQs4NCp0yObMX6LzeW3WOzbgqr+uS+9qw07HDlXMy9IGFnwTtXh+dcC881ZLmimowFYHu4FNEc9RaL3bk4MV5WSU8HcUiKd88xaekAMVCavEkpkZCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788476368; c=relaxed/simple;
	bh=q0PEkNH4X+PaMAyot1IOtz3LQ1vAi3SlCfuAqTtRk8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P+SGBO26PEVK8IIg2KHvDP2uOq0BWLyiIbyJ/6sjzFN9NrDrzvXiEZMkeQXFiRkEnlpB0YgW4y23iB2q2Js4rjzr2iXcQCe7J6yoRgNwxqSau4rTeCdOmQ9BEOOo0COm/3pukUX1jKw2QfbcwY7rjFlD4QyRVLRgHWGfGpn/W3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48589798dbbso91372f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 15:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476364; x=1789081164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUDONbWsQf4g8On4R7HSZLyPEP705AHSMo8bYRBit5E=;
        b=YZnAHI9AJM2CCKgnbmGrD1Sk6VOVeyfgGPK8v5gKdc0zuBgfOYM/kmE5WhOIxCMoU/
         HBRLm2CxYy/ePjm1UrDBerxf9ItlXCnsb2bPdKq5f+At16pcmeTHA+HhngNce5s2JYkV
         S5seBY3FOEB50eQS19NIu6u/lZ6kS+hOJwbxlKb9pp1ZISAx5GPHiWGKqjypFYOXfic4
         utOts4mHwc5KImuI15CJ+zB1O+59k6kxmWV7YTZBltFVhWyZgTdbIxiMS273xs4KhAxV
         AZ5tdKwD7m4QveeCJ8cmvwUlpCcKz7DI+uhaU8vmHwoJtLzBB8vQQTz3jcd6FbVAbu6d
         iaZg==
X-Forwarded-Encrypted: i=1; AKwUvBzsbJ1RjFA/XNnmC4LS1NMKGrvDk4CwpBVOzLwANOb8Rz52f+2XYDopHqBGAh0PVC+5nm1Dw2LjOb8=@vger.kernel.org
X-Gm-Message-State: AFuF++kU5q/EBQNH9IJOdp2ztoHcIuHnVTdKZyNQ3NQy8n3UDHNy5AOK
	fqpji7pVmPl/PuVr166yXTDJtgjmVaRCSfDyiuZRboOE14LN5ERlglLu
X-Gm-Gg: AYBFou0nOPu7Ua9csnaGK55MK0K5jbKwuvzsw1vP/vJ32tWURwu0LXxSNczKYrPKW4v
	NF9v7JomjT/Tov3NHbbi0UzzQEWxFA7izoK14xooEERiRgssEu34oEgi1Bi+BMfo3ii3DFhIxTR
	9GsNnlS6YWKbJRGd17h/8/3sewjLZHvb4OvWuKL9T+pWBum6XBojQFSVFqOELUTYe0wht7aF+z+
	zYMTPsKkWaTASERTzvUdb1HSuWZsSrQrva+LK3EVEVZifCbif/wuS85uJGb6PbDgK+dMB2NF8Ei
	Wi+CezoWOvK2plSMyezrVOwBTIyCvv4MbomSToiCikU3mZxiMOTyQpzq17Sk3494MWQNiz8dJyo
	7dV/MYBqeoF42eXXULqjzZ6fJD8h6w2SzAz0KNP75d7FGfHJavs9GnKZWzyo+MPxV6r+XD9/3fp
	uWdBnHi9WRsJA4U6M+qBxGDvSzPK2pGgya5m1VoN+U5hab98vyHW3XbyL8ZY/k8MtVljxL5Aq82
	SVeGSBy+eHoXXhYp04CC8O0CA==
X-Received: by 2002:a5d:5f50:0:b0:485:8a46:7059 with SMTP id ffacd0b85a97d-4858a4672acmr372086f8f.43.1788476364181;
        Thu, 03 Sep 2026 15:59:24 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm1686142f8f.36.2026.09.03.15.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 15:59:23 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] amlogic: t7: give the MMC bus pipeline clock real consumers
Date: Thu,  3 Sep 2026 23:59:17 +0100
Message-ID: <20260903225921.2290441-1-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous series [2] for the intermittent boot hangs on the VIM4
marked sys_ampipe_nand as critical. But as Chuan Liu from Amlogic
explained [1], sys_ampipe_nand clocks a pipeline stage that the
hardware design inserts in the bus path between the SD/eMMC
controllers and the NIC_MATRIX fabric to help timing closure.

So the clock has real consumers: reference it from the three MMC
controller nodes and drop CLK_IS_CRITICAL instead.

The series crosses three trees; patch 4 (clk) must only land after
patches 1-3, otherwise the DMA hangs fixed by 43e1705ecab9 come back.

[1] https://lore.kernel.org/linux-amlogic/ (RFC: clk: meson: t7:
    Intermittent boot instability and memory corruption on VIM4)
[2] https://lore.kernel.org/linux-amlogic/ (arm64: amlogic: t7:
    describe the VIM4 supplies and keep the fabric clocks running)

Thanks,
Lucas

Lucas Tanure (4):
  dt-bindings: mmc: amlogic,meson-gx-mmc: document the T7 pipeline clock
  mmc: meson-gx: enable the bus pipeline clock on T7
  arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
  clk: meson: t7: don't mark sys_ampipe_nand as critical

 .../bindings/mmc/amlogic,meson-gx-mmc.yaml    | 29 ++++++++++++++++++-
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 15 ++++++----
 drivers/clk/meson/t7-peripherals.c            | 10 +++----
 drivers/mmc/host/meson-gx-mmc.c               | 21 ++++++++++++++
 4 files changed, 63 insertions(+), 12 deletions(-)

-- 
2.55.0

