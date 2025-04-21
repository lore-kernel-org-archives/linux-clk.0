Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628F42040B3
	for <linux-clk@vger.kernel.org>; Mon, 21 Apr 2025 07:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745220169; cv=none; b=hrFqQgQUwrbK02TMAt+4Y13kkqtBfXAmSFcFWyPfu1818f19+3Uin1xLYkJ4Ojun3pZu2OhOqLINIPqcsV0AhCdgIrOCj2EsgNCyvo4ua8qyd12wGPA4wUifPlrUm6ixd7qEh12N2/huVxdnJAHYNrjMGMfnat5IpnHtrfJdL+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745220169; c=relaxed/simple;
	bh=oQ/uumB9dZEnQv7fbXO+2/DavkdF+8BaxTejDAZiJqM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PRObkj0YjDoDhR7rkwK6a59g7Dpr451LbcqGUlykMlOFf05ui2ytJHM9H4DulErC+TMHs6ayMrsvFNnofYX4aueR08BZWVvLqga0iLO/lm9e8eIOM9PSFbYJAZwuogJrwXLG1WbPXdonkpx0qor6r6+/2vofIxYMRAkFEyLaIYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W1oWHbBG; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W1oWHbBG"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22409077c06so50622095ad.1
        for <linux-clk@vger.kernel.org>; Mon, 21 Apr 2025 00:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745220167; x=1745824967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Br+IpXn10n+9CXIhhXnelWYoEuJ5Sc8cDeYzc7Zl6Z4=;
        b=W1oWHbBGZ1ci59ZKo3ZlzpDDcDPhIvu/tUtzfp0L4G8paC2KTxNZ9ytj7DaB37vcBK
         bfMLMPRmwcVPPW9w1qqwp568mxAEEVvuLTcPclAbQCooICZsE3I1KYuzT4lcNrKbkA9K
         IRRek8cZQntTadSe9aMeDkvUPzf/Lbk91ZbbNnAij1Wg+gxMAoO7JmRSTSQnaHFuT+dO
         1UPOk4/ABwf5iBW1PiUTz7od0NJNAMS+rpPUZukZ97ZwFzprkJghCaj86hE9xD6NdUGR
         Eb2fKUiaLioiFlhc0f0Mgcr63vuP7oodrHwhwrs9/sARCIaBstVEHEJHKhwQ5whFM3qf
         kDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745220167; x=1745824967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Br+IpXn10n+9CXIhhXnelWYoEuJ5Sc8cDeYzc7Zl6Z4=;
        b=AkisHQaPG8xqkkP8aWXdqFJ4q7EGKxV+4xOZYkwP/oytzCYLATx7cMeaHyUGxlCNOK
         P96PpuwK4kiV0yOhXE+qcasnIw9DSrmMBmh2NJIzuN2szm9Oh5m0dvejS20GZ1hSv59T
         /iGsjA3DvmfVKMbwRkd1Dh6Z95x+nIJLkJMk69qVTzD9KVtIKLm1nXKf2MfcoUcFqni5
         1AF9Ph06+FTXWypms7b9cefydkLIa0H6PTVB8PgRlFLX3atmaCYQKYm9TetDMoy/T36V
         7WlomlkNMBEuHB/AePIZGMATuDdmESeYJ0AbAQwm3/WB2K++k+QIgAW3u6SvWcJn7jYI
         XXaw==
X-Forwarded-Encrypted: i=1; AJvYcCUWBXkxt3AYKfa0r6ZCASaVBo4dvCA/QMXnxVre0YjtZxYZu9QaEKnilb4tDQtkGhTyR8WsKl+Pv7w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0BS0WCuusl+nWcMG69rEGrHGV7hxS75GToz4rcSP22miuuW6p
	+EmEX11w4m85m3rSsoTdRV7mGUQcuGWC9FpAb1reVZFoMr0HsLSzZ5+HvT9lj/w=
X-Gm-Gg: ASbGnctaCbe5sPyXENO87FNH6BbwcyHqmHO7JF/Tj9FXhgibYwArkw1HSn9/iDntW19
	Ym2uqwZ1zuCq2NsZd0Jfxb1XqrNx8Z6QZ56/IuCI/LvLb32GUuxAG9xNrslMZnxHRF301Pu4Z5W
	IydRo5ZKOb9u3j7FnDtjSAFGkAjNUlfPvRi5DVpleLKAw7ajpxog+tVt2S8F4J+lc7VrMUY4aqh
	zwNgJ4c1+YlL7CGZ7zzib/bhkLtgiYqeJ0Gl7Obw4ftHhPOguBJVGR8GbkPCxpDH+7Fjl3vlGfl
	OFxMR6UiEDEG77QGoqFv2bDz3Q2HricRopiO4YujXg==
X-Google-Smtp-Source: AGHT+IF3+oCxTMMz+R3DrRhQUE2THmmZKmnz5F87I0hadILJtWNneQEBdeLOmXBL2HrlyI2RGFtiQQ==
X-Received: by 2002:a17:902:ecc8:b0:224:2717:7993 with SMTP id d9443c01a7336-22c5362062amr153799585ad.45.1745220167576;
        Mon, 21 Apr 2025 00:22:47 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb48a4sm59089785ad.133.2025.04.21.00.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 00:22:47 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Yury Norov <yury.norov@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V11 01/15] rust: cpumask: Add few more helpers
Date: Mon, 21 Apr 2025 12:52:08 +0530
Message-Id: <944ee57ad1b190f6975c739802b4d93166bd00c5.1745218975.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1745218975.git.viresh.kumar@linaro.org>
References: <cover.1745218975.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add few more cpumask helpers that are required by the Rust abstraction.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 rust/helpers/cpumask.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/rust/helpers/cpumask.c b/rust/helpers/cpumask.c
index 2d380a86c34a..eb10598a0242 100644
--- a/rust/helpers/cpumask.c
+++ b/rust/helpers/cpumask.c
@@ -7,16 +7,41 @@ void rust_helper_cpumask_set_cpu(unsigned int cpu, struct cpumask *dstp)
 	cpumask_set_cpu(cpu, dstp);
 }
 
+void rust_helper___cpumask_set_cpu(unsigned int cpu, struct cpumask *dstp)
+{
+	__cpumask_set_cpu(cpu, dstp);
+}
+
 void rust_helper_cpumask_clear_cpu(int cpu, struct cpumask *dstp)
 {
 	cpumask_clear_cpu(cpu, dstp);
 }
 
+void rust_helper___cpumask_clear_cpu(int cpu, struct cpumask *dstp)
+{
+	__cpumask_clear_cpu(cpu, dstp);
+}
+
+bool rust_helper_cpumask_test_cpu(int cpu, struct cpumask *srcp)
+{
+	return cpumask_test_cpu(cpu, srcp);
+}
+
 void rust_helper_cpumask_setall(struct cpumask *dstp)
 {
 	cpumask_setall(dstp);
 }
 
+bool rust_helper_cpumask_empty(struct cpumask *srcp)
+{
+	return cpumask_empty(srcp);
+}
+
+bool rust_helper_cpumask_full(struct cpumask *srcp)
+{
+	return cpumask_full(srcp);
+}
+
 unsigned int rust_helper_cpumask_weight(struct cpumask *srcp)
 {
 	return cpumask_weight(srcp);
-- 
2.31.1.272.g89b43f80a514

