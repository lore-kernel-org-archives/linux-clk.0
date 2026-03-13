Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6918B3C65FE
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 16:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773420248; cv=none; b=baD/ld95GJyDSXUVViGfoIi+PvSci3Gad77vqC7Ek5C20jgXpEJLxS0h0BzfLYSb/VMpKIh5uiZyaAcJHBqEvH1zbuJJ4sKOJBMeoFJd+0fww3yOmt42DVuWlql5S7fCJ+cAV0BpejfOkrB1ILBqxoMZsUE92EwSoyiCMvSR4wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773420248; c=relaxed/simple;
	bh=7MaJmt+J8vsEg1l63G/wlfY1QJg69trFaQ3v7+1mC38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I5cLgHQnEDCSkQs4qM20b7NonognDyn3N7yv0YIbRbLbRWZcFzDonw/XSYD531VqRKVrDvWYccAVjg7DNcjAP57efrJi9rcK2hH6tznML4QIbPQ+9Jhd52SI1DjmDxzjg+HIiGLrHWCshtAFnUz41ZK9oJd8XF1jQgfd9xev33U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JiakUt8T; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=i4xBUHt+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JiakUt8T";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="i4xBUHt+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773420246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bax8hgFhPtnOfYoq3Khs9YZNS/fmFeyi7E52H3ZxM4M=;
	b=JiakUt8TDyEA8l10a6ZPIzJo65GtfRpeKxoeEm5AX3Pn0Nlr2KAO+F9Pb2IaV9wL0aVOkz
	UYXUew02B5q5sJ37HLuOACYGoauJDf4fErJIrqPtqAouBH1vkfak/gPSQ+2GlZVn8YpUh7
	Mk4bLvxjbEBcKM27yraw+zl5NX3XCzI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-jPe2mG5fPeiHEeUDEhpKMw-1; Fri, 13 Mar 2026 12:44:05 -0400
X-MC-Unique: jPe2mG5fPeiHEeUDEhpKMw-1
X-Mimecast-MFC-AGG-ID: jPe2mG5fPeiHEeUDEhpKMw_1773420244
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd83cfb36cso1598326985a.3
        for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 09:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773420244; x=1774025044; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bax8hgFhPtnOfYoq3Khs9YZNS/fmFeyi7E52H3ZxM4M=;
        b=i4xBUHt+bFu8zoCsCq57nHoBWE/TOc0tC2fddcpHKogTlEAaxnoBUuT4F2fEawKRbI
         GWd1Ocmy1Ps2ShgFstK1cgZ7nkl46jJQots42MEy72gDFTjo3MtrNLTBv2t3+Xui6t++
         GxK+wBRCRMWTxXQnAyURXp7T0uLwhxV4U5djGu+jfnPxE2VEEAqSL1RqYbDFZp/vOhF7
         PdEupqtfeOqmtolQJHJnX9K/8ic1dDWXmUfNgfJPHPaj62jU3/miV5EOiLl6WhGbMUZe
         Z3Wn9Qz0eSDDgfVYsVYbAk0bppGwi2mvP7Ilyd6Zv0WrBa8/HeytzxVFaFbQ+gh8gWFK
         e/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773420244; x=1774025044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bax8hgFhPtnOfYoq3Khs9YZNS/fmFeyi7E52H3ZxM4M=;
        b=ZiExUs8z5yal8e7sKMEKLdrsG7fl2HRJRm1mKULLOCBI5u/q9aiu0s/Zc+J6vhkvs+
         tiGT3ggV6UB2634d3EKgqrHAOIqLngg7I8saYvxXK4HNlTqx0du0jZ84APaqrXvA4dAr
         VKj4vuQUBgjEXAp7SB2w5obppqhdby/BLDDQEqGTSZw6VB4URsk4nCDYwjYdjWpaQDai
         s9wd5PcTOqbYPWQwNh8waEMoLqKabz0yWgEv2K5MrEL8r3Q41aK9gUDRLaW9L2+7ZoBZ
         DMH3aELqa6yzNgbOet6oir/+TZap+NJUMX11q49c8vSuxrvY9iE1YDHvTRSm2lVZh7OQ
         gTvQ==
X-Gm-Message-State: AOJu0YzfvD9080PdimqYjHY80KX4m4mhmh3By2uNUL1O48K5a5mNbb7c
	DoCSqWQ4QNVb8LBKgCAZt6hCkVmFy+14DlaKMKrqkZCo4r8VNZSzH1ruth4QiNaQMAXLyfFLx7Y
	zNOu6ijcSOGmD5782ORNr/MbJKgZeyvp6w4/Bm6Y/kzlM2egeM/MkOnln7fb5mA==
