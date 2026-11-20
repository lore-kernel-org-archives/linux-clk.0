Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795189965;
	b=YkFZOn8OCooF27GH41VebJshNH5+/WnjR3f4XhfJ23TucceL3/drRpN110n+fObFjQEb
	 QMCTVQt6Nd/8NqSH/XRcthrSUk1tRr5dHPAsRXo3dVz4iiSJEwkbXLM3KhPphgEvNLJ9Z
	 S0AQuOyQwnk66LXykotXExiBK6O1+jLAz36kuF4n01uEbQtHGgHlnxOXeHGQXk4peg4Q9
	 WrJ/GW/jq0tHdwVjLO8SJJzKDYts18YK0NJ4QPKASTsJnLfv0vOjQNpZyajkQh5s2TlUX
	 ifCl+OGWKp9WnXgsuTPkeD8aZcQnFxFrCDB7+/KuByIuZOWF6aU2NZV9sPe9LrHzt3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189965;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qmH6LAhqBr/82ZqBS4NPxlHrXW3U07fvSK4Pufu8P6A=;
	b=ySkdPOZ6agAdjqVYLySBBqN7ecVP0McaQ6e8GaKGj0lYI3crm4mi4cKfKgcfdPBj5mhY
	 LROGmOH9EXOYNbvfzoHv71AAfcz7VIG8H0c5XIP9ewwymjNmfckja6bGsZ04cKGkqMiKl
	 RL8IbSSDH3xWW4bgoKP15KdUyqfDyc3K1ikYztahCuVbR1bcSp/WypPx6L5kvjL2NPz3V
	 71t6DPUW3gvK9kC0kHxbWFBL0dLtY38WeOCfS37n4loGsMe8mg/0E/itE8TFYSGK42Ja8
	 hI/H1fsSNMTJ0XFmkjOH5T+7sj0YXc46zK5tneyuTGv67f7dOVBX29VsP7j1EHq2MsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hU+hKn+O;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D151A60A2603;
	Fri, 20 Nov 2026 15:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hU+hKn+O
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795189965;
	b=fqtLwQ+vlCKFaqNscfrIN6L0y3UR+GlI+JClDU5gSfgs2GlZLfAK2rBfx2FZt431pqCO
	 1pUF5efCB02M42ldPwFXhaNtL+mXe+kzvueAIWrY7jvHl3ydUlAHcy/eHPJSCaavtmbJC
	 Fi4HEha2IEoZz1lAYiCg8815AgDbHKn1WOB3ZPt7ulckVuO41XDonMs/B2UY2lhvjDvNb
	 vv7f4H/pTySIejQBCsOkLqA+r1wgQY3/X1g1dBRnJBY751/uGQGRankjjx6IujPVwILMh
	 M66g1Z3X22NUXNLHQ2Zu8eSybton/PhprccUvqq3O95rvstZZ8PffvJu7l+KwRFeGlw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795189965;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qmH6LAhqBr/82ZqBS4NPxlHrXW3U07fvSK4Pufu8P6A=;
	b=Z7hh1WAunx4xuChr2JtvfCOczVrt85xcsVDGJzDHbwyTgrvGbVxGWuX9EXOJ5u1d1fi4
	 8uM77xootA3DBTXiTv7+F61YVxjwkdqrMNW1JDtJ/bSw2OKW1NgS0xGY4hxt/suYHsFxB
	 wZ362LclFWk29gqkB09SM0iGzMOyVIlx49Du0ngCOsHbYOhLaeMtPctRlMj0OzcIpKf2B
	 /55N+1fC3nHQDKPdUHgiPnAJ/zTGobL9Qv6oQsmHKkhBxVogXN+QMTYbHl8BS9998ndY+
	 x+UDgeZ5cuBbH8p0q4hKcTM8O1HbqXo3/O/siJShParpl1t7Z0WnjBQMiJE6VzDROjw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2B5251F00A00;
	Fri, 20 Nov 2026 15:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795189965;
	bh=qmH6LAhqBr/82ZqBS4NPxlHrXW3U07fvSK4Pufu8P6A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hU+hKn+OUDbw1s+TmWsYDxI1qQUx7vjpxZG2umMGJa3GIVjaY/fb96Kn1gINNo4bh
	 zhrL7Do+Ao5vL2jM/mZj6GPbrWqos/BQuHK6+vCVxnVQE+rezpaBAUK7/TWDa5yo07
	 R4xGkzQQleoJ2wnRfsbla4sxa4T3kz8AjMvdkojsX/0OFUi2NtJB9PZm0R7itLJ8oz
	 18tIh98koYWWb0RE+NZIMsEfJ5oiMkYtB5aht+xIiwBCNca4RrU/q1KoxRoBKVijrS
	 KmlBHXsZWsVhREh7PXWbAuahk1HS0WaQYugrXc/2xsacjLIhoTYcW+pF9+KNlNzH4z
	 0/4SMTn57pLBQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id ACA4F4991B;
	Fri, 20 Nov 2026 15:52:32 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Fri, 20 Nov 2026 21:22:32 +0530
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom: sm8450-gpucc: Add Molokai
 GPU clock controller
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-molokai-gpucc-v2-1-e84a0869693f@yahoo.com>
References: <20261120-molokai-gpucc-v2-0-e84a0869693f@yahoo.com>
In-Reply-To: <20261120-molokai-gpucc-v2-0-e84a0869693f@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795189951; l=1030;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=mrnaKyCtbWSwBM2yUM7bnJR1s3HBh1dB6OxsmcKviJI=;
 b=KFmW5iJ6agI7hpK/RGAm5p54LteBoOfdvLHa3hx4hr3oti2UmyKdJBx/8AD/KiMA7y4grBqR4
 P469yLnQ0iMBQBiCaNnONs7IwE9j0P23c8hZoChJVUsZeOsOpVPRpm/
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Document the graphics clock controller of the Qualcomm Molokai (SM8845)
SoC. It is the Kaanapali one with a different PLL configuration and three
branch clocks at different offsets, so it is not compatible with it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index 7eca456211e4..e62e6127b06f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -37,6 +37,7 @@ properties:
       - qcom,glymur-gpucc
       - qcom,kaanapali-gpucc
       - qcom,milos-gpucc
+      - qcom,molokai-gpucc
       - qcom,nord-gpu2cc
       - qcom,nord-gpucc
       - qcom,sar2130p-gpucc

-- 
2.56.1


