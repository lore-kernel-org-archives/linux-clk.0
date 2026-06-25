Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE26E1F09AD
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 08:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782376269; cv=none; b=AQEMWnPsLENEoRyVu3d7B3DRGGpdcZMle0IaX37UcqZeQwz/x5bR5GsCEFEMLStipVxaPlCfQ0BeOVzCiihidfPUgs4q0qjoBtOYA8Aa/xD00HaKiZlEB8iwkAdPbQNbx8nAEHyrHWF3hntPMEFkTSSuu8V0jqTYtmkUvvW144g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782376269; c=relaxed/simple;
	bh=YDcPrHkJi/CP0+hH5Z5P2PG3DE1JTmfY9E3YspgvTXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qtOeg9F8yCpO/Vx3poYFuwuh139TateuNBOSFsw/h2MLAl1hnFxaQ8rBJah6GEIcVkRJlYInJlU8uQYc39loPgjDnkSmH44vOyBw4NY99qwvjkRySODHIZcj1ypO1je5AI64sOBFDH7F+4/xuK+1VuZi0N8u0tuTg3DlVKgvSlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJZ7FCKZ; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJZ7FCKZ"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-399735e64d7so24068181fa.0
        for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 01:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782376266; x=1782981066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQyviYMg+aVt/DDakTKU2XMmEryhOoH3fsRqzwGPnVE=;
        b=UJZ7FCKZgaFz+JxiCuwIoyYeOw+iGM5s0s9o6g1PD9J7Fbnqga1AXZifmzpmsPsjeG
         NkJhoaSJ6ZqQ0rW7yME6BV0P6XZgl7iGMYpEsBurLh3uJmNVlgf0SO5WF3x19t9Ajw65
         AKILgnJgtMNvFppJLnWuq9GichTzdCR8fb491CyNMGydAWYb5BmG1aK6KeoPjPiobgZg
         kQq+LLaUc7J5ZqPhKA3zYLlfyRi/X+A5dHm8HQ1+TYPwGcuHjzT2c9sgkX5t63gXwY8D
         vZdJBZPq20AwJ9wjUQw3h2zasRkJU2amDA+IcWfRimXOD5n2zUBgkMstg2wrzJEoeVJV
         quLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782376266; x=1782981066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hQyviYMg+aVt/DDakTKU2XMmEryhOoH3fsRqzwGPnVE=;
        b=llF/vNlK3lA9VLfxLJktuwvog9Ix9qRHymC6mEKD1ELgkavt9p6MCFrX8yRIdcG2ip
         IbHE5kWVJQHJhek2i9CASmIt4vVx8SHK/yR43M1VrI136Zmn+5IUv3eZ/ntZ/o5P/5Ke
         JCHaDMqWb+mx2SMU29wYkz3ANRYdRLdBU9aIQYapy4nLSN4lZFrE5Zugy30uudZdiUKC
         osbN1wlEpu4387X3hJhxyy/HJWv1UkBApOX6bj9hBRAaXFl2x04BnbM9jARrcazoPjUR
         ljkLkgi0U3n+P3tuE7YTPO94zChsDl5iJ0u32qdJ4S824BsmVqS6A8fIRbeMs3vLIxBN
         1Mmg==
X-Gm-Message-State: AOJu0YxTfMINkS+5YteaPqsh+ZnOJqtjYkKdkoyNSWU6yrtPMlFlcczb
	q8YPaPxWbZoGGhgp5wnZy2qm15wmLiZL/DPSmbXhU5q1NFJ2OEnlPs1w
X-Gm-Gg: AfdE7cmL+LFuka4eirJqo3zpoMw8CbAfddxT7PJiUNfEBiqx52g7Zvn5co9r487G5zP
	pMHR0d0D5lmUxwndI3kNg9lk8k01yEWklS6YEJLaqOguBez8wqe8kU3PlCnygG7e+gY6QYszCro
	v/xeRUYJsw5zC2Z14o1jsBikqj0dEy2DZ+GEpivwHqYiqJ91DmmXmaWLkhNKuEviyuhkzQk/soH
	paLYg7eIGSf2MmzREmTMKsYmfXg1Ee+tH39z27bal/PnkpkIantyLbgh48rr5wYSFOMpQ+EVYQK
	QysLTQvgRiNdIW+XtfrQw/5EwxqTYhNAhfUueZV4cBhtKOJpDfS88WNXd+azLmc4iJdr5/hNiuU
	dH3JQEADce4c0QcDy4QPZ4v3WUldFvu+btw0sstKKf4vEpeh9xIWzAzWisUqUyJKQdjLQEVnp9Z
	7wr1eMGGr3BM4DGPttwZ3xjMP4S0py+r+HRA==
X-Received: by 2002:a05:651c:1588:b0:394:3b62:b6aa with SMTP id 38308e7fff4ca-39acb606ac5mr4252081fa.12.1782376265866;
        Thu, 25 Jun 2026 01:31:05 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ad317dfc3sm620731fa.31.2026.06.25.01.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:31:05 -0700 (PDT)
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
Subject: [PATCH v2 1/1 RESEND v2] clk: tegra: support 48MHz clock for pll_p_out1
Date: Thu, 25 Jun 2026 11:30:52 +0300
Message-ID: <20260625083052.65405-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625083052.65405-1-clamor95@gmail.com>
References: <20260625083052.65405-1-clamor95@gmail.com>
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

Acked-by: Thierry Reding <treding@nvidia.com>
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

