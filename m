Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3958718A6AB
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 10:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723112886; cv=none; b=n7USCMlilL0zc89/otjYRpFKzZukeY3SwmA4kpj9twj1M1z5LUGyaiZSqIipPDevcqdOnL+EV39pgcphfcQAdpXJS1rnrgduuRYA/jsO4C5ylsd/T0EMYAI3G3iYAyDxj2wYD1GeHzVbEekAZ+uMBNL6BPhaiTlUrgXpyMMPGWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723112886; c=relaxed/simple;
	bh=ouBTIN2jRU0pfNdAImzVJxq5KmrTpV4HJkq32LGYJ0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l5uktciDtmToLt1IKvzi5yc5JoFgW8e5Ri8BSxJT47BS3ZKWWndojAgxivI59FuF7zjpUGRy/VqFeYfV9NG8RC+QWaEhpsZxJ+d+pep11TnjWN1de8uT/tQ49yT5BQ8CApULt9x2SCXb1Ukv8jvXi8V13bPa4l0dug/44YyY0Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LY4wfLp5; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LY4wfLp5"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-368440b073bso450995f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 03:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723112883; x=1723717683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mtmd6W76tUil0cCcam+JDZpBYdbmzTJHGckyhD7jrDk=;
        b=LY4wfLp5ovrTbQn14/rBelst+3F01Scu2aCp/S773Q3baFnkVu9A24yqSc32NfIKjr
         NoSYeIXZuN1JHadsh5gBF45wYBGlU1IolxI8vDDpHnBZdtvP3T16SgGyCekQYlGPZQa7
         sV+Ff3mYlJBLo07GC8d32gu9/rg3sBl1wsQaV+OXEs3lrS7YeORZVb5V/ZkveiNJXCWR
         V6ZuBxmdeW0WNMxXoMyMmBJjiEk1rKbE5s8N2lymzzYNuZQw+f2ngHqtaHxUp5IrP9Jc
         m49n4RgECXg/kIyX2gFfPXRLyLCjdAUvvcY6dTb/guLVE/MkTAZVSBoN0hnKXsN9yJ33
         7TwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723112883; x=1723717683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mtmd6W76tUil0cCcam+JDZpBYdbmzTJHGckyhD7jrDk=;
        b=MfjKN+FUYS5U99xpU2FNWqb9Sl2ieoIxNaMe3yh63k+XfbpvkJRTyrjGuexnkyx6x4
         Pf96tqPrs/0BrTliuZy4wNQYScJKNhFNY4YhFjlznDGefCshOPwoXFfAYdQxw12tE4KG
         UXzZrJqjeyGUSCTrCBROvRi8Cjim3w7AH1M/XHCoiR2sd67K50A9jZ071bpSgtro3lMn
         dwcOZk8LsA/Cdm8dazkYfiCaq57sNze1LRqKDBp9hVjrH6UOS+k+z2OQvpY8tD6DSJRn
         1I9iVKk2gcTc7pmsfBjzitxXWcERq3hGdi8Y1NGmLCaHee705Wda+n0C81EtdrsyY4AW
         lAPw==
X-Forwarded-Encrypted: i=1; AJvYcCWjJiNbRISvOJBFG716aMk4On4zrrk8siVwVqCRRCsuyo67s/l8h02XkWZPZzYEFmEEc55uayvG84Xkf0oULg0Ocd309EjF3Hwo
X-Gm-Message-State: AOJu0YxVrDgfW/Uc3DGhrSs9yuzZvI5TLNgRguOZHCQLkgGol7OmIqqj
	KOhKfFWSrBn/VIBr/snbPnINcqCY9ZJCwsstICKWdED5IdeBZoFjCqQ2yrVCTbk=
X-Google-Smtp-Source: AGHT+IESK3Vcf6HBrh5b8hOTqs7HQ9tidPcmbWNqOL/A2DCJJeJ7YWip04j5wF2X6KBmuFiiDUvuLw==
X-Received: by 2002:adf:f012:0:b0:363:ac4d:c44f with SMTP id ffacd0b85a97d-36d2815e3dcmr1034564f8f.17.1723112883473;
        Thu, 08 Aug 2024 03:28:03 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:ae7:4e79:8821:15db])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36d27208c98sm1454596f8f.75.2024.08.08.03.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 03:28:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 3/9] reset: amlogic: make parameters unsigned
Date: Thu,  8 Aug 2024 12:27:33 +0200
Message-ID: <20240808102742.4095904-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808102742.4095904-1-jbrunet@baylibre.com>
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

register count and offset cannot be negative. Use unsigned integer
for this.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 820905779acd..460ad2f8360f 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -17,8 +17,8 @@
 #include <linux/types.h>
 
 struct meson_reset_param {
-	int reg_count;
-	int level_offset;
+	unsigned int reg_count;
+	unsigned int level_offset;
 };
 
 struct meson_reset {
-- 
2.43.0

