Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA1140B6DB;
	Thu, 14 May 2026 14:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778767765; cv=none; b=j5MMnpsICtbU4ThPTEJtWAEHFcpflXT/+uMz9EiMCrKFdTeiZjpk6YTTwg5Gp7QTd+TgW2+YjQGOmrJbHu70X+eooLqFFfMUYbrfCzvwrmt5DAq8HGEv0FlXD6AIGLoD0buuXuqBMPcFB899KITUWUaZfzA0LecHGGGVgyf8CAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778767765; c=relaxed/simple;
	bh=N1cLNH+mFBqaPC/RnEtqPemaSVV1XVbleP3l3vQVdn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e8v6H5YkuXuu6HXZeUyohoiqOYpfdHTTfnkeK7jLkNke4F4BFJRVxBV+T0vDVnoVCyODmzZ7MT9CTTcm8IaKfvj2tJlLtfv2oYafV2J1zGCgbTazlqrhgzrQvL+ycDjiV3HXFSOSa8fH+uekG5vB8CkLIgMqseubFl693jiBrfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8BVc0rk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8BVc0rk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7EC41C2BCC7;
	Thu, 14 May 2026 14:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778767765;
	bh=N1cLNH+mFBqaPC/RnEtqPemaSVV1XVbleP3l3vQVdn4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Q8BVc0rk3VhPqKVlKwD3X1Qqri1jbnWiN+EMZFsvRS/2u+z9LLMhe4oyrCV0h97Yk
	 DDh3E5wRcI7RRBAqigkn8TzZdaUBDf/Hr7TfBjM2UT2Pwfe7FqkVft7AG+eJUj5fop
	 9BPu+9dnwSu3vZ0AeJg+lOEStM5dRmyH2eXUdAKIFmiKOc8jk6LD061wd549Myw/nQ
	 uHUUEEH/qgxhvqMfEAmtPIvCE+jEHPfMRWazVc9uN+2gcjW+QJcz08neR3xDJH57zR
	 KLPPRH8WlH45nefUW2OBXK5utd+AMMBiXio13agXKYyFgkUZD7QaLtXufXO+EGd+j0
	 mnhwMU+OZMNmQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71156CD4F42;
	Thu, 14 May 2026 14:09:25 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Thu, 14 May 2026 21:08:35 +0700
Subject: [PATCH v2 06/10] ARM: dts: qcom: msm8960: add SCM
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-msm8960-wifi-v2-6-7cbae45dab5e@smankusors.com>
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
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778767762; l=1008;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=pCm385rRYmYjbpRH9xmwAqDhm1rn5n09jGxI+Mdphzk=;
 b=KR0vPjg3wJYoxgH3czEl77dZFM7vT++NKS9FqLdCQODT1XpFfymYWNNew1EykK+DsJRP/Dr+I
 BiEopXL5mCgC5M5McI9eAwm3NSmv/D25O955drC5zfB6EgxGkNo0e1a
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
index 0601680cd8dd..fb23c950fecb 100644
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


