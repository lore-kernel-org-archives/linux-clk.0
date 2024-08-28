Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B991E19E838
	for <linux-clk@vger.kernel.org>; Wed, 28 Aug 2024 17:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724865449; cv=none; b=dv3X+jhBuGVZqRRZLeMPEZlIxHnw4StPK+F1Jtij9sWSwX/HA6r0fuB0W0qvGv92bGzGS+8kGHzihjbRoZRbijJPTe/SVoHK3+au6Upi3099S85ubF62JPpoq3mA9wfhnzueJIt7xJa2iXU8xS7cjIxEdTSApLl9fyqhiR2or+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724865449; c=relaxed/simple;
	bh=p1GvsN04RrnLY0X7JsqpE8JtBOcwD2Nm4oXAW17AAKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CKsUWZxKN5jOWhHwQ/j7B2iCPxABsLRT94Cxd6Pz1TinFWrboGJHNkV0yjzu3b7mRQO0ZSqu+Ur4VEqlm272B7nERG36hUheonPJ7S72uy2F3Y109ARP280PfZhLN36p2dzE/uprlsPvfXbxQWtfcdGgwlLA6YWQxd0tIhDndS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G2irFQ2s; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G2irFQ2s"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2020e83eca1so68638645ad.2
        for <linux-clk@vger.kernel.org>; Wed, 28 Aug 2024 10:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724865446; x=1725470246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4kJ5hpnL3/FBGpLHASzo1BcvnUs7S3nSY7lVkr92lVk=;
        b=G2irFQ2sPAcjjjjLKAl5rffyEzNWBL9HE4wkRUiKvR65hNwvjQ+E1CHVZFjY3cLda7
         CV59KgwG0XP7EHGqZFlFZjsNpg/JSWsIFzYzx4eFEoARjNtkCfZfPGi2j92DYcvgWJxO
         BQZUPMyApK1C5YERy87tgekKy1C++Iscu8Evw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724865446; x=1725470246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4kJ5hpnL3/FBGpLHASzo1BcvnUs7S3nSY7lVkr92lVk=;
        b=Snt5m6hHR8XTNAY2kACqv9W6pvH8OXpOFnLQIY5GiwBJEI034buHbpOZgG864guDPd
         BdeqiEnltVAFBl/tRuvwNM7NQZjcoBHy9tO++l61WIvU0nx6KQS2Qcr4D7gEOtJ66gQN
         WBfbWTMlwgkVrbyypJg3LOla7KBqF7AnKqY4tMdrL3YzAkg9feDAUq5tN1rYMrPi3pGJ
         0MDmK4W9NKsWKh9yfofzR9uMtY6j5wK0tu6A5agIusYiGYfmQgIO3QY3YH1YuRU91HxJ
         FXiN48ZxDu1EUfJPRsMJq9BgHss0EVG3SO5ZPVVydparOzYhmswpv0x9WvF53PuzG9VG
         0TYg==
X-Forwarded-Encrypted: i=1; AJvYcCUTs2U74C2t4secALoxbE28rWIb9CLZmaPRNvnIxZrOsX5MYjaKw2uqPOHeJIDbtGD3gsnH97ts6QM=@vger.kernel.org
X-Gm-Message-State: AOJu0YybJ8eSdHHit9E8wdCNkpyoWvMHkqZfYQgSWjP7GfkPy32iv56u
	glofwEuCmRWYC0I02Lo802K3IReJDGgEIu0Qyax8DZwk8qXijLV1hnyGO3gKZLSYV73pMj3iSqg
	=
X-Google-Smtp-Source: AGHT+IFS7ZURBYUCOol3v8lGedBydTXmTI3cDaFTKt6acXzQU+49QjTiAkXmr7wLO/8x1OSBOaOUWQ==
X-Received: by 2002:a17:902:c40e:b0:202:54b8:72d5 with SMTP id d9443c01a7336-2050c49692dmr1849355ad.59.1724865445848;
        Wed, 28 Aug 2024 10:17:25 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-203855dbcf2sm101566235ad.146.2024.08.28.10.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 10:17:25 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	patches@lists.linux.dev,
	linux-clk@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Amit Pundir <amit.pundir@linaro.org>,
	Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v3 0/2] clk: qcom: gcc-sm8550: Fix shared clk parking breakage
Date: Wed, 28 Aug 2024 10:17:06 -0700
Message-ID: <20240828171722.1251587-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Amit Pundir reported[1] that a recent commit 01a0a6cc8cfd ("clk: qcom:
Park shared RCGs upon registration") broke USB and audio on sm8550-hdk.
These two patches fix the issue by skipping the parking bit of the
shared RCGs for all clks except for the ones that were causing trouble,
i.e. the display RCGs on sc7180.

The first patch is all that's required, while the second patch can be
applied anytime to simplify the QUP clks that don't need to be parked.

Changes from v2: https://lore.kernel.org/r/20240827231237.1014813-1-swboyd@chromium.org
 * Reword first patch commit text to clarify further

Changes from v1: https://lore.kernel.org/r/20240819233628.2074654-1-swboyd@chromium.org
 * Revert most of the bad patch, except for the sc7180 display clks that still
   want to park at init
 * Re-order series

[1] https://lore.kernel.org/CAMi1Hd1KQBE4kKUdAn8E5FV+BiKzuv+8FoyWQrrTHPDoYTuhgA@mail.gmail.com/

Stephen Boyd (2):
  clk: qcom: dispcc-sc7180: Only park display clks at init
  clk: qcom: gcc-sm8550: Don't use shared clk_ops for QUPs

 drivers/clk/qcom/clk-rcg.h       |  1 +
 drivers/clk/qcom/clk-rcg2.c      | 36 ++++++++++++++++++++--
 drivers/clk/qcom/dispcc-sc7180.c |  8 ++---
 drivers/clk/qcom/gcc-sm8550.c    | 52 ++++++++++++++++----------------
 4 files changed, 64 insertions(+), 33 deletions(-)


base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
-- 
https://chromeos.dev

