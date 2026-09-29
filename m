Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4143D6465
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 02:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790647885; cv=none; b=W2wghPuBLOHo4XlOaa6CLRocNkNtxkJ8G8uQ/XW7zWAtyJBpPBmSammrzd/tpdzhyVg0H32zw4+Nuj5DeVGe+mMFzL8XAeCH72bwskTObHYbLXqt68sq6mhgagS5gg942Haf67po3maRak30IbztyaiZGn4jJPOzQZwy71F6eCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790647885; c=relaxed/simple;
	bh=EgYDFi4BW+VDOoi1vU1rBzdgU+J7xutAceqa3gTkfTA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NWfZ1tGauGd4f2aVvl7f+1Oa+lSbbPbNBhe6VZVunsmX65PvO2vN/i6p1TSeFewVisfY6wtXLTavkhL6mp1iZcSnHEqHiOlpMcJkXACJegOcQWFDp/3hfV3+mW7HPspLhHtPoGtXiI+gzHubILQyQgvYbTwonKfmLdE0qkEcWG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B1VP28x3; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B1VP28x3"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffed768deso3368765e9.1
        for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 19:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790647882; x=1791252682; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xcqkEPYdqVvbehfVnfP1K4y2ZexuDH7FdOmjxY1X/hU=;
        b=B1VP28x3fGfYrhgQYtrMvsTkaJeQG+t34MNnyKePWmjjOBnXlOjZ9dynXvsaMvIJcz
         sa30CO0ycqoWiEnCAeY7dLvr9EaW5GC1BEBb5wyawK3oBT1vDhmyUMVrHk9YvBDgac+m
         3ETm3v9sZnq18AInzc62oRYSKOwbhgdQt2nhuS6dBecTCx2G5jk10veVLKiC46cb7Co5
         VP0wvONvkTu0A+7uWmD6VHp080rWa5S1GSmiN+mTsDDNTUPKWZhP5L4hu43y7VcVyqpf
         eQkEbv8YAsfClPc+Cc4jXDuSbGAVas5WkUDc/ZQ3/8wDf1wfJWtVaU3Ze1yqKv5iNikE
         9hmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790647882; x=1791252682;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xcqkEPYdqVvbehfVnfP1K4y2ZexuDH7FdOmjxY1X/hU=;
        b=cK2B9j+3Ugy2dCtmWrEVHalTRuW3l6y6fMjT1xn9WXbWpBRmMnfKFk10DvVrPN2E99
         xPaC41vV+ygNLkaa7gAAhTqwJ/z20b9x/JOAp2u8cURGLGFID952DdU8jSRiw6qujL0a
         zqDF9Ms4kYUU/hJn93CozP5Juvhbz44e5rGb5i4nzfD2KFuZPuG0mWKOpa7VdVACTwYg
         9M/6Qhq7RV4IyKlVFkzpMnUfNrR8B69dfoBig62k/IrC+x6W68u6gcObwSImWJkh507n
         BlNkWy7KnKW19wIbYD/T29ayhsJKpb7WKlcvvJCBsVinvMREbvFQkbWvHj1uWPNJkopZ
         eMEw==
X-Forwarded-Encrypted: i=1; AKwUvByLzaE77ZurKjD8nFxWkOOfa2QqzIzJEFCofX69/NC1WFM98D/FsmXuOfDO/8LfTvSplGrpul8WTYA=@vger.kernel.org
X-Gm-Message-State: AFuF++kwsdY8FqY0SPFOyizIY048gyBR+ishHM4TLlmu7Wc+GGexwTS/
	Z6SHhiAL4Y/rcNrO6tYeoNbVr3G/cG3waFHq9tc9arEffg7E2jZELAXXvQf2eOzwo/g=
X-Gm-Gg: AYBFou31XULxrUiKusudqThHSnm+PzcjgodBn8taZb1w5Vipz4qKXn1FNcWsZyY7YKE
	54EDFXgW95HaFoh6GXXK6ggh4VP5Z6imuEPcW2755+CEg/vjjGJ32cl09OBYPJr46jDadhFIGxY
	9KOkJfUBYsAsPT7U7uSfA6snf9KDWo85050daM1b3QPi8zYfEogHp69ti33WOtTSsqYsOFQFGBB
	KhEgoOWWP8QDaYWWFygfa2DavA+wt08LsPLyWhRVK1g2fXf3DPU6lUR23oZQ95c/u7d9v+Egqni
	d32Hbn8e84Xuicon4Vh/KbWIaWVPctVWcc8WhV5dl6NDkwKTcUQKwj4u5xyrf9mN5OxKBV8K8CI
	BhXWnhzycopdoj18CUqP2JT4TXaJqlWIrsj6rTS3u11bO5ONVdCt4mlrXpK+wN3pCUfEl6lMhCu
	OT5BVBO8LDddhlKm1ZTtuSQMEQZsEy+4B6mimONLv/m8ArSwv6iQGZko3UO8wBpQfkaYSzH/LdY
	k9y9BJGs/3o2ZO+vyEIWySHM6EIGLytuo6qeJTf0YjwEP1tQA/eOwB15Xef/g==
