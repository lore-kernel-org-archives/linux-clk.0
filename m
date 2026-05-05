Received: from mail.chunchunmaru.org (mail.chunchunmaru.org [45.79.219.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792573D4103;
	Tue,  5 May 2026 20:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.219.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778013550; cv=none; b=JI4vB+XZnoOpcsHQGxIBMrq2Ret8Ja/GO5k+L5wZcoKzComw04f+6BVxl8SIFAX7aTxQlvDemaMlA/3ncrO1FUUUPgS76JGZa6XkLyRhKaem7SfEiW2aAPfaN5YwtDqaFm9bUXpitHRNsMzPWHJSRKEsqAh4VlWn1EGQAVS3j4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778013550; c=relaxed/simple;
	bh=Z/eZw702I3TcSoONToHzuh+MNR+lK3SrqxsgxZVHi/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wuw0xp5xER0q09ZYWSPzyxIrqz2yI991oQVJZfwv5Di4yMs920TP2JHVACUcXvWBlwtV+UMFgwHqMMDixz7L6H2/Qti5cIVYQ/myzV25zbvxUDxoPVaqmMHkJztVPNmqHlCEqYbO3X1oLDX0/ZCquy0d4JAuWzDeZEccb42waNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=floorchan.org; spf=none smtp.mailfrom=floorchan.org; arc=none smtp.client-ip=45.79.219.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=floorchan.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=floorchan.org
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B78932254A;
	Tue,  5 May 2026 20:39:08 +0000 (EDT)
From: "Catherine A. Frederick" <serenity@floorchan.org>
To: andersson@kernel.org,
	sboyd@kernel.org,
	krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Catherine A. Frederick" <serenity@floorchan.org>
Subject: [PATCH 2/3] dt-bindings: clock: qcom,rpmcc: Add MSM8920 compatible
Date: Tue,  5 May 2026 16:38:40 -0400
Message-ID: <20260505203845.192140-2-serenity@floorchan.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505203845.192140-1-serenity@floorchan.org>
References: <20260505203845.192140-1-serenity@floorchan.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Document new qcom,rpmcc-msm8920 compatible with rpmcc changes.

Signed-off-by: Catherine A. Frederick <serenity@floorchan.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index ab97d4b7dba8..e35a003f270d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -32,6 +32,7 @@ properties:
           - qcom,rpmcc-msm8909
           - qcom,rpmcc-msm8916
           - qcom,rpmcc-msm8917
+          - qcom,rpmcc-msm8920
           - qcom,rpmcc-msm8936
           - qcom,rpmcc-msm8937
           - qcom,rpmcc-msm8940
@@ -112,6 +113,7 @@ allOf:
               - qcom,rpmcc-msm8226
               - qcom,rpmcc-msm8916
               - qcom,rpmcc-msm8917
+              - qcom,rpmcc-msm8920
               - qcom,rpmcc-msm8936
               - qcom,rpmcc-msm8937
               - qcom,rpmcc-msm8940
-- 
2.53.0

