Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793815662;
	b=B6uxJsGyzgUbqBX+Hw78uNL4T2ygJUpURGSZZb+oS/cE2jFvu225dJomsIUwdTuU0QWD
	 gkiI/fiQobhYyTo3Bp7zr/0k0lXob2OkCAF4/xGnzUMOulx2Z0wWEWfOhVuOSD/OpiXzp
	 Bo/Waz6tguO3H90DUljYL0TRn0kcMRcmcPXadNvPqsDNgnsXbTQTRQTYkSbOT30Mc0H6i
	 OqP4A+po9dge0uLKoOxGH/n3huIFQaqM4oWHNyMFCpBOGOUiPD/Ix25h5t+aPcMzlbjWu
	 EuSyfs73ZOkZycfv2aGBDnIEvHOFf0uB/V4uLtkEg5HmGgCM1PgmV2NqSpauQHdGVyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815662;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=w83PF9UHCT9IUJXvYJkWD2ys58fD+P/60UyIhnjMg8k=;
	b=oGMJZIscZFMK1vsz886eIJSpsBiKjsCo4nb357TaoGteeKH6WkfERMH/3RM+uQqcjdRG
	 RMS+Y0ssRt1xEgPcC3rUZ1+KHgvSdqGF3Pubut6h5JzarBPIpqNcRUoP5LDWTt4oUyh98
	 Ll6NK+MJzV8DofMrMy+xcFTwqPneOqDtTGK7xs+4J/ApIOBDkXnHXd6xjY5bej0xvAwIE
	 sCsp8Iux4KeKn5zrq9kVpNf4CnrGdcvsKeK2zbeoJzSJ3eS607F4SPMEuUvQnHwji8CxL
	 Q+PjhClaarQMh2eXEYDXdU1GLzGkQhsZPpblphZlxA5YmQKlwO+eUK1O1zhjXM7avOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nexJA2jA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8F360703D3;
	Wed,  4 Nov 2026 18:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nexJA2jA
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793815661;
	b=QpS41TgJQNtDRzv3W81E6vfC1lmCz3W0Z25cx1pDKgxpTZDtKy1cqCA6ssi5FMLUIZsj
	 Q7uSfV/joWrODx2iDfpjJKpdsVqQat92fKkBKbSmg7fL+Gns+a1p8aDeVQLJvHqYKh4z+
	 Pv5xATLdUi/rQOH5kI5M/BxmewTk/b3Qm4HPhBO2ikVbXgNzwIbcSiMdvbdkVsAnukP19
	 sK2pZWysGRtkJsuFObGh++YxvQnwv2mka+l3olBR/jrmDvceBnquXejCBw75tZziJjJLW
	 qr41oTdsqX7+uPujEvtjyqZZNVxe+KlVyYfSreEfHOQ7diXQbV+vlVRVYglsXLaxayw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793815661;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=w83PF9UHCT9IUJXvYJkWD2ys58fD+P/60UyIhnjMg8k=;
	b=l/gvdtTfFU7qZmzdefXP/X+zXe049coq4/Q55zdxb8Cijr7Al3RPhm1xavAQ2RvjF7qj
	 uSLa+fnast2JS3fl9Z4GsjrMZNIa44ylArNbI+snhHNmrp/sbNHCqk+gMz/l7Sp0+Og3J
	 afe/wsdwWGmoPKS89KkfUH/YS3k+t8/XiGqFN4mwhc0AVkz07FhyaGNmDpDLacH4RP1b2
	 drxJCVeeU/WZG8jNojg1FmwHNsqD8SoBFdsXCcR4hGD//eSnDDncjNrG21r8ouHdoy+pY
	 NyyO8JXinp9JS0arGrKs8A5DU16MvAdI9aqUNTFHfCnj2f0MOMCnJUVLqTCMMnUZ2Lg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8FE401F00A17;
	Wed,  4 Nov 2026 18:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793815661;
	bh=w83PF9UHCT9IUJXvYJkWD2ys58fD+P/60UyIhnjMg8k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nexJA2jA8Zctdrfp0U8gvUaDlWIwgpz1cweX+SPaezPcAMFVne1ybtq97hkOowlty
	 xd3U59KId294ddid/E9tBoR1yw9FS6imXMWLACpXZwTZ6R2x8A9LIVPEeSeCkfJMJL
	 pVebpLHb2RrTXe+GXgWVJbKGqgHHmPKgoyXh7bY/L2PfV7REM37L7FEWJB8VyKtXxr
	 So0ro+6HRYaF3lQ2QEjj6ReaFuh7IT5uhYFVh57iARzSO9aioObVsE33CvKcngtIst
	 LV7QK8AY4Swz67hJb78Sx9rK18jtGE53/b6Ys/BNf6W2wfwY7KDC28H7ouvjb1WrTm
	 5NNWhrsrPm4+w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1486C46F19;
	Wed,  4 Nov 2026 18:07:39 +0000 (UTC)
From: Demeter Barna via B4 Relay <devnull+me.fromdisposition.org@kernel.org>
Date: Wed, 04 Nov 2026 18:07:13 +0000
Subject: [PATCH 5/7] ASoC: dt-bindings: qcom,lpass-va-macro: Add SM8350
 LPASS VA
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
Message-Id: <20261104-b4-sm8350-sound-v1-5-4c872df294fa@fromdisposition.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793815654; l=1144;
 i=me@fromdisposition.org; s=20261012; h=from:subject:message-id;
 bh=sZTRXDQ8sQKItE93dYdxZrl3e5Pj6ECZjzyBHzSkKxM=;
 b=tKRneY64+EQq831yUTvu4aW3mZCN7HO2QtZ1ALYjo107uoO+zwz8U9nO2eYfaDSWE6Kn8k7Qc
 WoHmlLJWeq7A8uaUuCqHbilIQYgrxzgNpIYMdORDfrAzHuFOqKAHB7C
X-Developer-Key: i=me@fromdisposition.org; a=ed25519;
 pk=S0QFlGq1BQEaAtPPdAH8YKEOXMeRuSkTgctXuvtU+1Y=
X-Endpoint-Received: by B4 Relay for me@fromdisposition.org/20261012 with
 auth_id=1163
X-Original-From: Demeter Barna <me@fromdisposition.org>
Reply-To: me@fromdisposition.org
Content-Transfer-Encoding: 7bit

From: Demeter Barna <me@fromdisposition.org>

The SM8350 VA macro takes the mclk, macro and dcodec clocks, as SC7280
does without power-domains, and reports LPASS codec version 2.0 in its
core ID registers. The SC7280 driver data reads the version from there,
while the SM8250 data sets 1.0, so use SC7280 as the fallback.

Signed-off-by: Demeter Barna <me@fromdisposition.org>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index aea31fbda..a5466e61b 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -19,6 +19,9 @@ properties:
           - qcom,sm8450-lpass-va-macro
           - qcom,sm8550-lpass-va-macro
           - qcom,sc8280xp-lpass-va-macro
+      - items:
+          - const: qcom,sm8350-lpass-va-macro
+          - const: qcom,sc7280-lpass-va-macro
       - items:
           - enum:
               - qcom,eliza-lpass-va-macro

-- 
2.53.0


