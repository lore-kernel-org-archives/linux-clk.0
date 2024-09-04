Received: from mail-sh.amlogic.com (unknown [58.32.228.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6786B4A28;
	Wed,  4 Sep 2024 07:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=58.32.228.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725434316; cv=none; b=DGsE1i1wI1zEXvvHr8A7XkfxnZonaN3DcYqIPG59GYIod9hY2qdkBd6NYFT4e1vMe2XHEYZug2UTBLsDhTwfTsaOgEYhmb8ewqi/R0g7Uu8aHwo/ClCAu611E/gd8u0/JgJhHBAjWZetLrP+iiU4oQZ6G9z34lGtl52gs2ShW4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725434316; c=relaxed/simple;
	bh=2iTGxmMVH5VUA5RDc42DEOgj73k0zWC3IueoJohCP0Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FudiixgVu2um99lc1aQlT/R96uNHIz0u/WdrVebZau79NmfiVLKEA3sRmncwh1AKMIb8wSJGZhRtaqN8weax3OOeBMvCy7R0h05dhiC78dYGEqGvk5X3kyxmbHh0a4rtSk/G729fiZFzjrg9XSJqaGZeazjaHwtVZ1/95liotPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; arc=none smtp.client-ip=58.32.228.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Received: from droid02-cd.amlogic.com (10.98.11.201) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.39; Wed, 4 Sep 2024
 15:18:22 +0800
From: <chuan.liu@amlogic.com>
To: <chuan.liu@amlogic.com>
CC: <linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/5] clk: meson: Fix an issue with inaccurate hifi_pll frequency
Date: Wed, 4 Sep 2024 15:18:16 +0800
Message-ID: <20240904071817.489245-1-chuan.liu@amlogic.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Chuan Liu <chuan.liu@amlogic.com>

Some PLLs with fractional multipliers have fractional denominators that
are fixed to "100000" instead of the previous "(1 << pll->frac.width)".

The hifi_pll for both C3 and S4 supports a fractional multiplier and has
a fixed fractional denominator of "100000".

Here are the results of the C3-based command tests (already defined
CLOCK_ALLOW_WRITE_DEBUGFS):
# echo 491520000 > /sys/kernel/debug/clk/hifi_pll/clk_rate
# cat /sys/kernel/debug/clk/hifi_pll/clk_rate
491520000
# echo 1 > /sys/kernel/debug/clk/hifi_pll/clk_prepare_enable
# cat /sys/kernel/debug/meson-clk-msr/clks/hifi_pll_clk
491515625       +/-15625Hz
# devmem 0xfe008100 32
0xD00304A3
# devmem 0xfe008104 32
0x00014820

Based on the register information read above, it can be obtained:
m = 0xA3 = 0d163;
n = 0x1 = 0d1
frac = 0x14820 = 0d84000
od = 0x3 = 0d3

hifi_pll calculates the output frequency:
calc_rate = xtal_rate / n * (m + (frac / frac_max)) >> od;
calc_rate = 24000000 / 1 * (163 + (84000 / 100000)) >> 3;
calc_rate = 491520000

clk_rate, msr_rate, and calc_rate all match.

The test and calculation results of S4 are consistent with those of C3,
which will not be repeated here.

To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:  <linux-amlogic@lists.infradead.org>
Cc:  <linux-clk@vger.kernel.org>
Cc:  <linux-arm-kernel@lists.infradead.org>
Cc:  <linux-kernel@vger.kernel.org>
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>


--- b4-submit-tracking ---
# This section is used internally by b4 prep for tracking purposes.
{
  "series": {
    "revision": 1,
    "change-id": "20240904-fix_clk-668f7a1a2b16",
    "prefixes": []
  }
}
-- 
2.42.0

