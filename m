Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B4C30E836
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 17:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769795435; cv=none; b=GCxNcOQ5pJz3OIx41LZxGTvQEtUd8hTXUJPwLzxE9eUBJCQFIRsjZ+SDaxVoJHPOsmRYMGuM7G1A0hmap+yXOxEddYImuavFWs6FmLBj0CbIpIY3QT+oJ0/IxxVUOH4az1azkT94ObNe/3uPOoTLnFy7dtF8D2kDbW1LqZ9sRjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769795435; c=relaxed/simple;
	bh=VvWd/mkPOOUu/ToKuu1FQ0VjCS5QY754n/pib2y4w0Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ULfRn6NEe8TKRG1hqqpWlelJEFgZfROOkaQTQyhWWYe9N55BLJsZJSxmqc3+izyEi9Ih7yidbWvlfB+BJDc1esDKXO1Hxk/eP9TirfTW+NvDRuTpyGAt95EaRaERrE28tz5FbMYs1Ds57vzTasm3Ih5SlHlzgJxgns57OIR8ia8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=W3waqR2b; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="W3waqR2b"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79088484065so21900557b3.1
        for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 09:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1769795432; x=1770400232; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EqVc82Oy/ZflqXYTUlnweH/P2SRPYGdES/1mmOJBJfg=;
        b=W3waqR2bP2l+m6ZT88vntr9cXqLDUbnsDY9kChZKPVZkRFC6MayqNJ4oPub742SUST
         MMaP3Q2hP8LS7rps8q4repItYMHDYZ7aInAdzdPfmNgjImrfs2AxXytHUrnoG6ouv6cw
         84s8AVM0D/UPwyvYI7qLym9BPCd15BD66QtaLRHNWJ7LLl1sHZ3qxEU0fjGDWeU0spF7
         HMJSkfoyi3qkxs2uKf9e2pNw4cTUyCKKMe1nux4ANVTZg9vr7FSd2vqOG7/4ImIugh6z
         GOcS0/ezCCN6o8w2f5ptuKSffgHs+m9PkTa0iRqBbKHjwq5SwJUXkBNvpmxlFIEF7VF2
         Ky0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769795432; x=1770400232;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqVc82Oy/ZflqXYTUlnweH/P2SRPYGdES/1mmOJBJfg=;
        b=RUtiVeMViposYoekGbTI8CAc64V1B+i3hTe0SnF/tJP+YFq9dFMVhnkrJJ7q/ViZPV
         H35wO5HeBgsZppEhUSD277WhS8dXtB9ShCkPe80SOL/9nLC+yHpCm46WJeF+agwbkNpY
         eFZ902HvZ7/3UeN3LdZY57BnFwk5amqtPym5+oa5e0DjTU+vGjDXCIhC+5JF9nhx6p97
         mCYG+HscYaM3h/dUZaYytXm3NXbkxukDFN6BM8SB2MPqrou/Inh+H7hjPOLuMhMMHVpO
         mBCdPPeNGRkezdhX7kIYSBh69yUkAw7TQBwFX5XNRWg+5KgXx1FNfQxyHtZzvSWrtyzt
         nMfg==
X-Forwarded-Encrypted: i=1; AJvYcCVaW89ZEKBwAK0XLgQ297sYaKASZGFnVe6/eCV/6P0+Siu+WKYrGd6/CSvhQGBOt1a1tNcKkng66KE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeiIIyloH7+An0hPVEPpMeir0ocdGP9GYQ5BiQpmRfR6IvxfBC
	GX1Plw+7DLk3pok9l3iSwuurP+8S+L2Ih5SrKR28hM9C+2xZswAs7VqOMWJLfzKb6n8=
X-Gm-Gg: AZuq6aJ4oKxNBOjQ5ZGJJ9HEXsabRZK9h1kgOtZ1Hl/XAPqZQzIe+4K8qnr82bUNLw1
	wfO07X/e+UfylGU4AwR9RgkSIPjn1AXqybu4pt/yi943CNOvbejh2u0EJi/Wu2v7u7Kq8yzkE9O
	1fxpvOxRJhb9YFKbdCrix5k/17oz7Q0ouIa9AHjr6dj64xRbM8j2m2MFWTiMHqrVLTSf+XKF2C5
	D3mxhWWmBTmp6PVCV7EAHfjAYhmechD84IRON2UMDLv/UDAj5rytEZ88gban5WC+K4UTFus+Ryy
	L7bHSaK8Dmw6RVgyYpzkH/80zF5n4/5fbubMgYnZOxpL25cZv0OiLamdpzXeMhtCK3R+6gLR/b/
	Qfue/S5fqu18a/aD91OTzu9cd2O84R+wC9uOC3Uws3Zc0VhXRFV6OL3kuAzjubuGhdyGNs5Iff9
	apkB31eW/ijKcnnQlA2+0pErpGBA7BCcilebVFN6NJcStzYrBuz6AeTc7vaPj1yexckvK3wdHTJ
	nYv
