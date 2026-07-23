Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBDD1D8E01
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 01:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771193; cv=none; b=FzCRO7l0LmlxzSDskBWp3dlZUIWSY6kMs8Z3g/JjabnZc4RqHgWrgpbE58Pqs/Z9+UtKAlRhc/7Vn1YXmoS0z26pBB7zTtiSLLW4GfZdquB7vPE2sqspCBM4fbgYgldf1pwJFUusU+NM8PSKeSpuJJslvY6n0IO7h5w7OG04Nmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771193; c=relaxed/simple;
	bh=68ATJgBzTZTUdvfoG0MJ+7Tai0B5DUi3LXxfB1fRbss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EVuY8GMB2UceLu2XDMsNiQf5NcwpaRtpRCk2uKwv+VrvfwJjsoR8WE5evCqlVUBc07sQig84TbT0uteM5rP1bqYVXE1ish6H786THCTFfArYdHr2cbzdxHUaLD6XMNi+BItIDvV6RlElPznt8hn9eQtasrAWhqw2bmhdqcJ3lIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fx+fwcSo; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fx+fwcSo"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-81e83f1f15aso660217b3.1
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 18:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784771190; x=1785375990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=806bBlE70dTbD9t6qcYHAWco7K+1cMcnXPvu9D6RFV8=;
        b=fx+fwcSoIDmbocjemiSumadFxU6mfqgDpkgN6mFA+7fhUveMd7p1GtCehv++5muxVB
         YEnZbXy9By1PTM03YShxEp7Dh87dC2xfTsXuqq7KEXqUoR94bUEzExz97ubFZnj5vEYq
         CXzgPImUwLMHMjMIUNpIl4A+FKin0IVcR3fMVKaYaV3ubvROZyqy/yke48IaCcN3N+Wm
         Lm+rQIFrRDSrjTDVzNAz74lHXJz8ZwlHRyrYfQjXz2vkeOH9Yv5mKd+Gbeb6wUBVcvVN
         4c0owWXRIncFmHXRKfYYNMJtm5k+lXQkUkOfLhzGl16ZrTETvO7LW5AhNoxvKrqRb36E
         xfUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784771190; x=1785375990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=806bBlE70dTbD9t6qcYHAWco7K+1cMcnXPvu9D6RFV8=;
        b=f6Wtw/PYKoKQG8TtORTSUG5cd/qG8Fjw+gbBw7dFLzkY8NK/U1JhEklqua4S/NQFS0
         THcmtl/zhxSbVtL2Z4j64HveYcGNmCQ5U5ceeWABxDnkoknm9y8pMBVZivQcfj0Y3PMK
         iCy8wQYzqqpAoeD/D/OTilWUAM3qvnFLyxHymH9D03G3v2VNBeLPXO7NvEEwwOhlnxqo
         wSyJrbFSeqJ28PAhdqv6h061aB+/tdyLEYyef3jIVfas+vnIra4Sb8Xb/vcbA0vr7c2O
         agk85qfiGvXcjLX/jPeHtwT4GlspJy/VC249PC7+NvfA5QXI/GU3x+8iLMUD3rANa4IH
         AiZw==
X-Forwarded-Encrypted: i=1; AHgh+RoQcReU9Dv0KUHiIHDhGwtrb/DWtO5wFuFbX6h/2+lAg7Ta0l0NGYqv4wzcwUZJPnr2uIGdgwOjL8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJYKdl1+S11/DZk7HOF0WUwYe7DiqXNtk8dkKxa0rRr+FA0DZI
	b81S8TbQavLH9FvrKbfCF/JAU/RS+2X+GYEQaZnp16/WZv8CDcmp/vHa
