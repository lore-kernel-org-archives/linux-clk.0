Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5216C223DE9
	for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 23:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748474247; cv=none; b=EINK6zh7WN226hFy8B9wg8rrwyxvH10dLFziBpcyzkJA5tULNbqK4zTfcFKew2Lwg+vOVWIQhkO67s6UQIhaHjpaoGmkPEFv0oBi0UYklL0F+PicoTadq932eUsJueurZ33n3zpbqH+2Q5BwnXMnn1my+n23CqKeDX6xcbdQBH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748474247; c=relaxed/simple;
	bh=R44qZbts0LnJEsYBeXkZ2b8yBCEdsXI7Jzk9afDBD5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VHkhKe/cFrjt8YH2VtE1KuVq4tT9y2I5lC2KSgaNI4X5+EkaEqIz0bty/aE4syFKHD5CzOGflPMAsRFKo80x1zSbWjsnMIMy7DWVttGieKXgGH5HJPyyi4lTcQauDyzjgLtiWzytevqPWnBWlsRLiVSgFQK8rzQixVF5gO4ZMEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UQ6QUjzB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UQ6QUjzB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748474245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DkwShw2YFHx+q0rk4/AnbBkoyjMYtZf7ATKTIzqBkFc=;
	b=UQ6QUjzBqlbLHYIo7CIpePaHJ64ceZZcGEcBjUNXWGaWMTra28IFFQn1wiNXulVEo24l8b
	FAauSJn91iYteQInWAli6kRtIi7AQvUdBJwGggPZixTT6tiAnaQwrmrC+bwaXlffQIb4Ak
	T14SHobmkgmDEowH5lRYNk98hqw/CG4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-fKwpNYWAP8WhtXK9-S7kzw-1; Wed, 28 May 2025 19:17:24 -0400
X-MC-Unique: fKwpNYWAP8WhtXK9-S7kzw-1
X-Mimecast-MFC-AGG-ID: fKwpNYWAP8WhtXK9-S7kzw_1748474244
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so55157185a.3
        for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 16:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748474243; x=1749079043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkwShw2YFHx+q0rk4/AnbBkoyjMYtZf7ATKTIzqBkFc=;
        b=hFB5gYuDQv81vSPx0HC7wfiuRJeRnUT4TbRYuAoaeXgzlq5qVieyS4RH66/R8864gs
         gMLcz6Y1pAfDoF/Jt15F0mliMd04LfnfA0VTd0g+i6Dz0dVinnp0TMtmIOFNPZpmBDfB
         0vYZnar8RC0y/HUtrL2OvOqwi40SYmPj6sY8XuTT01QQVDWL2JJmnV3ZxbImDqewI6VC
         oEnd/hcdgJvm5s2FChMeokF1yEYDQvRzYJjUxNFXl7ATdQzPKjJ9HOOU8tZfRT8+TPec
         4e7kMcArQ9i35G70Go6lHflJFilTek4rey9IEql1DEtiBw238F8IKwG8CXBfNWK5EYIS
         qKkQ==
X-Gm-Message-State: AOJu0Yzliz5xiOj8phLVM66ATQMx1Vwns0J4hKrQWXO6vOFawgkrdvPM
	lRRAotY90ZgL9zPYbctMk7qRm8n6C85G4MqeSYaVDUNwj6+GESsySujadJSnZwB9o65DRgxVI+1
	wEqyhmsAVwc5R9qaUbhSQI9QO/OJ+H/REuIiUPetBjeYjZAX94F1Vfs9PIFbOBw==
X-Gm-Gg: ASbGnctpaED/Xeg5I/J95PAjdlX28eDHrKmuNSvJrXTfGuq30XAFLskyTz6AMzZCjD5
	D9AZcrqgjfoUikCHAxteAxMmgFPwJEf7qLfw9mxF1eifTL3fHgLfF0mM6viSwJIBKVWgJl//bYT
	KA9SquId/kDuUhT8coZUhznUqC8w0IgqQ8TBvEIlhGz8JIwy80hjD4JFcBwB2JINHddq7SSPs9g
	MrqJBDXTLcv/1S391JnDyIT3piMa9lbw53i/RP+szrVhFb7qVPr/HnRHldARhn+QG4wRSofCqUe
	msHHp0r75XZofk4f+/EU0senu/w8+1RgpbJyBZWmAJpRxJ295Q==
X-Received: by 2002:a05:620a:248c:b0:7c5:b0b4:2cea with SMTP id af79cd13be357-7ceecc795d1mr2656317285a.38.1748474243707;
        Wed, 28 May 2025 16:17:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzNo/PxUI7q/a4rZlo97jbqBbarOKE+lWUJdu2PT6F4XfC+RujKLKzzmcT9PQT+47IsFtxAQ==
X-Received: by 2002:a05:620a:248c:b0:7c5:b0b4:2cea with SMTP id af79cd13be357-7ceecc795d1mr2656314785a.38.1748474243372;
        Wed, 28 May 2025 16:17:23 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0f984fsm13437985a.43.2025.05.28.16.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:17:21 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 28 May 2025 19:16:52 -0400
Subject: [PATCH v2 06/10] clk: test: introduce clk_dummy_gate for a mock
 gate
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-clk-wip-v2-v2-6-0d2c2f220442@redhat.com>
References: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
In-Reply-To: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Alberto Ruiz <aruiz@redhat.com>, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748474226; l=1455;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=R44qZbts0LnJEsYBeXkZ2b8yBCEdsXI7Jzk9afDBD5I=;
 b=1aW93G+xYXBDmW5rKsLzBIdn9Hc7/s6X6pjdmZB+RYCBfhSzCy+bVb4EsbQQS4QJSLLkBbA1x
 J0hIyINNOWcASooUS1MNhSKq0Fd2uoSkr3fuYjdJgXfvrsXkYJGzQ3p
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

This is used to mock up a gate in the clk kunit tests.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 35f516fd71a2e33ca19a0512bd2db02111ea644c..c2337527873d3241e7b0a38f67ecaa13535bcc71 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -181,6 +181,40 @@ static const struct clk_ops clk_dummy_div_ops = {
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
2.49.0

