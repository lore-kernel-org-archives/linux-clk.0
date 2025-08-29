Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E707A21772D
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 00:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756427934; cv=none; b=gAAV9J54qfTbbjcScex28PtKm4RI2DGzMeJEyexuFq01ugExwpvjwBw29AdoGNnsnZXVtyUyf0AvpwejwOAUilsHVnUudO4bZHVs6ISuSejfuMeRbS/PHEHbhIVta67y8HFF+T9mmx9NAmaBHVilB4c2AyEJZvQZMIKn4zq254U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756427934; c=relaxed/simple;
	bh=sqQ9Idu7LND8TQvnc9CGktCQVk853FsqtiSZ1I4901o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LBqmb9+gw70VD94KhHX53JV+HXFjwlGiQeclCWjL5BYMa7qZElSXY7G233VIJdE6QrYPZ2N2dtyPpcn6/DA9e/fr3oQinfv0+xWXOM3FWq7J5DN2+NugYmbiWHP7hG5RTtMg7T+4K3Crx+gJ6I7gFNbKFfw/LpavBRn9nUCFt9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J54z5Hej; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J54z5Hej"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756427932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dWO8Dz9nIHqrR+SVTleBzTnUpEyDVDhvHJs2y9irGnw=;
	b=J54z5Hej3esLVDyFTX7JBas0AtBPdqUFF35hSf1q7rGnb9cahKtn0V8XDUCz3S/RrUCfuK
	Z368YCdVmfP/lvaElEb9YUp6A618zU4cnFwhteoq5fcGUZyKlfaxewTeqixlWVg3uxTQf7
	SA/WcTgqwh5lY4K7FWfXZxQpvvv8BqM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-gVi-T0FROcej8C7IYwFs0g-1; Thu, 28 Aug 2025 20:38:50 -0400
X-MC-Unique: gVi-T0FROcej8C7IYwFs0g-1
X-Mimecast-MFC-AGG-ID: gVi-T0FROcej8C7IYwFs0g_1756427930
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70dfd87a763so10979536d6.2
        for <linux-clk@vger.kernel.org>; Thu, 28 Aug 2025 17:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756427930; x=1757032730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWO8Dz9nIHqrR+SVTleBzTnUpEyDVDhvHJs2y9irGnw=;
        b=R9FSOfRMrFZi31wRbStMrtO2xl7o82rektHFldivXZJbfrNXakkGpRHqclqTG7p2Uh
         KsMAvBe+Bqw/n5WoZ1wSJESit7RZ6+Lwwko4Bka7A3pbqe7wlKRzuJZt+xE9igPwzHOl
         gsBPLgX8z0wJO6gewlwqIJ4q03rVhclOF1Nfav9l9mLjTikeFimy/z+tcHqicRjjuNvh
         TM7r34W2anzf6ef6tA7j4K1t+xnAMMotAADgR3nly62k4tDs4jup02SJmlbWc/LydaHt
         wOiR2FI64RYs9pkdHjOPVwOd6RH15nYyRKteyztN4i+3KGcGWXyOKxy87sK+99+WAWcd
         rB2A==
X-Gm-Message-State: AOJu0YwtMUCZ7hvyIRJN9KxTLt8s5kcr8zGm0GAfH51HiOgXrciiFlDM
	ygHHf+2pfb86il9JZHN3v3U2UyvlBO0eLkRCVjvvm3HiWNsjsBU+MomtAWGUtJ6pgKjGjXwnZvI
	tb68o/6zmFhGThhT/PcbC952WJ522XmGwNkqv6NIGDNBDtyH2rM3XeCXhIgaQ7w==
X-Gm-Gg: ASbGnct67TcAcmRr9bM/w/Hev7OL75hbGJP8SmbZ6WDo6EoHlj+yaNlB9OKLSG9b/38
	tW6dW+8ELCykMWRXUuCP/fpolPs01eM9uXRjYSQK/xsCgZghrlz/APDJ42hpOaZSihiLUWrxs/d
	cwgs79rjYCPCPAuWjkbH/XzACTm3hejIChdffMXvHz9EPtusDjYyffL4rV8AZk/4YQgcv5IMRjI
	BZyAc4nWaEU2GQo0mkddoPeU0ybSRdyKSKMDxxFbdTQ7h+eVbuXK7sJBTKq+msx/oXE3k0BJH/k
	nYnE2XWU8e/0ShOw5rr9yJa3/E0V+bA0OM1+K0X7repcTYjZEOdRjqW/U8E26iBwz5xJ5gTfbi5
	4F3Dhe3f/XbdG3bQNxGoek6lI00R9SSAmrg==
