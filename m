Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978196;
	b=mEXznygtXYJELtiRtQbfXcd4c/t9Az/dV/k1QJF1r3d3HBZ9M1nqMW0BV/l3pMvlq9nO
	 BX4zwE90K3Bqe76ncs8rcZ/D+sddg1912YE3LjcWmjilAh2EmqTqdgWAeXiQbTcYW3i0V
	 oa0Y3IExczueklX1H3P9WCGiedxkJJaGjJ/Fsx9srJOU7ZL/zvKDnKiRdOJT94SQna8kL
	 oPe3yCDZycnnCyWBsEaz7j61+12m5y5+h+8Q9C+Iar0sQWq0JJWoX99uyouUyYSDhTuPB
	 6GUVLsve/tLddVzyGmdZgeVF7zYZ+d3QGgpLhUWh3HiwkmBPW1HsBDCP1WXZ75LYQOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
	b=nG6Khz+WYqh1uo46N0yiFE6O29opzj0JrFzsgk4pUGdkqBnPgddhWPKyxi8Ph7zTaEEn
	 mZic5lgOsKbahYX7kRD1j2PQ5q+HJb2N/MvFbT4YLqhp6mT1xjmIEg2coTGNCFdZJEnKk
	 fucYRs9WYJwD6WGdcP667+UucFh6IKNf5Lo437wGbH0JfeFefjJgcaNjo5Ir438YRgNlh
	 EtTrGdT04KgiKCu/ynyNJT/BKsuFPpZh2AZa2UhefyIJ+L5g4mKPg45QE/XDDMUPFOiFf
	 8wANWcm8HTfWJqDI+nPoI+5kEdcSKsudY7iaphPyqjcbdS+uQnZR5qCFIa9+vHdMOZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VSAql/bl";
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B56D606A334
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 15:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B56D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VSAql/bl
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1204798eec.0
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 07:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793978195; x=1794582995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
        b=VSAql/blJeBuuXf8oV/4c1oADv/6SuCiNGnvgI+jYuOKHyIGlQ15D7/sdKN9NYl7wx
         iWb3gjWga3J1E8G9FKpUYgRb6DlbuIVWTvdwzC26viaTrL5X/e1VaVMZq2hRKGYiTyKc
         AzJA2l7qjJn2Mc1QtlCTO4p1IKMjHrPtdGWx7FFh5JzaZLCJx1/6THJc8ZFaWaZqzM1S
         nKBjJKH7mCdHSKmW5xbNxlbH+Z5gd+UlcG3taSFzBLnJflkRpuoWZLJ/8kI2Le266Kh7
         ujLXoS/MNkIY/yhfstFBjlc1JV+W2xRm71elGo+uD2WSg/eUw/2g+fiok9jCC7qj1L8X
         l76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978195; x=1794582995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
        b=P5qoWxSYKXshZNRxpEPgaY1nvY/IQPF1m9NWVVsh/ipnt06caDb3KnhZ/ruKAOLctw
         DHRpPrHIfNQFv1a3ZzF8DbEpa0R8Kh1b/EeBxn2vQFH/BTvG1gTQ4GuZpTj4n/LI9JL7
         dUgyipAPkaaHqu9Lnu/v3OCngopCmLj4WCKENoItq+LMqqWcLt2fj4vPirM+X8ZZtQo7
         Zg7Xw82TGzfj6kJFLgUPx5gFU6W5n8QnsjD+xNa6pPQwjecNFcAgRok6X7epBjY3W0Os
         9MeoD1vNNYSYUIUQWnq/9i1SCC8rG4VuMv9oHrkrj3SSLqzLYERSl7I3YgQqetCqFg72
         zaYg==
X-Forwarded-Encrypted: i=1; AL+hErGsjd4jkkP4SH0wPRyTPSt7hqCtVPS+DE5+WACObScBhox/XzKIl/0viABaUpd0lypI1MLXYhhJMMQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GhhtTNL+iW1VCzQz1CK8AZYbOcDB1632SmDan72Kym6oSn46U
	YoMRlboV7p0Ir5iHpmVtt3QpdXJELf3NArVHucct7gh2gj6PjfFR4D2s
X-Gm-Gg: AYBFou0boOn5jxjyuDlwFoq+Lm58IcJ7lprCehves7ZgIEcbtUZ2DMUWEHPYcrk9tSb
	Ue3oVofDV3VAY0Pa2z+fDFlpAKTyGL9NTPBgwC6+qWzxb1bcxDXuJd47xjTDX7+oSWZX9Jflu2z
	eR152hmzafTe2CfESDFkP+m+urttb7lNVTFwKkbkEDl2Y3FOmbqqT+gZEArIUYhNb91gFs+cUBo
	iFXII0aq2zmjErq6Kta4qDAo+zsznirolPDep4CWDPpm8ITD1jiRn+skfke+erS+ikcDCGgnmpP
	0U/VBBLWirDG4x8rrpoQyO9o5joWoUTVfD+96kmPbasPmDneOZFhtTX8YoD1FjZJciuDjqvKLCh
	Qv130OJbMpPQCJIJVLQMO/1pW1nXd/kTT9t+UJrRuLkUQMW87jeANkfQV6yJ9HXQy2VsIEkqjfe
	+70ohpQS4rGore/8y9f5f5Oj+OouBnCHinWcXEHNlRNCW6rnVipNfcQ7nMqxIYxdsEgMST4uLZi
	SGsWZA7vXGQ0XRJIlORSOnMtNM5awALWg1z3xeguFJoVJox4qKeWFpJ3vw5hGT42uSF2E9l/0iv
	0Pj7CCXf4g//J38mWpFtAb5glWhc/lRhKKjTZm7+2rnNjzioFFApbo1GCkp8c8RZOfNnxzTinCX
	lM/MP+vM=
X-Received: by 2002:a05:7300:ea8d:b0:361:167c:2364 with SMTP id 5a478bee46e88-36f76814de3mr3562020eec.8.1793978195003;
        Fri, 06 Nov 2026 07:16:35 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.221.122])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm7581500eec.18.2026.11.06.07.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:16:34 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Fri, 06 Nov 2026 15:15:39 +0000
Subject: [PATCH v14 4/8] dt-bindings: thermal: lmh: Document SM7250 LMh
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
Message-Id: <20261106-sm7250-v14-4-7d167e993f9c@gmail.com>
References: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
In-Reply-To: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Sreeshankar K <sreeshankar0910@gmail.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793978147; l=791;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=VBYR2sSJ7gPSfZ1zDIlxykyMXb9GohC2X09rRKZ3wIw=;
 b=tA+YO4IEziw/rxKUuLOEgg9oSmL+N5rlYkZXd62GE5c3l7KwaJP7/Ge3KIv/yGEwS6/bV7IKD
 UTf6B27Bw92BqD5ffzrs425wCTGWhznBDR5PUtFGQnRPV1dh25cvGBx
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the LMh compatible for Qualcomm SM7250 SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
index ce72347e2..e1d5cb871 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - qcom,sc8180x-lmh
           - qcom,sdm845-lmh
+          - qcom,sm7250-lmh
           - qcom,sm8150-lmh
       - items:
           - const: qcom,sdm670-lmh

-- 
2.43.0

