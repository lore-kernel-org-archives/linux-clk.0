Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B9B221D80;
	Thu, 19 Dec 2024 12:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734610770; cv=none; b=lFpBca2aRa8LPDog2ufMh0vzx4QgLbxeT7K1sSyuRJRKesFHlD77qmoBx7CIzrNhOWzuIjrt2k5b1FK32XJy5tB5DPvnGocrntfk8Qk3v+5UMns2sJZ5+DEYpgEEjOQB2LprLHRRSnvkA7AlBQg1OBJxawUU1a8aGWFAHSnbWPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734610770; c=relaxed/simple;
	bh=PgfDE5K20sJkmjHKfX+qO6Vd1BtqUvoxW4eyrcXDNSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bNErPCSLYZahDhzcw2t8Fo2cD3RWSS1SQYtRiw41bIotT7KtpTaMN9j3HQH15RGXFnBtyAjuLWzeXOiFFmeNaPvEQ0inT9NmpkaAnb1CmxQKWFOTBcgVs7Cza88mFxkCbNhe7wJd2UFMcUok4R6/XunxKm/FibHi+jnyo+fPBfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Krv5cCs9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Krv5cCs9"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43624b2d453so7472315e9.2;
        Thu, 19 Dec 2024 04:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734610766; x=1735215566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pUlwPfx2tzwzQUez9JevYHjfZdtPbECxmSChhEuFiKQ=;
        b=Krv5cCs9jZ2p6xPJM9yLpfDtPGiAUeHPw+S2Mk1iU72GyJKP1HyD7o9Gnkcynoz69Q
         QlI3Y0X8L66MrxjSQNLiCsii2/oldas8qtEfSy7Maxz/KHmHTEPWyQa64yi2QzI8Zk36
         TyVKd+PUiC1+bnTJyqkuXUYrGIQH1nsU/9EZN1gkP6Ejssw1BR6nutMlFTgOTJw9ni7s
         EN2ZVQpnTDF5uQ5Y2Dj1Mw5gCxrov/8JBeFlkzoLOEHyVWxm53UdTY5Tu0bcBLx+3UoB
         +OMhQeAVyIz60AETtvwcfeDd6L4RhCE3VRST6tIl5QAWkBi/XmIERRNqN+sVM4bDoW6f
         Jm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734610766; x=1735215566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pUlwPfx2tzwzQUez9JevYHjfZdtPbECxmSChhEuFiKQ=;
        b=WZwcIkLhWKHqM0YCdHobXenqSd75bE3ooNFT/lFHuJ8uZq9r1L6ITIlqwttTI6mURU
         OZmhwHs1RLp4yd39Kw83vlXZstjg2sII9fW41CCunU1LbfpmpjvawtdHLFpXAArArvTG
         /pEomLxLdpNT83y8If2ogV1jOQczQdP4R44dUEk37Mw3w4bVQEciJnv/GytWEKCOb+s0
         O7Xy5t9az7T0N7ClERXEpTY6ZdrSYBDvQkF6yR3HUkCAEkCv3hSOBs/jRgnUc9jmgsE7
         lEbpQkgLnjhGj7oyfC55ByeOgTvjovtdRabfGxD3jX4BGknbYLTS+TWNIcXqKcMPz3Iz
         EKLw==
X-Forwarded-Encrypted: i=1; AJvYcCUl7fF5j8P9ix2mC620Zd9qWSW+clDLY9PZieUjJ3cE2g7ZGU6tXnqxDaP8UTVH99OigQZHQ6Zxs0iCf3sx@vger.kernel.org, AJvYcCV9WOYqzsrV04vc5qqemEBXpOHpFQKMG+HOI3D83QbpHCp3BBo/FwY1qR9z/KvspyuPJEeNjVv/w+wL@vger.kernel.org, AJvYcCWz92597vbKfYbaeBSXfdZxAHEy8sAWCsvyxXMqTHCVz2FBoaQYgbhGu4jKPkCZk7iMKCiAIFjf44JA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz76nKG7drrx0QJdpAMRQ9z4ycyihWR7cjjV+Uwx/fW7+7yCY2o
	U+bVPgYiqnHPYCznYF1jAubL6aYnUu4U7TKs9KRNxAgL80BL/UFtsk7q+A==
X-Gm-Gg: ASbGncuVyVQekCungylhDF7SYwyM5m9bYP7sZXRUtKYFljn2fZH8NLS/GUBTfPy0bDx
	FTwTpGlWetUsEU++jyTZwRo/biV5kmSl0RGRO9o4N4FBpMwIaW0HsO2u5lOEHIlkqDZhVqu2Ubl
	cBxrUwVZvbuw4wofI3zqvJ6xXFS/ws8LNeb3OCj+nTlQqZKqy0O2WCoggq8gHmILnF8sd0DarXi
	oJiUpvAe5Txf1er0dAUebEyidbIKQ+bfDgQlZrQj03SZh+kdFcopKomrWtdDqd4XOFmUuHdK6A+
	r51uRYG/PFV4T/y2rh+msQPirOHOM2lqniAtzepXPsQ=
X-Google-Smtp-Source: AGHT+IEYb/TxWH7h9rIJYdFAhCx5Y6IaZqou1OZ01+Q2yYFx9tNkyEvjOAUAcCjaMbDGrpe7Y/AIAg==
X-Received: by 2002:a05:600c:4f47:b0:436:1baa:de1c with SMTP id 5b1f17b1804b1-4365c78125cmr26618105e9.13.1734610765626;
        Thu, 19 Dec 2024 04:19:25 -0800 (PST)
Received: from localhost.localdomain (host-80-181-61-65.pool80181.interbusiness.it. [80.181.61.65])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436611fc762sm16679975e9.11.2024.12.19.04.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 04:19:25 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	upstream@airoha.com
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/4] dt-bindings: clock: add ID for eMMC for EN7581
Date: Thu, 19 Dec 2024 13:18:50 +0100
Message-ID: <20241219121902.16339-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ID for eMMC for EN7581. This is to control clock selection of eMMC
between 200MHz and 150MHz.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes v3:
- Add ack tag
Changes v2:
- Drop additional define for EN7581_NUM_CLOCKS

 include/dt-bindings/clock/en7523-clk.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bindings/clock/en7523-clk.h
index 717d23a5e5ae..c4f8a161b981 100644
--- a/include/dt-bindings/clock/en7523-clk.h
+++ b/include/dt-bindings/clock/en7523-clk.h
@@ -12,6 +12,8 @@
 #define EN7523_CLK_CRYPTO	6
 #define EN7523_CLK_PCIE		7
 
+#define EN7581_CLK_EMMC		8
+
 #define EN7523_NUM_CLOCKS	8
 
 #endif /* _DT_BINDINGS_CLOCK_AIROHA_EN7523_H_ */
-- 
2.45.2

