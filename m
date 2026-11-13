Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595377;
	b=LqnVzkt+D8V2klPE0rwuJ5gkxj6+mhuisbPluX338W54KLUfG4S1FTgMlhDQDgAAJK6i
	 dmujC8MGRudx0WUpd5TbWwr0BfBvQVeV/hdiRIiajqeFgsMwG+RYzHf3a0u71MFL/eUTI
	 bSUMR7DX7py4viEgisBRQCHj0JJXRGXPMjV2seoc+nR0YhcyQiIEYHI2v+8eD8Vm7HgqL
	 l36500RIDYiQgVowYjaoT8vtO73I26k6dBU9/78aX5CYsmxePogB4bj2+9hp+NRUBZyB3
	 iCH9u4vSjIMgwtbZ/RaVZnSsA3yPU5Y+Ol4KMr4IK6xkmicxEuXM+O8mZg4bOJ0kn+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=yEw5KadHQTak+G++8OlzH9m+1ubEWMXtFGCjx2W1Qrg=;
	b=QWsuUSSTzxcIyraDnjWaczaRHWfN1lSZ8G+8LyisTQqCSTIxMd8b9FxZ9b6GAOnuBBfx
	 WENC9vQzsEqkfH5fesIm/KwARHz2NGAtaWxfQRI867lrrnamy1/cAcqlItP2Mb5hXi3AP
	 +LsjRKFoBpqvAm7NNOvRqiDRRgXrgz7eHIaFv3RZK99Ud3Gq60EIwalcepROtlUHPTFee
	 6ArHL0ewiD/8ljY74STS/PUIGdFItTVbvnvYDbjltYPxKdHFoOfAdXz8atOffg/KFBcrg
	 pM/25Y+ik0sqTmyaikQUPzuzIgU++olQNv2YWSCyIEA0jjp5PAZ1UwuymXHf8vSPaRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u9Eg0Qeu;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F6D606A88F
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 18:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46F6D606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u9Eg0Qeu
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15ea896ddc8so1776227c88.0
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 10:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794595375; x=1795200175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yEw5KadHQTak+G++8OlzH9m+1ubEWMXtFGCjx2W1Qrg=;
        b=u9Eg0Qeu706qjT2IhCsz4+EKc2sO/nmiljfYEXHHufIWj8XYW9yaWltbHfroO+nRs0
         4gdWcsMQoFSyT8YLi0gRRsryAw+3QXIWxWhsEUjuaDNFalx/VTGkgnrsyjl5E7ctZbED
         LT0gSvcoNSjTXDxJXTHdW8EFzO0x0RB8TN29xhZ42euzZ1lij68JgmV1oS6N8z5Khbxs
         EpyLoib0NMAjwfbP803j5/GeZo4jLP7Zn0GSdSNKtRIJKzA6DkNeMNbIYGESB//k2Tj4
         nf3cUDSVetEIRqtLgNwyftNHQKGiBtYj/Sf+vQOTKOWRhOIl1w82dt2dQOGeQeayJdiR
         kYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595375; x=1795200175;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yEw5KadHQTak+G++8OlzH9m+1ubEWMXtFGCjx2W1Qrg=;
        b=BNOXEFJ0gtqBSrCZeRMfmfvwNOCm5w1IC3ewCscW4anpvcD0Ub1OP7aGG/LOxKT5fJ
         Ib1g1Qe4FZ7GzWFnH0pW7M8b+Ih6AYo0egHtJeZTysGCKgWshQo+OQaOLJe3g/MLLoPR
         L972PcHumXP3o/S7LnWf+TQCkjbcrQNZ0egqweWFPUgIyGRb8FWb4+fjoqoYjobe5Ipi
         N5B0sCFg4nZyaaFznvj7Eoq+P8FGTfm4u4ewMxuJH/fC7s0tS/BYUJNtJ+Uf+XB1ditY
         hCTH2NbNsqeUwsRv8sXw1MigFsy/XfZxYkMjvwW0YPdHwKg8SwJPFt0IeYCugETGwAWX
         +zeA==
X-Forwarded-Encrypted: i=1; AL+hErHPBO7ug6j6IW/9alUpJTByS0m6XooXg/oWw8BQXVP8HsENCPVi0sMgOBBD+isYEB2lkrrtmdjtSM4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8s/2LJtSeD+uAEFMcu7uDgiAp4gfRQaZ+TksLeJ9JnSicqIaFG
	AzhdsN4HNiA8CtQL5SNBnm1MCAqY94lEAbbq+kEpHLVWLY7P1UIaDwh2
X-Gm-Gg: AYBFou2iA0jqP5CxwFRHJaG/t93aG0eMZnBo84bNXdnNOjYEZHXMtJt8T/EeVcM9N/I
	hBNwqrG1QA6Yjy9Lq5872S433YB2tjhPn5uZ3h09jll5m0Oj1xS0TqP1lK2G1M3U99tkJscORfD
	jxPgHNmw5TlvZmHkFN4q5sWrDcFU/8adpBOLWfcNUKxS0cFRwAErGoXfJyy/kZRbenQjd4cjpkT
	FopPYEHRgD97sXyCUepahOufwKyEapFaQHjPJJTUZv1BDl+2t0HxqbtVReWiVbUIrTnYMB2VZtK
	/mUPP4TVi9S+yYl9v27vVcm0pgVkTL29nngH4wD8TffQS5cuy7UpifXH6PkeSCU+9NwlMphRX3M
	7VCbt5BuO8Rz8lAzrkz+yyYSZGHTBkzNS1u9ez8IcH81Kp1NXnQufOEp2VJuwbQa/CGMZnXjaML
	/Xf2242847d/sHH6C1hPcjdrLOpVsM2EOqNoFc8feTPCSB/H1cqesPIrRUfqYMkzYii36Ds0Qnc
	wX+eJbcYsF3i4NTo7wDKu9X7E5L/5sROAevcTn/PN+WPCMhRL4OW9rYKPYnzRB76GoNT/AMhqhs
	mcrGjAdY
X-Received: by 2002:a05:7022:3a87:b0:19a:9a93:c9b2 with SMTP id a92af1059eb24-1b5030980f2mr3402806c88.13.1794595375329;
        Fri, 13 Nov 2026 10:42:55 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm10526177c88.8.2026.11.13.10.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:42:54 -0800 (PST)
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
Subject: [PATCH v5 0/4] MIPS: CI20: Enable SMP with two CPUs
Date: Fri, 13 Nov 2026 10:42:06 -0800
Message-ID: <20261113184210.470320-1-f.fainelli@gmail.com>
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

