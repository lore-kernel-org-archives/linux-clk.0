Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA48B4D90C0;
	Fri,  9 Oct 2026 11:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791543617; cv=none; b=TlrTrWshTSTgzn70KvUKFe9Lr/mpcadRSqifx9q+GiyN8KzG8oDdZZKV+SqdewnUib5VZ6kV9VgPg6sbXdCU9Z6SCtJTeojhM6xPUgU0fqLYNmUF8alpVT0TmV2fV9c9iLtC3UgS6FGtJNYbaJ0CMgoTygN2OGPlhsuk9j3V9I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791543617; c=relaxed/simple;
	bh=nEmNB/P7dMfDzlN97RLQsTVzEKL8hg1jn6EUL8ZG6dA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y/Cy/IhtiD1jg/0B+9qtHo9IW+njd9bobMjv0ouDFSvcM58n3opTWXPI5LD4fqKXaiMir+kBbuYmP4u4MvtPEiaZOSZaIeJCSyovgu2QtS070qfMEZQSpvkIaprib4jW2Wp1Oq83rg1efDqzB2ZDQFu8AtbIGxNsAnesJTkElNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tubpZ2LZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tubpZ2LZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1CDE4C2BCF4;
	Fri,  9 Oct 2026 11:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791543616;
	bh=nEmNB/P7dMfDzlN97RLQsTVzEKL8hg1jn6EUL8ZG6dA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tubpZ2LZtFEWN/RphMGgME8PHX3Rt1/MI8DUeTkByjySoBF7IlENhQPebetmQaPTy
	 WA+Xp+ltM3AcY/j/AQtzG7SG+qymsIiqeK/Cs02GfdlWpJJ7vulE3rP2ov1tZDkqEN
	 fLofamh7+gXJKR5vl343/kexwusw1cVwxlqD8nXIWtPLsCTMcrDS1IszVfR/l8aDBL
	 jUJBjCGD6DRhBWOa/duccp/nR5WpG+1TeM/BbUgJQw5ax+T7b7AEaGFn3n2WYW/p3D
	 g8ecV6Lno23SgPx2k9TQrhfrzE+a5Cu72f5BDY+lARtvvQabqwNfmhX2EecsgdJTOR
	 0Z2aMWIvn2sWA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FB4CA601F;
	Fri,  9 Oct 2026 11:00:16 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Subject: [PATCH 0/2] clk: add Ambarella CV75 RCT clock controller
Date: Fri, 09 Oct 2026 19:00:11 +0800
Message-Id: <20261009-cv75-clk-v1-0-6959b4da83c5@ambarella.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADvJyGoC/yXM0QpAMBTG8VfRubbaNBavIhczBwehDam1dzdc/
 ur/fR4cWkIHVeLB4kWOtjVCpAmYUa8DMuqiIeNZIThXzFwqZ2aZWa8kClnKXBUaYr5b7On+rur
 mtzvbCc3x7iGEBzbbpUJsAAAA
X-Change-ID: 20261007-cv75-clk-f74e1494576a
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>, Long Zhao <zl020895@163.com>, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791543615; l=2190;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=nEmNB/P7dMfDzlN97RLQsTVzEKL8hg1jn6EUL8ZG6dA=;
 b=Ccza4jQiFmnUVMomgE3ejHoZTGqwXkTT2Q/8/Zxd0/dF8iYXRd0cbXmE+p6pclf4tqY/HeQRl
 2r6oZaibcS1BwEF8KJlBKlurGpjzt+ZqaKK3KC/eqrxj5E07v3QyFdT
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com

Split from the combined CV75 bring-up series.

CLK_AMBARELLA_CV75 depends on ARCH_AMBARELLA || COMPILE_TEST, so the
driver still builds with COMPILE_TEST when the SoC symbol is absent.
The binding uses the ambarella vendor prefix, which is added by the
SoC series and is not in mainline yet; dt_binding_check needs that
prefix. The MAINTAINERS entry for these files is in the SoC series.

Changes since the patches in the combined v9:
- drop the redundant linux/math.h include (Andy)
- use for (unsigned int i = 0; ...) (Andy)
- initialize the spinlock after the allocation succeeds (Andy)
- group the ctrl, frac and ctrl2 offsets in struct cv75_pll_regs (Andy)

Link: https://patch.msgid.link/20261001-cv75-v5-v9-0-486cc289a4b8@ambarella.com

To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: linux-clk@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: Long Zhao <longzhao@ambarella.com>
Cc: Long Zhao <zl020895@163.com>
Cc: linux-kernel@vger.kernel.org

Assisted-by: LLM
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
Long Zhao (2):
      dt-bindings: clock: add Ambarella CV75 RCT
      clk: ambarella: add CV75 RCT clock controller

 .../bindings/clock/ambarella,cv75-rct.yaml         |  64 ++++
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/ambarella/Kconfig                      |   9 +
 drivers/clk/ambarella/Makefile                     |   3 +
 drivers/clk/ambarella/clk-cv75.c                   | 361 +++++++++++++++++++++
 include/dt-bindings/clock/ambarella,cv75-rct.h     |  14 +
 7 files changed, 453 insertions(+)
---
base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
change-id: 20261007-cv75-clk-f74e1494576a

Best regards,
--  
Long Zhao <longzhao@ambarella.com>


