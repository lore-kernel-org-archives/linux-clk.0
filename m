Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F877F7FC
	for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 23:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748474235; cv=none; b=Ti1azTRrpE46zjEm2gHrIfieh+iMZ7prDLcyeqH4mABV/4TPzGNeDiHkMYfL+fiWhp2etsv7GRfH/NiF2dL4NwZlxFLo1sZ1DrQt7ifkdpns3i9cAD/VlF6USBqVo5zk37LGBesV2lgg0jEQvK562m816jYfvtHTiB2c1H9blfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748474235; c=relaxed/simple;
	bh=ccvc0hhbSgWY4GmJLHg7B4WAjq9gbICcuSkXsBTsGy4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y5kcwMKzPxgLlIPlpI46bI82lNjwBkwFVdsZkPj6lsqyzwpDQvEmmOicYrU/+Eped2O+SGpzrr73URuozy1+rzjp8o+cduNOi4xnX9VXN2c3SWl+3KTf2fpSjYYzxeIVx3OpzdtKOPP1q4oTPqXDsZHM4z60s5TCMK8rWA7t0Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GCAlyttM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GCAlyttM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748474233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PY+mAfokPX43RyMwVm9mydaLHH0tgHSo3DseyvVhR0o=;
	b=GCAlyttMlZoGT91oSeoKqtmO7H/SIjReTSx1xjyKNEhq2joSq68aLA5+CcXYfaz6vqs04s
	gjubsY1T730+PyFWlr4NkUVSnlSoXY6BtYUbOPjAMeCdy630SeX+efmmV1Hj9wcZaikS9L
	kMNfX+LhoZDtRWjZLA9TfiZOjA8OAgM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-mjrOs7_1Mc6Tux4aBvGlbA-1; Wed, 28 May 2025 19:17:11 -0400
X-MC-Unique: mjrOs7_1Mc6Tux4aBvGlbA-1
X-Mimecast-MFC-AGG-ID: mjrOs7_1Mc6Tux4aBvGlbA_1748474231
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47693206f16so6697471cf.1
        for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 16:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748474231; x=1749079031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PY+mAfokPX43RyMwVm9mydaLHH0tgHSo3DseyvVhR0o=;
        b=RnzcTcl8TURAEZekJrOvQB9DTJOBhBOAjAXDT3jG63tuDEE0MfQ6kDPHvwKtvGKroO
         TXa61PiuMcQpXaSVexHQ/XEOiG2sbiYKDuYVvy8xi0VKCSztjbcZ6fPkVeJodvIkHrfV
         7mienFxGSM/0FlbJsn3rXiTIj/6DV6He77Q7J7s0edCzoKOEHtZ8c/8WAp/Af6CkuJCB
         NnEzRbeffZpD98TXusuvNV1jK7W5ZboVkl9MU6nsH0Q0pqFBojR/L1iTGLxSqlmvjTe4
         7mfGoCxwD2PJ/0ogKbmikuOQyr8TNNutuFst10wB0+4Xyh6GLjGG8dmMx8Gz/qyLT67G
         sLzw==
X-Gm-Message-State: AOJu0Yy4dYI/oESk1XsXmxPTgVnyVTCukWkC9H7W7oBuhO00KNtfW39l
	2G9+uKxzKrdUeAh92Nqf8YHZTwNWao9nzNr9l8YF9ucTxeFIk54nda3BnKWAiE3mZ3huyFZBf56
	YxLE35jukwXZX+xeyPu4Tyb4lxqK/plXoxXSy8E1nmzm+3RoiJqWNliHWBfoBmQ==
X-Gm-Gg: ASbGncvfhw19WsVrlJ4FKp7cIPdcQ9FO4uIKgfqsM/LIX6Lj1HUiIfD+QeXvTM5zzal
	ZWs1QtzVG1TBcfTBWo7cttrOeyuZNYeTgobBmvfWsjzPYNXe/iWk59MiYo7kMruVUWqigp+glx7
	SLnuo+5SYtUOTQKhHXs5ZDvmBphSHMA5HuUzzZc9ayI7gy4F02ELPOgxAjSvkjX2G5B2cgkTE8q
	Pn433BGlK2X5zkxux2AquuRctx/13JKJiQUgk/603HHP26VehcJY2skjl4aNuVAjO/U1Ok9hXjv
	n2hgQAOU1GJCWr6pDt4f3jF0Ll5aPouMy/osUOBCVs75WZd2Ng==
