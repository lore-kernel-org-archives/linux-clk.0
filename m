Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA94E1D6DC4
	for <linux-clk@vger.kernel.org>; Mon,  7 Oct 2024 12:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728304807; cv=none; b=qP7oTWfkjk5f+by1jff3h3zOQ1EZNKdZh+sYobiti2nd/dpm9h4F4hZ3AT+sCrAz7F4RqdTsy2qt/dHRlHWyyvvzwk9H3ZePoFWC8mM1n77gdWNYP5R0bOAum/dZWlTVO1ayYSR5sVE6Kb2GQIJWmNYnhpwi2VHmqWxJGWBAXaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728304807; c=relaxed/simple;
	bh=mkLhLwSMHZ/hO35qXKlv3paIFazWoum0UehyHiC/QB0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XFf5Ztro6vGWsozTEpR736Mqj5ovC5rHkVIRlFHQVuYPkqePxO9nN0xBTU3CZNW5cdNZmW0objHYgkJTtvn4KqNqy7QG+JK1WyoJ9x+rvA14ZafqWFg5HVXUkXTtSMm+fUGdSWpPxLDlaGk/EP1nJdtSRkfzQjmY8DXy5Wk2+Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CAIDhfiE; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CAIDhfiE"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fad100dd9fso58711501fa.3
        for <linux-clk@vger.kernel.org>; Mon, 07 Oct 2024 05:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728304802; x=1728909602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XxqlkITvdCM/QWIQix/9plieOyS0wK2Vm/r1GXcM7hA=;
        b=CAIDhfiESYPEcNE8YFhNUYXgmKxi424zPamebyO+pTgCeXatPoVk43dc/Gd5QS5TCF
         dWHxozIT6V5wSqiNQlibR9fbPy/c5BLJxdPSzayiPf1cKicZz3amHh1d7cPc2tiY90iW
         WfeA1n22uctbNobcD1eknSfG+TQy1wh55g87R+PhATbfT9unM7tggRJwFBGFk2OYtrnj
         TMw+0dMsynOB1jXg8PUP8gqg5jwVjRRvFdM1Z44sV+Bc4lvPxDNVJSe6oy2/ArJCR7Kh
         Y8acBAsNX82Q90sIFAQQDh+OKp8r6LT9PfsLOn6AAEEUbjE5coHSaFhHIG9KO3Vha5fz
         gjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728304802; x=1728909602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxqlkITvdCM/QWIQix/9plieOyS0wK2Vm/r1GXcM7hA=;
        b=VGIOUdWGOxGvGjqdZSo7E0bTYuyk6wUUImnGwnEw6HgcjhHV76y9YxaAEWW+dgmyYt
         G0hoCSyyOTQ6tb4tjAQA0z8ODomTrWXgT/5S1eocZbfItbO5lLV/o5SkJQ1lQYlp0oNT
         ON10ypei3x0qlLxgOqfZurbe2Q2gXPhywBiGGrWXKNjiW2KjRYrwl9h/bdgnTcM4nMJT
         kXAW2Qaqg+L4yDrrWzrmobUVZr2M69PuiebzXPPRBpnnSwnO+hpOmT9JpwxPl0Ty6rjD
         3gv/T9yVrQYrCoD5WOW587U0LWV3Yko3VO7hBfysPVXCaf6kOtrX1n2E7qWBXVvManTn
         5UOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8p45o2tOVYo/dQBL9OWvWbYXlZXC+l0jkIKH6SwXhlUGYutsxhR+LkL+JfgYz/EgRif2ZgsJxFPo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfNWhmcGeFNdHgSY+m86rjxIfN953p/YkYOycY6vk5QGH9vy9g
	8y8UszFFojTF9Ycq54Quu1EvJIT5ijJDdsB1HbfvzsuG3DGKEvWugAumFy/MDLQ=
X-Google-Smtp-Source: AGHT+IHR1ktp254iz8KIigduOBzppWGhiMiVs/yxKW6oEsL/Vly2uGjKRU1R2KrvUoC9JvDdD8m3iA==
X-Received: by 2002:a2e:a9a1:0:b0:2f6:6198:1cfa with SMTP id 38308e7fff4ca-2faf3d79a3bmr70522671fa.41.1728304802350;
        Mon, 07 Oct 2024 05:40:02 -0700 (PDT)
Received: from localhost (host-87-21-212-62.retail.telecomitalia.it. [87.21.212.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a992e7e2252sm371446466b.206.2024.10.07.05.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 05:40:01 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v2 14/14] arm64: defconfig: Enable RP1 misc/clock/gpio drivers
Date: Mon,  7 Oct 2024 14:39:57 +0200
Message-ID: <6964b1728d155b85c9c97fe26726e8ee2c04abf8.1728300190.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1728300189.git.andrea.porta@suse.com>
References: <cover.1728300189.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Select the RP1 drivers needed to operate the PCI endpoint containing
several peripherals such as Ethernet and USB Controller. This chip is
present on RaspberryPi 5.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5fdbfea7a5b2..5fcd9ae0d373 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -609,6 +609,7 @@ CONFIG_PINCTRL_QCM2290=y
 CONFIG_PINCTRL_QCS404=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
+CONFIG_PINCTRL_RP1=y
 CONFIG_PINCTRL_SA8775P=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
@@ -689,6 +690,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_MISC_RP1=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
@@ -1270,6 +1272,7 @@ CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_FSL_SAI=y
 CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_COMMON_CLK_PWM=y
+CONFIG_COMMON_CLK_RP1=m
 CONFIG_COMMON_CLK_RS9_PCIE=y
 CONFIG_COMMON_CLK_VC3=y
 CONFIG_COMMON_CLK_VC5=y
-- 
2.35.3

