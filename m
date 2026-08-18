Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC5F41D225
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 08:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040602; cv=none; b=RPtwnv+OXgNQkEZ8rD6KGw2YEfx4eTiQfwqoSZt8wbg6bKo2MbszjLivn9DcEJ3MIoi6lC1Ry9FkmEzJBCv+EhAPbcm4ymylS4NHcRX9Cg4I87P7eke+ZHl+KDDX6TR9tmtRzddO7vjsD/kDI+3p6YqQ7g7h1lNo7uF1S3cNJto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040602; c=relaxed/simple;
	bh=S4gVIUWwuoALYuzwzRm82WuAYzYN5KLWtNbqZ/oM/+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PWdhxjeBqdampWnHCvGapP3VyIuQaARj7FrJb4z3iLZ8U5/w3ccRYHWEPx7JL+rrdAd7oCLJR5vYDuISBCEtGtzRPSdqqYTdmKxjKhqrB5g1WVQjA3C0+RgXao4yfQF0Ua8wkC1rzN+JUbj/1giMzl4vCgSfzVhsVv6Al5U012g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZutLx8fV; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZutLx8fV"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8518d5ddaabso2186768b3a.2
        for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 01:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040601; x=1787645401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=ZutLx8fVQsNjJW+UYFKcn+/9BS700/+Jxm2OVUn1IjzYxKEVD5al5vpJsPYo/nKsB5
         4IG/C814SQn+hNonVomBldnUlMeHzEGC+fddLhup4ze34KiVZTc6l9Le1S6pVa2RMWf/
         /36P0cxuIAEg2lt/ib5v+tu1C3dvI4PWcwuGGnIvEDdL71BTmnlJSWNllsrf9C7/xY3B
         FOI7eaT4/k/P69U3LmZ4B5a9FsXe1YX/zIfR1sveeycFPUjahPt/QswvWYYaYPLlteYt
         KpnYusEmyCRsxaiB5q/NjeOK2g+k3n6bUp2Pc4amf30ry4258uWaG8daInERp/qZds7Y
         33Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040601; x=1787645401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=tKPiE+nC+sppyFIwVWTnoUj5k6NGcVi4KX4lHwB+rKX7nMKtIwJka1v8fre0BcWqvu
         wMDxCTAEhYqJ2HKJBcG8ixgjxOAE01IzPyOjoP6VYk4fU2ChKoy2m/m2vLf8ubRDLC80
         Omd2ITBx+XpX7DQAZylaIi4TYiIreEYcfJv3ue5q8HNffYYWuTtXTYD2HwTPx5OJapAG
         3Oea0everpnhvNr8dG+1breb9KZj/BWAgxXUD1euh9SRhGWkJBN73r1tSY3JELwTThyq
         1OKXcN8YdYbc9NRkKwCEjYl8Kygj7obbmeFsNgY/HT1Ki6x00RipIR8ZGLtMNIlZoImD
         Z6xw==
X-Forwarded-Encrypted: i=1; AHgh+Rr1Oxdz2/gO2qlOG8b0aFuNrrs+LrV/l/jOS386nA/CuJZv2qw4uMXAh5dqeH8ojXBD8CYdQA7fmPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG9wOMuIX7HyasMxMNbYx6lHhdRH7em6dhunYyIL+E/XNuj2Pq
	3BlPVF+epEsLr/Fi7UcT74MFp/3BWRw/HQHnf82ZpY7Mgp3x5pyuvGUE
X-Gm-Gg: AR+sD12DVaJite7nCRfv0kxz5DPs61U5lEV2t021rO8bfpa6ShkuiW6fv9Dg85k15GE
	RmxYWUiJTuRptl4bia7TrLHS9yWejRIW2e+D0G+ynTkqxiU+7dBZ8kA2ydEPrNVUio1yURwuGV5
	oOZj2O74byKYLVyxJoRCVVq1DfH3z6P9dXyzd56/43l/AlSvH632bvrSAAC90ny5z8oyVuBPLcz
	kgWMAWFBzFcpjhtA0kdvz/F3nJ+X50JdLGJi+p5p6jurY024c+8+PS+1Ldq3lSPFolqxJ4WwPhp
	2fGMHVK5C+hw4baWKcUuLbOsTJr5CiLOSYxBeHOnCxt8qbhugW0qML+idEYGiMbQBcbe2YFLEN5
	cb/VEnGm7VdPeJvneO6Q4mgigt4pBI6HLDfwHpzDwT8qHE0eYTjRqSzeywyusdDHioywCaV5Sfz
	bd6HcC+2SWqRoLFRnD0lIOu2EgnyWMCRY9rkbaWjEPyha2kcXsABgWlz3OAE8sZMSzcLUsEEl5u
	T/WJsMtPzY=
X-Received: by 2002:a05:6a21:3b4a:b0:3cc:b26a:7686 with SMTP id adf61e73a8af0-3ccb26a7a6bmr16133613637.6.1787040600556;
        Tue, 18 Aug 2026 01:10:00 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm22606290eec.4.2026.08.18.01.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:09:59 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 11/12] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Tue, 18 Aug 2026 08:07:53 +0000
Message-ID: <20260818080754.4362-12-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818080754.4362-1-sreeshankar0910@gmail.com>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the PDC block on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d4..c30b88589 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -50,6 +50,7 @@ properties:
           - qcom,sdx75-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
+          - qcom,sm7250-pdc
           - qcom,sm8150-pdc
           - qcom,sm8250-pdc
           - qcom,sm8350-pdc
-- 
2.43.0

