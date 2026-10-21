Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792586409;
	b=L3r+firjKFUMLJMVwjMfYJi3ufoF1zPkHD0Pl1RQKzBfwzc6zQpcnsVMetTqOU9Mp3c4
	 SmYz6Lgz4NcAtdDkM+DJjXPCtxiZ+Opv9dw5j83sZ3vN72ZP9iYy4jDxaB4n3ERUjUTX/
	 Ly1BCNWdIuFJDHANXFS6swASe1V5Unzcurrj/8xrZx5gRz/5EkCPesrJaCWNfzA6/CxV9
	 iuWUcKcw3/dA6P4axeoGvXrFvysTkv8T49yWZadZJTIwe0/NmBhkcIJCxei5ngKHtdDa5
	 ha4JroWAAKZUAJs1P7/ICzqeFX2FxJxHQbcltac+fD+F06pc71Cb5GbYcop9/IsJ1iQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586409;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=HPF1p/KNCNvzETHQzlHbHSIfyjqLmo8piWtl7p9FoBU=;
	b=Nm11dLu4mBzEGiof2bN69by16OykHq7UFkYkylhBV7q86E98456eeJ8QMPdsX7b/8+Qm
	 wsAo7nYpc/dXczhOzq8xr8YYIqgNAqwIKRwiMpXij4UjTZI9gJZLYuP3Bu+o6lkT53LfH
	 G4xJHUgMmcTKT1UYWFIqeqS34T7Uy+nZ20COUhFRO/safryDMcUcBg4wuxDzMPCwJD3wd
	 vTQwIeUH2eplq/GQ72kUEtP8L9Lc0aSjfOQOC45jMk0knMgXHmxR6o9RL57UBM2wE9rce
	 xsjhgsOYFITjndelqLaCvuhs7R+knOdiltpxeDpkvYnLNVhWK2uxlMLsETGUMYGMbPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RvCHXDjd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED87606A324;
	Wed, 21 Oct 2026 12:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RvCHXDjd
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792586408;
	b=Muh9OWMIOrH7oU3d2+ljXahomcXHxhBfy0WTPoPRsqSyylxVxgyZ6Ba0KF8KWRRHP58p
	 N7rG49pZsthCIdX1FH6kYIHl4AzWPu3KctqVAQK0jMvYOFwfwnQudFdniMgs7q7O4BmTG
	 6FCCqilC1yQ0Aov5dCGQ+2vkwYlvqi8FHRZmEIcOy6yc7BXnlo4dwUgnF5UHKkGHc+U3q
	 NbFBi35zNdpexi9xhCZwBZo90MOgS+PqTFXLY7YUHlFr7I80ZMoHg66EWcEymOieMJtqX
	 SX5cLd6uucIOAhfsVNWFnoQ+hHFpsbTf1OvDfL44D4ND/fpdGEAj7YLUz0ls/iw5bqA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792586408;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=HPF1p/KNCNvzETHQzlHbHSIfyjqLmo8piWtl7p9FoBU=;
	b=XkKXBVFY6zTycye5GwG11ceN/CWNBIcKCItq2iGIt8iZ0qAe/iCfTj5cm0TtcpfelQqj
	 3sN1OxgUev+4qKVDYEG/1ibEESqKM1DoG7cffDUmwLJctrMkDgGN4wGUxcTfgqPHmwrkW
	 4NJa14Z3qgIlFYYBacsZh9KffJrVH38BP/KaRdl59efCrplUfv9dXYc76VSU7V20B0qIz
	 TmG3PkUlo9dQZhpPsRYJ5mbmtgf3IZYkM61vAahQPXuity7oA8n9+NEIHvUKSlco+DDtj
	 wwKmUZj42KDI+Qq1JciOiGJtmy1xaH9GYM3hSWDuLKUQ8FL+GOiNCWRcko69u+69LCg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6CF5D1F000C6;
	Wed, 21 Oct 2026 12:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792586408;
	bh=HPF1p/KNCNvzETHQzlHbHSIfyjqLmo8piWtl7p9FoBU=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=RvCHXDjdvYYRQ60QUPTmXcwkgpolxeYXdv5N4h+DmlXfSrwbwTEwhZd39x5o2mN+N
	 CBYr5aC/eiK+SdAy4om59iFF8lIkMKrKJyIfaxQRv9McPpX3QqZbwlycGj8Y5iRDTV
	 B8GuICe0OMm+ADsQrDefGBa8nJ8LCSqeOOfW1CnsAAXH2leZiVWbUlrP8rgm5E7Hog
	 ApqvOXXOw/lQfXMQwy+j70N+8PrxlrrRZT00SYkIIHOU7iPYGydFpgnvliYBw7nDi6
	 vssQ2ikvDpCE1fTSvDb7sRZU8qroiLUZb8OIGeC5IkDRN3ZoFE6vQSWSgQyOpHhaK6
	 VO4BxmD+QUAcg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C173C43365;
	Wed, 21 Oct 2026 12:40:06 +0000 (UTC)
