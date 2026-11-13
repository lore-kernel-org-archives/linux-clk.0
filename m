Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596921;
	b=o1170bJLAlQYt2OVkeVsvNEftqsBxgP2rknz1ugH96P/udZe4Q3OAzijBHglVyYE9LOH
	 PV9sWAhSYE65bZgjk2FJGsPWMQSs1xNTRgKiIpwtc2vqWyWwUsS+gx/A/ociqqHfl/c+A
	 pT605uLBnE7JkNKqrVw8Gy56FOXZJTHJsRRbggWLTJ7m94j7Hz758xSrpJhDhr+tBE6n/
	 j6RmVefuBjtR5n9Lup5jllZHZDbqSphc4JCPrIX7x/Rnz9JVzDmA62bND2XiB3nbQ7Dyr
	 496BmfnLrB6Hf36BKU087nmuMog+/klE0poeNngDZfYnHW9/NhqK0jRsDr34l7W4siQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=7zVRWdksbk2GmJApPG4YI4MTzgCoDOVGLlN4Rb98bD4=;
	b=SOHR+6VQn/DMFAhqt8MchhL8B2+wvknm1ezWh5oItEw7V7hbL59NVp36gVUGcvMbZjFH
	 UQvWwgJtQZma0mUESRcLN3r5OOurO4gvMRxmUywqEpcj0ugsIrkcr7vaHP2pCBL+B7IGq
	 eHMS8T1ONtKHniS3J8FSbpcljAtWQXhS0LW26Ewy9ue+Tu20oAqFN4W8my8zBUjuyPigz
	 X9yA/Mg/8RdfDgMeAzC2YWws+oSk7MHxmW0AlG3oikl0DyiCvXgPTiaIuc+ylV5qN0ktQ
	 b5gaWDNFYpV5DK84U0oWcP0YEkCJ905yu0Yv4+fP4G7I8gKtW6ycVjaZYVm4t1wG8qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oi6n14bJ;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB89606A890
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 19:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AB89606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oi6n14bJ
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3720addb068so2132782eec.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 11:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596921; x=1795201721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7zVRWdksbk2GmJApPG4YI4MTzgCoDOVGLlN4Rb98bD4=;
        b=Oi6n14bJsuA3MZESR2IVpCx1+TTNYhFtsSxeR6Rlc/yu4ih3w3su2fUaAAiDCICSHF
         lxpCMYkvk5kZMYo6LVjuR68e+p2CGzY+iMcOBvs1WBwZSUPFfmNE+Bt4uaLd/Iyr043d
         jL+yLtHUi7Yjzba1ksZmoNThvzrpL/ARk8jz7pRyEHZGfdE6yRPqLAr+TUILJZebSPn9
         2IBS4KyXPkjzPUPmMo2TbXpm3vnGOmYxVohRxSLOfvqMFURsv6MKanVa9YT9B9UuoHPH
         tkyMFjuJH0uBF455JpeLfAJRLK36xUvmXx//gkwEsYSB+18vt1GpaaZ0FN4QKjj++I37
         0+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596921; x=1795201721;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7zVRWdksbk2GmJApPG4YI4MTzgCoDOVGLlN4Rb98bD4=;
        b=2rQqWvykVbdsoUN+yAPC731nmASajvFZYgMLyJX92uz8XwxFW+zKMqu7JP6Cgu2oYF
         tgb6Kb/19J0kcxAcImXADBvI4Dqfr5Qb+/CuXPKrsPgyxRiQWs+BKs2IpHvNCc9HhmAL
         hiv3erDYNSxKzIRFZlUV3P+rzqjYES2np4uZL6wXUsOT+bWiMRz+HBBld64RjuEWwN8M
         gTu9sg4XMs4tqHulXeyA6emC/L52Xu4ALHzOUqOoAgv4pZrZVN2xnvPY8P6kxjv4bOsE
         GbTflsVRbV/U5R09nplwDmgCQ6OK5F+QOOnC+o7zKkGnm6TG+OWzIWdMGFmYG2KSdP0z
         ct2Q==
X-Forwarded-Encrypted: i=1; AL+hErFvZC6R4VWEKH7Lx+stqIoRUN0VbnjWXYtERZbawvXC7EMd0fH/VJqaoWMCAcqKFyYwWvNQXA9AY9s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0eN+RlRMMP7/zvN6vJJHnxqHUpB/JjmZmTiFeEjn3XbZ6RU0b
	tHceepDQV+e79Se4YPAi7xi5QzaeiqwnaBzabatC0sdDTtkVNI/0nZzM
