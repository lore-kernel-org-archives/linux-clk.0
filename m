Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60819379EC4;
	Fri, 31 Jul 2026 20:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785528649; cv=none; b=B1fTSDucwDHj+w8FI6lBPxr2mA4XfWlcUEdtax4SuiP9ySnrn4wPVMBozmP+J6CGpTQN+PSUt5W6/YXu1DLOgWNO6tjKhPQ5rBu19qAIzsG3tDymQEUhvsbUZ00GhkFGZLkufHXZUrAtfy9P+XnB3N27FTdXYWH4xC7/pdsXGFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785528649; c=relaxed/simple;
	bh=NIHFKQwDazXn/PrvP+sV41bfa7jGsi+jAHrrXOJEdt0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kPK+7YGWksyK1FHg5I9v6Kv1RFAHSL7t9yofOAA7DR/t4fQhU9OyP5PqoPGBDTaXMxJaTYJO8TK12UrjI7B6LP5X51dn2EEU/yTAIsJPeWoLVlXnnQ2SHFXdMcHEbi2gqwuKIEg29bjajq2NwBMJCd6J7DKoI8lmI1/uazi8DFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HN+4fhlF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HN+4fhlF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13325C2BCF5;
	Fri, 31 Jul 2026 20:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785528649;
	bh=NIHFKQwDazXn/PrvP+sV41bfa7jGsi+jAHrrXOJEdt0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HN+4fhlFgA13QAffEYVR61slqax8TwTYoFytggIsSe6hNszTSpwnQM3Wtr0M0ChQf
	 92HXbDf0U3VvxY+et0u66SIDaFkAObRow1MR4PEPYb1vD2SZDhoXNIuMepir1fnXuB
	 HkAKX96WenLF34bxSDVsgYGJ7g+KClZM9YasE2+fE0V5kI0jUjKJ4kHH8CkUFEwXQZ
	 1dMeKnHV7PMdSN5Q+z6e8+y9JIHDPxJBkjAbpOg+NO4en5+ILfREQBEiHTt4ZXbxSX
	 Mjfj+kclYNInhgKT7EeQQivaQ0vQ4KDJ8dVoyiI26YhN8d0sI+R723Fw/RMXNypz1r
	 PtJ0zOZhg/vBg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F09AAC55177;
	Fri, 31 Jul 2026 20:10:48 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Fri, 31 Jul 2026 22:08:22 +0200
Subject: [PATCH v10 3/4] arm64: dts: qcom: msm8939-longcheer-l9100: Enable
 venus node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260731-msm8939-venus-rfc-v10-3-9ac503250fc7@apitzsch.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785528647; l=876;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=jdo0UmXOjZ49uP0I9O1zOQL628e2e+vfr7rCnYF/0LY=;
 b=sKA1M/ju9GHGw3gJT/CXEl1fjobE6gRHc14/hO1xGuCyj93Q9thMGQAJhyjwYBfVD1UtoZdmh
 6qw4Gjva6WgBiRyQggdCIy7uSGmUPSNmv0H+69EuLQa2N5EPKa1aWBh
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Enable the venus node so that the video encoder/decoder will start
working.

Default paths for firmware work on BQ Aquaris M5, which means
firmware-name property can be left out.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
index 13422a19c26a..48514c3df718 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
@@ -314,6 +314,14 @@ &usb_hs_phy {
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


