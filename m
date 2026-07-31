Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C36737B3FE;
	Fri, 31 Jul 2026 20:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785528649; cv=none; b=Nae4wn8Ot+xZjfHBf3cF1TifpT2Ij5I4bJEY/5wzy1CzqUSVUpGLiJYwDbEjksxR4svP1d/X+QUfCAixIx7vUpbCcUhqft5XYdEwY4OSAzM8MKedL1I6eGV+isPynMNZKRj3TvZI1bJ4aI0Z/i84dYxHcojD6hlK/XMqa9EwpWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785528649; c=relaxed/simple;
	bh=MN+E8uKmNziTDPAS4WhxKrvN1P3cyNy2Cs44KWIQrpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i+5G1HenXBNb5zxwTCiD/tQ6bz0pL7DtPndlNSZp9OsBKfDFTb4Chj8+qbCxHAsQfH3YQ6AI8tlqjTz0sYVCSJMxwN0XGHauGqFlQBptaBHyHCQAY5PTzilEv+X7ZUVXBZSPjAc39K113ZJC9Mctrzhvl34PNKwO5c7kYWYlZp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RDLKP4qa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RDLKP4qa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D25BC2BD00;
	Fri, 31 Jul 2026 20:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785528649;
	bh=MN+E8uKmNziTDPAS4WhxKrvN1P3cyNy2Cs44KWIQrpw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RDLKP4qaYUWSnOPsvPDXKgqiJ/3VqOm+WLVoJ9HaD53+rrsSJeAOQH1PVgIQ8mqrS
	 8h9A7/CBjXmYuOHpukKPCafu9cwROl6Jn7DXR+HgN9rCDTrPPPwbbRZ+Xz6MWhLL84
	 t+ZsiK2mniuu5CnuR1No+T0dqxu6MPMf3e98R1h9iElPbHZ3trLJnnqrLPB2iHBuBI
	 sLjpKjwgqj18R86cFoSO2q/tgmRk5FggkrXqJpUsgiF2f0NgZCSsx0JY4vLqUwyH6n
	 JWAy5x83BJig4p+V3ZhI265xrW5ixmvnA0Jyn7OoLljqltTOT7WRPzL0xAE5dPru7h
	 qYSXd4tmxrMcw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D4BC5516F;
	Fri, 31 Jul 2026 20:10:49 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Fri, 31 Jul 2026 22:08:23 +0200
Subject: [PATCH v10 4/4] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-msm8939-venus-rfc-v10-4-9ac503250fc7@apitzsch.eu>
References: <20260731-msm8939-venus-rfc-v10-0-9ac503250fc7@apitzsch.eu>
In-Reply-To: <20260731-msm8939-venus-rfc-v10-0-9ac503250fc7@apitzsch.eu>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: Erikas Bitovtas <xerikasxx@gmail.com>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785528647; l=851;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=vlNIGsZjjCgtqd020ljm5+oJCLR6R19lTDHEE9egzdU=;
 b=8TM5hw4wja65Zv38hod93BBrYT1cwIwhvPZToxGBMhoeUJ5BgT0Rq9m7i4djk8qOe4nmN9ka7
 hld2quFarESA51mu5OA39xdLcdqJtOXHHqlRlYplRJHTGLsnF/6C678
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: Erikas Bitovtas <xerikasxx@gmail.com>

Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.

Default firmware paths work on Asus ZenFone 2 Laser/Selfie, which
means firmware-name property can be left out.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index 90e966242720..231a3e9c1929 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -267,6 +267,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
 &wcnss {
 	status = "okay";
 };

-- 
2.55.0


