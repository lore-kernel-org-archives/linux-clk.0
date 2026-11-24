Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554376;
	b=SeQAMi+dNj9d4D3lwm+IVxUuk7NNoS3MNOjCoj8B3FjOrmLQw/OJdqXclmCnE87boEZU
	 u3HlQLrUOCW8ZhPtlWmS4jTI3LAdDjIBTDcjw/q2UQLZK6OboGr2IiH2n65rUAXDhs3qS
	 zssmWO9/zIFh6vdD45uTviyeLRmUtNnEJSbM6Smc7Ve20CrTKx77TnWpQsaiIB9wdpo9F
	 QjsE3e/r6YNgKRRfCD7gaUNfwyRAG2iftdDqygHzyDhSwpmdl+4rpxEoRJvwrCk7doJXW
	 BIhNGCHb/A8W+hI+vNPkbs5XYI4yFAH5Hh0Bs+a2PxxWX4ULsFlK+l1xeaAfOMXeMzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=rz9cXwSdrIyJkGKwTLKEziA5VeFet9zhVgH+uApk5dg=;
	b=hszBH6+KNhZwYbqdbQ2yh05LHNrdpVMxeEYtLfKaoqCjuqOYnjVUIHC8i3lrIF858LGB
	 rr1Z3PEAzNnNbTLoGglc+txZEh+uiQ3CEPGDUVRwG5NZuMqoR1DsHDJt8W4/juMVe5GS8
	 dNaAHRFUjjsRA2cOaz8jDwdMOM2Ma3NwAXL2EyUoUA44qiGnkYAk5sP28+nKx0IDE1Sof
	 e5Y0jbwUyow8bbMQmk8j+MQfV3iGT9swggrW5ymXUfnPnCfkfyDT7D/Ygc9Z+LVjO6C0r
	 QJchkfFu40x4a+pnftIdayJ4udPLNIjLaNVmwah57I337TQ6NDAvG4DIB/M+WldvuIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DBMx8mG4;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AF3606A31E
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 21:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88AF3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DBMx8mG4
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c0a520df2eso4975277e87.0
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 13:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795554374; x=1796159174; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rz9cXwSdrIyJkGKwTLKEziA5VeFet9zhVgH+uApk5dg=;
        b=DBMx8mG4eYblBXo/XBW6v/IeuxqOAFfzjTNYQexTVYZaEvGSIOooL9Qey+mRSD4ve1
         2UPPuq0TOyt4yZrh92966E5Pn+LVARENCz+Cp7LeBuGkbXPbd2PHax9NqlakbHIHcirW
         S3EJ4AcgFr1rvvYxrAoi0ozfiUkpzHznANVBM7iPNu5XpZ3bMcjGcmWSy8lqteJny2//
         1eYoL25MVWny0JgncZI1quQUjp4DnK3ZPCtuC/oarxBWmQtgTJDyzasMmlbo/no1BEmI
         V2Gu4UBlaoP6SsfD/vNK/wmCjAVtRzkVHSZvpELWdFIBG1uDjwk8BN5bkINvxbjtyQio
         UYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554374; x=1796159174;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rz9cXwSdrIyJkGKwTLKEziA5VeFet9zhVgH+uApk5dg=;
        b=2UUXJwd8OqK/aJvt0gRPNcNZ0UnnAecXqGQtJjUgZYMK1AXeDQCMglWArKwoo+TIcn
         RnX+13vfbYtj8sH88q58qUWHCppz9rIHR738Rf32awOjlAS0qPOeLjrNhqg0+SYE0y9I
         /FpxXuNJnr3ijEHyECxv1wBDMgb2NQLi00obM+JhLtYHnu17N0d7JNPH2gKmt7WHEV2p
         LrKAbKik4Nyx405VvnoIlqqi8bKSTKXAB/PK2jgIpDr+z0Bf2UL21yGj3ebZskyGPjEW
         SCXx+yotuUx4eDari+q8XOzHPIqBIAGwv0ey9jD08J/cMa59G/hAKKdJ4TAu0yzHvia4
         MVsQ==
X-Forwarded-Encrypted: i=1; AL+hErEsFKeEVXvhya/XOVoXhbilz/SvP2D3JarLa1QMkOScap/WF9CdmMDk7yl3ApLonfr3X/Qlxy/OiRQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/34qUD/cj0pQwoJhFR5SopLM3ieftluVcJo8jCZiEM/yZA2VrB
	rhOc/YKeStVk9KnWhPkcwJAIPh739bsITYaY+30BP20WFhj/7R4e3dGI
