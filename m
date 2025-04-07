Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5092254AFC
	for <linux-clk@vger.kernel.org>; Mon,  7 Apr 2025 13:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031765; cv=none; b=RzrcNuLojYHYEGo432tDYZf8gJD6bs54AFPsn8aDndgVZLVLvWhydW1FEhqYDwWACi9NsqY2Tyy11NZSjZIvBUhcD1BDPgp/gmFoqibY/vHx0wJNXkVeveQDZIyiznu6kIikFh26kMHJHq5nEUJVl8HpeXR16bIMKVSQbOkSmiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031765; c=relaxed/simple;
	bh=Ga2K09VmKsNU+0mnEVhgO1+H24/PI+fT+YcdrRb2qEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=hYk5KUUFzRI9uQnHEl/AbQs9AlLlEbn2Vwx0+3CTPWUrlSLzqOQUPLQuGq3Q6MQ4wMShSzmrQNhni9a9IYoHtYYXqKHutDS1aQvrAzEEmtYFOMMl714EM/DZI3SKKvFFFMfP3xXWEZwCbjSrQuc2jCfm7Z6/TWtUltU5OzgHbr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UzmDZLp/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UzmDZLp/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744031762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vCiYE/HbpALtWNARoJxya1tjWc8KeYYpYFoVh2t216c=;
	b=UzmDZLp/2wGjxpzcsZDSylnzhFfu4i9HTqaFTAjzYOfkk3PsID5+C3hj39AQqlnorsQ6Qf
	/38Mf7K30IeHHrLGqcVUYfSRaVa5myOTzlDZ0vThnrIgI1uI/yGCcrOwhff0VvjxK5nHuH
	F4Baxw/t75nalRd3OrIhFuEE7HIyH3g=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-I3wsxK99OTqLdUBZGOD5Bg-1; Mon, 07 Apr 2025 09:13:19 -0400
X-MC-Unique: I3wsxK99OTqLdUBZGOD5Bg-1
X-Mimecast-MFC-AGG-ID: I3wsxK99OTqLdUBZGOD5Bg_1744031599
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c548e16909so395127785a.2
        for <linux-clk@vger.kernel.org>; Mon, 07 Apr 2025 06:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744031598; x=1744636398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vCiYE/HbpALtWNARoJxya1tjWc8KeYYpYFoVh2t216c=;
        b=AtMQKl0q2gJTtQJVwNhiQitM4iNV31/RVNVMjWhVlfwRwnh/L3O/dqRbRHKOaHpe9T
         TFhCbnQ9RO3WinMeG7F+LtLdIwcpsYWy24AFPEUarB6SoJsR9joKr//WugTcqfN/dCRp
         GwayT6BsVgVKIw5Az99H/J3yM3kXhsf+g6NoOCi7yyS1lpzlL5omJBSUYWvy9AmLXyDW
         oyQVTXEuPNdAE8mWh3JRPl6Y5/wCHRVXC0yU2MpY/iCdJA++owTPRSUYM+AOF24gObmR
         yOi2H2KL3HGSI+L66BGi0N/fW5EUfN8uvQCrHiU8nW/RPRc9WLZ2KQdZyl0KVi5c+3LJ
         Cq8Q==
X-Gm-Message-State: AOJu0YzFRBJqkW6dXNbf6pAKpZDWWldpz7qWVmQzzqHNPgKax247KDG4
	EUPgbvwRnmJJdv9rnoadl/OLyyLM7ZVLAl6cG620Qgub/3db1YHHOqK5/1FYLZd1huSOrmPIpKD
	SKlq/VGHuWzo5VCwJg+/aO4DZe/bn8jAnR5REcsD2xOcQx7ohbCQ5Qh2u5smoHXhezA==
X-Gm-Gg: ASbGncuezKrvr+RDe1omCeXhu/nZFeSOOIYfilihw6mM0vh+ieBHe0Lrs2CVHWdSpLr
	OSed8h/wgo7OpFb09akHRaCZajRN2YVLj3gw0baHnj7uutiJ+oyPsFnZChhY3lYj6Ojhu3o8RJ/
	FobARlkUZRI9m/tLB/V8XXW0Sns9g0/W1ztfaTVsst9IDmN8eTs+Eh18FJIot1PaBU3j0vkgmE9
	0WhgSQO1ZygO4TQaDloVqc+qPz8Uj45wipzAYQ29GJ0gK3uoX9am9AhJE5N3dntD+CbzJRc3jrj
	uzA7KWOB6yMSIMr0ndc+oZzQynyb4UtyCicDusu/wg==
X-Received: by 2002:a05:6214:2a8c:b0:6e8:f568:22e8 with SMTP id 6a1803df08f44-6f0584e7218mr192571016d6.15.1744031597899;
        Mon, 07 Apr 2025 06:13:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFockwKyOARh1pqCe+ax8s85aAbuAeIui04lL9zrBZU1ZDa7xBuA5q5m9Vib49h98pfLr3qNw==
X-Received: by 2002:a05:6214:2a8c:b0:6e8:f568:22e8 with SMTP id 6a1803df08f44-6f0584e7218mr192570576d6.15.1744031597548;
        Mon, 07 Apr 2025 06:13:17 -0700 (PDT)
Received: from x1.. (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f138e15sm57662556d6.82.2025.04.07.06.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:13:15 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mripard@redhat.com
Subject: [PATCH 4/8] clk: test: introduce clk_dummy_gate for a mock gate
Date: Mon,  7 Apr 2025 09:12:54 -0400
Message-ID: <20250407131258.70638-5-bmasney@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407131258.70638-1-bmasney@redhat.com>
References: <20250407131258.70638-1-bmasney@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

This is used to mock up a gate in the clk kunit tests.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 7d4dd1a559db..14ae88df5389 100644
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

