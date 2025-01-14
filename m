Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C0C1D5AB2
	for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 09:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736845895; cv=none; b=DX+Uc10Xe7nQbaZp1ohlf2oI3vCaRcjBKg8GG8N6tGbkVZ2ZeTTQe+NexUwrPt9nBUiRb8IfiWLWcF5eeYRCvhU5cNQMA9qi93uJ9q7+/RYhbtMEg03510KKC2ZGkFMb7Kcs78XOEI7kYlEOe2Vpl0tmlN0/AX0I1WA87KmZujc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736845895; c=relaxed/simple;
	bh=nAUIhH40V9b0M+O9A10WUps+rpYZiNa1arFJMVCaiDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XDHWp95E3NT5vrh9QR3aAiiyTYPUQCoVNXE9NG4ZwDNDXks6VEyETFo3VUVNwcAEC/Zt0aCv1VYEp84YrDGuskzQ4+XHfy1tIkgU1cNB5gJe/CybJjkVgsgT9erxwJAT8VpaPExj5zOJGmZXc0SUT+3NihtfVsCKy+Fmrec1SCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=dJY2RMK7; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="dJY2RMK7"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so916241866b.2
        for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 01:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736845892; x=1737450692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tBJtngiebfYxaY6Xsqyz7X62QEYJt/s8BWutCfjsmVg=;
        b=dJY2RMK7hHjF89YobKcYPvnCJZcJwxKCocWvJnxf+ve5gP4LLz0MgKCubCN+Fsshxz
         Wh6L7Kz6IhUpqN2AmvGcNYJktHxF+qK2tnZ3yOOPPO86VhCcseeR8eWo6MY+6kghWEto
         7sKuNpWylU1FHd4UxQYAquA75/dZr52150H10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736845892; x=1737450692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tBJtngiebfYxaY6Xsqyz7X62QEYJt/s8BWutCfjsmVg=;
        b=KAy1bThp0KTV6VuthYPgfWjDI3ge55TKvx5xvQOxPQu0keePrxfzp9dBPpLa75xEAY
         opp0/zcpAlTRqE57G1HNZzSINXABqSBdfUsQmJWZpeYhamGwlbKQeVt2bmgDFwLdxLJi
         +RZXelTeVd1E/fEJvq8BgQrZb10/9ZCWB47+cR2R/dTEbxuMVUtEq4XgEC7wYpUbjmJi
         jz2cHbiy2j3d89WAyTGdn4bZBberGy3BSqxp7TVgVWjs67IOFa1pBQHqkmEnD7V4JpO0
         mqR0Q+tazVouuNex7hvYD3+eXh4ST3NODxCcsqWIlgF95bYdzrkPltABhAA7G5gerg7E
         unMw==
X-Forwarded-Encrypted: i=1; AJvYcCWQttP3T/zLQv4+EAb/jYVwYm+/ePTKn/5G69DPdFNNfLZGPMcwrFMXUJfYhJTrYs17LNI92Lp1a3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlM8QjRn5dbL4rP86zU78KNRHXIXjg7N6/mNZiBo2ZfzFnBDsv
	YoxdVTSY9KYeh0LlkjYA+maz9/vRDr7/+BERqTHssDBe9mdnMkwglCdCl82bAWw=
X-Gm-Gg: ASbGncvfMcrOXHPM1MdZ1ZS1QW4WF6uOlEItPfFbtar0pZkD1lB1ugmte2OELgiL5m7
	YTxMzRXyoL1v01gHKT33cG/O4pxk9uRODO1GEBGULXiHBYb/GmOj3lx5GgY0DApJ3tTxr7Ty4m+
	rf8v0Gr+hvghCQDM4XPOQs8uyka8M/QUGJChgkbIe+zkn5ggxcM0jkj+auGieWmqhZBSpsFcvJT
	Vjx1f7gixnFTnNAZaOdjm9dp6qCYbGlHCIRkjXAYR9ozHaSpWZIeoyEpvVTtGOnwRj/uWuOpoFo
	B3kA52zAgN0KC2bE6FS9PA==
X-Google-Smtp-Source: AGHT+IFP0NoB1nleymlyPhioCTpMBb5sIxJwE/HcZBxgMFsQqKGSpudKtOUDjpU6FXv2wGNPs8+Egg==
X-Received: by 2002:a17:907:7e91:b0:aa6:834b:d138 with SMTP id a640c23a62f3a-ab2ab6b52e7mr2115633366b.19.1736845892238;
        Tue, 14 Jan 2025 01:11:32 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95b7317sm599640766b.154.2025.01.14.01.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 01:11:31 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v3 0/4] Support spread spectrum clocking for stm32f{4,7} platforms
Date: Tue, 14 Jan 2025 10:11:12 +0100
Message-ID: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series adds support for spread spectrum clocking for stm32f{4,7}
main PLL.

To achieve this, it was considered necessary to also apply patches to
improve the documentation (conversion of `st,stm32-rcc.txt` according to
the json-schema) and the code (use of FIELD helpers).

The series has been tested on the STM32F469I-DISCO board.

Changes in v3:
- Changes to patch 4/4 "clk: stm32f4: support spread spectrum clock generation"
  according to Stephen Boyd's suggestions.

Changes in v2:
- Fixup patches:
  2/6 dt-bindings: reset: st,stm32-rcc: update reference due to rename
  3/6 dt-bindings: clock: stm32fx: update reference due to rename
  to
  1/6 dt-bindings: clock: convert stm32 rcc bindings to json-schema
- Changes to dt-bindings: clock: convert stm32 rcc bindings to json-schema
- Changes to dt-bindings: clock: st,stm32-rcc: support spread spectrum clocking

Dario Binacchi (4):
  dt-bindings: clock: convert stm32 rcc bindings to json-schema
  dt-bindings: clock: st,stm32-rcc: support spread spectrum clocking
  clk: stm32f4: use FIELD helpers to access the PLLCFGR fields
  clk: stm32f4: support spread spectrum clock generation

 .../bindings/clock/st,stm32-rcc.txt           | 138 ----------------
 .../bindings/clock/st,stm32-rcc.yaml          | 147 +++++++++++++++++
 .../bindings/reset/st,stm32-rcc.txt           |   2 +-
 drivers/clk/clk-stm32f4.c                     | 155 +++++++++++++++++-
 include/dt-bindings/clock/stm32fx-clock.h     |   2 +-
 5 files changed, 298 insertions(+), 146 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml

-- 
2.43.0