X-Received: by 2002:ac8:6f0f:0:b0:4a4:2c92:27e3 with SMTP id d75a77b69052e-4a42c922ab7mr60396071cf.34.1748474231225;
        Wed, 28 May 2025 16:17:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCeNM3Bj9nbqayT5oae0cCP00gch/AY0ajbgyiXPfwaajpbP5YKsDrcNpWKfpD5pJu2gx9Jg==
X-Received: by 2002:ac8:6f0f:0:b0:4a4:2c92:27e3 with SMTP id d75a77b69052e-4a42c922ab7mr60395771cf.34.1748474230876;
        Wed, 28 May 2025 16:17:10 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0f984fsm13437985a.43.2025.05.28.16.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:17:09 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 28 May 2025 19:16:47 -0400
Subject: [PATCH v2 01/10] clk: add kernel docs for struct clk_core
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-clk-wip-v2-v2-1-0d2c2f220442@redhat.com>
References: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
In-Reply-To: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Alberto Ruiz <aruiz@redhat.com>, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748474226; l=3224;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=ccvc0hhbSgWY4GmJLHg7B4WAjq9gbICcuSkXsBTsGy4=;
 b=4HFuNr0KN0TtNnsFn27cZXoLo5n0gd64dH6POJAJfBz7XiuZ12lSLLq1YQ6SyLrA+ClPNKZx8
 bhTJNhT2gFHDcGi6pn/jMhdHIoyxPccAjyxy1iaYYwFoOuJu/KoBi6X
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

Document all of the members of struct clk_core.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0565c87656cf5c557d8259c71b5d2971a7ac87e8..a130eac9072dc7e71f840a0edf51c368650f8386 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -57,6 +57,48 @@ struct clk_parent_map {
 	int			index;
 };
 
+/**
+ * struct clk_core - This structure represents the internal state of a clk
+ * within the kernel's clock tree. Drivers do not interact with this structure
+ * directly. The clk_core is manipulated by the framework to manage clock
+ * operations, parent/child relationships, rate, and other properties.
+ *
+ * @name:              Unique name of the clk for identification.
+ * @ops:               Pointer to hardware-specific operations for this clk.
+ * @hw:                Pointer for traversing from a struct clk to its
+ *                     corresponding hardware-specific structure.
+ * @owner:             Kernel module owning this clk (for reference counting).
+ * @dev:               Device associated with this clk (optional)
+ * @rpm_node:          Node for runtime power management list management.
+ * @of_node:           Device tree node associated with this clk (if applicable)
+ * @parent:            Pointer to the current parent in the clock tree.
+ * @parents:           Array of possible parents (for muxes/selectable parents).
+ * @num_parents:       Number of possible parents
+ * @new_parent_index:  Index of the new parent during parent change.
+ * @rate:              Current clock rate (Hz).
+ * @req_rate:          Requested clock rate (Hz).
+ * @new_rate:          New rate to be set during a rate change operation.
+ * @new_parent:        Pointer to new parent during parent change.
+ * @new_child:         Pointer to new child during reparenting.
+ * @flags:             Clock property and capability flags.
+ * @orphan:            True if this clk is currently orphaned.
+ * @rpm_enabled:       True if runtime power management is enabled for this clk.
+ * @enable_count:      Reference count of enables.
+ * @prepare_count:     Reference count of prepares.
+ * @protect_count:     Protection reference count against disable.
+ * @min_rate:          Minimum supported clock rate (Hz).
+ * @max_rate:          Maximum supported clock rate (Hz).
+ * @accuracy:          Accuracy of the clock rate (Hz).
+ * @phase:             Current phase (degrees or hardware-specific units).
+ * @duty:              Current duty cycle configuration.
+ * @children:          All of the children of this clk.
+ * @child_node:        Node for linking as a child in the parent's list.
+ * @clks:              All of the clk consumers registered.
+ * @notifier_count:    Number of notifiers registered for this clk.
+ * @dentry:            DebugFS entry for this clk.
+ * @debug_node:        DebugFS node for this clk.
+ * @ref:               Reference count for structure lifetime management.
+ */
 struct clk_core {
 	const char		*name;
 	const struct clk_ops	*ops;

-- 
2.49.0