X-Gm-Gg: AYBFou26FXi6U/2aCP8ikSj6IS6zOUGq4kQz9mklaliCSzqDjHSKSPQB4VKx1FLayL8
	b+VD0fYcrFu5morY/J7qW9PFHbeRFcrfA36x0WqF+Ixgi4P38bMF5fRoDV9dzQ1pIooWyv5qEL8
	eLRRseelFxzvOXGDRxxrbRVCHpDMDKvtC3WAznrfQUwyKeZwYqe7VfeOpXvppDVQXzXuCznc+mS
	zNYAA4vPxPGLFqYodXaF4L2/DmJ9aYLJsxBCyT+f7rNtAED6UXn2EUYj2VaCldb9XXB5Cio+dP+
	rhkxLJRF7rzpi6OQx4XL4yA18NzvgDkfEexZY42RY1LmJew+ercSHEXMP8q0HvUbscQkNcwqDZ3
	4BYeCz9ZyoUqdfJCdM1kK/aBVTf6pVYc1Ms009+yDWcXzO51T3lrSrneyHQLWA0gddWznDBizy6
	Lvbkk0FECnOpSkXTmCWOuyuXWz2YUtfY8rlJdlz5psLQKXELm0MLBJJw51rNSLYuYy7lvMc2Uz3
	rg3bYl4HK2O0KKc0GJ70iwzZmsmFt/4njJPk6d1UiWhYjA/25+rMtLB0ibXcLtpMlac6unOOYw7
	quxCn1EpZQ==
X-Received: by 2002:a05:7300:8a19:b0:377:1bfe:14d6 with SMTP id 5a478bee46e88-37965f9d236mr2579200eec.6.1794596920459;
        Fri, 13 Nov 2026 11:08:40 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm15714037eec.25.2026.11.13.11.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:08:39 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	=?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	hns@goldelico.com,
	paul@boddie.org.uk
Subject: [PATCH v6 0/4] MIPS: CI20: Enable SMP with two CPUs
Date: Fri, 13 Nov 2026 11:08:32 -0800
Message-ID: <20261113190836.470937-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series resurrects SMP support for the CI20 board. This was
submitted back in 2020 by Zhou Yanjie.

Changes in v6:

• Added missing Signed-off-by tag to patch #2

Changes in v5:

• Added changelog per-patch
• Split the generic IPI setup check
• Added comments explaining both need_resched()
• Removed void Reviewed/Tested-by tags

Changes in v4:

• Enable the secondary CPU clock outside the raw spinlock
• Mark enumerated CPUs present and assign hardware core IDs
• Skip generic IPI allocation when the platform supplies both IPI callbacks
• Fix generic 64-bit builds using CKSEG aliases and pointer-sized assembly macros
• Reject unsupported CPU offlining with -EOPNOTSUPP
• Restrict the XBurst SMP idle handler to multicore systems and recheck
  pending interrupts after flushing the cache

Changes in v3:

• Align the second line of the readl_poll_timeout_atomic() per Brian's
  feedback
• Collected Paul's R-b and T-b tags

Changes in v2:

• Moved SMP sources to arch/mips/ingenic/ and the header to arch/mips/include/asm/
• Removed CONFIG_MIPS_INGENIC_SMP, using CONFIG_MACH_JZ4780 and CONFIG_SMP directly
• Renamed JZ4780-specific SMP symbols to XBurst names
• Changed CPU enumeration to assign consecutive logical IDs and removed the explicit two-core limit
• Changed mailbox IRQ allocation failure from panic to logging and returning
• Shortened commit descriptions, removed Codex attribution, and adjusted source credits and sign-offs
• Kept the clock polling patch and CI20 defconfig changes unchanged,
  added Paul's R-b for patch #1
• Updated the kernel baseline to include additional upstream fixes

Florian Fainelli (2):
  clk: ingenic: Poll JZ4780 CPU1 power status atomically
  MIPS: Skip generic IPI setup for platform-specific callbacks

周琰杰 (Zhou Yanjie) (2):
  MIPS: Ingenic: Add XBurst SMP support
  MIPS: CI20: Enable SMP with two CPUs

 MAINTAINERS                           |   3 +-
 arch/mips/Kbuild                      |   1 +
 arch/mips/configs/ci20_defconfig      |   2 +
 arch/mips/generic/init.c              |   3 +
 arch/mips/include/asm/ingenic-smp.h   |  20 ++
 arch/mips/ingenic/Kconfig             |   2 +
 arch/mips/ingenic/Makefile            |   5 +
 arch/mips/ingenic/ingenic-smp-entry.S |  54 ++++++
 arch/mips/ingenic/ingenic-smp.c       | 260 ++++++++++++++++++++++++++
 arch/mips/kernel/idle.c               |  31 ++-
 arch/mips/kernel/smp.c                |   6 +-
 drivers/clk/ingenic/jz4780-cgu.c      |   4 +-
 12 files changed, 386 insertions(+), 5 deletions(-)
 create mode 100644 arch/mips/include/asm/ingenic-smp.h
 create mode 100644 arch/mips/ingenic/Makefile
 create mode 100644 arch/mips/ingenic/ingenic-smp-entry.S
 create mode 100644 arch/mips/ingenic/ingenic-smp.c

