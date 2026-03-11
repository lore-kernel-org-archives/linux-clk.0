Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9E93E92B9
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 18:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254398; cv=none; b=hMKw1YDz5u9U9vA6qjxMWFGg5hUGm8xg6dy3XJahjQAjWJKUJ2agcbMvhOUDD37F/baNTZSKu95vLkvoC6Y2X45RB8UsnxOfmQ+l5nNfh8gWNYjhLZQ1Mx+ytxRDziTjT0KEcFwnY0xCGGiwiX2HzVlowYA2OBAT/v9PsC6NUKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254398; c=relaxed/simple;
	bh=UpeOhvo/uk8yi+1q96JIv3h8o1rekI1cCyqbUfcNtjA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iH6LfhzKAQCOuOSCTSrsxOyN/6gAFDJNH4mIipj6MoJUzVQ4qfxt52CvsdgEZgUd9qz5UF0lpnfMkbEm2XZOw/X8IloUFBq40l29up4HYcp7w7zJdPcRIPjdVUz4gjLM/KuNVEKcwQfSoxvAQPHnHsfc8sZ9XHt2hpD6s/FyjEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOzRELnI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOzRELnI"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso2141615e9.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 11:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773254393; x=1773859193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3JpZnzVxjuKCYPTmp0ohRT+2k0IA1puKSWLpheS1yF0=;
        b=HOzRELnIBkPU1YZg9iBi9Pe10GzyBceNDwQb9gVBEtYiixbYSS8byHVvTEZUCLfc4l
         ZyacaF5OM9Xqz9tvsCV17mrzgE6lTnY3H4hkwx2xIJImW0oBCmtZPaVqhmLLonQq5nMl
         wUCthEZNHkV8l8kl8oraVPcQthq8IqSqirc3cAVrAIQrJpouYAs6BZ8mXo2XrsT/aSkA
         7qcxGnSx0+Yy0vIFdaK448Xc98PV28Pr3/m4VjDKPR1MRzCCjaGq4IMuZShynewWijEe
         QZi4LNi5KAjgSPXubwSfZjctWfWz2KLvBHLEEUX8Su1jOARVWm+B9kbyq+ceb7g4w9pE
         QfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773254393; x=1773859193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JpZnzVxjuKCYPTmp0ohRT+2k0IA1puKSWLpheS1yF0=;
        b=goMhntQ+0Ms7VFx7eRGhrNj6m0rdmLMq6ckluV0422ElaiJRKMZg2JhtnAiX0C8XT9
         +YMqKkXLUwQktAz05SdlY838KMrwDd/flcL3Ctk3KkhPFczRTzBBzmHiRyqSRLi1jgQi
         MYXH3xSqdQwiygsN//yR7G69IQSMATyL7fEDA74WZavRvmwo5jetvPJEv7d9gi6cpqBV
         DgmVGMn6KBngvCkQXX6cknnykf+zB065C8Et4xwg9H7IPb9anRcxoXE2lsVDVl/2xAIA
         A0PVu5PXjQaHz5U298acQcU/b8TcMeNT2EydT/MWBRIzKr/o0lTgh1+/j22mXjQM1MTU
         kZ7w==
X-Forwarded-Encrypted: i=1; AJvYcCXeoZWEuRiVj2HpZcZpFhYTD3t2y43QAqMWAiwXXbMvBG5UqFU5OtvdldzbEyNlfjIkIIGRYXmEPqw=@vger.kernel.org
X-Gm-Message-State: AOJu0YybSJvvgeVPvcd09fxX0b7iOsuaNnLNyC0813r8Mcw/dym3gr2N
	gM0Ghj763NHD8gx3rpwAkWccU6BQZliJwLfvMoi69i+VTlxVuwkUYIC7
X-Gm-Gg: ATEYQzwzTuW/Wm33vhFKM0PSGUNcl/UGAEjiP//hxULrNPo9nspC3Uqw1L+USFsMR43
	rBBV4OpbHKBoXOxjnz+PzBtmqCFmyWv/Z3SNBfV0uN8FU43BO/kBwMxy6EjTjvjBD+951i7500D
	lQq4Da2RlC2wZwQUCQ3Wmauq+Db2yOGrlq89LaUCRGMq0DfHrlcetJRYBn7f4/8refXSENI9INU
	nYZxVXpxzhaSDl9bJ15hcibhE8H5awSrzp11Q0e3jJ9PbKUWzpJCqq7Az1xyUBMDHeRoeuiAkuo
	FKD7s1Vztk4OD5vaA1olxtC3F0tuXJz8EOMX6RW/dEEpfN4DvIzbX1M1Z7ZelR8NiI3TQHOOGXS
	/hDCZeVgoWnbUNnGpzTBV3Cd9fZRutQUONq7KOvbL4gUSLR0SUkLfHlqYzWKa8fqJhYKKkeL0ou
	u47o89vMxfNVRkkl8pYkNFLhlh0QyXRTtT1i98e3nzbXmRPvErZ5fNgwY=
X-Received: by 2002:a05:600c:45c3:b0:485:3473:d4a1 with SMTP id 5b1f17b1804b1-4854b13e63emr63571735e9.34.1773254392844;
        Wed, 11 Mar 2026 11:39:52 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-122.ip49.fastwebnet.it. [93.34.88.122])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48541aac28bsm161176675e9.1.2026.03.11.11.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 11:39:52 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luo Jie <quic_luoj@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 0/4] clk: qcom: ipq-cmn-pll: Add IPQ6018/IPQ8074 SoC support
Date: Wed, 11 Mar 2026 19:39:37 +0100
Message-ID: <20260311183942.10134-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simple series that adds support for the common PLL for
IPQ6018/IPQ8074 SoC support.

This is an initial effort to try to support the Ethernet Switch
present on the QualcommAX platform upstream.

John Crispin (4):
  dt-bindings: clock: qcom: Add CMN PLL support for IPQ6018
  clk: qcom: ipq-cmn-pll: Add IPQ6018 SoC support
  dt-bindings: clock: qcom: Add CMN PLL support for IPQ8074
  clk: qcom: ipq-cmn-pll: Add IPQ8074 SoC support

 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml     |  2 ++
 drivers/clk/qcom/ipq-cmn-pll.c                   | 16 ++++++++++++++++
 include/dt-bindings/clock/qcom,ipq6018-cmn-pll.h | 15 +++++++++++++++
 include/dt-bindings/clock/qcom,ipq8074-cmn-pll.h | 15 +++++++++++++++
 4 files changed, 48 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,ipq6018-cmn-pll.h
 create mode 100644 include/dt-bindings/clock/qcom,ipq8074-cmn-pll.h

-- 
2.53.0

