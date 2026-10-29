Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299073;
	b=Nid3Be9T8MDdojTbPwLoXZVOe0p5cewh4XNrYI0qM/SboAgS+Z2Lkd3UoMddwJAUsbVu
	 qaYaQn7OrUr6gzX/OeSQnE1F7+mXgXhcSeAjPJLvsBBzTrczRxGFPDopTNliSl79Si3fj
	 C+rvNS4M+bsQ/f655UWL9vgDsOUTiSlQsT+j7bYQZDKfL3dN+q7PIGkoUOK+VMTPpJe/W
	 iBFIIKqLXoNQenhQWPxu4CCeot/ButAuYDu3rC86+f0scSfIVFw0cd5x6zZvEFcaivyEC
	 xEA43fvFCZkQPwWc0e4NktKwjIentKh/+y2IAyB5pzt8nYp18+kYdpMek78SWNRU8ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=nVY7nEkvfjZeMrMmcTQRnsGrPkGC9OILvfF4knw9Fgs=;
	b=aPTo0TqSfmsRRuBxKY4Wh4D98wHZ6lyBh10DAHAPDFDGddgjOFHDjc6AzHpYVLYe1hoD
	 zKEmrLbdAmdzr0hTeTyTGhKzUFNsqjXG4BGqe+IpR1gV36eyGHmaiRKwTVvEKaGvanvSV
	 9G3bWcKf0VAIffeMp4CuwCbV3gNv4jJVbRxTa2sIIGYA9MyqIjOQULVt6fle0ijZ1ySbb
	 htDnQA/FqauWLWWYzbJy+P0Wms8KBABZpKU/iBhDu7uuUUpr9r+HJ62yXuvL7u9LyWQ4a
	 csglKd61uKH0nRzu3F/pKV5PTU/Qe3gUzarM5Bg+LKz69KKG+0mBnNJNcQQXSJOBsgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="Mw9/QQHv";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133AB606A31C
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 18:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 133AB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Mw9/QQHv
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a215e64962so26949125e9.1
        for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 11:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793299070; x=1793903870; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nVY7nEkvfjZeMrMmcTQRnsGrPkGC9OILvfF4knw9Fgs=;
        b=Mw9/QQHv9O7c6ltEiNuMsAIVLhsexhHLIr/T/pVhQ8PFhP3aKhOf3KQ3ed1qXYCLaR
         Xo5QDlBW+Idi1EMurjmtCQ12v1gTgoId/O386K7S+LIEps94LDkdxx0KfdkagbO+T1sk
         lrTu41xj/S6sA3+cecp1QZHjUI8Azyig3I4ON25gzW6rH9cVsCMllMQqjBd9PTphjMPL
         +yYtkVUZ9sAvfkKzwenh3SyDO4MISUrqAtdPa8NBdRpS+Cg+GhgGtYHBgvk6gukldHhq
         uM+ZwuTrncWe7vnvY6Znc/OqibE0rSl5WGmi14kEnrS72paNDFsC8VoBObuUB3wwlLks
         wPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299070; x=1793903870;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nVY7nEkvfjZeMrMmcTQRnsGrPkGC9OILvfF4knw9Fgs=;
        b=wVmNsbgFfcQ6i1oNqamDCNf2d71xBtmiS2VZDugh6a1CA1R9MwfWeeW0jcvrM3bkLw
         kE2H2wtmFMw90hnNVbuvjDdKPbBwl5gdbXgtJzZYx3ZVl2p3DvldBS2JK6jzmD2AbJXL
         iwZfG526SVenqm6KekZaDLi0Zus+NaGN3LO31BcduPsDj+l1FaELyKzLieqEQs3rvR32
         abNPxqCdEHzQxOuE/L0G+L7ZiAeBlfLle/jjaKwjdYJA1iWx/52bK2m8P8T3Ypjy6WuU
         WljDH5DtxSWz+t4lhdCZRx4Udg1b8CDtou4IhWMxGokML8LiPSs1jUs0ix5sCRfQU0Bo
         03nQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFZxygz4Y9FQ/AqsoJaaNmsv/HXr0xQ7rcdUqHoHW5aVoE9la0g3HGYQiHMfA3BFW34tkHuXBmw1I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDRV0yezsbWmRO7kBhpw8lB75tmUwQ6ZoidhrYIaN7byJG3JSF
	oXldUChPZ1otmxPIPTd5Ck3O/fSOlJdRK8+COUNXiYqJMD5wTTXp/rB0TudgsELcMlw=
