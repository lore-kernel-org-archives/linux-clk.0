Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794773968;
	b=TyocSVwMS/uBWGTxmxPwz/yQ0c8PGPLZOBSjSs27x+YvIuHas+wJmYPku0rsgJ9u044L
	 ltqmPw94R8It1oizn7Pd3+MYuHCEH6PHTXubWyjhBeOsDA2wjAUBhn0hL6thK2k+RuJz2
	 m/l3U2QVGU5PZR5qt6CB6sC4Xv3RNS5kkJPApac/RmnL5IhD0esM+e+wbXcuRKw9yJTVA
	 NZNvOwsJP+VVtM0YRNiTSecZdC8x3q+X7mSV/8A+7etRKNQZ9PYrvtZF7rJ7W31AdtwBw
	 a4MSxj7EQK5jYxcmqWu/UZI5Iuu7sCHCuVFSfYd0Ma36fprKbGtgeY5yGj97sRFDpVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794773968;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7ndt2cfEqLXAyi5+BTS23mgZKfifPOIvVbQiP/cMxMY=;
	b=W510nY40O2pyXkbXGgjGZz8eXxMvWgq3OqGrM3AQoxnJwb2BfSCaDi8BFCG3H9DY5/bS
	 QhTXIYuA/d/kt5+s1oInxey8jE7gqCy59Xg7fAvHZLM9jZahZvj/ZijPz1vT5QQbVVtfn
	 CZVLy0fD+GOjk+h4YHD3zs01+Oxf79mmGICNASoggx65K9Z0cHHLJN8K2GubKLU0+li/z
	 3m3wtcaySGyC97bhdOBJn90T1ezWg12nC3rp14amdA8ssSA+AA01b55a0Ru7+s+NlJhnz
	 ovD9pb9hY5X27GzRAWzq9SunzOb7HjI4sPvTK4BwpS6WAgZKzUe3nlPlTolB1FTe9xQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DC18DA7M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A7B606A336;
	Sun, 15 Nov 2026 20:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DC18DA7M
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794773968;
	b=GjUYHjo4BkyvOZmxuPPJ+o70rezCk9AWioX3ClUf1AyIdidoZ2NZ7qUZDfqaUBf2yyWc
	 qOqzDuiwKyh4iclMDtGtbkifRxN/1NJWm+XfM6fhPqOloeRFv3MB6LzdzDcoPfAF9coZU
	 CDwwOforBGCa7Sy8ddO6Nftbj3CjBqzpuR/IRF+XzRZkVI413T3rNzJuRNLQP0NJfS4Ej
	 sW0v6x6xX/yfbLxXBHdMqzHYO3DmngKMntoYbF8y2PkFjfg+bAckU0tKG35ncuXAV1QI4
	 jQAU++aLrOfg0WhZurOv6fcOti+YBVWJfiQ4FADKnsvNURKhiiE0ioHKfKj4w+4nHpg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794773968;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7ndt2cfEqLXAyi5+BTS23mgZKfifPOIvVbQiP/cMxMY=;
	b=kaj619dSFM/7X63ukZdGTevbZSXOIqpGt6lKTTsNOckYVWC/8/Uvz3wzotLuXFhotHW1
	 bzLzrVpaA7DoV+w667h66SZ4coujmZB4ZIk4jvvuGevz1kn19Kis+nzI/SSK1zBEbVi20
	 4y+e/BkbSgAB/VAavZM8WuIaPNoBmR89ya37luXszsgA23QQRcrxB2Pj7SntkR58orR5n
	 LaSD7wEM2dxPUF72jRobsYrbPIv4P7+tzHpKlGUiwjFxL2ywkDbfylS0lksRL3a269KWe
	 uw8ud/7eAkVm1qdgGav2FKFHsajKx/mnT8bw5wjGy2pLLCQbrmdnJH9TpG0X2xtfTBQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E43081F0092A;
	Sun, 15 Nov 2026 20:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794773968;
	bh=7ndt2cfEqLXAyi5+BTS23mgZKfifPOIvVbQiP/cMxMY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=DC18DA7MNm1nXH7eCoQXWPO3t8aiXpn+wfSJLsor9sOg3cCqPNGB41guVEz0hWLYE
	 M+/wVwklaI+4Buda1ef8f31iEeawKBxXFGID0tgfD0nkRxMonuDF1Fpct0z4hxqVNt
	 SmKpZ9z1nKVMf4fUThlt60JaIrrOcN9ccFTwKrRaZQo6GCvb6+YeK/+IH8hrDRZXFy
	 QLtSJ4ezXRPFjX46DoF96+9fsI8IMnYpJ7HFk/UGoCvIVRxv+6PNw5NAFuI5K4UbGr
	 WEJ/APr3D45+jZcPyIe/TjvxlSgPyWPxjgZEjjU/Kb8N1qa6qSD774TqnnPq4noQCM
	 ErVZwdPHA9VaQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7116E4A194;
	Sun, 15 Nov 2026 20:19:27 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 01:49:27 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: sm8450-gpucc: Add Molokai
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
Message-Id: <20261116-molokai-gpucc-v1-1-07cb3bf37c78@yahoo.com>
References: <20261116-molokai-gpucc-v1-0-07cb3bf37c78@yahoo.com>
In-Reply-To: <20261116-molokai-gpucc-v1-0-07cb3bf37c78@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794773966; l=1014;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=e0GmbRVbOneNgtdi0twGJ0KyCrMgnbqGUTQplz7+HHk=;
 b=KeSbHUuS2dURMP2SyRTWeJtBpjccQkUq2fxIYif0kcWMqbjW6DNhetYxb7Nw16hXVcG6n0CAf
 1BEDGnfvLBQAAQOm3gweBZOHEtB2xyRBn0j6PqxxbmJSnMkcgFN0014
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

An LLM was used to help write this commit message.

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
2.56.0


