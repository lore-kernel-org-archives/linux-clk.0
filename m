Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F35078F44
	for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 13:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733836162; cv=none; b=O2a6W50QONuzTcEyBioiJQjA/wtt1uFleuEUd/p24w7ONGEBFT+j75QafgTgSxjd5jcuB6ejmOENKF7SJuL4q1dp/M5hgzWmt6oAFMFzlc46RaztrHaFfsBU6Bq+ywyQqdqwoGR+su0YF5TGTMGhgr87U3h1SiukqGdfoQ+rkNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733836162; c=relaxed/simple;
	bh=/VCeonlJ7RqudCoLAwcC/DARiEWdeZ88kZzwmWNC1i8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KF6mKPxTrh1iC2E7ZGVs4Cev2kqFWe5Nr13keLvoSPZXPUXzO7vcKEcYNNDqsaM86amX0sZEzCAKXFZ/PNBWnLnJ8fv5XkLtWgzq+iCNWDeO5zZEYrKvMAZeoV9qdbK9NZBdYRiLD12ZW+F9oNyDwfp7u6BaenMNrpIpBjqBesI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=ONy7+JaA; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="ONy7+JaA"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-725abf74334so4537618b3a.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 05:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1733836159; x=1734440959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bKLMf9HUmsRY+G7fRIF8X/D3w7+vt0kuW4g1vgf8Exo=;
        b=ONy7+JaAlb5MQVbmgNREZ2KLhoX6wWwRUJ5a8/OdjSU4aTe80ucO4+N24J4eZlcBhb
         9MJ3+uE189tGK4V1j/XlZrQDtWtitk13hx/UFA28UMHEQ35Y3QUhcgRETGA+DGTgNoiT
         sjKwKsIDlljxY1NnjwHWBLXsB5X2XSdCXakobRcrJFZUl/lgkK+hJukCrIOq4HrQjwpn
         U2+1OaKqaoPZLUooAxAbQw6Csznq3xWJpLKu7/k3X+xEgB9yazfuUHCAQFy5G9DjI3aH
         hwGDjfh9Uz8tmEAjqCxJJ/7oY9PsFyrm13mVG9e/tJl6yIpoiQeUHGKynlG7eAoVCEv9
         0L4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733836159; x=1734440959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bKLMf9HUmsRY+G7fRIF8X/D3w7+vt0kuW4g1vgf8Exo=;
        b=Ts9gXeZT9oHIIHuUMKoE5n9cC+xDhuvz2o9TsyslFBSRHTO6q2e1NlHfgTQh3FxZcc
         jViuk/rZuNY6Z/P4zMdDHyqQ37Owa0y7ZcFfPJm1Lt0xzVNY+sLLJ3LIOMPaeCrHMpPq
         u93qzNzfUCUWZLQjpraxA4FXCxwlbldW3w1JjD7yHVwnVnKEQiB+vcwudOOABoeky5Ds
         tZ9jHhssaVQ8zWNePKsuRg0mt/RjOuPhtLbzHi293Q8diVDzLy00GumMNDGwF9vDd3Ka
         9f7AfPoA8U+GmR5G+pQCKquNY0M9+2xFtjbjYaO2GtT6mvDBOoXbYSnMEciT4l6iikJg
         PS2w==
X-Gm-Message-State: AOJu0Ywc8ujSWsu5EQbA55e1tWHQJtMBW73s+DMcVUyiepgRmBw8pzkc
	VvLLJy7gN/vgEnsV3aTdMrAf6ik1wjeBcnh0sJlwV1uZTLQkKjFgT630WzkAjvI=
X-Gm-Gg: ASbGncvHHSnVosleRBn9xnLunFoL+wYO0saUv5mNzTWfdzuHAlcLWFkP9mQpC7x94nd
	o/BpwSeqK8A5O7wW3+rjr0BbdDyzkLacBdyU1RH6vC1b3S3/QxsLhqOSCfSDqMpKMDO0lFkVpHN
	Dup4CwTji/vDZepvv2inSKerGADgAo0US5wjcs/NYUsF6kt4HpaoZLeckGA5vKtzqz9I+I7MIcV
	J0SBzoyxv6xw+EnuuTpYDuJ5x6jldmhHN+qrIDWqsz9SSU2O49NOz4Dkhn4DzjKftL3Jx1Vf6vu
	CUvHFdcgoRQsgpLsSVJNTCYP5pCvWIiPUbzR7n4R
X-Google-Smtp-Source: AGHT+IFU42/wP0nP2UGEOBt7I8B+LR+EgH8NtKFwH76ZuIiaICFu7a6T4gyK/jXHUWt6ylIkP4EZqQ==
X-Received: by 2002:a05:6a20:4323:b0:1e1:b430:19c6 with SMTP id adf61e73a8af0-1e1b4301b61mr5814182637.10.1733836159611;
        Tue, 10 Dec 2024 05:09:19 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a2a9205fsm9270274b3a.99.2024.12.10.05.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 05:09:19 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-clk@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] clk: fix an OF node reference leak in of_clk_get_parent_name()
Date: Tue, 10 Dec 2024 22:09:12 +0900
Message-Id: <20241210130913.3615205-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current implementation of of_clk_get_parent_name() leaks an OF node
reference on error path. Add a of_node_put() call before returning an
error.

This bug was found by an experimental static analysis tool that I am
developing.

Fixes: 8da411cc1964 ("clk: let of_clk_get_parent_name() fail for invalid clock-indices")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/clk/clk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index bdc6e5b90da5..cc57f3f5eb60 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -5385,8 +5385,10 @@ const char *of_clk_get_parent_name(const struct device_node *np, int index)
 		count++;
 	}
 	/* We went off the end of 'clock-indices' without finding it */
-	if (of_property_present(clkspec.np, "clock-indices") && !found)
+	if (of_property_present(clkspec.np, "clock-indices") && !found) {
+		of_node_put(clkspec.np);
 		return NULL;
+	}
 
 	if (of_property_read_string_index(clkspec.np, "clock-output-names",
 					  index,
-- 
2.34.1

