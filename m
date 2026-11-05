Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793855698;
	b=y7/yATj4j9bdehGFHVjYo7ObgJDnjrhJ2CVqU8AUQFL+5awcR/rvF85MPsR6e/OgmfJ0
	 Aqcm+cWw5oRM9guR2/Fmh6n/xGdyLWVOTCcBIJo2Peo4vsvkHNaSy/72BNCy8QLz9NmUQ
	 FoOJJy5/HdaR5GhcZzRSKI+u/EwfWdVBJdfMr/HlbPmdt47DKO3BX7R4JEjGGoEfqm0Xn
	 2rvXYt8osNzHK7Vo9oY5rq5/RF+PT2xltlzq+aNUvv+iVO104xRHxv+iMuZwIngMqvMWZ
	 xaCLYYepuX2JuWFp0NEV+J+Bsk9z5KkVBrXtvF3Zc9aT3Qbf+DiBUzxRqCj2o/x+e+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855698;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=dt/PcsvHanmEqsvPR5LxzzOntC1t3hrn298VcvvmxNM=;
	b=jvWJbo2iLKW2e7P0dz0/8VoJIM3bZhvgJGt1Wjpa0WwUdsVv7KenDx8BEKQg1PylI2Tn
	 /yMiVH7s243th6RC+juM1c4VBv8C06YpV69CFwT/4Tv9PWdK1XVZNUUKG4RsLii4JXcEP
	 hzEf0n9E3lNYfc4jMNsV/Exe09GF8ic3EONjqHjzLdwxjiALIU+K5lMpwug3UXM4EmSoE
	 T5cVwG66Be6e+hFpnnyMYVVM49JflIDaT6e/Y2ifoptvbnPNKPjfK219KQaE1v/MbBWgh
	 t+o77qF12UzXxm+DctgpXatApARznHb0qhIhfoi2FKjZxAn66PHLDDplR/HvqdVAIHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UPzqIvs9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A55606A31B;
	Thu,  5 Nov 2026 05:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UPzqIvs9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793855698;
	b=UdfqtvRhv/hU+6dJE+EHCQxgpa+TnQ/ngMX16P7fvYkbdI9Vfj0O/N2u5nIi8m81s0O1
	 bsdWoVE5bOtsEI57/iO8NJPNJaixulk1MzKNxWVxhGLlptX+ghiw8Q38+OsBmtjDwf2Xe
	 52QIL4S8CYIF6rEi2Nt7mhDeWZ0DUAcLcPw2pyXmv7wjrh2Cwm+HBX/lVydr8x3SlZyRj
	 muOv4dq4uT7p8YDhI2lNPby696FTEMOHgyhcGWCk8TeOPCMeRxy1w++DX1l/r070nSbK9
	 YaS+MyNAl7qWx4GuT7VW5JhLS9xXPlXvcGa/vHo4JYkCWbkVRviSzqqMV4v5QnjA5cg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793855698;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=dt/PcsvHanmEqsvPR5LxzzOntC1t3hrn298VcvvmxNM=;
	b=vylUjNtAQjlfsZL0TbAm8g4za6AezZn5EZ5JSiDHnVKJwTqo2/WFffct8yBx6MI05MaH
	 TksJsaAmfiHgajfFmMmCLurgvAiA/TgCz16nTeZ/D4stZYTX1rJTxlBY1XNFd/XathiQm
	 tzsHFhDUjkS4vKGQeYQlUixZym++/VazutyN8LzdOKkkf+JRjLGCbIj04Hhbtb+dOtSNB
	 fhfD3IU5EH42zonWwdPGmroQdeDyUvvswmSIDK5kEUd00UMzO3TJTPtWOZ/nhYmrUPq2E
	 r7bRx+E2SqpH5A+77pMNCDybngSi93+I83iPcRNGsib0b59GnQi2gFCX7D8YhIKvHZQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 30EF21F00919;
	Thu,  5 Nov 2026 05:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793855697;
	bh=dt/PcsvHanmEqsvPR5LxzzOntC1t3hrn298VcvvmxNM=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=UPzqIvs9FL+O8rxC7VCvejsFEFGQjVNm1ydGfJvfxkbBNjQFE5xP23j1nI4XAhO2w
	 6N4PoJB2pOTA/Lp2F3a0lT2ooQuk0G1wG+0FtKs2DBqfTIzfo2/92yKw8T8XSKRXcz
	 QGoEk0GB3Fkl5bQC1P3Kdue3gyIxFi1tqcra4326B1hCktsXixBcEQHsSAzLJzKEUb
	 Q8QJFOPRo/n30sWA6gUUnWcBZDV4dbGlPvGurY/8+ltN2vAWmzIp0ywtfCpiQIRp/w
	 jDfRx9u2n3wbNyN/D74mVkdATqQjO84Cxv2DNGdxHkE2IkQy0T4IyMLcCDHBYeKx5B
	 AhiuSiTsQjwIg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9C3B6470BA;
	Thu,  5 Nov 2026 05:14:56 +0000 (UTC)
