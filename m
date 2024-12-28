Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E56F2AE84
	for <linux-clk@vger.kernel.org>; Sat, 28 Dec 2024 03:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735357806; cv=none; b=pX4m708bO9aPjpeOsFcfLWZ60z0eHYran1evcBU1P3KnRPV9oI5KzddXQg4tFGhndl6+Y1873ImBDs33CcfBB2PgE8BX7fVU2ZESmulFMX9Ui48YVuLMjq+WTmlBxpy/pTWA0WEijcYrj58xgevdXaQ+8AwzPnK9b7o4lUW3VQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735357806; c=relaxed/simple;
	bh=fvH0RF7Zo/a6HKPATUskfoJOai3V0w03E0G73MSgVK4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VyWvKfCzyBXQ/k5ClDzU7oGUi9IvzNNFBaWg+Xkm3HstBE7iAnNM0N0idKfzvc9mfFzlj0gRJ1jCIiCjfnRM5RYUdpC1SiS5eREz2iyuRh6W1mALsil2LcP3OvgDxkPRZAhkIJ1/joqXNN4Nq48A0UTC6k/d4q/O17mdsaiP7xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=fkmRIwjl; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="fkmRIwjl"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2156e078563so85254355ad.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 19:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1735357804; x=1735962604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SuTTA8de23Bkf5QeLvOrkmGblt50MIGep0UadyVCjac=;
        b=fkmRIwjlFpgDaUw8DC9Lzo1ni3Q2Bmp+AH7xvigIXTV9LfrSPgYxaD6jSNlkcMbrBd
         o//iAS35/FpSfuLjXqq91uywxTKFsKf5g8XQazmHcw8F4ao+fXvR83EKUb96ZV3IG/Nv
         Tf3dw1zaBFTlaUBiosauD/lpnFjLBIrB8vE1yogkdr/GCeYKyC7uf1bTIoLG5KKWAOh+
         jpoST0h4joTLTWwPuwlLBS2fKvrkHijwbQ3yyW3RbigE69PgALKmpkDivw8gS9+CAT4C
         YnS2qyNG6Ntgu9G9h96hn+3lq+yXgknR3ygM+/sCuK0ylsAmURA1+Fr2ndXCd+BQMSdb
         0ksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735357804; x=1735962604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SuTTA8de23Bkf5QeLvOrkmGblt50MIGep0UadyVCjac=;
        b=TO/7XFiSEVV09Gs/+O4JBiuFB6lQTfui96IO8TERa1iRQhqqd2MXv43DgPp00ca5E0
         W+M8a9fk4EnIeUEB/9ZPimekXYoZBKYwAeU4y85e38jfd+bUWPwNRqGR6EvYHWcVqc11
         I/0xxQcoDFOkXBFEHRiq4GNcIIjDa+38BfNpfGj7QLw9KBkFk0Psn4kaHLo+19wWRFE4
         FsxrOju2NJ6Ib1gCARFP8Y+5oemXs0g/llWoxevlnaRfZOkiayH4wtnkAAZnxqUnSP85
         M38iQt3mryDfHpu9O5M6ZiBPKR39qWMQfWRgciKG4LEwLPCdH9jukbQTEgSqW+7xsR9D
         ShhA==
X-Forwarded-Encrypted: i=1; AJvYcCUzwRsTXMn+YUPIWaojiXhFawWqZ/TFadNZ+c6TlaUT0ZITunfa6ApL3Reckrj91kRV9B4wLnIwpgE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbfB13ZTa3nVGkCtUXlyF8wEf4BlPwI0R0or3ai6h9P2G38ffH
	43DyB9GkRx/i1u0Pd/KPym1qbtk9juHdrg1JB7k60M2eU5dBlJ0VnjKWLoFyPFc=
X-Gm-Gg: ASbGnctmlrdIdZV1wdHTaKElUqGqAuBbQ0KI4yY5zDUDCbKCq1EsTcxRHZgtkatz/T+
	dCkkLxXxxh9+lqpIR0Bq2TWjNz0JtZ2v0tdieccJjKz2vWgD+80u9HhSCxORAnuiZijLaThwHLr
	0bzYC+srspY7HGLTAqs6EB3wzhih/cs5XYKZv/t8VvBCuZVYPgd/8y37Cf1dIoeMZ23p7FO5bqA
	NxX1RoAwlmc3gD3/PB6zrgW11tPcwO6Y8oEtGQPpYJsHXmbIWkRQZ+EX9KsjR4WNdQX60C0j8ui
	iyThCj8Z+ww3t1iLQ2saRhPJ/dNgiio=
X-Google-Smtp-Source: AGHT+IHkOItvBJKtEwDGdYhLxchWt5x3C0WxVmbqlvnj9hZEJ0dBynL/ueEHD33yi2OB1BIrLOO8GQ==
X-Received: by 2002:a17:902:ebc6:b0:216:501e:e321 with SMTP id d9443c01a7336-219e6f2700cmr441582665ad.56.1735357804579;
        Fri, 27 Dec 2024 19:50:04 -0800 (PST)
Received: from thelio.tailc1103.ts.net (75-164-218-15.ptld.qwest.net. [75.164.218.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f6922sm143403615ad.223.2024.12.27.19.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 19:50:04 -0800 (PST)
From: Drew Fustini <dfustini@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yangtao Li <frank.li@vivo.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH] clk: thead: Fix cpu2vp_clk for TH1520 AP_SUBSYS clocks
Date: Fri, 27 Dec 2024 19:48:04 -0800
Message-Id: <20241228034802.1573554-1-dfustini@tenstorrent.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cpu2vp_clk is a gate but was mistakenly in th1520_div_clks[] instead
of th1520_gate_clks[].

Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 drivers/clk/thead/clk-th1520-ap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index 1015fab95251..cc81ce6bef64 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -896,7 +896,6 @@ static struct ccu_common *th1520_div_clks[] = {
 	&vo_axi_clk.common,
 	&vp_apb_clk.common,
 	&vp_axi_clk.common,
-	&cpu2vp_clk.common,
 	&venc_clk.common,
 	&dpu0_clk.common,
 	&dpu1_clk.common,
@@ -916,6 +915,7 @@ static struct ccu_common *th1520_gate_clks[] = {
 	&bmu_clk.common,
 	&cpu2aon_x2h_clk.common,
 	&cpu2peri_x2h_clk.common,
+	&cpu2vp_clk.common,
 	&perisys_apb1_hclk.common,
 	&perisys_apb2_hclk.common,
 	&perisys_apb3_hclk.common,
-- 
2.40.1

