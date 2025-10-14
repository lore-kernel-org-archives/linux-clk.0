Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EA52FB629
	for <linux-clk@vger.kernel.org>; Tue, 14 Oct 2025 10:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760439246; cv=none; b=pEoXhP3xrJrFxM3CVYHy9BThnV3FukhI3wPK6swiTFz9HxIqhoxqI7xhJRlbFx5vE6wImvC7kldoQ/I6YDdeWdD8LbTShASjK8+pzYWq7VfnDiImrBa8O63HDXIyd/v39ys2Bky9ahoNNzabq6b8F8Jnmmzs4NGOCrH7Z5vxgYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760439246; c=relaxed/simple;
	bh=Mr8tfZLBlB8aFgod6sfW7x6gPlPlXWbUdZCIVbKO4Es=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QnCdrDVWDNzKx8A3jFc6BWy7bOD8GrtcWxR9sXZMoS2rj8gg+ooRrCz/W4gcnuyWgSC4BmmTPQvAnVn4YWh4Aif9S8HIDg1N/KlxwdlZNtHnRjCNdWbXRu9ksWNP/uKS0f0EaVHhpvg4By/DvquBtLWXEKEO/jmpZptLw3kk5Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8IiQ3HP; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8IiQ3HP"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-781997d195aso3688752b3a.3
        for <linux-clk@vger.kernel.org>; Tue, 14 Oct 2025 03:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760439244; x=1761044044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JCcGuEZSgrij4aPzZeBxOmzwZd89EZQp1SLrIiFb3XQ=;
        b=Y8IiQ3HPqfjjAltwdpksk+eCEN5E5X+Pw5iGK5HtG5Vp/kFbruXuX13ckEwFr8ppPt
         5JI3EoclvQOis2eaRwMsrsXGcnyfVdQRtyY1hvEmzI6eLTNp3TzwHPOCehDj5Lac2z6N
         T0bZa0nT4g68RLttEKDdBbgXo6KFCUiSKTIpEqONiaI398l088N728hhCUvnThd/jiqf
         DE0ZmtrUW+TjNGmgYVOzXKXljuKxINEgxaBC4LHHnA+r/Olm42vesorlz9hqBLqwWfqC
         DlOsZWB+trXc6FCwNoYEc3nV81mi9nWIfdhbmIKDWdCT8mNv3lwFQsFfvoZhBoFMTKDr
         cRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760439244; x=1761044044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JCcGuEZSgrij4aPzZeBxOmzwZd89EZQp1SLrIiFb3XQ=;
        b=r3+hlTtXqYq+oyHHTx4iaSUhoc6Dmo8dARrE4aZ9x2FJTe0r3FU9It/0chyjIiHLdg
         65IzIpLrTzYFm5wLYl2gsN5BoyC4jXEoNKSj0If+2BkZVlg7U2S/I/5vf2q+1/wNP1Wb
         vT+tU+WR1Aa7KsTbUAgqfYTZEq2vd/TNIeMd3Et0l2kuKWV+sY0cpuTrYNElLB0W6Ctj
         qO1XM6fEZajaUARmMAn5/ww7G/Kq5YhaLdbsRFsAQNTRdtkLX8rKIEfsLi3LEg79epLA
         JY6VMfnVUA+cOPNxMrbgkHsPp/JDr6xsQ36xW7lQb+GL1dhFp+BnZTQ8myJ4p7YLgrNu
         83HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyKw0qxF7w3MgZvmGrrkaeqWMQhyxmf5Un3K9zox2jPZnYfocUysQTUGYVXNNxMfiilM60V+x6RkE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnESGDHs2lD5M4HKRHstxNryX9atdFalnzIA+qFKMtq2wL/4Ub
	jP4sNqskTU5svnDWcHCv5+hOUCyrQG3iZbb9vwGiTKjF/UiCP9U3Tn9j
X-Gm-Gg: ASbGncsTNKTJ2oJAxo+DlSNEW7zmClpxAhGvFmYR+HcHaWBzGoiPJdrIZG6/1/RsQHz
	B1yw5hfPSlAJ1wfRXkrO/Vc9SR316pFdyDIu+Z1hT7ydhuHS+iay1rZFXrlRvFvgrIs/l61qaHK
	Zw3Qvw371WOHtos8DlD0Jj5rW+W2k19IIu0ONd4MF4X1FW9b2UBmPDwj9kSAAU/2jxZhF98/3WL
	4m54yoKIwFxHpZnKmtXbUNn899IZJ8vWUUiIHwPwKawP/KO4uVgloOEsu/07YiorGW/lqfanqGB
	dG/xbfm7GEOMJE30xFdP9sorWdSr0g8wbnvvILQ8U4rBGVYXxj3ZAhXw76xbgubI3EHVRfjTv1y
	ohqbPc6wH5PYV0Er83KjUsjKdaShM/TEmUF+U3vfFgMZDuGI6mKEpqlC+I0+ZcrM+pBrqQYiDkQ
	==
