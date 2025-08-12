Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32032F5322
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 14:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755009667; cv=none; b=EvwEiGurkIDv6wfprDZa6AmQo7LIUwOKqvHsTRnLk9T+sSK8z7QxY+FOF34Akn21tHl2c9PTgCsfqScxJX+BqXjcF85sHffBgeYRersfMo45tFG5c9jLqXV1cBtd6N4mn4sg7wp8tfRz972LMsbNSjR6PskcrylK/Lczed9HWMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755009667; c=relaxed/simple;
	bh=MFLVZ+yeJ3JAQq9jIrj7tqI1NByGzFkDdqRG5Pz4Yng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S4c40Km2BBy05z+JMvR1B6VJRhoKHtob27hrGSzrsBGhYQtcE7IT7zvftOa5vs30N7+3iLKUnn1wYYVVihsrPV5EpnvHdjw229Pijj7OngwIO0gENYbqQi61rnvD+JG1POqMjbcX5CDeG7N9sx3LwyIsuwdfOhRusq8JC+UkUGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g9c21hVu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g9c21hVu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755009664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/wE6NHRrDkQn4sVKYNdpJhFrtlcFNAwhtQnV3IlAyyI=;
	b=g9c21hVuoE5T43kzMLm5eQ4Wriizn5BWiN97vzTGC0a/xP4RDGJJ4dLVnCIWVt8DKBpYyb
	RifNlDzyGhGvdn2Ljr9k4q1eS4CqArgWFhWlfaqOMCHPzoibf+/n+meJZBFxkZJob00Ds2
	99VVihNsgQWQYtcEDsjm7mGFt6bM9Bg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-N4YDlX2iN5idFEMCEzkiqw-1; Tue, 12 Aug 2025 10:41:03 -0400
X-MC-Unique: N4YDlX2iN5idFEMCEzkiqw-1
X-Mimecast-MFC-AGG-ID: N4YDlX2iN5idFEMCEzkiqw_1755009663
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b0680f6270so136741701cf.3
        for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 07:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755009663; x=1755614463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wE6NHRrDkQn4sVKYNdpJhFrtlcFNAwhtQnV3IlAyyI=;
        b=iT9UYAlyL37K7T054gQg0nhkUaziWokcrlmk+nS2GBfcHPZMitJ7j3pGHIRvYdtlgk
         1zAL79Dht6dqrb1oib6/wUhTZ6GHbmONZKxKQw+VHCvjG4Siua965MwKxkC9nQbN39Nn
         N5tL4q2JEWanmzkpZqzAsBWGUbjAFaaGy8tkXiePRY3HjEzc9+gJcsdGNvMX8jXI4AaO
         HcA51GzneMRQbWyxex7gwZd5L2ya4v5FerXe9Rdm2pyHNMbEsVisPxr8v9ag6KcixFFN
         cWEi0kzwJUbQErpKzB+sHzDXjtpZtfd1agxehZeQ+OPjeBuF2ICCz+ILos8FTHly1DV2
         O2Aw==
X-Gm-Message-State: AOJu0Yyhlq3k2Kt/XXA2c8dB5DlY65DvlAp3YMEJQEPkUAdCESDz2tN/
	7ZXHey63/Z5w2kG9cEi0NocQYfKUhK9xG0aUp8Ws1pIe1cUXonT7Qo2R7jQiEYFNQaKedCJ7533
	XNqpJffhuHy7vZEi70zLIlifgNsV1aTFnxuKgoylIYbCnj/NOJ4vevPE+6D+l3w==
X-Gm-Gg: ASbGncuFEw92gj6lU+RFPSAoun9vPsjbVy4WtQfKZJxLfUinjpupxSeiOreUCgIkm09
	whppNmgpb6H06Bwc6l982UPgt6MZ9VykgdD2wTf6o3nV6y5+HC4s82hxfAA5pkyTUER40ZciMQo
	STgmzjF05JgBGLEpvzShlIt83onxsC7GDzJQM8pUJs1wd2XGl4jOOc9zyfXcMrCiZUXWzbstZO/
	CZLlVR6FK8X/QLYW0hgS5C7WVWPxGYCwkwe5Syun4zPRCrDsecWvi4vuNsVl+VunkhudQqkWVIf
	3T4Yi2uCzq9Dy9jgwTHidg5ldhIFIXN0fnbsUzWXoSTrsCyJ8a3rchXbFV1rupnvQAAfR1NrcsB
	IWw==
X-Received: by 2002:a05:622a:1a10:b0:4b0:6614:c9be with SMTP id d75a77b69052e-4b0aec6ef7fmr226999041cf.13.1755009662549;
        Tue, 12 Aug 2025 07:41:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPhFWqsHYdye4fhYgxU7Z/OBL4dYd4TfOrpBNX+RzTHcwwigU+evSDB6boon7iaBHTtU6/RA==
X-Received: by 2002:a05:622a:1a10:b0:4b0:6614:c9be with SMTP id d75a77b69052e-4b0aec6ef7fmr226998471cf.13.1755009661921;
        Tue, 12 Aug 2025 07:41:01 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0aa1efe78sm76186821cf.8.2025.08.12.07.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 07:41:00 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 12 Aug 2025 10:40:35 -0400
Subject: [PATCH v3 5/9] clk: test: introduce clk_dummy_gate for a mock gate
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-clk-tests-docs-v3-5-054aed58dcd3@redhat.com>
References: <20250812-clk-tests-docs-v3-0-054aed58dcd3@redhat.com>
In-Reply-To: <20250812-clk-tests-docs-v3-0-054aed58dcd3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755009649; l=1504;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=MFLVZ+yeJ3JAQq9jIrj7tqI1NByGzFkDdqRG5Pz4Yng=;
 b=gdadZaM7KZ2cp6knrICzyw3XBzm3p2TfaqPaFy1xwzCTRQTXMLfKFoR74lWGK8lkiUEjPJszt
 LgZM09eso3gAS9UCCtZKczcQ4WLmN7oZam75+gDfyVIROoL1wBSstjb
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

This is used to mock up a gate in the clk kunit tests.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 81095fd80b270c1fd5e73e90a2f36da0071d10a4..9ed887551cd9b4926075d85b30b6cdfc8d307ea6 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -179,6 +179,40 @@ static const struct clk_ops clk_dummy_div_ops = {
 	.set_rate = clk_dummy_div_set_rate,
 };
 
+struct clk_dummy_gate {
+	struct clk_hw hw;
+	bool enabled;
+};
+
+static int clk_dummy_gate_enable(struct clk_hw *hw)
+{
+	struct clk_dummy_gate *gate = container_of(hw, struct clk_dummy_gate, hw);
+
+	gate->enabled = true;
+
+	return 0;
+}
+
+static void clk_dummy_gate_disable(struct clk_hw *hw)
+{
+	struct clk_dummy_gate *gate = container_of(hw, struct clk_dummy_gate, hw);
+
+	gate->enabled = false;
+}
+
+static int clk_dummy_gate_is_enabled(struct clk_hw *hw)
+{
+	struct clk_dummy_gate *gate = container_of(hw, struct clk_dummy_gate, hw);
+
+	return gate->enabled;
+}
+
+static const struct clk_ops clk_dummy_gate_ops = {
+	.enable = clk_dummy_gate_enable,
+	.disable = clk_dummy_gate_disable,
+	.is_enabled = clk_dummy_gate_is_enabled,
+};
+
 struct clk_multiple_parent_ctx {
 	struct clk_dummy_context parents_ctx[2];
 	struct clk_hw hw;

-- 
2.50.1

