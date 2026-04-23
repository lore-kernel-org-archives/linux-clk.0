Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A0C2F25F3
	for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 13:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776952259; cv=none; b=LD7GcAZPqs3/Of3ls3y4RT+mbA4LrIwnOvk3RjdhmUqM1J30IwhOsCANKA861Wdfaf45N3UWTCi8wms9yZknV4+WHg45d+XL4TJhARq0//fBdZcWzRwpPE2uNNMD7tLTW5SEsWE4VjOItEufk/rbKWgolTVpRbzLXhETfWGk37w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776952259; c=relaxed/simple;
	bh=LVv6C3wWXaLkV4DdI3hN/QdZVOBTFV5yN0je6Bf6Cjw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=su2W8KSktHoTMHyR1cMlu7llIrVJwLqYbF534oYKXoYvtwQ/+qFd5JAhI1LBWH/a0JSH541WxQDqSbQtdHFDllIzt9/Qrwu9WpXwuQxzajDM4USeZTGw7IHwW/ChY/DiHI20djXmlel4u+b/P5eonir8uZAWpEHXD450q+UkiEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=duh+HJaK; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="duh+HJaK"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4890098abbaso49607535e9.0
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 06:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776952255; x=1777557055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fbtbCkYzI4GEfR3Ru2SUnpymypehkZuVfFRi6unx5xg=;
        b=duh+HJaKEfodB7+DybIEYQvR72WqJ+RAQXSirMIT1r0L1TasP5RxU1RtQyJvxs0g+c
         DYILagZ/1i8BGsMArC7737FgxIytAIhakq/wa9WlvNyTntW8+7qYgQ0fOe/pdFlUv8Ok
         vSMuUMNru0SZ1Czs+aQ3L0j1PU2rF4hpXfe+QQAufkH6rXOVAkjMc3GU5a45WXRf2/27
         kwmb52t+uYTa9YwCirfIQN9GdqWlceS1VQS3Y2cN2D1RrPOuhXGvmt0MDLxcK+CXaqjx
         seV4JgosHAK63yfPRxjOyWKaCLSZHeXg3SwwOKKsoPwX0fmmwXSxh93duZWK1M3+LDdq
         U2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776952255; x=1777557055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbtbCkYzI4GEfR3Ru2SUnpymypehkZuVfFRi6unx5xg=;
        b=C08RXWFlDVF8/YrsGZSVMRmZtDToPQLLM+7RwUwH8J92lFriWMoK+n8TrnAK1CXBoM
         DzErNKA+afz5fflskC/ZVAzDC84qXrq3ou0jA9QT3veTzFTJK3UDm57b+U2CtS6XPMmi
         odvsatSBenR6dZclKU3E7G1HCZ8ADyfgtd1YjWjNqoB6/0h4b+hBX5/esZPvs12av5WY
         vuU0bawUXYAp7qJHGaIi9KLdhshu1/jPjc3OWtZUXVyoVX41GA/3JWFCqG6Q2QQwXZpV
         7a6Nh6xfX1TYgYAWhNZ9gr/0SM1fYL4ud4d1r/mkainv2gClVVL2tXAz5NVvHq4pI+xx
         QFOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OTix2qSbeCzBAhXTEJ9DA/qeQQPfKlv5B+ATsomNp8Wj/WW25Mj+fuUEMYIirR6fS58zgyLKd9BM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgFirrmYbAwBEQLnQDJjmRfAUQ3XllVvO0SyhFna2apFrK4Xc1
	OPXtxoYSHsp7T3gr69AoELgShv0LtGvicjH9AMA5sZ+G+WyTLQme6IVU
X-Gm-Gg: AeBDieu+w4q8a+b13kh9Zs+nQ7ekbofvlobUoAoZTfuXDMxAx9SjtjWsD1tNJqZ/WdX
	ejVNE6uCsn1zGI+hNDvA5mJ3vVFBGdWIoErdJelg6OSDRNtrwNLLUfrxNDhN3k0sMt6MjnVYyfo
	QFAENOv9xWKqHy2swcvlVawYBxC4ePkC1TOU9J/gZpdgZREubhSa++SI1k8BbuNXWalRB2eS00J
	wTdltratErXv81ci2ZdsgwoqIRa9UL8ANUFQcmnpteEwRCg87gNK7V5Jr++B9Lpfl4rn6jUaype
	qZa/KjPvvQZGUPNRezD/HNKsPpEbkdEFHIyziLW3BvWdJuqgQngo2zTym5iy/ochH0ITaxzZoA9
	jfFntgFT754sMWybD+eOxmTxUTfrTTUkzMghvrlStQlTXvxF97n6T2SbmAC4fO4Qxr7vcDWd/0a
	Nt1D8uyyyly1N4kotBJuAA+yzzljSLKTzPohTCZo1BM574od7Vx4M/uty8ps8=
X-Received: by 2002:a05:600c:444a:b0:487:1520:d107 with SMTP id 5b1f17b1804b1-488fb793580mr362776015e9.31.1776952254428;
        Thu, 23 Apr 2026 06:50:54 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:c2c5:eec8:9509:382e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a52583fe7sm228134335e9.13.2026.04.23.06.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:50:54 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v6 0/3] Add support for Renesas RZ/G3L GBETH clocks
Date: Thu, 23 Apr 2026 14:50:44 +0100
Message-ID: <20260423135050.238400-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for Renesas RZ/G3L GBETH clocks and  reset signals.

v5->v6:
 * Dropped patch#1 from series as it is accepted for 7.2.
 * Fixed the typo in comment stanby->standby.
 * Updated parent of ETHRM{0,1} clocks to CLK_SEL_ETH{0,1}_RM
 * Fixed various DEF_COUPLED macro alignment issues by splitting it into 3
   lines.
 * Collected the tags.
v4->v5:
 * Rebased to boot series [2]
v3->v4:
 * Updated commit description
 * Fixed mstop bit for eth1_clk_chi and eth0_{tx,rx}_i_rmii clocks
 * Added r9a08g046_no_pm_mod_clks to avoid PM framework enabling both
   rgmii and rmii clocks together as they are mutually exclusive.
 * Fixed checkpatch warning for more than 100 columns
v2->v3:
 * Added eth{0,1}_{tx,rx}_i_rmii clocks.
 * Collected tag for patch#1
v1->v2:
 * Separated ethernet patches from series [1]

[1] https://lore.kernel.org/all/20260128125850.425264-1-biju.das.jz@bp.renesas.com/

Biju Das (3):
  clk: renesas: rzg2l: Add support for enabling PLLs
  clk: renesas: r8a08g046: Add support for PLL6 clk
  clk: renesas: r9a08g046: Add clock and reset signals for the GBETH IPs

 drivers/clk/renesas/r9a08g046-cpg.c | 157 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.c     |  67 ++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h     |  10 ++
 3 files changed, 234 insertions(+)

-- 
2.43.0

