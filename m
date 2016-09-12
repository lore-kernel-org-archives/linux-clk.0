Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Hoan Tran <hotran@apm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        lho@apm.com, Duc Dang <dhdang@apm.com>, Hoan Tran <hotran@apm.com>
Subject: [PATCH v3 0/3] clk: xgene: Add PMD clock support
Date: Mon, 12 Sep 2016 11:23:22 -0700
Message-Id: <1473704605-28126-1-git-send-email-hotran@apm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add X-Gene PMD clock support.

PMD clock is implemented for a single register field.
  Output rate = parent_rate * (denominator - scale) / denominator
with
  - denominator = bitmask of register field + 1
  - scale = value of register field

For example, for bitmask is 0x7, denominator will be 8 and scale
will be computed and programmed accordingly.

v3
 * Minor changes on dt binding document.

v2
 * Imply clock shift and width by the compatible string as Rob's comments

v1
 * Initial

Hoan Tran (3):
  Documentation: dtb: xgene: Add PMD clock binding
  clk: xgene: Add PMD clock
  arm64: dts: xgene: Add DT node for APM X-Gene 2 CPU clocks

 Documentation/devicetree/bindings/clock/xgene.txt |  18 ++
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi        |  56 ++++++
 drivers/clk/clk-xgene.c                           | 221 ++++++++++++++++++++++
 3 files changed, 295 insertions(+)

-- 
1.9.1
