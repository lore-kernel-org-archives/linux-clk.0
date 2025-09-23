Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B8624679A
	for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 14:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638397; cv=none; b=CA4izYEFrfgkByzXvP0Ph+0mkhNdKRk3Z1ZMeDX5ARvc9t8x2vcco6A26mAqFHLsYqoS/2V/3GE1HzVw0Zt7vV7dV+3FHP/GY7DKfPv5M6fuiR5AXL/Joitqr7mJ0ypptet/G5DkMQkWuUI742YUoRNNQ0J9zS/YPU5FjmhVVmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638397; c=relaxed/simple;
	bh=ifOqpq6EI5oUKKyRISwbxG5xRCmiQg5s1ikEzZQUYQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EOp13TLD8mA58AgXTgzdBVHWcRkHz7AEVejWOCnAWkX7xlr/oFaw0JVZluzjgzFsHa0NhJa/ey4cyq3poSTAxacwhQ5gbmG1YY2HjoOw5NXViCI5edwsWX3884cFC3haFN5iPIo7WxigBPCkOnvcm4HN2Bt6kc110/96Oza9O8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fMrZy223; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fMrZy223"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758638394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pSSrqefXj8F1pFE7kwL8lKNSLHc0UQvp/2g3qfW9jDk=;
	b=fMrZy2232IukmdHqpK6jAa0jncEUUctbBlD+MUrJbfx3Z7SCF/ueBMcI0dc/Dm8Nwl4nwC
	B3YdTFezd+R+V8CtIGON/XgNJ+vJiNgGKYnBMvvDwTaLw1BcZ0T4sNu+DUYQTrhnB+zNok
	JuGMk6orsCmgsAsm1a2hsaTChxNZzsk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-T9UCQK1nMJanE8mnKVSVhw-1; Tue, 23 Sep 2025 10:39:53 -0400
X-MC-Unique: T9UCQK1nMJanE8mnKVSVhw-1
X-Mimecast-MFC-AGG-ID: T9UCQK1nMJanE8mnKVSVhw_1758638392
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-81b8e3e29edso961773085a.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 07:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638392; x=1759243192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pSSrqefXj8F1pFE7kwL8lKNSLHc0UQvp/2g3qfW9jDk=;
        b=Ru7Bo+1tgVsquykOvyYw9pDN7VDaPbzCgwLX4rstBN6T9FnQisdz9zdwWX4U1KWPJP
         mrOXl5snGIRF0c0AQU3kVJfKyL6C8gVfZ2PG5HX3mQMwjrACDN5DfaTbf9w64lrulN/y
         zjlVqMN5iJ0hO2QpqRL7vNo+gM+t1QNBqMDBKllptYHkPuiHwoJysmKZ6us5xRvH8QwX
         kpJrnbbeZOwWC7vNcEb0PqUSpMFYYPBGZPh1MPbwcbUf7VeGBhzmTPtw49CwzI7m9QGj
         uu//fbRH+OPbtv7Q+cVTP/uqdTv6DNqlhqr2YE7gBxHFrMseQ89KtVXM7/wncAmYt65i
         iTkA==
X-Gm-Message-State: AOJu0YxHrQydiwnQT1ibwFovrTN8lNaN9ETMFShKM0unLyuqf7U3jPSQ
	Cqy8jxELAQcyHfamfYGES1d7OW3hDLbIKHSJysMYW40c9PLJVTQS3qis6mBBIbcjL6UOvxSdnnI
	6mFKYhWXdnkFaJaVSRMVXo3baZw8kknLOOVJYmSQMsnFhpL0QE/5WpRu+PqhInQ==
X-Gm-Gg: ASbGncsnFujtB973cNBrVjMd/0c9ar82Y3bgNkf6c4alYjURD2RiqG1pcLxLmwWMegm
	dGyYdqHbTt+gA5N0hz6CL0kkFw0jORQ91tdXn6Q6yOJro51B7gtVx9U7x8jD7S8MJEO0r43aWvZ
	735Hrs3+CmgmHqY/P+57UMZrQzNQ5oLCE9QaVpRdEe4U4hTjVeAWgYxO46rT32LmbOmhYxHS0/j
	J0CtXO24QnG6hCnmFecZUNn8bGtwRNNYgT2HZKVX3LLEzm8LnqJUxszScvBaKUxgBtS7EkPFXNw
	PefrWf7rMZA78vSNG3LS5zFsncq0eI+SFv4i9KrpYO+jTA98W+9+Vo9S1nfvi6N90NsI5lskOmv
	e6xfbw5tobSrDFG00r/PWzKq81k1+fkPaSLKW3OU=
