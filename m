Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF2517B50A;
	Sun, 10 May 2026 18:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778436399; cv=none; b=G+g3qD7XkVe60KhDDINgvQ5qaXzdYcJ0BRJvX3pFJPiL5imwcxRC69ByH3xvLJUS6pHZsAKevoPSFadsv0ZSOFldNFUrkqQcTtwvFdg4qBnzfcIWJA5qhNWq/TkLzxOuWgiMTkjAp9LBgjH4BrzWHxj34kJMLIcaCWJTl0xdoEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778436399; c=relaxed/simple;
	bh=Q/WCDKfdbN0bfbKBiTsXu/nT2ph+oMQHG9vFZrTe+28=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Fc6xOgytN4ikoK2B/eT0DmKOEcVLAI33871unB8WFg2QQM8F8WC2KlsiyWWvVeAjd7dG/4aD9ZABYpk6ZF+RKfPo0BHzh4kvRWXqa7CLanrIWoFI2RqWcXgeNz2CBtcSgbeC9evvVplOWYUK34qcKIYmyPOtFl/Nfh/3KcdYxxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKVh2lrP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKVh2lrP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42D30C2BCB8;
	Sun, 10 May 2026 18:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778436399;
	bh=Q/WCDKfdbN0bfbKBiTsXu/nT2ph+oMQHG9vFZrTe+28=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=dKVh2lrPxIwrpB2Ig4pLxiU7+8zeNNKmq35pgdPY4+bsvpBtG1bTY+a3r0DfqSABB
	 IhLL7nswDkHYLKt6wIRI/Wj+381+bhy38uSpZC2qnqAkzrlInGHXzLkys4OO98KY4b
	 NWeRBTRHKPOqeSDMZ56MCTMzPPMW6fTsvjrXiULAGeE9qT3hgxYibHLzFHvd6Yph0Z
	 9uWyeEvtMva0VVK9qEWpGGoWVKKNhLVjmaTQbjDyDq1x4PmpfjUhwxUY8YIvKPA4g8
	 5iN96Q3udwnIzi09DJUypEAbsZEO/ARqowPDkJ6tEhnh72UOxFp6J5JF/RL2m+AxOD
	 brQDvn+u5LYAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D83BCD3427;
	Sun, 10 May 2026 18:06:39 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Subject: [PATCH v2 0/2] A proposal to add a gpio-locked fixed clock driver.
Date: Sun, 10 May 2026 18:06:21 +0000
Message-Id: <20260510-feature-clock-guard-v2-0-6c25458d5340@bruker.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB3JAGoC/32NTQ6CMBBGr0Jm7Zi2/OrKexgWbRmgQamZQqMh3
 N3KAVy+l3zv2yAQOwpwzTZgii44PydQpwzsqOeB0HWJQQlViVw22JNeVia0D28nHFbNHfZKaGX
 z0lyqEtLyxdS791G9t4lHFxbPn+Mkyp/934sSBVYyr60pRFOY+mZ4nYjP1j+h3ff9C7X2O5S3A
 AAA
X-Change-ID: 20260318-feature-clock-guard-f20a2c35b965
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Vyacheslav Yurkov <uvv.mail@gmail.com>, 
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778436398; l=1674;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=Q/WCDKfdbN0bfbKBiTsXu/nT2ph+oMQHG9vFZrTe+28=;
 b=9sI8m7AMOU1hB1Gsotg8yQlFziYmA2hoYnJRQ2muNBU8CFQ3oNbFgQxoa0RNRbyPqVMj0tsZ0
 C3AkhgZf0F/A4HqFiCvJMOsLwFYrzSyz2AeMa8d6z9OCDGdM/o8jQqg
X-Developer-Key: i=V.Yurkov.EXT@bruker.com; a=ed25519;
 pk=snJmgYVOKlp7aQtK9tWnEI7QTYxpPpJJvxdVsnxA7Fk=
X-Endpoint-Received: by B4 Relay for V.Yurkov.EXT@bruker.com/20260318 with
 auth_id=686
X-Original-From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Reply-To: V.Yurkov.EXT@bruker.com

A gpio-locked fixed clock aggregates one or more input clocks and/or one
or more GPIOs. It's similar to a gated-fixed-clock, but GPIO direction is
inverted. Consumers can use the output clock to wait until all input
clocks are locked and only then initialize / access dependent peripherals.

The usage example for such a driver is when peripherals depend on PLLs in
a FPGA, which can't be directly accessed by the CPU, but need a GPIO pin
to check whether clock is actually usable. E.g. some of the IPs might not
have a proper split between registers and IP core, which means that if an
external clock and/or PLL lock is missing and one tries to access the 
registers, the response never comes, thus the CPU stalls.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
---
Changes in v2:
- Renamed to clk-gpio-locked to express intent.
- Provide enable() / is_enabled() operations so the clock behaves as
  expected
- Fixed DTS errors / warnings
- Link to v1: https://lore.kernel.org/r/20260318-feature-clock-guard-v1-0-6137cb4084b7@bruker.com

---
Vyacheslav Yurkov (2):
      clk: Add gpio-locked clock driver
      dt-bindings: Add GPIO locked fixed clock

 .../bindings/clock/gpio-locked-fixed-clock.yaml    |  77 ++++++
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-gpio-locked.c                      | 306 +++++++++++++++++++++
 3 files changed, 384 insertions(+)
---
base-commit: 917719c412c48687d4a176965d1fa35320ec457c
change-id: 20260318-feature-clock-guard-f20a2c35b965

Best regards,
-- 
Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>


