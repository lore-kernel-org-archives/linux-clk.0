Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459A037F315
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 18:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784918606; cv=none; b=Wz/i5G24qMk+Tb9JnkEzJs3WMH1v7DsmIqhwIs3W6pEP8o4zeb+X9gw2Hvjk/C0SwUAvI6bX1UBo22ffe75OQgOeYX/ofCme6fArOqMFj8nZ6UlKzWE7U663T2hvgPIGBGgZF8MT44/goyNWMAOlGzrQ4WjkFmWmCgDiCCtuXo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784918606; c=relaxed/simple;
	bh=GP9IFwbiigSeJPvzqMICj3Nx5GxSPoOIThc5SA+/644=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=jCZkIl435dJ+MLZV000PzOFiBkv0IRbqYMkREaqPL5N6ZYfREEs5v2UbLWEtDQoDqz738qsuP2nM0xiPL7GDib+oYesXgjIQg8fOrjHAX9YiFXLBuVauHp6DOge88s5wKUiDKVaVEVzOxlqxEmFDWuXCIvZvn5gzjvjLH+02y/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qNZK/yFG; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qNZK/yFG"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-495590dde14so8977305e9.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 11:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784918595; x=1785523395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3tiB/j/1EHf64fdSZiWk3JUWgesb+0DTWJ3IdcA3OOA=;
        b=qNZK/yFG+LxzWYckKMFzv251Twubgzt5S9CdwpQpkiZSBmIjyQEJ2I8DQdxEjva/oP
         7z+nF8TnCxZA/e1g69MGplCVd1nzJRD8ee1wvY3uTO/CK7hwWzRkqGVgIWYZEx/n2Q70
         DqEwS07yZ+Qi67R/UcyewtZKmIHXabzU3XaK+tBNjGvHUDefapKmJbkeaiz2STx8Mmj3
         Jcez03TpDEfDCpCikMkSetrnHbkHiO0qGJsHcrdbsZMV3w6ub/D0mJMphQksJvWXSiou
         XvbqLlx1wtZjpcf3IBRAZV+0+zmxmWH71Csq+wQbXFu10HrzPd7rIzYu0nbTZ9SFB7KZ
         8d9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784918595; x=1785523395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3tiB/j/1EHf64fdSZiWk3JUWgesb+0DTWJ3IdcA3OOA=;
        b=RTzPmq7n7uG8whn6WMGK5ls9IEE6TY+BHjsf/g59UWQBQOSnFiPIJyrTzmA6Is0iBc
         TEx5gDXly2iLdSbPr9FkpRLpsTP8UTUv/2pFEsIFrdXSNfY1yhvoDNQFuJQ2lwiGIXQk
         /8v2TV/OHMFeYrE4lDtPzphc8KUhZ7rl/bvbJPspVy/UP2py5gxurvjTJpKV6LpRNnJ9
         SuESlTFCqCR+LUz+jx+b5zZT3Py6ZklSoKYL1LgfDJAjTdnUjIDoihG8y+T08JQUgLlb
         Nykjz3w+i6MBJ6bmc1c0I2lsQKjYLDCxfmZTZp+fTyEytpU+DFDh4v7dmLxta+qPPWO+
         YuOA==
X-Forwarded-Encrypted: i=1; AHgh+RoqlGNMCdE6gnZ0wXlbgEoNtMZFKJFmbIWx+zZu5vOOqPyJOB8PH4IR7CbLBSHq03AsfYev+3OB7S4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/AYXcSSn3OyVWyCSUpN3eAy3UP16m4wFTWoNrBbKbdGPmN/dM
	A/3lEI2GZKgRmWvboSS1XjLaztLuMgfRrWSLjCceS1KNgRV4dQ1Ahhy1
X-Gm-Gg: AR+sD12Gm6JvzcONKhI0ychgUfunN24WmDQb4fF6j9XhMBFCCdotYu+lzVjEptHoI2e
	1hdU5d85/ammRbK/ANiEV9ZmM1yXLp8GXFpUUooHiU3YII3lmsvQtX0y+hvx8YbTQJtB8KOXreN
	iQFGa3hFaOcYEGYURhu+vxdK5VfA++qDBj6xw4lzeI05+2ic/SA8UZeaArY9Xay9UFrWyXPsUrp
	0BdVa6Dqm9OAnQL+P4sop15ZiFOqOQPz4Vm/opy9AsUbuiaP7gMEdyJfqbJMTi3xc0Tq+7+exWz
	+K4EXt1LrGtSwvz1IY5F0F8EAAc54VCbVYjl3Gh92Q3wdXXZQfVRJ539MrYIIJRadIoR2EeNcaQ
	NuLwXHxmdZAiF9HsKvr6j8k/+QVuVwBEjUr7N1YG7YZmoP3SIb23DvbxVyWz1nvJN59PnK/h47S
	8YErWrS5+Sxd2eONa6Z3VGwyPpsmN6KPatW50qdjVNDMBwwGVBAGjcjqC7NWVGX4No
X-Received: by 2002:a05:600c:4ed1:b0:495:5d6d:9cb3 with SMTP id 5b1f17b1804b1-49573d13756mr94264605e9.37.1784918594458;
        Fri, 24 Jul 2026 11:43:14 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-3-249-180.retail.telecomitalia.it. [87.3.249.180])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f85bd850asm25701300f8f.15.2026.07.24.11.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:43:14 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] clk: en7523: Add support for selecting SCU serdes
Date: Fri, 24 Jul 2026 20:43:00 +0200
Message-ID: <20260724184304.192962-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series is a split from the Airoha AN7581 USB PHY series [1].

[1] https://lore.kernel.org/all/20260702093812.15918-1-ansuelsmth@gmail.com/

Christian Marangi (2):
  dt-bindings: clock: airoha: Add PHY binding for Serdes port
  clk: en7523: Add support for selecting the Serdes port in SCU

 .../bindings/clock/airoha,en7523-scu.yaml     |  24 +-
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/clk-en7523.c                      | 218 +++++++++++++++++-
 include/dt-bindings/soc/airoha,scu-ssr.h      |  11 +
 4 files changed, 248 insertions(+), 6 deletions(-)
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

-- 
2.53.0