X-Gm-Gg: AYBFou3c/TTVzPJvM0yabB9irjC1lGkBQARAVCR9IR0tcF756vF1oK0NvTS5KEHeGMU
	lLJgWeBqAJ2dkVlcJvBHBH4itg+/qPN1P9iSdrFK7aXQNJlndDd0IrDvsR5NQmeVEgRb//iqG3T
	KJ+TLkFDiyw27Xv1P2I9hDBiM8xrOXp8yr9OoihREO5MRDlUA+YdV1GU1kPJuX2wCc1OGF/123z
	m8061Hpy2AHzIg8qw0qORZxKT6pSAbo+wb4D79jjb2eTZSL6wdeZOX+ssu3uU3nfr9chZ5VG255
	AA1LL4oXXU7VGmc9UBDUTSXz/KmvL8tddIOFB7OODZcZhniGeup2hFVSE5u4hOxUKfxPxOHFd3r
	9pHAVvtpR5NVlTCNbhL5SeGsso7HXJpEDsKXuYMccYoVVg/8ztdSZx5WYts04pp4Zg0lQ0SidiS
	NNjAAn8OIwXf88XZgUSDdsWGyVvDVSL1XR2RLIhVBBKFlaJEd1qe9Fgos0jsmMsE7qMmGhOP27W
	2uXDMEcIZ52YlRdRYapS2b8IQZZYjl05Qy3wpFaeoA9IXgNuo5tAdu42qvMdOSOVhU1ulAGkban
	eV8aFXBddC0g83lytkm3s22OB0UozLnAMCT6PeMB+rkhgMziGKHl3DN086IRoE/MpbEwTCDFkvl
	qyXVlQQTA2vKNsTq+NA==
X-Received: by 2002:a05:600c:840e:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4a965dd3274mr155468995e9.11.1793299070403;
        Thu, 29 Oct 2026 11:37:50 -0700 (PDT)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa820492cesm90118305e9.13.2026.10.29.11.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:37:49 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH v2 0/3] Fix the ENCP clock select field on GXBB, G12A and
 S4
Date: Thu, 29 Oct 2026 19:37:33 +0100
Message-Id: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NSw6CMBQAr0K69pm2GCGuvIdh0ZZXecqn6StEQ
 ri7gBdwOclkZhGMkZDFLVtExImYhn4DfcqEa0z/RKB6Y6GlviqpNYyBU0TTgWvfgL0LwNgCN+Q
 T+BoL43JbOizEVggRPX2O+qP6MY/2hS7tyd1oiNMQ52M/qd377zQpkOCVVaikyevycrdmbslGP
 LuhE9W6rl9nsblj2wAAAA==
X-Change-ID: 20261022-upstream-clk-encp-sel-shift-fde7ac3b8ce7
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>, Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.16.0

The GXBB, G12A and S4 clock drivers place the ENCP clock select at
VID_CLK_DIV[23:20] instead of [27:24]. Fix it in the three drivers.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Changes in v2:
- Reword the S4 commit message and the cover letter: S4 has no ENCT
  encoder (Chuan, Jerome)
- Add Chuan's Reviewed-by to the S4 patch
- Link to v1: https://patch.msgid.link/20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com

---
Carlo Caione (3):
      clk: meson: gxbb: fix ENCP clock selection
      clk: meson: g12a: fix ENCP clock selection
      clk: meson: s4: fix ENCP clock selection

 drivers/clk/meson/g12a.c           | 2 +-
 drivers/clk/meson/gxbb.c           | 2 +-
 drivers/clk/meson/s4-peripherals.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261022-upstream-clk-encp-sel-shift-fde7ac3b8ce7

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

