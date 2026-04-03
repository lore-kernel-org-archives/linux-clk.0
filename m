Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67620365A11
	for <linux-clk@vger.kernel.org>; Fri,  3 Apr 2026 07:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775200554; cv=none; b=UcZr24vS9pi21TmqDD1b3IpJ9aqHNxkIN/U6XbvkvRDMLfahklEmaL8HSutRE4Rfxm87HMzVZo3pvz4cX8lvUAEiYKYvUEIkQcrqe+zpWRsQrN5vCjdHL4eCeoHnwiasYCgphmEIVTvu0tZeqHTCZ9qIXjYtD0DjDOlQRldEoUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775200554; c=relaxed/simple;
	bh=JjKEvN9iWr5qxGYQsp0kAJAIPdcsJAbhKBISozQO3U8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H8dA06Xdslv2QLZPAyrnC4g9OorzoKEdASboiYO0nNA+oyTXiwVUZTRm4YhyFUx87hDq1n3HIHP6fL6Od5UX8PduKmeALqgGzilL1Xj2eBRYmic9ZShrSx2/4BHO7pgG5GyGoQ/UDEuz6iB+hZB2ZNRObKoaEDDExj/a40kg8MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=leBkOEBU; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="leBkOEBU"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so1392296f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 00:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775200551; x=1775805351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J4YJky3pF/WueCAi5+qClbyih380WXgWG2Qu80VACUY=;
        b=leBkOEBU49EeCVnOKZItUzFzg6/2UOu+99+vc0rSPUKfywnSSN3APDHkiTq8Wcvw9D
         ZmaPC/M+Rl9Dkn1K6ptVKlaAg5CKw1mkduFHUTOGuK6/AbCLQQ0asuGBhs8LVWY72f/U
         rWg388IuCu+i4hRTTpUD2h17c82LvKK2V9FPtjrAdqUZPPQsZPZRLQTNGDhiJVVBKhIs
         v5KYaQfLCDiXsHj1S7nDcTpOsLLEAO8Nip+JFv36sGTBnUGdedvUdNXucMt63fP2xeLb
         DGGd6VkNTyiEixjXSJE6il3IMwzRMN9ECG5P0OXGY+WtE0DiMQfCDH3QnKAZ1GqcyYBt
         K4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775200551; x=1775805351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4YJky3pF/WueCAi5+qClbyih380WXgWG2Qu80VACUY=;
        b=e5P6p6iFdMgoNfWvNZsN1ryq2HblUkIPhufYTEG6FGs1WSmjmumjBFb7VYUXf/qZ/l
         JAuZ4jYGFbJKjTJCaZ+2n4GnxgFEHINmdPfTLgzfhG0m/GTmtDh4B0aQpON8awXSZTrI
         CXZNrRlIHtjJwxKD4Xq9DOiOUWvkox5R3J7vM1NVobyMte432OqbBxlLTOxYVFoUM2xk
         Hschlsew+G9EqtXZ0ah1/S7oV6vkwnwdnfHfY04YYmuZMmjVODtzEzvebBVRW+TjupQv
         11i4YopVOYlQpC+gRA+ZvgUwnaHO8IS7oqN1JYj4H5fZxtwpVTx3b62lv5uQuCkocQZb
         Sb7w==
X-Forwarded-Encrypted: i=1; AJvYcCW4VgKp8KQh0nsGVOSgrLwokkMt4GJmpeBbR92etvo63UTNs6L6YSjaOczsb3TXhHrM+S4mW7ShrE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOa7Gfgnio0/4GQCFCNpWziqdzg3nqrWrc067uwz+6KmXtTUK4
	SUEU1Y7sIh40JAsuG2PiB5mk+1va2AlD/FrrVWY1e7BPG9Emt7xhcpkhq92FAbQfoc0=
X-Gm-Gg: AeBDiesqdMCcWiGTzX0f6GxyIywXqNWBVRLGeiBZ67e8McYNJ0ISUIQfuoEGNhQYQQ8
	IQS6/mpGDTz1e9/QVbwtE5pmEiSD6NFV2jAOeaK5nyYk090JE5pl3l2ZuwW8MyWmFTROZzvFbvT
	DObcTbnBojccb80tIjSrAd4XOtINv9Mc42Y1+8o3MCdxx2XOrf0oX6nXjWe4tL+lIh+hsT1ZgLm
	UYtuL+1HHC7/t5IeR7tGXQ3zeKqfaX7TmI4LE/PB9/X5ZAvnNm34nmrY+x8UfkszP9s/SYS6ywX
	UGaTSqlcIl2Omq8PHXzFvpPca36vrSX4fqKzG9SvNxqCb/L+z3ryCwZBulAGYg7mjij3Zs/g/kx
	Br3qYX6wjhel7eafOm0XeTGLYJtAkXG3QfRYFhfFzC9UFlMoX7nOpEVucURJh2ACWn667WWBy7B
	OmbQKKvryKe66CLMxe4j66UyoRJM7oRq2tW/02BLQqNQ==
X-Received: by 2002:a5d:64c3:0:b0:43c:f1da:488a with SMTP id ffacd0b85a97d-43d292765bcmr2932042f8f.13.1775200550638;
        Fri, 03 Apr 2026 00:15:50 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a720dsm14219679f8f.4.2026.04.03.00.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 00:15:50 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: sboyd@kernel.org,
	mturquette@baylibre.com,
	linux-clk@vger.kernel.org
Cc: claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	conor.dooley@microchip.com
Subject: [GIT PULL] Microchip clock fixes for v7.0
Date: Fri,  3 Apr 2026 10:15:49 +0300
Message-ID: <20260403071549.2558857-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-fixes-7.0

for you to fetch changes up to 2f7ae8ab6aa73daaf080d5332110357c29df9c36:

  clk: microchip: mpfs-ccc: fix out of bounds access during output registration (2026-03-02 17:12:45 +0000)

----------------------------------------------------------------
Microchip clock fixes for v7.0

This update includes:
- fix out of bounds access for MPFS CCC clock controller

----------------------------------------------------------------
Conor Dooley (1):
      clk: microchip: mpfs-ccc: fix out of bounds access during output registration

 drivers/clk/microchip/clk-mpfs-ccc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
