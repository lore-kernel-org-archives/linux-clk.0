Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAE63C7DF6
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 17:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774286742; cv=none; b=a7vXcz02UgTst1mV6gWXDjb/DroL/Zi13O4x7K6rx90xOVShBiv5Ey8qF1OSPYMSwQXQGb0TTeFcP0518rsA80HN98EmCrd6Ks9vy71+4sVBPtv4kZir0Fc4nQZoORAacqIQZMU3GYSNvs2RCbSm0tMOaie7kIPSn/mfIpwCPGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774286742; c=relaxed/simple;
	bh=+l00fky33FJjUcCtct02e8xTnMZAOCOPGYXSQstRsV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wja4k5l/griVeoC8whx7Axa5uT+RLMb6ZLQa4X8oUXFBtSAyMuaPHVlIW1BNQ/0+NPtjFk/cGCqXh2hGf90uqo8cNp+32TAPYktNOvpIdCR4NisEbzVPzH91SQ5thCzgfWH29/BH+CVotHX8nwOn4C+t6BpUN1ThNcsM6lOs74o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uh+/WJyl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=EvkLDOwn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uh+/WJyl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="EvkLDOwn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774286740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q1hC/ZzGEUORZ2zC8HhKM0IgI+bXqAEpeb3eJalR1xU=;
	b=Uh+/WJylIt19TMOx6N20jsFl1/sPk1fMNr0O9N5Y2IsHklo2vHwPFx1YxIT8vpWhCYF3Ow
	OCjHySpJwRB0ahRjtdoFQt5Y9uPIxFc5sRZ5EETpbwdrRx3ZP1zRR7ZJQUvCE4TK24SVk5
	4eBZpawdYg3bibxNLj8ZDVT46dQohrU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-5WvgB4NsNtmtcsObNKL4ww-1; Mon, 23 Mar 2026 13:25:37 -0400
X-MC-Unique: 5WvgB4NsNtmtcsObNKL4ww-1
X-Mimecast-MFC-AGG-ID: 5WvgB4NsNtmtcsObNKL4ww_1774286737
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4661881eso6117451cf.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 10:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774286737; x=1774891537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1hC/ZzGEUORZ2zC8HhKM0IgI+bXqAEpeb3eJalR1xU=;
        b=EvkLDOwnp3FstyDIG3XIc0gCX9IzOOY/jOtr8wdhaTPOh5aV+OdSnOSQyLv7UxeSw+
         xmboKJEsEy1X2wC4Lp5Vs6X9SEjtzoWNifUDOXAskxwYw2+i6OF/wwZJScM0Z4r2xQ6q
         Vf/xFywgn/+qa+Rn4JYuph//+ppCTI/GYi/PKk+IciOL7UE2etgJioVCFO2QeRxo0T8u
         2sIceRggoEffohY1o0s5Sivj9lvXRhqhcR+c1yqeNURTOdGzj9sKGNLWOs7OrSYnweWY
         EAcpcYrtr9tr1AAKNqsnxpoRONwoo69ESZnAN8FvlSgmyGJ4fbf/de965s9n+9eJ9feU
         9lOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774286737; x=1774891537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q1hC/ZzGEUORZ2zC8HhKM0IgI+bXqAEpeb3eJalR1xU=;
        b=X+TG2vY1jQTQi3N+UmueoX1z/kRnL4xOlDD4zksY/gJVZif2OpQW54GMIsWqVDeS/j
         mkPdMkbCYJDrSCwTg0Yi41Cgk4P9C1iOkyivC/5mjwuUItwR5UonCK6HyHJOk34ZF1SG
         27lW4dDLaYu+wxmqZuuZXfIeQIiTHKC9okgUJ3e1LLhOO1lIz0lnq4uXuKDrl3yRpjgp
         w5TE83aYP6r0VJDuDfKEPNxGlkFF1lS8CoHmuvwudO/PYIt7pJiSnQAConQHwLlDrYJp
         OqnGgidzNBwwxX5cY5v8FOlPGmVOrHobHMjhqgYTOPcwfi9KmoKq2QLIqmvSLzceUDdP
         8mkw==
X-Gm-Message-State: AOJu0YwbH2p4lZenpiMP5or8+DMFqy7pwf93FaZAgyel6QMMXmi6yxzL
	63VYgPYcQ/cP3EIOHQYun9sv8+bdBquOhVQfyHkVUC4dfW3OLY/+cToQ7yj+mLk0hG/HrwzvyXf
	yZhtzf+Bn/l/31vsoouT9uroPPrDwvBORNJfBRnmCqW4KP89a1eEflw1d8fZu+A==
