Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509154;
	b=dYiMURoa0u11JF6Yt055Tslna2xEVItH1uckBb9AjCd5tj1tFkzE+dxsnG5wLSpWHV7L
	 0pdm7C3r0j+gFOZ2KwTFqQH7qGSjy9EEfcPG4rPQa6qzHtvFHS/bgTbznm8fKXvtbcej8
	 mDTNVA/HJYLveLi9xm/U2xa+xvg5aOk/ZfgBdSBEhStQMhRJfU71cvsf/IVcafNl9odWo
	 5RDu99bKsCIBZshYF0tEGXPKsjWQA9fsPEeH+FbdhF51D9zrkZnTFQb/I7ZdKX0GOo5/l
	 DRp/4IE9X9bpfy++uQmdlUzWpAqQBprZDr+xjnGS42xoNjZ74ISV3VYit60wMTVUHdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=A5kGUYlL1s6wl8StQOQ7ah5ktYL6JARyi0H/D6FL9bs=;
	b=sfjWW67Qo+QCyoSLnkarjDIt/tAZOBpFWeCDLxhPlYgXmf+66CHhzwJCuPJAYGA0tyef
	 PPLkqHkmfcGpwfsyMnQfge1eiOd006o/tS8EBb4SGU5DiRw0IwQCBkvXEaVxWJKHVnDLg
	 vZeeWbE/p/A+H2G3wSnNPPxuEKmFr9OZ+DlFzI72915w8Yb5uDBIF6qXXvhVmqMMpNql/
	 ex7sWpH7fLvlZ0zM7FEjf1UQ5iSSZBvxFWMEVKWkgz2KsIkm7UTw/EgSmcix/HhlJkDuD
	 dQAFrqJR0KTzkrBIS/Fn6MgMODIUzNzq0oAyftFPgIZ+E3th+146JLdullrJuH/4s4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kB+t9uox;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACD0606A895
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 18:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ACD0606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kB+t9uox
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3791619605cso386519eec.0
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 10:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509153; x=1795113953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A5kGUYlL1s6wl8StQOQ7ah5ktYL6JARyi0H/D6FL9bs=;
        b=kB+t9uox/Lo365p9L1SC/s5gJVbFEwu1GOKo+8BeQH3MU67XG02PxoSWJvsD36Uo1D
         Cb2OmVFqzBRiWx2v7LV2cfIWeTG/rK7SyU0BN4V/Ky9G7Vsr0D1Dqccbe1/QAWY/8jQp
         MjxDAlUDqwlADUco0XWOm+FEHQRfhV8PSs/EVFkGd49PIvAvZtQeFT5qRwDnGKvhx0sY
         K9p3ju7oJw1iIgtwVia6zlTmpiVB9EwnDisbcZc+AZMUy9EIQjH6/+ueTxbXvpevQ/xo
         k5CZ5otpSHojdbA4519AopS8nZ3RyfisMpZKKXi7mqUsWmhuquCIHF3hQE1paxUN4jAR
         BS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509153; x=1795113953;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A5kGUYlL1s6wl8StQOQ7ah5ktYL6JARyi0H/D6FL9bs=;
        b=Fyp39IGWyFwfkoiSF71+bSEyFixQcpkved3l4m02BuHqMrsEw5wGhJ5mKHym+C2nkQ
         e8IM2lu4mIc6uKSYjboVzVqZXzTwFXTWQ5E7xleOvWxmd2w6uaGEeaPjh0uz8CsI5CZD
         ss1okb91PVmDnyCtGpU3amTfGVm2WBpTlCf0t6YmfzTh0tHG/gXQ+BxcnxIOrD4xajIg
         yRPUp15mXR2eQXodwvBueTQYQecCukbHclDVrYW8JImLakElEckJ1bWooP/4K1Qs3yzS
         LoPi17mOYxg8GWViZdaa7SxCts/kn4Tlpb7L5G7LgFS6uJAkgHdUSULEYRyLnqdqmwtK
         nhQA==
X-Forwarded-Encrypted: i=1; AL+hErEuJQaQ0rKieDLvfJgdTr0p8hoCDOppv/eHxfDyhAHYIE+gzKQg5uXrusRLBY5F+HL3Z+mbu4KjwOI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jd/ro0S4DYfixgA0YbnYf9Krep3uqozlYUw53TnAUrpdCwepP
	/ONpnccDjKg7vcAV8o55GLJpJ+9ZTi8WY4fl/y8zRdQ6rNhwutol2wkF
X-Gm-Gg: AYBFou1DlPXEjcHDyqzXba5ETmOgGzlzgdtb6Ngv3eYbyAUwoTKTgLeDg+CgpqLOLc0
	0vIEHi8t6+GsmCHj2RTXdmWgdm85ZSg39d7Ly5z4SNJxeeUAbCDNEk4QrhKVCGVB9nHCI+vFZz5
	l6tpa3RDv5Muj1+HPA2i13V28rv5ZL14PCe6PGOzy6paC8Q3hd67zKcHU3YYqnFPerS/zZEDiPV
	dApry1JybHI4L62gPskmwO+9WVTVy68BFNEy8ls5EJ8/ruLwthbgf3MVFIGgAA6ZQx1bFEf9F16
	hnGanUsOnHpwBmeVi4dMOVBb3cAbcyQ2TGPg+cjU48y3t6BU8qiy+gZfuZIqpwVhu8SUcL3sEVm
	HMLSLNYsI0PMZZUH2InSTvcRGbuUfqshb6IIjqWaWF7AjoAbd1LD3jlbjlF1pQofP0drh6ACARe
	WdFk/iflIacKcYQWsc6iKv9Hflhl1uNKzpRhSnRHqFm4vmkAs8umATYqgPm8aWbqPo9bhxMANqn
	tPSwtAlIfRODnLY0xeSi0RaN+IUM7whejtG9HAIdezbwsrolzyWA2sYG2KUsW6nMXM/1S9G9twL
	Thq/cDDGeKx8Ew5jwMViI6Wr9Hh3tA==
X-Received: by 2002:a05:693c:4152:10b0:36a:4a68:84e5 with SMTP id 5a478bee46e88-379659c6839mr40367eec.8.1794509153074;
        Thu, 12 Nov 2026 10:45:53 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm369524eec.27.2026.11.12.10.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:45:51 -0800 (PST)
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
Subject: [PATCH v4 3/3] MIPS: CI20: Enable SMP with two CPUs
Date: Thu, 12 Nov 2026 10:44:41 -0800
Message-ID: <20261112184441.3724150-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112184441.3724150-1-f.fainelli@gmail.com>
References: <20261112184441.3724150-1-f.fainelli@gmail.com>
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

