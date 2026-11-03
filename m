Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793739312;
	b=ONgjGZwKqJ4WRzzKDNp1wP7yCSbIgdS3fwDcC+xsOtL71K6bgnm1/GcTtIJyLQZSmEQb
	 FqqBtsCMR6ArtD3TEptqtkYFn2ieVxYqi11YTpkbWynMrlNNQoOAfHkk7HeYhvnmq6jGq
	 LbnM5EAJfKMbZ5y7mHYv5Dhrsh5lrIYh8zlG8mx9h2Q/pUk/bJFcwQk6wE50go7nDDCtc
	 BgL8Qlwt8zZPhIn33CXkDvwpPB06to2RLeE4VPhjhG28MGl7Nl4ZpcyFbwXU93YWxh7jV
	 iXpgacSYrZTZsps2j8IRVSG5+Xe5y9YLAiW+CUSlt8KuedIw+OLA/UrmCK5dpMKVRQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=44YdnT3FrvnSPbi/6PZhMIt12/MJQAk0jie83bLJIM8=;
	b=VcKuNKrdsW8ON4M+PgONsjTy/tzz0F2s+hsSe4dV5h1oP3UIG5Is40iUYS7y8dLaBRLI
	 bL28AjZ0O7TD5r+7f1TjayIX+/bRzRK3VDNZbyuL26sSixixXPegTJjuIKD5MAZJIMgKf
	 ein6nO3z4kTmsKsCi/bcB2b2saPr+r5Or0hTCSVRLzNOvcyewkJ5GKHRdJbuwV3dy3FNS
	 UxS2lkIXK+A6W67CTJW0Va5WOgUqM9xTqvxOLEMjwO78nkaEiRcPfaUg2HmZhndHt+pzj
	 k3QiXNizPhS6q6nqcei5tK94TEnXWD0NOwoxKNjozC346DXB+R9Uf3sNbhjQPx0B2PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fj9AgbR1;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2357A606A324
	for <linux-clk@vger.kernel.org>; Tue,  3 Nov 2026 20:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2357A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fj9AgbR1
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so37584385e9.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 12:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793739310; x=1794344110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=44YdnT3FrvnSPbi/6PZhMIt12/MJQAk0jie83bLJIM8=;
        b=Fj9AgbR1+I+QzR+o8I8/tdPP/AeAqQ1cMIaypOuhBUDR18vlFrlwBIWk1yiYfk1FIV
         C0Mvpmkuj62PNA8zbSZ6svX55oIXtJ/fNLCNf1iwq6jrTE1ZCukylpDxDksONO02CyV8
         EqnlQQdsU5FOtCy3waP9IkfR+wq5oE91+fSeLQ8FEaIZIfMhs2Dnx9Ciws5f8YVv02Ao
         8tzdQBUn77JNAxZrktoKn3kYJSLyA5Cpo5eaCDC9CEgC6CD8ScQ8GaRm0jGw8jEPtQUY
         1hp34aJo30vYwt4mmt8L6PlqVWlqCs+/sojow2vnFSJSm9fb3S2K4tu+/YysI7htSpn8
         BM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739310; x=1794344110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=44YdnT3FrvnSPbi/6PZhMIt12/MJQAk0jie83bLJIM8=;
        b=X29wuPKNkMHApmV82lwXBtExExi5MTzjcUWL2UTD0Xdcycc5xe5aymPuop7rjFb383
         qrEQ2VfKoVhrqo4Hwa9lR+MAhbXhAEKP2xVd5ulVgTrbIq28CTJkfTvzFh/raBmJVxSv
         CcwuFWosj9X6+BmHj8GbBmUx1YC3tgqc/9zy5nWTM65rkgXtgeFtMU75DYOyRycrAN3O
         J72D60wcwRTf1qyMX638+qRl+CJlC3GWfFczcprBt7m3YL83Bh9kVA8K0gtGaToytD4d
         x2raeqlnPCHxaPhlXAIFtgGHlKlRKQv8Iq3HVNcp36p4el+FLzuyp3yVF5ng3vLzTEt2
         iSoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuGgeO0VELvqmv9EDqmR387ck0iMCbD9OG1y/WObge5JrNTKNhIzUp9nkb6AOLVzSgzI/9SqMy2xE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8ZUI3ornGef+3brtDoSWDVBz1W+ACVEZU4jXg6ZdBYxgvtGb1
	68JHg44i35O8OTnVp0UtJMXInGjFFwbN1k7sUs/7pKQj4fAc87SQzPyHKIqWtQ==
X-Gm-Gg: AYBFou3afQQp2krgoQG+Sh860wwUISDNPU5KPsDE+srpRpJeTdJW5Hz+0NjrBd1G53o
	xHjATGJC4+X3QaeV9NiM+0G04T+dfPkh2oRtt36ZynTVFUJDp2avznp1vxz3hJIaBvV71a9e3UJ
	U/qJU4/WP2ZrHdDkRrt6irsnV+VKS7qA1Ck++RI9D9rTiLyJ1/wjQWraxeWbKITLwFxW6riVRGn
	9gtePAjZC3ECxo3/JkmwvmkAzLqJgJt1ihQafOjPZ7kUfYdnDoPpMwbOzGTProJTOC4oEPSjQF8
	a0tp7hcZv3rpt9E8CRukRO/qZSTB2PEisDh2llM3WAiSXOGIDZ0RVbejkwRpfyvMHXWeoQSQ8HT
	dkXrE3MYU0ulv2yW2DFNTrSp9PbA5MucWsIGlOUADP/25/ouaE6MSYreg/DsZq+feySl+kj5/Cs
	2BESmFjEFon/QYrqu9zI9DF9BV+S6RhtD9lkk0/RZ0fpN/f0+gvoF9xPycSRyj7k8HyIisZUUwd
	pcrm2KHWwThIDJu5QZgsBILRtaWVTXfQWET4I9aZa3wH1eGJcXZLwZ06+5X3VZO+lm/KejZGt6R
	YeyW0Jfs5Lks2j+T3NEixwgP3tU6olO+8awVkWgAQ/eT6IUO3MGSNRetViy+D4P9pedsCv+JEJs
	4hbIcH3vhGQ9ZpmW03ZBPS7qeWUI7OnZ1Xw==
X-Received: by 2002:a05:600c:8b2c:b0:4a7:a5db:a93e with SMTP id 5b1f17b1804b1-4ac150b3dbfmr345099075e9.4.1793739310451;
        Tue, 03 Nov 2026 12:55:10 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b43457595asm1140405e9.4.2026.11.03.12.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:55:10 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 0/2] clk: en7523: full clk_hw + set_rate for en7581
Date: Tue,  3 Nov 2026 21:54:18 +0100
Message-ID: <20261103205500.14974-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This simple patch convert the en7523 clk for EN7581
to full clk and adds the .set_rate OPs.

Needed mostly to configure MDC clk rate.

This will be also implemented by AN7583 since they share the
same exact implementation.

Changes v2:
- Fix recalc_rate return value on error

Christian Marangi (2):
  clk: en7523: convert to full clk_hw implementation for en7581
  clk: en7523: add support for .set_rate for en7581

 drivers/clk/clk-en7523.c | 222 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 198 insertions(+), 24 deletions(-)

-- 
2.55.0

