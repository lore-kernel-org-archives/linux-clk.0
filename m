Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7643F7A9E;
	Thu, 14 May 2026 14:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778767765; cv=none; b=m39cbygWmwMORcKFDU3lk6TX/89Leq8SEdSajmFA+iQAhk75WmdGqPc8woAsZGNUDt8p2Ern9Z2IeNyg19MBfabiWk57ItVeDLRd+/Xwd4yKVJ1Cbx5B2F6H5W3iBRoUdWFkmihOUJQNl2mkodB555LY7JFIZNcXwMtoDzji9vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778767765; c=relaxed/simple;
	bh=imDz6p80dCh3VtmVa0YE/zlu1TE/BKPaeKtmZOiuRqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q1SZoSnB+Zk4PqyALV0vDOiutRZGCWb0u8kLUiUvMjDo9v/UNOtXqsOGC5+ZoO9YZnRMg+izobuB/wcxcocNK7iYi22lre5e1N78Iw27U8fYX1Hm2O3eJhVloPC1ZeNYuWAAg0MMBZmhHNIYEk678B1NXJFAbOrUXvl33sAKOpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eagQIRcw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eagQIRcw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35454C2BCB3;
	Thu, 14 May 2026 14:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778767765;
	bh=imDz6p80dCh3VtmVa0YE/zlu1TE/BKPaeKtmZOiuRqY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eagQIRcwYEteNpSBprz4SmhcyQB+xkxXJVT/YkK9IQQPpgn+0tvUSshTvT9qhO7MW
	 gwezQgFDXBeTa2YJJ1NPfxYDZPqkIkKtnUWXgXVT7egMsKGgmDPpHKp/nItQW2ELja
	 tPX4Sx35b/rOFkZs1MwLPl1P+LwrEVejm3xtuW3AJU5D3QLfCfZ5opHmMF4NNw0JBN
	 esyIlbOdRpFSmsFlKE6vKc19rCgig/uIRzAAZ4VNPmgJhZfJ6gqZlFtDY1bfdyano9
	 ADqpWe0BYHcatdDSc7mXzGmzuzMSzj0NYRKkH4oPgGeodYP84srlAvmLD0B0lG6SPk
	 44qy3+pfDqrYg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B36ACD4F3C;
	Thu, 14 May 2026 14:09:25 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Thu, 14 May 2026 21:08:33 +0700
Subject: [PATCH v2 04/10] clk: qcom: clk-rpm: add msm8960 compatible
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-msm8960-wifi-v2-4-7cbae45dab5e@smankusors.com>
References: <20260514-msm8960-wifi-v2-0-7cbae45dab5e@smankusors.com>
In-Reply-To: <20260514-msm8960-wifi-v2-0-7cbae45dab5e@smankusors.com>
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
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778767762; l=1065;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=lm6L9ISuVUk452Tk3hf1nHmfNzhGhKGjXfsugz6Twlw=;
 b=fvx+9E2AlaLa0kl8dq0B4GZz3kS6zQ05PrFlNJ6EWYrFjgLy/EtuV5ortCNccyvO2GVFFyoTp
 8BWRQYqbYdbDdGGE2gy00Uy4Dd/4cOFVw33y04R95dHN7PwnK+nDBP9
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