X-Gm-Gg: AZFdTZf4MNLa4weBHAsib4L89aEJIsUWUADGfJ5E62j/9HiPLpFhy/oUKtyg+sQEbhn
	Hi0Hst6evRalJCeie9pjrjw86Q2Y0k+415ahIsawveyaEQLjeaS5DGl4KaPg2rTr0vA9FNJvUcW
	MGavTbRd/EKwKp1KUl/Ug895nTPxNrb6mQpvsDcGDDtbDlidTWsTqcivoo0Ns32onMhuv7xsCIj
	7Z2iN5iCnohTJ8F/GTtKFLVdNYr/QEOxnJ6ulKdviTDTtoDk9FuySzmh8WALcLXnxl/Dxsaoj6B
	kWeOmXQt59aMpNItU/b9m1it4zRSdnpxTf0QWQmLSczNHxmdtQckqpH6CzMsS6WnTBhI+6XY1fy
	O/sBLXE0zfrZck8Ta/ZOsPRemmKYKJfmAVlcqzrOZMbQFgCYjelM3uD8IgSPmGoNXzkQfgypI1t
	B0NfrhKoER8a8By4Z/D1eztYgF/DTM9g6jUxDWN4TG978db0vzOG2waXmuUgY5nJqkVIxqmLj0r
	6ayqcHCPutQb7hzQXKoIauSVzPYOhho0hE2bUTPvfkbsCUJFNNHAnqYHfQhIGaF4ine8xcaqCvT
	TxbNL+pFTgFtBX65MKb6kM+YIjFoSk+LnRTiboj+
X-Received: by 2002:a05:6512:1585:b0:5c1:4cd0:16d6 with SMTP id 2adb3069b0e04-5c1bc9055eemr4215243e87.65.1795554373444;
        Tue, 24 Nov 2026 13:06:13 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd041813sm4099045e87.53.2026.11.24.13.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:06:12 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Subject: [PATCH v2 0/6] watchdog: Add Tegra20 watchdog driver
Date: Tue, 24 Nov 2026 22:05:58 +0100
Message-Id: <20261124-t20-for-upstream-v2-0-440116846f97@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/2XNyw6CMBCF4VdpZm1Np3IrK9/DsIA6wBihpC1EQ
 3h3A7pzeZI/31khkGcKUIoVPC0c2I1QCn0SYPt67EjyHUoBWukMURUyaiVb5+U8heipHmRi8sb
 mWYpFYeEkYPLU8usgb9V3h7l5kI27sxc9h+j8+/hccO9+PKp/fkGpZGr0JUmMSbGlazfU/DxbN
 0C1bdsH9xERBcIAAAA=
X-Change-ID: 20261108-t20-for-upstream-497bc765188c
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org, 
 clamor95@gmail.com, Artur Kowalski <arturkow2000@gmail.com>, 
 linux-clk@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6648;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=DR/VcPZhN2+mqYyrN5IGtMQShQopJZHsyrrHEo9QXW8=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQzbrH6c3kW8X68xaHdSycdqJ0On/Ez9vjne6eOU82++Kj
 Lf1Jq//d5SyMIhxMciKKbKYPRT6wjPP6/2Gl1s7YeawMoEMYeDiFICJNFkyMsx6fkp+X+vses2c
 YPZ3T6PybFXF7RP+HIr0vq/c87v13meGP/z8H2slrj5s+Sr98tvPx3z/tQ7L2zc8O2HyNq+Gc97
 bCg4A
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

The motivation is to improve recovery from kernel hangs, which have been
steadily driving me to the doorstep of a psych ward for a few months.
They are rare: some happen at boot, others while using the tablet for
something real, like reading PDFs, browsing the web (to the extent
possible without working GPU accel), or just using it as a thin client for
another device.

All my attempts to find even the slightest hint of what went wrong have
come to nothing (the device just refuses to hang with UART connected),
so this series is born in the hope that it will finally enable me and
others to catch those bugs (using the watchdog and pstore).

Tegra20 has no dedicated watchdog block. Instead, the clock and reset
controller can reset the system when timer 1's interrupt fires while the
previous one is still pending. This series adds a tegra20_wdt driver for
it, which takes over a watchdog left running by the bootloader.

Tegra20's boot ROM hangs after a watchdog reset if the VDE partition is
off (for normal reboots, this is handled by 8f0c714ad9be). The series
offers two mitigations:

