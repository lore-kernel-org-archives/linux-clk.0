Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C18296BC5
	for <linux-clk@vger.kernel.org>; Thu, 11 Dec 2025 23:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765495020; cv=none; b=OWy4PHeCCvgoPY3jNHQeFKYm0e874A+5BckZWHpinzU3iwcmZcXl4SfEJjFBJbduC+No1/oW3xGDivZo2mFGyGMfj8HbdLUIDK9yM58ZLbJLnGfAqDl24HdBI0qTceSyxLc1ZkHWwMLIP1gnS138rD9GvPOCmmDuDvkep51swnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765495020; c=relaxed/simple;
	bh=b7GdsrXKjZPd7UPmB5Kvn1MxBtjV4+5gYAk+zH2wXY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F1h4LymhiXgUovPn9xub/D40uLeNCt0HucXs+w5lHAgP+RH/oZWnDgAUQ03hgOE4HjSlec8qWobxOu9wl1Z3NJv01zerUNYRsgSMAiyNr5iaKqxfGIvBfKqpTyC0+7Rht6sCMwvyUMknuRliWfrSGmXLKUo1swORvdvZviTFqxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hx3VIWw1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=e8LsmxX4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hx3VIWw1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="e8LsmxX4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765495017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CWALxHwSjMipreZEX2Qfe1SphmPwPCWuPZgQtUxY9NY=;
	b=hx3VIWw1g/dpeYylkTZtdcxpBB0T9t2KJkyKB3m7w4UFYFIno0bS9r+LoicOIpA1FVnPtT
	XsLPCEX5WmxnijRdh1LHTLdnODoXnGKRFz1TMmUQSS+movyuQRiU6TZ1uqF/cC/P/idIvz
	bWjojXkEhYgKGEl+mRAfGvo+N/6paPI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-DME8KNUMP7exwJbOADVJvA-1; Thu, 11 Dec 2025 18:16:56 -0500
X-MC-Unique: DME8KNUMP7exwJbOADVJvA-1
X-Mimecast-MFC-AGG-ID: DME8KNUMP7exwJbOADVJvA_1765495016
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e2342803so157236585a.3
        for <linux-clk@vger.kernel.org>; Thu, 11 Dec 2025 15:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765495016; x=1766099816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CWALxHwSjMipreZEX2Qfe1SphmPwPCWuPZgQtUxY9NY=;
        b=e8LsmxX4NP25VSlkdYPuAvd8e15aEP19FLEp4PNJ3/ZyRWxuRLnOmNwlJ4ku94hOoh
         kcgTiUml1PJhg6+08TaMeMMVD9Ve4Kr5LuxiVLampsz4hyFs3sYveQ9qjVvlQ4rcpJ6D
         ZkW9rOW5MisSdwmytM8ftirgqJJnZrgopOvmKy8ICWtLlFoXUpQfxtzIJ7OeihywYHf0
         baNCx+THMt9POPc3G/3WMTwmnHm4u67xd9C8+jiFZ3L5/1NaVtdWYPIxU5ktLmVMjU7d
         CnNpv8dMwp7CehkS8LdpqSN0C5MQAHjv9zAr6HYnsV4SdJxua07f9gcFs6V+5efRr9Ub
         fW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495016; x=1766099816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CWALxHwSjMipreZEX2Qfe1SphmPwPCWuPZgQtUxY9NY=;
        b=tkxIME4rmtLaOxURc4p1hdi3EseGsuCdDj791pvErVC08EuR6Ro9/qoUI9wa/YBahe
         Lb7TX7VOCIrsRZtM9gkc0dE2ekUZZAcQXrBHqpoL17tLyYmBCsVN89xbx0ti/Wy7Gy1q
         TUjfPbRgYQ2A44ex+qxq7e9KysdIFCY3Ly/K0WU6DWCwRMuTG/Zk3KPAqvrFYezyjPKW
         4I9vP2zdnPmSI4MNzymCDV2eGpKINO2hWoKHfKCz2pTeJE6+lyV1gsWtFYl6m8KcE2gw
         FUk4Fq9EsJ4zFBd3utYPZ/BYHXgqC4JiqaofOtY6If0K75tpx1dozcc5CrGMgnQV/iyb
         Tp6w==
