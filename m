Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0564391E41;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776106822; cv=none; b=fOwCNmFOD/aIkt/B+7nUd9IXNA9n0EVuCEgwtcSmjHi8BJzyxvM2zuzDSNg2y9DXZXRhSGE2XkkjZqOlBCCjEB6jJmNoAwyu65oAEp7nTcVecbvziudNcGrXghe31q1z9S42z4KxHBor64iS/9NqJIt1AHiHQr8YQNV0CWJ+jSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776106822; c=relaxed/simple;
	bh=imDz6p80dCh3VtmVa0YE/zlu1TE/BKPaeKtmZOiuRqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FmN7s5WwfPaKYGLCWsVB+USKmFSuBaB/P9itANxFMoCXKCOsCEvG55pTdrt/wO8NlVczedcS1XS7rbno2CFvy1T6fFXGcJJ2a0fO0kt78oa4JgIu1tXHmJuw74++eJMQcJId/3YtdElgAlszCFmc04OcO5KF2ZxIRxLP3RYbzzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtTLeEbL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtTLeEbL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46E59C2BCF4;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776106822;
	bh=imDz6p80dCh3VtmVa0YE/zlu1TE/BKPaeKtmZOiuRqY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YtTLeEbLoVwJKghdvtSvs4zywEo+R0x6WPZEHlTK3RdL73/B0la538Ca03P2Q5L4X
	 9egVtuETFYLOVJxaRh1JeluDaqOX1YmxkM+qwFqNCngE/cl6bs+14RT1VZM9xALRxl
	 JUo6rR/uXM0TKayYXUOcNUVp7lQGf0vkUHUWvYJBqoRwAxb+Wt0URiCxv80oWGM+v2
	 vj0NI2L/vwtSfkK1NkYEzONWodWB2hhTgft1oQ3SYTndNXu13pDatpMlc/8GeiAzv2
	 n6mrruM0hc6WDbb5UjtLOzwK9dOS+9t/uw+0lZMaXXKWsnqbehXsP2veBahI7sGSWO
	 wy32aWboWmCMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3985FF531C8;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Tue, 14 Apr 2026 01:55:31 +0700
Subject: [PATCH 04/10] clk: qcom: clk-rpm: add msm8960 compatible
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-msm8960-wifi-v1-4-007fda9d6134@smankusors.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776106820; l=1065;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=lm6L9ISuVUk452Tk3hf1nHmfNzhGhKGjXfsugz6Twlw=;
 b=fDOiKCmxII9TBBmEZyOMDLtBo8m1W/ylFd4VudNQXCovL0Rb1P/rj8jd+7rGdKaIaA0DF1nV+
 BDaJU64aOPRAJWm3b91jNX4oy2r4dBmIqm/26N/hREfE7hyCwt6yaR4
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com

From: Antony Kurniawan Soemardi <linux@smankusors.com>

Add support for the "qcom,rpmcc-msm8960" compatible string to the
RPM clock driver.

msm8960 uses the same RPM clock descriptions as apq8064, so reuse
rpm_clk_apq8064 for this compatible.

Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 drivers/clk/qcom/clk-rpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
index be0145631197..601f60274113 100644
--- a/drivers/clk/qcom/clk-rpm.c
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -502,6 +502,7 @@ static const struct rpm_clk_desc rpm_clk_ipq806x = {
 static const struct of_device_id rpm_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8660", .data = &rpm_clk_msm8660 },
 	{ .compatible = "qcom,rpmcc-apq8060", .data = &rpm_clk_msm8660 },
+	{ .compatible = "qcom,rpmcc-msm8960", .data = &rpm_clk_apq8064 },
 	{ .compatible = "qcom,rpmcc-apq8064", .data = &rpm_clk_apq8064 },
 	{ .compatible = "qcom,rpmcc-ipq806x", .data = &rpm_clk_ipq806x },
 	{ }

-- 
2.34.1


