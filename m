Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503064414
	for <linux-clk@vger.kernel.org>; Fri, 10 Oct 2025 12:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760100406; cv=none; b=qaCCk1E+fo5DWal85RPEQm6LywuUTBhRZOnJSssG2Eto6i+bDk1n+tAX8luBRa36W4SeJfixZiC1Z3ywY2mQHecqoeYpKTdHEeG1tbbc4+66EGBS88sxcsKJU9J/X4WL6v6d/zeFTMsJJ3cJF0iSuo256aEhrx64nqIoZ4qVC24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760100406; c=relaxed/simple;
	bh=sMfv3TLRGxjMXD6OCX5QEzplP012kwoWjahSV/92jHU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bmEJwQ9lPpfE3QicG+YUlAvz22mqVsMdaUQ1RoFOHy3bnMbsUDj3/tF7JjtUKHnM7cdZWIC6PmFQB2p+Posfl9voeEWPTNqmvnnhXsqx/zqpH0TGKtGyAKAyoxu6ozFMZmY7B0QDgBWg9p4feMpGJ10Bh3/ynumPu5xf4NVo+FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HXI+aK+J; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HXI+aK+J"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e384dfde0so19311105e9.2
        for <linux-clk@vger.kernel.org>; Fri, 10 Oct 2025 05:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760100403; x=1760705203; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ejjXNuvOY4qHqOLsDaR4tDbzd5dU03zyuYMmAd/GyvQ=;
        b=HXI+aK+Jv3p3p86fEtvXmcmBkbaW89HOgGOPZDvVE3mepCSeqSSCpwWlM2oFJKtN8/
         eYUhxN9LtkCLkhbUOZRacAX33QG38ZXXhiIjc3pkjpGds2DH/JwEifXU21VJqra2HlV3
         I0uqVGhF/GvCBFrlBjErsIgBQhRlD9LdZBxtQY2MWM+cGgqh3A/jYAl7qFYdVKR0hx2/
         clYs0i4TQmQJ5SWNjGbLmcd6t+CUSZ0z6yhop3+8gzrc8NEyUeYJXqUBo6XJB2VMsQfJ
         kG9EfttK6nnQ5vvYxi9i7ohVdRZWx+XsvXLeXQ63GxVQpWZBiCrOgkAubDrB90YyHX5+
         wowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760100403; x=1760705203;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejjXNuvOY4qHqOLsDaR4tDbzd5dU03zyuYMmAd/GyvQ=;
        b=tty1zDsn23NLnZtu7cQB5HI4tALWcD2N0gQTXqrsQsBMYqKRzAAx4DYVpYKJq7Py7E
         xLcxQG9xHS1fq6HyMBEPbRWMFc6APoNlkzT4LHdBO92CXUI6ljb08iuZQ3zcAnf2bWQn
         kvPy+ybtgHfZ9IACU7XoBhHWg6CXe2f9LlIN4QQ1Pfj1aMuoUV0jntVmEOugawlU+F/w
         n+HRMKs+ACoMlZG3NlGch1eZ8mwGerssbqNSRLzN25saFwkQ+mQVOaSPpp48hZrlC4d0
         dQPI36OfBUcaAqDqzGsBCTuuMdvYqoLDqMxHXcSHIR3VYvS1iclzav12qdWec32RvIdj
         1+Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVQwATfDkpOK3icWjsiIoSy/UyHuUkhJVxD4IRkTvKqR+bOKMwoWtY5kDhjSJNCS7vZeGcFfqvHOmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyayEMiK3vqggy2wU/1rNPtzaJJBN2JFjil9r6xJWDukgrHG1mn
	NGL8BoUucESdmoBkY3KFdixiQCujnalMJqG/OQHsA554yAhkTNYRFzZl/12Vz1gqR8A=
