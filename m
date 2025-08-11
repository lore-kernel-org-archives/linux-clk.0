Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1442E2DCC08
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 12:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754916527; cv=none; b=YVgK9FbrjaWLGqWP3qw3iz/rn7xestj9wMHdqIlY6J7X3ZKDPyCp1TBweEVlRWa46UEOnKAePKbAaOjkpDax5jLaxrt68XPpzN/j/A7wQCKJSuOgbbXUaILCWj5AgSKA7N9qLnBT89MGDsRlel2XuF5FPfq33XvH+XcF3NbHTfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754916527; c=relaxed/simple;
	bh=KZev2woXWU9HznU+gcnRnr0OtzfEyHcHVt06Cr6pNMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MTH+2PM5pjL0J5SyAL9cOMqF6A835nzdmCDLMIIrQVTcOQIoBwaHAnEHmJYYE6KX2RMzxaHIx3BYXCCMliaahKtU5zUVNze2Kcs1qbrEd71ihpsG/v2W2Ilsl7r0iRMUmHuYAF+XRmTFvt00IfzdoaWZLiREmfBuTGLghl/ZHTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eep+4z0+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eep+4z0+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754916525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kv4JIx5nA2wF0cDefvytjovFmfVgfiGYSd/ZtzOrYfk=;
	b=eep+4z0+5HMq29fw4gpLnIotngOBIOVL+idPb3SD2TqkOaW5cLORMrhH7uFmq/VVQxYmXB
	/0coOlIkSFTQ1kxkWGEoR7E86oUS7hYfd96MmISFbrQvTNu/GXqOWrHbtAY03bJ9WbACub
	Oc7Xl3VvqwoCOwTJEDKJPkJmtbHiqqA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-NPx3nGcjMAuDtdltRbti1g-1; Mon, 11 Aug 2025 08:48:44 -0400
X-MC-Unique: NPx3nGcjMAuDtdltRbti1g-1
X-Mimecast-MFC-AGG-ID: NPx3nGcjMAuDtdltRbti1g_1754916523
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4aedcff08fdso82159091cf.2
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 05:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754916523; x=1755521323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kv4JIx5nA2wF0cDefvytjovFmfVgfiGYSd/ZtzOrYfk=;
        b=t/WgLh0EXot0xxRiyM14cEtweJJSfw4/wJhyvI3reMcmWfKGn1/CnIpk2uCMuXRKPV
         6WdEveDZXAQwKf/EaW0WmlvFQRgFCvNkEjDLLYiA/opFNIzQ9qZYnzEnj6s5UBXo9xsD
         vRGY0Bir+f+kSbC8k/Xo6PtUlp0TIl4Z2TpOjn7D3syuwPsJ5AfEvd3FBCt8XpfC05/Z
         UjfPzIU8H+cojNzw/Y3fQXSNCzEZKi6Bi95I8QpMQAaesMYBNPFONuD84DjVnBnz0I+r
         1i5LOkVL0c80IWuOzfkrIYW8FXHOFQKMY/DopnWtASgdBYuoR99uErFudKliiXHatSc+
         Wv3A==
X-Forwarded-Encrypted: i=1; AJvYcCU5yFQ/oYWg40EfLrLuTXlCeyezCSi72xx9LhUQ5ICL9Xn3nzLFkaPfYvgIJV+1ZV4pWxH25Lm1EL8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1TgH61SVzZ/yDdEhAcLqqB6LPDXqWUiS7nSkxh5NVN3fj/I9d
	viLIe0BG0zmEjmKw1d0ndcNLIuwvw7qt6w8yJSGnOqHQpIwUtrRAek2FEefBNfHqLWdfE0XlzeP
	l+V2gsf2LXvjPaBLzfa1UZ6XW7sO0ag3lutIYkiYv8b2xT43pKnm1KG6quzjXLg==
X-Gm-Gg: ASbGncsFFoycTqB5HqSeOBVy/RBEh0rsbdI28Jp27ZuUjIQdZHK9DWzgC6iJpGgRgdu
	MqEseapKAE2IIcwKQoRCWKbt01GLqFJi9Wpu4IWnlH54jS+QbWLGLo+cIkoi7M+pS/DTNMKuqDO
	mBij9RHm3ktS0GAw/vpwXS2Sg2aALwQlq+gIrfX530sgPVRtYl5sHWO1tjKKn1WUsY05yaXtHQF
	TmusVRszFw8dZ3tbGC29NRWMzdKc0gBmDfdKpmVsxAFjtQG8gv+E8b0ilbMZR8plpZT3xJ5VCJG
	AVRttvxDO8r6t27T0lRVns8Q5jv5/1ITBIihIuOM+ph+o4VSx9P5+uuZ64TiEfBuHXSA8O60DJd
	eXhc=
X-Received: by 2002:a05:622a:11d4:b0:4b0:70d2:5dae with SMTP id d75a77b69052e-4b0aedd7c6cmr184053641cf.32.1754916523237;
        Mon, 11 Aug 2025 05:48:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/s9J1rhGKt71vKkorwhvcmkFojr3YuVPBRRrYFELwpV8zzT+UTulziPC71u8GjxQnYOpeGg==
X-Received: by 2002:a05:622a:11d4:b0:4b0:70d2:5dae with SMTP id d75a77b69052e-4b0aedd7c6cmr184053171cf.32.1754916522674;
        Mon, 11 Aug 2025 05:48:42 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4aef746b6efsm138724001cf.15.2025.08.11.05.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 05:48:41 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 08:48:10 -0400
Subject: [PATCH 5/7] clk: ti: divider: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-b4-clk-ti-round-rate-v1-5-cc0840594a49@redhat.com>
References: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
In-Reply-To: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
To: Tero Kristo <kristo@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754916502; l=1648;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=KZev2woXWU9HznU+gcnRnr0OtzfEyHcHVt06Cr6pNMU=;
 b=9HtWsQuOhfM98X55HNWOck7M08AwApUYonHPDgwcZa8S/UhZwBGL/lFQadP95RXlxeEt3lQtd
 BZJ3vwA7z0fDwJ7YnZJoOWmOvTB+trUUgK5JvgAJBPVoJnuqf7KVZLm
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/ti/divider.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/ti/divider.c b/drivers/clk/ti/divider.c
index ade99ab6cfa9b18e5bcfb616273b5c06637035c1..6f58a0f2e74aec14fd3711d722e66b6ecbaef104 100644
--- a/drivers/clk/ti/divider.c
+++ b/drivers/clk/ti/divider.c
@@ -223,13 +223,15 @@ static int ti_clk_divider_bestdiv(struct clk_hw *hw, unsigned long rate,
 	return bestdiv;
 }
 
-static long ti_clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *prate)
+static int ti_clk_divider_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	int div;
-	div = ti_clk_divider_bestdiv(hw, rate, prate);
+	div = ti_clk_divider_bestdiv(hw, req->rate, &req->best_parent_rate);
 
-	return DIV_ROUND_UP(*prate, div);
+	req->rate = DIV_ROUND_UP(req->best_parent_rate, div);
+
+	return 0;
 }
 
 static int ti_clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -299,7 +301,7 @@ static void clk_divider_restore_context(struct clk_hw *hw)
 
 const struct clk_ops ti_clk_divider_ops = {
 	.recalc_rate = ti_clk_divider_recalc_rate,
-	.round_rate = ti_clk_divider_round_rate,
+	.determine_rate = ti_clk_divider_determine_rate,
 	.set_rate = ti_clk_divider_set_rate,
 	.save_context = clk_divider_save_context,
 	.restore_context = clk_divider_restore_context,

-- 
2.50.1

