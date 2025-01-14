Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652CA18952C
	for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 18:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736878831; cv=none; b=EGiAHW7fAANzBGpIjpy99bLiZ4yHjQv2qLA3jfSJ+ADIMS2dwX052F/ZB3744J6H7e6WuuIFM+MvJk7qCWmfMWni5pWQB2jlC2LAo63Zau09W96Lsd7MGBbYKK8sHLOfZdz5u+WspgERyebiAaMXDI3dOEHShF1a40aQoVcCut8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736878831; c=relaxed/simple;
	bh=nHbDn2Xi0lDjIGgu65xWMeXJXaW+Z3RJsXJY85rSNNU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Il9B5BJ0NH9191fJ/fSnJf5J2Pamzp2zu0k3SVCpu4hf57v2AFrKSKNXw7Q+1v2en2WXtJvryOQh2ERZDUYavcK+65E8Is8DS4cxZGaIfWvPXTOVOIXvrJxRKO6vqMnyhG/LAuQhqd5E2tQXRzEhmlC9ZShE9hf1bhA1rXrzYA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=oAg8XehW; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="oAg8XehW"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38632b8ae71so4264974f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 10:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736878825; x=1737483625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GeNVBB/i2U4Nsgj/JNEuuNrVAFqI6yjOJA02Gh323ro=;
        b=oAg8XehWwaGNm/8twERK9HTNtpytRY1TCkY1vZNZpmqUHn6l1rm8TebPf8LAm9/zZM
         We/UHmoQ1gaCIBP0/Ahskx/jBoFrF6DdeCAFypFn3clsDlMvJ8I9Q05UprYDSyVABNKn
         wgQmSGH73t0HZSuRF2WoqzuF/f1oU5DS8GGak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736878825; x=1737483625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GeNVBB/i2U4Nsgj/JNEuuNrVAFqI6yjOJA02Gh323ro=;
        b=PZyItyEDNwShJKRonKiJErpaIlZ/jj2w+2PikZmURKfCcKd92RpL2utiqHZpFNbBKy
         m7AAvSyLUWdcfkv0Wnpfjp1tgKbx1rydK9jL4JZfVTHPpop02u1B4Yt2k9uPF0oe5uQS
         f7spLk0rt+9JcgQ4VzQfeKQcE6Wb4+I6a/tWBlSD7XjvBa8qemSbZDPSg0geMbV3y4Px
         wAOcIgoG4BdzxCExhbzFbdwVHZ0eUOwX95y9yS4eleDL/EuSF8hh3rMSa/vahTt7hog/
         iMZx4w4f7sScSuJt+Hrmfv+lmrh1/7qNgtpQFTZio5cSGfrKfGT7E0BH+NDybHsHISe7
         ATeA==
X-Forwarded-Encrypted: i=1; AJvYcCVVaOr5CMLTNTB9qXbp2Ayh+NGUr4LLwZwMQlxaHli0ClGZn6nnYvItl0jUTepCJmTSg9Ms4OHE3MY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy87VPXuMI5ZdyME7qMN5dnaIocLwy0a/LprT4G45E9185wbKnn
	yX496Cte0iKKMzzNCKaaCa43Pjl1G1cr4/+8FJFwsxAOW+7iIUjYl215OP8bUnk=
X-Gm-Gg: ASbGncu89p54gOaUGgzZ+m8kMKaVMXy7P/5GwnjTD5x+IooH0TRyhNkQKnOmEy9klYA
	DIsqWqvO/nXgOEoELm3gLy1BNv6FrsOpoOEPyMNMkP/dXxYQdI8uC65HXh2W6v4Js87ndRqCirE
	manqiGLnzj28cbffDts2vqKaRRNnzbKGCDIMeQKJ7j2z153GVKKO8uaHs8oTMJpMQgQSO/3jun/
	Gcm4hRU3fSWgaJl9qwXB3AgsUnyOzFcqXYuPuAh/JUElqUA+7W5ubex2+SO08rrqe3kQ150EXRQ
	lmUBS3g7wLWjuQ1eLdIylw==
X-Google-Smtp-Source: AGHT+IF0OmB7x+n/pD4cD65liw1i2aC27PQyOn8ab2eaRaudsoa2gu0gSMltwYB/uF3S1FkWb2D2yA==
X-Received: by 2002:a05:6000:2a2:b0:38a:8906:6b66 with SMTP id ffacd0b85a97d-38a89066f45mr26441005f8f.38.1736878825526;
        Tue, 14 Jan 2025 10:20:25 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38be66b01c7sm278970f8f.22.2025.01.14.10.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 10:20:25 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v4 0/4] Support spread spectrum clocking for stm32f{4,7} platforms
Date: Tue, 14 Jan 2025 19:19:45 +0100
Message-ID: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series adds support for spread spectrum clocking for stm32f{4,7}
main PLL.

To achieve this, it was considered necessary to also apply patches to
improve the documentation (conversion of `st,stm32-rcc.txt` according to
the json-schema) and the code (use of FIELD helpers).

The series has been tested on the STM32F469I-DISCO board.

Changes in v4:
- Improve the compatible property in patch 1/4 "dt-bindings: clock:
  convert stm32 rcc bindings to json-schema"

Changes in v3:
- Changes to patch 4/4 "clk: stm32f4: support spread spectrum clock generation"
  according to Stephen Boyd's suggestions.

Changes in v2:
- Fixup patches:
  2/6 dt-bindings: reset: st,stm32-rcc: update reference due to rename
  3/6 dt-bindings: clock: stm32fx: update reference due to rename
  to
  1/6 dt-bindings: clock: convert stm32 rcc bindings to json-schema
- Changes to dt-bindings: clock: convert stm32 rcc bindings to json-schema
- Changes to dt-bindings: clock: st,stm32-rcc: support spread spectrum clocking

Dario Binacchi (4):
  dt-bindings: clock: convert stm32 rcc bindings to json-schema
  dt-bindings: clock: st,stm32-rcc: support spread spectrum clocking
  clk: stm32f4: use FIELD helpers to access the PLLCFGR fields
  clk: stm32f4: support spread spectrum clock generation

 .../bindings/clock/st,stm32-rcc.txt           | 138 ----------------
 .../bindings/clock/st,stm32-rcc.yaml          | 144 ++++++++++++++++
 .../bindings/reset/st,stm32-rcc.txt           |   2 +-
 drivers/clk/clk-stm32f4.c                     | 155 +++++++++++++++++-
 include/dt-bindings/clock/stm32fx-clock.h     |   2 +-
 5 files changed, 295 insertions(+), 146 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml

-- 
2.43.0