From: Sarath Ganapathiraju via B4 Relay <devnull+sarath.ganapathiraju.oss.qualcomm.com@kernel.org>
Subject: [PATCH v13 0/2] Add LPASS VA CSR HeartBeat pulse clock support
Date: Thu, 05 Nov 2026 10:44:55 +0530
Message-Id: <20261105-master-v13-0-dbb43cdc60e5@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAM8Q7GoC/3XOTW7DIBAF4KtErEs0M4gAXfUeVRaYn4aqjltwr
 FSR715IJcdS6w3SoPe9mRsrIadQ2PPuxnKYUknDuQ4onnbMnez5LfDk6wcjoAMYVLy3ZQyZHxw
 ppaNU1lhWw585xHS9N70ef+dy6d6DG5tuiVMq45C/76sm3XJ/SifNgWsSnpz0YMC+DKXsvy72w
 w19v68Pa92TWWnSizZVUz0rgonGgtnQCCsuYOEI1SNIAtU5SUpueVw8AtLDY/MSwAQRnHViy9P
 KEz48VW864aPE6NGrf/w8zz87305MtAEAAA==
X-Change-ID: 20260917-master-6c2778f57a9a
To: andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org, 
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, 
 srinivas.kandagatla@oss.qualcomm.com, sarath.ganapathiraju@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 prasad.kumpatla@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793855695; l=6704;
 i=sarath.ganapathiraju@oss.qualcomm.com; s=default;
 h=from:subject:message-id;
 bh=60zgrvAhIy090AKFvFg9SI7zyCdU4BpYjOwge+0OMSE=;
 b=o8xoz4Gutzf11wFVW8nNvPX+ptdEbP/mctZgt12mK+0eo21+aSTfv/0go2N0z/rQ9Ql1Ue0vo
 S9eZvDpwFpEA18Be2F0Sa+9la7N7MdLUBuxaM5f1oumJyK2jAAlltlA
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

Changes in v13:
- Rebase the series on linux-next next-20261104.
- Create and populate the PM clock list before enabling runtime PM so
  runtime resume cannot touch VA CSR registers before the LPASS vote
  clocks are available (Sashiko).
- Drop the regmap cache for the LPASS rate generator registers to avoid
  stale LPASS_RATE_GEN_CTRL state after LPASS register context loss
  (Sashiko).
- Use runtime PM force suspend and resume for system sleep, and restore
  LPASS_RATE_GEN_CTRL on resume when the heartbeat clock was enabled
  before LPASS register context loss.
- Link to v12: https://patch.msgid.link/20261021-master-v12-0-9b3df51fd1d7@oss.qualcomm.com

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

 .../bindings/clock/qcom,hawi-lpass-va-csr.yaml     |  62 ++++++
 drivers/clk/qcom/Kconfig                           |  15 ++
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/lpass-va-csr.c                    | 210 +++++++++++++++++++++
 4 files changed, 288 insertions(+)
---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20260917-master-6c2778f57a9a

Best regards,
--  
Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>


