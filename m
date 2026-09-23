Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA525495029;
	Wed, 23 Sep 2026 11:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162145; cv=none; b=ptfRVwOdjU9qZLzNKJitQlPrvkD3Zti0byzVJnxYHiEKN6gyLzKlg3dQPSw9u5z0B/3MwjHKGW4wBvqC4ItxxHu7Yv42clY6nBEO4DHq8Dr/xdEWvBOFMsaP6JuUOQDQjJJEXYsuwvI+1M4ZQa/g/kyzmX0/Y62E/ICbBED5mkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162145; c=relaxed/simple;
	bh=HRSub+QE/8D3AF670B+wnGCu13xlGmfbVGSfPKurvgI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BRFU5GWJ3maAI7K4Vjmim9TiqaD//7C1lu1vwWfsj54AjuZq1E/sDmhqb4Lw8y9Naxq26NvNKhL7SEXq0c1hGpfNHPppo6/FAHSlli4oZtT8dTBt2pUAy1lFzn07sh9dqMN7la3ZJIqzu4gq8xYbF6gpho/Q/PJb/v/pyVBUSUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1Brx+dI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1Brx+dI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52392C2BCB8;
	Wed, 23 Sep 2026 11:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790162145;
	bh=HRSub+QE/8D3AF670B+wnGCu13xlGmfbVGSfPKurvgI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=U1Brx+dIs/rBOG68GdLQVFs34oyrCQfA+VCmiI0y2UP+0mNrIvkAk+GelnloSJbb2
	 XtttRHED30bJW6YeCchI4c6SvIxsXhMxMk2imVl9TB2Eka4MN62qXyS2xzTE2WGcAz
	 /MNxxgBeLxRmo7eZ6+r32SclvBJoxkFhdpaG0NjMt5LT1s0TmVL2V9v4iFsJJK1ArG
	 J5LzMQFwmoOZF7WzuB3n6g2uWxhbKF+3bzsOpLenaWkdJGr6VP838tTJRJJBxg4IqS
	 TfHQw78fZjJ9nBlRiC/EwXzAsjA2QZxBrhfqGZNEEiqzTCKmT1cbydFPgsaG3p+n21
	 3RGSofjz9ctbg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24286C982EA;
	Wed, 23 Sep 2026 11:15:45 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Subject: [PATCH RFC 0/3] clk: meson: Refactor PLL pre-divider as a divider
 clock
Date: Wed, 23 Sep 2026 19:14:46 +0800
Message-Id: <20260923-meson_refactor_n-v1-0-3a8ce27121a2@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKa0s2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyNj3dzU4vy8+KLUtMTkkvyi+DzdVPM0I1NLA5NUU2MzJaC2AqBcZgX
 YyGilIDdnpdjaWgDD1C+zZwAAAA==
X-Change-ID: 20260923-meson_refactor_n-e7f25904e536
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790162143; l=2037;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=HRSub+QE/8D3AF670B+wnGCu13xlGmfbVGSfPKurvgI=;
 b=qmDP/SwmQ069y+a6xgYtXYhqff3EX/JqLT+8cgk6vr/IkknbC3kUvbzBiRxk5cunM2tXxSIMv
 CjmByR+ELneCRuqA5hTYSvE1SKb6yGQPrMwT8FtnqnIASFrSeV1OIXM
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
Reply-To: jian.hu@amlogic.com

This series refactors the Meson PLL framework to remove the dedicated
PLL pre-divider (N) parameter from the PLL implementation and model it
as a separate divider clock.

Currently, the Meson PLL framework models the PLL pre-divider using a
dedicated n field in struct meson_clk_pll_data. This makes the
pre-divider part of the PLL-specific implementation, although the
Common Clock Framework already provides a generic divider clock.

This series separates the pre-divider from the PLL and makes the PLL
DCO take the pre-divider clock as its parent. This allows the
pre-divider to be modeled using the standard CCF divider implementation
and simplifies the PLL framework.

The series currently covers T7 as an RFC to get feedback on the
framework design before applying the same approach to other SoCs.

Series:
clk: meson: pll: Remove the dedicated n parameter
dt-bindings: clock: amlogic: Add T7 pre-divider clock IDs
clk: meson: t7: Model PLL pre-divider as a divider clock

The other Meson SoCs will be converted separately after the T7 PLL
framework refactoring has been reviewed and the overall approach is
agreed upon.

Any feedback on the proposed clock hierarchy and the separation of the
PLL pre-divider from the PLL itself would be appreciated.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
Jian Hu (3):
      clk: meson: pll: Remove the dedicated n parameter
      dt-bindings: clock: amlogic: Add T7 pre-divider clock IDs
      clk: meson: t7: Model PLL pre-divider as a divider clock

 drivers/clk/meson/clk-pll.c                     | 178 +++++------------------
 drivers/clk/meson/clk-pll.h                     |  13 --
 drivers/clk/meson/t7-pll.c                      | 183 ++++++++++++++++++------
 include/dt-bindings/clock/amlogic,t7-pll-clkc.h |   6 +
 4 files changed, 181 insertions(+), 199 deletions(-)
---
base-commit: 43e1705ecab981c66baee89041e6f728c0436f19
change-id: 20260923-meson_refactor_n-e7f25904e536

Best regards,
-- 
Jian Hu <jian.hu@amlogic.com>