X-Gm-Gg: AR+sD10nwX1d71qhKhUGDjbNvg5PuSBL3cNRyFIBuQhp/05tPpo8LbMoPzCzm7Y3Hei
	uZ6dIK+FLZSFmcOlJezR1NlHThiF7XeZo45l9iBjqVPwC2h6omCT+ChHK8HVWajqo3f67R4wJQu
	nvFOchfAreRnT/irjFwsIMG//ZsHnVIYLsLTFMirtYzuXofy/iVb8PKasAB6sBIw4PR6IHKQ+ZI
	ny3yzBJqm2jJQnoGByEHP5NDfgkHeLk9P5xho+VugjVVAeN1+RVxsPKcXXIsieR+C7H1zHd62ku
	qpjZg/udcJh4064RZrN6NGqSuamHKwH/tAeaxRiIKcWwbfmYKqpL0X+7zxIW+oOt3CSVsBfPPdg
	YDMWUcebWN/aHSGupwTCCoYOsasTWniYVlkFn1a+ihcT0DkYntKsB+lVjQ5hMHvtojgWG3Fpa4u
	9ATevlVkcbJ+bPVvyi+SkHjCJGtYiW30Hm04L0SM8=
X-Received: by 2002:a05:690c:6882:b0:81e:6563:72ee with SMTP id 00721157ae682-81f4d3b5891mr2221677b3.14.1784771189976;
        Wed, 22 Jul 2026 18:46:29 -0700 (PDT)
Received: from karli.attlocal.net ([2600:1700:7270:4eb0::19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33bf2e50sm22038487b3.10.2026.07.22.18.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:46:29 -0700 (PDT)
From: Aneesh Pradhan <aneeshpradhan2004@gmail.com>
X-Google-Original-From: Aneesh Pradhan <aneeshpradhan@acm.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Catherine Frederick <serenity@floorchan.org>,
	linux-clk@vger.kernel.org,
	Aneesh Pradhan <aneeshpradhan@acm.org>
Subject: [PATCH v2 0/3] arm64: dts: qcom: initial MSM8920 and Motorola Moto E4 (perry)
Date: Wed, 22 Jul 2026 18:46:24 -0700
Message-ID: <20260723014627.63310-1-aneeshpradhan@acm.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723012431.48499-1-aneeshpradhan@acm.org>
References: <20260723012431.48499-1-aneeshpradhan@acm.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initial upstream support for MSM8920 and the Motorola Moto E4 (perry).

Depends on the separate qcom,rpmcc-msm8920 clk series (binding +
clk-smd-rpm) for the MSM8920 rpmcc compatible used by msm8920.dtsi.

This is a trimmed mainline-first subset of msm89x7-mainline/linux#48,
rewritten so every phandle exists on qcom/for-next's msm8917 / pm8937 /
pmi8950 (the fork DT assumed richer SoC/PMIC nodes that are not
upstream yet).

Included: regulators, eMMC/SD, USB OTG (gpio-id extcon), keys, RMI4
touch + reset-gpios, BMA253 (i2c-gpio), WCNSS (wcn3660b), PMI8950 WLED.
Deferred follow-ups: DSI panel, IPA, QDSP6 audio, FG/smbcharger, modem.

DTB build verified: msm8917-motorola-perry.dtb + msm8920-motorola-perry.dtb.

Changes since v1:
- Sort Makefile DTB entries alphabetically: place
  msm8917-motorola-perry.dtb before msm8917-xiaomi-*, keeping
  msm8920-motorola-perry.dtb after the msm8917 block (Sashiko review
  on v1 patch 3/3).

Catherine Frederick (coolguy) (3):
  dt-bindings: arm: qcom: add MSM8920 and Motorola Moto E4 (perry)
  arm64: dts: qcom: add initial MSM8920 device tree
  arm64: dts: qcom: add initial Motorola Moto E4 (perry) support

 .../devicetree/bindings/arm/qcom.yaml         |   7 +
 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../qcom/msm8917-motorola-perry-common.dtsi   | 412 ++++++++++++++++++
 .../boot/dts/qcom/msm8917-motorola-perry.dts  |  20 +
 .../boot/dts/qcom/msm8920-motorola-perry.dts  |  20 +
 arch/arm64/boot/dts/qcom/msm8920.dtsi         |  12 +
 6 files changed, 473 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8917-motorola-perry-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8917-motorola-perry.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8920-motorola-perry.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8920.dtsi


base-commit: a27464b0b99874d22b04a92186ab7ea9252c3847
-- 
2.53.0

