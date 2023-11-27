Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MX7dQbbl"
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B17F4111;
	Sun, 26 Nov 2023 16:57:49 -0800 (PST)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1f9efd5303cso1782368fac.0;
        Sun, 26 Nov 2023 16:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701046667; x=1701651467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=anuKUTT2qQ23MO72ERy79Xb3CqrQxY2OTkF5ssDc4FA=;
        b=MX7dQbblJAmUsOfb9LSbsa6T2BwyV6Zu93/IpleDM6MO3SYPxv0HRPJzxePzQdF70s
         IvNIP9/zBbKV4h0us6ddU51bMAIVFCWyt+u9NGnooXdKLKA8ZprUDOC/mss2x7ribj7V
         75JJ/DyjJJIs3FM84bNEpzBUkRPqHUnyIrvdtgheXVYdnzgiI2i3/z71GGG+ZOb7s1gf
         oKu6LSRkCqRWzpX3yGziQ4njdIUtz1QrFN5Am1inYVVFnzqS3l4V4WnTxITOn8vzI4Mq
         cFt3zyqgAEE8WT1h+kEb/TiZ1V0UO5bhMSh482fMdo2SJVqEaWVmGwBsUmBBAFI/Qd2X
         johw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701046667; x=1701651467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=anuKUTT2qQ23MO72ERy79Xb3CqrQxY2OTkF5ssDc4FA=;
        b=UQS56WwXDj0zFUXpDLX0zcXcPwFWo17ja2eFItyDr68CrgMSaWSl8Cmr8gbJxEGCht
         2VbK7HZXSM0/U+zqqgpBafhjf7czh7kHQ5RFJcXJvC4gGbcGVaiWBPU/0YRf79rcihM9
         I6p6bN3nJGEKVJ/VtQZG9sqPxo7tNhF96GlOtVVjANxJlVJhqjr+N86utEt0ynKiL2I9
         rpwCQnoceF1KTRepbQL4VVOwLQsWtWLctoIuNtWIU19PDIHVE5Sh1JbcBzE0bKVaTbE9
         zideVJD8Iciscm4BIsWisvCJOVP7czmyTXa59Ql1X0uD5M5h1sdMUFNjCXyJuEyn4EBt
         Ptgg==
X-Gm-Message-State: AOJu0YwwUFv5jXLC37iJfpFNVmRVMfzcYv1P5Jfsr/UlUrwZymB7AQom
	Hs9vDGLni4y2O4L5ZrQIjhs=
X-Google-Smtp-Source: AGHT+IHTXVRmvu8R/pFriTl3YpWLtwnkQFp4TQPulykiB18SUXQvFyQZ+lHa0vp89dnaAul0sfyj4w==
X-Received: by 2002:a05:6870:5490:b0:1fa:2fbc:5906 with SMTP id f16-20020a056870549000b001fa2fbc5906mr5838689oan.42.1701046667393;
        Sun, 26 Nov 2023 16:57:47 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id pi10-20020a0568704c8a00b001f9ec4edbfbsm1651566oab.50.2023.11.26.16.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 16:57:47 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	richardcochran@gmail.com,
	robh+dt@kernel.org,
	sboyd@kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	inochiama@outlook.com,
	samuel.holland@sifive.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v2 0/4] riscv: sophgo: add clock support for sg2042
Date: Mon, 27 Nov 2023 08:57:38 +0800
Message-Id: <cover.1701044106.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

This series adds clock controller support for sophgo sg2042.

Thanks,
Chen

---

Changes in v2:
  The patch series is based on v6.7-rc1. You can simply review or test the
  patches at the link [2].
  - Squashed the patch adding clock definitions with the patch adding the
    binding for the clock controller.
  - Updating dt-binding for syscon, remove oneOf for property compatible;
    define clock controller as child of syscon.
  - DTS changes: merge sg2042-clock.dtsi into sg2042.dtsi; move clock-frequency
    property of osc to board devicethree due to the oscillator is outside the
    SoC.
  - Fixed some bugs in driver code during testing, including removing warnings
    for rv32_defconfig.
  - Updated MAINTAINERS info.

Changes in v1:
  The patch series is based on v6.7-rc1. You can simply review or test the
  patches at the link [1].

Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v1 [1]
Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v2 [2]

---

Chen Wang (4):
  dt-bindings: clock: sophgo: Add SG2042 bindings
  dt-bindings: soc: sophgo: Add Sophgo syscon module
  clk: sophgo: Add SG2042 clock generator driver
  riscv: dts: add clock generator for Sophgo SG2042 SoC

 .../clock/sophgo/sophgo,sg2042-clkgen.yaml    |   42 +
 .../soc/sophgo/sophgo,sg2042-syscon.yaml      |   58 +
 MAINTAINERS                                   |    7 +
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |    4 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |   77 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/sophgo/Kconfig                    |    8 +
 drivers/clk/sophgo/Makefile                   |    2 +
 drivers/clk/sophgo/clk-sophgo-sg2042.c        | 1357 +++++++++++++++++
 drivers/clk/sophgo/clk-sophgo-sg2042.h        |  222 +++
 include/dt-bindings/clock/sophgo-sg2042-clk.h |  169 ++
 12 files changed, 1948 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo/sophgo,sg2042-clkgen.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-syscon.yaml
 create mode 100644 drivers/clk/sophgo/Kconfig
 create mode 100644 drivers/clk/sophgo/Makefile
 create mode 100644 drivers/clk/sophgo/clk-sophgo-sg2042.c
 create mode 100644 drivers/clk/sophgo/clk-sophgo-sg2042.h
 create mode 100644 include/dt-bindings/clock/sophgo-sg2042-clk.h


base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
-- 
2.25.1

