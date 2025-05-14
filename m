Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE33C224B06
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 09:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747213465; cv=none; b=KbvxUjIOnohvnBFI0FtpKDGJS69vK/6KhWVUTWf9QEgj03hm/LeM7bke7gP0yldI729spiA+kzsQpQE4KMXiGsUd3YqF6J5Y43kIg2eIcbQxwWlAB2MwFvKLWlppwT9OF5moSDia2dSifNbrJZ9AxGeHjGvKKvUjFdk2++exlWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747213465; c=relaxed/simple;
	bh=5K9vutlNbCySpn2mNDTs4+oqYbErEJzRkyHBo6CSjUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jrsJ0kq6eh1KgveOrVvq26TLxIQh1wkX2JyXd65QopcQaoFaBsUqlDxUb7zjKCvvpSQ3elkyPpwGip7w9Tu/JaDoJ/B1zf32JbqYiZleXDv3DEFWf/j4DMWmF8MYcj1nNL9KeqDnH9cOHQKomNVmcsWHpW0fLVMIdAxoaA+FgGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RbivllH1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RbivllH1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso49628885e9.3
        for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 02:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747213462; x=1747818262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P3wGtNITHa0U9o78hhbypZiCBzOOsk2GAy0wSEWd5SI=;
        b=RbivllH10Q9QTchRwQ9uc4Dd2nm5qVYmJvwQABgbkSafJB3aDZMHSR5dw5S2WpSSH8
         aGbqu9ThmPKGNDHezRGtYQFVa1SH3WUUTo+CLWISHirFmnsJ+IYAg/5/SRMiZWSa/WJu
         cO22pWZPv//sbZpldEHSZxwFBAWU7cyEoK0mAuYCQZ16+b2GfcA5IUsqm6Isg64b3yuN
         dcvQ/zjf2rTkp1i6ahze4XzWjngOroe/hVushea33xVxjb445peCXwgwhbnAc9x/RYh3
         t22OsS+2KWgiYVnBN544tgdt2vNgH71RT3zgUjNi3CEUpcAnqYIHfms0muWuHf93R9fg
         rNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747213462; x=1747818262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P3wGtNITHa0U9o78hhbypZiCBzOOsk2GAy0wSEWd5SI=;
        b=iGTSbb36TWnghQL8FGVn2euVEhUQvqdEW/wMeVJpCEsaDHcdsAhj7OO8WDA5QgH5pw
         w3AXsBq3nCDMnJXpYdZXNBfXBOq93VQ8c37NJI8yVWQXUkc8WACAQ7GSsMurCFf2jMb6
         XidgALVmnPn6l5CLiyNJ2XhL9OL2d59CUxcC7mYhPAIlq+5lkj1F7zvNMPKPJhf/p57A
         axra+Tv1/ZGX3kHkGa1NOQNy+jyT4bTuqLu7VyPI217lZzHpCP5xQsauvC/2fmRoBb20
         GI39BXkbB9/XwWfiFgxDLX1tKCwFulvBZpaHHURN+K7Nep9H9q9hSRRoC8t3EdHigaka
         2OjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkdgVk7zIQLKSod7IE0N27eMZWHnE5wxn8hTBEuQ+iRxiF6qJ4k6fofTRv2egXZydkC5aF0SFHB4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxelSMwAtFnMw/MGYFUzOg1IQd7zdhhGCgv5Pvesq6f7v+NkwEm
	7tH2YCgi2sbztDuLY5sj545cXvWPWRTD49AKyXVGEvZ86a/yMFH+jPP4ndyTw8s=
X-Gm-Gg: ASbGnctTdi5wpipnmeOCCOM6W77EvNwLkXkMWQ1qjan2zFlwixEeJmJZ5PpcdMh1hxu
	RgdBi3cFa+As6hNXNFPJEdRo6xTgb1xQ1Ja9gIRbJPIMbYUHYF6N8aZHMP/5OOjW+EzkMZztLy3
	q/54UyD7E4CA7exY2dlPBut66/YjX2BxO+BeM8VHSn0b8+9ov/3cxrgRKT8jOr3TkqARYJPKhtZ
	p6VyQBaIBZLCumoMRsr+bsyD2JlfDuzTQVhIzlE5sMdBks3qkvndlPRycYcn4DvzrAPwWYHclEu
	vtRAlN4ukE9qoljbTExoPDExmi1Ma1jmpsxiUUXMGXCkaJxvAwKbU3ZSofAwbnKNzGfgyWbnPBz
	Tgl6FqNi5fiEWCDM=
X-Google-Smtp-Source: AGHT+IFjZxHD0RqKbm4Bz/XFWoN+olN+g7TOLkSX6yfDvf6e23UqKDyHNvx4g80jZ4+20Yv+zITBSw==
X-Received: by 2002:a5d:6342:0:b0:3a1:a96c:9b76 with SMTP id ffacd0b85a97d-3a34991decbmr1659237f8f.38.1747213461891;
        Wed, 14 May 2025 02:04:21 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfbesm19286561f8f.10.2025.05.14.02.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 02:04:21 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 0/8] clk: renesas: rzg2l-cpg: Drop PM domain abstraction for MSTOP
Date: Wed, 14 May 2025 12:04:07 +0300
Message-ID: <20250514090415.4098534-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series drops the PM domain abstraction for MSTOP to comply with the
requirements received from the hardware team regarding the configuration
sequence b/w the MSTOP and CLKON bits of individual modules.

The initial MSTOP support for RZ/G3S was proposed here:
https://lore.kernel.org/all/20231120070024.4079344-4-claudiu.beznea.uj@bp.renesas.com/

There are no DT users of this abstraction yet.

Please share your thoughts.

Thank you,
Claudiu Beznea

Changes in v2:
- updated the title and description for patches 1/8, 2/8 along
  with their content
- added patch 3/8
- collected tags
- drop duplicated mstop lists in patch 4/8
- detailed changelog for each patch can be found in the individual
  patch

Claudiu Beznea (8):
  clk: renesas: rzg2l-cpg: Postone updating priv->clks[]
  clk: renesas: rzg2l-cpg: Move pointers after hw member
  clk: renesas: rzg2l-cpg: Add macro to loop through module clocks
  clk: renesas: rzg2l-cpg: Add support for MSTOP in clock enable/disable
    API
  clk: renesas: r9a08g045: Drop power domain instantiation
  clk: renesas: rzg2l-cpg: Drop MSTOP based power domain support
  dt-bindings: clock: rzg2l-cpg: Drop power domain IDs
  Revert "dt-bindings: clock: renesas,rzg2l-cpg: Update
    #power-domain-cells = <1> for RZ/G3S"

 .../bindings/clock/renesas,rzg2l-cpg.yaml     |  18 +-
 drivers/clk/renesas/r9a07g043-cpg.c           | 132 ++---
 drivers/clk/renesas/r9a07g044-cpg.c           | 168 +++---
 drivers/clk/renesas/r9a08g045-cpg.c           | 227 ++++----
 drivers/clk/renesas/r9a09g011-cpg.c           | 116 ++---
 drivers/clk/renesas/rzg2l-cpg.c               | 493 ++++++++++--------
 drivers/clk/renesas/rzg2l-cpg.h               |  66 +--
 include/dt-bindings/clock/r9a07g043-cpg.h     |  53 --
 include/dt-bindings/clock/r9a07g044-cpg.h     |  58 ---
 include/dt-bindings/clock/r9a07g054-cpg.h     |  58 ---
 include/dt-bindings/clock/r9a08g045-cpg.h     |  71 ---
 11 files changed, 603 insertions(+), 857 deletions(-)

-- 
2.43.0