X-Received: by 2002:a05:6214:252f:b0:70d:e4a7:1b38 with SMTP id 6a1803df08f44-70de4a7272amr93091206d6.59.1756427929799;
        Thu, 28 Aug 2025 17:38:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0zJ/btEpUgEaoIIvfrO+RJjlxl3Pv9v+fWpYa9u5ZWZV72zvhLGJUbbr2PZPa8Aw72GLx4g==
X-Received: by 2002:a05:6214:252f:b0:70d:e4a7:1b38 with SMTP id 6a1803df08f44-70de4a7272amr93091076d6.59.1756427929458;
        Thu, 28 Aug 2025 17:38:49 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70e6264141asm5588696d6.65.2025.08.28.17.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 17:38:48 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 28 Aug 2025 20:38:24 -0400
Subject: [PATCH 5/8] clk: sophgo: sg2042-clkgen: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-clk-round-rate-v2-v1-5-b97ec8ba6cc4@redhat.com>
References: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
In-Reply-To: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Michal Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756427914; l=2463;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=sqQ9Idu7LND8TQvnc9CGktCQVk853FsqtiSZ1I4901o=;
 b=OqClB2gKvwUjzcBuWISxeT+XMsrr1fq+AKWaKypJZsPPPqcYnCjdJ8UA89aYPddHv0+EsQ93z
 FAS6xT63b+ACxX8kvKkjjNayIxis6/FhWL13CkGrP4I8GMEnTIJ9PfM
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/sophgo/clk-sg2042-clkgen.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/sophgo/clk-sg2042-clkgen.c b/drivers/clk/sophgo/clk-sg2042-clkgen.c
index 9e61288d34f3757315702c355f2669577b29676f..683661b71787c9e5428b168502f6fbb30ea9f7da 100644
--- a/drivers/clk/sophgo/clk-sg2042-clkgen.c
+++ b/drivers/clk/sophgo/clk-sg2042-clkgen.c
@@ -176,9 +176,8 @@ static unsigned long sg2042_clk_divider_recalc_rate(struct clk_hw *hw,
 	return ret_rate;
 }
 
-static long sg2042_clk_divider_round_rate(struct clk_hw *hw,
-					  unsigned long rate,
-					  unsigned long *prate)
+static int sg2042_clk_divider_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
 {
 	struct sg2042_divider_clock *divider = to_sg2042_clk_divider(hw);
 	unsigned long ret_rate;
@@ -192,15 +191,17 @@ static long sg2042_clk_divider_round_rate(struct clk_hw *hw,
 			bestdiv = readl(divider->reg) >> divider->shift;
 			bestdiv &= clk_div_mask(divider->width);
 		}
-		ret_rate = DIV_ROUND_UP_ULL((u64)*prate, bestdiv);
+		ret_rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, bestdiv);
 	} else {
-		ret_rate = divider_round_rate(hw, rate, prate, NULL,
+		ret_rate = divider_round_rate(hw, req->rate, &req->best_parent_rate, NULL,
 					      divider->width, divider->div_flags);
 	}
 
 	pr_debug("--> %s: divider_round_rate: val = %ld\n",
 		 clk_hw_get_name(hw), ret_rate);
-	return ret_rate;
+	req->rate = ret_rate;
+
+	return 0;
 }
 
 static int sg2042_clk_divider_set_rate(struct clk_hw *hw,
@@ -258,13 +259,13 @@ static int sg2042_clk_divider_set_rate(struct clk_hw *hw,
 
 static const struct clk_ops sg2042_clk_divider_ops = {
 	.recalc_rate = sg2042_clk_divider_recalc_rate,
-	.round_rate = sg2042_clk_divider_round_rate,
+	.determine_rate = sg2042_clk_divider_determine_rate,
 	.set_rate = sg2042_clk_divider_set_rate,
 };
 
 static const struct clk_ops sg2042_clk_divider_ro_ops = {
 	.recalc_rate = sg2042_clk_divider_recalc_rate,
-	.round_rate = sg2042_clk_divider_round_rate,
+	.determine_rate = sg2042_clk_divider_determine_rate,
 };
 
 /*

-- 
2.50.1

