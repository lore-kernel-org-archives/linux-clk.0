Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B290E1EF366
	for <linux-clk@vger.kernel.org>; Fri, 28 Feb 2025 14:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740754793; cv=none; b=Hnh2rIPF2uoT3e06Zjd60l5QllNVHGMrpBwUjPDnkLCMHPikGeHa2bQdP7XOUX0Qjk53vjDEYPn6oSDW2itlL/mhHp0/K8qI6B1eItLKXNwkLMGdWMI57+hEeI7aSON9mUIxjRewTvZVn8FIQEQGtLiZHgLtazd6Aym/4QIrOOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740754793; c=relaxed/simple;
	bh=DN3OR3UNLTVv3BZYUZUuzBf8MA/QbjKRmT91vw7vVlo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c8VxzHzdJ5GajOMByc/oA094ccK20VfXZiLER1s9FkxUoPhMYxn9rywaseQHK6xhbShhXW0vFhuQ2a8Z4A6qtF38jO5NyklHTeYKmHYTDHs9rAbrs4qXH285dlfbyG6ung+eMSQDWDBR5c0jXUyZ7YNkUr4FXqfPvjlI3QGZyJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i27F/Wzk; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i27F/Wzk"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43938828d02so2514955e9.1
        for <linux-clk@vger.kernel.org>; Fri, 28 Feb 2025 06:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740754789; x=1741359589; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Aw1wgbpjG14q+kZJA/ykHz++iHt5asV20YBMvXwJ2LA=;
        b=i27F/WzkROLOKEHfVdRS1fFV/cbCMIa7zqgFyFi50Qh2Bi+Iq/0Dv1byuL+lK8bKg1
         CJZj/a/O7IcbXhLooDPY7Go2ssKZ4P45PeE2FKlLd6xUMnmZ+4Ta7FTVzSnFDU1Xf+nB
         S0p6oB9NRSQ40aTlHzZHd8q18aygfLyEDPYRl9OzL07g/LclUVpHn8gUmor3uptTQxN4
         pbewcdmETaLJkyEGeogtiFT4/tqidJlRbLNT4TGZ8cBnRSB8gEMnEcDWHET/1P0KXPVb
         D6x22rB/v0AsWrzFqDFfqPoWj7CUv2oawyj8B0u1Qk1xwUVKsLz/6eq4hnZM73ppczrv
         Km9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740754789; x=1741359589;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aw1wgbpjG14q+kZJA/ykHz++iHt5asV20YBMvXwJ2LA=;
        b=Ea6yq4KkAvouvHiQ8MsbkoCT7BMin8SSLTeIHGZyolTX8I7/iZQ/RC4R8Km9mq+cH8
         n3ec4wq6cpcG6oHhgggptLaaeD2GkR6o2fKVDlKy83ltuI7no8uHxcLxF+m+tcuKdYXD
         NrRQ5HKJUkZAtWPxQ1cB+HQi+urloKuYIEQgAgPIWRTgGXPWHGZcM6gz+vJSL58HDISR
         bhjUtLCWQzI0RS+sYxrYJAyJXQV+z2Nv0oGMWceyJIUM/ys/TIClX3UIJ14wJ3azsCx+
         jZfemzVpb/pH7+0JF9oQXc4rIDTyJWeCQMUs877F9nKVrLjFRg2sZsym3JkNy3aXRC9G
         9R7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSKkB+c+kvJ0JlwlaokTCaZRj4yX8//DzD7R9cXnctgcVT3r0ShXNXhngo6i82Ikm6PAhZyPNVOvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCPtMtuJYnVgqNvlYMmWmBqFWFH6W6mU2DEjJt62LHe7v9f2sc
	g4/pRaTqwHTZlkMrVNRcIfsFo+lH64EpkvxB0l/V9wjJcdo1V9cP5amsSpk1UlE=
X-Gm-Gg: ASbGncuuZ+SvZIkrbKeDIz8GlZWqvDlPXGgi8Z4xamd1vYznxHF8vu7lD9wnEI1Vqem
	imR1QWnnJgaN8Mo4FGr2Uf0lXo3gU5KZ5fN/Wv7g7agMJDmHazWERQSrZrB8GRhyUIGJt7BwAMl
	rWK7yuDUA7n3UOkCmCzeuZpgVPTfbl3W93a7wwxbyi1fYz906y59de2tRXm37YFFPaFYVwXp1ud
	nwTRb0hzroPCg+3IREv3yZZvybd+a2TYDlmzc0ebzkffzySiIeGlB1kbkA+0pc8cPmPeWKsiUqU
	OeB0ZhGVqk11HsyBgUEVtPKIXc9+ZAc2e6zFI4tJaA==
