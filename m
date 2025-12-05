Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2783830DD31;
	Fri,  5 Dec 2025 14:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764944938; cv=none; b=NB2dle2IDs/jFHFQhsZ52FueheUl6bn3liBenBr7dC0gBZhCh3eNHNHAMYEgDTm5oVkPBAoYTq/NU7EpP4pz8TjX995dNjYw2aJLqb/Xr21lvQyoEsN32awcuRRHtwZjnTMPAZ93w+c0njLR3gx4r3ehs7KFcViCvNCN+KQP5Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764944938; c=relaxed/simple;
	bh=rbTTQpZ6z4LDnFiBLLxdV+M0ZhEtpr4RXswn+q95nf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nM7y3hspuf/Xw+eW0xI6VKW+TAW0eOZPW9iwATm5jmHJL9HjdImIOgu3G8YjnJggAKu8gLoz9+qHrox98dhE0TObhz+G38u2oCnAkEcc+Gjermry8ckA8XuvBX6N2ofW0W9YL+oLh1cJNQSI9NKd69KhhDIXLt65sCc1SB4bHH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=wjqbJzej; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="wjqbJzej"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D7F9AC1964B;
	Fri,  5 Dec 2025 14:28:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 571BB606AC;
	Fri,  5 Dec 2025 14:28:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBFB4102F0A9C;
	Fri,  5 Dec 2025 15:28:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764944926; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qQQPUYWzC4MVTVocsZ5Vaqxv+1vD3oOyYMIVagNfpfo=;
	b=wjqbJzejUGhNfXPzI1AMvsXgzJYpEZdUKWMGoF5ERPpaGOf23wwuyV1cF1qFbNrj3hBzCu
	hL3JHvKG7ceFAhjYvoCYBAHMi/bQB1usM0osoPxZvOvx/EFjxr/mfhfMsjgIqSNO3RSOt5
	N4qnCLXpSROWhrYycXRIIhzy/NJq5GsnltEgPFnC2gj8fEx7hemYrmxRzkcK3X+SfQalZ4
	nPFo+G+AMOjO2CyEF/hvR+NE3LdzaSMxoTOkwSX7ciGx2LsxcBpsORvSfmd5a+6hFaArgh
	QDXfBpafg8K3YDS03kLkGI1Qvpl+GF9vj1//ZWaUOD17X9XNiSwGHoGAm1Z9kw==
From: "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
Date: Fri, 05 Dec 2025 15:28:26 +0100
Subject: [PATCH v3 4/4] firmware: ti_sci: restore clock context during
 resume in BOARDCFG_MANAGED mode
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-ti-sci-jacinto-s2r-restore-irq-v3-4-d06963974ad4@bootlin.com>
References: <20251205-ti-sci-jacinto-s2r-restore-irq-v3-0-d06963974ad4@bootlin.com>
In-Reply-To: <20251205-ti-sci-jacinto-s2r-restore-irq-v3-0-d06963974ad4@bootlin.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>, 
 Prasanth Mantena <p-mantena@ti.com>, Abhash Kumar <a-kumar2@ti.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, 
 "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

In BOARDCFG_MANAGED mode, the firmware cannot restore the clock rates and
the clock parents. This responsibility is therefore delegated to the ti_sci
driver, which uses clk_restore_context() to trigger the context_restore()
operation for all registered clocks, including those managed by the sci-clk
driver. The sci-clk driver implements the context_restore() operation to
ensure rates and clock parents are correctly restored.

Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
---
 drivers/firmware/ti_sci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 8d94745376e2a..6ef687e481c49 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -9,6 +9,7 @@
 #define pr_fmt(fmt) "%s: " fmt, __func__
 
 #include <linux/bitmap.h>
+#include <linux/clk.h>
 #include <linux/cpu.h>
 #include <linux/debugfs.h>
 #include <linux/export.h>
@@ -3980,6 +3981,8 @@ static int ti_sci_resume_noirq(struct device *dev)
 				if (ret)
 					return ret;
 			}
+
+			clk_restore_context();
 		}
 		break;
 	default:

-- 
2.51.0

