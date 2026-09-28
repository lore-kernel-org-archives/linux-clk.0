Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81024F5DE8
	for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 20:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790628909; cv=none; b=hoftvOEiOsX2w0lkfUFSIBA7Cfz0ks6NA46yzGjXBmKr5fItcIG2z1ROuLJE6y+aJrzPVfBONwgwLO3PALqXo0qHvJLc5N3GqWpMDW/HOuTw3UKsKFBETdihTwDIegRI6xzOmuFDj+674yzG+2ypuRziBQ1Dn3y1qCPafCuP424=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790628909; c=relaxed/simple;
	bh=Gsni/OUxA6Ij7SagrkgqJOG5js2KISCrkYNODquWIb0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RtPDNI7SK9adp2/mTtLJmKWheJgT8faNLSyAQlJEVg79MxcFczi0Dg5+D79YV4w88IeqspD0bGHWndRSjZk3FId5v+WbHPP97PLAPfNbFhwb0RaQt7RDrdeXwTFRlD+bVSF4dZ73wJeUUPPrIyNj9muQ1lXuYvWIyMIn/NXIinQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LK9EKoGT; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LK9EKoGT"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so14303785e9.1
        for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 13:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790628904; x=1791233704; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pZc96VEoN3/pZiTvd3D//LSSDMavgTBbuqhxg2bO6kc=;
        b=LK9EKoGTq6KzvGuq5zBwBgpPpGbfF1IKscBd8PDHB8P5cUr52liiYh7zso5hNbhp65
         1y51Qyvt+sBd8XNJnqMMTBDsllvOm/xJFUh53Bhqa0TCMtifVrzrAm8o58wZOP/E/Xxr
         8DyPMV3ymaQGG4e+A2ZujqUn8NZZa757sZ4OEd3xDo7XcZgZxuX6EChyEEVrhacC4coN
         hHzDna8mlLiaM75zwYb0clTo7uLYah5SdhHr/jvJB/m7ZHJ9+l9oXqAWH+bC4u8sAOe7
         aTWUzaHGnrIMP6U1r24BAjYBJOs6jCuQHXBrJUtzZf5Z5Wl317utvk3VZ0qdt6Pgm5kv
         IJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790628904; x=1791233704;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pZc96VEoN3/pZiTvd3D//LSSDMavgTBbuqhxg2bO6kc=;
        b=JUBOGl9pAuaDx+IoFHhshJVrsxmmvauJ3+DlKytNdyN1XNfFy6x95mmcZMtYb5BImv
         o6M3EUKRM5ZKHZyghURnGiqINty1gBUEjiwW6M518793qpgJD5/WQi+Y+cmO/9DFRr8H
         Xk13LkZVA7tZ4c4iNaFBn8Mhrf33xDCj4NN4YRMOWyosY/drjAVTsQUYmwXrcxbPDnXr
         qiN/3cgiTouVe+1ZR4dnyWPP3dYQmfGXxwoRmUCl4C6J80OBxmjRVEVuNP/Fht1WCBFc
         n6uwp2lHoAAGVEhlSsqcNZch/dtqsYgot9p2mZcChtXVsMEfClsFsFv+xMeepcZGiKkN
         SVSg==
X-Forwarded-Encrypted: i=1; AKwUvBwIErVX5bE4yI+E2iK+Jk6bYvv+vhojcAy8wLtsVAPZWgMr6JhXcMPM6IjcxocCDaVzFUGodk9PrY8=@vger.kernel.org
X-Gm-Message-State: AFuF++m1PCNq1uR18tCT+YPWlphFs6yfEsn6u20p/4ViyHIPvGe5jz/P
	/zuIO1k83cnIWHVBh9gwUwJv8ieUIsya7AQRajf36XNCeT+p+MLneK27xhHCMGq6Ct4=
X-Gm-Gg: AYBFou0Z9ydWiRtEEjFcMmKkNYFeWz389AQduNc8ZYVqTEDXbmUfqbiOG7JYViDmLro
	N6+7e7GxTKYOpC0wEjWCpLFOh7SXOt3BR6WjEPnC1XvrQBDAlRVGWBuEhcyzfp/aAChpTQR3uoQ
	uJp+WgphCKjYeuv3lshqTIp0Yn7wDIkEISZE+bbo/tuoPEvXgwJ819Rjzn33e1CX4UIecqw2OPn
	pAQnbmAk+3fKRTIZ9GTaDh4BzlsbtRZho5iRDPG+b+CIGLELrOW3GMmMGMCufP8RdKjKs3kGUmW
	ksLkp3ipmccO2nJoewauUeoYfxDe1BHbkrD4/VkDi5dTCjduaAbNZ/Bq6V11MRJuZ1ZXZHXSQOz
	Vh/g8Uz+PnV7QhNQPxTBNL4iAk/tRTbh/TJskeM/UduYXezzI2rpjklWBp5nPRUgQZwsgoTY2ZL
	twFRdz0+nCDr26CW8/zPmBKqmK5jrCR2fEaBC2j77aL2zTSPNmhQ9IxHv2jVN7+0UNkqmztX/ob
	R1MxPJX6PUixzwpjROS6pRBBDv5+Evpp7u8shTyZoEMeygqnlYDrx/7ASoz8IOEj+dLpvSF
X-Received: by 2002:a05:600c:8718:b0:49c:fc6c:be08 with SMTP id 5b1f17b1804b1-49ff06f8316mr175925425e9.31.1790628904029;
        Mon, 28 Sep 2026 13:55:04 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfec703sm18042045e9.6.2026.09.28.13.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:55:03 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 0/2] Initial Exynos850 ACPM support for exynos-acpm
Date: Mon, 28 Sep 2026 21:55:01 +0100
Message-Id: <20260928-exynos850-acpm-firmware-support-v2-0-717acef9469a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACXUumoC/4WOwQ6CMBBEf4Xs2SUtBUVO/ofxUGHRTaStW0SI4
 d9F9O7xTSYz7wWRhClClbxAaODI3i2QbRKor9ZdCLlZGDKVbVWhM6Rxcj6WhUJbhw5blu5phTA
 +QvDSo7LU2jbXKj9vYVkJQi2P68Px9GWh+2M56r8hnG0krH3XcV8lwy41KHUBn+6VY+9lWuUGv
 ZZ/Huavx6BRoSmLslH7HeXGHG7srPjUywVO8zy/AVlusXL7AAAA
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
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
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

With this series I expect for ACPM firmware DT node to be:
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

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 54 +++++++++++++++++++++-
 drivers/firmware/samsung/exynos-acpm.c             | 10 ++++
 include/dt-bindings/clock/samsung,exynos850-acpm.h | 21 +++++++++
 3 files changed, 84 insertions(+), 1 deletion(-)
---
base-commit: 5a956dde5526a634dca7ccad27c051ebcc306089
change-id: 20260512-exynos850-acpm-firmware-support-0aefaf4104b6

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

