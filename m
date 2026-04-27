Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D433B9D83
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 13:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777296309; cv=none; b=rzxjHy4HopR5l1+yPTs9uy6o0/r/JRJCg3kO8h6Edv3mh65b9+K2SQTXNgT/f+lH7lzSPG2mFS+DhY/ZOaqCDBBlc6xABS6D6gN4x5VKogwFjxWtv4N8PGygQJDjF/LUznBhi2GAL6H7XFxQm/CA3Ovkhod9FF+Y4+I91un57hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777296309; c=relaxed/simple;
	bh=c3R/swjZY4AwoGs459klumnQ8ywJ7rDXnjScQrebkz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AieO+rzS7Ah17eoS7lFJnYkdLlG3f3g1RiU85Q7n5DLh5DrB8d0HFItwHKIUX/WlPSW2sGWPRGGkK6+IxzbD2ZuYhYo5lb3bUl90kNozJVIRW4chvfOtz7fUvL4TouzgUpiWf9Vy+4Hbq/PppgJxTqlzzBqK4mdhBe0TF5IyR0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNV/lT6w; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNV/lT6w"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43fe62837baso6009537f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 06:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777296306; x=1777901106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VgLNT+dcdf1dMnPDi6oMraw8/VencpOpP+MRjX9HkY=;
        b=VNV/lT6wEsOMYXa3LyIJ7HpYKryuT3Zr9xoeQRZlgLo0/9q6TNJ8lLSPuhHrp0yiwf
         ZGIn2R8YRQzQDPlJlimn/ygNUWezFG1PtgYh/uPWEebDFWXTLTPy558OjZE2C0MEg5u0
         fRbl0HeyR0an3eMIKm5PgL1UsiHbXXXsBblx+F9KGa7A4fLD2lBt8idhLiGmPxPFqMSX
         I9hJLqgE8JFeJQt/ByFyDFNg37sUolSFNsjFtyP9cLDVOqLb8BXw2iLFCcItn3gCXHfL
         PdzL0lvwRypGjRiOMSuNBBFMXfmNKNwbWqm9xRwrcZusdt1V01B51mFwTBMydM1r0yXK
         wxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777296306; x=1777901106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5VgLNT+dcdf1dMnPDi6oMraw8/VencpOpP+MRjX9HkY=;
        b=EgVRXJoqVtCgDy+Z1aptWg95UE52a+RTJ658zxM0qSDCFIm9d2eJuzEv1Up85PhWEy
         UUOnn54BAKky7cKnfx9KCWqADU+HsAPkPoTlMZ3/xBmkoSBUkIDCHM0i9cBueaZrNy/q
         ecqnwca/rSq6mntfDwAcayh6U7qSOAUYSs4AB4+8f7EwXW6xGqRIrNgYVe0YQ+jLVOAv
         zGuOMyt194Vsr+p+acaz6Wujz9qSGI14WspM19d7X7tF49C9NlZiIZ7uBVsaE9L25gRF
         P/YATLqeYn0zoSbtCmmbjDPsR4fWm0hGcYjEMFLFrX/1zGtC6/0M6NndCuw8e5hTpam/
         V3Ww==
X-Gm-Message-State: AOJu0YxhyYO9A1bRbh/KL++4uePPWaHMHngXV8ihf4yTVKesc0xNvhOq
	y2lLS46TTu5hIFEk3FvOiIpTqHp/vC4AWlKJo2SMpG0kLrZvYMAu4Rx5
X-Gm-Gg: AeBDietEt6fI+MxnWIpTR2msjtSb21MWYDQSAsdvP2A2TyVJkseRbbYsEiQZ8/4gbv0
	9lZzUHSsr/zmT9BuZLjQBWZ0KKVhFUD19eXn8ozrM7Gd9EfEKJr5957bMTHvUiBC6hwkHooOBb4
	OxlfP2MpvZDdgrYViWo44K3lHBwKB7NQQhAfKzfbKWBQIPYyg7LI+fQEon0170K7Of1Wsj1K9WE
	yNSTN9f8u983+puL6jpwPTeW/8TrJMNAn3PLE3YqNAMKlhCsIOlLGOCQ90TIR3ejYBTz6/Nmg6k
	A6zrYeo1RUN2tkuPaEVyqvUhvqa1ZVzhjvWcEKlqTZIJ1UMEy+8KlQQD40zjkJMRDrv3ge1EyX/
	G0W41zGe8yeUDQc76bjZBYmdLGaATTcpoMYuC4iSSwIr5B3vFXI0yk1uys3d037HDjcSMHgzkhD
	BxuwPP4jhppQmojVs16+033+PrtDDf3DmGpQ==
X-Received: by 2002:a05:6000:1a8c:b0:43e:b0f8:66f1 with SMTP id ffacd0b85a97d-43fe3e0b86emr65122947f8f.43.1777296305936;
        Mon, 27 Apr 2026 06:25:05 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a166sm79933901f8f.19.2026.04.27.06.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 06:25:05 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] clk: tegra: support 48MHz clock for pll_p_out1
Date: Mon, 27 Apr 2026 16:24:47 +0300
Message-ID: <20260427132447.118272-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260427132447.118272-1-clamor95@gmail.com>
References: <20260427132447.118272-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Dmitry Osipenko <digetx@gmail.com>

UEFI on Surface2 sets pll_p_out1 to 48MHz which is not supported by kernel
and causes BUG() early on. Add 48MHz clock support for pll_p_out1.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Jonas Schwöbel <jonasschwoebel@yahoo.de>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-pll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index d86003b6d94f..adfb74f111ef 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -575,6 +575,7 @@ static int _calc_rate(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
 		break;
 	case 9600000:
 	case 28800000:
+	case 48000000:
 		/*
 		 * PLL_P_OUT1 rate is not listed in PLLA table
 		 */
-- 
2.51.0

