Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D52F3A89AE;
	Tue, 20 Jan 2026 11:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768907988; cv=none; b=rww+pO/bZz0UMo6C5YJ+s0STSczO0PxbOEi+U2Rr82vPE2NaDvKrcykKy0DlzIB+JcOagFa4HaNwRfk5y/RmedHOxbdNI7NZL9YRgdLgdLDYjvCexHB3SAJNjKaJHSVIRyT3SQjw9wDS3Pu/l8h4EQ3xx5NU8/5c0EStZIXslME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768907988; c=relaxed/simple;
	bh=uOlfU+Hb7Bl4W3vmO/dAEHDKcQEbU1mp+CBkjGY54Hs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kHsj7lLt78hRh92OrQ0HAi5+JXhBYqBl93GVdmObnMp3lA7rfflpQMyYfc20It8m3Wmivf/kGNGJGMOrie2lTvvpqwQSU/6WbXglYayYC+G7pNUbHGYRR4uLOqIQLkpws+wNnGX+n4rf1n7FpFhaiICKXofXVUjoH9ldqSHvGe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZnGt+DZ9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZnGt+DZ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE7A3C16AAE;
	Tue, 20 Jan 2026 11:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768907987;
	bh=uOlfU+Hb7Bl4W3vmO/dAEHDKcQEbU1mp+CBkjGY54Hs=;
	h=From:Subject:Date:To:Cc:From;
	b=ZnGt+DZ98/xLmQaAiCZECtrkbOEJNdLIuowooNcLUluIdg6qx+O2Qr2Tz0t7z/b4G
	 F3KOMFhUG0gvPINJdGXe8lxFewyVstBZ3Xq9/nqOf6R5i5/rRKtEW1bhG/J2OkFHjz
	 jmH1/hmeXks9gF75LnCMx2QXe2FtCcatu3NtGiVp/qIKusAWlorJx5eBaXqHziNoIv
	 8AAFNKlGTgdYwuG4kVk/qkH51HJxVoFx7PTSbRgvjEWhSPoSeZ0ysQwYgJ0HjWt2Jk
	 9OV8U5CqDDP9A/I4Q7Qx01RZbMOCxXUf/5KeDjWoQ9tdbzo9hw+c4yPI+dcyvbn1Bn
	 kkut/fHudHXkA==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/3] SC7180 MDSS core reset
Date: Tue, 20 Jan 2026 12:19:24 +0100
Message-Id: <20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBN0oKyuEiE1jjWbEo0IorsnL
 d/i/wcyJ+EMQ/VA4kuyHHuBqSugbd5XVuKLATW22qBW5xGFlDWddl5yJHILJRXsTNgQmtD1UNq
 YOMj9f8fpfT8NIjM0ZwAAAA==
X-Change-ID: 20260120-topic-7180_dispcc_bcr-f7ac25c21f89
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 cros-qcom-dts-watchers@chromium.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Kalyan Thota <quic_kalyant@quicinc.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Harigovindan P <harigovi@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Val Packett <val@packett.cool>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768907983; l=814;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=uOlfU+Hb7Bl4W3vmO/dAEHDKcQEbU1mp+CBkjGY54Hs=;
 b=T7KQRiJd3SSpYij181J4ZmS1C9VHmYg6F7VNuZdC9dbGZC+3d1MP7fkUqj4w19bY7IVihg3vu
 YMLisOS1+3UD7FtbpfEMnYoMLomtEAQEkYk+ptmAYEQSq6I/PdN2743
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Add the missing reset for the display subsystem and wire it up, so that
drivers can consume it.

Compile-tested only.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (3):
      dt-bindings: clock: qcom,dispcc-sc7180: Define MDSS resets
      clk: qcom: dispcc-sc7180: Add missing MDSS resets
      arm64: dts: qcom: sc7180: Add missing MDSS core reset

 arch/arm64/boot/dts/qcom/sc7180.dtsi           | 2 ++
 drivers/clk/qcom/dispcc-sc7180.c               | 8 ++++++++
 include/dt-bindings/clock/qcom,dispcc-sc7180.h | 7 ++++++-
 3 files changed, 16 insertions(+), 1 deletion(-)
---
base-commit: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
change-id: 20260120-topic-7180_dispcc_bcr-f7ac25c21f89

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

