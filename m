Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41A04A33FA
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 15:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263939; cv=none; b=dPNVd50nN3sMGvE3n3mAuyC3RfbFk5CP3DnzESDyd65QmFYDYYFDGgYqCB61pkKYPZys46fjtc1y9ptwolbGcROdij3rVQa848qdNhOrh37DjamL/WMfPHdpzBXKRfi4Bl1M/TjEEybCS5qi5nXKxe2TAyMVw0RfIBIrZCkffEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263939; c=relaxed/simple;
	bh=HUaeZlhO61JgbXjOA8WN1ozig6mqvIPFhhyVRtlOL+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=N3Z2fg6nhAiopTBLIyY88RWkyuhWmSD5JwHwUWgWrU3EXdcHrSmbHVgkB1nGPx/fUR5UbjJaxFmOO7WudEK7ONaMY6OoJXMuudoklbeTYMWhWPY6L7ZAIQe65N+poqK6aVH4Xq+lduomEbVfe1ulc1Rnhr9Ol0t4ggKWDXBiQbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=ZvdHd5K+; arc=none smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="ZvdHd5K+"
Received: by mail-yx2-f41.google.com with SMTP id 956f58d0204a3-67408b109e3so7606d50.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 08:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1790263936; x=1790868736; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=le41I7oDew/uulFg5A4QwL0jscocCjtan7pOx9jg2ZE=;
        b=ZvdHd5K+XcbK7vk1Oc6RfXijzoL4XtIMicto/D9EqwtGfmgMRCKuuTEon9AU2aFO8s
         g3kdKVNQO33revkK4SY+yto5jDdFp2R1gEXVtdpaDVInK5h08aU71GcLAu00zSqxGEgM
         rXEJhEpC383ROpif/UAnmau3UeZa6lm6gnJGU3fMTsckgo4ys/uhYDW0ogXN+t/WTM1L
         tPUNE3IPZYQ7iEfeylHOq+62G1hUS0m1HH4TsQkAdcyWMuBvHZ6UyTdc9mpg9dSr+pBD
         WS3kPctwWWXqieA4aUR3dNZVMB5G6woN66+t9Y4mCrsVRTVLgK1twvMenvaKrJHK/oyD
         lJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263936; x=1790868736;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=le41I7oDew/uulFg5A4QwL0jscocCjtan7pOx9jg2ZE=;
        b=Zi5nJNkcDs06xHLrac9OpKnnTm+VoubWzw689ZQ8m3T/yKjM62EmfbKJebm6qs0tbn
         HSFy/FzGzaOcD0Xe2NtZJkHpJd0QkxBBmu8o7axeJXPcYfgLaNgns9om/T0estJJFQoC
         SKWLulmF1NUhcRzAKmUWOAUgcELrnVhEgiCcoinUbm73I1njqodr7Enol5gufPrSv5xQ
         wW83VEJmJNeKNp2fFVdVYWpu7e4l3J6xzaMXzseo1qEco/6bihHiXGJM4b8U3rYHWcZE
         utPfhvElh1qPDY7IGLLeux4Z+1mN31UyDODYRq384POkZozAhtK87ZmDyKkMZqVrCzxj
         PdUw==
X-Forwarded-Encrypted: i=1; AKwUvBw2E7JGZw+M10Sfwz59MrryOk63eYKadqJki4qzmN1lwRe92YtK9GfrKSmRE9KeUH/SYFsZaoYdxcs=@vger.kernel.org
X-Gm-Message-State: AFuF++n68Uju/N0+AbfDhM9HmkMGegcOJdIvWYciqAcGgozepPVWS0bJ
	5cDerK/hz1C1YCYwrW2a7Y2bqkS1RiPwWNKLPxPlbc+wyFP5qMERRByaDLN9SzMZicNyCe1rKla
	oQYlTOVo=
