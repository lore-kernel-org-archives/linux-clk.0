Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596928;
	b=XS2bu293fp318PKQXqXixaEJwYsaxHpaClqmZBw+LjjvaanbsAUtbFH8Bnz0bQrww/h3
	 pW/DES+Ignk6uigiZf+8FNUv1EYkpJlLGnv1DCRcouDrFVY3zNBMThlwQGOt+l22r1y/n
	 wHbp2hrq08Ge73Z9/WhUr+sCN6lfMvMi/TibE6GRkMkymDXp0uOykw8uKDBnV8hLhfoqs
	 UuEIHChDHmNwpNcC5WfOTfxPBQsLZHKrg0yqr90c7RVAiz58EaVDjtjNQH8NB8BwsxmcT
	 BxDzg0zUaekBHd8Zac/suRgJLi5KHp65pTmq6IM8Aoa/S6fR9nLn2NQyyqkJFp6tCcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=w9+uS//+4af4PzBkDEhgycJpPiPnu+xIQt8Ostr/eb8=;
	b=4eKLBQ2aa/AIcI2zs5Zu4LAKbUwk61WVybgJJ4UtdNKD0nrALJ0l3XD/kFb/KmdqTzHd
	 2XjlSBTAwbSN5uhs+Wq90vMrP9mBLo6xyzwL5gj9PkAPf6rtSHq8NTAKXNCHXiIygNd4+
	 O1gnFY/6rOV+6g2dRZoQZc2yNlDKUx19IWUI0K7oj1U1GEkl0El8zLmIbskex4MC2jBYh
	 OV2rNZj9ZXiQ/Jka9sTzmV7zJ+FTcZ/PQtI9qr5Rw4XGwxo7HG5jHXry6mQSmKEdK6nWn
	 ihwJwWb841zEUamyMZPp57S6uIOi5/hY2syEFeRV+IUmdEqL3TkU35OTS9aRBIRYbng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MDooZqaB;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA02660A6F64
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 19:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA02660A6F64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MDooZqaB
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3712b6d9843so1264098eec.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 11:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596927; x=1795201727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w9+uS//+4af4PzBkDEhgycJpPiPnu+xIQt8Ostr/eb8=;
        b=MDooZqaBODVtmrAEROIhZ+YR/IZ2G7Dej7dChwE5k7mdUoSo73eh84tWWl3tlb3wZP
         XOhFph/aNh8LZ/qM1y8R9CJapK4naTGGNmSKML51tgeDwvNvYSXUsoaiMBx4Wo2eQ5Pt
         J41+8XP+rka+5f88vrNiIG4mp5/vmwS5Qo9eMgJ2jrocKgufYauwDC79Mt1J61WgfRXL
         KAkVdNIwP0OJAvoFFFHqMU4JOjEOEOFIwTKOlpycSTlhIxfIC+GOIArlK73I+caDlE/R
         k728aO6xXpyFmqdJQG19lJxd5E+RjB/EvOCJVQOoSzwngLVNIbb8Ki16Ul7RtKxPpqXC
         4MqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596927; x=1795201727;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w9+uS//+4af4PzBkDEhgycJpPiPnu+xIQt8Ostr/eb8=;
        b=q1oCYxE+RJ/U4u4XPDLQDIyTPtNY/JZfMtNUZ1dQB5xH1RTRgAD27/Mab+DqJ3i9wn
         a5FvszOhcR7EevkkEwpRHPywzd41zmbzcfz6QmraiBTOyB6LTJ5bYfyUR5bDwmtKdpil
         PUH7YhaYEfv9B1W5QXKJgnzchuvLM8cnd55tLxSiOvcgox0QLdjxY/FW378IwISBEfQj
         Uuy0cAptRCIOQrTBB46KOuexkduSQSYWQZXDeNnN0Iv/4p+jfknWNxhnSHCwr1x5W6Qw
         ThPYg79flbJABDYhevpVf3Ruq8MbJjJUhufuGUJX49kaEvWE7Q3WsTyJ+5czeBjGD+Cp
         bCrQ==
X-Forwarded-Encrypted: i=1; AL+hErFNKoWbcXqUryF1BRuomNXA9UpbQYTK6oxT0WrkalopBmj2c3YUg5mf8hoLBP94StpMkO6WmBD7IdM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qvyqym2uOLUXKVKwBjiawhWitkAAgozL2FUjK5JRu//eymg+r
	anWB8zLt/b5Ob3fNwUy67tZUXzDOf8jykg/z86fwi5EcNdNHG/wQsH7+
X-Gm-Gg: AYBFou2MT8OQ0RCLq4utlEZTao6/TIHCY/2JIe4JsRHjvcnK8UxzzzSUSf7ib0odZ0X
	oTU1Zd3r2BRi2XnTQnAb8Lu5V7kYxgulhsFGJLpbZBAlnKO1Bb/YcJne3Owp7FKPDzkNGKqbWXW
	hZsmGKmTxoA7TxuNrK3U0CdwTEx6hWIgykD5yw6qxejVV3wTfsb21IK5Dv+lMlD75zxMuHgZGNw
	uhdSaDchi2REOfJhdAm+UiEVo6/mNVcYtey1f3RNuIqVDiBfhsxT5ad/5SjA3d7yI3PordjmWL+
	knckHyfE3KQb1nwXecMwNXOFtViOVLFwSeJGeia7cuZNRdY2EsEBgfYcrXPisAhTcIIR6J4VJSO
	+Bvamqba/+9K93UUgf0BnryyW2TqR5OOl+xin0R5lH7ktzwaBbuXd6dyWzVr+rKeMTtIknfsHWb
	MaV+R6NnsyoAacZa5l6qH3QJuNkHIg+x0um9bj3iWqUV45tngcGfWFGpcZ+vF69ttcPgMkB2exr
	zNOkqezZX03Rh8+ZxdsuZ9sBpyFh7JdbGmpVl5o803ya5d4uvzIipqreM3CcXpQAABKmULzxrpO
	2Uhf4KQx
X-Received: by 2002:a05:7300:6148:b0:36a:270:ce76 with SMTP id 5a478bee46e88-379681c69afmr4380882eec.33.1794596927130;
        Fri, 13 Nov 2026 11:08:47 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm15714037eec.25.2026.11.13.11.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:08:46 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	hns@goldelico.com,
	paul@boddie.org.uk
Subject: [PATCH v6 4/4] MIPS: CI20: Enable SMP with two CPUs
Date: Fri, 13 Nov 2026 11:08:36 -0800
Message-ID: <20261113190836.470937-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113190836.470937-1-f.fainelli@gmail.com>
References: <20261113190836.470937-1-f.fainelli@gmail.com>
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
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
No changes in v6

Changes since previous posting:
- No changes to this patch; renumbered after the IPI prerequisite split.

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
