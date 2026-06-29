Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BDF37D131
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 03:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782703544; cv=none; b=nrSK4leXvIzlwh6NkbzRJhr8wCSjx1tOwRe7zWmWPtqAc8hA3VqVx8dhZk+4f4nvTkDqBEXS2SqCFQx2w0B9tryU0O7sxdI/OuCmGWh/8D7xz4KpLP1vqevrlCAbexzAAtpj+LKVUB5sAk0qqboDazY467OBSjqPbyeO3wpvjbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782703544; c=relaxed/simple;
	bh=sI235h7NpFG/djNSPowZLUqWUmqwyCKk8vSphw/WAWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RHqJIkIkd0+IjBx/UbOYBZ9CQYHV4YVLADFTROmC9Srp6Fk703OSdmyj+vgu0umFnk3ErrklQTnie5n7KziIpoVewTnuhPnlWRlFT5AOs/MF5+J0IDL1qZfAIzIafiHCBwzqmOErC5tVg/NHFpcKNGYpn3byI4ha4DvTIaWYyeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dpa/wsrf; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dpa/wsrf"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8424b00710aso2000370b3a.0
        for <linux-clk@vger.kernel.org>; Sun, 28 Jun 2026 20:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782703543; x=1783308343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TyaonlxlnRA1aHNz8FZIRpD/+0hZdshlSVPR6i+Frcs=;
        b=Dpa/wsrf74G1iCqVst8sqMLODNH8A+VzJywCrClHac8QgbFW+R75VYnxqIee+TVKU2
         dwhSdewmEQbLX9O64v1fPnJktHSogsukQC50NelFozd9xZRJ/7DSRQXH9xfuGZdnbTEL
         AsdNyFqJchck5VsQ2UldwetybZ7kA5lbbxarHjfWDNF51WVUYWk2eldSqcqM3lVKC3IQ
         2E1W0o4dV0KNWZOLp4Ryc4ztaDtsJHodMrtD4eeZy46iDmR6y/kamfCscjOLpTZNlLDJ
         +TY4Y+srnt5FyCGUlsGvJxGKCnRQ3l4R0iMnjvRX9zWoWGCsii09UayJd8KFiWsDm/lf
         NM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782703543; x=1783308343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TyaonlxlnRA1aHNz8FZIRpD/+0hZdshlSVPR6i+Frcs=;
        b=ggoCgmWPvk7mGLgQ7yAHWIZr3aOj+juyg91gYTf75G+XqZjwM1qP6CnHEVIl2VS4hQ
         9Wh+AUpngDA/2AcxkCo+BZ7CaTc00uMH8Au0XMVTsqYDoRGHmOiOH6wXibM7HiSTfKZM
         7gvZpHmYfNbK2LdyWceNRgD8lPfrXl+S6kVyXLjryK900r5Gg1mTv9yei3mcctlICmXB
         2Cx/8OZf9XoipNbfoTWyl3T6yUwqtviRo9Wm28ohgI1kM/dIc4c63VoU7OXnbcvTe/oI
         ZW2K7Fc0iCwjzS1TmDDq6g62GZgq0xCXUctIfTNYfG85wn71YOgqAy8GSysSF/KidaRY
         6UQg==
X-Gm-Message-State: AOJu0YwdAfn5QhO/n3UK9BlfegI1c01U8TKUzmKuRY+4i1XZ3Ok8WfPj
	FnDtLljnwFWZDhbFGPYa+ZGLOM29TQvaUTM5xR53aMWJVX/9AFGoOx0yTAh/kSlH
X-Gm-Gg: AfdE7clx1cba8WPRxmJdStn3kGV2cNe8p9cLKbsJFXCxYncQ3S828FlLixhRnlGtwPQ
	olpxgfEnAQSFfXvL6F4jM9TQQbQz/XfglTckglaZMTR9haczp3H5tHq2wrutPpGJn5I3gZD/GVk
	eeBl9dQCdc2rnq3cj6AlMM3bsoRYfIqEjqAzAqCZKWJ7xGUY81CNACcs0n4T2G7cOpnIVHFz/xw
	H232zhQi6GnMzvdSC/MR0QQ3U7e0j/TcM5ZUhzYuSco9n/XJjBArM4Au3MP/Tq9tHIuEApJi0pj
	g3lRIKxLMOzkgzVRMms50Byetezzy6xizLF4STeiaPcI4r3JykxgLx9/e8t1oVr7d5l04JFdjzA
	g+J7/qT6okjGS19Sn4YNXP6ip7DfJyCgzbjp+mvA52IqdSSuX1n+fyF6bqTZvuEi56e4tnIGGT4
	qwq73ToQ2V+NKwbcgw+weP7bAzMOxS5vCd8h2CRhHofEgzy7ou8Y37URHnZPZGLnUsW/R5ABxft
	77IF6HSi8DFmCw6ufFW
X-Received: by 2002:a05:6a00:4c19:b0:845:cd69:bd34 with SMTP id d2e1a72fcca58-845cd69bf6fmr9304863b3a.28.1782703543034;
        Sun, 28 Jun 2026 20:25:43 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-846c7f659ddsm1921771b3a.32.2026.06.28.20.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 20:25:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG SOC CLOCK DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCHv3 0/3] clk: samsung: use kzalloc_flex
Date: Sun, 28 Jun 2026 20:25:37 -0700
Message-ID: <20260629032540.2331559-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch three structs to flexible array members to combine allocations.

v3: move rd_num
v2: fix compilation and reword descriptions

Rosen Penev (3):
  clk: samsung: use kzalloc_flex
  clk: samsung: cpu: use kzalloc_flex
  clk: samsung: pll: use kzalloc_flex

 drivers/clk/samsung/clk-cpu.c | 34 +++++++++------------
 drivers/clk/samsung/clk-pll.c | 56 ++++++++++++++++-------------------
 drivers/clk/samsung/clk.c     | 11 +++----
 drivers/clk/samsung/clk.h     |  4 +--
 4 files changed, 48 insertions(+), 57 deletions(-)

--
2.54.0

