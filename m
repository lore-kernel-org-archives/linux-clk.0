Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB201E885A
	for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 17:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769274610; cv=none; b=GiNU6MMLKqM93ZsBx99nRxYsZZqs2N+CikvKsZOnLdj7uD30faTBtDK7G2wW5ozzM3nG8trL0VQ8d04bZb2NqSWOQl9Li4N7RljL9In9uM8ZVw0h65hEcx5DWgknlGG/8b7+8dRi6cBCBJ6a2uPOprpvUn9V9oUDC7m0bvoY6JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769274610; c=relaxed/simple;
	bh=jofWWnwmoG4Nrm+u2R6rEX8xNv7yEnOjBBXdOGfBxTY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DA41wXsaMNBXXi7ab1OJro1OVO6W8n75V4CaDiq+aV1woq1jRKn17PMA0hmjnQs/Fcr6V3EB6LURmk5f+pQHY9rPX/+uY3Aa19dcNvMdbEGw47D7UudQ7PQqdIkb3wtn/59EuztkxjD04frbD1jgeHg0UZlSmrJBobaFbg5rskQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QD20KjWL; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QD20KjWL"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-65808d08423so5040781a12.1
        for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 09:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769274606; x=1769879406; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4pEYynqLlf97tqquz7gBzDn5fbpmeV4yt44zAz5u1qM=;
        b=QD20KjWLtC5tQlhWj1fLg4XMwdbXWkQ0TnDZdgK8uRCVL4Dnbg5sqNZMx9VOdp2pZ4
         59eT+Z4vDwMO3rJxzTmUxM3I7ERb9zj+aVI0lKKO/fP6BtxuLlCQE22NmrHB570aa4UZ
         sPMoMCL62DCD29j291ajfjk/YOcgxM6dvuTKLUVY03ncgHSj4T8bFVF9OHeDTAEwDkkh
         LJIOLrqzD9qdKMoTswnMgra70rtzyF4wPImfzf/sge2EoWwh/5FfljaqzqF8ya85RhcO
         oFNm5zKctGIRqNI6M7MTJMJLb3mW6+iz1L1omnuwvKDLvEKnRPyJiVhlBzMvzhgUnQLN
         +9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769274606; x=1769879406;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pEYynqLlf97tqquz7gBzDn5fbpmeV4yt44zAz5u1qM=;
        b=jIgpm5dJvlhh7639cbF1g+GLUJKK8npc+TyzJKxOSN4eiF0GGVITXb3WiCn7DJ2e02
         75UoqFDt0OUB0zLMXoEWnlKyNwP9YgU+akK6W2/CAqSnaXF5veO+9ZwyiRGhMxqJGbUM
         96d4hf+q9qUkZzF5cX3k1ZIi7Vyv3/pG1MOJI5tAGsslEWLaAfpnCIgxybd90aiB28BM
         7/L5DIbGext+sJlJXyUhGT/PTcmV6NxIps4KE9mA7eE0OOOAxQCKQo2LHaTuNJFkBI6J
         j8VjukkIfSfn2pHVEtPJs1pBYODDORLp1Zhja4fjKIBqmz2mJZKNkeOWa+l1hK/1QIZG
         rhCg==
X-Forwarded-Encrypted: i=1; AJvYcCWALrWA2wZ6ihLq5RRVlJeTiZHffyhMB5CGmnfGlLboSSULu3FDtnrfJA47SB8s8hSVNjVibQv5i5w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXh0FkBOD8sfdCENvBGesyH39zIYi1HE5XkIKza+yrZNkSfE8P
	XIwBdMTuZ0KUWiN/urB3dCJyciwsqhlIpn5uXXg8Naelaj2CEq+JJvIU
X-Gm-Gg: AZuq6aKQuBj2qalfmB7E2yxuswQL72IUpi3UzBFtkD2aUp3g0S6D4nJuSPGSGIRPIq7
	3Uhi880RHJEh1rSUfljq116MDr2h44tZqswGB5e1HtouDhm144Gmk01jHyNlNOQPcCFYA4dpjNx
	zN6WM3pRZNXJ230ZDNPsPOvlHma9bIitJv5nTNsjMy7Z2w/NS5zNfeoHpAIfiJOFPn/IkEs3U7s
	UqOkLLoef74nvNM+Aq7LU7Ja3LH0Ld+Gcxf9jSvwpBQH4U1bNw9kFjq8VtwdP46iU8DIb9DsZL+
	b8NSTKT5RBg4v1hnPBJldA1OCKXcZPS0oOGozeb7VTCsP8fbQ/2TtqS0IRJHLs0mTwrr2KPZc9I
	u55e0jpM6P8JpqKxEjvISKOP5B4t04oz30nWyI5HwbFrE7ChMgIr4l05RucVGUKtjcLukv79GHW
	ijQVXuLhoUzZNkBYPcDwlquQO9KKJQVhNw3UKkhR1nHQ7qHTVba+ksBpLbvKSEy8v2LhHaj3osE
	ZQg1+OEgJx6IxUf6Jiyj8RjJVpNsfjgjHM=
X-Received: by 2002:a17:907:841:b0:b88:6dd4:9c92 with SMTP id a640c23a62f3a-b886dd4c7abmr307707966b.62.1769274606124;
        Sat, 24 Jan 2026 09:10:06 -0800 (PST)
