Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924EA27A92D
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 23:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771285092; cv=none; b=Uyp5MNOzpVr6OGmBrsTa+jgooxHbA7ZxlWRala3f0+5KhjuUThhKY2+uMy546ErwrBSmw0lK0n2Zpc+oZIK5v7OQJezllJj2r5YWaWgG7Ku6az7iL9vhxnIuw0i6F4lPJ0hqjBBUuh4aUMW4/5qbMq88lZ57OKUiJy1YZuBFmGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771285092; c=relaxed/simple;
	bh=Mw5K5QADh+7LE6DqXjqFWFNs/csR7Jd3+CYWDEyGOYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mHunFhEcITbCxch8WBxsduHJDHZDZuY57+QnBeNcWLiASBLjgg4j6TKHKGa9joxstKtjg+2iTJNGVKpyzHbOUpiwCSWRwwPOx4zSQLhdTvLORHOFQVwYi7a5vTjqis2ulvtWEEwpdU0vjgczIhL/Tvg6PMHqIUuMVala1yYZtGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=aJqt4bdh; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="aJqt4bdh"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1771285088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YJ5Jj5HBJFB5fWYT/WNdd+bAwmIY3J0yf3LkgRcOblI=;
	b=aJqt4bdhpSGIIJEnJ9c9qwkBu52uyTykkIn0MG/0T7m3GYjnm7C0cU9FYfJvhWNdUIYZlB
	ZirnyNOT1zQ5McC+wy0I9Bhyc1cEjD8xwLFouQ+FFNbQZS62MIRVjPCuhW2BLZ8irKejhn
	AUQNW2kGFYXTAA/V4BGNmxAb8G6h8N1j3UWWVAk+5vCL1woE28ojPDz0zMOXfdGToynYcl
	uA13khxv3+nVNIP6PNwF1HCkHiPgZhcs5BrgzbjEJ5qKJjPjYtOF3N5WD5LU+B+ccDvIjq
	9GCKPzs4KsKaDXNlRV7UKD2JTqcYojUIz0dCwfK1Bv8bzqquK72HXsnooxzd2g==
From: Val Packett <val@packett.cool>
To: 
Cc: linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Val Packett <val@packett.cool>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/6] SM6115/SM6125 MDSS core reset
Date: Mon, 16 Feb 2026 20:25:18 -0300
Message-ID: <20260216233600.13098-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,

this series is like [1] but for these two SoCs.

Yeah: same person, different SoCs, same cause, different symptoms :)
On the SC7180 WoA device with DP out, it was causing faults+artifacts
due to EFI framebuffer scanout not stopping when Linux takes over. 
This time, the reset was necessary for MIPI DSI display to work *at all*
on the sm6115-motorola-guamp (Moto G9 Play) phone (DTS coming very soon!)

With the state left by the bootloader, the display would stay gray. DCS
setup commands would go through fine, some `dsi_err_worker: status=4`
errors would be logged after setup a few times (not continuously) but
the display would not start working. With the reset, it works fine!

Since the SM6125 is closely related, I've done the same for it as well.
The QCM2290 already does have the reset.

[1]: https://lore.kernel.org/all/20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com/

Thanks,
~val

Val Packett (6):
  dt-bindings: clock: qcom,sm6115-dispcc: Define MDSS resets
  dt-bindings: clock: qcom,dispcc-sm6125: Define MDSS resets
  clk: qcom: dispcc-sm6115: Add missing MDSS resets
  clk: qcom: dispcc-sm6125: Add missing MDSS resets
  arm64: dts: qcom: sm6115: Add missing MDSS core reset
  arm64: dts: qcom: sm6125: Add missing MDSS core reset

 arch/arm64/boot/dts/qcom/sm6115.dtsi           | 2 ++
 arch/arm64/boot/dts/qcom/sm6125.dtsi           | 3 +++
 drivers/clk/qcom/dispcc-sm6115.c               | 7 +++++++
 drivers/clk/qcom/dispcc-sm6125.c               | 7 +++++++
 include/dt-bindings/clock/qcom,dispcc-sm6125.h | 6 +++++-
 include/dt-bindings/clock/qcom,sm6115-dispcc.h | 7 +++++--
 6 files changed, 29 insertions(+), 3 deletions(-)

-- 
2.52.0

