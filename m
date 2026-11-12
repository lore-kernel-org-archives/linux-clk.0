Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509148;
	b=bl7ZLZDp5afu2H7cYHwYyaWWrP4LVQlMCd3jF4ibKqgtcDlyafqdYDMIB1H9rIzxhf/1
	 j/HsfF7hEpOz0m+/eeormprP4hQFArvARVtVmgTsTl5LGumL2BzFEmI/S2x4LyxC99K1q
	 xspJA6ELjL48yuwpAEC2YORnZqrmI7RRWuAgTr7RwEQbPLU5EKmTtLBoh4dMMkL0LKWEr
	 zVBZUmY5Xy/NmSC2u/KqMxef/2IO8+SHTmO0o/TK7dqk2KkjWU8sXizH7Y/BIV7QfI5kX
	 jtfMBEaFi6VMzxDAtprzraqaI0qxbzBLuEhuPlwIQVfvm6mY8sUOPUVolwbHlzxSRWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=o2qMJEH+31qggb6YqbR5qReK9kZYkIie2xHFXPABy7M=;
	b=b0GgLNhq9X19HxykCCcM08PFicYmN4wikP3NPKMJX1Ju3QKEeh6ILlebkuiAYmxOMp/d
	 nw78pHoxLYy6HR9XBdun6cXubxs4RfkDTVgRRepnumQ3OYIkV5GTU32JshAK3VCpV5g3J
	 WpVaW7sQzU+MoiDuNq6mXLOYeyY1qBU0LhQi8uilgoTWOcjLrk15ELnP+IMTqFvTcuPEO
	 JS8nUsLeidpQDEtNEogz60oidulZNKiHWEwW3pRB9XaN8S6BBGxWXi196eIW5fMJPChJv
	 VPVSqUAcUkoY9S168AGboQXyBPvk1Fz268JuG6v5yTaxTvpajCyUD3jG0c3G+MQ7RiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WYKEnETn;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963B6606A32D
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 18:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 963B6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WYKEnETn
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37628596783so315460eec.1
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 10:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509148; x=1795113948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o2qMJEH+31qggb6YqbR5qReK9kZYkIie2xHFXPABy7M=;
        b=WYKEnETnICcshBd/3HhBmqwjrcKe+FbTbYG4mIGPe3Gt+6T8ttAbfauJHC3wbnYNI2
         N4W+1hX0tN1TiFkSUGF20Ufp7aOifT+NeDqD1SM3j0+/jmZrUNg3HlCMQPoRuAzmDApo
         /ytIuoeddMZnIW1FBATf89vHQ+Ns5KRLIQseTsjQEups6kRFzSABIhx0gEferU0R3qYO
         zYuwLHPmb/bdWeZsqHaIZ4W6fV0Zb9fJfF+8Sy08N2sKi9Faho3B3mgBRJzGIPa/43Fz
         k0eir7hJmXlvb9chFcFblFVb3VZLzcZJJ3u1/K5BulVvqDIWb6KDbSV6T/ndl10J7BJ3
         CqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509148; x=1795113948;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o2qMJEH+31qggb6YqbR5qReK9kZYkIie2xHFXPABy7M=;
        b=Vk2ud+R60XCTzLWP0CVF+Y/9unOHZZSn2B3jcXVyautZ0bin/uUOw8A74j0dZuFSyU
         x4qIFC+k5eldqnoscqE7RsoRCTFkEQhGb4PuX52pOnUc09wehMbXGMTJdgau5tNeg6Ll
         +6Fghkj1WVBGGUWSIXJz0WgAGPcXpCmFL/RGqlNeMOiAI51LS6ppOlWzgjV4Z2thNa5k
         CkUDVg4MJ1rmkKfzEEYxsLcmMiXDCohpc7EJPsM6uzDEMxb7YHnWKssuJ1BPOEWPtIQB
         ff9gu5kmuhFWCIiq/2SxTwRsos3A/TBI90VdxP9GYYTKhguXSZVh/2OlXDhHj+RXyBBK
         FiUg==
X-Forwarded-Encrypted: i=1; AL+hErGdVkogNsKVlwcrFgruqDDoyzlZ0lkT6M7v/zs2gAwe2qIaRGb9npHYhA2xD8pCmBqe7FYW4dU2LNg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zDSRMA/x87L9sdrtWZHseLMas/Q7Az1opAZts6rKYozsGGnN2
	68NIAArW0khUuLuSn/bKIGQpqLr/VU/rJ5DZJKwBY0tR2fljlc+uieDe
X-Gm-Gg: AYBFou0fxwyrXp26fNP+qjedJ78joU/wmuFy/BJLwZUVQhqP3ttMy6quc9o5aKqAhMg
	sqt6vGDN0Dkfx0U2DkFBjq6S+IZEl1OiAl2ZtVl2cyAgenO67ltLMW+C6teW6lpvB8KMzyDzgr6
	WQwcXS5EzZ9Ctxd/8agLia2qIKGFpZxzAWX0ROzlNTNOehUiq+F77bINS28vpoKDiWrzoR4Eis7
	9t/nuemWAHaO4LzYBEvKclKYj9X9aMUrMdH/uCWXVz+ulSfi8/EmK2awWlhJA+TiR4ybA6j/QD+
	hacXv/Iwg/hdNMf/6kAwr3dO8kwmAPyTKyVBjNmn52A8Kv99cF05TnrtEyYRFtxXH7PUrouIyMg
	k/oyy+XLPq8q9ITTJk2EWN/uqalzezOKWUTACmmtN9SnEg6ZkNh/FrCP0726oJ06NkRepS6LzAB
	tucVq2eOYhaBPiMf8eri041W/jgLcEdulHg03CDwHAM6vzKvU7AIDtWkfT/HBXdii56Uihmx8Xo
	QebpbgS/4s2tCdHHAtCKdzzkvb2pkyq3eBik7BeDyVTd38EzApllsy6BF0yOSxQNCqpJctjKW5y
	MwwTRgby
X-Received: by 2002:a05:7301:b06:b0:36a:1089:9836 with SMTP id 5a478bee46e88-3796628ce32mr27774eec.15.1794509147532;
        Thu, 12 Nov 2026 10:45:47 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm369524eec.27.2026.11.12.10.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:45:46 -0800 (PST)
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
Subject: [PATCH v4 0/3] MIPS: CI20: Enable SMP with two CPUs
Date: Thu, 12 Nov 2026 10:44:38 -0800
Message-ID: <20261112184441.3724150-1-f.fainelli@gmail.com>
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


Florian Fainelli (1):
  clk: ingenic: Poll JZ4780 CPU1 power status atomically

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
 arch/mips/ingenic/ingenic-smp.c       | 262 ++++++++++++++++++++++++++
 arch/mips/kernel/idle.c               |  30 ++-
 arch/mips/kernel/smp.c                |   5 +-
 drivers/clk/ingenic/jz4780-cgu.c      |   4 +-
 12 files changed, 386 insertions(+), 5 deletions(-)
 create mode 100644 arch/mips/include/asm/ingenic-smp.h
 create mode 100644 arch/mips/ingenic/Makefile
 create mode 100644 arch/mips/ingenic/ingenic-smp-entry.S
 create mode 100644 arch/mips/ingenic/ingenic-smp.c

-- 
2.53.0

