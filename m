Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793815661;
	b=Y5tL/1Uyq/yBG/t1csLQvbOJlgjemy1maoS8U4vGBSvp99nHQsOYKp0hOhiCUNzIoeiu
	 DZZreMrIbaE9ig1qMalYSm2gq+fBIJiUzbPu1feBSrNhZna7dlUTDQ318msXvQ/ZkbSMn
	 4/HEsbMpmKAHRCp3UvEMVsprM4Txsg9RcRmNvj6Cl2IfwT2aVMfKgvZKYPebmqDuQydf4
	 7kDY5ftiBcf9DMPnS8AnwX6kZCQ2FsnwvZYnQrWJoRqRNRwy9I6USZOJZhYaaKOqy+Mwf
	 do2NOMzX0nHrXWlNf7GKYJIoSDB/UYm/mJftA0kraBQUxk7snyDYQnmsv3vlDydffVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815661;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=UARweOnjIFaxNsL9IYwBsR7aSaRN+Buof7vFGRkEzao=;
	b=k69kU/n/QUxU6n5Ep42yeffMEFpDDaCfLZunQfmIcdbtODzME0otSiLW4QvFTGvRF2TO
	 pDh+H9noTGwguKWVgi0w/m9ZhvGylpKkwMYqWPB7I4vuRo3ly9pHcg32mosrFaNqcPrZc
	 rvopnyoxEtMvb8F1Ek30GVdseh3ksw9BpcVX1egnHaPUhDebV9RHsA+Y1ej6TkYWB0GqR
	 +NNCqYuA6OdXGF0ZgDR8FAta7gXBiZ5WKcB+/1462IOsbncz4NM8+EwSqu7aMueSLvy/0
	 PWMt8VujQWZAkKNXv38mNiA+SXFO+PPURKLe5p02rKtuqvZM3y4TuWSnijxAP1hd7HA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CTbBfdKg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A93E60703D4;
	Wed,  4 Nov 2026 18:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CTbBfdKg
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793815661;
	b=x47qlg0kwZQ7VTGopziMEgCxmAYkxCpvSxEp8F8URR+dhKxaJSCTtGqhABJTz0l3QO1u
	 qcYM74Ffv8tJRVRt1ajKbOhGz4Qmn33z+vP3ThF3JcPmUHjqAeE6D6hFgqoVi9OkuuZf7
	 p0VBO8yQkLQKW7KbTgx+12/Btw7ZjeTAKEH5ayqSWDgP3HI9vByY7VoiCuRTYmOkSqX39
	 RShtAe9RZgEJ2+346jg2OT3Dk2SMGW6EZFd6az9tDNeO1IbY3OCg7cqM4O4mn85t9mcZ0
	 eG715D6x+qSewu7CMEFPZT3n5slnwDNuW5ccJws34cNmz5VEqzzCbVEnEpkuYKijIWg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793815661;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=UARweOnjIFaxNsL9IYwBsR7aSaRN+Buof7vFGRkEzao=;
	b=IyjgDv+COn4b1uM5DCODPz+tyRDmeoheiREaAFvr6QYcFPvqzNPzoQ+MDC5Hu588CnpZ
	 mkOU5FnTTzayYiNOt2wiqDM0mkZ4rew7MBI4F7W7mCF0AcD1DX0yayCsIqtdK3wd+ZOPA
	 BRazDpm11paXSAsuDa0+2dIZETx6rqMxI2cb3zY3HNzqqjK3h3qomd5YmyX3tmo/BPdoE
	 jP9EeyskoWJ3pAtfC5Zv/6ZZxedRynwggnqjeTZk0OPeT1cyqQmQw2ifyV7xOIm4CzYr+
	 /SYILCKj36mzW9vpyPh/y5y8QPEnDxuaXJV5hDYsIC6DiDU/QEf4VIrQB1C2U443C/A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 68C791F00A02;
	Wed,  4 Nov 2026 18:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793815661;
	bh=UARweOnjIFaxNsL9IYwBsR7aSaRN+Buof7vFGRkEzao=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=CTbBfdKgVKwz5y7y/8gRm5Pw9Ul5Zv3RZXXwSS25EpyyaYc13MikYVNWdGGxt9ZZC
	 LnMec6BVNN0VxN19jA7IkaGbRRxN8cpAZP/ozBUxxQCcPzjrQqDcriRowrnw03CN6+
	 GKPivLw9hBzZE6NvkZIVxxMt0NPxkwEzxwcTEqkLViNHd4sIoQ2KbTKhbNyWTmRIdE
	 r3uPR+sEUo2n3mfBzE9ZRqS00RXwldis/8XJk8nTdmuKeYnjAJde4wxSsYLuuPIEYe
	 E505Gr+cadLDHpEqKisU5hTPsdFXYktDz1NSZTPecIZt9w4YB6VVayiLL5k/zjKSV0
	 NWIz1XyZOw5Gw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EB21746F11;
	Wed,  4 Nov 2026 18:07:38 +0000 (UTC)
From: Demeter Barna via B4 Relay <devnull+me.fromdisposition.org@kernel.org>
Date: Wed, 04 Nov 2026 18:07:11 +0000
Subject: [PATCH 3/7] ASoC: dt-bindings: qcom,lpass-rx-macro: Add SM8350
 LPASS RX
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
Message-Id: <20261104-b4-sm8350-sound-v1-3-4c872df294fa@fromdisposition.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793815654; l=1579;
 i=me@fromdisposition.org; s=20261012; h=from:subject:message-id;
 bh=CGpNRQhRpPqlomk9QazUNypupod6Uulrg04MslS2CIE=;
 b=412eKDDQHDAo1yofalaBeiz6neCBAujFFL5y8Ligsh2QxHMD9xh5v5AljPI2POG/Bv9EHhAbI
 JtZJe6SUQVPBDdf5z+IDCnf5rmq5r1wGZ6cDmyPEQccSy+IGAeVaRRu
X-Developer-Key: i=me@fromdisposition.org; a=ed25519;
 pk=S0QFlGq1BQEaAtPPdAH8YKEOXMeRuSkTgctXuvtU+1Y=
X-Endpoint-Received: by B4 Relay for me@fromdisposition.org/20261012 with
 auth_id=1163
X-Original-From: Demeter Barna <me@fromdisposition.org>
Reply-To: me@fromdisposition.org
Content-Transfer-Encoding: 7bit

From: Demeter Barna <me@fromdisposition.org>

The SM8350 RX macro takes the clocks of SM8250, and the driver handles
it with the same data as SM8250 and SM8450, so add it with SM8250 as
the fallback. Use "contains" in the clocks condition so that it covers
the fallback form.

Signed-off-by: Demeter Barna <me@fromdisposition.org>
---
 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml       | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 4988e7ed6..67a4a9536 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -19,6 +19,9 @@ properties:
           - qcom,sm8450-lpass-rx-macro
           - qcom,sm8550-lpass-rx-macro
           - qcom,sc8280xp-lpass-rx-macro
+      - items:
+          - const: qcom,sm8350-lpass-rx-macro
+          - const: qcom,sm8250-lpass-rx-macro
       - items:
           - enum:
               - qcom,eliza-lpass-rx-macro
@@ -103,10 +106,11 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sc8280xp-lpass-rx-macro
-            - qcom,sm8250-lpass-rx-macro
-            - qcom,sm8450-lpass-rx-macro
+          contains:
+            enum:
+              - qcom,sc8280xp-lpass-rx-macro
+              - qcom,sm8250-lpass-rx-macro
+              - qcom,sm8450-lpass-rx-macro
     then:
       properties:
         clocks:

-- 
2.53.0


