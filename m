Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C043382EB
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 21:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907119; cv=none; b=ltRXfSht2RL/WrE4R3Bu8XFRcOyokICrZjtGixuNebi/2iW98Vr8uQ170giMKRMRXZMRw3nzHvCf28c4i+p0JguHWCUdrQewPt+UJXIZ2J+Ip1818qb5l6+4cKDeLO5f4D3e0QF07n/ZeuqHXUHQb0r9MIYIi1bdxbM3f6D5fuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907119; c=relaxed/simple;
	bh=jKoFCsEBXQYv3wszRGARIkmwQoIgPv/cscixawXTpW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U8MyxhmERtCfOQ8bGRP7hy0Hvwg9ZVWqjKAck4aOqTMmQtNt+DEGk8GBrt4KgflVcNUsiT2GgKhPsgX6kZxo2u7kH3+6Oy0ExoVXXl/gdYvR5xjNmU2x8aS1AMGGHU/HOzGek/s5UKzh6Q1Ttyar4+c2e0uBnTkuPOJzECDBj58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=crgE1G+j; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fGyJbHGM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="crgE1G+j";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fGyJbHGM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G319IdeSa6D2FCy2w1nMqWvaYhCLIz6HSe4OLMwnyMI=;
	b=crgE1G+jaNB6oU1yignyiaRRjsCdrHGRbbLF1mtt1i/yzMX8iLklbgjbOel4fw0En27vGS
	73DzGhK6hP+YKB++AAIKBape8LBWc5h1BULrzUGurGQVlzcbHEoFrhjMCqBe+ZePm+r75+
	kvAoGC4Utp1j+n2+OeZmDJbc+0dCvig=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-OehpiPVGNvWgg8bpO2vmAg-1; Thu, 08 Jan 2026 16:18:31 -0500
X-MC-Unique: OehpiPVGNvWgg8bpO2vmAg-1
X-Mimecast-MFC-AGG-ID: OehpiPVGNvWgg8bpO2vmAg_1767907111
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9415ceb0a03so3858998241.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 13:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907111; x=1768511911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G319IdeSa6D2FCy2w1nMqWvaYhCLIz6HSe4OLMwnyMI=;
        b=fGyJbHGMmlZQFzeagyMJdCWUEXtXCpQJBtfJdDapbBWEpaC/iPCRWfrGg2/iyf99At
         1WTX4WTztamFq0wvre51W9alO+dnXCr7E52McIV0ELAgG7RYHjzcqZssHOQ268PzT9Io
         mA+HDUgQPSGJ1Dzi+5E9wctOorbXi5fTJZeAVG4HIiMno+FV+azZR9x0NCmR0EHOAL12
         2FmFPFjJS5qsJPGspvAlqqX9r5ffHdqj0RDHXHtPImj7azmaOSWDyekNxP/gi/ZtX2OG
         3K9/neD4zcQvWg2i6cR13qs8j4JS9tp93TQkLcxZr4nbUBwOlsDoewmZqxGXm7cnRhjt
         Md7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907111; x=1768511911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G319IdeSa6D2FCy2w1nMqWvaYhCLIz6HSe4OLMwnyMI=;
        b=v5WF58Drkdouoz4u4BY9wZrz6TL/kHtEYsGbuDr/Y2lLzFIjTsSLz8Hc3PzTHAgO5m
         V9NYftpLSbH55IcqQGi7r1d1BuBQOua4xH0LCO89Y6Uzwpt8qu9rFcFmBd4YfaZs2CDN
         I07KHNTvzklCCYHGZe/BKtToMf2/cJamIcNb1CnJMAQ0StRe/wR7LUP8H0niTdJC1Tk2
         4fbK9Opn3purownPv5opizXvrLZWbCRTtAB7lvnbOJGSlAosYvMvL4203ocGwshFaKZv
         5D47lKEpBi88lcKoqScX9GTDTvFHZUpazUq/f0d7NRwRTaKvaR9JfAfP2hmZaki5R+/z
         08xg==
