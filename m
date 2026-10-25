Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955989;
	b=vMmfi6GDW8tW+/vSSE7dxZuBofptwPqWqviukZqjFiXUj/KZpv2D3B0R+U6jKx7uN2cg
	 2oyRrqHqmBOEm0T4J+TqDJ3CGV07Vl6vyQlz4XfDL7vdnKVaOzyEsKrUZsc9JefCqDwIa
	 Rb4WpYV+WpJ3QdnEcg7ApRFzFORTGnunEX/pZYtmCJKuhPE6cKSGcmH0K54ZFoQJy8VAp
	 BjFG5YntQ9A868OFTyeTH0SBAx3qQJr7uWUxqglwAiuo0yADGRSC4Xwpz7mvXbfx5TRVy
	 YJ6I5i+Cpt7p8oaZlhA0RfjvkZUkqnws891RUzlROJu+g9vhKSnSJVqmRsYGekHkA3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955989;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=Dqs4z2NY1rb7FbmpNSV5YxzKzMNh1uksqRMZQL4TgK8=;
	b=jWA+4UiWtpauiwJa+ivyuuCmYlkNn4u3ALTFfbZ4LIzC+YcC8nMRol/1HqZFbdboVkP6
	 PkEXQ1zvCBV4nWf1lucjNqWNarwQaQLfwFMFoqCfsLrtTA1Bduc2bXfXud7XKlDdylyJf
	 7oNuoLBjdDWJavdntcUSX3Zq3eknaydb1olnUUdqsH/y6vIftMLRLZm2GMugfcsBH/cF6
	 u9ufsVUrEkDo3K/0XdaPhS2kzPtn7HpT80VppdfchDZVQnCD4ik1IIfLBMadow+6b2JPa
	 cr+yTPpGOl6QpCchcMpVCExBjJCjcWbtUibNcVb2wisOy+C6Y0sjtKMIjNC+ydtZEcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=tA4kVeKE;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16236606A329;
	Sun, 25 Oct 2026 19:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16236606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=tA4kVeKE
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJJ1eT514480
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:19:04 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJJ1eT514480
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792955945;
	bh=Dqs4z2NY1rb7FbmpNSV5YxzKzMNh1uksqRMZQL4TgK8=;
	h=From:To:Cc:Subject:Date;
	b=tA4kVeKENgDnCqlEJ4/6yeAWjQe5GPl9K8OgiL9OoWKSllIreQ9QS+7hgJIIE1sI1
	 pwhNYsgj5KbD4nNXXPpaJhuN9xkgr6XWQ0toQo/CC5+j1pfAWjpT5Yvg3hWqpTRnfQ
	 2nlmye3svoCEB8XtpL+QrxHI5cMN5OtfdetVsQEo=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
        bmasney+clk@redhat.com, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, yu.tu@amlogic.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 0/2] clk: meson: s4: two peripheral clock fixes
Date: Sun, 25 Oct 2026 20:18:50 +0100
Message-ID: <20261025191852.208226-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

Two fixes for the S4 peripheral clock controller found while bringing
up an S905W2 TV box:

 - the PWM muxes may pick vid_pll, which is reprogrammed on every HDMI
   mode set and so changes the period of any PWM that runs from it. On
   this board that corrupted the PWM CPU regulator (first cpufreq
   transition hung the SoC) and the 32.768 kHz clock of the SDIO wifi
   chip;
 - the CEC 32k selectors lack CLK_SET_RATE_PARENT, so AO-CEC cannot set
   its 32768 Hz rate and fails to probe.

Tool use (Documentation/process/generated-content.rst):
This work was done with the help of an AI coding assistant, Claude
(Anthropic), used through Claude Code over many sessions. It did a large
part of the hands-on work: it read the vendor kernel and the firmware
interfaces, probed registers on the board, drafted the code and the
changelogs, and ran the builds, checkpatch, dt_binding_check and the
tests on the hardware. I directed the work, reviewed every change and
the final patches, and take responsibility for them. There is no single
prompt to quote; the sessions were of the form "find out why X fails on
this board, fix it, test it on the box".

Tested on an Amediatech X98Q TV box (Amlogic S905W2, S4 family, 2 GiB),
vendor U-Boot and BL31/OP-TEE, Linux 7.3 plus this work.

Christian Stefan Kövér-Draxl (2):
  clk: meson: s4: keep the PWM clocks off vid_pll
  clk: meson: s4: propagate rate requests through the CEC 32k muxes

 drivers/clk/meson/s4-peripherals.c | 40 +++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 12 deletions(-)


base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0

