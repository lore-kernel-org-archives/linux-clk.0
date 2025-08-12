Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33652EF644
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 14:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755009661; cv=none; b=cZvfokg1H7Em7BVFHnejqq7KLXKjBWnXaLO3GSTK8WzLfut/IJ3oRiKEuhMeXIMb3WorDXfsvD54eEN9XxBQ+zmYCvWQF3zPTRFXlqqOTShhqSinNPro+qW+K9aur/uvtcdrnZ5uv4XnYsSweQkm9g7A+KDOiieu/h1Q/9FdNPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755009661; c=relaxed/simple;
	bh=/B24jKgY1eYxf812cHNT9gVhTnmgGeQi+I8gZG7p4+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RxDlJKg9weFHzaxXG48yjii4HG6Xi9kPmVZlBrKzB8PwTKOuXfUSmdEpLoXjbUm0/f/QvMJ57tNomrXWeC6L0SaR0QTF8CW2IoFofJIxf7dg0LH3GXhjYe8MFuG8rcsprXXOhDKeT8kHgTy0O7rHFe/CE1RNBzfMjV/EZPVlvjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IdXG8YEK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IdXG8YEK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755009658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0MgJDKWq9Y8z5RYInRU9bNJP9izytLfDXO0IEfDoiaw=;
	b=IdXG8YEK+uGhAa+T+rA0norE0WYY2qRd7oGM0jsRPJjkmjq+1c6yqSCRPeWUjXh7Hz5dMx
	zuEMvPdOSus0noA0EMSrFkt/4ecew7eVubtQYH4UzHlK2l616CkYrLl0RybL2/dc6ViLS8
	exDQNLn6zQA0DYXJqJeXMW/h00YPWaY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-RwYnNZ80PlOfmIdE67v_Cg-1; Tue, 12 Aug 2025 10:40:57 -0400
X-MC-Unique: RwYnNZ80PlOfmIdE67v_Cg-1
X-Mimecast-MFC-AGG-ID: RwYnNZ80PlOfmIdE67v_Cg_1755009657
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b06a73b55aso137265491cf.0
        for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 07:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755009657; x=1755614457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0MgJDKWq9Y8z5RYInRU9bNJP9izytLfDXO0IEfDoiaw=;
        b=W+GRcIk1utQ4xJSCZLQ2EH+Vf9T+/O5CkqU0kR6FteywQkFjG3XJCjk4rqEoDuwiMa
         rEUw3WV5rLUGPwPPe8sy+F81OydklLMfheW9ziIzjqUEYcnEWQocvUVhg00B5CwbHf+G
         yjRbRUcNI7ygtLendbfxU5XIg/2Ffu8PjM4e+rK639iQi9jD//v+nToK/vVIDpBMsHWO
         E8oFafHb6yzXdIQG7MvdDZ3+BS0vqXQjjYYp3jDmyeC2GfsUlEBx4wwaYjWBoTKMa7qP
         PjOE63setKqVUzmBBWRN0xsAyuvPs7II2oPY/Q1BQLwyMStY8VZdO8PF2Whon80/i4qV
         M2NA==
X-Gm-Message-State: AOJu0Yxd9feCcQX7R9xaJQHJ9dWodSVUPzxL9x8fkqIc248Sr7Ao+ksN
	564niHnGP7oasXC6xiTtXZuh/TAS027JM2sJQZxbuHmtpMrrfkgUqzqQGdt3U0HGjWkT5rByhyO
	FB+CivyXNfeQwD4YYv2FkqS7Gld8jwqYxsDZBZnEBI+2xHTnOUKB42ShzpZg4kg==
X-Gm-Gg: ASbGncvRseC83LrPJYOBIP8WT5ABNLQd68xwv1H+NZ95JdEt7+dK0zj26R6wRdkJWWp
	GWQUYX/RrFIYTqFW/TOsIH+MF/rk82O9uaG3/DZKcS5Ujy7Y9Eu3BVa0wAGD2Ag9+YcrRirG85w
	3AmNxZWkWOY/vL+WvmMDI0tQreXU8/xhk4yhjWb/PYBVSxe4ETYCbS1wKYDAD1BMhUfrZeeEPKD
	YD0ruE1YnVd/DyWGCVtFNC/JjwIlI6KgSSieWEVCqJEd4skPkmL49lI1MulzVH32D9zkM2YvuBy
	b6jAeOFHOFkaGP+4ZannTYCSUYooyxDHaNQyaIQJ+8YvNHneiLlNRJEKLY1rg+IRYNxjGdxgLdi
	sXA==
X-Received: by 2002:ac8:5a09:0:b0:4af:12b0:57aa with SMTP id d75a77b69052e-4b0aec6fcbfmr230728981cf.16.1755009656780;
        Tue, 12 Aug 2025 07:40:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEU7fksXvEONgvnU54NAK/snQlmjlJVmymfi5lhPNVVxA94jUxwPuUrqRsgLCXWdiVxef3PwA==
X-Received: by 2002:ac8:5a09:0:b0:4af:12b0:57aa with SMTP id d75a77b69052e-4b0aec6fcbfmr230728541cf.16.1755009656228;
        Tue, 12 Aug 2025 07:40:56 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0aa1efe78sm76186821cf.8.2025.08.12.07.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 07:40:52 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 12 Aug 2025 10:40:32 -0400
Subject: [PATCH v3 2/9] clk: test: introduce clk_dummy_rate_mhz()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-clk-tests-docs-v3-2-054aed58dcd3@redhat.com>
References: <20250812-clk-tests-docs-v3-0-054aed58dcd3@redhat.com>
In-Reply-To: <20250812-clk-tests-docs-v3-0-054aed58dcd3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755009649; l=1196;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=/B24jKgY1eYxf812cHNT9gVhTnmgGeQi+I8gZG7p4+k=;
 b=Yw4rGAFhMHmhnXH7wLnB9dvYYoAVL5j+A7SIbu0eCs1NsVZ82Zj7a89QGc6B2urIhCODHr6bL
 FFF7iXoEBOfDGqrgVyFbIT1FDeTZoBfbiDNSypgylL5OWhHcl5ivR8I
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

Some of the mock tests care about the relationship between two
different rates to ensure that functionality in the clk core is
exercised when the parent rate is negotiated by using specific
rates. Introduce clk_dummy_rate_mhz() to improve readability.
Change the DUMMY_CLOCK_* rate constants over to use this.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index a268d7b5d4cb28ec1f029f828c31107f8e130556..fafa736ca32144a2feae75a8d641abca3162d42d 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -21,9 +21,10 @@
 
 static const struct clk_ops empty_clk_ops = { };
 
-#define DUMMY_CLOCK_INIT_RATE	(42 * 1000 * 1000)
-#define DUMMY_CLOCK_RATE_1	(142 * 1000 * 1000)
-#define DUMMY_CLOCK_RATE_2	(242 * 1000 * 1000)
+#define clk_dummy_rate_mhz(rate)	((rate) * 1000 * 1000)
+#define DUMMY_CLOCK_INIT_RATE		clk_dummy_rate_mhz(42)
+#define DUMMY_CLOCK_RATE_1		clk_dummy_rate_mhz(142)
+#define DUMMY_CLOCK_RATE_2		clk_dummy_rate_mhz(242)
 
 struct clk_dummy_context {
 	struct clk_hw hw;

-- 
2.50.1

