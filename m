Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795641207;
	b=qDLPxqKPKB8K3tuq9tvls59BZ6k7VmyLISzT5CHfssKq5gP7RsT9TF94VafHt2E6EVBQ
	 G4pCcbUe1Ae+llgxAiEMHreyxNpaVjupvmvecY5shhWVsHDi/humgkzXpIjCstBb3hqeG
	 h/CgewMvGpBl14zDvRlMZOGMEDKgxyGOxqY6WSDBZw+fKSVDfWOz238MzzyRfBNPKGw9D
	 nrja8g9wi3CIYThPbST6IKeDqsxnzacNizjG/I4F/+xf694qmfjWUboAA/O2W8aG9ZRiM
	 7G54iazgtSbRiDB2LdNBFJwc2tWXnXbUtcdiMY8mC+hQy3OjYO0Pr3KkPRhRVjXH6Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2ZPnXp869759nD9qUU8K6OF/gReKUZ4P8rSxhVRhgSs=;
	b=2GnAxAdDx98WbZXP15H32xDqnLUyUOGfLiHXPD7MZIws4RWhNNP5b77sSElQhlR5QQaT
	 FOqPH+Xqt55vBCs+OpSjx2RXCTCu5vJ58AmeSO9186jlw5jQKz36e5y2epnfcPZpOVUdh
	 YBRJQpJJxjhx0+RvZN3PzUv+OF5KFRJguz8C2WSz6MG7+liGqiprTSO1hplboQaGiuz4o
	 ZR5gqvZcjMXQEk5LPmEYm1AEhS7h8h+wa/ZtmbNM6/8pSVjDOti7Hoh+3/KHbxsOKS2NB
	 4e2FyXDf0ec8k8Yd5IvlhpEyVNe5RD18s8UaG+lwiVQyKcJ8kOTxhB/C2ODGJl58wzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L2zdPTfq;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08BB606A327
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 21:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D08BB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L2zdPTfq
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be3dd6f636so504373e87.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 13:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795641205; x=1796246005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ZPnXp869759nD9qUU8K6OF/gReKUZ4P8rSxhVRhgSs=;
        b=L2zdPTfqoSObnTFRGwwxfihUs5uAymtKnHujaNxLs+/umlxVQkzFrkU4McW4wx7hsc
         P3GKPhoIKT85YGwVs7VxliFCW4+s8X0v++Xf2FOy4xk8nhKMJGWSfX7Ok4K7cGVjuZUb
         1IBrexh+aYlkP1L9QfyHdYglwBVJGhEJSw4r5+dkzFggsPQiblWK6mBGjN4IPHa+w26/
         LMVWaZXJcq223xwrNiU0Zqv02IZgTAOZ58D2dkzksslgr19k9I0fN9ih87HNLL9uKrqj
         9zcyRAQ0cMHHLcZmpasxquyk/CqE3zXYTqifhwFUUwr7cP9uI2QJIFFo6djXeJvxgv2h
         mH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795641205; x=1796246005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ZPnXp869759nD9qUU8K6OF/gReKUZ4P8rSxhVRhgSs=;
        b=BK0a4VkMOpA44cejuMpucFk8yJkIzVSRbkby3dSldHVREchzd6s5wYOuABnJC2JsAE
         kJ009QLyt8EMVKNJpg9PEu9TpdRRVU0SjRBr0znUx9rCzWITKFXYlixiOpKq2wkS2AHK
         OXTomFYSiPE/a06BcsoZ+NZRm2ZyGkFasHlcx3Q1gFVzE2XP5VE2g+KhuTDo8D2WbxHp
         KPl7BeSm6ytTdlIC3Pn9NLVFyiiFUmLadgqXRQ/T89J9LpbN/z5RTWAkEDA+NqVtX8mU
         /48uP1FJk3jwN7yCwJfbYXJ09Fmc+JqDRGHXygN/WBUpeAqbGvyTET8+L8w/CrwNQIpG
         lcwg==
