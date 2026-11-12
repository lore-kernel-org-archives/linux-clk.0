Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794456985;
	b=USri7Hbg1Ig54iDeq2JbOPMqn8lP58c+1UKa8FsJTV0whwh8V3Zj0aO2rqQHrYevkkNL
	 C3a4R6JuKNyAzUKGGxmGuOdXiSR9cszD4qUMQaiK/8sGc1Q2mCshmzEz/g+zihBYfWr3u
	 RnfoKxQOBEj9RuKDlYYDJ+ZMB/6c+c5LruGrNaSmQR12CcAIOziNWoh4Y63tk/Is2wvIU
	 5lKhLnmmoXmhfpExc0j6Yv7BAXDMl7SiI19/9yA5O/M+Jz1rbTvSDlBhs16s6PJ0TbVOS
	 /B8hvKQJSRS269p+gnXWOeb76pA8vCmXaQeAVfcWsktU1pn3Nsw5DLaluIalNPeYEvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794456985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=A5kGUYlL1s6wl8StQOQ7ah5ktYL6JARyi0H/D6FL9bs=;
	b=IDDZQvFtM2A4lgrIcro8/seglHvZt+ZpY6J3CviH8FvzHzwGTwy6HF5hhD6dhlxX5SZd
	 3k58YRxVMh3mMBdReB/kgs26iwjL4ktupI/rNaRoRvFkejxTJNuuUupw/t2SkENThh++e
	 nDmUp0AF71Ic5PWBbDd/dLwuxfQvt+dUunx7y0ILnarrUglU6/o7mlYFUkZNIA0jCcL+z
	 /tQ76fp2ZsKKSUyTqrKkrv+MvvUrtynzWm/yYKc42c4UkkO/Y/AaCwFi1ErqUgiBzY8/o
	 HA7ijHeY4PUn+nrbID5oDTzEsfa6XxhPGyWWJiHeN8nm2ZpTEby4ZjzuWCqbrKr+MwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DsRLzKHA;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D432606A88E
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 04:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D432606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DsRLzKHA
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15dd124bbe7so5978502c88.1
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 20:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794456985; x=1795061785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A5kGUYlL1s6wl8StQOQ7ah5ktYL6JARyi0H/D6FL9bs=;
        b=DsRLzKHAwiCRqiKX8u5aP4CaTd39d9ywi0CRFk4wiv9LG3fx87WtfWVgpEif6uFyl6
         tEn5pH0xujfK9oKD0gc31SJiU7moP+QUlV0NweGe7+e7puW/kt0KV0+G2uUvEOmnPqiC
         47pvKaCDRHnYJ/mfmv8ra5eu6RyS656R+zkdrfkc79FoOgS2nYNWyBjW321i49jEY+j+
         paBe0p0Fvkep04H4ACT1ZQwyo7NLKsIDxQni2yvXwDq2yj64D2IWN/LRRRELtawjHika
         GBxFno3Tf71hWH/OzogTZbY5TdX3DBrLAazM5gJOuWOvfQsfEj2kMnLzwC0RQnheO+oZ
         7CCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794456985; x=1795061785;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A5kGUYlL1s6wl8StQOQ7ah5ktYL6JARyi0H/D6FL9bs=;
        b=JMoqijTqvIwcN4omZUNkjM0q8fG9cUBDGF9cdz4i2T9NdABRqjxYgjRX8755Jf/Kdq
         f7M47mHxLDeenW8iwkYwZCtMf74DNnKjYBYv5DqH9jUL0v9Cbd9xvmmB8G4afnjJFKEF
         GKhHuhHfKYt/4qR6w8vX+WB16HwkYCUe/g5CXy+o2vgfGoem+DRiPnfOwHqJ5qgYlnGO
         /fbDT6Fcat4soEiSpBHfdqEtwcWcTPJALe8jWUfCS4/CIK+cHgK8A2p8Jzc+7dteeX/X
         gh2nGnSUwy1hKz+Y/xB8NcylAJHsO7kpjks1R5rSBUtNYPYIk/8b9uM8nyNCtzrqrN/4
         39/w==
X-Forwarded-Encrypted: i=1; AL+hErEDM0vN18xcN4WXVapDVW7iVaIwdOu6U82fLHu9TW8fvAAWXqZbUrYna70Hl5zjARlUZxh9ImljCLg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9e4BUE2DCpbvouCGN3GqExQ8USI/A3C1fMS+XN718x22YCpiVV
	nSvayyPg1yYmoB65d9/aj5Ke5UJNeQIyufbWrG8aQ2LJY9nFJQsLt2M7
X-Gm-Gg: AYBFou2outgLh/XSSBho6zNkP5enohjHtWeCODb5WAvPIheP5v9dMjvgwuUcGXlCMlB
	j5wr21SPVBMuRdc4nSp3bena3ZBGiSMnyOnaZf+e0tSIHM/jXtR3H2Afc3XpWioftm5WILPYx9T
	CDtZTz1DCUhm0sDuc8+GnsC/EK+i6ntEt4HoCa0E6jyaf2HOlQFUHOfAAummSmJDJRWQ0oRCkLJ
	vF2fhywyU2lqcje7CO0/GX7fvqlvHcNzaJP9xsvfISHttLXQK6b4Zv9r+QEjgwHQHEgWjs0jsA1
	uBDTYZp6e1v6SQLgIiKb8kGkYgzeSZvxsCLdQ5W38EGtY1RS6GK3TO2spj9oW/fjJ55Ex9cyUWv
	ieAXQHy+6vujzDEv8z5sJs1KQ9zV1sdbZTzk1voTuYwMtC8sm8FEK0jPPna9d6mn0muq3pKsD1W
	NL0hoUbJeG1Sj05zH188PQPhqjYzJH+pgp/JUD5zDxDs01SQMfyGartLm/dwBKF233LpQdbgU5F
	Ewxm2NpzAoGTl02KDAb9xIQ//TXzqJ/NYoRGX7Ine7R4cOZ9/b0djc1Kpi/FlPDyA0bQmuDTUgd
	wsOl/K7x
X-Received: by 2002:a05:7023:d0d:b0:1ae:e0f5:2cdd with SMTP id a92af1059eb24-1b3c0324aa4mr4176471c88.28.1794456984463;
        Wed, 11 Nov 2026 20:16:24 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21300801c88.1.2026.11.11.20.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:16:23 -0800 (PST)
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
Subject: [PATCH v3 3/3] MIPS: CI20: Enable SMP with two CPUs
Date: Wed, 11 Nov 2026 20:14:22 -0800
Message-ID: <20261112041422.2997275-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112041422.2997275-1-f.fainelli@gmail.com>
References: <20261112041422.2997275-1-f.fainelli@gmail.com>
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

