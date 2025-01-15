Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054308493;
	Wed, 15 Jan 2025 01:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736904401; cv=none; b=BN60JayRT5mKsKkYVH/AWgVVxNUDNgHC0oPW1Dsf5JcikXdD7MeRoRva8U9izORk+SjE2OlIEp9X/Zih+Bm3tcjrty29MFktmTOq+JeCl9befOtggKUUgGuc0iUg9+d0npbgX4kMQXFbWU6zF5zOfrAXzBjtoqoWWq7QvrpegMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736904401; c=relaxed/simple;
	bh=IFtlo0+ZAvHJKhbaxfhDoG298UPSqKuepFwWHNIbYUo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rqUZsX8zhDLl2pZDQKS2bDR+xFk2D5CRfZrlTECLH5GFBJTAdLUEIhTJwnIGh3j+Ra58BT0XLT/vCPNFcYP67QGu6+9fyx1s186Sv7OICVJnNL+MluSIZ06LY3b9nerKGkLWPsCXuiipHfKRhWuQkiIhkyFfMnsPBYxjDHBVe+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkaxjCb2; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkaxjCb2"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-46788c32a69so76037631cf.2;
        Tue, 14 Jan 2025 17:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736904399; x=1737509199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zxKAeTboBvObYWkDQ0AR6zNtcZLXj4I4J7ZDM4Fl16Q=;
        b=FkaxjCb2wOlp8KPBYTCCXFGnkgYNyFrt3KveYB7KhP3UaUFFcdakPEeNqGb2XjT7c9
         i4h6E29ctSUyezeCScC74ZOfi6tQzDKvuHj7eQ3FPf/LgpEJWFr0v/za3BM/ywlXatkQ
         C06sn1TwBWOXBKxk9hVU79tMawW/0eCIsNann1QGIJUlzS+6SDJ2upxg1Csbe/PVJFf9
         o0sK2jNC7CIeMPEObsuSbBLot2nVL/6W+JMWaGYHT5lwu7B2cl4sP8pADtIU+bL+PbNJ
         WnBXYOKKUK2MZu2VvoM5GD6gZYzk5nHweNEdtBcAFBTAAjFuFwvxdyLtCtI5hKXiu8pw
         6YfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736904399; x=1737509199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zxKAeTboBvObYWkDQ0AR6zNtcZLXj4I4J7ZDM4Fl16Q=;
        b=hEsomBJAAfK12ouL9KkXbYwN6B2djqKsnbjqouA1dyx8tY1Ha1VTEm6CBFHMl4F9IZ
         mErugMtQrZkADzBNxHn/Fn+DezoveV9hFRqblFjr1Rnumj4GrWhbiT48xjPOX8bMmmPr
         sKqBdxcZftQjbplJSmVvb/VidWVP3Vuyqk/steqbaE45bLf9Taka2VmRPG4K6HAsrJy2
         +umIPjKxEnhflW48NxPWqijfjKS8cmW8DhzmeZfTeIgQMlimxkhIxfzQpqZ3Yzve1wxb
         DRwWzkcZbnPaPW14SL2LnUa2cA4ckToZCm25nVx67vQBwd0cWW03S0HgKSNqhxM7QoSH
         8QWw==
X-Forwarded-Encrypted: i=1; AJvYcCVxZWgv5Pkfuhr2jxMfwhS0iR/4geIlJo/0JMW4yGDHJ54Jq/sMDsTNNvqO3sfuPyxnVV4NVCXsGMGo@vger.kernel.org, AJvYcCWWOR8g4ND5wWutprp9l3LGfu+ZPt0IPL1qh1m4Iv2D1OyKURYvDGhgU33jSMITMxP6eNVl881raUp0@vger.kernel.org, AJvYcCWyqNmVay0cHu/buoTr0+8sBgptoA9al+bQjdx/vO0wawGzgn46UWhHEn7a8aTmKaVeV7PTspWuZh9xe/LX@vger.kernel.org
X-Gm-Message-State: AOJu0YzQCZD+9EQCi6zPFJlLX9ClRRzZoclw30wkXqC9dt+kmKTHP1+o
	c6zx5Ufgtq9BKjmZaEvCK5Nu42sYg2JJX6TOqkOJOJa7uETTooh7
X-Gm-Gg: ASbGncs5kh5C7PD31ni2rj6iR6Z2RVBIh/myFi/Jz72zp3ZQ3c9q9CfNjclxCqZnfVu
	21xzuxOBQeN6v2p7Kz1oJF3mHOTNVxRPJjkkIrCUslgVGowpvJCIVjT58pJ/Rvc4l6iU7nFE8Uq
	0HyQycvYEN9DqSIPZvUbt+0ZIMlPKQmx+/Sg1twW/Bh3chR3bcKPZPQDhbEH8YCD4pot6jh9yrD
	UKjVAnEyLuJqUzUnp9MYuN+1UjNo9/4kTWoYh/FOB3vUdTgUy19dnOCpl0mSuV5CbY9
