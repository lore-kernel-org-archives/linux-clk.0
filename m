Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC40F37BE9C;
	Mon, 18 May 2026 02:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779073137; cv=none; b=uOM5Qwt2Mb0CnYKeyAAUMEUMk5Ix3M5fuK6G5CZV3R7Kj70FiyM8Hos7Jam6lP/wtVpd+ZRalAmxeccnNo/jGkBDzo+mih6H9TWAhtGO6oypNzwClT7PdR6r8LCYx+h8IZj3wRiEvraArHwyWcp/s9FViLifGT2ed+E/mAPs+18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779073137; c=relaxed/simple;
	bh=J8F9I7OUuLtL7qSnbHsC8O6vF6f01cUlWQd2bPJnrxo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gQurf8A1yPuTZW/W4HcKAsXUJDCn5fdmgHA+1lRplTqeLob8mApealVZcIg08dcq1RUn+OvHsL4IY8FXjGZ/ToQeSRvDQrTLxr4BF3n1t+2xa62ZuF76nyy6DZ1uaR3uE+Ln7ZRlF0r/aPXy46RGhbuMNv+BdTq++m7ifjqMffU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cC9AA0/N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cC9AA0/N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE11C2BCB0;
	Mon, 18 May 2026 02:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779073136;
	bh=J8F9I7OUuLtL7qSnbHsC8O6vF6f01cUlWQd2bPJnrxo=;
	h=From:Subject:Date:To:Cc:From;
	b=cC9AA0/NCacgindZAA59WNrehIEPr1V5gi0xoQaQwLSlF+H2DRXGRt9xoJzgRvwpf
	 1x79RwtfVAh/ZY4cvY33+hAhF3g/ZV5tJxpeqECeDX1Z1m0RUuCFe1aLwxfPEDGygG
	 nzD2ExLvuwdmMf5aidXuX7itZn2KwjbQaGeW7eu7ui/t1zwxh9GRpNQo0d8ZZnW/r1
	 Hdic2WxpD/Pu/CZ3ngLLpTsMus8+3PckDqM3lwL+K6dZcDItOqSw7Ej1V3tllIUPiv
	 KTffRnThhsyn4bp8bnc6OXA9WzSA/IuVtry3LZI1oB944VM9rOanmtrNuKKDcHwVvr
	 WfxjUyRZZ23xg==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH 0/2] spacemit: fix USB2 clock and reset
Date: Mon, 18 May 2026 02:58:35 +0000
Message-Id: <20260518-06-clk-reset-usb-fix-v1-0-14fc235e692b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFuACmoC/x2M3QpAQBQGX0Xn2qm12ORV5MLPhxOhPUjJu9tcz
 tTMQwovUCqjhzwuUdnWAEkcUTc16wiWPjBZY53JbMHGcbfM7KE4+NSWB7m5sS7vMxSpQ04h3T2
 C/rdV/b4foIy2uGYAAAA=
X-Change-ID: 20260428-06-clk-reset-usb-fix-a265d4e836e5
To: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>, Junzhong Pan <panjunzhong@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1092; i=dlan@kernel.org;
 h=from:subject:message-id; bh=J8F9I7OUuLtL7qSnbHsC8O6vF6f01cUlWQd2bPJnrxo=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqCoBkXj/fqaL6ldz5Rryf1UFY1mBr2lxe/L0JK
 o+q/z0USieJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCagqAZBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3fJA/7B2dyhMYKqci5xLGf3cwXN//l+YRcBcu5qbldJMMz82RF/GkMGFU8u
 8oekpebq31Ep2gyWczXhXgUq7PlM5WFg1YUf3xQjbtNYkLxdNWQYPIVj5VXnFVebUNvqTgX6xmB
 4LdPaaVb8+/CCOG1AgfLI+CxLMhUEYSVVgqPXtQ1Mkh+Po8+iai4eqrdjyJY+qLJ2Q6TxTTr9J/
 FxdFU5O97oou22ZO8DBMzuRoCrsemuRhyDREO7EwS6NRjAIwlHmdAU3RQdkaFvl/G31Ge/cnIct
 xe4M0F9+itzEhrtv+2FE/PPkC2jxDd72HHYWgB5ICalWZcXVg+gDKd+hbF3Ei3SU2wyNY7XZ3mp
 s5fMBmmVcY3v2vAYf0VNbndmTRFthn3Ak7dOyy8k23Xr+141b6mmHRDbGUdJmVW3RsIIyx/W/7i
 Bz30MqSDYhM76QblOYU83l0ub6i+8CHcGxS+7v61Xllg5OVwIs0o3neObp4B71ILLEeHPbifbP0
 iQJ1S+RLM/i6YmDHN9o6FMFYiNeEwP00U9h1p+KGa9IZbSbow9HDrdFmqxjFZF7pcINSsNb20YZ
 LR8CVXqg1XoJCY9k85A+6+zac22LsMWWQimc/gRqElSNPRkY9UJaQElZdj6vKhMlznUkAKvqMJS
 3yT/BFipvs76YXZ72RKGIlNdSb+dH8=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

In current code (v7.1-rc1), the register bit of bus clock and ahb reset
for USB2 were wrongly swapped, but this didn't cause any problem, because
from setting the register bits perspective, the de-assert reset operation
is effectly equivalent to enabling the clock bit, both of them will set
value 1.

This issue was found during suspend/resume test with vendor's internal
kernel.

I've combined these two patches in one series, but would expect each
patch to go via its own subsystem as bug fix, The USB2 driver is not yet
enabled in v7.1 cycle, so it's safe that we won't break any USB2 driver.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Yixun Lan (2):
      clk: spacemit: k3: fix USB2 bus clock
      reset: spacemit: k3: fix USB2 ahb reset

 drivers/clk/spacemit/ccu-k3.c              | 2 +-
 drivers/reset/spacemit/reset-spacemit-k3.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260428-06-clk-reset-usb-fix-a265d4e836e5

Best regards,
--  
Yixun Lan <dlan@kernel.org>

