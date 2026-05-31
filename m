Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C802BE033;
	Sun, 31 May 2026 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780233527; cv=none; b=hLZJT75AIXLnupaGMEHqlLFWrFr7nwDaxd7PAh/miQF9sIkgHEkZ79rP1lGbMmeZcJXUpy0JwKQ+QC2isW83jMnLU9PXJeXCpMlYySbwZitfsBdIn0PfEE3qvpkv72HzyH+qDX3Lc7ANxvCHvdksXH8kuDxLiciZIAWBINNQjoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780233527; c=relaxed/simple;
	bh=Eqm/FjylU02KQAJGx4PG7JMdTn7Gqfwgtr/sltu39zo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AwAtUo6Ja1RBe/Id7c3pgLbt5ST65mVVdCdSnMu4cv3os/Sa1KeD7qpZIV10SIK5428Rx7a9AGla0+cnuRpAVi8Sl4hyk2w4FHcb9D5fu3DzcKB9TAgsr9jdS6vc6+a29omuSG0NvmcipF3STDi3p/+pe4cCUHi6/zygX/2TzPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=W9nNGvTJ; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="W9nNGvTJ"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 64VDIP1901282838, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1780233505; bh=zQFdOkm84fNGuwgi5/RHjJhNu7Awfaj6bmS8U9YUdYk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=W9nNGvTJYXHz4BiPj7MwtKoZuAjdRZ/ZkabOWGVF1LOFKi3Jyve1xZA6L/M9QK28O
	 wZaRMZ4WRVhd7W3XuvHz/H8iOz3c3vVi1b5YebA+tK8a9MiJXQbUZ0tRXzWEoO3ULn
	 3MhXnhFemEZIP2TBnd1TLl9ogara1i+op8D7VgBQqphIMqwfNWoamddOZpASSOtBzG
	 HjEDVy2fv4I7WH6qMCS2jFFimsJiRsMTclZuaDRfezSmToyT4XLRaN8FwB6f4L7HMP
	 6lSGrt+ADPZKFRbCCcIYuEi/Tm+w6Hw6K1HuKeNOHrRFCT3qPNsCB1QeLk525q0qiU
	 /hq1OBg0sOYCg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.28/5.94) with ESMTPS id 64VDIP1901282838
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 31 May 2026 21:18:25 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 31 May 2026 21:18:25 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sun, 31 May 2026 21:18:25 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<florian.fainelli@broadcom.com>, <rjui@broadcom.com>, <sbranden@broadcom.com>
CC: <bmasney@redhat.com>, <bcm-kernel-feedback-list@broadcom.com>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<james.tai@realtek.com>, <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH] clk: bcm: kona: Stop defaulting to parent index 0 on error
Date: Sun, 31 May 2026 21:18:25 +0800
Message-ID: <20260531131825.2468411-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Stop defaulting to 0 on BAD_CLK_INDEX (U8_MAX). Passing the out-of-bounds
index directly allows the clk core to fail gracefully during parent
lookup.

Link: https://lore.kernel.org/lkml/177431305509.5403.15386021337517970667@lazor/
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/clk/bcm/clk-kona.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-kona.c b/drivers/clk/bcm/clk-kona.c
index 0171e6b2bfca..d6f5872d7d6a 100644
--- a/drivers/clk/bcm/clk-kona.c
+++ b/drivers/clk/bcm/clk-kona.c
@@ -1098,8 +1098,7 @@ static u8 kona_peri_clk_get_parent(struct clk_hw *hw)
 
 	index = selector_read_index(bcm_clk->ccu, &data->sel);
 
-	/* Not all callers would handle an out-of-range value gracefully */
-	return index == BAD_CLK_INDEX ? 0 : index;
+	return index;
 }
 
 static int kona_peri_clk_set_rate(struct clk_hw *hw, unsigned long rate,
-- 
2.49.0