X-Gm-Message-State: AOJu0Yw6JmZZRCJ0Jg2H84iPgBGG+8miKQ57iF4MCHKcbp5XOV3IqBiU
	2GPjAIMRKASdsw9W6yTdjFJwvF/XuE2Xorr0waD3KzHHfOaRakWV3UEPvyvBkHaFrbAfxS74oYh
	GsImC6zlkIJKhNMlRIzzyXayY/8ZwZgVD61P1PiEtB6xbdCzVUo61aXcyNVDZSg==
X-Gm-Gg: AY/fxX5fe8exbgYOJ/UInBAQQnqIpw9wxUc/wJLE3RvsveLsorldYVLpyJHafgByNGA
	ISphm/7Ol7qmsj7sHHyzjJIlDgEIugXDTCYJKTYZuNznJMl9jSnn/+0jL2yNa7LkqT0yJZb64Wu
	AIlYGGegjHimd32l/uFr+YDj2Ck5yoy9SZm5NnJxg8PplxJPlhc/wy072mBw46VHFjI/T2VMB0L
	H0akg6KmJmPZwNkdK+6gv+sgUc4hCLrTFS29NquIRMc7YU6N5+YlbY7+zdqzGvad8SRJryKYO1M
	6A8S3m6hVcI8C3HnWKQSklugZumU9dQu8CbIAHENrUNv6yOatmbBVZHzfuIjSjOzvkomE0sW9dV
	MS+lkoSlLk01r8rdLE9SjITGD42sgWetpervLMXcDQcvICCtPzd/OZw==
X-Received: by 2002:a05:620a:29d2:b0:8b1:8858:6ead with SMTP id af79cd13be357-8bb399d90bamr39281285a.11.1765495015847;
        Thu, 11 Dec 2025 15:16:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2s8wwcOmxwXaF7bKZgVpwocL48364JqbwVZMFBYNgdRIsZcitJ0mH0HHmDGJg8J0urTG96Q==
X-Received: by 2002:a05:620a:29d2:b0:8b1:8858:6ead with SMTP id af79cd13be357-8bb399d90bamr39277685a.11.1765495015467;
        Thu, 11 Dec 2025 15:16:55 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:16:54 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:20 +0900
Subject: [PATCH v3 2/9] phy: mediatek: phy-mtk-hdmi-mt2701: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-phy-clk-round-rate-v3-2-beae3962f767@redhat.com>
References: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
In-Reply-To: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=b7GdsrXKjZPd7UPmB5Kvn1MxBtjV4+5gYAk+zH2wXY4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy4eruXZckDLUdGk4NCf1DMH3S23NTlWqza05L27d
 j9Mk3l3RykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABN5vo3hv/s5eRZ5xg+sCw0l
 u954X731i2Wfsyj7rWvTHExexWhducDwP2M694nJjgtaZ3hrX35Y2b7FPuB4oXXsynttk8VNEja
 v4wYA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
index e51b2d13eab473dddace48c75c2a8d73c8c65635..b0b6497e7eedcb6867541b573d22156ded29a4d5 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
@@ -90,10 +90,10 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
 	usleep_range(80, 100);
 }
 
-static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
-	return rate;
+	return 0;
 }
 
 static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -170,7 +170,7 @@ static const struct clk_ops mtk_hdmi_phy_pll_ops = {
 	.prepare = mtk_hdmi_pll_prepare,
 	.unprepare = mtk_hdmi_pll_unprepare,
 	.set_rate = mtk_hdmi_pll_set_rate,
-	.round_rate = mtk_hdmi_pll_round_rate,
+	.determine_rate = mtk_hdmi_pll_determine_rate,
 	.recalc_rate = mtk_hdmi_pll_recalc_rate,
 };
 

-- 
2.52.0

