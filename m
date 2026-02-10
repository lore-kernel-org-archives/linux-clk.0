Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81ACD32D0D9
	for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 05:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770702058; cv=none; b=qspez0NSs0nEsSJvvq/4E8ORdFILVbBFcO9qBKYQh8YMbAuyjVqvId5U9J3shU4NuIIVROlKotuK5VpZ5NWLkE5fsD+vyZQtlPDbiYzC4kgbgPGhlGASueMa1fFUhxQ7JZjqSrOzbM7bvWpeHu+IsmPc1uYCr+9vwIPNlWGewiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770702058; c=relaxed/simple;
	bh=1KUelg9pD/rEzRhAQDzmX7XnUGou4EQnpuGOl9eA5tg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OmKwte2ZsLhgc69euhbFunPBCZwt1JTVZO6sCeF3L2kDvln7Z52hxjV7AxnGyE3hq4H6PnEzLNXIDgb5YB2edvlfy/XD5SYHtq/vD8hCuUYXxOB32e9NubyuuVEMfSUvu45SL8yf6W1mTfsXl74nfxyd3Y/A13TA9EvFO4pDroY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7jQKF1+; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7jQKF1+"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8c7146b0854so549250985a.2
        for <linux-clk@vger.kernel.org>; Mon, 09 Feb 2026 21:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770702056; x=1771306856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMfztC2Kl9bZJ/11xcUAkYHo13BsJ5PSJi+vhPNPnC0=;
        b=e7jQKF1+Yp8aKBiXQ0Yx8XuzTGjTotHXbPiQII/dltM2fvLi9F84hL2m88CHKUsOAg
         qBwWshj/P1eSgWP+ANIEW8Y0G2H2W9se63/f3FEI6/yWG9DlJn7SmU+7fBygtTuW61+2
         jsFnllC02lc+7rN6dBb6+GN3czVrME4sZ+6uRRSlllymDGfoJxvVAbK6eSHru5rubYdZ
         vC8rXkRHS0Lj/+NsKGGUQTTGqC5YkwAkdNCCyevoyP0uS256i4+/+1UKiUaVlq4wcYnf
         Q/a0HWEGwnEHTI3hITiUgIQ8hHq0TuBwU+txfGM/CpvKU9Dnxil8J7UE0qOr/4neS8+Z
         a8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770702056; x=1771306856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yMfztC2Kl9bZJ/11xcUAkYHo13BsJ5PSJi+vhPNPnC0=;
        b=Lu6yXFNx3PCC7tRupDFa/m7+tTrBVd/pE+be6OXtoygzwnITGj92B+RReqnDbMSYQn
         Zyni4C06oyVWYoakrEGd+3+Ey8joz5GIdTn4jSsp7eOW7cgDU7pi4gZ9jHyqZ99/02Th
         ljIhugq7noZiigpJavNtHZk/6xRpI3FlGtwbqgZm4bIF/2ur2t3hneV+4ula+54aYZzQ
         0KqM6rDDTaMZlIcPbkTROujeJe9Q9SyhPhyjNvQPeqgdPGDb2e0z/cjnYAUBEmSogIjL
         JOPDlqfJBkOsyhGjyXaam/lMIId57Q6AuSVIDRGnwkufR2ecF0z7YaLKBSOGGeu2QpLt
         WNeA==
X-Forwarded-Encrypted: i=1; AJvYcCX7JvAwzdgeOUMBUmnsBLojzxiaVMcGi4NSVKCTgstEwYfWYJG+M6gkjArGmXG9HBFAJDiRfhOdZrk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXX/pt7LGi6aEWw0SqbquOqJvfnEX8nCd1gYlIyjSEmRd+LCzD
	4E7RCNVZe9BkQYgY76dQrbMRlVZFLaJio6M9735S4/qmdYVMzfAMMo3D8KwwdqPK
X-Gm-Gg: AZuq6aIAeHARyUCVa69RKwxzHAbdDta2DBGXxJgS3v+a/wXYlWTUSg8EWIl18iDPow+
	49hmUFJtdMqY4onTFTp78SKX622c3uGYb5Tuols8fNyHRlfkT7uV8m9534CjYM8TQAIDghlpfRM
	lKe0xybJt8qd3WUKxUd02th9yfAbLw37v8CQYNsGF6fQYfUCffDjxKG0GdXGSKqiI0yakyYRDTB
	HRondl3Kz2IFJwwIxW8UQjdRvVO+Yc14nLaGndgR8d6AeFMfVZf/TuLANYiJ32bqlIBK2ysFf3m
	q6O8prBdEZD8MIZfEPn9bhjXDRgW4w0BHWuGk8lc2cLADrfDojV4NoMnSCq+eExuUUc9+lteN4A
	LbC/AJziYyC8+pMJL/CYKkWa4GtB/Fk0c+XKIqfjR4BC0R+HN9qG24ffGGa+JSMJPCJApgOA45X
	XYSXWgiC7gxqV1ovtYZjJOVzZpDgo1b5SalYt+iP10axPU8MqdLs3+8WMRRtnDu0c+ihI8h06t4
	w==
X-Received: by 2002:a05:620a:1a1f:b0:8c7:6f8:ae4c with SMTP id af79cd13be357-8cb1f74d3bemr112907085a.43.1770702056479;
        Mon, 09 Feb 2026 21:40:56 -0800 (PST)
Received: from aford-System-Version.lan (c-68-46-10-116.hsd1.mn.comcast.net. [68.46.10.116])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9ee9fbasm978632285a.39.2026.02.09.21.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:40:55 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: angelogioacchino.delregno@collabora.com,
	Adam Ford <aford173@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 3/5] clk: mediatek: Fix MT8196 topckgen orphan clock
Date: Mon,  9 Feb 2026 23:37:03 -0600
Message-ID: <20260210053708.17239-3-aford173@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260210053708.17239-1-aford173@gmail.com>
References: <20260210053708.17239-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a clock with its name spelled incorrecly, so when a child tries
to associate itself to a parent, there isn't a parent.  Fixing the name
restores the proper parent-child relations of this clocks and eliminates
the orphaned clock.

Fixes: 895ab0134d64 ("clk: mediatek: Add MT8196 topckgen clock support")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 drivers/clk/mediatek/clk-mt8196-topckgen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8196-topckgen.c b/drivers/clk/mediatek/clk-mt8196-topckgen.c
index 6ace11ef6b69..2482597b9b7a 100644
--- a/drivers/clk/mediatek/clk-mt8196-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8196-topckgen.c
@@ -324,7 +324,7 @@ static const char * const emi_parents[] = {
 	"mainpll_d5_d8",
 	"mainpll_d5_d4",
 	"mainpll_d4_d4",
-	"emipll1_ck"
+	"emipll"
 };
 
 static const char * const ap2conn_host_parents[] = {
-- 
2.51.0