From: Sarath Ganapathiraju via B4 Relay <devnull+sarath.ganapathiraju.oss.qualcomm.com@kernel.org>
Subject: [PATCH v12 0/2] Add LPASS VA CSR HeartBeat pulse clock support
Date: Wed, 21 Oct 2026 18:10:05 +0530
Message-Id: <20261021-master-v12-0-9b3df51fd1d7@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAKWy2GoC/3XOwW7CMAwG4FdBOS/IdhUS78R7TDuE1B2ZVgpJq
 TahvjsJSB3SxiWSo//77YvKkqJk9bq6qCRTzHE4lAHpZaXC3h8+RMe2fCgC2gCj1b3PoyS9CWS
 t64z17FUJH5N08fvW9PZ+n/N59ylhrLom9jGPQ/q5rZpczf0pnZwG7ahpKZgWGPx2yHl9OvuvM
 PT9ujyqdk/8oMktmoumclYH3LEHfqIRHngDC0coHsEQ2F0wZM0zj4tHQPr1WL0BYGkk+ND84+d
 5vgLXT1W1dAEAAA==
X-Change-ID: 20260917-master-6c2778f57a9a
To: andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org, 
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, 
 srinivas.kandagatla@oss.qualcomm.com, sarath.ganapathiraju@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 prasad.kumpatla@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792586405; l=6029;
 i=sarath.ganapathiraju@oss.qualcomm.com; s=default;
 h=from:subject:message-id;
 bh=MIp0PUPBGFUPDrO/evYhVpKxTuVZhOJ9e9YQIHwHSIw=;
 b=YJJKiKzMQwMXN8hjydy8WPMwFKwDQELLEJVAW7xfnvoFqdBW6FGSSw0ToRZiL03LqWoWMfwYT
 BGACJuh0Th6DKaZYUhKQb+OcNFMcD+LHJO3fr5y9HwKDnb+fSFZMJ/7
X-Developer-Key: i=sarath.ganapathiraju@oss.qualcomm.com; a=ed25519;
 pk=4p2FWGXM+F2sir13Lu5stw5aKX5trUymK/ttESvgxQg=
X-Endpoint-Received: by B4 Relay for
 sarath.ganapathiraju@oss.qualcomm.com/default with auth_id=870
X-Original-From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Reply-To: sarath.ganapathiraju@oss.qualcomm.com

The LPASS VA CSR block contains rate generator hardware that produces
a HeartBeat Pulse (also known as RateGen Pulse). This pulse
synchronizes the start of the DMAs and Codec Interfaces for the audio
usecases and can serve as a periodic wakeup source for the DSP.

This series adds the DT binding and driver support to model this
rate generator as a clock provider.

Patch 1 adds the YAML binding for the new qcom,hawi-lpass-va-csr
clock provider node under Documentation/devicetree/bindings/clock/.

Patch 2 adds the lpass-va-csr driver under drivers/clk/qcom that
registers the lpass_heartbeat_pulse clock and enables/disables the
rate generator via regmap when the clock consumer requests it.

Changes in v12:
- Rebase the series on linux-next next-20261020.
- Depend on PM_CLK so COMPILE_TEST builds cannot select the driver when
  pm_clk_suspend() and pm_clk_resume() are unavailable (Sashiko, LKP).
- Link to v11: https://patch.msgid.link/20261012-master-v11-0-15009e3ecac3@oss.qualcomm.com

Changes in v11:
- Rebase the series on linux-next next-20261009.
- Drop the custom heartbeat prepare/unprepare callbacks and rely on CCF
  provider runtime PM handling (Ajay).
- Restore the rate generator counter and delay registers from the
  runtime resume callback after the LPASS vote clocks are enabled
  (Sashiko).
- Add an of_device_get_match_data() NULL guard (Sashiko).
- Link to v10: https://patch.msgid.link/20260930-master-v10-0-105207bc5275@oss.qualcomm.com

Changes in v10:
- Rebase the series on linux-next next-20260929.
- Add clk_is_enabled_regmap() to report the heartbeat gate state for
  clk_disable_unused() (Sashiko).