- By default, tegra20_wdt stops the watchdog for good before the
  partition is powered off for the first time, using a new PMC power
  off notifier (patches 5 and 6). A watchdog started by the bootloader
  still covers early boot, until the PMC driver comes up. After that,
  opening the device, keepalives and timeout changes fail with -EBUSY.
  Booting with tegra20_wdt.stop_on_vde_off=0 keeps the
  watchdog running instead, at the risk of the system hanging instead
  of rebooting.

- Booting with tegra_pmc.vde_always_on=1 keeps the partition powered
  on, so the watchdog is fully usable, at the expense of higher power
  consumption.

This has been tested on ASUS TF101:

- with tegra_pmc.vde_always_on=1, the watchdog stays on. The device has
  been running for several hours with no issues. Suspend/resume works,
  and the watchdog keeps working after resume, both when only the
  watchdog core pings it and when user space has it open. The watchdog
  resets the system both when user space stops pinging it and when the
  kernel crashes, and U-Boot and Linux boot normally after the warm
  reset.
- with the default settings, the watchdog taken over from the
  bootloader is stopped when the PMC driver powers off the VDE
  partition. After that, opening the device fails with -EBUSY, and the
  system keeps running without resets.

Another series for fixing some other issues with warm reboots (not
related to watchdog itself) will follow shortly.

Patch 5 is flagged by checkpatch (WARNING: ENOSYS means 'invalid
syscall nr' and nothing else). I kept it as-is for consistency with the
existing stubs. If this is not desirable, just tell me.

---
Patch 3 depends on patches 1 and 2 and must not be merged before them:
otherwise the watchdog driver conflicts with the clocksource driver over
timer 1, and the clock driver helpers it uses are missing. Patch 6
depends on patch 5.

To: Daniel Lezcano <daniel.lezcano@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
To: Jonathan Hunter <jonathanh@nvidia.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Guenter Roeck <linux@roeck-us.net>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: linux-watchdog@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: clamor95@gmail.com
Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>

---
Changes in v2:
- Add Tegra20 support as a separate tegra20_wdt driver instead of
  extending tegra_wdt, and drop the tegra_wdt match data refactor
  (Guenter)
- Access RST_SOURCE through helpers exported by the clock driver
  instead of mapping the clock and reset controller's registers
  (Krzysztof)
- Validate the heartbeat parameter with watchdog_init_timeout()
- vde_always_on now has effect only on T20
- Leave the watchdog core's state alone in the VDE power off notifier,
  which raced with the core and leaked its references (Sashiko)
- Refuse timeout changes after VDE power off before changing the
  timeout (Sashiko)
- Fail pings after VDE power off, so that user space finds out
  (Sashiko)
- Document that stop_on_vde_off takes precedence over nowayout
- Document the parameters of tegra20_wdt in watchdog-parameters.rst
- Link to v1: https://patch.msgid.link/20261110-t20-for-upstream-v1-0-5923449951fe@gmail.com

To: Daniel Lezcano <daniel.lezcano@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
To: Jonathan Hunter <jonathanh@nvidia.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney+clk@redhat.com>
To: Jerome Brunet <jbrunet+clk@baylibre.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Guenter Roeck <linux@roeck-us.net>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-watchdog@vger.kernel.org
Cc: linux-doc@vger.kernel.org

---
Artur Kowalski (6):
      clocksource/drivers/timer-tegra: Keep Tegra20's watchdog timers free
      clk: tegra20: Add watchdog reset control helpers
      watchdog: Add Tegra20 watchdog driver
      soc/tegra: pmc: Add an option to keep the VDE partition on
      soc/tegra: pmc: Add a partition power off notifier
      watchdog: tegra20_wdt: Stop on VDE power off

 Documentation/admin-guide/kernel-parameters.txt |  12 +
 Documentation/watchdog/watchdog-parameters.rst  |  14 +
 drivers/clk/tegra/clk-tegra20.c                 |  60 ++++
 drivers/clocksource/timer-tegra.c               |  40 ++-
 drivers/soc/tegra/pmc.c                         | 160 ++++++++-
 drivers/watchdog/Kconfig                        |  11 +
 drivers/watchdog/Makefile                       |   1 +
 drivers/watchdog/tegra20_wdt.c                  | 413 ++++++++++++++++++++++++
 include/linux/clk/tegra.h                       |  16 +
 include/soc/tegra/pmc.h                         |  19 ++
 10 files changed, 733 insertions(+), 13 deletions(-)
---
base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
change-id: 20261108-t20-for-upstream-497bc765188c

Best regards,
--  
Artur Kowalski <arturkow2000@gmail.com>