X-Received: by 2002:a05:620a:bd4:b0:84d:5320:287d with SMTP id af79cd13be357-8516fb9021amr294261785a.34.1758638392283;
        Tue, 23 Sep 2025 07:39:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKBUZpAD3XPLNDp4LkeiD173qMrCb+kitUiyWzyeQr+nw9KW/OanK+ID3iaqXtbBXsBu95YQ==
X-Received: by 2002:a05:620a:bd4:b0:84d:5320:287d with SMTP id af79cd13be357-8516fb9021amr294256985a.34.1758638391633;
        Tue, 23 Sep 2025 07:39:51 -0700 (PDT)
Received: from [10.175.117.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-84f2f6f3c25sm230272985a.49.2025.09.23.07.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:39:51 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 23 Sep 2025 10:39:20 -0400
Subject: [PATCH RFC v4 01/12] clk: add kernel docs for struct clk_core
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-clk-tests-docs-v4-1-9205cb3d3cba@redhat.com>
References: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
In-Reply-To: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4554; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=ifOqpq6EI5oUKKyRISwbxG5xRCmiQg5s1ikEzZQUYQ0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIubdRLzFhYrFgxd9+rLaksV/NSTSxflO5nTtuR8Kr0y
 X6vdw/lO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZiIVR/DP62oW8vcIjxeCbEE
 Vjy8V5daO3HbGsEHUn5GP7geMpXlfGf4p71hXdWcU3feNPyaHqX5Z9Onpy9vxdz8L7TI5bdM6Jw
 5E3gA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Document all of the members of struct clk_core.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index b821b2cdb155331c85fafbd2fac8ab3703a08e4d..018dd5a32ecbf166718da3eda851f51fdfdd2088 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -57,6 +57,64 @@ struct clk_parent_map {
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
+ * @new_parent_index:  Index of the new parent during parent change. This is
+ *                     also used when a clk's rate is changed.
+ * @rate:              Current clock rate (Hz). This is effectively a cached
+ *                     value of what the hardware has been programmed with. It's
+ *                     initialized by reading the value at boot time, and will
+ *                     be updated every time an operation affects the rate.
+ *                     Clocks with the CLK_GET_RATE_NOCACHE flag should not use
+ *                     this value, as its rate is expected to change behind the
+ *                     kernel's back (because the firmware might change it, for
+ *                     example). Also, if the clock is orphan, it's set to 0
+ *                     and updated when (and if) its parent is later loaded, so
+ *                     its content is only ever valid if clk_core->orphan is
+ *                     false.
+ * @req_rate:          The last rate requested by a call to clk_set_rate. It's
+ *                     initialized to clk_core->rate. It's also updated to
+ *                     clk_core->rate every time the clock is reparented, and
+ *                     when we're doing the orphan -> !orphan transition.
+ * @new_rate:          New rate to be set during a rate change operation.
+ * @new_parent:        Pointer to new parent during parent change. This is also
+ *                     used when a clk's rate is changed.
+ * @new_child:         Pointer to new child during reparenting. This is also
+ *                     used when a clk's rate is changed.
+ * @flags:             Clock property and capability flags.
+ * @orphan:            True if this clk is currently orphaned.
+ * @rpm_enabled:       True if runtime power management is enabled for this clk.
+ * @enable_count:      Reference count of enables.
+ * @prepare_count:     Reference count of prepares.
+ * @protect_count:     Protection reference count against disable.
+ * @min_rate:          Minimum supported clock rate (Hz).
+ * @max_rate:          Maximum supported clock rate (Hz).
+ * @accuracy:          Accuracy of the clock rate (parts per billion).
+ * @phase:             Current phase (degrees).
+ * @duty:              Current duty cycle configuration (percent).
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
2.51.0

