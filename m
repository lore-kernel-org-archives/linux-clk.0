Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B551194A43
	for <linux-clk@vger.kernel.org>; Tue, 20 Aug 2024 14:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724164589; cv=none; b=PfH/hiDWgmHR77G7wyvNeYjD9pZWtTAUo+4OSsm4ypPS9PYA8/2sBB5ooLkchW3oeH8NYWmjn3F0uKwDyWotHXzuw3A4FI6LyyFLk8YnWQxdR/zPgma/elQpfoG6RkCqZjQ+uCW0LSw1iYGfXH1gdArYXAQZFfv7HMNfn//ktQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724164589; c=relaxed/simple;
	bh=Q6R9U2wwjRGJjT5siTyo6sy0eGbv+3Ifx3BfFPK57EU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p816UZnJRfOLScNf+WBj8AvnHnlsmT5WHw8TgGK/Qcrc2rTy6KRge0dirzkkQ8T+PnwmRDCd/idQS6SbZfuEHPyCmIymlxkFJP0HFP+c/gmVqGnnlACJ2zLRupYLUWPhVj2Am9LpJEopeH6w3foAhzWiG4hGNHdOWTJkGK17qWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=abjCqBhN; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="abjCqBhN"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a80eab3945eso568708166b.1
        for <linux-clk@vger.kernel.org>; Tue, 20 Aug 2024 07:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724164582; x=1724769382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3sdpe2m8go7s6MzsbiOy00prukC9EPV/V3TgS4L+Zk=;
        b=abjCqBhN9JcV3aAp/4kBz519k9HmAKKBhS6su8HM9Ts439P3g1ktCQZbVKs4p7RVjo
         0yvGsX/whrdo1IEyRsjUklg0rw2RWL8Jm5KdVj5fRmisirBlt1J3sM4NI7JgWseL7msT
         ZLooCSWNCDpw+Lk6ILwAd6ykdv2u8MnhzBkoQ7+RJJPvOOzf9qDh46bVyYskc7zLtZbX
         cZcX+TqxVjQvAaFM/U2ApltikF4hsngyvU2GdoQI35tgCbwuK+JPokgWw5EPoq+pCQCd
         I22aCm1e3Q4gOksHNzeLN138CGkJrTAJxr7d89PloWMkhMv3uFGtG/1mNYxVj3crlZdb
         T36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724164582; x=1724769382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3sdpe2m8go7s6MzsbiOy00prukC9EPV/V3TgS4L+Zk=;
        b=exKAzV3N6QpsJlTPswJK1NUU5KDEa2u53hgdM0cBke2QS5GLPm9EXP6BCPwXFGgfc3
         vOK6+JigJ5QABpfmojWFKsEHW+Mw/INaqHlKozGbtVtzhMe8H8lEK5u2VGDp6KmOnzyJ
         OHI4+jOKH41fEje1UN7r7SDAKd124ZVWJ2VL2JpnREDR3hLmHSgsH2ichdOnlTJmTkRc
         JwQ3KRsEVnNGjZLWUaFCR5Kk+bfSoJbDBaPGQVqaIfD8YOnlpwVFSnJzw04ok+lSIFzu
         H9PVpTHtG2XJhXpo/Ui84A6GCQocQYlL3C1zeG+bgL/cCMD6TcDNvosoE55w3AjgIYjp
         79hA==
X-Forwarded-Encrypted: i=1; AJvYcCXG/1FOi+IG7zUGVgHB04k11YF11UDNGO2iuXAYL8Vf7473LwvtxJuLBTXg0HtQpZMSdGgfIk6JeVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7aMOCK+tG+n26r/pZsVTtXfsMdp8dDRVxztVL09EsmG8WK3rm
	mpYfY2ThfXFKOzpObT+EP2ObJ5TbDYQgDtNGjUgVaFjxGXc4XMezuO/dA6IMFpQ=
X-Google-Smtp-Source: AGHT+IG9Vpky2GjCOVlioKfXhshYz52MMh4ZHZ8WHnYAFH9VH4UyOZxDKK3tHaYNMdW7W7wK8SqLMg==
X-Received: by 2002:a17:907:e258:b0:a7a:9954:1fc1 with SMTP id a640c23a62f3a-a8392930b83mr1048045766b.24.1724164581785;
        Tue, 20 Aug 2024 07:36:21 -0700 (PDT)
Received: from localhost ([87.13.33.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83839472afsm776558166b.175.2024.08.20.07.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 07:36:20 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arch@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 09/11] arm64: defconfig: Enable RP1 misc/clock/gpio drivers as built-in
Date: Tue, 20 Aug 2024 16:36:11 +0200
Message-ID: <7ec76ec9b10ef1d840a566dab35497bf2d40b437.1724159867.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1724159867.git.andrea.porta@suse.com>
References: <cover.1724159867.git.andrea.porta@suse.com>
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
index 7d32fca64996..e7615c464680 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -606,6 +606,7 @@ CONFIG_PINCTRL_QCM2290=y
 CONFIG_PINCTRL_QCS404=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
+CONFIG_PINCTRL_RP1=y
 CONFIG_PINCTRL_SA8775P=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
@@ -685,6 +686,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_MISC_RP1=y
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
@@ -1259,6 +1261,7 @@ CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_FSL_SAI=y
 CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_COMMON_CLK_PWM=y
+CONFIG_COMMON_CLK_RP1=y
 CONFIG_COMMON_CLK_RS9_PCIE=y
 CONFIG_COMMON_CLK_VC3=y
 CONFIG_COMMON_CLK_VC5=y
-- 
2.35.3

