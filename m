Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B76122DFB4
	for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 14:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780247; cv=none; b=o35E+1ttkNGaVFYCFBlJMM6hcJ/61f6YezhJuGbnuTIW9P6XukMu4i41k5ChR9VxdFPjLuvY9S6mOiOIts7r40f8IZU76l+ry2fk4OG6/a9RouuPwhFS/V3YWR2kO0EAT5LikcSusEtUN4u/qu1NtJd/aBiQ22XNMwElFy/LV/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780247; c=relaxed/simple;
	bh=ZC8TFqmEccx1T/wjcHtffQmZC5UCagFKPztnEc0J07w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=dCX4+nhOUKAJtjoGf6DG5ErjYVaCAQQSyLHGe+F+TSQC9mJLBRINYoX/aw2Ma8GkebZQY8cZhlKkEuu0xR4xwptWvPIJUYKYGiHEQ+2X0fMrrrdkMV1gYM0AE9wELnW0gQfTaekmjzaIO35u3JH7tCnO70nB9Vifj7uTUzq4mwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=W63xq+uU; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="W63xq+uU"
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so6682490a12.3
        for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 06:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736780243; x=1737385043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FwnS3vaGfU2joF6cYNFfsBCgKjyVEnMzRnIWwalUQU8=;
        b=W63xq+uUluv93Q6rqgQolyyslqu5eu6i1ALH0BDGjyLzj83EvgeqyXJZhVTxaj6j6h
         fiBO0rlahklJPg8nv0lEKSUDOqZ8I6Yt6uR25VqZ1jagfYumxbzzxrL/C//fI9+HyGZV
         XPBhiuSW5RQRoeIddb26ZpZO5ColTTKLN20/vJAuaGqVF2evdFGbaJ9Xoe3nKcSNl9j3
         8P0HsESCgIiq2vvvoBg+2QoESQqcPPMg6eim1dMmL0QMwdbRZ7qKuApMinHRxg4VSqQQ
         ijzJ8yV3aS8iVlR24ZXjgu+JQNOZ/TzJAE/2HBK0mwf6IVBMlLETFmRSFL/2CXK85Me3
         bPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736780243; x=1737385043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FwnS3vaGfU2joF6cYNFfsBCgKjyVEnMzRnIWwalUQU8=;
        b=AUFG7Do8TuQY/e0LMU/NOBZTl/QpXK5N4Fl+zUAQ6tPlwBYKNFPZMjL0Uk7LcPe7DY
         mQ4usXIyp7SqHsGPpI6iohJXlISRE6bhErWR/dBYewHT9ehLCTScwhMhNUwfHmEAy6xo
         MT5oX8XteNWDjJOUlX7rRinIjFl+QJE3XVF2vUSLBS8QDog+1Or2Q1skJ/EK58zRq3YM
         MP+gSz5KCU3tYw9LcQzNUqXvTl5BlhVGDw0hwLruAeSZMIErZLQ5OAhYJltfXgQI6/qc
         IGkXWWJdUNvji7y4Xxr+8t2Fk+0UdVEIF6S9AyL617P2KFJftEH/sqrZbXMcWTQoVjCP
         4JXw==
X-Forwarded-Encrypted: i=1; AJvYcCXGfO1c1bUcSM9GlLvTnPrnZ/XfwDPLjj0Oz6TrU3vtNxVDy41pLcDRfk4v5FuAB1zRTbkdsSbIyCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyutJgtnqslDsvQTSWb8J51PPs/HkL386KH1/LuxqEmAej6vJNT
	2OCJ7x2RtDGWvUywRXVSke19JgRV/WQUiw50vbelRxSPCPWuMWQFjDBFsZxri7w=
