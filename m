Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C658375F67;
	Fri, 24 Apr 2026 15:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777045050; cv=none; b=ufwUiSnT1ybbLLz6sPSh5sYfROxmEMVfqNTpn+av2PtLVc0GdcdiweqS5F68VZ4U83t5+V77hOp3+80yvP/CpWILEMGqr5eJ95E1gZ6S5zt6pRFOXUcVFG2kWzRKxwl9PH2NFr0154PhvbEPDdX4LQ0Ra/zW5S4rqGjhqgxJewI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777045050; c=relaxed/simple;
	bh=NzWIjOZQIJ4QSRpkYHMG1j9Yn+1obIkLrovQUw3CG68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=j7EMM5pD/+gzalBVcu2d5U3UsW4M0tscdeg4CEArQIgXIl3ueZOBlgJka0ndx/W89wiCDsyH/3Pg3KLzXHHYvDzZ3BqpI0+0sQamigSooWDMytphhTuIRXYLmIGkxBNpEhP8ThJL7S41QATDtUNxGKRWA6P3QRVWEQhzshLQ+CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R6mHxdV3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R6mHxdV3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2745C19425;
	Fri, 24 Apr 2026 15:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777045050;
	bh=NzWIjOZQIJ4QSRpkYHMG1j9Yn+1obIkLrovQUw3CG68=;
	h=From:Date:Subject:To:Cc:From;
	b=R6mHxdV3UdHyGtaWwY405z811gxBp5am9Ro/jwNOQZ4CRsgfYKC+9QAcjbdPk2/C0
	 qstHcDaRN1naerujB6GjBnXeBKSsJWKzaATbIKB8owTUsNki+L8CXgW1QhpqtzDWBo
	 SaxQ8xUkLCR1KYa13IZutKA4uFkH/h5znwBPjaiOIFLaWHC78H2VWq8p/Gi/iEnMxz
	 S8Ad0IlgZX3tbF+ZUsiU2Y7E/gYL0qEosr6SulruTHuoLhz98mPRFy13i+1AEoJ/rJ
	 xfXxBXNvkHNkcbaPdI9VsheC+JD6AJ9BIbW6QhAkpdRtwUeC+R51MJtjMKZ0hQFEC6
	 J1s7g2YxugjRA==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 24 Apr 2026 16:34:52 +0100
Subject: [PATCH] clk: bcm: rpi: Mark VEC clock as CLK_IGNORE_UNUSED
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260424-clk-bcm-fix-pi3-v1-1-8a734e94cecb@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJyN62kC/yXMyw5AMBCF4VeRWZukqpHwKmKhNWXc0yIS8e6K5
 ZeT81/gyTF5KKILHB3seZkDkjgC09VzS8hNMEghM6FkimYcUJsJLZ+4copSWdLKKpHbBsJrdRS
 mr1hWv/2uezLbm4H7fgB+P3ymcwAAAA==
X-Change-ID: 20260423-clk-bcm-fix-pi3-24feb4f409fd
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1968; i=broonie@kernel.org;
 h=from:subject:message-id; bh=IzJd3AuP5Nuq9Zvap5k1h/QxZqkhLbWrWEXCTZ3drAQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp6442kwyoYyGAaCGRGLWTYSjr7u42wii9lDuVL
 uKQdaNHNdqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaeuONgAKCRAk1otyXVSH
 0ONgB/9+gWH2IkyXwL8eIwmCvYX2d612vE96lII9rkp/Cj8nfrsP/J56x4e2cISYEQlNv6nJf+A
 MD05BBQrupEJXlzQT4hs+IVb5fUIjFdqjpoYd6XwPyEyY9UyjM0T18z00nzkRGfpsfKZUpA47qj
 k/SlroJgKXxwjLeZBJA0SiLYou8EecZL1pKPjPCSvza3cnDtsamVGjDYEnWmdfpYH7cUFAnlHfe
 ac6IHs+EMvf0K3+6mDyNWajAVp1k1hHjRN8mhSfJ+ZbZUIaC/c/5WZRcjfpT33xizKSYCEaxaK4
 nMef375Ckcoljrdx+3+AZBnBOwxGY7SQn26rx71dcgSvsALN
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

From: Maíra Canal <mcanal@igalia.com>

On Raspberry Pi 3B, the VEC clock is used by the VideoCore firmware
display driver, which remains active until the vc4 driver loads and
sends NOTIFY_DISPLAY_DONE. If this clock is disabled during boot, a bus
lockup happens and the firmware becomes unresponsive, causing a complete
system lockup.

Mark the VEC clock with CLK_IGNORE_UNUSED so it survives the unused
clock disablement and remains available until the vc4 driver takes over
display management.

Fixes: 672299736af6 ("clk: bcm: rpi: Manage clock rate in prepare/unprepare callbacks")
Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/r/5f0bec08-f458-4fba-8bf3-06817a100c4c@sirena.org.uk
Signed-off-by: Maíra Canal <mcanal@igalia.com>
Link: https://patch.msgid.link/20260401111416.562279-2-mcanal@igalia.com
Tested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
Resending this fix directly in the hope of getting it into -rc1 since
this is a clear boot regression and neither the original report nor the
fix have had any response for some reason.
---
 drivers/clk/bcm/clk-raspberrypi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index df2d246eb6ef..f1a99de6de4f 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -160,6 +160,13 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_VEC_CLK_ID] = {
 		.export = true,
 		.minimize = true,
+
+		/*
+		 * If this clock is disabled during boot, it causes a bus
+		 * lockup in RPi 3B. Therefore, make sure it's left enabled
+		 * during boot.
+		 */
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	[RPI_FIRMWARE_DISP_CLK_ID] = {
 		.export = true,

---
base-commit: 672299736af6c398e867782708b7400957e62c76
change-id: 20260423-clk-bcm-fix-pi3-24feb4f409fd

Best regards,
--  
Mark Brown <broonie@kernel.org>

