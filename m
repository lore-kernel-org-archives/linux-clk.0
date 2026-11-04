Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793815662;
	b=DHEb/cuABg5E3iIdbJq1dAOPz1fQAu36sDuljSzYpSaBzfURsgHkjbP5YfNnQBzP7bw+
	 yE0L7lraujFRDhj5zOM8BIbmMJ2s6JFciEezT619Q5jD+xFcHGEpLCZyFaum8qFj/yPqm
	 Bv/ZVHiFoJKa9XNipQOmfWVcEb/3QdR2zQ3DMXVwBUkamRsjk5czJT1lz78PNvqRdRs8a
	 GJJdU+pKDGg51UH6pH9GrwWSrvSxLI3k6wMkGSmKeS1xUYRcdsOyMLZ6qjTgbhxW1V2k6
	 f6+hxCLy51uSTJwV3Rsq/ZZpDjkZamSXbJ1+EWiiaWzVQ62r0lNb/WnMuKody6LIXQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815662;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LmnPYKYK78q2tWSR28YMGbalwocf0PixP0/EBiHtZXE=;
	b=eyUQMtuq+np9uk+/xZkEo/0N8KomV6iDeoorc1sPcSKgsJgIMB+BuUILr+scgCa0snzD
	 h6igCL+JwpN+DLYUFCSxTSd2A0QlY+CDWLpr8XWt5cbkMy6VAI1Af+VvGlDbIFHM6MUaz
	 jsGAUCWF87aDKUkIvNF8n8qcX4w3wRCaI96C5Fnk5l9cljYHhNwuuPLnd5rrQZHDLAekT
	 Gn8NgGl3goHqkinpgQMQOX9CDN+iNwpTCR4KpNUR04Ct83TK7Q2MovrX2FrGd47ZyhKsU
	 TyZySiNEHjCAmVouFuP3vvVNrF356epH1q16w4dBkvMN52lYiBcwvvHtyxSAQRlwRcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JbTaGBYb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA83660703D6;
	Wed,  4 Nov 2026 18:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JbTaGBYb
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793815661;
	b=VNl5ERZk0CYWbmlDpsJcU7WVpvgPLUIhpWabQwBAIc6VHjWsmK8nYJU62XQbS9t8IEDr
	 EEXfhs2DrZYE4u/e612+LgTZL+Uhe3sPZFHY1tGVVsVfL7vK0mMZzbSgJM1eF4uX8Zi5C
	 p8dSL/l2Xda7zYmL0pbiIrU7Cq4vpXlYWcDq0zjIdUbNuxg/9oy3TkzhYFB+8QF7tnK/6
	 5sa9H6hId663Y2YwYIT/NJmryUTNQaZKedxE6YEfeQEEoDjFEUBBxCAIkjiTY6mbdKgk2
	 PAPJlZk28ld2499zSGxCITusZbMfkBlP/jjE5rZDVTGd8MUU29yagxM+08mpHCvuKmw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793815661;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LmnPYKYK78q2tWSR28YMGbalwocf0PixP0/EBiHtZXE=;
	b=C7kVZyr8pgRiDxHxdKqO0TTcNLkKoiSDVB76/DPl+Df8/7UG7tTb7ik73mwjil5komA3
	 BNn8WSWDs861AGT3qPbO7no2JW23oSz1rCr3sMj2/QSoDgOzYTeZJ8lVLGsDy01XR+Q+s
	 0a1NAlMw2OMdG+y5iAuw1eG29miv/iiUqpQMSxBrz/8Wwq047G/qMHIuvNpfzSrIeb6U0
	 6TK9vQb8vJTIeRlY6w6cWeNwvQ5cJjBDk7qoJjNLDMyeER44a9AasOw0fROs4/vxqFGP0
	 lylzLy2atkA1Uym6jMwek9qXlM2k8+0I7ip/BpaU5S0vpopwv0bqiXzsYTTHadMpdNg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 63D2C1F00919;
	Wed,  4 Nov 2026 18:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793815661;
	bh=LmnPYKYK78q2tWSR28YMGbalwocf0PixP0/EBiHtZXE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JbTaGBYbAQ+q6nNM8d5ngz/0L6V47o/1Mzvo8ZIRekXsdLsj9gLGZUq8162aLhsty
	 Y4oyKA8frw0O/X/Slj+cKKfiFSIAjOzOp08JXj0xZHnibOcRTC5YMIYVCU+psBeJK9
	 kBvMlz8EZmXtLaVb6PPoI+bLtqm6qsitqxU7FYvFclPUTBV+hHqwWv09GmdHtsrxtk
	 53Obqsra2FC1G6NDDWsP25sXTp0zrkCYXOd3CxpjmfOwxso2++nOnLGoQ0aekhwmL0
	 o1mm3EtT6bXr0smYj1BdU1KcCvgnf9VazqQ6bmdS+LI/bzVkMNf7N7+jCIkqG6ULOL
	 ALyu9hKfp+WGw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DB67546F0D;
	Wed,  4 Nov 2026 18:07:38 +0000 (UTC)
