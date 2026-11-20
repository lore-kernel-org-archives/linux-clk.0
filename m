Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795189962;
	b=XTBBqeehpKgKwjyUXTv1CcVfhxTyfDCbiP4KPIGz+NXDG3H+L3YlHpgQQZyy6tGAfE2z
	 aYDEc9txHJY4IJCYeJF2K6o1cpTkXTHr2TSQ2xNlYkVL8F083o9GWiYgLzlguGegiP/aG
	 ZcbxaFE75063QIbMrux6jjP/fD7TPmGAu48RHhsYf4a97vF7UrCZudXtDY5advpekwt8U
	 N9CiasQsWFYFhnsovld3Of4dFWz+GU8vbAupwLIClmWktp4M2d5+EOV6NHmgH6dTwihFi
	 1X3Xc1Z+g6CPTmMGwCCDS0TsPwB8FhigDnXkyBObgQ2SoVo5LXkI9xesyminiDLY2nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189962;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=rwk/IZ04HWvBuJL602ZrjNQqeqQeaDL07rkFRXUJavk=;
	b=eGYlpZkRu23haeNaEYz75yTG4kVQjd4PV2XYYcVFhzn0WTZ6FouTVMj62b7BZ+UQPBa3
	 IkE3hRaH5rGi+Kpaarw7BpsR7qPDNiuIZYP07L6oltZKT0j0RTUkxn5r8unwaZI7AUlpZ
	 JoQTKhnaJHU7msvsL42C9vtEVX7c0SwRxJNnUebcDmGlCXcl0j5vRijVbCpmuRaXrjeea
	 lFQiUULqs9NnSC8T94KBf1/nsFwJHcJf4qftBqdaYCC9g6nQ12CA0/5cSkNxIPgrqys7u
	 zXaglFc1a2l3o8AoVeKS2/MooNNgJPLRWT68eYCGyp4gp3LvMPNfYGke3Lsf19BPVFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LdIZo0d1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877F6606A33E;
	Fri, 20 Nov 2026 15:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LdIZo0d1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795189962;
	b=ABmCB6HupezdtURuVgvUkmtMPwXRKsZRAjPkjw1IsJLZaHBE7oqvzIVPCMrKf1cZIz1W
	 4Cn/DSAv7wQvN1mCjvl4JqdokcXz0TFfViw9s3Z6X41p98bQkwl6sIkcuOK6U5syuK6Lr
	 4FQWW0wgMfQyZ89IPDoieB91/uChTCesW//9EpfmqVZPYiF5oT2gspzRzFJ5H+v0vpt9x
	 kFo+jiy/taolenIEZXDlGsJw97A6vQr2TquNadzbq2Dhnj0GjAVPgXuqDTB7vwAIKVpNJ
	 VaYcrceRLjgiYPdugmrb0BnZs/CIE+1DH84UxhOQBUf56RwQa2x2h+47qrL85TEVNEg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795189962;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=rwk/IZ04HWvBuJL602ZrjNQqeqQeaDL07rkFRXUJavk=;
	b=hisF9vYkrgeRGh/BVV3etCi4aqvfI/j9dlC78xonoO/KjgsMB0Hu3H0NPnI6oXCTwIii
	 1deGcRbncIQhV4ylwj1g5HaROtAYhM4ALIEV8xgDcGLQUgPMlKI9wS04emsn0m0j+JLzh
	 OF00+UlfjycSg5wsKj+5Tn1kHWdHz739mGpNhumi/+XPlug16ZgQX0OlJ5QlG94YSkhw8
	 ToQzn3GeAYQyXATk+pHaYKn7sk3Zj6lpRx8SHscjpx1c473BqKkd5JIcWnUYsPYWdNgPL
	 kQFSHGvKyOBQ11Ctim1L/HnhDqCIv8BHUe+N1yxvIul62fDmuyhjc3t2QGrZ1HDTWYw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1319F1F0093E;
	Fri, 20 Nov 2026 15:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795189962;
	bh=rwk/IZ04HWvBuJL602ZrjNQqeqQeaDL07rkFRXUJavk=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=LdIZo0d1VQDQH19jol3e/Qbp6UmtZyrbRz8Rz7ywKvrLffJ0iD2yh8GY5N5oKt3sv
	 6LuUW5nhlNonVcLbZMx5dDuW0/w3QmrGjZ4KSR09YfleZZ2K8RNrjYWXXfOTImJUp2
	 E2C+NdEiqmCW3ZGvo518VvUOkUc/jmdFELUZNS5HZSb6wuZgnCzQibdiu4LwwRQ825
	 mmZjuB2NjZiPqpOgYF5sGYue22ap88gaiJg4GNACjhtQadpV4gv0qn/+c2fhqluKXR
	 kjpmg8cJZBJppTrY/e66V/ogCMUnCr7YEyyShuMuQ42mk3c3rs9kIVE2/oRq1g19G9
	 cXSJ4mm26FPbA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 930DC49917;
	Fri, 20 Nov 2026 15:52:32 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Subject: [PATCH v2 0/2] clk: qcom: Add the Molokai GPU clock controller
