Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C6B1E4BE;
	Sun, 12 Jul 2026 03:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783825893; cv=none; b=PtqDuJGccUcIp0EwuX1hBVCmh5u5I2RtrSbO3jbPH35/8vLceMUvuyzE74/iNvpgnuF6Wt+83sIsugb92QF3mu6t/3lInKJdPrfot3nHE15fmjBG1WNJoYbSOvwtnG/jzNmJqDxURKjWwgSuN/Q1tH/bEntMJNAy0EasW1oFYCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783825893; c=relaxed/simple;
	bh=B6McnTUfRV8hsWOIMcBrUnK11VgMMgYLcjKB6pn/gVM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pUqmMfDieYeV+zEDpJC8TtHMmcU/Y5XDEOD6XzVs1MKHyPJFs55BuWLqXlOOTuX3FIUa45lGxYIu5cDLpI3mCFKaeiaYRQ3hfmWGGIaBVAcNi6DCCIhCisjx5ArMEfz22KHsQJFUrnYIdG0MMQXBGQw2P+LaC+nJRy9W/30Q58Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XfRfmwH+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XfRfmwH+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1EB9EC2BCC9;
	Sun, 12 Jul 2026 03:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783825893;
	bh=B6McnTUfRV8hsWOIMcBrUnK11VgMMgYLcjKB6pn/gVM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=XfRfmwH+Hbb1DcIxvjcxdFJFLsYfHt3+euKj/0Jcpk4CC3BcA7xc4/6gVGoYR0i3M
	 Pya+jAxEoTUk8TLqMAob2cdzeDL7O6PagVxxfBFA0Ljz0cmOZjlXbbedqLehsP+NpA
	 BWcIUwy7cd/CsQPTqGE2JTw8l5a0jPFk3YHd5MkoCaA1d/yxxpz7PHo8d9mK0AHhVU
	 kgdBGVR5Kab2/iIswM3nLzd+2H54LO0nz8+gRWJnN5KCdvUVPeU73zaPmbPg/p91sM
	 Sw/KMHIiEPO+7smOkB9SELJd+ivah4rBdlBW7xn0RrqpxXa5kBvi/TZg1DJDeZg/5A
	 JdRKeSGAXsMKg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F89C43458;
	Sun, 12 Jul 2026 03:11:32 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Subject: [PATCH v2 0/3] SM8450 QoL changes (dispcc)
Date: Sat, 11 Jul 2026 23:10:34 -0400
Message-Id: <20260711-sm8450-qol-dispcc-v2-0-fc1a07ac5601@proton.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02Nyw6CMBBFf4V07Zh2lJcr/8OwgHaQMUKxg0RD+
 Hd5bFye5NxzJyUUmERdokkFGlnYdwvgIVK2Kbs7AbuFFWpMdGoMSJudYw0v/wTH0lsLOq8wj43
 DuNJq2fWBav5szVuxs7yrB9lhDa1GwzL48N1OR7N6ez9B/O+PBjScUkKizNW5K6998IPvji2pY
 p7nH87iVXK9AAAA
X-Change-ID: 20260711-sm8450-qol-dispcc-09b2951d25b0
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783825891; l=962;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=B6McnTUfRV8hsWOIMcBrUnK11VgMMgYLcjKB6pn/gVM=;
 b=mDyWgsrxFJ2IVs5jLDFOaznan9Cc4Opdlt4irS6y6ULgoIlnlb/9h3nMD/U1E3GTo9rmWh2It
 mpJ/uhHii6ZA6IFHOxX+ymr43JM1ACSigm8v9NJ/DFX9xcHfb8z8+U8
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

These patches are mainly focused on getting a flickerless boot process
on SM8475 based devices.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
Changes in v2:
- Split series in subseries (dispcc, dts, qmp, smmu)
- Migrate to qcom_cc_driver_data (Konrad)
- Split mdss patch into 3 patches
- Use Fixes tag where applicable (Krzysztof)
- Link to v1: https://patch.msgid.link/20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me

---
Esteban Urrutia (3):
      clk: qcom: dispcc-sm8450: Fix disp_cc_mdss_mdp_clk_src ops
      clk: qcom: dispcc-sm8450: Migrate to qcom_cc_driver_data
      clk: qcom: dispcc-sm8450: Keep pll types as is for SM8475

 drivers/clk/qcom/dispcc-sm8450.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260711-sm8450-qol-dispcc-09b2951d25b0

Best regards,
--  
Esteban Urrutia <esteuwu@proton.me>