X-Google-Smtp-Source: AGHT+IHkjY+lSGkYzydQLdwGyg5cAMqfVAt8/A/Vokcc+X5oQZqhnf93yNQ9PAJuXC0Ab72Srz1tdA==
X-Received: by 2002:a05:622a:34c:b0:466:8c53:7758 with SMTP id d75a77b69052e-46c70fd31b0mr421291791cf.5.1736904398819;
        Tue, 14 Jan 2025 17:26:38 -0800 (PST)
Received: from master-x64.sparksnet ([204.111.227.95])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46c8733130dsm59933881cf.25.2025.01.14.17.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 17:26:37 -0800 (PST)
From: Peter Geis <pgwipeout@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: zyw@rock-chips.com,
	kever.yang@rock-chips.com,
	frank.wang@rock-chips.com,
	william.wu@rock-chips.com,
	wulf@rock-chips.com,
	linux-rockchip@lists.infradead.org,
	Peter Geis <pgwipeout@gmail.com>,
	Alex Bee <knaerzche@gmail.com>,
	Algea Cao <algea.cao@rock-chips.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Johan Jonker <jbx6244@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Trevor Woerner <twoerner@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Zhang Yubing <yubing.zhang@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [RFC PATCH v1 0/6] rockchip: add a functional usb3 phy driver for rk3328
Date: Wed, 15 Jan 2025 01:26:21 +0000
Message-Id: <20250115012628.1035928-1-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


This is my newly reworked phy driver for the rk3328 usb3 phy. It is
based loosely on my original version, but as of now almost nothing of
the original driver remains. The main fix here is the discovery of
BIT(6) in the interrupt enable grf register fixes the usb3 disconnection
detection (mostly). On occasion an unpopulated usb3 hub will take
several seconds to disconnect. However this means all of the hack around
work to reset the usb core manually is no longer required.

I did my best to document all registers I could find. A lot was taken
from emails between myself and Rockchip's engineers, much thanks to
William Wu <wulf@rock-chips.com> for their assistance here. The rest of
the config bits were taken from the rk3328 and rk3228h TRMs and the
downstream driver. Everything that I couldn't find a definition for is
prefixed UNK_ or UNKNOWN_. There's a lot of obviously used configuration
registers with the pipe interface that are also undocumented.

The only major bug I have so far is my AX88179 usb3 gigabit ethernet
adapter (Pluggable brand) crashes out when large amounts of data are
transmitted. I suspect this is related to the RX and TX tuning, as
leaving it at defaults makes things worse. As I am not a USB3 engineer
and I do not have the specialized knowledge and hardware to determine
what is going wrong, I am hoping the mailing list will have an answer
here.

Please test and review.

Very Respectfully,
Peter Geis



Peter Geis (6):
  clk: rockchip: fix wrong clk_ref_usb3otg parent for rk3328
  dt-bindings: phy: rockchip: add rk3328 usb3 phy
  phy: rockchip: add driver for rk3328 usb3 phy
  arm64: dts: rockchip: add rk3328 usb3 phy node
  arm64: dts: rockchip: enable the usb3 phy on rk3328-roc boards
  arm64: dts: rockchip: enable the usb3 phy on remaining rk3328 boards

 .../bindings/phy/rockchip,inno-usb3phy.yaml   | 166 ++++
 .../boot/dts/rockchip/rk3328-nanopi-r2.dtsi   |  12 +
 .../dts/rockchip/rk3328-orangepi-r1-plus.dtsi |  12 +
 arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi  |  12 +
 .../boot/dts/rockchip/rk3328-rock-pi-e.dts    |  12 +
 .../arm64/boot/dts/rockchip/rk3328-rock64.dts |  12 +
 arch/arm64/boot/dts/rockchip/rk3328.dtsi      |  39 +
 drivers/clk/rockchip/clk-rk3328.c             |   2 +-
 drivers/phy/rockchip/Kconfig                  |  10 +
 drivers/phy/rockchip/Makefile                 |   1 +
 drivers/phy/rockchip/phy-rockchip-inno-usb3.c | 869 ++++++++++++++++++
 11 files changed, 1146 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip,inno-usb3phy.yaml
 create mode 100644 drivers/phy/rockchip/phy-rockchip-inno-usb3.c

-- 
2.39.5