Date: Fri, 20 Nov 2026 21:22:31 +0530
Message-Id: <20261120-molokai-gpucc-v2-0-e84a0869693f@yahoo.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0JmbQ0tgRJX3sOwaKcDVIUhLRAJ4
 e4Crl2+5P33V4gUPEW4JSsEmn303O+gLglga/qGhHc7g0pVIaUsRMdvfhkvmmFCFM6QdUrnpc0
 d7JshUO0/Z+9R/ThO9kk4HpHDaH0cOSzn4SwP7197liIVqUab2TrTqMv7YlrmK3IH1bZtXxM6x
 kG8AAAA
X-Change-ID: 20261116-molokai-gpucc-daebd2758b5d
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
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795189951; l=2096;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=IbD6OD7HPieTPh5DKfBJNtgPhbtkZR1mkHtbNkKgxGQ=;
 b=3iCV7kO9rnXh95d47GWcwzRcPpPPcHmNwx3kDaguPIlP2fJPegHrmgXFiL13WrZbV9vN23N3f
 nh00OkXHp27AC6D2ToBjFbQs/KxipWIVugfCEWL335XdOW0eLdJLfsf
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com

The graphics clock controller of the Qualcomm Molokai (SM8845) SoC is the
Kaanapali one, except for the PLL0 CONFIG_CTL_HI value and three branch
clocks that sit one register further. This documents a compatible for it
and handles it in the Kaanapali driver.

The SoC devicetree that uses it is sent separately in "Add support for
the Qualcomm Molokai (SM8845) and the Motorola Signature".

Tested on the Motorola Signature: the GPU clocks come up and the Adreno
829 runs.

I used an LLM (Claude) to help write these patches and their commit
messages. I reviewed all of them and tested the result on the device.

---
Changes in v2:
- Drop the Assisted-by trailers and the LLM notes from the commit
  messages, the LLM use is stated in this cover letter (Krzysztof).
- Pick up the Acked-by of Krzysztof and the Reviewed-by of Abel.
- Link to v1: https://patch.msgid.link/20261116-molokai-gpucc-v1-0-07cb3bf37c78@yahoo.com

To: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney+clk@redhat.com>
To: Jerome Brunet <jbrunet+clk@baylibre.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Venkat Yadlapati (2):
      dt-bindings: clock: qcom: sm8450-gpucc: Add Molokai GPU clock controller
      clk: qcom: gpucc-kaanapali: Add support for Molokai

 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  1 +
 drivers/clk/qcom/Kconfig                           |  3 ++-
 drivers/clk/qcom/gpucc-kaanapali.c                 | 25 ++++++++++++++++++++++
 3 files changed, 28 insertions(+), 1 deletion(-)
---
base-commit: 6a876df4686788cd39128b62d7fcbff62f39278f
change-id: 20261116-molokai-gpucc-daebd2758b5d

Best regards,
--  
Venkat Yadlapati <venkat.yadlapati@yahoo.com>