X-Gm-Gg: ASbGncuGLcy1lfm7G382iZQNiIfUsyuSZPYisFwPmzyFe1ByBoJdyMoY+5YAuI22OK2
	FU5Bm9u5frkXMRtLX/Hq6GrKWMJz0IWkQxS+20W+pTwQuUG7T2XVUB+XX4JQReIcR2j3iQIxn6t
	Z5jc3QWeviwEc2hfl0Z/TmmUIdJcMMrszU3oZ1ypqh3vw0Mc0StXm6JtOjFXvtJ9MIsesKVGj1V
	idq0yk5oAY6SZFc/6qWy9/ZITrG7udh266ohTnX4Hqj/akFEniktDvfejbZYeg8HXJfCynssPGh
	s37bSormhaWX5M2jpSTgE7JtuVw=
X-Google-Smtp-Source: AGHT+IF+dQmIb1tSxF2qnawRLekJBTCQVTuDzMZWssaSx8RiWN62SO954NQh7GFSKEfS+l/Tll7rpQ==
X-Received: by 2002:a17:906:ef0d:b0:aab:d7ef:d44 with SMTP id a640c23a62f3a-ab2ab6c1ad2mr2040825166b.24.1736780242877;
        Mon, 13 Jan 2025 06:57:22 -0800 (PST)
