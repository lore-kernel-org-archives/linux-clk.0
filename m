Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6887341D65C
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 23:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789427156; cv=none; b=LO31ot5kQhp7k5mtXwZDR/NcLIRNp/BMtMuhhmKb1Ah1MvmCU92V+EllvtB8JlyKSYqpTfPJs6ZQ+kSviEYvugrrZ2YhHzlbiuio+58ermfQ7AwqEsxTYHWI40UJ8wCJDHnl/BeykU7biP+YOAgUUJpEjLA9wiF/pdBwcAm+Q7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789427156; c=relaxed/simple;
	bh=uRkKK/nT+aV2RrivtfepLK8t9jM7+66Vx+qv84P/4mU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XU8G3Ev9tOlBk2k78jibaIAkKd2vP0bOX7ow/gdbXdPXIp2I2PHsWAXO/ZUAzZXITychLe+Nl4/OhrfcMEi69VEq39OzdvZwZXaGIQDLInbhaWmfLXtD50T/1pmECG6mJOrPp7PITgB8IjLcJ5XGq+h7mfYHR957KeqJf8HSpKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xryHobFw; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xryHobFw"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so28851305e9.3
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 16:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789427153; x=1790031953; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=P4bUmIM/8MrhNWBsCgZzU2roeZ3zMpS7wHfUs2pan0o=;
        b=xryHobFw0ijtMYXto5WQqWs2WXYc5Br7gMQ72qTZPdUCGm2RSm3CCAus/YPShmmGsl
         zhkdAE1ECCC5x9vYRnE3bKDrOnKZjjk3ZjRNmxIbbrxpgtNPiVWGUoa/7UqLLahmFLXu
         U9v/f9LCvDSBY/0M5doHULq6OaIl1hwqVVxX65OJIxRtV7qiMUBsNgkxV4pnXqrDkxT1
         FSeiP3cBRkG5wC6twvrRjgOtLeHbaANaTaIeusFGkbwXFVuvjtWM5pESbNVzem23NVWk
         Dm1I+sH7uqj61l/LUZBKv3VV3nL7enXzNYPRbSM46MbJvmauXEygSWiAOx/i5/noAsJ5
         LMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789427153; x=1790031953;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P4bUmIM/8MrhNWBsCgZzU2roeZ3zMpS7wHfUs2pan0o=;
        b=qWsh/5tEmPzqWblcPd6j0pb52A9dT4TgBwtH0mgh8uldwOhlZe0fK/oUozRnD/3Dvv
         2x9D1Xvp+8YMHuLgNWQr1TbgfZ3/ZSZuhXCJ1ixuaMvWcen8ty9MFzzZBP3LQYbzmTQv
         kFxpPvhp9jSXsInqmUPJchsMqSwDP7eFJRimu2rqk0yD0DF4DOMq4yn8b2qb9Jgm6TnM
         MqI69/0ezElDO9wURKAWdTcjPI7kvGaH73jVE0SH0c/QuLNvkWk79vnFlMxNFMlRxB5s
         76HOXnnUluTd2Zu0P8L8C/WoXahGR47sG7HTkD6E9kICMJuuD7KOQq1PJgX+n2qctjm4
         RyTw==
X-Forwarded-Encrypted: i=1; AKwUvBxCreYtO0bpIiwx9hk9zo7xfYgEI/IEer38hubqXcnyhGGlJ6ZpWAXiGZH4YK/A3RBUFdW8q1gtmCw=@vger.kernel.org
X-Gm-Message-State: AFuF++kRYJvJ2XFwXedxg5jbwv2PVPvZYDP/GbtyN00tzEU2tnLCBEVH
	E8d411+sU7zdR5bBu1gAYxN1ClNOOGOsViwrDFn+3Y4W5oXv7iYgep14Bme/9f2rBPI=
