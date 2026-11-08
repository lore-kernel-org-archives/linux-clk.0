Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794153495;
	b=m9x5kP+m3rRlZaxIl2QEFkaPSyO7x/Q3Em0+EDiCHGnXsvlbepcdbQOK+pP3xZBlhGKo
	 wFFjzQzKAYN89vRLvJYLC/ZYbxp9t+oKs27WQp7qE4lUKISEUNaVQ7HI7y0jA83R9yG91
	 SE2vixT63gXoWaXmSmApiYoRljaA+WuraykdoM+HiqX4eqdFSTsHcLPK/4YfDxCGyY3sY
	 iPsdufKxvjFPgHDJARfG79XEi+Wi+P8f8QMUGKx9WlUd4NotZCd5a3MgpBIO5Nn31J3P8
	 vFekLRon3eVC1bOqfMkhyv24/ECa1R871zLDkQURkVZxnN2PzUnyQBvo6GbSjb4mRtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794153495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z65ViVZ7QDcN9aUeeQCDhAMdMHiR8hItUu4lI1V7+r4=;
	b=HsE/rTW2WIolSkyX98qD9qLPZij2iGZVJqnMRvr0D99TkoKug13Jvv1iJa9G0YYgevXQ
	 woaLUVRGLMjFBouoXSJ1E902geSejftAfHL0bV9oVVF0fyJJpbrbvpSc3vhN+2haGMn3k
	 RwBKR6/DcXAHGSFkPBzcRKatiZooV8N/JXzh9Q5FhLVIKJPXavmuU2pFIJoRcfT37xdq8
	 4n3mQTnQUDwdDeu+WHVp0WH/T7BdcWOvu2nd4/jbZh/IraDyCnrPSJ2nMuU4CCWWrIs6o
	 ZqwGqk4s9q/d0+S6GgLVz0cQYTq6jETxAD4fgpq7oUVIr5iullhuHROzZnp0WoYopxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0zi2/68F";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47840606A320
	for <linux-clk@vger.kernel.org>; Sun,  8 Nov 2026 15:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47840606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0zi2/68F
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-492f563d1c6so25183f8f.3
        for <linux-clk@vger.kernel.org>; Sun, 08 Nov 2026 07:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794153493; x=1794758293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z65ViVZ7QDcN9aUeeQCDhAMdMHiR8hItUu4lI1V7+r4=;
        b=0zi2/68FnBZlkcVJrAG/c0gRwTiWBeRxILx9yNyrlpojMDY8igrViAUxTddq9gI+7Y
         8KqNcmYbo8kc/oI+DwBimU5x7R/vhFIqGCOAdxv4UTMEQMyYoPpewVCqifrFbeOMU5cf
         9olBo2JTQivIBw4n9UFIFIujhySNkPywO8c9ojjzwyoMq+Tn6RVbKvuy3SqK/GPKsclS
         iMjBvEW/uOr21oZqJpGSkYKQmWAOkBbc1FwyfRLM9k+50xFjrBHwy4xpIX/cG63Yluw2
         nY5WSN1lr7UW3LqOz8RhTYobJB3yFiEafiWmR1B4Kdahp42l7Yi0H8NW38EQlfil57Dw
         Q+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794153493; x=1794758293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z65ViVZ7QDcN9aUeeQCDhAMdMHiR8hItUu4lI1V7+r4=;
        b=0E6NiC0/dRJQaCmUsLOjz/9G4/Jj1CPQUfbX2hkfqBUCbiH180rKM4go/zDjlENemC
         7/nDOol7Rn3nRZHFIHduejLMQvPAgAwdVzwFXL45diwM9C39alPwU4Dht3t/td8g+OqD
         3TXDo5Zqassdr053zntZwS8tgUX6sK5PdiM8LTCA9M9uDivpVSdQaMDL0POhZ+J2UrMO
         a89vJs2Mj9+yAPysLs7LFhgcesbz2+32zn1web6LLTEqmW0c54TmOZGvD44VEfdDkSLn
         1JqzwV9TliGL58E0r2utsNuBKS1D6CygQEBgskibTS63r2+p2dalvyt9syDgyxC5dkZP
         nT1Q==
