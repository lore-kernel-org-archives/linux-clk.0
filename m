Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285102;
	b=RaOwxiKQd9aLhMCPVP1bGpzJjfWFRUNKuTJuSIJvaKxfEKtOIGQmDwi9bActw2MujrpF
	 1bbJ/oYedRTjbWTZ3Xf6/GRzKxoRgmDpcwz6r1OvGvTmqs/RDix9DEZw55h3th+wcPDtJ
	 BG4VU9GNlZwyEpMJ7TyjwINwKhjCtSxonqt3FSZt0aAqzZqy47I0zY5k2uWIV7Y3kmtCK
	 8ap+06ZCvxixD+OIBYyKwXZgxrkbX64p4iJK32QO24f2Ikv1g+Wikaxg9G1sj2vJ/Q7dS
	 Zxxszt4Z5yGGIOV46h/K70v/jgq1KbPqi1woBH6kwnH37cmYDbG6tnlzOr7vKIgyMbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RwxD/kp0MCQ652BLhqihyWShn3kE3wujbUgCK3EzeE4=;
	b=THDCU1kgNYBzHCC1naep+8ZBywOXHLAAAY3lwV9CmuJNIF6RB8x9ztSS2bxW3T7P7IBF
	 RSf/DAymMUyE38XwGSSE0P0/jK1x7uHFn2nDhbRPlVD6S+cuLnk6Pzd1Wb5ksIzExCK2d
	 SGvjTr9UtBMHTTfdsGa8+HyOGuo4ItFNscW3yRlhww85SXokmNI+7AfQfMs+CGYGUwDxg
	 YNGAZQ8vUldl4r/fz7LZWdfvUwCt0cQeIZrj2cfNJfOCXcMnWh9umS+qZYaC5FgvBsfLl
	 lw3ZIFTrZ3OKEMcGppq6LN2ygR/rUpHKIXCGeUeyJG4flB8MMC6X9p4hssslCUblI/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jBDLkMGE;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9377960A2613
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 04:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9377960A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jBDLkMGE
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37000e7234bso2523617eec.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 20:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285102; x=1794889902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RwxD/kp0MCQ652BLhqihyWShn3kE3wujbUgCK3EzeE4=;
        b=jBDLkMGEiDBhFC1CIgcwJTC7ITQrTgcQC8+F6btEqq9jzX4wL++sytXmcrTwqjF7rw
         G5KsbbSO2RB39VxpEb8ngouHVGGpf1BFFhdAhokCKKoQHCBVEnuNQnrecpPpWLlEcA+1
         hkKMkB1dTRwlgNNa+oq+C7nxqP6HJOd6zryzBNdh4SHVF95S09ZDDqQx4AqRicHOAAZV
         XwIGhwYHedxFaeAaKeOJoULgbdTUcaHP2NibCWg7U0yhuXoi9UwCCs1TF0ifz0VGT2KX
         uPgrrHObBfnZggK2S3vbmu4Mgr4PEmvj4vCFaeRuXIAzdG+WBLW/EUVdmyDC6ZZIBf6S
         iJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285102; x=1794889902;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RwxD/kp0MCQ652BLhqihyWShn3kE3wujbUgCK3EzeE4=;
        b=xZSkWDNvXlHnBh2MUriU79uVfyfGS7HFnezb5xIfDrcCRJojJ+HreoZZeDYtPpiEv2
         +9jOzXzrsnQ5A4XVddU/BG2b1Ao+6ttri3IOEdiBTxZIQYn0MST6JbVB+tGlShLIOaUT
         88bHACZSamQUH+qF28ALFwj3qf82QYqkh3nIjCQJ1wjnYVDBCYPp2pudzD6IJ2Frbv8p
         STbYIV+P0ysQfL2yAk/fpwa6ssNsA1Qkwoy1GxksLNMt3h0bCKY942vkOA8Q5HS4AVsJ
         eJpCEa0yoTPnFY3Qhed8hPdGEjDEi6G6oJDp0jOtocw9Wap2LSqKnR7bWBdyUQ1ozMgv
         FhqA==
X-Forwarded-Encrypted: i=1; AL+hErFqe2k8xWDPJGZq8XsEQknK00+cF1Ixm7CCP7Ueb9Hbj1GEzWWYWXh6Vh3h1yNORl5zb1QdWOurZ2Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/N6cuKo4efZg74PtNOSFku1r3AmoPl95ensQN1akaThhXWxVB7
	FXoe8PLyMNJLRe+/NjhaiwXLbe64Sl5cRI14ONZIYwlaicAnRSH2jcmh
X-Gm-Gg: AYBFou2FQB9w61WPmIRKM0XHyHfMBWSYq8pugTsycvSNrLsP3w28xYoN/L9EbPdLRoR
	zBJm2aO5yMWj9I8BLEO8y+hVpNTFuNiL5SW6kTbX8htKAMNoPv7Wu9vNAjOj5Bw2jNVoW5Xo2JK
	MVzlgWAeSW8vjCHp4VKq9Fh6q80f78o5l/DvmKAEl+KMklamiD0kwPWdq7Oi5azQNqc28p+drv8
	6n0GjcdJlyMeCNR+VLJL9//ffEuj8XhxLYOLQVgVqJAFwmLxqZlnMByxKWpNKFNwtCzEknqJmnP
	jykQbL2Hc7nY5wVHpb4mrg7LT+CImW4W5iPHZqCoRbSLWxe2pahBgLabp34bAkTU6sK89VV7cNe
	HCSe7+39d7OXCeKD1qUFyLxar2M/dXU71ZyzEswO+0ZexSBtjWNQw1tlGSVA3UciriAZ1zzpdl7
	DPX1i3OL75qLkBYYdoRGgvLvEzrUIE/AKr1k3MjaAluKtWTcdtGY7Uql7TP8lVCatWa8LPFrey5
	d6crOBxvfmygz2m+HE8oxDAPp8Dls4r3+Cf8AS8DSMiXwOdb8UA17CfMn40uU+j9zQ0RNZUTw90
	Lg0LwEGvsA==
X-Received: by 2002:a05:7300:8815:b0:351:207d:bff4 with SMTP id 5a478bee46e88-3751c53685amr2202305eec.4.1794285101599;
        Mon, 09 Nov 2026 20:31:41 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9d78sm3340996eec.25.2026.11.09.20.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:31:40 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	hns@goldelico.com,
	paul@boddie.org.uk
Subject: [PATCH v2 3/3] MIPS: CI20: Enable SMP with two CPUs
Date: Mon,  9 Nov 2026 20:31:31 -0800
Message-ID: <20261110043131.1985993-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110043131.1985993-1-f.fainelli@gmail.com>
References: <20261110043131.1985993-1-f.fainelli@gmail.com>
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

From: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Enable both JZ4780 cores now that the generic Ingenic platform provides
secondary CPU reset and mailbox support. The existing device tree
already reserves TCU channels for both per-CPU clock events.

Link: https://lists.openwall.net/linux-kernel/2020/05/19/739
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/configs/ci20_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 90536cab417e..09d65094b1bd 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -22,6 +22,8 @@ CONFIG_EXPERT=y
 CONFIG_MACH_INGENIC_SOC=y
 CONFIG_JZ4780_CI20=y
 CONFIG_HIGHMEM=y
+CONFIG_SMP=y
+CONFIG_NR_CPUS=2
 CONFIG_HZ_100=y
 # CONFIG_SUSPEND is not set
 # CONFIG_SECCOMP is not set
-- 
2.53.0

