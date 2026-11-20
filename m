Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199537;
	b=4a+xy7TKWrig6IyUg9F0Qpn2VvI1xfVaYtX34gveRYhEKx7SzR0ryWIjrxQcvuTBNj7T
	 LlBaryb8cSq84JQa6kuBgZl7IkOQqeZX9pd89quGh+3pIumfIosqFHdsle+fD5n8nwj0Z
	 gkKDZCek+pwZpKsHM0y45/44N6URj0hc8lVyXE9nj67XYiJWmV6R/lVTC/y+Pbe1TcvKv
	 LxkZ6tqW2ZzdaOkfh2Rm9cDbTLKYgaBL1j/XAkHRTLsbHUDdcA+0QojmCcFPFEnnBt39h
	 wxHL0XmtcAMdiHHMmZqozTRN3JcT0msbQa+gScGLg0xRMJ7dK5d0cG7ARKzMUmhVe9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AZzAJOXnaWIOq2H9M30kWpYCCj54bYL5bDJVJVQmzco=;
	b=KNPsfGwHiF0A9mWiVdxMJyYJXuLFJ6v7sxLDLWW/PNwa7pIyubAcidDthgX+miWCt8G6
	 yjtXB8R473zQjL4S3qeSuVPnpaFTtSweL36dCKGgVnV8VBG1M9o8jzuXiV9R4d+6GGGH4
	 TlvyIw1uKyihs8zBtNikoTG83iNP5JhWNyRrdvz2+Myrgo2ftNK6FchA03nccr7rGeFaJ
	 mK2TFEhMJelYJcDQfXXxpy8l4Yz3iKmHUGfhx7Q7z+268Za+bCcnTm/XMDsvo5KWPgBfP
	 u2lebRJlk08bVzI4AS6JVPG4l8EtMCr5TQE7k6VQavE3pNVuosRiluZRtorV0Ixo0Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b="pRop/DES";
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0E1606A32C
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 18:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A0E1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=pRop/DES
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4d7034a99a9so767951b6e.3
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795199536; x=1795804336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AZzAJOXnaWIOq2H9M30kWpYCCj54bYL5bDJVJVQmzco=;
        b=pRop/DESQLuxP12DPijGnblLatGbW1DAGt6p9yKIMDbz8ts2P+L+xZkdBsiH/xAPgz
         ZYhsgVYwJU1B057IMpG/BrtRjVgS1bkd+Fmld+8SUAcOTv9LYJj7kDT1GYvINA2DH8k8
         XO3g84acUey/R3/xpXcenODNsfzjHb24PRBNRLZYFeN3GHKxiVSKpKUAaBi2JMHbxu54
         9jKt6Of57JdmQcoJAhCaSfymigMZj2OkVMpiP6ufZlPzVdkB6gN/k9fTcoHBWu2bsQS8
         jCy5lF1rmzBPe7J50AnAXZSXV33bj6GvwZ3f4MKY8el828ois1u1DDjvhNbvQrSXYKiT
         r7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199536; x=1795804336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZzAJOXnaWIOq2H9M30kWpYCCj54bYL5bDJVJVQmzco=;
        b=BECcvNU+cukxxrymaRIhlVHBYpd5xY2Ep9jGri92udRv5ByAMudCr7n9LaJ7icHVtQ
         ld3zfrDemxC5W2qEWfKJVFnJ1F2UrJfezyHMlx8cVUOnmf6D0Vrd2tcI2E6Chs7BMlaE
         v5LlIg4gH7oKl/4h63fG5Ppwv2YXFdhDz67467Sf/hRvp3HQjq5qXtJrH7YjCwHUsoEL
         MEjotZiwJReYW0HeDfH438itfzQ0sBgTcwgIyFlP/dagbeMy8VLqmstKld9Kvo1H818w
         5ozJHrXqpmiDROgx//27bJCJ42m/3E+lAIvvAaLlrjMr73rWfwP0y0yMzJ/nTVEE1BkQ
         tDrw==
X-Forwarded-Encrypted: i=1; AL+hErEIxZctOIaWiOJZ9bK6+Z00iwiK4yIVTVpLSG7AzvWec+ecvI2Vmb2Up6yCmWsp7+KrlTB7vZ1ghWI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zuWdypgpPBogGbPzDiwM95EZG6QOf0IBQvcnm4IpFP/d9HxFM
	/C5lBlhlr8QcY2mAlKpg2IggM/7jY7SNcbxO2h4UhvoQEnGXYMuU/qQOr2fetU/5oUc=