X-Gm-Gg: ATEYQzy4ljtjEnkzyF3Qf9cidU0WGUQsxJ1oEqFoZS5OYSu8oTS9Hl4EJQm9N3YU8EG
	/y1mHK3mKcEpehH04K8Uf/CuEgqVBiARZxAMny7sLfGc8/UlecbFJA+M/RpSSTfQ8S3tK7GKIDb
	R5vnY1tL0dkSYAZsw+IW3RnQQKOm/h+Y0GsOKFkFJRu8OweS0i755KdsiYNy4P/9TmlqE4hZ90k
	dPdVUl3vECG1yen8pbW9FO7wcD0hzcNzI9/3+gNodZ1A7JR2LMQUJJrcCYm5lRZ6pD5UEolbnoT
	9+vLphUABLpJmGsGzfv52yz3OLj6EQhM2kU25qprpIFQ3gIUBRGk+c5nacLwF/JGgD2kS/EZk6k
	HDc7gnf/1iWv7M0PFsWnV15K/VjXCUk/rCuBNiiFB/AdwWvmoIOLt59qemSLc
X-Received: by 2002:a05:622a:1e85:b0:50b:2fac:9597 with SMTP id d75a77b69052e-50b3743992emr212550401cf.22.1774286736597;
        Mon, 23 Mar 2026 10:25:36 -0700 (PDT)
X-Received: by 2002:a05:622a:1e85:b0:50b:2fac:9597 with SMTP id d75a77b69052e-50b3743992emr212549821cf.22.1774286735944;
        Mon, 23 Mar 2026 10:25:35 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e34f8bsm108249661cf.15.2026.03.23.10.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 10:25:35 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 23 Mar 2026 13:24:52 -0400
Subject: [PATCH v7 1/8] clk: test: export clk_dummy_rate_ops and
 clk_dummy_context() for other tests
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-clk-scaling-v7-1-8e7193dc9405@redhat.com>
References: <20260323-clk-scaling-v7-0-8e7193dc9405@redhat.com>
In-Reply-To: <20260323-clk-scaling-v7-0-8e7193dc9405@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Alberto Ruiz <aruiz@redhat.com>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2492; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=+l00fky33FJjUcCtct02e8xTnMZAOCOPGYXSQstRsV8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIPlreFyJQq1+tfrvd9O1/RymXLZOWde5dpTvfsMJK/v
 SnG+X5YRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABP5Xsjwz6T9kFHGr0mX1t7y
 PsffM0EloWLulwPfexJfvw1/9LBKvInhf52ZhElk6Wbmt5U+YVutvJsj98nbTtXMOdyex2vkpl/
 FAQA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Expose clk_dummy_rate_ops and clk_dummy_context() so that they can be
used for other clk kunit tests. These will be used for the clk-divider
tests.

This export will be used by the upcoming clk-divider test suite. For
consistency with clk-fixed-rate_test.c and drivers/clk/clk-gate_test.c,
the divider tests will be setup as it's own separate kernel module.

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 9 +++------
 include/kunit/clk.h    | 7 +++++++
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index a268d7b5d4cb28ec1f029f828c31107f8e130556..b286297bb902a0c6c8a0469d0f785009416ba9a5 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -15,6 +15,7 @@
 #include <kunit/of.h>
 #include <kunit/platform_device.h>
 #include <kunit/test.h>
+#include <kunit/visibility.h>
 
 #include "kunit_clk_assigned_rates.h"
 #include "clk_parent_data_test.h"
@@ -25,11 +26,6 @@ static const struct clk_ops empty_clk_ops = { };
 #define DUMMY_CLOCK_RATE_1	(142 * 1000 * 1000)
 #define DUMMY_CLOCK_RATE_2	(242 * 1000 * 1000)
 
-struct clk_dummy_context {
-	struct clk_hw hw;
-	unsigned long rate;
-};
-
 static unsigned long clk_dummy_recalc_rate(struct clk_hw *hw,
 					   unsigned long parent_rate)
 {
@@ -96,11 +92,12 @@ static u8 clk_dummy_single_get_parent(struct clk_hw *hw)
 	return 0;
 }
 
-static const struct clk_ops clk_dummy_rate_ops = {
+const struct clk_ops clk_dummy_rate_ops = {
 	.recalc_rate = clk_dummy_recalc_rate,
 	.determine_rate = clk_dummy_determine_rate,
 	.set_rate = clk_dummy_set_rate,
 };
+EXPORT_SYMBOL_IF_KUNIT(clk_dummy_rate_ops);
 
 static const struct clk_ops clk_dummy_maximize_rate_ops = {
 	.recalc_rate = clk_dummy_recalc_rate,
diff --git a/include/kunit/clk.h b/include/kunit/clk.h
index f226044cc78d11564f7adb4cc2450934aab04ce6..b31d9a9055881ac95d3c69f0e5d0728d9fefed88 100644
--- a/include/kunit/clk.h
+++ b/include/kunit/clk.h
@@ -9,6 +9,13 @@ struct device_node;
 struct of_phandle_args;
 struct kunit;
 
+struct clk_dummy_context {
+	struct clk_hw hw;
+	unsigned long rate;
+};
+
+extern const struct clk_ops clk_dummy_rate_ops;
+
 struct clk *
 clk_get_kunit(struct kunit *test, struct device *dev, const char *con_id);
 struct clk *

-- 
2.53.0