X-Received: by 2002:a05:690c:2607:b0:78f:b163:782 with SMTP id 00721157ae682-7949e076330mr69517847b3.58.1769795431831;
        Fri, 30 Jan 2026 09:50:31 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649960e0965sm3939108d50.13.2026.01.30.09.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 09:50:31 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Subject: [PATCH v4 0/3] Add Tenstorrent Atlantis Clock/Reset Controller
Date: Fri, 30 Jan 2026 11:50:20 -0600
Message-Id: <20260130-atlantis-clocks-v4-0-46de52d52924@oss.tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFzvfGkC/3XOwQrCMAyA4VeRnu1oWps5T76HeNhqpkVtpS1FG
 Xt3O0EYTI9/IF8ysEjBUmS71cACZRutdyU26xUzl9adidtTaSaFRAEgeZturUs2cnPz5hp5Lxp
 hoBHdFk+sbD0C9fb5EQ/H0hcbkw+vz4EM0/Rr6YWVgQteK42ENfRy2+19jFUiNxGBXKqMv7NJz
 XImyeVXWRbJIKoaUDWE+F9ScwmXkipSJwBBaa2hq39L4zi+ATP7AsNMAQAA
X-Change-ID: 20260112-atlantis-clocks-f090c190b86d
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
 fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com, 
 bmasney@redhat.com
X-Mailer: b4 0.14.3

This series adds support for a multifunctional register block
called PRCM in the Tenstorrent Atlantis SoC, whose main functionality
is to serve clocks and resets. This block is instantiated multiple
times in the SoC, with each block covering clock/resets from a
different subsystem. This series also adds a driver that covers clocks
and resets from the RCPU subsystem, which covers most low speed IO
interfaces found in the chip. The reset controller is implemented as
an auxiliary device of the clock controller and shares the same regmap
as it.

The first commit adds bindings documenting the PRCM block, along with
clock and reset indices. The second commit adds the reset controller
driver along with the auxdev definitions needed for it. The third commit
adds the clock controller driver, and the reset controller is created as
an auxdev of it.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

---
Changes in v4:
- Dropped !rcpu prcms and custom property used by them. Will be added
  later with rest of clock tree
- Link to v3: https://lore.kernel.org/r/20260126-atlantis-clocks-v3-0-b016135551b7@oss.tenstorrent.com

Changes in v3:
- Fixed warnings reported by kernel test bot
- Addressed comments on reset driver bit set/unset value
- Changed auxdev macros to use inline functions
- Renamed bindings and clock driver to use block's name of "PRCM" rather
  than syscon
- Link to v2: https://lore.kernel.org/r/20260122-atlantis-clocks-v2-0-c66371639e66@oss.tenstorrent.com

Changes in v2:
- Improve the documentation about the syscon block in bindings
- Implemented all clks using custom ops
- Removed custom lock/lock handling functions for regmap
- Addressed comments on header file ordering, newlines and typos
- Removed code for mux parent setting
- Squashed down multiple commits that added reset/auxdev separately
- Link to v1: https://lore.kernel.org/r/20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com

---
Anirudh Srinivasan (3):
      dt-bindings: clk: tenstorrent: Add tenstorrent,atlantis-prcm
      reset: tenstorrent: Add reset controller for Atlantis
      clk: tenstorrent: Add Atlantis clock controller driver

 .../bindings/clock/tenstorrent,atlantis-prcm.yaml  |  54 ++
 MAINTAINERS                                        |   5 +
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/tenstorrent/Kconfig                    |  14 +
 drivers/clk/tenstorrent/Makefile                   |   3 +
 drivers/clk/tenstorrent/atlantis-prcm.c            | 941 +++++++++++++++++++++
 drivers/reset/Kconfig                              |  11 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-tenstorrent-atlantis.c         | 160 ++++
 .../dt-bindings/clock/tenstorrent,atlantis-prcm.h  | 103 +++
 include/soc/tenstorrent/atlantis-prcm.h            |  58 ++
 12 files changed, 1352 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20260112-atlantis-clocks-f090c190b86d

Best regards,
-- 
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

