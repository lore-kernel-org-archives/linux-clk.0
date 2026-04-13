Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65173390CB5;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776106822; cv=none; b=d5yhqLO8/JoXupKm84TolJTHzlA5J12Ea6SCI5DBjdqWCdNFBRfPwPV1QNXUUaiEnF6jeaUsjBo+76I4PM73G9+8Skep/4SIPVW5wgvjHsZeNlE/WZt+9pCk+SsBZF74nH2nEXADw/0qCKw1JW9Anplc3hZuscDpntq6vBGnd9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776106822; c=relaxed/simple;
	bh=n6aZD+bwIAnpL3fl3rnKnTqOvwu+ykOXUAmzV++iixg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A+hO+RunwmU+j4GINAyjW4IOKTAN3le8ckR6JKHN+0vgEHhrPXtZ9MOwycsuVoG5EpZJoHRUMG4HAf1yv1i8nt45mAIjxQatcVq+33m+JrXOZmEP526yk0g2f3WKyepFs7d3t2+fb4UamO8yThdOeooexjBthnPPCl9yaw2QgPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QDZQ82/R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QDZQ82/R"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37E08C2BCB9;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776106822;
	bh=n6aZD+bwIAnpL3fl3rnKnTqOvwu+ykOXUAmzV++iixg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QDZQ82/Re29AsMI4Pq5Iw4y8onusJ2UB9Kq1QBaKkk/COM6WUM0rHZR96n+RnNCC2
	 /EVekkeLA5zNnWaM8NMgylUqoqk4u/krFsQv6DSmQRdaexS/eaBLdWRKl5HTpDpGkP
	 1x52TQWltCumI7ET4Py2crUVpFAYfsFRVHHAjE63gg3Gg4hAMwcLYpvc5t/KbatXqp
	 R1ug1KA+9cxG2ri7zW3le9jkYn5ACVlC9GQtuCLN2QWhx0uyrhPn6r3pRCwqrPAOfL
	 qEsHv41C8xfvBCdP5tIlk22NQ3A+ocfZ9w4coHtQoRCBlFUEglPRNacRaUF7kKk3hT
	 py5dVt7EbuArQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 293E9F531C9;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Tue, 14 Apr 2026 01:55:30 +0700
Subject: [PATCH 03/10] mfd: qcom_rpm: add msm8960 QDSS clock resource
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-msm8960-wifi-v1-3-007fda9d6134@smankusors.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
In-Reply-To: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776106820; l=1052;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=gOwUYArrOBSpo8/sLmrIU44Yc3IP355SUpgihPGh/KM=;
 b=kP36kl0YA8uqmZfmhFF8HyF+EAX9gBlOqTW2Kkp/0EGzuIx2zyqh2yO5JzvJLie16YLA93krS
 JI65IXoepbZBM/mxpJT2E5viwd9LpGWMP7I7CF4pvCexlxdgNigegFI
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com

From: Antony Kurniawan Soemardi <linux@smankusors.com>

msm8960 uses the same clock descriptor as apq8064 but lacked the
corresponding QDSS resource definition in its resource table. Add
resource ID 209 to msm8960_rpm_resource_table to match apq8064's
implementation.

Without this entry, RPM clock initialization fails on msm8960,
preventing Bluetooth/Wi-Fi/USB from being enabled.

Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 drivers/mfd/qcom_rpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/qcom_rpm.c b/drivers/mfd/qcom_rpm.c
index 27446f43e3f3..0defb3279af1 100644
--- a/drivers/mfd/qcom_rpm.c
+++ b/drivers/mfd/qcom_rpm.c
@@ -324,6 +324,7 @@ static const struct qcom_rpm_resource msm8960_rpm_resource_table[] = {
 	[QCOM_RPM_USB_OTG_SWITCH] =		{ 205, 119, 82, 1 },
 	[QCOM_RPM_HDMI_SWITCH] =		{ 206, 120, 83, 1 },
 	[QCOM_RPM_DDR_DMM] =			{ 207, 121, 84, 2 },
+	[QCOM_RPM_QDSS_CLK] =			{ 209, ~0, 7, 1 },
 };
 
 static const struct qcom_rpm_data msm8960_template = {

-- 
2.34.1