X-Gm-Message-State: AOJu0Yxa8aCrTBL1dAMqtEom/33y2p0TBcakx+ABZU3TPUpJEtdVG+PN
	gAYs7f2sbV4C7bTnPVhfabsbo9b30C3pOF6VgHTsqBmKLRvK5CX4ecT16JmgaOdhTVOQi0cJtWP
	xNOAZ1DK+Bt6pJJSZudM9gwD91/pUkTX7qbkgpgQJHrph6e46to7TG0OMAu/fpQ==
X-Gm-Gg: AY/fxX5EdgRGirKci7CilTwkDmlbTfaiX0FgbaLd6HcAU5qa6o3/U4wZo+Tief9QfP+
	51mb/hfd9w8M6aOrGnj3fNSxhxJzKIo95nfN0beOjza8MAxkw8ubdtUZcxZCUckERrCToO8SBk/
	rCG1czorHYb1i1CmMH0Bs0Fs6e9HnJEvnb975Bv/dcL8PbdDSz7f3/RFqhCy5nLenbaM96H5w7r
	wDvez9HTIWl5tZwtGZl8iPWQ2eT5JjC4pzmTLR0fw/juUwNySRUcExRMQeTLfbzF+qOdKjTpuzh
	84nzjxTaulfN20/tVfTBek4DNWj0VWNVDUWqk5qWybFvoTMk+jC3c+n6Lfe3JeehREXS6Z/He0t
	SRDZm/ptYHs7oeFA=
X-Received: by 2002:a05:6102:605c:b0:5ed:c98:37d6 with SMTP id ada2fe7eead31-5ed0c983b74mr2379684137.2.1767907111127;
        Thu, 08 Jan 2026 13:18:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQG9r/cfeCX4euCrFgcXsjUzjAkSa0Qn6QkdRAVCwULp0yuaXtFnMp4bzwiLqhiT0LgSUeTQ==
X-Received: by 2002:a05:6102:605c:b0:5ed:c98:37d6 with SMTP id ada2fe7eead31-5ed0c983b74mr2379668137.2.1767907110607;
        Thu, 08 Jan 2026 13:18:30 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:18:30 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:34 -0500
Subject: [PATCH 16/27] clk: qcom: regmap-divider: convert from
 divider_round_rate() to divider_determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-16-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1569; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=jKoFCsEBXQYv3wszRGARIkmwQoIgPv/cscixawXTpW0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5HbUHDGfOfna4u2eepsUzj3ScAxyq9zPfaPF0HHJU
 7F1Mh9bOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjIcj9GhtUClxmE8ztenimK
 Lp2i/MFFUnSZ+bLL0jHF0/bKTt+gYMDIMHdhWgNXdo643aoNdk17ND8Jc0S9nhieKjir/fdri/Z
 jjAA=
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

Fixes: b6f90511c165 ("clk: qcom: regmap-divider: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
---
 drivers/clk/qcom/clk-regmap-divider.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/clk-regmap-divider.c b/drivers/clk/qcom/clk-regmap-divider.c
index af9c01dd785372166122224e717c119a2365f4e1..672e82caf2050446d14e64617a4b90d0b09201a4 100644
--- a/drivers/clk/qcom/clk-regmap-divider.c
+++ b/drivers/clk/qcom/clk-regmap-divider.c
@@ -34,12 +34,8 @@ static int div_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 {
 	struct clk_regmap_div *divider = to_clk_regmap_div(hw);
 
-	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
-				       NULL,
-				       divider->width,
-				       CLK_DIVIDER_ROUND_CLOSEST);
-
-	return 0;
+	return divider_determine_rate(hw, req, NULL, divider->width,
+				      CLK_DIVIDER_ROUND_CLOSEST);
 }
 
 static int div_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.52.0

