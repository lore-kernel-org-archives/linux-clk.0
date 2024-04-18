Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE4516F8F7
	for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2024 14:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713449857; cv=none; b=FrcO9bk6eQ8Oebw6ucMuY1p/UiuURwiSJvEMoaeweCW0hY5WIeMUvrKGC0LCrKHpks16cvQAIqai4kfOsTE8q58bU2mPrjvdUVL7vKrSZyl0RdcPkRAv0c+lF1nXLIbhEuAl6spFOXBaqQVrHtDDGKR5Xp3v356wqycX0FINk0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713449857; c=relaxed/simple;
	bh=woF6NgCy9sWp4jU9xhCym7WDVQPI/tzmO1lBDEzOVXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DHr7FZyS+7Piucg7AdkR/5MYtClD+vP2Qtsfzbi/Ofv0CTbVYI5TRSfwQhuu2qb/YgzHJsj7h8j+bmXbDzEAe0lmd696A0yFnbbvAVLTGQxCFjJbf51NZFw+ZjvCRYBjf3yBzTT13rbykWWrivjBzhpP7qyKXmygzpLn1BQCRtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lqZPH6Zt; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lqZPH6Zt"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-418c0d83e61so9983335e9.3
        for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2024 07:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449854; x=1714054654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ngpZb20B2h9Qc9IbX5I/ZiczUNGoVVnils8jWsBLdA=;
        b=lqZPH6Zt0V7UtpZI96qZ9P+1Ts1ZcrSUa6t06K4Bo6TPDdGfQHnE1Z182f47P2riSm
         MjnDhs7nkuycOailAu64J1dHiQOhvqKWZS9UAXyCHQ4cmOC+RctW1ek51LMtnbNWNqYS
         rg7IxKXDBAUWcGr5N33PHV1P9MuPumurbuy8OQOts33dXzF0Do2pVonnDVIJe57eb2F7
         DvTZ+6tjQGviUlY+9AeiNMkpbwx76Ne6Rj/svkJzKs8T6Y/yzS9hrSlbZytAJZ6Xd/1M
         DBVPoE/HoFjGUuMc3BLHPT2OouWaaUIN8l5h6zeB5vs5xvT7IuDUwavWG9YwvsblaFol
         0h9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449854; x=1714054654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ngpZb20B2h9Qc9IbX5I/ZiczUNGoVVnils8jWsBLdA=;
        b=bfir7f/g6M0+3pXK3yQckRygTuGwzV6cTj29Z+4dhA7NeZJUdY3oIsNZNRlWnBlnN/
         VoR4GgLfykH4r9ryRQ0VK9db42m24B5gGDCWZKUSz0aSuxBNfGu+d8r9gDxOfr7OTGFV
         NslkMhzl1Vgi2fqR9MCgdnUD1NzwHCqZcFmqbQT7NyUrpdMtagMx5TTdJw9k4fsfVbmv
         u0uZbAdo+xkrO+ZmLTJxNVLErzLO54XC7qx8Arju8UMW3aK6OzC5Wp36xepHSDY3MzdU
         yyrl3lL9ZFEpTDe1G6WjgRTPOvP/vdnjxZV9S4QnaKa1lZWRd1jHMFKS+vcdct3CoZ6i
         hwzg==
X-Forwarded-Encrypted: i=1; AJvYcCVu7A//45qDjK/UBnrn/sPhktMsDer+sjuPmhZLfnB4S3U+ztptsI280E6jzwA4QUoK06g44+5JV8FWbWMxgPFYs9u5iA0M9j2V
X-Gm-Message-State: AOJu0YzKQGya6lZa8R+CPsw0rgTJC8VbQ2Q04Y3Ui8VGt8K2sr5wSV1z
	ZwB4YjUbMM1WwLXIc3RARNzHDgKGu5d2Q8IDN+FIyBVk4mQGE8DkwjdC/7SBMo4=
X-Google-Smtp-Source: AGHT+IGNk7+q98Dt50c94htj2Yax4/KnYeuA1Mwztlc7Yw/kKE9BWFSk6X7OkJkTV8uxkSAExv++dg==
X-Received: by 2002:a05:600c:5254:b0:418:fb6f:5f3d with SMTP id fc20-20020a05600c525400b00418fb6f5f3dmr290856wmb.17.1713449854525;
        Thu, 18 Apr 2024 07:17:34 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:17:34 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:17:03 +0200
Subject: [PATCH v3 15/17] arm64: defconfig: enable display connector
 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-15-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
In-Reply-To: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=693; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=woF6NgCy9sWp4jU9xhCym7WDVQPI/tzmO1lBDEzOVXQ=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStjXZeg5Jh2Is/gAHWoRmg5aIyMiEXbGdEHozO1
 0cFGgByJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYwAKCRArRkmdfjHUReAhD/
 9Yax8im2q4PngGvAwi5mmyFvPkrrQweqeFZGttybB7sZdfiirXSiQhiPajWkHJ5qYP3CaLIdpsBbwO
 Rly04rqoR9UjnSnssubHEZRNV8FDtUpWG2kx2KI8YtrPQXLedyoviZ5yXRMhrIo4YQKztKVAM1anaN
 +4z/FdycM/OVy+qFYOtxIBm5OZVvmTBFcaobZ7N/b8dnOVarjKVjWcJMqc5DvBg82J9pfb7i5a32+j
 qkq7SMbQJPWRhsJJ1p+PmDZc34BROzx6SdrqIaQTJnDjE3jg9ejPrn72qGRpeCHd5u+WRMmbRlWe34
 QjAIUX44315fL/fLIduyc01lfQV48zhoOFVjpUGN219Rl/nbxQdtQizyG9s3C52+sBnHtBtCKGtM5p
 KeRTXx1RnMx3zK5gkElzJRvnWP3BpiS7jkdcymFux9TZriFYx9saLHrclsMJIMoAgdDwNvi+2YDgbv
 ZFd1zRXXRB3wFltaeIYmv61ET5XbsgRNVlB3erg09SjegSD5W4C+dUv8X7DTr/JNQYk5xB8c0r5kLA
 S1ZmTU+T7QLg2br8fX3i9CU7FZDBm4vI+C/FubNpkg75I5aXe2dOy+RetsN0udQ96a/LBJPDmKFksS
 ZnLWgsJyU/bn4dG+J0ziy4jI04KodR1dokrbqRImv1aZvrEx8euPdeTU6aiQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Enable this feature for the i350-evk HDMI connector support.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index fce98a150014..1df337882835 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -872,6 +872,7 @@ CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_FSL_LDB=m
+CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m

-- 
2.25.1

