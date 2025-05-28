Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD2621D5B4
	for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 23:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748474241; cv=none; b=RIgzZ33II0UwgbpzqdoZ0zoM1HWOPP7G9sQwiVBxYFAir5X4UQ8N+bb6sEsBNFgRTAGP54YHkxRQJ7qdLgUpX8L53qSnfHGqSvKH+998i7apOdGX2oj6l33zEbsl3yxKRV+HN0PxNRhBC+JZ5Hiwmww2uHG7OnPM0a1VQn8VezU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748474241; c=relaxed/simple;
	bh=XVNjQfh5u92+SvTEjJh8Vit7Er7I1Kh2/fKNBT5Mpa4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EfAsiGuh98llwHoQX6LKbVKdF7h54uXvq6yk/a9wjZZ1qW0bDN0WnzWzT9/C3E7AZeQNdUsK9JBRb8obI/ay2/D0COEY6i9J2AweXG+dGa9osikcuMnuZztRSMoemHZ6EOTu3ZyBlwrPJowz6/MKEm1TFHOG7E+ou2NyAoEGQ9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DO1pgPYz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DO1pgPYz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748474238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aSXeXdcmYX8Y9IqDmsh150V97fGGs3QYwta3R4huo6Y=;
	b=DO1pgPYzx9JjkyBF2KlJUZYXA3zgaIpwYHkgNPAkEv1SxoIul/4jntwncf61nXm2mI4ocv
	W2TQfF9J/kOU0vL+IE4LVFMcjz6GltEWurBa2YSRveNUDp0ygc2H53V17a+VPGrLorck/a
	TLbj7AVY4s4nCN4Oott8Ek2TgdGu6mI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-mKnJdoVIMVmOq6K3P99Qbw-1; Wed, 28 May 2025 19:17:16 -0400
X-MC-Unique: mKnJdoVIMVmOq6K3P99Qbw-1
X-Mimecast-MFC-AGG-ID: mKnJdoVIMVmOq6K3P99Qbw_1748474236
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7caee988153so47483985a.1
        for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 16:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748474235; x=1749079035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSXeXdcmYX8Y9IqDmsh150V97fGGs3QYwta3R4huo6Y=;
        b=SFCiSWbc4ZUlmVdH4/VLFdu8Jae2wjE3Q5L1zSpQNXindAsaO0cILAwFMiaefQAjv8
         6Jt3hMtVAOGgBQpJUZe2saTX62iVRcTuw8zbyEftPLbL4UNDG/v1cmWpz12pUKZFqedE
         QBYbpLTOup+hyqBDjGHd0/WQ4R3Ubd2N/WOuGvGib9tU/si39NnNvDTWPqgz2HseeMhM
         4TXpQprp75GNRzUZjsFbvztPssI8Fh800aJ/lilnu12hnIcyDb/jbIU+7sSFcUEtkkdi
         e8jwy7vcb6NN1LjOpFqme1NIgHUAkkcaIaKozoGsyLfvJ+rq6CY5ROjsJYn9x7kOafYR
         eomw==
X-Gm-Message-State: AOJu0YxjqzPhYeiU5z9UPZqlmnWYLtJWDo1pWUnK8AblHbx7Pj34+dVU
	ti3X/7b6PpT0kbN1G9yracx7+RxQ0K9SHP5/AhA59S+rOHQ+3Si5bkcghg/ieHRCXM4xHICkZz0
	L4CYY++aTiX6Pqy6/61/RMyJNXASyZCP90gsTr5zOb/QLqEvQB9iINbyF4/ySh4xVzWv2AB8V
X-Gm-Gg: ASbGnctcz+718XvXPf/QfCy7lV/AwSG141kwEtC9ByqZou5nNrZwIipHOuLQZlE7yfo
	a/xsi+MmuYbKATvsq4tujT6uz6mljM1Zc0xcZ6lDhcH2M8pLcMlP6kRAk9MQCWrZALncklKhWU+
	o5PWyFTj3MYS+sn8Hjz79M25PT7KvQs1gDxI/ctZPuRctvNsFHoE9LDIEBtbXhl2HfEeLIjBt6T
	hHKdYDSB+Q4ySl31DnRwhiucfow5Ne9InE8f6r7U1awu5t6upn0tALXQDP/Y3H1JPWhHGdWryOY
	w+2fXcYdGWbR/3rxHyQWxx7kyI+AcXuJkyR2Hj3wfGWCdiWMiQ==
X-Received: by 2002:a05:620a:2952:b0:7ce:e010:88bb with SMTP id af79cd13be357-7cfc5d3bea0mr507364085a.22.1748474235684;
        Wed, 28 May 2025 16:17:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwSFnWl5GgnjJ75GC8RDyw54hsvTdQuK5+My1KQMmquMQoA9HIAqQOG1OmkXc2Hohx495R3w==
X-Received: by 2002:a05:620a:2952:b0:7ce:e010:88bb with SMTP id af79cd13be357-7cfc5d3bea0mr507361585a.22.1748474235375;
        Wed, 28 May 2025 16:17:15 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0f984fsm13437985a.43.2025.05.28.16.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:17:14 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 28 May 2025 19:16:49 -0400
Subject: [PATCH v2 03/10] clk: test: introduce a few specific rate
 constants for mock testing
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-clk-wip-v2-v2-3-0d2c2f220442@redhat.com>
References: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
In-Reply-To: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Alberto Ruiz <aruiz@redhat.com>, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748474226; l=996;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=XVNjQfh5u92+SvTEjJh8Vit7Er7I1Kh2/fKNBT5Mpa4=;
 b=oV+qwanIV17f+J9/DX6p4OuJe3bZHqW52YxbG0IgOyqpnclOSVy3avicQYBUBUGeO4QPJfXL8
 fV4UGR716N4BgJ4XutJRDCF91WKbsfUwWW3h15RWnLPGj9FnIBLMk/B
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

Some of the mock tests care about the relationship between two
different rates, and the specific numbers are important, such as for
mocking a divider.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index f08feeaa3750bc86859294650de298762dea690a..1b34d54ec9c610ffa3e91b06f5a5180e0395e26f 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -24,6 +24,10 @@ static const struct clk_ops empty_clk_ops = { };
 #define DUMMY_CLOCK_INIT_RATE	(42 * 1000 * 1000)
 #define DUMMY_CLOCK_RATE_1	(142 * 1000 * 1000)
 #define DUMMY_CLOCK_RATE_2	(242 * 1000 * 1000)
+#define DUMMY_CLOCK_RATE_6_MHZ	(6 * 1000 * 1000)
+#define DUMMY_CLOCK_RATE_16_MHZ	(16 * 1000 * 1000)
+#define DUMMY_CLOCK_RATE_24_MHZ	(24 * 1000 * 1000)
+#define DUMMY_CLOCK_RATE_48_MHZ	(48 * 1000 * 1000)
 
 struct clk_dummy_context {
 	struct clk_hw hw;

-- 
2.49.0

