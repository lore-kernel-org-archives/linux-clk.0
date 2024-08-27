Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4551D4177
	for <linux-clk@vger.kernel.org>; Tue, 27 Aug 2024 23:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724800364; cv=none; b=WDoWqUJP7jKQOP5P+XYrDo/1HFEy68AlYZ8347oXYwi500sM7oLOtfAKjr+vrzmxVo7HSGyIEcPSMqFoPkk/Lh6S2qmy7olu/fwxZmIyp5P4wXc3R5BbGKUMWZQtp768eHWUYLLreNwnCaXMJhQA5ZZmQh2FQbCJ2rxoL8qruZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724800364; c=relaxed/simple;
	bh=GD0A4TPEYjATzBkKcTtoqywA1zBBEQMw9GL0OoeNNZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GgJUu0eqpIjKaC15QNP05YVfyBfjW0JWHqnPBaMWbOO+Z4QrCBSFqyiBI0A1RoSHyvOSsFjPPXozCLScA417qNAiZVGHoYX3BBfsFk4uawJYn6fgSPbSeWzlp5hYdb7IVKo1rVCUcf+hg5V+CZ28vAo+t3kvslJ5lTPJlDmyMHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dktET4mf; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dktET4mf"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7141e20e31cso5084698b3a.3
        for <linux-clk@vger.kernel.org>; Tue, 27 Aug 2024 16:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724800361; x=1725405161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pv/ufdYKY+CmjhMEr75QBezIaND5j1qCC0DSQMSozsk=;
        b=dktET4mfslvA1SJW4v2i9VkKPcQlLYahTgW+U3AWuHMNGvDXOJGlwPXS4ew418R0SV
         mkuNzi8zTWnevq+ZJ0XXpRIT58WtyzOIByoOLnqgHTOW0ucYGOAfS/5X4zhFSEbLFNi8
         pf50/b0YOdWHPl62OAKMhTx6TwuO60cg2msVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724800361; x=1725405161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pv/ufdYKY+CmjhMEr75QBezIaND5j1qCC0DSQMSozsk=;
        b=ix/pywBhj5Yu8Zp08s2Sy/UbbOVPKds4ffoEkOcYck43TefxIQp/7RB8Y/21WYkNsb
         Fxoy4xaxz0DwSYOTYnKY/qxYc9rLPry8UXwkrveHLueHz2zQTjkI//cVL6Iogbr4qNsf
         iaw+Fx/MUY3ulTprrAZebYY/p3xbq+Gbd410DD9zBBsFxznqrCQN41cYxDx4Hia4OQZA
         HtVKOnrPxKqGQdbCDgIuHS4cEu7Uy7F+cxNycRElv5esa4yWvZKZdZ5wl0j5EWsGb7/7
         4XrX5vXW3JI4gjg8EF/Zgppw+dXqwVko0nY+Wak6AIl8quWlw18pciq3PWGzuxqqqdPl
         JIHQ==
X-Forwarded-Encrypted: i=1; AJvYcCW03lG5tYjro9A51yGFvPgXvH/XE6feqtoKuRvC87WrMu1TbBYNUdB7XLMpUzBSPLIvPfTRLEy2Zp0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV/akfWs6YQwjjD+pYtjqX01+eWLxCSfXvkhePx2P1A4uCmF/k
	rRbvYAhpj4QVf4URFC00F9iCm/bQeRWgevNXTN/veLxDbKlVarxlG7veGXuNoA==
X-Google-Smtp-Source: AGHT+IH+n08Sk8Vd2lCCcbwAL0bOTX/nA5NdiPgGvH28H6kVXqenmkkshHPtYDCVpMQVH6rWErsfbg==
X-Received: by 2002:a05:6a20:6f01:b0:1c4:231e:8ee5 with SMTP id adf61e73a8af0-1ccd2899c54mr110535637.29.1724800360717;
        Tue, 27 Aug 2024 16:12:40 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7143424a525sm9016824b3a.49.2024.08.27.16.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 16:12:40 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	patches@lists.linux.dev,
	linux-clk@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Amit Pundir <amit.pundir@linaro.org>
Subject: [PATCH v2 0/2] clk: qcom: gcc-sm8550: Fix shared clk parking breakage
Date: Tue, 27 Aug 2024 16:12:33 -0700
Message-ID: <20240827231237.1014813-1-swboyd@chromium.org>
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