Received: from localhost (host-87-14-236-197.retail.telecomitalia.it. [87.14.236.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90da2c8sm516494166b.62.2025.01.13.06.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 06:57:22 -0800 (PST)
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
	Krzysztof Wilczynski <kw@linux.com>,
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
Subject: [PATCH v6 00/10] Add support for RaspberryPi RP1 PCI device using a DT overlay
Date: Mon, 13 Jan 2025 15:57:59 +0100
Message-ID: <cover.1736776658.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RP1 is an MFD chipset that acts as a south-bridge PCIe endpoint sporting
a pletora of subdevices (i.e.  Ethernet, USB host controller, I2C, PWM,
etc.) whose registers are all reachable starting from an offset from the
BAR address.  The main point here is that while the RP1 as an endpoint
itself is discoverable via usual PCI enumeraiton, the devices it contains
are not discoverable and must be declared e.g. via the devicetree.

This patchset is an attempt to provide a minimum infrastructure to allow
the RP1 chipset to be discovered and perpherals it contains to be added
from a devictree overlay loaded during RP1 PCI endpoint enumeration.
Followup patches should add support for the several peripherals contained
in RP1.

This work is based upon dowstream drivers code and the proposal from RH
et al. (see [1] and [2]). A similar approach is also pursued in [3].

The patches are ordered as follows:

-PATCHES 1 to 4: add binding schemas for clock, gpio and RP1 peripherals.
 They are needed to support the other peripherals, e.g. the ethernet mac
 depends on a clock generated by RP1 and the phy is reset though the
 on-board gpio controller.

-PATCH 5 and 6: add clock and gpio device drivers.

-PATCH 7: the devicetree overlay describing the RP1 chipset. Please
 note that this patch should be taken by the same maintainer that will
 also take patch 11, since txeieh dtso is compiled in as binary blob and is
 closely coupled to the driver.

-PATCH 8: this is the main patch to support RP1 chipset and peripherals
 enabling through dtb overlay. The dtso since is intimately coupled with
 the driver and will be linked in as binary blob in the driver obj.
 The real dtso is in devicetree folder while the dtso in driver folder is
 just a placeholder to include the real dtso.
 In this way it is possible to check the dtso against dt-bindings.
 The reason why drivers/misc has been selected as containing folder
 for this driver can be seen in [6], [7] and [8].

-PATCH 9: add the external clock node (used by RP1) to the main dts.

-PATCH 10: add the relevant kernel CONFIG_ options to defconfig.

This patchset is also a first attempt to be more agnostic wrt hardware
description standards such as OF devicetree and ACPI, where 'agnostic'
means "using DT in coexistence with ACPI", as been already promoted
by e.g. AL (see [4]). Although there's currently no evidence it will also
run out of the box on purely ACPI system, it is a first step towards
that direction.

Please note that albeit this patchset has no prerequisites in order to
be applied cleanly, it still depends on Stanimir's WIP patchset for BCM2712
PCIe controller (see [5]) in order to work at runtime.

Many thanks,
Andrea della Porta

Links:
- [1]: https://lpc.events/event/17/contributions/1421/attachments/1337/2680/LPC2023%20Non-discoverable%20devices%20in%20PCI.pdf
- [2]: https://lore.kernel.org/lkml/20230419231155.GA899497-robh@kernel.org/t/
- [3]: https://lore.kernel.org/all/20240808154658.247873-1-herve.codina@bootlin.com/#t
- [4]: https://lore.kernel.org/all/73e05c77-6d53-4aae-95ac-415456ff0ae4@lunn.ch/
- [5]: https://lore.kernel.org/all/20240626104544.14233-1-svarbanov@suse.de/
- [6]: https://lore.kernel.org/all/20240612140208.GC1504919@google.com/
- [7]: https://lore.kernel.org/all/83f7fa09-d0e6-4f36-a27d-cee08979be2a@app.fastmail.com/
- [8]: https://lore.kernel.org/all/2024081356-mutable-everyday-6f9d@gregkh/

CHANGES IN V6:

PATCH RELATED -------------------------------------------------

- patch 2: added: Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
- patch 3 and 4: added: 'Reviewed-by: Rob Herring (Arm) <robh@kernel.org>'
- patch 8: removed a stale paragraph from git commit message regarding
  gpio renaming through configfs


RP1 MISC DRIVER -----------------------------------

- interrupts definitions moved as documentation from rp1_pci.c to
  pci1de4,1.yaml binding schema


Andrea della Porta (10):
  dt-bindings: clock: Add RaspberryPi RP1 clock bindings
  dt-bindings: pinctrl: Add RaspberryPi RP1 gpio/pinctrl/pinmux bindings
  dt-bindings: pci: Add common schema for devices accessible through PCI
    BARs
  dt-bindings: misc: Add device specific bindings for RaspberryPi RP1
  clk: rp1: Add support for clocks provided by RP1
  pinctrl: rp1: Implement RaspberryPi RP1 gpio support
  arm64: dts: rp1: Add support for RaspberryPi's RP1 device
  misc: rp1: RaspberryPi RP1 misc driver
  arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
  arm64: defconfig: Enable RP1 misc/clock/gpio drivers

 .../clock/raspberrypi,rp1-clocks.yaml         |   58 +
 .../devicetree/bindings/misc/pci1de4,1.yaml   |  135 ++
 .../devicetree/bindings/pci/pci-ep-bus.yaml   |   58 +
 .../pinctrl/raspberrypi,rp1-gpio.yaml         |  198 +++
 MAINTAINERS                                   |   14 +
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |    7 +
 arch/arm64/boot/dts/broadcom/rp1.dtso         |   58 +
 arch/arm64/configs/defconfig                  |    3 +
 drivers/clk/Kconfig                           |    9 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-rp1.c                         | 1527 +++++++++++++++++
 drivers/misc/Kconfig                          |    1 +
 drivers/misc/Makefile                         |    1 +
 drivers/misc/rp1/Kconfig                      |   21 +
 drivers/misc/rp1/Makefile                     |    3 +
 drivers/misc/rp1/rp1-pci.dtso                 |    8 +
 drivers/misc/rp1/rp1_pci.c                    |  305 ++++
 drivers/misc/rp1/rp1_pci.h                    |   14 +
 drivers/pci/quirks.c                          |    1 +
 drivers/pinctrl/Kconfig                       |   11 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-rp1.c                 |  789 +++++++++
 .../clock/raspberrypi,rp1-clocks.h            |   61 +
 include/linux/pci_ids.h                       |    3 +
 24 files changed, 3287 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
 create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso
 create mode 100644 drivers/clk/clk-rp1.c
 create mode 100644 drivers/misc/rp1/Kconfig
 create mode 100644 drivers/misc/rp1/Makefile
 create mode 100644 drivers/misc/rp1/rp1-pci.dtso
 create mode 100644 drivers/misc/rp1/rp1_pci.c
 create mode 100644 drivers/misc/rp1/rp1_pci.h
 create mode 100644 drivers/pinctrl/pinctrl-rp1.c
 create mode 100644 include/dt-bindings/clock/raspberrypi,rp1-clocks.h

-- 
2.35.3

