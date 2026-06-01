Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4846366822;
	Mon,  1 Jun 2026 08:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780304029; cv=none; b=Y0bSxRXxenWWa0/qxHysv9QC8OsXYbAdSJmbJytyrY5h7TiuFJDopD9ymzxck42LlEtIlnbM5sJZB600qxIHx92Ne27Hlwiw1jNl7ORI+GDk33Gz65coMPOlJ7Gr/RJ8ydv6UdoU/1fMn/zjwbehzma000KFyy7yZVfhIcOB4SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780304029; c=relaxed/simple;
	bh=unk4VQKVsmU6pIomKPSINAFHA3FDqwrFZsMyWXsiM/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D+ful/2WyAmk1wkA5y1o4Gt1U+OLf+Pq3Y8Qbv0a/M1BZZYRdbaI7H/UgyGNXDz8soXl7s/4hcSFRj/I5roqJbk/3Yx/lbn0o1SeQOJxYuXV9A+WkcAsYCrZ+N/U349lqL4bdYBp8wNLiIEGK/0m6WIKyLT8HJ/n+mgrkgVGiQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GXGcU6fb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXGcU6fb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 767F4C4AF17;
	Mon,  1 Jun 2026 08:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780304029;
	bh=unk4VQKVsmU6pIomKPSINAFHA3FDqwrFZsMyWXsiM/M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GXGcU6fb/MUy3lyC/4kaB7+r8l7L1yo4s7d5JZybMMdogeK3RLHmn+F3tiGVSnIcI
	 DwGz/e3j5mD/WsCxkvHbeOJHA+jxKl2ievdwU7Fotv9e767H8FOTqvByJX0TYbPBSr
	 77iyq2pZMoffPQ/YUYPwpse01Y1hd8DidkR4nxbnDxMgTEiwnuheIVNfUGf9MGKlbs
	 zcePf6nSPHdIzXS8hYeB4tKzEjKpfRbbi1A8SHkTVuewHkggdmeKJIqI516F1Xip4i
	 vlAkVkSrCo3g/ibko414ArmzsS4yXcwgPPgNEQXLkPrnzewsVI0aLPg5R1J0Vq7uy7
	 BDhy3+h+1flXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D4CCCD5BD1;
	Mon,  1 Jun 2026 08:53:49 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Mon, 01 Jun 2026 15:51:19 +0700
Subject: [PATCH v3 06/10] ARM: dts: qcom: msm8960: add SCM
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-msm8960-wifi-v3-6-fec6ac8dba02@smankusors.com>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
In-Reply-To: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780304027; l=1008;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=qT+aUgqFF9QVn4kMFHM+lNR6npK+SDGWHwtcgzB9u/4=;
 b=Olu0QWkFipf+Y/t4e9s3bpyKBgnAVTu4SJrMOjAQ1cRpxwAveN6JLL5/guhrYbRn3/LySZ897
 VeQno9fKn8TAul+NadxBiiF/5YaUqpAviAumYjwyJW+gYKRfA0bmhJ4
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com

From: Antony Kurniawan Soemardi <linux@smankusors.com>

Add the Secure Channel Manager firmware device node to the MSM8960
device tree. The SCM is required for secure communication between the
application processor and other subsystems.

Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 1ae399c5a81f..3c1640188982 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -77,6 +77,15 @@ l2: l2-cache {
 		};
 	};
 
+	firmware {
+		scm {
+			compatible = "qcom,scm-msm8960", "qcom,scm";
+
+			clocks = <&rpmcc RPM_DAYTONA_FABRIC_CLK>;
+			clock-names = "core";
+		};
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0>;

-- 
2.34.1