- Add Rob's Reviewed-by tag to the binding patch.
- Link to v9: https://patch.msgid.link/20260928-master-v9-0-2277f09f9a09@oss.qualcomm.com

Changes in v9:
- Rebase the series on linux-next next-20260928.
- Add runtime PM callbacks so the LPASS LPR and audio vote clocks are
  enabled by pm_runtime_resume_and_get() before touching VA CSR
  registers.
- Keep the LPASS vote clocks enabled across heartbeat clock
  enable/disable register accesses by taking a runtime PM reference from
  the heartbeat clock prepare path.
- Use synchronous runtime PM put on probe success and error paths.
- Drop the one-use runtime PM error label while keeping synchronous puts (Konrad).
- Wrap the runtime PM ops with pm_ptr() from HTML review.
- Link to v8: https://patch.msgid.link/20260917-master-v8-0-823d2c5d090a@oss.qualcomm.com

Changes in v8:
- Rebase the series on linux-next next-20260916.
- Require the LPASS LPR and audio vote clocks to access VA CSR
  register space safely.
- Attach the DT vote clocks to runtime PM and resume the device before
  programming the rate generator registers.
- Program the counter and delay registers once during probe.
- Use qcom's simple regmap gate ops for the enable bit (Srinivas).
- Drop the unreachable of_device_get_match_data() NULL check (Srinivas).
- Drop stale Reviewed-by/Tested-by tags after the binding and driver
  changes.
- Link to v7: https://patch.msgid.link/20260831-heartbeat-v7-next-20260828-v7-0-e3ffeac46a51@oss.qualcomm.com

Changes in v7:
- Rebase the series on linux-next next-20260828.
- Add Prasad's Reviewed-by and Tested-by tags to patch 2.
- Link to v6: https://patch.msgid.link/20260821-heartbeat-v6-next-20260821-send-v6-0-62c5df84ce21@oss.qualcomm.com

Changes in v6:
- Rebase the series on linux-next next-20260821.
- Capitalize Hawi in binding text (Bjorn).
- Simplify the binding example by removing the soc wrapper and
  two-cell address/size setup (Bjorn).
- Keep the full VA CSR register window in the binding and describe it
  as the VA CSR register block after Konrad clarified the earlier
  register-range concern (Bjorn, Konrad).
- Link to v5: https://patch.msgid.link/20260806-master-20260805-sync-v5-0-0ff42e9b6431@oss.qualcomm.com

Changes in v5:
- Add explicit ARM64 Kconfig gating and Qualcomm default-module policy
  for QCOM_CLK_LPASS_HEARTBEAT_PULSE to align with nearby qcom clock
  entries.
- Link to v4: https://patch.msgid.link/20260805-master-20260805-sync-v4-0-dfbcbf427c2c@oss.qualcomm.com

Changes in v4:
- Rename the binding filename and schema ID to hawi-specific naming:
  qcom,lpass-va-csr.yaml -> qcom,hawi-lpass-va-csr.yaml (Krzysztof).
- Rename Kconfig symbol QCOM_CLK_LPASS_VA_CSR to
  QCOM_CLK_LPASS_HEARTBEAT_PULSE (Konrad).
- Add devm_pm_runtime_enable() in the lpass-va-csr probe path.
- Drop the qcom,lpass-va-macro binding extension patch; it will be
  resubmitted with the Hawi DTSI changes.
- Drop sound/soc/codecs/Kconfig select wiring to keep this series
  clock-only (Konrad).
- Link to v3: https://lore.kernel.org/all/20260723-master-v3-0-3d67b79b0515@oss.qualcomm.com/

Changes in v3:
- Move the qcom,lpass-va-csr binding under
  Documentation/devicetree/bindings/clock/ (Krzysztof).
- Move the driver under drivers/clk/qcom/ (Krzysztof).
- Improve the schema description and use generic clock-controller node
  naming (Krzysztof).
- Use additionalProperties: false and keep compatibles sorted.

Changes in v2:
- Split the qcom,lpass-va-csr and qcom,lpass-va-macro bindings into
  separate patches.

Changes in v1:
- Initial version

Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
---
Sarath Ganapathiraju (2):
      dt-bindings: clock: qcom: Add LPASS VA CSR HeartBeat pulse clock
      clk: qcom: Add LPASS VA CSR heartbeat pulse clock

 .../bindings/clock/qcom,hawi-lpass-va-csr.yaml     |  62 +++++++
 drivers/clk/qcom/Kconfig                           |  15 ++
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/lpass-va-csr.c                    | 180 +++++++++++++++++++++
 4 files changed, 258 insertions(+)
---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20260917-master-6c2778f57a9a

Best regards,
--  
Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>


