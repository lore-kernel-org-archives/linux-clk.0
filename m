Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C34A2D2394
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 01:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784769861; cv=none; b=H6EOFSMbr/l95pX00vev9Uu2nFkul/sA3StFN0kv69gm3StZxxn2N2X6UDEJXhaPy0IEpEeH0PKJLqI9nYNaboafW08R9izGWezARuacR9i+rOEv2Y3cnvHfSTFsUMUaAX9EdM2bJCt9JvAkX7ueHLQ9H9WQb+el7ajduKHlbyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784769861; c=relaxed/simple;
	bh=lMUvG8FMcDQny9fNqRp3TCG6/uNRxCa0yHENbOIbwBM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZpPftl/PKuek4olmSqAyQtLrnWdgM9gKi/rdt9fL/1y5sFfAaxGSBmAo8cQCtKW/ZYvs52QPVdyvZKmQjV8KeRBa25Ca8Y/+w/634odt6ps1iZMpMov517CltorJmuLELTa+kK/HXVfU2LLpkXGzhjeAyV+Ei8nSRdAoWtoKJJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kh+L3AoG; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kh+L3AoG"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66804667af2so38263d50.0
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 18:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784769859; x=1785374659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p22cXgqkOK2Uxhc2g0dbrDiY3ACKRgSdYIBGvHqDRE0=;
        b=Kh+L3AoG4Ukl/AMbbfjZWAeOjnlNvPUbtLm7ECBy6kDEsE2pC21MUlgtDk0IWfZf+c
         oTOAdaFKIcH7RzGeWawTNwsdF4xkZtbLwnfSWyAhrFWRAbyB+UHuIXOtrBj03kUWD2/h
         3MxSRN2PKoksLYaOYEj4C83qGOzl+2iE6RxlRFhTYy3+AS5ZIHA39jjq2sHmjEl/H5eO
         LvnnH0+FAKvViOAj+fN9rBjMNPO3v7p8ldlV/k3MWHmiCU49SiAWgWLznymKI9A8D+R6
         G7v5UOoLtTh47PBUakrnX62nPyVhvnsMqLI1kgTdOOQLHoorgBJfaNnTE4TSjlaSprwO
         gsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784769859; x=1785374659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p22cXgqkOK2Uxhc2g0dbrDiY3ACKRgSdYIBGvHqDRE0=;
        b=iHbRp3XBK+93U9Js36OTDgwpLNGy/KHA7grByit0m88X2OX4kGB8qoIYdfAeVjGpsw
         9TYG8SxoKYxQ98jh9RlzHus46/XfLuin0ABWmSrl1zpWCSsZRAy8tc1ktcxvja7ujwKg
         gfe1lhl/rcXasFaQE+xTXW534mO5xHps9TG0Max00uUMdulPS+Yv5ZC9pGM97R2+quuH
         a6bTqYK1UdDKECgPTvgW7VmIs5uLRxDrh4bTUTQTCAFEwuZFN8D7m3n69FNbTG70aqTp
         QfblXiqbPgZ1mx6lyqyxz6s6Pm58csdYXz5bflBQrtD7WU2Z6xq2M+87qXMZktk+OWlS
         c6Ww==
X-Forwarded-Encrypted: i=1; AHgh+Rr9YLxTW4wWJgxS+m1pdm+iweICyKv7aLDrI7lkoW+zVFZmoJyWjmZfjJjAt+tdgWqLv3lS5nmj4gU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIWoZBWt0+WP8Vs7rlbMkYkjkln/MAxwO3PoZp7E8nfjII5RSo
	FDiSkaSgGuo7tfFrejXlMONsGwib3PLr1O5JYayO1AJPATgp998YtHdx
X-Gm-Gg: AR+sD106LSxQtiF99a9/e9xq0i8P7s+5u6mdNcrCcahXzpQhooZNPnWlm+09MzI6+cS
	T/U/2tfZBAsILvoXOyTQFnkd2cqhUtE9O2Foez+Kcu1sYtKmUM3U704UMsWxZiPx1UgdO/Mm/ot
	s93HzuKLNwyyFNK6DZhA1GOlbFFoyKKRN3G/dRu+oO2Hz2/X+6MJDPJ3H9Lf3E6KudAC38DUV+A
	sF8ZbrgDQc2ByS/vT8PzweIXlG1meavGacH5CK0Ha0CklgbYvT+uyuGFj8oFBqwyLu9FZr+l5L7
	YHv0UaM2K0OqGSnsUFgnBMJSIMk8Nh6ZWDsvAW5JPNm3aULS8sUAYfBdP9qZ/7NRJIphjQT60fG
	1iwa5o6T3ELhi05YwgyNXi5Q9BhIFm1Yl1ZpzolYym6O9+xNHHZprX7oKKU47cjLpZKivtiqAyD
	JmC6Hvz3LquIjIPEmu4dkmbTuR1DVdgFKSFpPu0tk=
X-Received: by 2002:a53:b884:0:b0:668:2f2b:f246 with SMTP id 956f58d0204a3-668a5041eb4mr198296d50.100.1784769859021;
        Wed, 22 Jul 2026 18:24:19 -0700 (PDT)
Received: from karli.attlocal.net ([2600:1700:7270:4eb0::19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6689056dfbasm2319684d50.9.2026.07.22.18.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:24:17 -0700 (PDT)
From: Aneesh Pradhan <aneeshpradhan2004@gmail.com>
X-Google-Original-From: Aneesh Pradhan <aneeshpradhan@acm.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Catherine Frederick <serenity@floorchan.org>,
	Aneesh Pradhan <aneeshpradhan@acm.org>
Subject: [PATCH 0/2] clk: qcom: add MSM8920 RPM clock controller support
Date: Wed, 22 Jul 2026 18:24:13 -0700
Message-ID: <20260723012415.48288-1-aneeshpradhan@acm.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add MSM8920 support to the SMD RPM clock controller.

MSM8920 is essentially MSM8917 with MSM8953's modem stack, which adds
an IPA block. The new rpmcc table is MSM8917's clocks plus
RPM_SMD_IPA_{,A_}CLK (same IPA IDs already used by MSM8940; no new
dt-bindings/clock/qcom,rpmcc.h entries needed).

This series is split binding-then-driver so the shared clk-smd-rpm
changes can land via linux-arm-msm independently of the MSM8920 /
perry device trees (requested in msm89x7-mainline/linux#48 review).

Based on qcom/for-next (d36de2e50966). Applies cleanly there; also
applies to torvalds/master with a trivial yaml-schema context shift
(flat items vs oneOf) if preferred.

Hardware context: needed for initial MSM8920 + Motorola Moto E4 (perry)
upstream DTS follow-up. Fork PR tracking: msm89x7-mainline/linux#48.

Catherine Frederick authored the original fork series; this re-roll
keeps her From:/SoB and adds an [aneesh:] note + SoB for the split /
rebase onto the current for-next binding schema.

Catherine Frederick (coolguy) (2):
  dt-bindings: clock: qcom,rpmcc: add MSM8920
  clk: qcom: smd-rpm: add MSM8920 support

 .../devicetree/bindings/clock/qcom,rpmcc.yaml |  2 ++
 drivers/clk/qcom/clk-smd-rpm.c                | 31 +++++++++++++++++++
 2 files changed, 33 insertions(+)


base-commit: d36de2e50966f3dd9ef3482f1faf649b3d697714
-- 
2.53.0

