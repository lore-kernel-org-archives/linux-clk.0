Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910772;
	b=v7Nh1YONlZuS582JrdPeGsGA6vNEsXRhxw8g5Hbv6JlMYx7XtLKbV3LDz8KsLDc8mwO5
	 3j7VklR4iUazhhlQiqv6LS/qROg+oZkYYabo/dLc51h08UMrreLItG2HXUJm6el1WLuhq
	 iJPmZ/v92g+hCXQ8b1OF+XuurhzgsuFl9FoscpVgbqQJeOpyrKsS9V2lqAhEhY67M/tdQ
	 /Q1lItSS4LCbR3rnviC6cYLNd2lsX1Zln/TXiaJGPFIKUQJmkexTC4PW5D+lcQPuMSmXp
	 IXp/Vnz3lVcX2F3seljguEblOUdJLyQHIZtW2o9hYRUC25zhPxj/DfnOfsd/2/Wypeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9Z8PMfPvxrxGf+DKOk0RzngX5JOV8DGnXZZn1Uac6KU=;
	b=Q9+uWmGcKE/mBi3COMwb3gPsr+Ad18BmXAAGQz4b5xP9xzbXold6VGJkChZ7S7DhzkHw
	 RZvGrbgtu5fwuQ1eYAkOq4Wed3H36mEap9M4ExpApcgZMekOuNfL5AmqmZuVXk98N8tLL
	 K4CQJgVmiGRMs+855arFBsv2VqxBpIM5CAu+NvURs2BpisG+bTdtfmkKqogCpYjtsuYso
	 Y5prPJHH8rGFqcQV14hDXnDUxjQ16qbqTTCz/ZzD8S/kU8Ve1tiEOBAph0mxinaF6Nf8/
	 SkUFSLJT4S7n4QXMN+R/1Aybjw9Lgxf8TDBRWJPJ2P+j2iv8XxvQ5sR1TSRIkt+3dhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mm8Va+dD;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750CB606D811
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 20:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 750CB606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mm8Va+dD
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33fb4680717so105136eec.1
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 12:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793910772; x=1794515572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Z8PMfPvxrxGf+DKOk0RzngX5JOV8DGnXZZn1Uac6KU=;
        b=mm8Va+dDv5eBFA4fNuGRrRC7b/jHpu1S6axzT/y01V22GTWPiRGH/88mr355Cvw2iH
         XdSGfQN+mhgniNO6+ZJaibST4Vpp9w674OIrn1Emx/Z76gGcYVBTSoIa7gMaa5D2fSDW
         vLi/1nGkVodW4fNo+a0mc1Ys25FReXMmsy9+5VV0uH9sdrnMa46c8zRBEQS4poTYaTTq
         PnfcMF2TLQ7qWxkJFpkSgLj0qZZSK8OII+vIVV+JFiGsSSg8yXOEOjBZj06M/Xo8Rihm
         /y9PLyltwqAJpE/8MNBLlgRiR8Xl1Kfc/NOvm6npN8F/GjiKMhfedzMrGrHGrPGski8m
         TTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910772; x=1794515572;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Z8PMfPvxrxGf+DKOk0RzngX5JOV8DGnXZZn1Uac6KU=;
        b=adH8/h/CLPToK6lKC4j1mNQLIxa3SPKJhisctAMAJyTU/TkzJNSQ5iGEIWi3dozovZ
         BSU8qKDPCg0vVzX7KyyqSrVXwD+y0qVvG16lEg4I6dwRw5NDclHHDHBi0f9k/Cim/TK5
         LzQeL7ZHJaq7O6Js0gKSd5D2hdvi5kfWXVfXwYkbSzHZb6BVNkzavOAP0eoCKxB5CiK5
         ix18lWMWkv+m0Yn0Om8+M7tjbpUOPiSqzzojVfDzH+fbhfWVdMFk8YPUpugoZ3NpgOuP
         vXTBfJU+CawaGjkfBO6KTbVyUCwR93N+x+Am4NVsCgUiiog8hxUTdq3DLmNKF5TgAE1g
         Rhtg==
X-Forwarded-Encrypted: i=1; AKwUvBw/qcN4bI9M4bSv5IBKPTkpOFjGc/dJFKO+QaVmhtRWZg+AESDsyGChuOxWhMqIbJZ4Tu5XS30Mz20=@vger.kernel.org
X-Gm-Message-State: APuU4Z+if3tbkHQPa5rPFG38y0mJzcakXoeAVW/RnaSmJmQ2O0J/rbM0
	Y6EReLmOYtqoq4tXwQCD0GBbyQQTzofu2+/yso+8Ysddf1rA/5oreWTu
X-Gm-Gg: AYBFou04rA5ESnxlQhfYUx30lPGabHsI5IVlJ4O3DcBxx8KLyonlgqFJyG0pigy8b+C
	8p8Buxx+NWnEE/E1hWW9EabcyQEOlN3pZjXJ8aESlu/6HuwqY8oI/ojuWh0X3xb9tDr7fASgf2E
	1d32grm7jtYRhj03SKQDmTnAAtvgwG6C67QI8loRRqciG/C+f4zq+l/9dyd81M+W89yzGMnDl9B
	2BiqO8KVzBaHta0hpaalMGe6PqQq3tfHaIjQ83DllbN1py+NKChD2WzgI2A+AvMnHGBeVaCFt7U
	r796azwnuiky/ijj5GD4QHeLRAo6Hb0jisfmDO0WkUywTyZ0f/x9FWBJ4wJifkIDs1IuetULT0b
	no+fbvEDLACJhzUJHs0h4YJxPVcsqL5VFl+0Q3ze3QA4lj+20n7SmEHFOCDvnjcEW2f0i56/7zs
	aNOygjBupl9PFiAMnYKh5WEZIUROB61JnFugVd+ZG8QHf9PwgdPRntA9+PznDtuoxHufD5WN80v
	kosJc+/JXrrWflzcs1eWMDAAaT/tm40RMkEeAR2hMVy+ej/3Px1ZF/y8AIZtyNoN2ZaeipISK5z
	2B5yd/9W1dDO/8HmfTDRycS2lWr17w==
X-Received: by 2002:a05:693c:2801:b0:36a:12c1:3adb with SMTP id 5a478bee46e88-36f75f26494mr291482eec.20.1793910771661;
        Thu, 05 Nov 2026 12:32:51 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72dc30ebsm632458eec.13.2026.11.05.12.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:32:50 -0800 (PST)
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
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Paul Boddie <paul@boddie.org.uk>
Subject: [PATCH 3/3] MIPS: CI20: Enable SMP with two CPUs
Date: Thu,  5 Nov 2026 12:32:42 -0800
Message-ID: <20261105203243.2292647-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105203243.2292647-1-f.fainelli@gmail.com>
References: <20261105203243.2292647-1-f.fainelli@gmail.com>
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

Rebase Zhou Yanjie's original defconfig update onto the current CI20
configuration. The resulting image brought up both cores on the board.
The rebase and validation used Codex assistance.

Link: https://lists.openwall.net/linux-kernel/2020/05/19/739
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

