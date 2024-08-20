Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE561922C7
	for <linux-clk@vger.kernel.org>; Tue, 20 Aug 2024 14:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724164582; cv=none; b=EJddg+5tBDQm1d/HjVKC1PWP9qhLgiz1SPnV7MYNzdsn1nOrOaO6LUFX5TOONNqzlZqPgP7p+qwfEhO3UPduiFhiaEKqdzm0RkuUxlWknmth+9kxqz3Od4eIdqVdd7qmXQ76iwEq/OgeV07w/O24ZK2Ix9kqmvTnc/EzlhsLMDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724164582; c=relaxed/simple;
	bh=5S2rS93fK6yMvjrCCxzHJ+5LjG17CGjTYW//cVGBTKI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HdUFuoEdrA9dTvuqhPBDREE1V5lVMIC3l3mTqwKKaxFWBu0uyAUYVgmb3Ju1QUONIaNH3Qx1YeuZd0NlJcqJXKkDwTfiUZMcfjPN340mRpKS9m2w7HehN6G0dVA740EI+McaUKINiWWD8ncpQJzreSPE5YnVpXhVZ3gaCdFlXTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=R2Bb2H5g; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="R2Bb2H5g"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a8643a6bd55so137762166b.3
        for <linux-clk@vger.kernel.org>; Tue, 20 Aug 2024 07:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724164577; x=1724769377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rh2Q70Yw8J0M3uUvlLdvsQJ7GpaTom9Aupmo76o5wP8=;
        b=R2Bb2H5gXS+3BDftGOGlZCQ+Wyo82Qnw9HqTASkf2sDMPnuFWG0xuyUgR/syYMrosP
         pwO//CoCHBjRUsreF885hRlCpEvIpc/fm7whEAEprK6EFXrB0SgnU2lDVY8d7JE54aCO
         ncF9+z3rq97EY5v2DK5N9SeyDjpVysq+sXsCeeUIHjsXaPzeTdxjhR2hoqYS3oce4wJK
         qXq+YaaY0HsVqMr/yC+C6ZM6Q/Qa+vyIJg+zxq5VirqAmvILbfUvQQfgBZvTstj9yKz5
         dO05yQIytoyHtAVx191MkqyQDjCsIuToqWyKZZkjwoGmlBjKlMBfqFjsOTVwwHbppGZW
         rqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724164577; x=1724769377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rh2Q70Yw8J0M3uUvlLdvsQJ7GpaTom9Aupmo76o5wP8=;
        b=UjggrSB96CUZwYrmKEzmpQEuDzjYG+gZuIAYQqeNf8/AyLyELEhFMjQVm9Zy0qoXjd
         vVCSXiia8hYoU+rZHOEHoCnO72uSklmhuZekFSb2q9zaaScdSx/xEZ/uE8r4seq9fVg8
         n3YeBZjXezgBwbl7nWSawboGEgoMZRZ0V2wdAp87vHec/27rixs3z8UCSbggeuz7Z060
         KJjXqR0EX9GPsS8ZEOf9WUIzCXTS7LnLcvqymlLgJp6MWI8bFiuBoy3Ydd+WHY7Jtkfq
         FCnEU9gvpkTzdYn1Sp0IA+C+DO9OKRbzrUv++8LW9kYYssjkP/xURcuh0tRcWhS8YX65
         6afA==
X-Forwarded-Encrypted: i=1; AJvYcCWYQZJfI7wc9LOlv1fo6Qi9h0fnb4qCa0avH9wmf2TzQugkn+DleHVBXWIzDWL8Nz4V+WEjxwvE/4s6mOV6DjUHGPJTobYmuJhZ
X-Gm-Message-State: AOJu0YyqN8cuw3sGBZgbSKx/5s+V4P4fPy+xCgtuashDitzpcf7KuOfG
	69wAxMiikbm1IYJ+gMCRv3UmBldKVCpWImFGP4xybaNgtf8YnjX2+9YWIK/WXO8=
X-Google-Smtp-Source: AGHT+IEGycq7Zes7rT7OOvl2flOQqrkeiAZAc96Hg1g64tQ+uh8+RnXT78ievbR0WEcFfugVqWJabQ==
X-Received: by 2002:a17:906:d7cb:b0:a7a:c256:3cf with SMTP id a640c23a62f3a-a839292f3fdmr1084910466b.24.1724164576436;
        Tue, 20 Aug 2024 07:36:16 -0700 (PDT)
Received: from localhost ([87.13.33.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83839355f5sm766076166b.106.2024.08.20.07.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 07:36:16 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arch@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 05/11] vmlinux.lds.h: Preserve DTB sections from being discarded after init
Date: Tue, 20 Aug 2024 16:36:07 +0200
Message-ID: <12d0909b1612fb6d2caa42b4fda5e5ae63d623a3.1724159867.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1724159867.git.andrea.porta@suse.com>
References: <cover.1724159867.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The special section .dtb.init.rodata contains dtb and dtbo compiled
as objects inside the kernel and ends up in .init.data sectiion that
will be discarded early after the init phase. This is a problem for
builtin drivers that apply dtb overlay at runtime since this happens
later (e.g. during bus enumeration) and also for modules that should
be able to do it dynamically during runtime.
Move the dtb section to .data.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 include/asm-generic/vmlinux.lds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index ad6afc5c4918..3ae9097774b0 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -365,6 +365,7 @@
 	TRACE_PRINTKS()							\
 	BPF_RAW_TP()							\
 	TRACEPOINT_STR()						\
+	KERNEL_DTB()							\
 	KUNIT_TABLE()
 
 /*
@@ -683,7 +684,6 @@
 	TIMER_OF_TABLES()						\
 	CPU_METHOD_OF_TABLES()						\
 	CPUIDLE_METHOD_OF_TABLES()					\
-	KERNEL_DTB()							\
 	IRQCHIP_OF_MATCH_TABLE()					\
 	ACPI_PROBE_TABLE(irqchip)					\
 	ACPI_PROBE_TABLE(timer)						\
-- 
2.35.3

