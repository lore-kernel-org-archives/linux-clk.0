Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6E539524E
	for <linux-clk@vger.kernel.org>; Sat,  5 Sep 2026 14:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616900; cv=none; b=TuI8NebuYFmZByAW378B4nSx21tGRsNt/qiiUyRKqLBBd11znADHbev1JKdpQjdSR4INK+EKGc1b+JWB1HJ21zs3k6am6H35GjyrUXTtZd/sZH3ubNzm/T7w34Ud1cBMYiuebK+j/vCRWNxBoeIPk+j7RCRAomwCjZPCrjqnoJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616900; c=relaxed/simple;
	bh=6f5p//qeeEhJiLT6hla2lNz47zEGEWS2WmSvXXHcHig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nUe6ZhIHJ5M/6KkA5z5yLmUTrsVDVWHrqDaLO+xa7dubrlcwgewym4ldtqHqj58dYjQ6zF/Z1WLW28CyZoxJSHsqOxCE+11KZr5KMNst8/dA0HiJQQ5DHYKKeZ0F6peRbKk3ZPvNlNKtnXn/g/0S2Zzs7OhN+LfC+sPaXQuZqcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZpV17zU; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZpV17zU"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-74ab99038afso1432852137.3
        for <linux-clk@vger.kernel.org>; Sat, 05 Sep 2026 07:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788616883; x=1789221683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=MZpV17zU6O8ZzOYCM6mSh6Pc5bMWELB+jnQuQi5HQCi6EKwnfgmZ0AEBpaSpAQDW8S
         16IVmCmWPcQCQ7FUoAc2mjdXI6Vun4CESOtgp7TZ/BbzPL1ysQvKYMFBk+jIWWhuCbdj
         gBI6DgINw00GjdIA9p44lmwqHYK57/id3xwbTs5uCy8v4cZNIxLxiIv0AMx2XLjAnH3C
         Ea+l+j6WgNoLX1w28TuRU6e+lpGdTNOmLFjggreQG9OFR3L71bhcUPSJ4VvBiNxuPuvq
         ddKBGzFKZUmonKqMeFOYYTi1Tw6vtCRVa1cj6NAo3DraG3ex8OCKO8Q8YmVB4pM+sOEV
         hYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616883; x=1789221683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=h3DHuuwJiiOC8lSL9EvjLdXrFx7eQY+J+FHPG9wnRbbHh+3+qFIBixX+hMpdu38Mv9
         J5OZGq33pma0R9d3VIYNa6B/MDyzJyM1Z+W6tvfk/SoUosmBIE5exA73SW8L40OELNwF
         BqvD87scJWrTc4SmA2rZKhMs3DqZF+fUFuPUsq0KHX4Q0E+k6rlsh4/vSBfXtstRePQz
         V0NxVAEv6C0Wf/JE0YdjQWXgDUQH7o6jQeh38gXy5w6fbsphkkIjkmGj4ik+uME5q1EW
         W9BjSSrWBVXXueIbSKj33LsHXFtn/rpH2qrNgxbYNwTB6ReRtk3CDaoA+LIXwfIQxBjA
         CKMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcDfgmic+n6Dw0KcEr7r8ltzX70Hl9/QuBHrhHIgv7jbVgS8ak2u2EMlf5w9mKX+/ynW08m8Z59+U=@vger.kernel.org
X-Gm-Message-State: AFuF++nhoUq4uYqCfsr88RWwJ5W3MK6SXST2W0hhuniM72PEIEUTZfqB
	qqvGnwq2vYM3Zk4rymtQJNnipg6SyjY1Z29jEeeYwFRv637ZuVgWEObf
X-Gm-Gg: AYBFou1TOE099RbnMrueYvIjSEXo3lz3ilWaBVL3rnKvK4pvLyyHnLmKIXTnwWA3VYd
	5HkoOREkU6f3nCHJPmZ+tSUjDMX2kLBhYHfS4KaIaD4Kw8ByJesGbMsVEqqfexuAIV8e9Enb/lG
	glK1VgyTV9/Ho8Cax8c8xnWt2h0YDwbepjkfnoHIwdY3CuZpatr0vR10FMQZMhigud7QLpXW2Vi
	VmqahCm3oxD5dqAX1s6ndF9+X1W5N5t1lGSdv5UBkjaILPu13bfllHN0v+jr7OiplGnqEC0W2fm
	XwPD4gxq2ReeDFk2zV53jNKI8u0ePcc6HpqPGAHGACHdbqdyQAiDMK/UWzUtlfBpAPZtwmQ1T+h
	DJIWN61R/2zqy6J+QqVuLEAH0NfT3Xr7Ca+vmuB62xui2yMFLcNGAE9FOO6+v5fIuirMCHHyJLe
	ryuRPSgLoyh4/x6n6K9EsqhyGr2l65C3vc1jVu2NB3Gbtowu+lpSbbLkk/Z94ogGDoNB0io/MFy
	4V5Gu8LjfO3Wli9h0rOit40wmRN0eEe
X-Received: by 2002:a05:6102:1484:b0:785:1d9c:633c with SMTP id ada2fe7eead31-78a4a8436b7mr5213627137.7.1788616882765;
        Sat, 05 Sep 2026 07:01:22 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ee4d743sm3706877241.9.2026.09.05.07.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 07:01:20 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v11 1/3] interconnect: mediatek: fix Makefile typo for mt8196
Date: Sat,  5 Sep 2026 11:01:11 -0300
Message-ID: <20260905140113.21638-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a copy-paste typo in the MediaTek interconnect Makefile that
mapped mt8196.o to CONFIG_INTERCONNECT_MTK_MT8195 instead of MT8196.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/interconnect/mediatek/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/mediatek/Makefile b/drivers/interconnect/mediatek/Makefile
index 6bd656668..64170ab16 100644
--- a/drivers/interconnect/mediatek/Makefile
+++ b/drivers/interconnect/mediatek/Makefile
@@ -3,4 +3,4 @@
 obj-$(CONFIG_INTERCONNECT_MTK_DVFSRC_EMI) += icc-emi.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8183) += mt8183.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8195.o
-obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8196.o
+obj-$(CONFIG_INTERCONNECT_MTK_MT8196) += mt8196.o
-- 
2.43.0

