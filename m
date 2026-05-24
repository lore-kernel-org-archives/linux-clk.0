Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977F32F7EE6
	for <linux-clk@vger.kernel.org>; Sun, 24 May 2026 13:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779628428; cv=none; b=dzisxSIT4TGbxK5ZJG5VGsEKcndmg85WZSu5+wzIVM0bdT7K4Y/jHb0+gz17jnZt9HGSU/cbbVB89mBY7ph8JtdoS09t1yKbhtsIOi2IJiRuZM812UfQiPe+tLeY3zE2Gi1vn0wtNE/UD+B7qYlPzX1qelCpLq0OClTf+/DzGJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779628428; c=relaxed/simple;
	bh=I1J+h10KnGbXFqzg6AyIcXhgiGUtuuhHZ4fC5cNtor0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d5UBRBZNKqn7BLPAwQk5dmi2dCOOhjLSv7nHXMyCFtnsjx7TPbglhkU1Z5c53UM4+y+G3rqHaLB4Hg84L+cTqqHkIQ5b6pL3QFbac8Uj/hhkRTtXJAdM/jEYVCbw6eRxAsSrdaXJ9IR5h8iYg5uRkN5xXudGnhCyI3h3obHUUp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ErwmFcxa; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ErwmFcxa"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c736261ee8dso3997979a12.1
        for <linux-clk@vger.kernel.org>; Sun, 24 May 2026 06:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779628426; x=1780233226; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KH7lD2kPuCDnCeLXXndiPaFJorhGJZaX8sM6bkfuBZU=;
        b=ErwmFcxahpHNcRxWuPnwpD3PstLJdgSYYsLktHKPyYzeD0zBfv56tUY6Bfb0gF6eWa
         o8papIPissGmTXD4W+lat9xavX26mYXHxyYpYw+rsHHhioMFD2PvctDUXcJOHpEZi8nx
         IZlIo24EAsCh+zuAMLcbWwleHj+KJFCopRCzryS19jV30VRRzOKe8qg5r77m/3b1FcBT
         cenfsrWI2o2RhITzhagbkjxxm7mt+9EtXOrmlgSrLiy0877syentbP8yAJ7lNJq2ryWZ
         0tqzjOEBmdzBCi9UW8qRkjV2N6UcBJFsQIAOJVt2u4TSZVJEwB6hLmFzMIZPfmTTlyA1
         jpcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779628426; x=1780233226;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KH7lD2kPuCDnCeLXXndiPaFJorhGJZaX8sM6bkfuBZU=;
        b=ld3k1tehO7vPUYUHhSRahJMeNCdpweuh4vl63s6gvLxXNJP6P1U+XLUD9y71Gfv4Mv
         Es8qGY/WlqHI+KEpNlJ0uk88ntVTW02XadgMhRqcPKPefXxQgzvfro9JfIGzNzPmNfmX
         ldiP8KJJyldxPLDiOIPfeKs4zlc93khu5YVpb3W7/HMV6bowKoJWwJiFkciXgef+Cpdw
         gnf5BKgKrv73+gAcwkwY8q68Ppj7NQ2xOu7aHbhQ3qrgFnfW+3KqyY5fiXjWnhj8RBMU
         aGurbH/LzF3LsAlB8JvtREFG/QFlPnYbY7kn8Y2Fa6MTeVb6YWHyFInmr/lvWdrnujD+
         gpyw==
X-Forwarded-Encrypted: i=1; AFNElJ9EAt4QxMDrJZzTuTLD2KiXXu124WD2RrOHJKR3u4i4+wv0E/o7D31eNQb7SfjkPmpnUt+qnKW8U+4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7WPwziXqMGWQBGD1laR581OMENQiwscNhK6NC9aGsfzl/OZ9d
	MW6GHs9nEj8GTsb+qZdODXT7Q3CkLutGjnyxrnuLX93KWJ50E4Wvv6Xr