X-Google-Smtp-Source: AGHT+IGdH2qmH4oSCKqIKPqOphvmigtP0oYR69hECCBe35mqJksQQnWDr1GbP2Gygro+ZUA+rzOu2Q==
X-Received: by 2002:a5d:598f:0:b0:38d:be5e:b2a7 with SMTP id ffacd0b85a97d-390eca89669mr1148746f8f.10.1740754788946;
        Fri, 28 Feb 2025 06:59:48 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485d785sm5450770f8f.83.2025.02.28.06.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:59:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/4] clk: qcom: Constify 'struct qcom_cc_desc'
Date: Fri, 28 Feb 2025 15:59:37 +0100
Message-Id: <20250228-clk-qcom-const-v1-0-611ab80d45e4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFnPwWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyML3eScbN3C5Pxc3eT8vOISXRMjQ4tkEyNzQ4NESyWgpoKi1LTMCrC
 B0bG1tQC4PRM/YAAAAA==
X-Change-ID: 20250228-clk-qcom-const-4218c42710a9
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1409;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=DN3OR3UNLTVv3BZYUZUuzBf8MA/QbjKRmT91vw7vVlo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnwc9blSazgMczCJY+a4uFENOuZleWk2vJAA/pf
 +hHkFsdDNeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8HPWwAKCRDBN2bmhouD
 1zmiD/4+Kk7fGDoVklFFYQFk7elu4O4WZHQsWx2P0xeTLS8VoRAwjq8yenRESg0YmawIb1u1Zka
 Z77ZJaKWc5fysGYLRrYktBXYK//RfdwU3wCFOgAl8uenBC2m+xiCCIueSQuAWGJrsee0Bi7fOWE
 GWOVs+bL3/ZAPlRJp701WzC/o39QWxFPuDDwlUD40Asia2gGAV5iaXJEMW4UzPSF4EotaddYGyr
 e0rOUaaQZPpHCWhlx+p+ucayKTAggcLnADPoPDEBrKfTmAO0OAUzDylkWPucqOLLXb6Fdj8ELfy
 5pxTP7S/eARVJJbRyRssQNFaT/0nJbVdfdwjUUX2yrr0h7Zx+U4coCgnkpc1Io3X6m6mVw4teTa
 HXqXCkn4HvOuMNbuRy8hvLgHQb32wGekUop8JQ9XAgwX7GsYeDTwA06In07DIa7f0oEiMIoqmqU
 m+l2D7wge8x5lAZIHZ3U0cTwGdNegpNAO19P+c4woJMH3SCzp2PxqkZaqovwNmrPfu2XS9RQFZn
 w2siDi//Xn6nb8VR6qy2T/M4CUHufUdDCwjDW1DG+XHedznJsCUh9XxXubn3+wcK69y3AHQV0m4
 KhT2BDV5DUZQx5otspMy2SnT2FasDwcRmwf49YBewfbf4H65du/dfzO77nGH3nMxJA8RDX/aEp+
 qKaSMuOTQSodFMQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Make static 'struct qcom_cc_desc' const.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      clk: qcom: camcc: Constify 'struct qcom_cc_desc'
      clk: qcom: dispcc: Constify 'struct qcom_cc_desc'
      clk: qcom: gpucc: Constify 'struct qcom_cc_desc'
      clk: qcom: videocc: Constify 'struct qcom_cc_desc'

 drivers/clk/qcom/camcc-sa8775p.c   | 2 +-
 drivers/clk/qcom/camcc-sc8280xp.c  | 2 +-
 drivers/clk/qcom/camcc-sm4450.c    | 2 +-
 drivers/clk/qcom/camcc-sm8150.c    | 2 +-
 drivers/clk/qcom/camcc-sm8550.c    | 2 +-
 drivers/clk/qcom/camcc-sm8650.c    | 2 +-
 drivers/clk/qcom/dispcc-sc8280xp.c | 4 ++--
 drivers/clk/qcom/dispcc-sm4450.c   | 2 +-
 drivers/clk/qcom/dispcc-sm8450.c   | 2 +-
 drivers/clk/qcom/dispcc-sm8550.c   | 2 +-
 drivers/clk/qcom/dispcc-sm8750.c   | 2 +-
 drivers/clk/qcom/dispcc0-sa8775p.c | 2 +-
 drivers/clk/qcom/dispcc1-sa8775p.c | 2 +-
 drivers/clk/qcom/gpucc-sc8280xp.c  | 2 +-
 drivers/clk/qcom/gpucc-x1p42100.c  | 2 +-
 drivers/clk/qcom/videocc-sa8775p.c | 2 +-
 drivers/clk/qcom/videocc-sm8350.c  | 2 +-
 drivers/clk/qcom/videocc-sm8450.c  | 2 +-
 drivers/clk/qcom/videocc-sm8550.c  | 2 +-
 19 files changed, 20 insertions(+), 20 deletions(-)
---
base-commit: 8936cec5cb6e27649b86fabf383d7ce4113bba49
change-id: 20250228-clk-qcom-const-4218c42710a9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