X-Forwarded-Encrypted: i=1; AL+hErHOfubporOs5+COIazg6ZkS9leIlmNAnAx/+4AkE6/04g4IxzjjrHS8Cr+xrdBfICiSMvOY/dfLOlI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+29aTor0SlnXpyQRZAB5v3lwWxqguUYW6luGHVyzwn+lXSxVl6
	3MATdEFJu3OBuJ2UNBjjEWnOVDOohCc7P8Gk5gbdEa+/BkmCTP5G356E
X-Gm-Gg: AYBFou0JxCw3FBj1jyOLC+XgblP/edhoy+5K1SkDBzsgkfecJOciu/5IbgY7RyJjauP
	l1nxaN+lNmSeKWpk0+0rsqVWzbtp7wK+/r/ezIEwZBH/aJAcouB2+5cQvXsDDuAn5cq8b6Baxaw
	SYeUdw+J7wO1iIOJmdGmTHz61rN8lv1jVdxbC1moF/NSPEt69IrvcZV95LtepaZBjHWQdo8375A
	YQQ7mVTiR8c5wubBTdJvlGpNi47HUlSRUOGaahNeVpolz6hTGQezLJH1qVjR1VGzN1BycIBKzK1
	jaOAlMl/lO3xvMjQjl29+l1YcwzVCROePwplt6qSqvf6alkqRuSw12Ty9XLPiJGl+jZByyV5qbc
	M422fH1kQrw3BpUX8SvxO8qXyTA4fulwMvwE1PPiTANtakExaqCWMOOdMGY/tixypEhECvzJfj/
	ZYPRzQna/dnnqJYAHUHBCjci2pzbZ+NT0FSHOQg/YpmGWXHF4Z30fGQFs0gZECESEuTQ+l2bj8r
	OcWRKcFAqETNuEadsiEW9fQqopnhkY9tcfPEFSVSr+7KZ2hBNt9dBneclsujz1qF5UyT3S3eLZk
	dMftaTe/zZWkfIYjuTdCJvOFWype0zJFb/WqECWQe3fCPblJPv1FWAHXItCLTQM95pH/UykpBKZ
	yeCxMjRHQDA==
X-Received: by 2002:a05:6000:2303:b0:491:ef0a:1f5d with SMTP id ffacd0b85a97d-4958530ca7amr4049074f8f.39.1794153492539;
        Sun, 08 Nov 2026 07:58:12 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495966f316esm4753282f8f.17.2026.11.08.07.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:58:12 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/3] clk: sunxi-ng: describe CCUs as tables, add the Allwinner B288
Date: Sun,  8 Nov 2026 15:56:58 +0000
Message-ID: <20261108155702.361022-1-pmazzini@gmail.com>
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

sunxi-ng drivers describe each clock as a static structure, list it
twice (ccu_clks and hw_clks) and keep a separate reset table. This adds
a table front end: a SoC lists its clocks once, indexed by their binding
clock ID, and the core builds the usual ccu_* clocks from that table.
Bus resets come from the gate entries, and clocks that a SoC generation
shares come from templates. Existing drivers and bindings are not
affected.

The first user is the B288. Its driver is 212 lines here, against 749
in the current style.

This replaces patches 01 and 02 of the B288 series v4:
https://lore.kernel.org/r/20261012100816.331033-1-pmazzini@gmail.com

Pablo Mazzini (3):
  dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
  clk: sunxi-ng: add a table front end
  clk: sunxi-ng: add Allwinner B288 CCU driver

 .../clock/allwinner,sun4i-a10-ccu.yaml        |   1 +
 drivers/clk/sunxi-ng/Kconfig                  |   5 +
 drivers/clk/sunxi-ng/Makefile                 |   2 +
 drivers/clk/sunxi-ng/ccu-sun8i-b288.c         | 212 ++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-b288.h         |  11 +
 drivers/clk/sunxi-ng/ccu_table.c              | 510 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_table.h              | 233 ++++++++
 include/dt-bindings/clock/sun8i-b288-ccu.h    |  82 +++
 include/dt-bindings/reset/sun8i-b288-ccu.h    |  45 ++
 9 files changed, 1101 insertions(+)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.h
 create mode 100644 drivers/clk/sunxi-ng/ccu_table.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_table.h
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.52.0