X-Gm-Gg: AYBFou01xOH+G9Ve1LhKJyIPYhewKKISUHaKrWulwZqydUKzKRmpT8ZQHLAxUrHdwKi
	DtQHbUZvbz6H271cgnDfJiNINv3YcwDYlKXKlFD5RIp6ASgmNF6X6GJbK1HHZa4nbZrzte7I5y4
	EsOQ52HPVZCkv2orvLg6n8lEMtkWSw4x6eYqhtlKT5kucqtev9a4143aCfKKGNFbB9iQdhdlgYX
	f7DSfeNJ6ul/r9ySRl7UDYKtlo2iMcnor7VISM0B0yVWAGlHOv243pN5KE0IC2UpeOJN+uFAoAt
	i2U1FmnKW+aij3H3rkejwa/oRhNTiXxp+/HqSXRBkNrtfotQigga+SQuCX2j4vqX+jBtCwu01w3
	UvT7aMOoDLhkn6IKDjRscviy0mbBCqJe5oZWbNxFEN2o/5J1Tq0NhX3h66WuL08NMc4az/WS/q6
	rI4MVoDB9bzljJoT7Z696SDRA0ENsQ7lbUPdq5UiFrv9rnJaSsaoH457hqvyV65/gxqG6UOOj3U
	zqC/Agd96fdiTLK9dj2enS4mpHS75ohIjus/ZlXik2lqFki8LQuvuC2TuE=
X-Received: by 2002:a05:690e:4081:b0:66f:bfd2:6b80 with SMTP id 956f58d0204a3-672ed243db0mr1760528d50.4.1790263935531;
        Thu, 24 Sep 2026 08:32:15 -0700 (PDT)
Received: from [10.200.24.109] ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-672d8099876sm2083828d50.9.2026.09.24.08.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:32:14 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 24 Sep 2026 10:31:51 -0500
Subject: [PATCH] clk: tenstorrent: Fix refcount leak on shared gate clk
 enable failure
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-atlantis_gate_shared_enable_fix-v1-1-303f925b8a3d@oss.tenstorrent.com>
X-B4-Tracking: v=1; b=H4sIAGZCtWoC/yWNQQrCMBBFr1JmbSDGUtSriIRJ8m1HSpRMFKH07
 o26+Iv3F+8tpCgCpXO3UMFbVB65wX7XUZw4jzCSGpOzbrAn1xuuM+cq6keu8DpxQfLIHGb4m3x
 MPCbbFoYDJ2qWZ0G7f4XL9c/6CnfE+tXSum7ihQg2gwAAAA==
X-Change-ID: 20260924-atlantis_gate_shared_enable_fix-c8d0c8db63ad
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Drew Fustini <fustini@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
X-Mailer: b4 0.15.1

atlantis_clk_gate_shared_enable() increments the refcount for the number
of clks requesting the shared gate clk to be enabled always. It should
only do this when the enable for the gate took effect in hardware. It's
possible to end up in a situation where the gate enable failed, but the
refcount is incremented anyway, so subsequent requests by other clks
that share the same refcount get ignored and the gate enable is never
retried.

Update this function so that the refcount is not incremented when the
gate clk enable fails in hardware.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/AS8P251MB00013BD9A093C06D2D60E10EC8B42%40AS8P251MB0001.EURP251.PROD.OUTLOOK.COM
Fixes: 23c8ebc95284 ("clk: tenstorrent: Add Atlantis clock controller driver")
Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 drivers/clk/tenstorrent/atlantis-prcm.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/tenstorrent/atlantis-prcm.c b/drivers/clk/tenstorrent/atlantis-prcm.c
index 6d4386eeb7dae..c8663b973749c 100644
--- a/drivers/clk/tenstorrent/atlantis-prcm.c
+++ b/drivers/clk/tenstorrent/atlantis-prcm.c
@@ -397,22 +397,21 @@ static int atlantis_clk_gate_shared_enable(struct clk_hw *hw)
 
 	scoped_guard(spinlock_irqsave, gate->config.refcount_lock)
 	{
-		need_enable = (*gate->config.share_count)++ == 0;
+		need_enable = (*gate->config.share_count) == 0;
 		if (need_enable) {
 			regmap_set_bits(gate->common.regmap,
 					gate->config.reg_offset,
 					gate->config.enable);
-		}
-	}
 
-	if (need_enable) {
-		if (!regmap_test_bits(gate->common.regmap,
-				      gate->config.reg_offset,
-				      gate->config.enable)) {
-			pr_warn("%s: gate enable %d failed to enable\n",
-				clk_hw_get_name(hw), gate->config.enable);
-			return -EIO;
+			if (!regmap_test_bits(gate->common.regmap,
+					      gate->config.reg_offset,
+					      gate->config.enable)) {
+				pr_warn("%s: gate enable %d failed to enable\n",
+					clk_hw_get_name(hw), gate->config.enable);
+				return -EIO;
+			}
 		}
+		(*gate->config.share_count)++;
 	}
 
 	return 0;

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260924-atlantis_gate_shared_enable_fix-c8d0c8db63ad

Best regards,
--  
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