X-Gm-Gg: AYBFou0xdYUImRjOaOoIWfQU0i0DUVIlu9MOCyVDhYEXts6JQtJN3txCbVXMA7l2mdV
	Zr58HYd5jSAuU/Lm7PJIWBROiFemnk0HcqXf59lBZ0IS85uGMRoob5C/Olfc6tTb3QIfKAxMqfS
	caL+jtLur7URm5KVb0QipNcRxhHIiJd/c9DPqf/bf2UCw+tlPpczZvu337X6QONnHENRjRzr4rq
	emz49jb/HiPN0aCkiIeQwFG0DzGnVntvp8iFFXTOaMB32QbZlZjjXxbJF4hJKQ5htgHFQJzBhKg
	dpEg1r7KjuLMmVUYAINE7qpPuT+gV6hLUCNWYErgrnv+bjsLQFYb+9LUj27Va22wr7/r0j1PaAV
	Ay1z1Wg5kBIXfN6fxhFuW/cgsbjWHwD2kPWCIVRNv4kEjNwCS/UDFr+81S+teDeLUIGxpT8+abo
	V54mchWXRiNw6KcIMniAFRnM0rEO4FjgUc/fqf6v8HH041K6PwKk8+YV4HOjQv5M1HRdgpB+bHR
	8/4caTYUbCmR9/dbt9C6+4FvOSHkK9gG0SSBX27c0kPt8c+lu5r/1MBWp9FsKW5SpLH7dxeH7Lu
	titsi7ZLKjz4d69TdC9EmFXFAsntGXCM6Usg
X-Received: by 2002:a05:6808:3084:b0:55c:844:98ff with SMTP id 5614622812f47-57a0a93940fmr4840248b6e.34.1795199536081;
        Fri, 20 Nov 2026 10:32:16 -0800 (PST)
Received: from zippy.localdomain ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35055486sm2619940b6e.12.2026.11.20.10.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:32:15 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	fabrice.gasnier@foss.st.com,
	alexandre.torgue@foss.st.com,
	marex@nabladev.com,
	changhuang.liang@starfivetech.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] clk: tc9564: introduce a clock and reset driver
Date: Fri, 20 Nov 2026 12:32:09 -0600
Message-ID: <20261120183212.1264522-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This code has gone around and around in various forms, having been
included most recently in a series that also added a system controller
driver.  That system controller has now been removed.

This series introduces a devicetree binding and single driver to support
the clock and reset components present within the Toshiba TC9564 chip.

The Toshiba TC9564 is an SoC that attaches to a host system via PCIe.
It includes a PCIe switch with three downstream ports.  To one of
these ports an embedded PCIe endpoint is attached, and that implements
two PCI functions.  BAR 4 for both PCI functions provides access to
registers controlling blocks within the SoC, including the clock and
resets controllers supported by this series.

To avoid any confusion I'm only going to refer back to the "syscon"
series", which provides some additional information including links
to earlier versions of this code.

					-Alex

The previous version of this code was included in this series:
  https://lore.kernel.org/all/20261104004332.2141282-1-elder@riscstar.com/

Between that series (v1) and this one (v2):
  - There is no more syscon, so its devicetree binding and driver have
    been dropped
  - The clock and reset components now have a single devicetree binding
  - We no longer use a syscon-generated regmap for accessing the common
    range of memory used by multiple drivers; specific sub-ranges are
    instead mapped
  - The clock and reset drivers have been combined into a single driver
    located under drivers/clk
  - The config option for the driver includes COMPILE_TEST, as requested
    (last month) by Jerome Brunet
  - The help text for the config option is simplified, first suggested
    by Philipp Zabel
  - The driver now names clocks using dev_name() rather than trying to
    hand-code a unique name into a fixed-size name array (also suggested
    by Jerome)
  - Certain functions now always return 0, which simplifies callers
    so they can simply return what the called function returns
  - As suggested by sashiko, a counted-by field in a flex array is now
    assigned explicitly

Alex Elder (2):
  dt-bindings: toshiba: introduce toshiba,tc9564-clock.yaml
  clk: toshiba: introduce a TC9564 clock/reset driver

 .../bindings/clock/toshiba,tc9564-clock.yaml  |  73 +++
 MAINTAINERS                                   |   9 +
 drivers/clk/Kconfig                           |   8 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-tc9564.c                      | 501 ++++++++++++++++++
 include/dt-bindings/clock/toshiba,tc9564.h    |  50 ++
 6 files changed, 642 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
 create mode 100644 drivers/clk/clk-tc9564.c
 create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h


base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
-- 
2.53.0