From: Demeter Barna via B4 Relay <devnull+me.fromdisposition.org@kernel.org>
Date: Wed, 04 Nov 2026 18:07:10 +0000
Subject: [PATCH 2/7] clk: qcom: lpassaudiocc-sc7280: Add SM8350 audio CSR
 resets
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
Message-Id: <20261104-b4-sm8350-sound-v1-2-4c872df294fa@fromdisposition.org>
References: <20261104-b4-sm8350-sound-v1-0-4c872df294fa@fromdisposition.org>
In-Reply-To: <20261104-b4-sm8350-sound-v1-0-4c872df294fa@fromdisposition.org>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, Demeter Barna <me@fromdisposition.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793815654; l=1525;
 i=me@fromdisposition.org; s=20261012; h=from:subject:message-id;
 bh=9ar4otrhuYQUlNK6qRIwOBsUEsXsIX335tkvdLVMcZo=;
 b=/Hbg+9HRwmhfM8q7TlfagS8ExqCph3R6R3NK7WGlxODcHKRVYPD9jIYDv9dMmQWKwbROOH8K1
 Dp0MC+QJJyXB8BJ7d1L5055yvNzi/UhfK8fl/suYi9lZgo7eLp1SpyX
X-Developer-Key: i=me@fromdisposition.org; a=ed25519;
 pk=S0QFlGq1BQEaAtPPdAH8YKEOXMeRuSkTgctXuvtU+1Y=
X-Endpoint-Received: by B4 Relay for me@fromdisposition.org/20261012 with
 auth_id=1163
X-Original-From: Demeter Barna <me@fromdisposition.org>
Reply-To: me@fromdisposition.org
Content-Transfer-Encoding: 7bit

From: Demeter Barna <me@fromdisposition.org>

Without these resets the codecs on the SoundWire buses fail to
initialize. The offsets match the QCM6490 reset-only descriptor, but
the SM8350 node only has the CSR region, so probe it from index 0.

Signed-off-by: Demeter Barna <me@fromdisposition.org>
---
 drivers/clk/qcom/lpassaudiocc-sc7280.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
index 7e2172969..11332f9f0 100644
--- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
+++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
@@ -732,6 +732,7 @@ static const struct qcom_cc_desc lpass_audio_cc_reset_sc7280_desc = {
 static const struct of_device_id lpass_audio_cc_sc7280_match_table[] = {
 	{ .compatible = "qcom,qcm6490-lpassaudiocc", .data = &lpass_audio_cc_reset_sc7280_desc },
 	{ .compatible = "qcom,sc7280-lpassaudiocc", .data = &lpass_audio_cc_sc7280_desc },
+	{ .compatible = "qcom,sm8350-lpassaudiocc", .data = &lpass_audio_cc_reset_sc7280_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpass_audio_cc_sc7280_match_table);
@@ -768,6 +769,9 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
 	if (of_device_is_compatible(pdev->dev.of_node, "qcom,qcm6490-lpassaudiocc"))
 		return qcom_cc_probe_by_index(pdev, 1, desc);
 
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8350-lpassaudiocc"))
+		return qcom_cc_probe_by_index(pdev, 0, desc);
+
 	ret = lpass_audio_setup_runtime_pm(pdev);
 	if (ret)
 		return ret;

-- 
2.53.0


