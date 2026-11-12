Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794456977;
	b=1us3jhsN6vPCB615koiuI4KJVCD/WOf1jcuHfAh41URZxJS8ZRVOiGN26e6V3wZ0EIPl
	 +kbb/8taLq+XoueLghvab53PHJs2daIWsp3RixzJT+TUYTyCCBvCWgGp9s/IoUAnt9FAI
	 uGiILGJOc1hH+81mC9EtcsvNrHEIb7xAUl8aO/VVieqlYXiwTR/hrMqHSewdtC/JOWUi8
	 wFFj5qfW+5XVsFJe/91zlZcrq1reJQ8bJi+huWbeXe888o9wmdFeKnQMwpVU+8c5gl/6W
	 +2K07bsnnxiMBfs0ED+MEARK994wFV6CICrnsLFX3DNnrlyYHcjOqSckS/L6xwsn7lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794456977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ta4OcVdC52VTSti63ovhxU0ir4j7mfUIFix2+gqdIQU=;
	b=gzVtGqYYbmBArO3AmXUcd5fIoVTg4UcKBJaH73jBTITC5fF+tX3lfM9YOHmfQW96A+wZ
	 9cxGlv771GiyZxnksIqanAqZ0w8f/+Lyqwjpppg31edI56ZzluDa3X/ci+AUr0FTXqM6S
	 1E92ATuMLK/1V6bR2cw24BIudikO5V7cDz2vgmkvq8jj5+JEQlqnTeNd+d8c6RMkVfSUz
	 2frn2mwV0FedzNrma2UEC7aLOlvTunAMY/+RDo/Wp3MAEFv00dM1sCPry2lUGw5fn0csA
	 8KNDru11inbeKnWOiel8q6vwl2ipheGVqF6yn6W0xsCffrF4iRTxGNkDiWDXFF6qGbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXuyiUa8;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B19606A323
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 04:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30B19606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXuyiUa8
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2983292eec.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 20:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794456975; x=1795061775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ta4OcVdC52VTSti63ovhxU0ir4j7mfUIFix2+gqdIQU=;
        b=qXuyiUa8TtGAE2ahyCjJ/Qgbrr2DmNEju5YPemZneiCeG/lmpricA0v5dkOskpD2vB
         2gq/8Uq+4dKO1q7bwSYzxpZb77nCyk2Org5mZ8JXStG/Zl+Qa1nMlCBaQBo+7DsqS+7I
         xXoY9KMSIqsYGLOZkdyiDzXPbhgXCiTOoSEBqobpiXYceIVcBx98Tu3oS/8pZ/BY2w3R
         G8ptGoNwoe0yUIQvjG2gVbvOGnloeVTnpafhYg5C/pCYQj7uzzaLPTSv3J00Hl5g5//i
         CHygp3VDDw+tQ/u/Exhtyfxo4dw8KcANVGf8P+KqQoIskqwvejBLap4JStPca3rkAQvk
         puJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794456975; x=1795061775;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ta4OcVdC52VTSti63ovhxU0ir4j7mfUIFix2+gqdIQU=;
        b=oovXECN5lEaIYctfOa3iGQuv5gemr2Ds39+GQwBvXRerfJ4iT7AmyRtbin7kvuw30G
         ncOvPLGYD2IWGu/AaXD8tGuZQkMdPOWIS34XhLKi79A6Si9aM1UMsW2OzrNfaAX4hQim
         AY5wWRHhND/kvbCkuUGiNfaS9ooTO9Nuug3o6Attv5NlUIVw4ves9pHIm/o7q66l79TT
         Kz6NtdGAVC7rpbXjPbRG5G0TFA3tatsEh8RMfegt/bL4yIamoTguYVTpSlqEu6B8xcZW
         e0dz8vQ9HJYbgPotSu1X3/sUNE7Hy+BCk4ckjfZwM4VOTjSerKoC0auOKjU0wTlYJSq8
         PR5A==
X-Forwarded-Encrypted: i=1; AL+hErFd29tIqvSwlY+uw3aHTGr477Oef/3I1uvp4X35qfWQA0aH2sP/rxkZpSJd20bPR2FhBHWvF3R++xQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rafn4o0hNGerU5sPPET5kayGayRxhtIcIzww8PqHFLacClbDn
	p5Zd42DbniXhFYrZ1xoqhi+xocU6IPUhwT3KnTyNZhlq8bUt8Jkr4c22
X-Gm-Gg: AYBFou1N8vDdU15Ja1T4PW3xucG9IvrvlCUTUekwlvc0BKYmagcA+6p/Y7UKqCIz/bG
	YLVi36FvsLO2TVV0aNWXvSsNvaGREWpJbi4QSDD6i5T1zejtRUctAgRSVRkvzN4wiktFCt1CP4v
	01nFSt9SNpojWzuhINTxYAeaw3rBR2q4MctR3CqSc0yjAJdI3kZdjHnavYm4CBaeVDmw5ipa/ly
	yI3xr4tohoUbW2BAeNqWmr/eTzfS0nK0O+qt46XBn2EwtbOTy+ULC/LXftpHrPUWCUZqBm7KDMo
	Iso75Y0Wb1BI4Lwnfgg+65dhkhfsX5h0OCrzlJ0x6sFTcRgZ0iKolNGGpOYy1e+xMQr6u+6CR5P
	Cd3dS2oYOBV77rJNF7TdVkN/+z7HNDr3b1JUFudVxuxxgYNALvsedXo0w37M+7M5thoJ+d+1phG
	Ba3/ZWYXFbMsYC0WtEV6GUXZQaPttx3YScTNMtDH20ROG4UcmV/8KVtgCFuvPZzkzW/e+yEplRq
	7vt/nqZL2w/5RhIKhHLzJNdx9s3opaJlBO4tcP7z6GZ0YsdJMqFGIJdElB7KWApMCbnQb9nK7/U
	cqLw8Ren
X-Received: by 2002:a05:701b:4349:b0:1b3:af3a:e784 with SMTP id a92af1059eb24-1b3c03340f3mr3645269c88.32.1794456975057;
        Wed, 11 Nov 2026 20:16:15 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21300801c88.1.2026.11.11.20.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:16:13 -0800 (PST)
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
Subject: [PATCH v3 0/3] MIPS: CI20: Enable SMP with two CPUs
Date: Wed, 11 Nov 2026 20:14:19 -0800
Message-ID: <20261112041422.2997275-1-f.fainelli@gmail.com>
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
 arch/mips/include/asm/ingenic-smp.h   |  20 +++
 arch/mips/ingenic/Kconfig             |   2 +
 arch/mips/ingenic/Makefile            |   5 +
 arch/mips/ingenic/ingenic-smp-entry.S |  54 ++++++
 arch/mips/ingenic/ingenic-smp.c       | 247 ++++++++++++++++++++++++++
 arch/mips/kernel/idle.c               |  26 ++-
 drivers/clk/ingenic/jz4780-cgu.c      |   4 +-
 11 files changed, 363 insertions(+), 4 deletions(-)
 create mode 100644 arch/mips/include/asm/ingenic-smp.h
 create mode 100644 arch/mips/ingenic/Makefile
 create mode 100644 arch/mips/ingenic/ingenic-smp-entry.S
 create mode 100644 arch/mips/ingenic/ingenic-smp.c

-- 
2.53.0

