Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4CE36A01E
	for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 21:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774041319; cv=none; b=omwby61WnUMPw8JFXEq/HNt058HzTjpFjeroA9hC0Tzv+RsORlE3al/DWHkC2QeJtxslxafFzhAeJ+7PpGxTKo1ycfdmn7ZCGL54TvvupbVxoahAySYCYOW6kmqAr9VgpXMeY6HSEAEYEk3QjwTKTtp/0/jsRJoKeomQCB2RSWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774041319; c=relaxed/simple;
	bh=DmTTdgGsEE6YI+ZniW//7SFL+HqlQKi8Y0UulyibIx8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Hkza6FCh1/D87mmu6orIjTOaTnnHBSpbCSaCp36xGg9Uxe0S2cOfHEZIFwOHp/0QQkmvod6iyDiT9FuEMCw3h5EZYJ9f2p61IRENxdra+BY7WKC/iej6A3RxTWNWwGnYedryL2ISyZLCwUneKiraV6kPchq9Uy6jfvixhYtJq9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lX/T0Hpm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lX/T0Hpm"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48374014a77so22184605e9.3
        for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 14:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774041317; x=1774646117; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s1bGv8/uYNdnIMNZ+E0Ir9BQ3Ee2imch1dX4Gmz7nQ4=;
        b=lX/T0HpmnXP/yaZw2yt5dhJ8kIt+pSO6N2ncNuWpbI+BYiC2wQtB9Rz9KsEvLI0tje
         5Pswq0onkAFj401+PK9ltnDVtTgVws1ZDrHpT7NyEePnN0NHhcmFOBPm7EcRUPJgknhe
         /+wuF0TS2fhOSPFlP7g0XTsRQPWT0SD16/bh1bGvix6QDwYnQ2H44afSHZB2VQQs+0Ji
         jTtsEhfyVle4xbOw8cFaHXZsv0eQ2XGhCxvsdkh11lxAqcrX+ttNaOYJy/OODOepZ6U1
         +4qcb68lT0fv+Kgn1YjEo9z9v6EiFvx40nbndQY9zthl0S6NjyK9ACdtkqvip3bOr+1c
         dWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774041317; x=1774646117;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1bGv8/uYNdnIMNZ+E0Ir9BQ3Ee2imch1dX4Gmz7nQ4=;
        b=R6YD9ivO1RXrPebisE6JyMRFTqVcKOCVg2qGJqZvr+enZXoXGbSWr2oC9IAEAbD0CR
         Sqfw42PtPLTjuSyfn9tYGjRLv5NxafAc0EWOu6jda7OQg8L4DPT3Cpa/Sk2lU2NAyt16
         90CA0o1Mj1dC4yD8EcxyR8BJETeMn5Mahzj0OfNBZjqMl7xpRLfIcNS0UjQ6j7YApeK9
         k1NbQdt+Qumh7+ID5VJ5P7W7whnHREqwCl0h5ZfnRYJDo1DonHEJeYeypIRt74pA6MLT
         i0ADMmbN9SL2OJBGSaCwNqxCOF8+VTjfSAtsty3l3hHU+8HKAP79zOnpPQSusgwmj9bA
         HJjw==
X-Forwarded-Encrypted: i=1; AJvYcCVvIPjddTp2iWbJ87AqKgxtz9c6H61sHZMJKeshBzFV2qxEX2lpyxgVqCzMN8x8PxMbjN85hbYl008=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnI7amw13378rsy1pkyVAO/iXvpN8P4V2wAUKx9fcpoQXSAE8D
	xSTh3uOORY+iBO/txDCaOftS2yeQgmDgV2qmppli/HnVujGtDYH3pRtLC+9FG9pVusQ=
X-Gm-Gg: ATEYQzxXNoX+k6jACkP34qVlE+XGlzZ2sJrjGXM/Z9WxS67fA36drmlKQQ6W2/g33OA
	pTBoUfrtl/aP07/vkqlTbbnX6IU+3UKyT8nzyR2QTdY5m3r4UnZswQd3MWP8fmNC8yJ0wTgoH8b
	PPN9QP34Dea/6m+6BbqQZmSo0jALSu1OadrXu1svhxBNVPc/yNJO90WSwpN3qzrGFJJIoppeWTD
	ziixa0Fb6MB7lRLeL6Vj5fgg4ax1SetYkk5jZA9POFCv1CtceKQPRJIHo1DJ2waSeky/kmyhBQi
	AIulp7mweY0mQ0W5p5HaM5XVaB9A4evzGEThWjJ33VxihAdDYttF0I6jMMD45dIa1ZjT7t6lpZl
	E5K4GTYYUDw/cOxlao6ttYWyAxDtcnMvOSUW+lYA+pFB5Pr0nZPkRpja0yk06yvJ/s44WuPcV1n
	493KW0wwKtGuw8DUQPeQ+SI2pq5W6pBwTzJmHRhOUhr85HN0RQsJHEm01MTBR6XZDXqljLUmbuz
	W3vi1Z0t7H3+7E=
X-Received: by 2002:a05:600c:8710:b0:485:35ba:1d81 with SMTP id 5b1f17b1804b1-486fee051camr64543975e9.21.1774041316606;
        Fri, 20 Mar 2026 14:15:16 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm9702401f8f.18.2026.03.20.14.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 14:15:15 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 0/5] Exynos850 APM-to-AP mailbox support
Date: Fri, 20 Mar 2026 21:15:12 +0000
Message-Id: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOC4vWkC/x3MQQrDIBBA0auEWXdgaoiYXqV0YXVMBhoVhWAJu
 Xsky7f4/4DKRbjCazig8C5VUux4PgZwq40Lo/huUKQ0jYqQ2z+maiZCm5XNG25Wft/U0IVAzng
 9m9lAz3PhIO1evz/neQE0O5mLagAAAA==
X-Change-ID: 20260320-exynos850-ap2apm-mailbox-cff0c8d69898
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Hi all,

This patch series introduces support for the APM-to-AP mailbox on the 
Exynos850 SoC. This mailbox is required for communicating with the APM 
co-processor using ACPM.

The Exynos850 mailbox operates similarly to the existing gs101 
implementation, but the register offsets and IRQ mask bits differ. 
This series abstracts these differences into platform-specific data 
structures matched via the device tree.

Also, it requires APM-to-AP mailbox clock in CMU_APM block.

In theory this can be split into two series with correct dependecies:
device tree node requires clock changes to be merged. The suggestion
is to let this go through Samsung SoC tree with corresponding acks
if it is okay.

Will be great if it can be tested on gs101 to make sure that I didn't
break anything, I don't have dev gs101 devices.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (5):
      dt-bindings: clock: exynos850: Add APM_AP MAILBOX clock
      clk: samsung: exynos850: Add APM-to-AP mailbox clock
      dt-bindings: mailbox: google,gs101-mbox: Add samsung,exynos850-mbox
      mailbox: exynos: Add support for Exynos850 mailbox
      arm64: dts: exynos850: Add ap2apm mailbox

 .../bindings/mailbox/google,gs101-mbox.yaml        |  4 +-
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |  9 +++
 drivers/clk/samsung/clk-exynos850.c                |  7 ++-
 drivers/mailbox/exynos-mailbox.c                   | 65 +++++++++++++++++++++-
 include/dt-bindings/clock/exynos850.h              |  1 +
 5 files changed, 81 insertions(+), 5 deletions(-)
---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260320-exynos850-ap2apm-mailbox-cff0c8d69898

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