X-Gm-Gg: AYBFou11LMgQVMRBIdpwAEkUmq2VdYQTJzOQt+c5iihUpkYkgTZJE2n/Btx7BfV9tK9
	qX7f76H4Ve4/6ftvNV659hNX4XSH3noLYwBEI8DjfEH1e96gixM12xyPjVzFvtEOha0woR9SCxR
	XGlVkJQvrI1uDsdwe5CCyKhmdXzp2mFJn9jVE0xXb8AqRUWySC8C1S+/miEPn6wdmB/2likdnII
	PHulBPfx1J4CM8y0trXX0TIM1N90uD+EFfK5PPuAGfGSvlYLtUOAJxTNDTybBBgP6CCuQvWdlEM
	bGIvJL9t6YQXnKzTG0os6YFTnpsNnD7/k9tRdUC27Wvnw+zkUBFWNTOsB/wwcTUDR9LdcJZ66Pj
	H1pzOCEiXZwWGfsiTizRNHyLQk+gQWcoVuM5psJXY81pm5jsh/gVRuEAlU/Nmg26D+ZBaj2alkB
	itReB6kCAXbSm+WiEAUnNfww1mpn20T32/oLVQAkIUg1dbdwRtq9Zm0gjLrVFtqNknVtnSR5pWx
	jNeBZY9YsgpWuT4Lu8fGsti01s16Qiwyw4ORTjjuYeXrMtk0HWZI1gooeXz+pA=
X-Received: by 2002:a05:600c:37c3:b0:49c:fc6e:a3d9 with SMTP id 5b1f17b1804b1-49e7a678879mr66917465e9.24.1789427152608;
        Mon, 14 Sep 2026 16:05:52 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d5f1sm32098817f8f.12.2026.09.14.16.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 16:05:51 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 0/2] Initial support for Exynos850 SoC in ACPM clk
 driver
Date: Tue, 15 Sep 2026 00:05:42 +0100
Message-Id: <20260915-exynos850-acpm-clk-v2-0-ffad4a6b3fb1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMZ9qGoC/32NTQqDMBBGryKz7pT8oJWueo/iwiSjDrWJJCUo4
 t2beoAu34PvfTskikwJ7tUOkTInDr6AulRgp96PhOwKgxKqEbVUSOvmQ2prgb1d3mjnFxpy0ip
 tmoYMlOESaeD1jD67whOnT4jb+ZHlz/7NZYkCW32rtXLODLp9zOz7GK4hjtAdx/EFK1baprUAA
 AA=
X-Change-ID: 20260512-exynos850-acpm-clk-bed1c23b66eb
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

This series adds support for the Exynos850 SoC to the Samsung ACPM clock
driver. 

Currently, the driver hardcodes the GS101 clock variants directly within
its probe() routine. To cleanly support Exynos850 (and potentially other
SoCs that utilize the ACPM protocol in future), this series first
refactors the driver a little bit to be SoC-agnostic, and then wires up
the new Exynos850 data.

First patch introduces `driver_data` to dynamically extract clock lists,
number of clocks, names of clocks, and mailbox channel id, removing the
GS101 hardcoding.

Second patch introduces the `exynos850_acpm_clks` array and
"exynos850-acpm-clk" device ID.

This version also tries to handle missing ->recaclk_rate() implementation
in ACPM firmware. Because the Exynos850 ACPM firmware does not support
dynamic rate reads over ACPM IPC, the second patch introduces
a ->get_rate() callback mechanism. For Exynos850, this falls back to
parent CMU clock topology, registering parent data via pdata.fw_name.

Tested with cpufreq for E850, with OPPs and cpufreq_dt on Winlink E850-96
board.

I decided not to add Tudor's trailer for the second patch because it seems
that rework is quite important.
The dt-bindings for clocks will be added as a separate commit in another
series.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v2:
- changed commit message of second patch that adds support for Exynos850;
- introduced ->get_rate() callback for Exynos850;
  Rework of second patch and implementation of get_rate from parent clock;
  ACPM clocks for Exynos850 now rely on clock topology and need parent
  clocks to be provided;
- reworked acpm_clk_recalc_rate() to use driver data calback if it is
  available;
- struct acpm_clk now has pointer to drv_data;
- rebased and added changes associated with rebase;
- added mod_devicetable.h as Tudor suggested, added trailer in the first
  commit;
- Link to v1: https://lore.kernel.org/r/20260512-exynos850-acpm-clk-v1-0-837532ddbf38@linaro.org

---
Alexey Klimov (2):
      clk: samsung: acpm: introduce driver data for SoC-specific clocks
      clk: samsung: acpm: add Exynos850 support

 drivers/clk/samsung/clk-acpm.c | 62 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 56 insertions(+), 6 deletions(-)
---
base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
change-id: 20260512-exynos850-acpm-clk-bed1c23b66eb

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

