Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBCA337B9B
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 21:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907081; cv=none; b=bZ2XzKBXHBJFNZP3kupVV+KDA4Rw8t4IfCj8wrVU/t1PXJX2gf97DwI5I1hfsoWMDEfCHVkGzwcUxl6CSBZQJ9a6D6uM13Gc/Gukxu91ouyD4XN61dnkOVT0U4H9N/KTOt8E/FwUZ0D3yNj0Zaw0Gwl2qmriV+nePusfgkzFRf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907081; c=relaxed/simple;
	bh=POUeZsY+F8+kUE271cgqQ9Np90bcd9LYX6PjbgvcBJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FZmkt65sTTYncKiHy4kgU3AzVJM4epBAEMbkBS/ze6Aq8nVcGkMEU+yAmEOGiCvpXbEcUgL/kQ519Aq5ApnfSiFGm2kf+gQIUn7zKAiL+G8NPPXO9fy2Z3sio2lhtQCqF8uTK/floAqoyfQjYui/Wh/2pUSHoYzQdhzdmDdnyxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d+iw3nnM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YQ12ZwiP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d+iw3nnM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YQ12ZwiP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kJHSitOCa2lb+eZDZlB0ZfwPqPo8SqKK/IbMApuY5hc=;
	b=d+iw3nnM1REs2R0riSgt1BwEiWSZPqxs/0Q6+LtLm8x+6hANSvLKseGZdRnNsMsoPP11Rq
	cQ6m+w+/eztLGLCkmlvesC0Yb4eyjWljf13SvXSOIue7kU8IS7DyRhgw2B8N9MYNOd4lLO
	DVlv+PqGqqr4NYQfydjps+G7S9ypJh0=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-SxSrLZ-PNxSAqjYqZyPZ4w-1; Thu, 08 Jan 2026 16:17:53 -0500
X-MC-Unique: SxSrLZ-PNxSAqjYqZyPZ4w-1
X-Mimecast-MFC-AGG-ID: SxSrLZ-PNxSAqjYqZyPZ4w_1767907073
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ed0b7ed42eso1163655137.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 13:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907073; x=1768511873; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJHSitOCa2lb+eZDZlB0ZfwPqPo8SqKK/IbMApuY5hc=;
        b=YQ12ZwiPe0hsyVJRobJQAkaPljKvKXxRnQG5ZJYlS/B9gyFCYFW1IVQ6iE2ssZXdg+
         JYccZkuZyK38+EF89bfwoliW7TVUsIzO/DUkQGCrJabbi97jlDQqm+Mp4K56uPGRqf/m
         TTRnBc0oe2NyIXyXJqgreeVteQlvhV5Qt+S+dJXggwxUpMiOUne1ih/TIvpItlvtNkJE
         F3yv88+qs/d13KBlbUmWZKtQ0Hef/yN5P7PYGnYZg+fgLYHJZFQeynPJhqdtGIrgfrjU
         UAxcI4/k3AuwVvX6ij0FqfoaFEnUbyeSdxJzYHnnpTQleR1P2IQXkHabC8Qaf0fQncX7
         eaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907073; x=1768511873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kJHSitOCa2lb+eZDZlB0ZfwPqPo8SqKK/IbMApuY5hc=;
        b=nWvXkxtswd2c+gJM4H6sbBcVMTEWUD/HM1CdoQkX/g5OFRd5GliivoZRz1ksXUnGQ3
         8AKDTezdIlrSh8r1ldwGMuup4jV5pam21NgpFuBdxJ2oYm5wfvfuxs/wp2yUYMcwXOdW
         kTUtHrK4nNUTDkinwEbAajk/8LeW5GkT3HhaZosNIc4UeOv2GdFM1kCv3YRyelSZVQ0V
         ia+1aoPTUTOGq/j4aZTbOwPimcBwe4Ou32IoOxbgSHnxGePAe+VUz0bkttkG05FBp27K
         JQradjVoLVg+LqmRFNQkH8Obn2ZWTTqCvixTkrOsgKbMhtQSdbazYAK3S4jDj35v1yAh
         Ju7g==