X-Forwarded-Encrypted: i=1; AL+hErG7i091sv3y+mew6k/GPOLFJwIjSCOjVEIwJCkmE1HmTvohRA/tZMq32ZGSBBsQUcIndjjQWPtWX6Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ffL/K+7Dj1YE7jOU8D+wp3Y1Qe/u1kr1G1Trzmt8FddfF7jRM
	FunBuY53rsXZKmx99woWayFfKY7OmTOZPUd7PpOGPTh5ohO2SXsgUBeTj96CrwvyB2c=
X-Gm-Gg: AZFdTZcAecAYZPpds25PB2h3Q31ZPxv+9N/HWjEOlPGMBFgYFDvoRzAyNXRSlo7XSYM
	RoQ8fQ5tKV5ZEQ77Enqb4mlc+M60qSMesiacSTXWNgaI1BP+7VcDR4q4yhOz6+ePtyEMlm00hvx
	Z/4KJ+3Ee9me9+BvWgHtHhgZZ3zrgFp3DesFyj1erN9yx57UJs43hgikNozUe8WuoQqvKTtWhjC
	6PpBFKlon/I8GmBPG6Oiaa5wfpWcLzGiLySamcKkgz051tjbRd6JE7DAYC17w5PpqeMopMwzd/C
	xItI6xa9L2/0vZqF3Wvw/xdTlduGn7Se8L6xQt/PeO33bJNgKBgIGC/lLmuVdA5b5TxCN/YQBzi
	eIOnrL9FjIBA6OLhWCIS8UznEKmfzxcDSEifOiGy7+sKTzA6xU30Zlm9AGFUSnqebNICD8RjUyk
	5ITeutPTsF8EsRt/8lOFBg3Lg/dwxpA8N1BMdi6N2JwODlnVlvnkHMEArNunieqIPxyAmKeu0k3
	PZ9mAPkGyT3n3Q6SVhAW4Hu8amyXJ8WF0t7f6FtAA9kEoWMLPuxftqsTcJPrI5/2rY79YCC/B5s
	PkxHSpveQIU3rlQvpJULiHJMDZ0b+u1MiGjYLWxo/JGF9PWbgmQg8qiGoUQVuglgiOrLp3H+McU
	kdhb4tpxp1fdZhUM=
X-Received: by 2002:a05:6512:b88:b0:5c1:5488:f57d with SMTP id 2adb3069b0e04-5c1bc85b735mr7140505e87.4.1795641205025;
        Wed, 25 Nov 2026 13:13:25 -0800 (PST)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff993csm4858972e87.23.2026.11.25.13.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:13:24 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/2] clk: qcom: Configure Lucid 5LPE PLLs properly
Date: Wed, 25 Nov 2026 23:13:13 +0200
Message-ID: <20261125211315.1437946-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SC8280XP and SM8350 clock controllers configure their Lucid 5LPE PLLs
by clk_lucid_pll_configure(), i.e. as Trion PLLs, which sets
PLL_UPDATE_BYPASS bit. Use clk_lucid_5lpe_pll_configure() instead,
and describe the PLLs by the Lucid 5LPE PLL type.

Note, the series depends on CLK_ALPHA_PLL_TYPE_LUCID_5LPE from:
* https://lore.kernel.org/all/20261107173621.3538964-1-vz@kernel.org/

Vladimir Zapolskiy (2):
  clk: qcom: Configure SC8280XP Lucid 5LPE PLLs properly
  clk: qcom: Configure SM8350 Lucid 5LPE PLLs properly

 drivers/clk/qcom/camcc-sc8280xp.c  | 46 +++++++++++++++---------------
 drivers/clk/qcom/dispcc-sc8280xp.c | 25 +++++++++-------
 drivers/clk/qcom/gpucc-sc8280xp.c  |  8 +++---
 drivers/clk/qcom/gpucc-sm8350.c    |  8 +++---
 drivers/clk/qcom/videocc-sm8350.c  |  8 +++---
 5 files changed, 49 insertions(+), 46 deletions(-)

-- 
2.53.0

