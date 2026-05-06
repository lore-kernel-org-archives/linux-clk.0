Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6193D34A5
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 23:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778110733; cv=none; b=PmjkRLzKWGgcRLfGu+2UApLVTi1hnzs9YYRVfRqLB9HjFXZQ6CpEMintI8wmFkZni9mdluHBEVYtBVCKqh/hGRwUgb6lLMsvTKCiMw0nnIT31dGgClvZYk3p87UDyvAImce6bGHJPCubCLpTlzhesuY4Grldj+RN+VOdjN3DDVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778110733; c=relaxed/simple;
	bh=9zAPeymXTdpKny4POpd108mMRvmh/gvrm8KrmFAoFzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nWraoS3z9MQ56jn8+RV8I+bTxlyuyHNLTTNQmWjMoTj+NCEUAVe0MLnYbn58mjNVc5sk570UhA/6UOwJp94GmxBE24/Hy/TfqfHzMuwFd9ngUcP+2QnrN+xzHMlfyzZ5lYm1TCVvnkVbfWjb+SlLy16EN8yvqImpQIwzuybLLic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EoL71SZe; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EoL71SZe"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b45cb89f7eso1705555ad.0
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 16:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778110731; x=1778715531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UVEIaKDdrM7xZJUVR1McqNtSIVMO4TpYRcIh7aYsrl4=;
        b=EoL71SZeCun8eAZ0U3LnPTB+JXJx/+KqBBNQ6OtKSCbiStSsH6Hzx2Lm8W00gyihwb
         1qOLpT0uQ/xS/kjzT/iWe92JWZT4cQeJ9DUybN9Z7oQfg+Z41uEvyf6C3Dt80cGBONK7
         bHX2Q7+5ihpc10rSjbbTE7ruZeaDkUbINYGC80cHqa2zcXOykdZEfKaP7VOveWCJVItl
         jfJiM95wpOOsx4Q64TItROp/Ef9BEPLFF4+qKcQelsMSKqbggWMv2rR1qxnlr0JuEgcf
         zxALSTV9nS2w/tuQp24Jq3Irn1F1PQZLJLLAyOMecbwy1jqsolditHF0om2Id5y2Tz9y
         5POA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778110731; x=1778715531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVEIaKDdrM7xZJUVR1McqNtSIVMO4TpYRcIh7aYsrl4=;
        b=mB4qCLZtuRbekuX5W4/937Qw7E6NXoBsbWiEbs+5NTMdT+llxdv85NEjbKw+RG8KId
         V9z2cPwQab5qhyvzbEVGV2Tc/JDuXUNTTYF+7urwpR9TNRpunfUd7aYYjrw6SPpqo1Zy
         /uUTNfNIjBuCTa4DaU/DYLOSTs096JUTNUf57P6ea7IW6eeqDo9CBcl4SV0/Hbj/G8y7
         qqK96FGNK7PQHI0g6363HBV7O5qumeZ7fb7g82w0UBZWvosSyzwtUNvvqro/t6A+kMSa
         7xK7GTwcvs3MzR0mqJa+fCex6rgfTnMgjQE1rgxqCQA9LAZy/Hmmne7Juj7vZAZaiY5M
         ZNug==
X-Gm-Message-State: AOJu0Yy/nJNgN/qdV90Ha3sGkJOZbQu83ZLjWppxJYKkbOrsIBV2N0A0
	8U1XN3KFG7+e6mNBahe1vWi2VY60zb0A4T+AlLkCeGFBhvk1NJ5Q3ZQLmWn6d5Xn
X-Gm-Gg: AeBDiet9wMpzQ/dUx0nNXnT7kc7t0QdwUG0fmlIHUEs5S7Mo1Mx0VpHLP0hNQ7Hzolh
	DU9Pk+YkuCgrFZi+YV7fn7GgBF1HUOAaSX/rrkuCOQhrZ48gUEr2WYxX3/VnjgsYPrQ04R3wXP4
	vZYIgSHClgIfAdyLRs6w3Cn5XI8t/n+PgpaFgLDUEDyjK+HKHgIm18+B3LfxeHxck6ZCFLSfejG
	flH66+4iN/2U0LBCMolhKXSM0UcqrR77eRJBUV8fWApaOgFC3DBncne1YYW47zto5pwweu/WKMS
	oNdaajSHfW6H02U85xujo8D1iKIMmhP6UAtJfolaZJwabuoYVaoPwo3WxTXiug8+WEqqtHhYtpP
	0R+vqWyTSmIiA/yxu4tvH1n7qSfPOt3utQgdviL/Vj6I26MovR/hjK8n2b5yOXiBwZgyMLjSN/T
	9BY4AfhR4PGTA6X+gYRT7P/DqNpoCxQaPlLglFEKkZ2t53NSaA0RaXlAfLuTVRkGhAViK6sBLmM
	i0JiAHvdEe9tyAm5r3Cfj+nPElCvlxSiQhu0iQ4mDiArQ==
X-Received: by 2002:a17:902:f0d4:b0:2b4:61cc:37a8 with SMTP id d9443c01a7336-2ba78e4cbbemr36383825ad.17.1778110731188;
        Wed, 06 May 2026 16:38:51 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babaaef08bsm3471805ad.28.2026.05.06.16.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 16:38:50 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG SOC CLOCK DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2 0/3] clk: samsung: use kzalloc_flex
Date: Wed,  6 May 2026 16:38:30 -0700
Message-ID: <20260506233833.178357-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch three structs to flexible array members to combine allocations.

Rosen Penev (3):
  v2: fix compilation and reword descriptions
  clk: samsung: use kzalloc_flex
  clk: samsung: cpu: use kzalloc_flex
  clk: samsung: pll: use kzalloc_flex

 drivers/clk/samsung/clk-cpu.c | 34 +++++++++------------
 drivers/clk/samsung/clk-pll.c | 56 ++++++++++++++++-------------------
 drivers/clk/samsung/clk.c     | 11 +++----
 drivers/clk/samsung/clk.h     |  2 +-
 4 files changed, 47 insertions(+), 56 deletions(-)

-- 
2.54.0

