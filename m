Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305D834404A
	for <linux-clk@vger.kernel.org>; Sun, 31 May 2026 09:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780219677; cv=none; b=Glj6zmv8m7K3nccd/nuEvl1NxjNHDSMYw29WIg3WMHl71oODSUZ+KSh8qLXdRGb1W6bWFs5+CTQw52uYM7Q/lChjVjY13rToMbP5tXIIOwBomvJQoZafSzqsp1NNPMqsytyATggjPRiV+VR1HCybo6LH2OkAJ6vNH11+L3KggLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780219677; c=relaxed/simple;
	bh=YDcPrHkJi/CP0+hH5Z5P2PG3DE1JTmfY9E3YspgvTXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MIO/e5PLBkcr0NxLpNmMvCrm6NnscG2rYR1IAPABBqTeDoFJyIO3RTKWW7gnWS6SWvRfxgTo3jVrzbx2ClmKTTrizsxhBdr2K3M0iGe+HaC/NDZ5HsDuH3WMY7p897cPbrfnpXru4fqeF+3zJZ5ZpFniDlxZQ6jrVuIDVh1unI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jt3hjbJ3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jt3hjbJ3"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490a7876f8cso2802465e9.3
        for <linux-clk@vger.kernel.org>; Sun, 31 May 2026 02:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780219675; x=1780824475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQyviYMg+aVt/DDakTKU2XMmEryhOoH3fsRqzwGPnVE=;
        b=jt3hjbJ3Dy89ZKLdRni2aD7Wk/ciUHmiwVAI9BWU2IJOoneB3NB2may6iJ669+g+sa
         S3jFw69TXTCNs1KJOE7TT89to7AXo39lsny1y40BwNrBTW6QBkxO27HPf55vXL32UnV+
         MtK2D7KRQpEJwiwgFwXQrW6FvvKWKEoSJB9+wl4I0eGLXnGk1qHMmdssZFuZFjdHUNLt
         H0gakAE0Dfu8sQDBsGLxyRJYWimh4kTsLjbeo9BGExh++2ONl9+Vk7ys8diqAVJzjapR
         n6t/rwJtVfRfusudsG/RKjcgfY9E4m+4zcadGDss5pvuQYHCiBcnZrzUdGLvAazSBiWM
         QuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780219675; x=1780824475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hQyviYMg+aVt/DDakTKU2XMmEryhOoH3fsRqzwGPnVE=;
        b=g3VtIkDb9TrFHX6+BYlk12bCY6H55UAtSQ1mZ9/A1FgJ/dblYhdDzLUowONDTp4ruC
         vkWgL2jH57alXo4x00+izqyHW8ExBpTMS6NByfDHqRe9HQFDw2SDuv9rpYUl0mm5mKHo
         92p5Qtyfbj5+ktP+gECNuZDNTw7Kwr7xArvpzP0r4I4xAEoRbZm4KMyoUCpJugERGgUB
         teMapE/Kq6wtZG+/GO3KLRiMdQ/dpV3Q+owcmd8A9aQJNG9nHtXYfTpAhF/25gJhLKRC
         Z+cpXnJGDc7CYUead6ka7h/OD1vJNFTsiHV72uAAaAz5RxTf4vMEA1IE03Mdvx6kkpmo
         DDWA==
X-Gm-Message-State: AOJu0YyHOh7LaItUzpmo3G5dfq/l3ZX3cPlEuqaEJZh/1BxuNWZdeIoh
	dKRPzwYKo9ShubvHqO17uK1PCozS2LLQaKa4EfRmBza6mKxW2lefIl7a
X-Gm-Gg: Acq92OEvay4PS9oLCJfuMewml/uB305ob5bY+8lVO4EOu0P8fbFjQcnHN1wntnajFfi
	F5DFC5KYjCsqbJrP8ymFllyh9hpdWlwADaNjOQkjP2YkTOy1AUQj8+UeGTHIM0z0Mt5AQ3gdA4U
	gZPSIyh2fMwNGFqk7s6MWLtT2qMKdRg0gCQ1G67R7dVyJuGSEuiyTtgviqOIrFREoQFE6mNbJk7
	fGm9kdvXDZCZQFeQUB69rC9vSjITCvA3HMc0wVF6bp1I6sJfGCpPFv8DHN/Lp1LbHNl7PzliFrS
	26Ubk6GkvbXpZiaHEJEbjVlCWZK+zm9IMZZ+Map65kMe1WgbnCIntJ21cacDKxEbthNLmVXAvBC
	CjZtbriqAbKp75zuQIJi944XQs7joS47GA96qTQ9IB7aXiPwNEDu8Yn3N9867GQM7xsI1Obs++6
	p1HMBbNEjXcvWDRUIwn2QOmdc=
X-Received: by 2002:a05:600c:1c21:b0:48a:58ae:993b with SMTP id 5b1f17b1804b1-490a2941cb5mr129987905e9.16.1780219674543;
        Sun, 31 May 2026 02:27:54 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6a0e42sm163976435e9.8.2026.05.31.02.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 02:27:54 -0700 (PDT)
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
Subject: [PATCH v2 1/1 RESEND] clk: tegra: support 48MHz clock for pll_p_out1
Date: Sun, 31 May 2026 12:27:45 +0300
Message-ID: <20260531092745.12738-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260531092745.12738-1-clamor95@gmail.com>
References: <20260531092745.12738-1-clamor95@gmail.com>
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

