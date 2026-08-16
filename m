Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F1931355B
	for <linux-clk@vger.kernel.org>; Sun, 16 Aug 2026 08:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786868896; cv=none; b=N1bkZItxI1bDfr20ZrvaMvcWsXqeEq2V3W2+UOZVlO0wkDygF5zJ4DHd5eSoV6wEIpfa/GuwV5KpPtL1bNktIk8nk2odSjgUeraQO5Zyn62+DYMD3Z9+48rrQ3TUU/hP2OQlRR7XxKLY7yifRBmic2wZjJZKlqPzZ6XtdCP1KP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786868896; c=relaxed/simple;
	bh=vVVV/m13IjNChM/ZjwQGj3Jq/cViqlU0kkgLRzO556M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=imWROOqXWiByDmdcefppfENCy0v3I7g607YoXBjjCtCrEElAKvxhAuK2do50SLKCIhGXziXeBK3VKQhsa1Damvgh5VkSfYpgldV7UBK2to3nRpCtZrI541k7T5x20chrRE4yITIqja99EhU8A+mSWkjmFNKHbXFtsOj/DstQgwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9TkdBe7; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9TkdBe7"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso2383969a91.3
        for <linux-clk@vger.kernel.org>; Sun, 16 Aug 2026 01:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786868895; x=1787473695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GygFTkQxU74dE0opi3EUfTc1t7fZqz9y0D7YCf1CsrI=;
        b=X9TkdBe7qavLfbDInYx+/9Hx66YImXGBqwQglrS1z3N5SK77Pr76SSE6j2FAdXVpea
         kzLgHjhpCm9cF7yRchvM3TyahsItytMLLrDxiARB7/1HY4x2EmFbOG3PRQVzQLfnHjoq
         49VaE3bckvZGupdrLAB09VcpTTM+hI8G10z83oQVu9zsUzwnIeMkKzFLq9ITDQartZHR
         f5Tpwu31jl/4v4KixJfDqQ+02iYl8CJohmr+YFiBEBLRxpcNrWQ/FoYlyfN8Yvsdr9Gw
         /ygP9hXW4jINoNcY3VkZ4I2ugwt2pAfdM1Ojpjei6t50HuB/rc1nDc8DLlQEuDBnlyo/
         AKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786868895; x=1787473695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GygFTkQxU74dE0opi3EUfTc1t7fZqz9y0D7YCf1CsrI=;
        b=NfKuiakPzLifZHEoid2uLhGjdKnpioZ5RrejckLmtHBHN78cU0/RboSxG/pfjsQ/Kn
         dK71FIQmTV4MmraXenGwfbBBwM13uAKjWesq8PKa3JzsVbZ6wdQUqRs6tUMwQUl+l3h8
         AOR9ILAa9pxIf2Aq8YEZcsoCk7EhqdXayBuiX/uv/PkR3I2tuhnTJ12ylaf1WifNfzR4
         EYu1vxpZ8ZTIQ/lcFJMUPNxQLvTncewu27Rd33JnBp98d14v9Q2JbFF8xlEGmLJcFPsg
         MYep2mfn4tqavtgJ3ZKPO1v3QWfOW7K7728SE0d7QoZge+F3bzb4Efacd37XNrY5pxPb
         sUEA==
X-Forwarded-Encrypted: i=1; AHgh+RrgyA9qT9f4dWQY2G7bxZvRuk7126cl3189cfJ2I4lA7VCp67lA4e2iLUe73uARF/Bn+3DVwK93Y2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEYCupo70R7egX58et3I6+11Fc76G8I/IKFnFRu7bA/GuSWBmS
	jZZn9Wttth2IqTyFOBPqLPtsHQMV40O6WUYx1mkiGsMw8j+n3sPK1f8p
X-Gm-Gg: AR+sD13qeMRZTFZ6LqcXLEcT/loNzrGLbJ5kpgfC94xrriVDwhJh87cz9bUxycSJoh4
	+0ME0oquaxywrXUCDleTNtCZNpMh+3vXkUxrt6xyiB2GJ6rfdX1Cb4E8fq5yly2F3kF6utZ+S43
	MtUGUi4bQxPip4aLl1XFkPq7qY9/c3ysZSPW+gEIbNxwSKpxamGWHfnGPaEYTNHgQTfqaf5yyKU
	3NabITlXHWmfxDAHVbXdYSxJ1xceGlUbXv1OrC5YDQNES/mUX8ubT+UE1y+JJwvcfK99nrghtQg
	eHl3s95BQacjQPcMcEbZWaLoUW/+AtNn+ZvYvdcGz3/WM+Lw7eifeDP6nkx83bBSPl0RwMRjtm0
	fG6Vru80EDu3FVnx/3Q03oLdzm5TD8uGa4IB2QgHzmhu/a4XQCSuJU9N843EJx2zsBBpUec2+w0
	Qxf//Jl5UQ79U/DsqHa/dBCOAM+07/asHs4Aa4Ge4W5lupRV3KJ7W7KNWnidm7na5qv0i35hijd
	EG30lbGV6p9XkD1AYJTijo=
X-Received: by 2002:a17:90b:53d0:b0:38e:9e9d:9209 with SMTP id 98e67ed59e1d1-3933bcec7eemr17147634a91.17.1786868895031;
        Sun, 16 Aug 2026 01:28:15 -0700 (PDT)
Received: from localhost.localdomain ([152.58.201.186])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413889bca5sm39510388c88.12.2026.08.16.01.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 01:28:14 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: bmasney@redhat.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 0/2] Add Global Clock Controller (GCC) driver for SM7250
Date: Sun, 16 Aug 2026 08:27:59 +0000
Message-ID: <20260816082801.5773-1-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds support for the global clock controller found
on SM7250 based devices. This should allow most non-multimedia
device drivers to probe and control their clocks.

Sreeshankar K (2):
  clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
  dt-bindings: clock: Add GCC clock bindings for SM7250

 .../bindings/clock/qcom,gcc-sm7250.yaml       |   60 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-sm7250.c                 | 2347 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm7250.h   |  163 ++
 5 files changed, 2580 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm7250.yaml
 create mode 100644 drivers/clk/qcom/gcc-sm7250.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm7250.h

-- 
2.43.0

