Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B6B19AD5C
	for <linux-clk@vger.kernel.org>; Fri, 19 Dec 2025 01:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766107767; cv=none; b=oqezj/PHFJZzmGeheskeKg3s15l1kn/QezQlMr2f8hElHI6uPVwm67p7Jb/gt3i7y/eGdxDHmazWSVxGCGeqOwGeMQvKfeG+fFvKnR2o4U/XiOCNHIP2FnUOLjeR7OFlfFrRHbuZOfKMorDWNgeLu+nlsfmVTCrAZRqhFxIENxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766107767; c=relaxed/simple;
	bh=JjuvhBN3d/bFg+0VkFskoXUj/P9+g0NC/i3Ipo9goDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JRRssdGANqTFTWOtozGxQgfEjGKe754GnZVJI240wbi2uwfvvIqgB+A7Il6Lqs4qGYqctssyHPdIOF9bcMK0YhcdDIjyPQbLOlN/4aUx5DS+lIjAIjxDjqlElfGBGD1DKH2zHgwTqBnxvkp9zzNYhzXCp5/tx/5LVWgNHwIDXIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+23u/Wy; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+23u/Wy"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso1168378a12.3
        for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 17:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766107765; x=1766712565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ImtK/f/sYZ0T/CDz6wNZi8kpvO1eTA7THBDv7eoYu1c=;
        b=V+23u/WyrES4Nm2xPxKx/9HoGZNwWg06MWMT4Vbh7CdyS+RAe7sybPN0xPX0bcY8hA
         T1I121FjSUB/+khA3w20c+g1d2qDqcxA8SbvPhmK0gWgr+hbyCex/WQ7gIi9PG+KsaMf
         QJQaweHPWfH9CHd6u9GMWj7FKbICUhSmPZGMXMFdth5/6JJJWgYR1eFg5MjJogXcyk2n
         uoeCQ/BaRZYHB/37IoEcwTslfDLZHSG72HzSfy8ukhOuZERoLCkFVQ0EI90O0tNxxRWw
         WRuQYktZPXDR7D7zXLWEBjnKZprn1HGvbSJNz+/52imnLgnZOQdOI48HGTVBMYe35ozd
         +LgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766107765; x=1766712565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ImtK/f/sYZ0T/CDz6wNZi8kpvO1eTA7THBDv7eoYu1c=;
        b=FFDwiHIU1kggV7QmU/0se5BzPJPC1l4eTgdaUfGRjzBsbt6GpUf/I1wg1JjoK2kC6C
         46gBH0RDB1qnVxYwiUvWBLc0DEFuxNA+eSYyTFnoS3/yur50TcllEG0TbOvpIt9JxpbM
         QzXu8QKyS3xUDylEzYqKlAKw9OYl9k7GdjSto/B+1GeWDEeqnfABgRdOEEoYJQWFnwos
         Bny6S6iVmVPZCVtTSJ29zeSbiQKExXswh7iSOzzl/MO+UG4JcLTFabxD6s0aEi53loYA
         PL8Pf9/UnXIRE/lrVCL7rGF8lO5pYDJXkvpFdLK6552R9SPfA4llE6vexrrXhevvYj6p
         DhfA==
X-Forwarded-Encrypted: i=1; AJvYcCXxEwYHI72DNkvQ5aV8CjKPWMeU0Xe9ksBGzoFQZGlh6eopdxaB8iZSb8D+PDAhdyplAEZQt9qPXnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGZc4mFiAT8NRLGQ6kC+SaG56kRdeCVdom3sr7rJsgSciARzcA
	B0e/8GX+ufelYIItXpWmz93L/q48L+w90nXg9oN05d8qiNuzBfsMc3H5
X-Gm-Gg: AY/fxX7acZY3E26bXn4vujYC75LEakPjVgah6zkX5RhcJ1OgY4aqptnuUfbiIU7laBV
	0zb5KcIP2693SSQn/h8xRc9hx1Onm/gRvruWboWuzXw5PyzCBSqM8TFEPv1wi70EWgBF/c95qyv
	ilZ/ytchiQt4IHQR0+RXHZk5AZN5muYbUAW/bbLXRSEWKWSjfJzn+QE/jd9tdX8JPYrAkojuN1c
	I+nTmSeXVgm5Ry0B74Gq0LRU24U3A8L0y6MBsfPtuW1cav/WeZ0NN3pTUEJTQBM87Poia5s8NiH
	8cH1O2ULNvjcyv/CZSF1vdHjsFC4EFfF9WiSsPHtK7OC9bIVBFGN1vxj2KrrxMLeHVHTacoD9sJ
	qXPzy3nq7ns+LF03+rqb82bKjmYSOQVZguRFbfZMlohqAQWn+Vo5e6EWCipD0JipiMVoeJMMOZC
	QFt8KhiDbaoA==
X-Google-Smtp-Source: AGHT+IHmCsJOTDpegNz1zbKi7qV4zqhXPVuzMhRGlv8/8xKRdA6N3Lz/R25WgxpM69DLVt3TUiIsaA==
X-Received: by 2002:a05:7300:2315:b0:2ae:5a13:97d8 with SMTP id 5a478bee46e88-2b05ec030cdmr1436191eec.14.1766107765232;
        Thu, 18 Dec 2025 17:29:25 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ffd5f86sm2058701eec.5.2025.12.18.17.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 17:29:24 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Haylen Chu <heylenay@4d2.org>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	Brian Masney <bmasney@redhat.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 0/2] clk: spacemit: Fix module build for spacemit common ccu driver
Date: Fri, 19 Dec 2025 09:28:16 +0800
Message-ID: <20251219012819.440972-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the SPACEMIT_CCU entry is only a switch for enabling entry
SPACEMIT_K1_CCU. It does not guide the build for common clock codes
even if it is a tristate entry. This makes this entry useless.

Change the Makefile to add a separate build for common clock logic,
so the SPACEMIT_CCU entry takes effect, also add necessary
MODULE_LICENSE()/MODULE_DESCRIPTION()/EXPORT_SYMBOL() for the module
build.

This patch mostly fix the build problem, and it should serve as a
basic for the incoming K3 clock driver. See link.

Link: https://lore.kernel.org/all/20251217001833-GYE1903981@gentoo.org

Change from v3:
1. patch 1: change Makefile to trigger module build actually
2. patch 2: new patch for remove internal Kconfig entry

Change from v2:
1. change namespace name to CLK_SPACEMIT

Change from v1:
1. Use EXPORT_SYMBOL_NS_GPL to export clock ops

Inochi Amaoto (2):
  clk: spacemit: Respect Kconfig setting when building modules
  clk: spacemit: Hide common clock driver from user controller

 drivers/clk/spacemit/Kconfig      | 14 ++++++--------
 drivers/clk/spacemit/Makefile     |  9 +++++++--
 drivers/clk/spacemit/ccu-k1.c     |  1 +
 drivers/clk/spacemit/ccu_common.c |  6 ++++++
 drivers/clk/spacemit/ccu_ddn.c    |  1 +
 drivers/clk/spacemit/ccu_mix.c    |  9 +++++++++
 drivers/clk/spacemit/ccu_pll.c    |  1 +
 7 files changed, 31 insertions(+), 10 deletions(-)
 create mode 100644 drivers/clk/spacemit/ccu_common.c

--
2.52.0

