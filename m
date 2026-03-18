Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5063451B3;
	Wed, 18 Mar 2026 17:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773855837; cv=none; b=P/zgk16KMIsK4cpgKrdqAGYFkH9E3BpC8jkjkxu62MgWLSs/6M/pAIO0Pzalfh3VNNHeRkEp/ZmyouBf8cO3UVIspq0gVU4PMetlEZ63cAjoanCSAhJ7gWCwCW9gXQh7dckHWulPpPTr3CLjOoNHyH3Pj7jx/AqMHxpbmp7PQIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773855837; c=relaxed/simple;
	bh=UIkIjQAzXj+Rj6KQbjxj4sOuqt8z+yoyvlPfZEgLIA4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PFINYpChENs0sGZuW6fRKmyGI057/T2f1t7hrYPRT8f3iR4k4yeUceAcREVqiUBu9CBIjMyhvE9YdSApdGIPRPc3GxV3Kauimqeo7iE29boUwuDKE/3e8egeTDRQTjkDiQjQgMKWwgrsiBrcliWbHv6LDK1Jbf+j7/H6rKJS/RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIwPfbu3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIwPfbu3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8E71C19421;
	Wed, 18 Mar 2026 17:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773855837;
	bh=UIkIjQAzXj+Rj6KQbjxj4sOuqt8z+yoyvlPfZEgLIA4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=MIwPfbu3K4yL/rhhy5t9e/aqf0ZJGyuZlrb1LkJICC1WeYNjfpP9N4yhbONHUmHqg
	 JcJE1u3Lo6UZNIEBvg0XaG4tVUbyY+Yt1XMel6WYTkIr5g2r6yRZmR0wVP/2W8C2PN
	 TeX7rLy67zD76Qrw9OgMKbp7Noo4OWwvDjEMqH7t91fchFdLPEU1BVtc9iV+bM9gGV
	 2pLsHsrgHP1OwcWk8fYFHMpVr8D7c1MQbrPy5K/5wIq7cTiHL9uzdmPl1yPQxM4SvD
	 Rnc6+qI8tXStsyKQvMNnEQpSzjFcNn+S4x9NDyYexUsiP++dZKpPgjug11qwHe2pDB
	 R65njUwsS2c8Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D39FCD0A2;
	Wed, 18 Mar 2026 17:43:57 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Subject: [PATCH 0/2] A proposal to add a virtual clock controller guard.
Date: Wed, 18 Mar 2026 17:43:38 +0000
Message-Id: <20260318-feature-clock-guard-v1-0-6137cb4084b7@bruker.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAErkumkC/x3MQQ5AMBBA0avIrE1SlTa4ilhUTZkQZIpIxN01l
 m/x/wORhClCkz0gdHHkbU0o8gz85NaRkIdk0EpbVRYVBnLHKYR+2fyM4+lkwKCV0740fW0NpHI
 XCnz/17Z73w9d668/ZQAAAA==
X-Change-ID: 20260318-feature-clock-guard-f20a2c35b965
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Vyacheslav Yurkov <uvv.mail@gmail.com>, 
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773855836; l=1222;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=UIkIjQAzXj+Rj6KQbjxj4sOuqt8z+yoyvlPfZEgLIA4=;
 b=LOhlPYBN03T9ikQjtuqHG40YyaslhHGDQwLJK/1Z2S9vaPKHhsarcxEM8Gx0OcwvV9HSJUEyK
 mf/Ssd7fv/XCMmMQs7gWeZg1hRb9JI28Xx70kiw/EFJyzELw+jFO34o
X-Developer-Key: i=V.Yurkov.EXT@bruker.com; a=ed25519;
 pk=snJmgYVOKlp7aQtK9tWnEI7QTYxpPpJJvxdVsnxA7Fk=
X-Endpoint-Received: by B4 Relay for V.Yurkov.EXT@bruker.com/20260318 with
 auth_id=686
X-Original-From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Reply-To: V.Yurkov.EXT@bruker.com

The clock controller guard driver acts as clock provider and provides only
one clock that consumers can check to make sure whether all other conditions
are met in order to enable other peripehrals. This can be seen as 1-to-N
clock relation, thus consumers care only about one clock and not about N.

The usage example for such a driver is when peripherals depend on PLLs in
a FPGA, which can't be directly accessed by the CPU, but need a GPIO pin
to chekc whether clock is actually usable.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
---
Vyacheslav Yurkov (2):
      clk: Add clock controller guard
      dt-bindings: Add clock guard DT description

 .../bindings/clock/clock-controller-guard.yaml     |  79 +++++
 drivers/clk/Kconfig                                |  12 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clkctrl-guard.c                        | 334 +++++++++++++++++++++
 4 files changed, 426 insertions(+)
---
base-commit: 4f3df2e5ea69f5717d2721922aff263c31957548
change-id: 20260318-feature-clock-guard-f20a2c35b965

Best regards,
-- 
Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>