X-Gm-Message-State: AOJu0YxfgUKpeAX4Fhdl9D+ceFEYD/11846hpGMjYLsGyGbOG2c55/E2
	a1Fcq/lbrfofkGWh8qiZoR47ECM7xmrhglwAJYe/6Y7yMfHBd0nuaCrH4JaF645XNrXI8iEdrYc
	Ym6x99E3r1uKuNU5K4c8KJUF7mGk27s8ofTnFa8Anz5GTc/iueJvAmAowRUetgg==
X-Gm-Gg: AY/fxX5EViHj/R+gNW4OACQMnNWoiQxlV8TwDMed0NFAJkxBnQJGKOMf4lcY2VXQP8C
	0H4oROdvaYDITc94p8yySYyoVwb/MlEQTUIOwPhs1QPF70dPU/NXzSbxdZHiDMl/tSiAhuDVAkG
	XpLNjxzT5HxIw2dPlPc58eRyUf3m9vKA+PO6dpYVEa0fVDfnqCzCjTNe4dncUMrj6A91qpdgmOZ
	csnfwdcRKEalwVwiUPO8r/GfCgKQ39VC4JZ+SvEOVz2eaZDuqvJR501wQUC9hSACHAGZVGXt6LL
	18boixvnMvHaBNLDJOmDPnFXGy81IuLvNgLUE1mnqXlTZdXifiVPlVHwXL+vIZYskyb07OvhiaH
	yRFwPbWu7bwXjrrg=
X-Received: by 2002:a05:6102:38ca:b0:5db:f352:afc0 with SMTP id ada2fe7eead31-5ecb1e72945mr2984430137.2.1767907072890;
        Thu, 08 Jan 2026 13:17:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8lwBGoZzalWApFS6fBt0yhs9PqwqWvGlooSRhdR5zfpfZTC31pKCqamm2uqiTNXnx/ioL4Q==
X-Received: by 2002:a05:6102:38ca:b0:5db:f352:afc0 with SMTP id ada2fe7eead31-5ecb1e72945mr2984416137.2.1767907072569;
        Thu, 08 Jan 2026 13:17:52 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:17:51 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:27 -0500
Subject: [PATCH 09/27] clk: loongson1: convert from divider_round_rate() to
 divider_determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-9-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
 linux-mips@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1454; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=POUeZsY+F8+kUE271cgqQ9Np90bcd9LYX6PjbgvcBJw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5LYHN79l2mZlWP1eiTViw4Ffutcmduqz/1K/Y61xg
 F8n5L1lRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABNZ4sfwT1n/t8Kspn/BRVU7
 7qxqL3ExZ2mqzJCLlr+ruXvP9skd4Qz/bNpEnLodlkwyLqjufyw1RS4xw3lR4du3G9bM/2G0/v8
 KPgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The divider_round_rate() function is now deprecated, so let's migrate
to divider_determine_rate() instead so that this deprecated API can be
removed.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Fixes: bb40a2ef4fc9 ("clk: loongson1: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org
---
 drivers/clk/clk-loongson1.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/clk-loongson1.c b/drivers/clk/clk-loongson1.c
index f9f060d08a5fae3291a9408c6dc93531b435609f..1674181a1107dc4f30e78ee410a55a49b6d0b4b5 100644
--- a/drivers/clk/clk-loongson1.c
+++ b/drivers/clk/clk-loongson1.c
@@ -99,10 +99,7 @@ static int ls1x_divider_determine_rate(struct clk_hw *hw,
 	struct ls1x_clk *ls1x_clk = to_ls1x_clk(hw);
 	const struct ls1x_clk_div_data *d = ls1x_clk->data;
 
-	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
-				       d->table, d->width, d->flags);
-
-	return 0;
+	return divider_determine_rate(hw, req, d->table, d->width, d->flags);
 }
 
 static int ls1x_divider_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.52.0