X-Gm-Gg: ASbGncuwV5OhP/jYdOfjiCz64iYu37EuUxkQgKdzsU47wqg/3KVRiRnNXgewqgYpVuQ
	CA4oEpNuDj1pHFXJel04AvwQFpjX0fTVsO1xiyzEh9Cl5xYfAV7Znmz2NyiQYYI4rRJeEtl/+dr
	5AU2EfUJXF8/RFNWIY8fMWqcTNBRq44KNjIZ1evTzSHc+vLuNEhnaPf7oMMbmJStLGhopLAZf6b
	UBcWHIw2foQjHFUHC/sCdcta8Ghapqfcv91ODopA6ZJ8E2mpsKFbgiAONJ1kMQ5CXuBiTgxZcXA
	N+aQnlEtY1Qf4S6rKAyU+bZuh8KUo5Hi5EMyarGf8n53jlSqibJue1ujGtD97oJn5OYzljf1ep0
	w7NK7uTLimE156a3JSXlhmhP5xXroYn7fUmGTnDdCqaAEKkk+MqJ626TYLNlVa3Ta88gCdbVG5e
	9syozvVcQprsuu5zJQgn6oJQ==
X-Google-Smtp-Source: AGHT+IFFVh+qVBdW5ElAZZfgvNHjG6SIuxAjy6I3c4ghlrs6mBTWOZSzV+ytuvT6FMhPPEuwTiq4Gg==
X-Received: by 2002:a05:600c:529a:b0:46e:3802:741a with SMTP id 5b1f17b1804b1-46fa9af2d67mr72482845e9.22.1760100402653;
        Fri, 10 Oct 2025 05:46:42 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb484d056sm46376895e9.9.2025.10.10.05.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 05:46:42 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v6 0/6] exynos-acpm: add DVFS protocol and clock driver
Date: Fri, 10 Oct 2025 12:46:30 +0000
Message-Id: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACYA6WgC/23OTW7DIBAF4KtErEs1DMOPs+o9qi6AIQlqake4s
 lpFvntxNqVyxeqh+d7MXcy5ljyL4+Eual7KXKaxBft0EOkSxnOWhVsWCGjAq0GGdPuQ6fou0TM
 G5zNocKKN32o+la9H1etby5cyf071+9G8qO33n5JFSZA2Rh4cObJOvVzLGOr0PNWz2FoW7CS6T
 mKTnE3yNtIQLe2k/pUD6E7qbafJiQnZ++R2knrpO0mb1FobSO3F/bWmk0idNE1SSkGdAjMA/5H
 ruv4AKonej4kBAAA=
