Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB29D3B4E87
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 11:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314132; cv=none; b=KbxOBmVqFjxbazVWpD0ZMWTiZRj7P+KyyilduWqUKOSxfJ+lJgLna7VJhzpS2vSDRlMlxu++F5+ZvFZazYw1pMG+EsReBNetv86pv2f4pPb89vFBiLgzQoaQ+yS0BtjqlhtUrz7V5SxgS7C9RlphFZ9StOlxynCfCdtm9olXnFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314132; c=relaxed/simple;
	bh=aTkPxw+J7/3gRB4+9UctDG1XFql7JDHR21f3DKrFIJw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hT54TknYi51CtXREIzkK+DENHUC79RiXTMx8f9/i3atNpN3L+gNvLEj9ddJE8NJeIAIyw1EiKd6g0T5AGzG59PxkH+rziTXo+gQcwb5OrDUTrCK1mntM4wndEbGUNQGLt9Hh/PwTdgag0SY5wbRkF72zismgI4e1BT2+A2g32GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1oBGjqD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1oBGjqD"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so10016235e9.2
        for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 04:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773314128; x=1773918928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PBB3mUhKGZhPxp8Diu7McKVo3HGBpoZ0FDv0/vNJNvY=;
        b=c1oBGjqDzegFrluAH43TRq89cG83Ronok4NtOswl47fe+jxtawaityWCKX9B8cnfu/
         ZQIZ/w+fsAzB+x1TAqUE+mAPYK2mtr45DQqiJ2aDZBGAZICOPsU5YJ2tGASnT9iCGAq2
         s1JTFLPDaVKB8aEFoJkFB8hal8oMGhr3MNpl3bDJfafqDZwpwQMR2MJuRVUkkc29j1RZ
         PNnGPRg3eiW57OvtwLN0b9GZ/QdlsLOlU9egv215GeRG8Ie35gtGTWs0WmPA5iQSSNkX
         t3pg4XrAJKtaXkUoAm3qd46ym+I+twL8Wb4LiV5Mug6i3WjOiKEpg/s/OOKdVnWz2zDt
         YrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773314128; x=1773918928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBB3mUhKGZhPxp8Diu7McKVo3HGBpoZ0FDv0/vNJNvY=;
        b=BJxibc0ALyXxKmmnjAqYSGJ7h2puyUAEp5kEKnSJgsIghVV/afAxM5r7AXAfHbvBkD
         11rnPj6vFTJDJ+SEbA6V+BH4ee/0JTQhHsFV113Zvh9Suox4i2Xry6ll0VDuIbxJBpHH
         va9MUaeXXpbUquKL19OZ4OJxg0F5cf/h6+JhX0uf5rdJrbpKKa6MOPdiPwbTW9S0pHGG
         jCzteFynd5T0evna+gGQ8AoPWc63Q6C1QNZzczjbvGKEntMeTQgFbQsaHmNGS1l1DNgC
         Nq4ueMWmPcWskS+mkbhyM9yjyp6SqAwPHLVUIPQM6hyQFjTr00zIo6YJxwSFDZz72fVl
         KnWA==
X-Forwarded-Encrypted: i=1; AJvYcCX/vzbbZLzVWn/mXXiSdAWBHWn+/JXbmOikQ+sOwnw6MMSm57qI9BpbdlCgBWsWf+TqUvdXTNtg0LA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGbJoJ81td6udt1MEAhKl2CMckKyzqOg9wOBO1Zg5sczaSLSl7
	0XuxQryGcjokulr0w8cw/q51eLUYjJB+G0ewB3xgY7Pb2ZhKDxUIUNqM
X-Gm-Gg: ATEYQzwolGlXJg4gMciLpS5vuv5/thi4zbFUjlH7BU27L/SYwGdTMItFXmoCSWKTbV/
	GZ+1ckC2pP/Nxf6FSXz6sX0/Z2qF3OXu2Wq/o1YWg8DzF5HRjXyIzuwxdv/XJ2sLruRyqp+mqHl
	mgI3gBKV4C+1u4XYqCvMEu3jYioIYUji9yNBWq7U8BPpE2+d3XKmWKe4X7qOQJYz3rTK6Tv17H9
	cc/qe64DVn3hN4/5NyuVxCOzBZphFhV7Rw2sjfsr02ENRMnCvMIo+v3nxU5l6BbYmAcxTQPmmU/
	z+LWeKdfKjfmiKWcahjrpnTvi5YRErDuQpQ5uFaIUqsTQ72Ulj5ciE4V6dyiOVm08XA7f8LkxVW
	PYND6VqS9sruga+aqN4KhgQG4GpOg18wfrhG9HM8EJ6ZFBAAkwdy0XIlWitqA84qPDgk8/1xcPH
	W2eUqj16Amh/8LIgiCtJS4bOMTFRrpge0Md8OYo8mEPRf24s6FjuOawsAWgpjaIn3dNTeGM24RN
	vctV2Nl8oU2vOy6NU5ogT/0hd/l3DqUY2T3qw==
X-Received: by 2002:a05:600c:1d12:b0:477:a54a:acba with SMTP id 5b1f17b1804b1-4854b12ce3amr109216865e9.17.1773314127930;
        Thu, 12 Mar 2026 04:15:27 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:fc52:7d64:32f4:e21e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f708sm311458385e9.11.2026.03.12.04.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 04:15:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Add PCIe clocks and reset for R9A09G056 and R9A09G057 SoCs
Date: Thu, 12 Mar 2026 11:15:19 +0000
Message-ID: <20260312111521.115392-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds the necessary PCIe clocks and reset for the
R9A09G056 and R9A09G057 SoCs. This is essential for enabling PCIe
functionality on these platforms.

Note, there are checkpatch warnings about `Alignment should match
open parenthesis` in the `DEF_MOD` and `DEF_RST` macros. These are
intentional to maintain readability and consistency with existing
code style in the driver.

Cheers,
Prabhakar

Lad Prabhakar (2):
  clk: renesas: r9a09g056: Add PCIe clocks and reset
  clk: renesas: r9a09g057: Add PCIe clocks and reset

 drivers/clk/renesas/r9a09g056-cpg.c | 5 +++++
 drivers/clk/renesas/r9a09g057-cpg.c | 5 +++++
 2 files changed, 10 insertions(+)

-- 
2.53.0

