Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458880;
	b=DMHo4fl4rhUo+xV3oUZhXO3722ebKmXOBSov1zVdobLg+MrBcu4j7El3nWuqhd4j9ZwT
	 9sqmfcv6EowOr9j0O0F0Hs2RIc/JflWej/y7LDaKm9MFSx8SGF1C60sTIQJXR+3azEgcA
	 KVQZOyBvF4bKc/Ify9D3Rb608mdVN2l+5sRZJf0SxsRCOb5khhNXf6605FW4d8ynQ91nY
	 kKjAiJ3WuuCpWEVh89aVk3E10T7MbzNFVdNvVlGUWIb1AKdI5OF5+sZXTCgysaB4OmrFX
	 OuXduxM9U31vZy53OUPJ2OunqnnGxRurO3x/zQED6Py60L3P5fG798mu848xcIOOz2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458880;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=u74P7Fb2tSqMkNPyVoCPwgxxp62ZMUbZoEGO5Yb1GpA=;
	b=VvyPsG1bJ2Pl+zZ1TrMhwV5zJfyMSVjtbkr9Vnz9kOy7/Evfcu/jBDuuAekRsy924h9Q
	 dYxq68AGg0lLdNY7TaPKiQH2rZg9AEWxKrzCpQQlrnJKyhCuuTNsVvWb7+A9hLgOSd8OM
	 hjWZdvMagX3o6tkFPBeUNl6oYlmZgNl8kuWOHx9HUYjUX4VAhEh1xPGywmh+HCj0MPpuQ
	 xafHRLzdwLZ6CQlfUpjFiyZMRNJIBqW7WJ6s1N+j0CiTAyMQ/x7W/SoLxEz7Puo2VzViU
	 bFWakInoYAqKyIqsIUdZ2iw2R74qtL1yy4Zq2RYEH4UQAkhSRyGikds2V16KdO0ixWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VXQs174V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09948606A333;
	Mon, 23 Nov 2026 18:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VXQs174V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0879E1F000D8;
	Mon, 23 Nov 2026 18:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795458879;
	bh=u74P7Fb2tSqMkNPyVoCPwgxxp62ZMUbZoEGO5Yb1GpA=;
	h=From:Subject:Date:To:Cc;
	b=VXQs174Vg7P+2nmMxTDeq060jutvdK8M1T9LbTrHe4K44Rz4iQOqvXOhW0rzaeTJ9
	 MrlSrhx0jpcgKT9WPjv0ruWosQAUGqfcahSLxUwswawco2iny8gYJ9nk1BDf7Lou8C
	 OXNBq2I2U854NO8vSgb3e77pNXQiRck+fmbMUKmX4N2VKgiJliNUpbU/zs8uHTZDc+
	 A6duP4T5DHuoByColpYk8Jy5QPhOx1Lf72vSq3jYa7Y0FC6cLE60EDoRSTpJ04zWGe
	 j7A3rcfbiQX/4AuoMBhT23JXIX1gU+4tyrfB1Z/PEe9IeNAfYJ7EYvk26/0hUWcxgT
	 AW9KdVXwKpjbQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/4] Glymur USB4 clock fixups
Date: Mon, 23 Nov 2026 19:34:30 +0100
Message-Id: <20261123-topic-usb4_clks-v1-0-531ab5635c03@oss.qualcomm.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrBswMUjtVUoRM53UsSWRjJaC5
 O6munyL/zcQSkwCt2qDRF8WjqFAXyrAcQgvUvwsBlObVmvTqCXOjGoVZ3v8vEV16I21Hflr66F
 UcyLPv+N4f5yW1U2Ey38DOe/qbCfzcwAAAA==
X-Change-ID: 20261123-topic-usb4_clks-9cf2449ef86f
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: usb4-upstream@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795458875; l=876;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=Zp+ZFhIE37RkCkN3mhLrB0wkbQLpf8rOnwuUvRZSlz8=;
 b=Lsny5KZEKs3Zlt0oshM2SExyV6RTKvqI93seOJRbQDEdlvyQ7XLvQ10+W05CU+br0q88jD8fp
 DSRtVwBGKwXB3W+25SNmGWZ0Ei22VUmI/vu9cJTUdyMXiq9Wqx8BZvm
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

In preparation for supporting USB4, some clock driver fixups are
necessary. This is an echo of a previous series regarding Hamoa.

No dependencies.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (4):
      dt-bindings: clock: qcom,glymur-gcc: Add missing USB4 resets
      clk: qcom: gcc-glymur: Add missing USB4 resets
      clk: qcom: gcc-glymur: Set FORCE_MEM_ON for USB4 uC clocks
      clk: qcom: gcc-glymur: Convert USB4 clocks to use phymux ops

 drivers/clk/qcom/gcc-glymur.c               | 184 ++++++++++++----------------
 include/dt-bindings/clock/qcom,glymur-gcc.h |  36 ++++++
 2 files changed, 112 insertions(+), 108 deletions(-)
---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261123-topic-usb4_clks-9cf2449ef86f

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