X-Change-ID: 20250819-acpm-clk-28d2a78e0307
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760100401; l=5658;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=sMfv3TLRGxjMXD6OCX5QEzplP012kwoWjahSV/92jHU=;
 b=qIvKlqHpyoQD8t1YCdVatudYDt0vnXZPCCRI4cw/L2+rdVui9oFehURMKYsHJVJPt5tlczkC2
 KHJTUWeUpK9Buu5wQYFtHWLo7PaaM8LqdI/vZ4VIJzJ0VlwmbxSur5d
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Dependencies description:
All patches should go through the Samsung SoC tree.
The acpm-clk driver (#4) depends on the ACPM DVFS ops (#2).
If the clock subsystem needs to merge the new clock driver, it will
need an immutable tag with the 2 patches.

The following DT patches depend on the bindings from #1:
https://lore.kernel.org/linux-samsung-soc/20250924-acpm-dvfs-dt-v4-0-3106d49e03f5@linaro.org/

The Alive CLock and Power Manager (ACPM) firmware exposes clocks that
are variable and index based. These clocks don't provide an entire range
of values between the limits but only discrete points within the range.
The firmware also manages the voltage scaling appropriately with the
clock scaling. Make the ACPM node a clock provider.

Add support for the ACPM DVFS protocol. It translates clock frequency
requests to messages that can be interpreted by the ACPM firmware.
Add an ACPM clock driver to model the clocks exposed by the ACPM firmware.

Thanks,
ta

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v6:
- acpm-clk: s/b0/bo, (big ocean)
- acpm-dvfs: drop dbg_val arg from get_rate(). It's unused upstream and
  we'll probably choose to introduce a dedicated debug API if needed.
- MAINTAINERS: add ACPM clock bindings and driver (new patch)
- Link to v5: https://lore.kernel.org/r/20250924-acpm-clk-v5-0-4cca1fadd00d@linaro.org

Changes in v5:
- acpm-clk: address Stephen's comments:
  - drop of.h unused include, add devres/devres.h and container_of.h
    to avoid implicit includes.
  - r/acpm_clk_ops_init/acpm_clk_register.
  - remove period from error messages, drop comma after sentinel in
    platform_device_id.
- collect Peter's R-b and T-b tags.
- Link to v4: https://lore.kernel.org/r/20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org

Changes in v4:
- clk-acpm:
  - remove GS101_ACPM_CLK_ID type handling. Dead code, it should be
    introduced with next devices.
  - remove runtime check on clock IDs. Instead add a comment about the
    assumptions the code is making: the clock IDs start from zero, are
    sequential and do not have gaps. Slight changes based on this
    assumption: s/hws[id]/hws[i], remove the inclusion of
    dt-bindings/clock/google,gs101-acpm.h and the use of the clock IDs.
    The clocks are defined solely by name in the driver.
- move firmware patches close to each other, in between the bindings and
  the clock driver
- update the description of dependencies in the cover letter.
- Link to v3: https://lore.kernel.org/r/20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org

Changes in v3:
- dt-bindings:
  - move clock bindings to a new bindings header
  - update commit's subject, s/add #clock-cells/add ACPM clocks.
    It also suggests that the bindings are added.
  - prepend "GS101_" on clocks binding name. The bindings name are the
    same for GS201 and the acpm-clk driver will likely include both.
  - collect Rob's R-b
- clk-acpm:
  - move clock definitions here instead of keeping them into the
    ACPM protocol driver
  - use platform_driver.id_table to differentiate device type
  - fix Kconfig dependency, || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
  - update commit subject, s/dev/pdev
- exynos-acpm:
  - move clock definitions to clk-acpm
  - use devm-action to unregister clk-acpm platform device
- Link to v2: https://lore.kernel.org/r/20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org

Changes in v2:
- dt-bindings: clocks are not longer a child of ACPM protocol. Instead
  make Alive Clock and Power Manager (ACPM) node a clock provider.
  Update commit message.
- firmware: exynos-acpm: register by hand the ACPM clocks dev (new
  patch)
- firmware: exynos-acpm: use defines intead of enum
- acpm-clk:
  - switch to determine_rate
  - drop __init, __refdata, __initconst, this is a module, we need those
    methods and data, after boot as well.
  - fix the assumption that the clocks are defined by ID in ascending order.
    There's still an assumption that the clk_id < nr_clks, but this is
    now covered by a sanity check in the clock driver.
- arm64: defconfig: enable Exynos ACPM clocks (add patch together with
  this patch set) 
- Link to v1: https://lore.kernel.org/r/20250819-acpm-clk-v1-0-6bbd97474671@linaro.org

---
Tudor Ambarus (6):
      dt-bindings: firmware: google,gs101-acpm-ipc: add ACPM clocks
      firmware: exynos-acpm: add DVFS protocol
      firmware: exynos-acpm: register ACPM clocks pdev
      clk: samsung: add Exynos ACPM clock driver
      arm64: defconfig: enable Exynos ACPM clocks
      MAINTAINERS: add ACPM clock bindings and driver

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |  11 ++
 MAINTAINERS                                        |   3 +-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/clk/samsung/Kconfig                        |  10 ++
 drivers/clk/samsung/Makefile                       |   1 +
 drivers/clk/samsung/clk-acpm.c                     | 185 +++++++++++++++++++++
 drivers/firmware/samsung/Makefile                  |   4 +-
 drivers/firmware/samsung/exynos-acpm-dvfs.c        |  80 +++++++++
 drivers/firmware/samsung/exynos-acpm-dvfs.h        |  21 +++
 drivers/firmware/samsung/exynos-acpm.c             |  26 +++
 include/dt-bindings/clock/google,gs101-acpm.h      |  26 +++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  10 ++
 12 files changed, 376 insertions(+), 2 deletions(-)
---
base-commit: 5472d60c129f75282d94ae5ad072ee6dfb7c7246
change-id: 20250819-acpm-clk-28d2a78e0307

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