Received: from tablet.my.domain (2a01-114f-470e-6200-4c6a-9244-66ab-7c8e.ea.ipv6.supernova.orange.pl. [2a01:114f:470e:6200:4c6a:9244:66ab:7c8e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dac6esm302680866b.7.2026.01.24.09.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 09:10:05 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH RESEND v7 0/7] clk: bcm: kona: Add bus clock support, bus
 clocks for BCM21664/BCM281xx
Date: Sat, 24 Jan 2026 18:10:00 +0100
Message-Id: <20260124-kona-bus-clock-v7-0-9dffe1bdc08d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 phone-devel@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alex Elder <elder@riscstar.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3090;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=jofWWnwmoG4Nrm+u2R6rEX8xNv7yEnOjBBXdOGfBxTY=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpdPzq+wj4PJy/Z2WSDzD16fqcy0N8pnAAj1rHj
 9Xrxk2eusqJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaXT86gAKCRCzu/ihE6BR
 aKhtD/4lUst05I/73muK6zgkgetXnLj7dE8mutbAdPu3v8GfvQWoAmdQq1rUvrXZVLRSfVOqTnF
 nEQ8VBfM0vatX7oN9UOA4MBUPGXh/Ed5+qSFyCF0ZnRW5b0TpBlECq8IQFd+30kDYnc3YTFGnYy
 dvklvIXD9T31YWqc5zaEJPydlpC66lmPVe0HRSy18yi60xbCg0T7TV2kS/YYxYz8pmn+tqgwSfS
 bQ/dInrqjixoYTn+DUxcnggrJSPi1x4NcoX10hEbcJaHsEm/3oSiiUlII5HT3xY8sk3Eh3NcvDc
 ENiP4ZqX1Oy5m4f+hGGlkQ+03aRJwKXpKrgN345wDk6G/SIxmuIfCWf5L2MQ/WIALw0xsJV+k4Z
 U0hQ14wM9xoopOeIgauE0B98/Tq+zaFCu+fQ1az91FhyZQuDFpTqcqCBVlfpX3XwLaoG9pclSTy
 fvPjHAFOH+VtM/pCBtG/BQ0R3fFhu3vLBbVje621umjhv/5Bvi5IoIjEmdJc6k/fihFBB84L0jz
 JbcLZz6LNg94PHSoVqAZCm30hoLCQdnfFHcOcNkHvGVAdou6ZrzEDemuWqbcLQgMRJivriAFciw
 IkI82aLDu+P5SQ1H9ym+ncBvuCtI/kdFkxNb6JBgOGfRcqRXBYDDYqC3znHXjrhgfRKuzBB7lDD
 ns1Iorf+0MZiidw==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

This patchset does the following:

- Introduce support for bus clocks. These are fairly similar to
  peripheral clocks, but only implement policy, gate and hyst.

- Add matching bus clocks for BCM21664 and BCM281xx peripheral clocks
  and update device tree bindings to match.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v7:
- Drop DTS patches to make merging into the clock tree easier. They will be re-sent
  in a subsequent patchset.
- Link to v6: https://lore.kernel.org/r/20250813-kona-bus-clock-v6-0-f5a63d4920a4@gmail.com

Changes in v6:
- Rebase on v6.16
- Make kona_bus_clk_ops const, add a new commit to make kona_peri_clk_ops const as well
- Link to v5: https://lore.kernel.org/r/20250430-kona-bus-clock-v5-0-46766b28b93a@gmail.com/

Changes in v5:
- Pick up Reviewed-by trailer from Krzysztof on patch 3
- Rebase on v6.14
- No code changes since v4
- Link to v4: https://lore.kernel.org/r/20250318-kona-bus-clock-v4-0-f54416e8328f@gmail.com

Changes in v4:
- Rename moved CLOCK_COUNT defines to CLK_COUNT to avoid redefinition
- Squash BCM21664/BCM281xx bus clock DT bindings commits together
- Link to v3: https://lore.kernel.org/r/20250308-kona-bus-clock-v3-0-d6fb5bfc3b67@gmail.com

Changes in v3:
- Fix DT schema example in BCM281xx bus clock bindings
- Move CLOCK_COUNT defines from dt-bindings header to the driver
- Fix BCM21664 UARTBx_APB IDs being out of order compared to clock
  driver
- Link to v2: https://lore.kernel.org/r/20250303-kona-bus-clock-v2-0-a363c6a6b798@gmail.com

Changes in v2:
- Drop prerequisite clock patch
- Move clock/bcm21664.h dt-bindings header change to dt-bindings patch
- Add BCM281xx bus clocks
- Link to v1: https://lore.kernel.org/r/20250216-kona-bus-clock-v1-0-e8779d77a6f2@gmail.com

---
Artur Weber (7):
      clk: bcm: kona: Move CLOCK_COUNT defines into the driver
      dt-bindings: clock: brcm,kona-ccu: Drop CLOCK_COUNT defines from DT headers
      dt-bindings: clock: brcm,kona-ccu: Add BCM21664 and BCM281xx bus clocks
      clk: bcm: kona: Make kona_peri_clk_ops const
      clk: bcm: kona: Add support for bus clocks
      clk: bcm21664: Add corresponding bus clocks for peripheral clocks
      clk: bcm281xx: Add corresponding bus clocks for peripheral clocks

 .../devicetree/bindings/clock/brcm,kona-ccu.yaml   |  49 ++++++-
 drivers/clk/bcm/clk-bcm21664.c                     |  99 ++++++++++++++-
 drivers/clk/bcm/clk-bcm281xx.c                     | 141 ++++++++++++++++++++-
 drivers/clk/bcm/clk-kona-setup.c                   | 116 +++++++++++++++++
 drivers/clk/bcm/clk-kona.c                         |  64 +++++++++-
 drivers/clk/bcm/clk-kona.h                         |  14 +-
 include/dt-bindings/clock/bcm21664.h               |  17 ++-
 include/dt-bindings/clock/bcm281xx.h               |  24 +++-
 8 files changed, 499 insertions(+), 25 deletions(-)
---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250212-kona-bus-clock-4297eefae940

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>

