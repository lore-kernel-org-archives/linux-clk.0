Received: from vtj.irix.systems (vtj.irix.systems [82.76.27.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406672236FD;
	Fri,  2 Oct 2026 12:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.76.27.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790943571; cv=none; b=kTc9P4kvWOCEnPiIev+PSqZk+vgF7tiUMxGTONqVRVC26U3IF8NBQ+QyqKU27NQAWQ165XIwvI+68NAnS+f69C2MdkKYy+cmjTwgRtk+d5yqiv/+XYzPcESZoA+a2UjXxwG8TEBhpMDf5Sh5ksnlwOLOZYqbuCrZyThWDX7SPQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790943571; c=relaxed/simple;
	bh=9cXnIx06nUqNIHpArVP+BXnrLsSM/JTT3AD/L3fMTgM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IM5OyJV2IvAg0bKI35/gzsys20ZrPVIy9Urx+Q1vLiP1q8dNc3sPh6J6EvN3alJNxQW4Kp4YYEeQyC5YbcK9ASKT8ez17iRea6unuQrwf7y62NbYFe/VS3ufrwQeYzY1OTdYE/uXXTgZePVLtfCJPaOlc4tThr5WP+V0z3rLDR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrei-z.com; spf=pass smtp.mailfrom=andrei-z.com; dkim=pass (2048-bit key) header.d=andrei-z.com header.i=@andrei-z.com header.b=DfvyZg3e; arc=none smtp.client-ip=82.76.27.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrei-z.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrei-z.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrei-z.com header.i=@andrei-z.com header.b="DfvyZg3e"
Received: from MAILGW-HP.hp.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id 16114644D;
	Fri, 02 Oct 2026 15:19:27 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=sig1; bh=VGWCoQE81TAGyL6Vxi0pMS2BVSt6FEdKDi8Z9KLBMzM=; b=
	DfvyZg3eXs3q+8mOYTmlu/xnvm7mvuWnZ3KL63vq7EdgzLunGn29uq52axxjsenK
	lBJKHooeKk7EYVFl4Kxn19KPmj1HgecvSdf4mmjTErUScjuXg9+nrgQejI0IDaRl
	tgbhZEBgSmxMx2xaHH82EVa9g2Ef89+mvrM4szG07rhwWgKELaosYwQE7fcV63+c
	bkj0S1Jiw+J1QEDrxQYO98TmkB+MdSg6ED4kASNK2JBk5jwx2HCDGLroRJm2fahB
	VTPLm1hk0i4pabV9fMitgcaaet1O/j3dXixBg5UIaa9pjHc4nE5FUlXRs91G5V4N
	lCMV80F/mFPKAY0ji2JQEw==
Received: from VTJ-MX.corp.irix.systems (unknown [IPv6:2a02:2f04:1:9c24::6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id 1AFA7644A;
	Fri, 02 Oct 2026 15:19:26 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 15:19:25 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] clk: qcom: gcc-ipq5018: stop UBI0 clocks from reclocking their parents
Date: Fri, 2 Oct 2026 15:19:18 +0300
Message-ID: <20261002121920.994608-1-me@andrei-z.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) To
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6)

ubi0_axi_clk_src and three UBI0 bus branches (gcc_ubi0_cfg_clk,
gcc_ubi0_utcm_clk, gcc_ubi0_nc_axi_clk) carry CLK_SET_RATE_PARENT, so a
rate request on them is propagated to GPLL0 or to the NoC clock sources
that the rest of the SoC runs from. The first patch is the one seen
failing: a 400 MHz request on ubi0_axi_clk_src made GPLL0 the top of the
rate change, re-ran set_rate on every GPLL0 consumer and hung the eMMC
controller. The second applies the same reasoning to the bus branches.

Nothing in mainline sets these rates today; the requests came from the
out-of-tree NSS driver on a Ubiquiti UniFi U6 Enterprise (IPQ5018).

Both were found and written with an AI coding assistant (Claude Code),
which also drafted the changelogs. The eMMC hang was seen while
bringing the board up on 6.12 with the NSS driver; the board boots and
runs with both on 6.12 and 7.2.8. On linux-next they are compile-tested
(W=1) only.

Andrei-Alexandru Bleortu (2):
  clk: qcom: gcc-ipq5018: drop CLK_SET_RATE_PARENT from ubi0_axi_clk_src
  clk: qcom: gcc-ipq5018: drop CLK_SET_RATE_PARENT from UBI0 NoC
    branches

 drivers/clk/qcom/gcc-ipq5018.c | 4 ----
 1 file changed, 4 deletions(-)

-- 
2.47.3