X-Gm-Gg: Acq92OFqLXbh95A/6vgb8Q5Bk/yz8yUr/h61mzWvxCtQhLLNB127mP8fCUR7b933yK2
	P7+XjsGoZea4R9gTC1+JooO1KYoBzVbonRlAXwrechnXM+wR4HX8OL88nlUVUEaPZFke3us7zh9
	Gtxbu3/LxyBbDp+k6A6uSSbSI2vtcqEvlsnrd6c6EniB2v7qlcK1yBIAGAspUV/w4GFjdR5IITe
	G+qLIdePbKaOGLlMrUUxqp2EZeom1Z3/UxF7YKiTWsp53VXCNtESmG0ghjxvP9R1gEz9gcmpd7j
	HHRF7L62aBkTqAdTnsFiDksV3Cn1Rb3YbK9jeRnwXZXeNU8GyL73pXp1TvHyqlGgGzAGBqNwaRj
	GKQfZvH6YKEbGPsOcYREgKXYdN8lEQu0Hyn2dfZxGEP3uw0d57+nG1VeBluW+bVkNizc9smH58d
	U2gDznfYVi+H5YXzCmYGKxQ7JGKhI=
X-Received: by 2002:a05:6a00:a383:b0:82f:21ee:270e with SMTP id d2e1a72fcca58-8415f6d0bb4mr10541125b3a.42.1779628426474;
        Sun, 24 May 2026 06:13:46 -0700 (PDT)
Received: from guoguo-lecoo.lan ([104.28.159.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fb28d5sm7163128b3a.41.2026.05.24.06.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 06:13:46 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH v2 0/3] clk: add Siflower SF21 topcrm support
Date: Sun, 24 May 2026 21:13:05 +0800
Message-Id: <20260524-sf21-topcrm-v2-0-4527aae05c3d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1XMTQrCMBCG4auUWTuSHxODK+8hXdSYtAOmKUkJS
 sndjQUXLt8ZvmeD7BK5DJdug+QKZYpzC3HowE7DPDqkR2sQTGimuMLsBcc1LjYF5EZpy9Rdc2m
 gLZbkPL127da3niivMb13vPDv9eec/5zCkeFJGi9c+0nvr2MY6Hm0MUBfa/0A4l5N6KYAAAA=
X-Change-ID: 20260515-sf21-topcrm-1856c05b6138
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Yao Zi <me@ziyao.cc>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

Siflower SF21A6826 and SF21H8898 are RISC-V chips with quad-core
T-Head C908 for home routers and gateways.
This series adds the initial RISC-V Kconfig entry for Siflower SoCs and
support for the toplevel clock and reset module on Siflower SF21 socs.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
Changes in v2:
- drop "if TTY" condition in ARCH_SIFLOWER
- drop "xin25m" in dt bindings for the possibility of a different
  xtal frequency.
- use index instead of fw_name for xtal clock in the driver.
- drop unnecessary fixed-clock node in dt binding example.
- name the top node "soc" instead of "/" to fix binding check
  failure on missing "model" and "compatible".
- drop SF21_RESET_MAX, rename SF21_CLK_MAX to SF21_NUM_CLKS and
  define it in driver instead of binding header.
- split dt binding header into separated clock and reset headers.
- sort headers in the driver
- add a shared sf21_dual_dividers for the two dividers in series
  in CMNPLL and PCIEPLL.
- multiply before divide for PLL VCO calculations.
- change cpu and pic clock flags from ignore_unused to is_critical.
- use guard macro for spinlocks.
- split clock and reset locks and use raw_spinlock for clock lock.
- select RATIONAL in Kconfig for clk driver.
- use FIELD_MAX instead of BIT(x) - 1 for field max value.

- Link to v1: https://lore.kernel.org/r/20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com

---
Chuanhong Guo (3):
      riscv: add Siflower RISC-V SoC family Kconfig support
      dt-bindings: clock: add header/doc for Siflower sf21-topcrm
      clk: add support for siflower sf21-topcrm

 .../bindings/clock/siflower,sf21-topcrm.yaml       |   60 ++
 arch/riscv/Kconfig.socs                            |    7 +
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/siflower/Kconfig                       |   23 +
 drivers/clk/siflower/Makefile                      |    1 +
 drivers/clk/siflower/clk-sf21-topcrm.c             | 1017 ++++++++++++++++++++
 include/dt-bindings/clock/siflower,sf21-topcrm.h   |   42 +
 include/dt-bindings/reset/siflower,sf21-topcrm.h   |   25 +
 9 files changed, 1177 insertions(+)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260515-sf21-topcrm-1856c05b6138

Best regards,
-- 
Chuanhong Guo <gch981213@gmail.com>

