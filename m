Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285098;
	b=N8+qQ0fygCa+tpKzQ07yp0CEYixqTEgWwr9tFtbBiwOCBXDfjKNhJE5hfk+etO83h/Da
	 SCBQSCMwTwgGYlDsjaC0WrH5/QlZmV2xgUGLfB5TxybQqR55ajbkde0NccyX8O0ztwLwA
	 O3Cu2sYDLDpct1F+6SCTqS5perUTZ6K6Rp+OieytavT/hRQfMS3C+LXdrykUYSj7pj4ac
	 VIwq83xLRoKzL+h6ulKO+OAaafuDY5fbmWog1pqv2shVbdkhmisqP2j0fmhLfoz5chu6o
	 vaOphBZIwbbU62iwpqsISlo7fhHzT5Xym+bdtLJxnGsMZMC6Y55FmMpoGrAS5P7jyBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZYqgKe2GJZW2UHebN2sjqXJOaRLIiL2bT7ytz8MwIYc=;
	b=PU+ZotZhj7XT1EdU7IulIbVI/TQ6+Tj0STW1lA3TKNLIUUpdrS3uj93G4lAxnNS9nvuc
	 hJdmw8tIDrRqdAsVntufsxLELutHCnNv1/HsQz1Mxq0ipCWVH+KDMoQo7bPIwczErOTSL
	 qJmkvSb+DlY1jsViAZG6W763HNwzuT2BxSfAl9A+tXAtJIJOFyarBO6p+JVA8aSTpFvrO
	 /utR1LQqFnIEvsqWRTquK1UfkT1jaeGcWSBIAYpOHZUIeOeooRoKq8WfIC2KO7I1+glWU
	 qRHNXS+u6RDQWQ/rHDdeaDwyA8TW9NlYlWh8JaaABeDvNR51g4zgllfFBtEwjJiVKrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0uPH12Hl;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA038606A326
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 04:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA038606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0uPH12Hl
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37000e7234bso2523506eec.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 20:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285097; x=1794889897; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYqgKe2GJZW2UHebN2sjqXJOaRLIiL2bT7ytz8MwIYc=;
        b=0uPH12HlIIjxnOa4jUq2Xm2642IE6xugnu508/kJ+JR4O7djbtb9RAgMDgtbpC/fGN
         4ayZEeNFQ+Is9OiZ9QF1ExnDfhH893SUjQ6KY/6GeRVAWY4BE5k1CWBa4YGT8MtZ4VqZ
         nLILYR8B/hzmuZJRc2By31R9+FQV5LfFhg7qaNUxMGPbmAiJH1PgKgZyNtCta++HocuO
         MN9X6USKJ2fhH1D3g0bzKaAAkF0HYlg8mIXvuk422J2ELc9pB890iAZnViDDHm2xB/n8
         crh/bBGr95Mk8S81ToWVbXC9Wzs6kby2CTXNvHTAy+SKSJKdg9Tj48euTvBDAHjWrERb
         xDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285097; x=1794889897;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZYqgKe2GJZW2UHebN2sjqXJOaRLIiL2bT7ytz8MwIYc=;
        b=CUfmEkevo/9GNeoQ3bSJ6/V444iFGvgPAApzPY7IkP23yhsNRtM09UPSL6Ba+yatYw
         fq0s5wi/iwL+P6V/URebkVJspFxl9pyi0O/Jftlhel4iiJ8FwX8PhSyt8PjY7AWATK3F
         Bv7xW9BMXL/V/GcvRNJuB+2wZGRlicsipeQMKwK0BFLuK7PcsVoLYBbqukVHpepELnqT
         UJQsIPY3HhxOPTnVgXZZMhbWHybU9jkMKWNHxiYPOjOz2+Qs/aafrU46bjkLrZ1N68Rc
         drEesSv6oOkG3U2ZpLSYVBrJsYc16Xyl8TSnmfks7dBWwbkGSdiaBcvjpFEtEu/WLPoP
         VHMA==
X-Forwarded-Encrypted: i=1; AL+hErHRaRLOxraxHB0xv4dL+PPH87SeplZh6N87HGOisNPqgrblSZz789BdrcnfEboJTJ7ye0oT7s2z9Vs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fVCkFBeg8K7CLvJgsWP4MAU8/QytEK027pJpOc+QyvpVmfvRF
	woklMVBTzXuqmdBd/CGOxHodmwEQaxkz0z6WeVaTYmMLAAY7MKNEW5Ha
X-Gm-Gg: AYBFou360H6e3wn/ZLTFZHttJAVcv3XpZVCD3UMuGr8ky7T5JpU8RkKILEh0nVnVivj
	Qsz7R5O8RYohsTJT4AZz1hjdVjarq2Bi6rDFrFqmdrlB+exMFM7MeP76K69jkxRsNTZOiXy/nEp
	ZAGUh68n5TTkQPefYOufnJjp+j4hByqyP4XN7zIJusrKbhB+Qy5cKMJgM0C6uzDsFVWHMm8e64E
	617C+NXs/h75NujtTTWhCwXIrdz0QHkmHc2Be2uVBoprScyU336DwJdKQ/BNh+94QBW718KAoII
	X46rSKptoaJWzScppXNuLraTpOCFUXgF92yaYhSnHzpuWReb5O1MMPj1aIMsBEkS+04Rgrs0SVI
	rBmu9xRiqBosn+0NScUF0VilCYv9EUGbFOK5J/Wz6QNj3jNPiFD2sPgiDvAT2v7+RLezgY0L6Qh
	KcixHygqzE+oV9lnTLwdn4xm/qFl78QBARKRgD3cEtTxrLrAAWn72laXgvjwCjAjXkGkrYhRpwi
	AXeAhFZDF2nCYSrgx/pS6TiJuHFJmv+UmBhsFEcRhYqWSQKfIPt0TOTy7837qeqAecoFrsIQziX
	oJCGEPww
X-Received: by 2002:a05:7301:e22:b0:372:b76a:6fba with SMTP id 5a478bee46e88-3751f077fc1mr2683844eec.14.1794285096489;
        Mon, 09 Nov 2026 20:31:36 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9d78sm3340996eec.25.2026.11.09.20.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:31:35 -0800 (PST)
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
Subject: [PATCH v2 0/3] MIPS: CI20: Enable SMP with two CPUs
Date: Mon,  9 Nov 2026 20:31:28 -0800
Message-ID: <20261110043131.1985993-1-f.fainelli@gmail.com>
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
 drivers/clk/ingenic/jz4780-cgu.c      |   2 +-
 11 files changed, 362 insertions(+), 3 deletions(-)
 create mode 100644 arch/mips/include/asm/ingenic-smp.h
 create mode 100644 arch/mips/ingenic/Makefile
 create mode 100644 arch/mips/ingenic/ingenic-smp-entry.S
 create mode 100644 arch/mips/ingenic/ingenic-smp.c

-- 
2.53.0