X-Gm-Gg: ATEYQzw8C4qXjfLSKftP5vUeEO9VpW/dNj4mnVd9CZG8aypzFvp66VAuo2ceD5Tcy/2
	/dYzd3P4NiqYmXUcuO9zHJolXf1N9/2NIPDOXzWABxV2qdle3vaZtQpp3cFph0YZmCFR0AdkMg6
	JOhl+xfpbw+61pwKfHxf1qcHWH96PIJ7B4Lr+fhdDGLocUHQ70nr+Q4YfHwXA9PyyhZZIZ71cYK
	Wpne+5Gfi5kLWgytMsCtxK0OlUMCNfgHeEExf4hUUxbLgOYP5J0KZ1u7m5s4NxFdhmySCVTd0Sy
	N7pAbZbI0z9NfA8Wyx7Fqs86PW1QT4jr/yOv4r6Gb0AlF3u9AuzY61wpC+dCHrdhoOpkQN5gEdj
	uF5W9SRtlzLWAfN1dPcP7T7Sttavt635c8LOzc0h/4pUZ/PgDyk68yR4c/fmz
X-Received: by 2002:a05:620a:711a:b0:8cd:9033:1724 with SMTP id af79cd13be357-8cdb5a402a9mr534035185a.9.1773420244564;
        Fri, 13 Mar 2026 09:44:04 -0700 (PDT)
X-Received: by 2002:a05:620a:711a:b0:8cd:9033:1724 with SMTP id af79cd13be357-8cdb5a402a9mr534030685a.9.1773420244072;
        Fri, 13 Mar 2026 09:44:04 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda215c2a9sm587964785a.46.2026.03.13.09.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:44:03 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 13 Mar 2026 12:43:08 -0400
Subject: [PATCH v6 1/7] clk: test: introduce clk_dummy_div for a mock
 divider
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-clk-scaling-v6-1-ce89968c5247@redhat.com>
References: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
In-Reply-To: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Alberto Ruiz <aruiz@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2200; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=7MaJmt+J8vsEg1l63G/wlfY1QJg69trFaQ3v7+1mC38=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDK32B0+FO/OJdn57smPZpMZMrFPtR2Sle8ed7s0Y+qNo
 uPL5y3X6ChlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiIl4Mf2Ui5Zns/+VPmLev
 pv/NPoe6OreHtYJZWpZs+7LzShu72RkZNr02bvmfxL7l+aqSB6qf51zZOe//Ge5Z7GcmXej+HmW
 ZyggA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This is used to mock up a divider in the clk kunit tests.

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index a268d7b5d4cb28ec1f029f828c31107f8e130556..88e35f4419c958983578750356a97c0a45effb55 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -136,6 +136,50 @@ static const struct clk_ops clk_dummy_single_parent_ops = {
 	.get_parent = clk_dummy_single_get_parent,
 };
 
+/* 4 ought to be enough for anybody */
+#define CLK_DUMMY_DIV_WIDTH 4
+#define CLK_DUMMY_DIV_FLAGS (CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ROUND_CLOSEST)
+
+struct clk_dummy_div {
+	struct clk_hw hw;
+	unsigned int div;
+};
+
+static unsigned long clk_dummy_div_recalc_rate(struct clk_hw *hw,
+					       unsigned long parent_rate)
+{
+	struct clk_dummy_div *div = container_of(hw, struct clk_dummy_div, hw);
+
+	return divider_recalc_rate(hw, parent_rate, div->div, NULL,
+				   CLK_DUMMY_DIV_FLAGS, CLK_DUMMY_DIV_WIDTH);
+}
+
+static int clk_dummy_div_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
+{
+	if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) && req->best_parent_rate < req->rate)
+		return -EINVAL;
+
+	return divider_determine_rate(hw, req, NULL, CLK_DUMMY_DIV_WIDTH, CLK_DUMMY_DIV_FLAGS);
+}
+
+static int clk_dummy_div_set_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long parent_rate)
+{
+	struct clk_dummy_div *div = container_of(hw, struct clk_dummy_div, hw);
+
+	div->div = divider_get_val(rate, parent_rate, NULL, CLK_DUMMY_DIV_WIDTH,
+				   CLK_DUMMY_DIV_FLAGS);
+
+	return 0;
+}
+
+static const struct clk_ops clk_dummy_div_ops = {
+	.recalc_rate = clk_dummy_div_recalc_rate,
+	.determine_rate = clk_dummy_div_determine_rate,
+	.set_rate = clk_dummy_div_set_rate,
+};
+
 struct clk_multiple_parent_ctx {
 	struct clk_dummy_context parents_ctx[2];
 	struct clk_hw hw;

-- 
2.53.0