X-Google-Smtp-Source: AGHT+IHul9FYXPgeY0MtOe+ORzdsrXCIGeWmnOQdSxYt0ZHodvYGCUDDVSFP9FvoFR1UMaj3nEkjBg==
X-Received: by 2002:a05:6a20:7351:b0:2ff:1132:8c48 with SMTP id adf61e73a8af0-32da8164167mr34514969637.24.1760439244522;
        Tue, 14 Oct 2025 03:54:04 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:6d70:9e09:769b:2b4f:71ef])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b060962sm14901724b3a.1.2025.10.14.03.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 03:54:03 -0700 (PDT)
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
Subject: [PATCH] clk: renesas: cpg-mssr: Add read-back and delay handling for RZ/T2H MSTP
Date: Tue, 14 Oct 2025 11:53:48 +0100
Message-ID: <20251014105348.93705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On the RZ/T2H SoC, a specific sequence is required when releasing a
module from the module stop state (i.e. when clearing the corresponding
bit in the MSTPCRm register to '0'). After writing to the MSTPCRm
register, a read-back of the same register must be performed, followed
by at least seven dummy reads of any register within the IP block that
is being released.

To avoid mapping device registers for this purpose, a short delay is
introduced after the read-back to ensure proper hardware stabilization
before the module becomes accessible.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Hi Geert,

I made use of the timed_read_poll_timeout_atomic() macro to print the
delay after the read operation. With first case I printed the value read
from the register and in the second case I just printed the number of
loops and time taken. So to be on the safe side I have added a udelay(10)
after the read operation. Please find below the output from both the cases.

#1 With value printed
[    1.468936] read_7times_init: poll OK after 0 loops 223 ticks, 10000 ns left of 10 us
[    1.477719] read_7times: read 0: ff002104
[    1.482358] read_7times_init: poll OK after 0 loops 126 ticks, 10000 ns left of 10 us
[    1.491331] read_7times: read 1: ff002104
[    1.495901] read_7times_init: poll OK after 0 loops 100 ticks, 10000 ns left of 10 us
[    1.504692] read_7times: read 2: ff002104
[    1.509261] read_7times_init: poll OK after 0 loops 103 ticks, 10000 ns left of 10 us
[    1.518052] read_7times: read 3: ff002104
[    1.522692] read_7times_init: poll OK after 0 loops 100 ticks, 10000 ns left of 10 us
[    1.531665] read_7times: read 4: ff002104
[    1.536209] read_7times_init: poll OK after 0 loops 102 ticks, 10000 ns left of 10 us
[    1.545183] read_7times: read 5: ff002104
[    1.549726] read_7times_init: poll OK after 0 loops 84 ticks, 10000 ns left of 10 us
[    1.558456] read_7times: read 6: ff002104

#2 Without values being printed
[    1.469581] read_7times_init: poll OK after 0 loops 255 ticks, 10000 ns left of 10 us
[    1.478668] read_7times_init: poll OK after 0 loops 130 ticks, 10000 ns left of 10 us
[    1.487650] read_7times_init: poll OK after 0 loops 101 ticks, 10000 ns left of 10 us
[    1.496527] read_7times_init: poll OK after 0 loops 99 ticks, 10000 ns left of 10 us
[    1.505231] read_7times_init: poll OK after 0 loops 96 ticks, 10000 ns left of 10 us
[    1.514109] read_7times_init: poll OK after 0 loops 97 ticks, 10000 ns left of 10 us
[    1.522883] read_7times_init: poll OK after 0 loops 99 ticks, 10000 ns left of 10 us

Cheers, Prabhakar
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index c9598fd1f8cd..4e9c1bcaf968 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -308,10 +308,21 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 
 	spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
 
-	if (!enable || priv->reg_layout == CLK_REG_LAYOUT_RZ_A ||
-	    priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H)
+	if (!enable || priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
 		return 0;
 
+	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H) {
+		/*
+		 * For the RZ/T2H case, it is necessary to perform a read-back after
+		 * accessing the MSTPCRm register and to dummy-read any register of
+		 * the IP at least seven times. Instead of memory-mapping the IP
+		 * register, we simply add a delay after the read operation.
+		 */
+		cpg_rzt2h_mstp_read(hw, priv->control_regs[reg]);
+		udelay(10);
+		return 0;
+	}
+
 	error = readl_poll_timeout_atomic(priv->pub.base0 + priv->status_regs[reg],
 					  value, !(value & bitmask), 0, 10);
 	if (error)
-- 
2.43.0

