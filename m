Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62487390CAE;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776106822; cv=none; b=NI9GOm4+/YYunuQk46fjej94MyEPaRd2B94T0thufxi6vyDJFrFz/6nSnNtctp5nAt++u/tUpDXAL2MVXBpUqlNT4+jhn152eCcBvBcQ5hJgkcUg5o30nhbbalwVoSx6imHcThA1+GSpE10+FggYCaYaf+NIpO0P8zRzU/+eKbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776106822; c=relaxed/simple;
	bh=NYwF55QA6txdrIoAGxylJ/Rgbbu7ua+pdJtGzMjggQ4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eTN6B7GFgH8yMXkGvDk46l4OkQQUP15WO6+siV6R0s7wBb/Ydml7hfznx63l3zORnFyn7GJxt3+lNqSQJFSeVaA6pBGbuegMaZxXj/JINYO2fywiOKTvRcEwJDQDDc7g5dtqztEwsGnrRqBsYn+wSdZnMvWxDQ4iFJpgF3+xEPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RNhjdJQ9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RNhjdJQ9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05D85C2BCB0;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776106822;
	bh=NYwF55QA6txdrIoAGxylJ/Rgbbu7ua+pdJtGzMjggQ4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=RNhjdJQ9NTJS4jh1DOz5RrvsEy6BLsNNdPtQmiXO/I9Bk9kHF31dz2H9fJDnYNQRA
	 88fQQ1lYvNmAeuTop1ohQBodjAPzEzSexH+3CgZ4ltPGZZsHFYt1i0SjOBeOGV5i1d
	 ri0K4hn3dli/cCnVSVnVBLsOlfr1hYiMcSwsHT/ra8g/z2vXYdPgZ/ai7Ktn56ekO8
	 c3tEijl/1yYgVSQDIARX6Wq/pkf2crpkwHNNey5p1jFZ5DydXe87y/MfB3Xp3I58S9
	 NSolhOdHTRyAoYuSuPCl73Smvf5MPk/zxZXKF68OKiRC9zhtPycM+A1Uci6KAGYbnb
	 xbPqizMlt+FFQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F77F531C7;
	Mon, 13 Apr 2026 19:00:21 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Subject: [PATCH 00/10] ARM: qcom: msm8960: enable WCNSS (Bluetooth & Wi-Fi)
Date: Tue, 14 Apr 2026 01:55:27 +0700
Message-Id: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB883WkC/x3MQQ5AQAxA0atI15rQ0OAqYsEouhhkmiCRubuJ5
 Vv8/4JJUDHosheCXGp67AllnoHbxn0V1DkZqKC6JGL05puWC7x1UZxE3NyyY64YUnIGWfT5d/0
 Q4wdy1J4oXgAAAA==
X-Change-ID: 20251226-msm8960-wifi-beecd96c6646
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
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776106820; l=2611;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=NYwF55QA6txdrIoAGxylJ/Rgbbu7ua+pdJtGzMjggQ4=;
 b=EEEnBqermgK5yZU8PP0youZRIua/s25daTd5ma8b7a1S2XEenHGNFhQbRsOWo0L3nXNT6qDKv
 xqpqURXV1/kBVw6c++UcPgP+60pJbZthSABVgD5SmpyT5OG9yyDjrrk
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com

Enable the WCNSS (Riva) subsystem on MSM8960-based devices to support
Bluetooth and Wi-Fi.

Add the required device tree nodes and resources, including memory
regions, clocks, interconnects, and communication interfaces used by
the WCNSS firmware and drivers.

Changes:
- Add Riva (WCNSS) nodes: firmware memory, WCN3660 iris radio,
  Bluetooth and Wi-Fi subdevices, and pinctrl states
- Add SMSM and SPS nodes for coordination with the WCNSS subsystem
- Add shared memory and hardware mutex for inter-processor communication
- Add SCM node for secure channel manager interaction
- Add RPM clock controller and required QDSS clock resource
- Add bindings for SPS interrupt controller and RPM clocks

Known limitations (not addressed in this series):
The wcn36xx driver appears to misclassify 2.4 GHz networks as 5 GHz
during hardware scanning, preventing association with 2.4 GHz networks.
This issue has also been observed on MSM8916 and MSM8953 platforms
using WCN3620 [1][2].

Tested on:
- Sony Xperia SP
- Samsung Galaxy Express (SGH-I437) - secure firmware loading not yet
  functional (separate series pending)

[1] https://github.com/msm8916-mainline/linux/commit/cc4abc694fcf2c942410136bc58a61e79bf21e83
[2] https://github.com/msm8953-mainline/linux/commit/779c9627ec0b971bf466588e64fe530cf78a414d

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
Antony Kurniawan Soemardi (10):
      dt-bindings: clock: qcom,rpmcc: add msm8960 compatible
      dt-bindings: mfd: syscon: add qcom,msm8960-sps-sic
      mfd: qcom_rpm: add msm8960 QDSS clock resource
      clk: qcom: clk-rpm: add msm8960 compatible
      ARM: dts: qcom: msm8960: add RPM clock controller and fix USB clocks
      ARM: dts: qcom: msm8960: add SCM
      ARM: dts: qcom: msm8960: add SMEM & hwmutex
      ARM: dts: qcom: msm8960: add SMSM & SPS
      ARM: dts: qcom: msm8960: add Riva
      ARM: dts: qcom: msm8960: huashan: enable Wi-Fi and Bluetooth

 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |   5 +-
 Documentation/devicetree/bindings/mfd/syscon.yaml  |   2 +
 .../boot/dts/qcom/qcom-msm8960-sony-huashan.dts    |  19 +++
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           | 157 ++++++++++++++++++++-
 drivers/clk/qcom/clk-rpm.c                         |   1 +
 drivers/mfd/qcom_rpm.c                             |   1 +
 6 files changed, 182 insertions(+), 3 deletions(-)
---
base-commit: 978e0d8216cae014f10326c9a257890cf98a6398
change-id: 20251226-msm8960-wifi-beecd96c6646

Best regards,
--  
Antony Kurniawan Soemardi <linux@smankusors.com>


