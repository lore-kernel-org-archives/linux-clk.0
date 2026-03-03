Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0852F12AF
	for <linux-clk@vger.kernel.org>; Tue,  3 Mar 2026 03:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772509763; cv=none; b=FA/znayDd8zZ3P22V7Luh60CCoDpoWTul65ouplpMx9vwfJYnMYtN7GjsSCShKpOyMDDMX2PLQ8oZlPd1XgDs00+1dPj+LDa93COTdGXXXhrt17DKvJr8rFb+UbdJAEZVy/h6p5N8E7LNCe/8fUPaL6k2ir9jfg6r1yhwQhBcVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772509763; c=relaxed/simple;
	bh=JmHCvqb6T7KxzxojkMyUlASSjnUKPQs/bEo9bALbp0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bSZL4T6Jj4dyb/Y8I9wey6817AOsGk9KCId6j0eFwXZ04784HdNdWDGOc+MjHGwZ7t4U7gc3iZkB/hJ1Nx9H036lWiY8vEG1yjfDd/5fbK2zHy4rxqcJWoz2vlrmAn7CDDjTB86u9BI57Ngowmcd3/xBvMnS2W4se5L1kEbApWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=cC17qp3f; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="cC17qp3f"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1772509750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ARS/m6Y++fp9w2H2RzhShEg7exMajx+v9LuZw+S1VIY=;
	b=cC17qp3fpTWhJUhW92xN43LSO3zk3nEY9W2yFjTSq1cu98aAE5RUZepk3a3zu6+ZWdBX3q
	S/kLdVMYpZJE1V/ehfuETyVWqKEYk1Bz8keb/WIeYS1Aa7Fy0wsfCuTr8GrVBoNOIyHZAb
	pUhgYmvpdwMbxcKnIL9Upl9HOkbrYhFLx51UJNZfTATM4keuxl7Qu7076vHogwBopbRE3g
	XK7NelKhk8IxI1rEuxNFTUdWb1awKz7djeZWlxwz51UCWt0wetFhlKkoybkjDSQHcHJofr
	X4RtgRkfMOsyN/YJ48mKwPle4YGxgKuYsyuzZjXpR2d6Xf58iqOuXlTH3M2gCQ==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adam Skladowski <a39.skl@gmail.com>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/6] SM6115/SM6125 MDSS core reset
Date: Tue,  3 Mar 2026 00:41:19 -0300
Message-ID: <20260303034847.13870-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

v3: Collect A-b, remove Fixes in dt-bindings and clk as requested
v2: https://lore.kernel.org/all/20260228204638.11705-1-val@packett.cool/
v1: https://lore.kernel.org/all/20260216233600.13098-2-val@packett.cool/

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