X-Received: by 2002:a05:600c:470d:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a00d778efemr13043205e9.14.1790647881718;
        Mon, 28 Sep 2026 19:11:21 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0f66cfsm42070145e9.14.2026.09.28.19.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:11:21 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v3 0/2] Initial Exynos850 ACPM support for exynos-acpm
Date: Tue, 29 Sep 2026 03:11:15 +0100
Message-Id: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEMeu2oC/4WOS27DMAxEr2JoXQb6+JtV71F0wShUQqC2XMpRE
 wS+e1WnQNFVlm8weDN3lUiYktpXdyWUOXGcCriXSvkzTicCPhZWVttWN8YCXW9TTH2jAf08QmA
 Zv1AI0mWeoyygkQKG2uj60KpimYUCX7eFt/cHC31eytDyCNUBE4GP48jLvsrdzoH4Rv10z5yWK
 LftXDZb+feHe/ojG9Dg+qY/6qGj2rnXD55Q4i7KaZNn+yccbP9caIuwMx16CkPdDvhPuK7rN2A
 at2pMAQAA
X-Change-ID: 20260512-exynos850-acpm-firmware-support-0aefaf4104b6
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.14.3

This series adds support for the Exynos850 SoC to the Samsung ACPM
firmware IPC driver.

The Exynos850 contains an APM co-processor that handles IPC messages for
clocks, power, thermal management, and PMIC control. While it uses the
same underlying ACPM communication machinery and protocols set as
the GS101, the exact implementation details vary between the two SoCs.

Those protocol-specific differences will be managed individually by the
corresponding protocol drivers. However, a dedicated compatible string
is still required for the core IPC driver because the Exynos850 firmware
utilizes a different initialisation data base offset.

First patch updates the google,gs101-acpm-ipc dt-bindings to include the
new "samsung,exynos850-acpm-ipc" compatible string and adds clocks
descriptions for clocks that can be controlled via ACPM or by Linux
directly.

Second patch adds the corresponding match data, base offset, and clock
device name to the exynos-acpm firmware driver.

There is a dependency for driver changes on clk-acpm exynos850 series
which seems to be accepted/merged:
https://lore.kernel.org/linux-samsung-soc/20260915-exynos850-acpm-clk-v2-0-ffad4a6b3fb1@linaro.org/

In v3 I updated the bindings to be more forgiving about missing clocks
in DT to be actually be able to implement this in DT:

firmware {
	acpm_ipc: power-management {
		compatible = "samsung,exynos850-acpm-ipc";
		#clock-cells = <1>;
		mboxes = <&ap2apm_mailbox>;
		shmem = <&apm_sram>;
		clocks = <&cmu_cpucl0 CLK_FOUT_CPUCL0_PLL>,
			 <&cmu_cpucl1 CLK_FOUT_CPUCL1_PLL>;
		clock-names = "cpucl0", "cpucl1";
	};
};

and further add cpufreq support on top of these clocks.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v3:
- converted clocks requirements in dt-bindings for e850 into enum instead
  of consts, and added uniqueItems:true -- this allows to declare only
  supported and tested clocks at this point;
- Link to v2: https://lore.kernel.org/r/20260928-exynos850-acpm-firmware-support-v2-0-717acef9469a@linaro.org

Changes in v2:
- Re-worked bindings update by adding clocks descriptions and hence
  re-wording the commit message and adding constraints for clocks
  and not yet implemented pmic support;
- Rebased and re-tested with cpufreq;
- Link to v1: https://lore.kernel.org/r/20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org

---
Alexey Klimov (2):
      dt-bindings: firmware: google,gs101-acpm-ipc: document Exynos850 compatible
      firmware: samsung: acpm: add Exynos850 support

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 56 +++++++++++++++++++++-
 drivers/firmware/samsung/exynos-acpm.c             | 10 ++++
 include/dt-bindings/clock/samsung,exynos850-acpm.h | 21 ++++++++
 3 files changed, 86 insertions(+), 1 deletion(-)
---
base-commit: 5a956dde5526a634dca7ccad27c051ebcc306089
change-id: 20260512-exynos850-acpm-firmware-support-0aefaf4104b6

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

