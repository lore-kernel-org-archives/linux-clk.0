Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D55836C9D0
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 15:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326956; cv=none; b=pZr+BB1nrjTY5lvNo6KHI0mEGDvC/rLpIsd5PHvcQyaF5BVS17C7X81PNOSQvHixjXe9+26gwpz11lMlMN6OiUppRLPW9d5cLp+4uz2Hq6vYxK5r1fB/X1O4yLZZB1PHIKrDUHn2oLMN4cQhEiYwvt7tC7/Mi7LvwpTMOnOHq6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326956; c=relaxed/simple;
	bh=gKbqr+JbhugVzrK4haKucfxH1GbAmaJ/63Ra+8PimmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dybZ5LhNsa38BjkmYJxanlAPGHSz7dpe7mbx2GJ37L1PrvbErwZYYhST1oU8gb0m362chbWckGScHwFrUEQCj6kixFW9QXa0DmBfyFs2qCTZ/OZICg4BtXvooPJdpsozWQcWKfomYdU6Fmpp7EHeQsb6r21NOVywWCOorB6DQW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ett3HkFD; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ett3HkFD"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38f0f132f56so1582552a91.0
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 08:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787326954; x=1787931754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=ett3HkFDPkIdqwxQU/9kx2htMKc9d4UvD46VDUXk4fFuiHwU1bbqF/mIarhSJwsFpJ
         EI4U6TR+PWz4D10Si8u8+23exMw0wHIh13D3Npyr6VGs8c1RfsqrdGgC/LTuNoWPUxFJ
         fXQ3RDFEXfD8CQJ3mkUHQIw2sITVFBtstVQsaTNR2xKIrd1h3HrSmOCBl5PuHFw7uc9Q
         B0m5kl9V4duACgF/9P9DxNHWUAfbxWJg3n1LSCcF2mJwNIAhg1X2XIrDMByJL+8boLfV
         KUgnYcjXcKN+cX3Jm30v671VRZIeK4h9Ma+Ba2OAvaaz5Mf0nffxeMSEtssXmS0dLLj3
         2KKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787326954; x=1787931754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=mSKtWiYYxHsedXJbGFRfs7OlqXwj+0a/YHtEa7/0yUxLZaybd5r/CEfxi0yatRzmuF
         RStlcrkiKMEFqPiIJFRN/oFZvM66pyhU/MRfEoa50iE2lyGAujXpW/Pjs6K88aGGj3Y3
         llfQr0t/HFL1RRaqJEl3/5RTSE61vch193wMP/rUQ1dJzptSjtfLy05wCmpY9alXz5ea
         JUZB9+KLTC6cUUjk7/aD9c/rR/RotHhiEx96+NRgKKjVwh1DSSvGdUqBKREszXE+uG29
         ZmKqaqPAXqwy9jA3IjyQVVMT/IKKrKEIaAu2PVzge/PBvIOFxD/qX8zVr/qkkSOjOTYf
         0wYg==
X-Forwarded-Encrypted: i=1; AHgh+Rr70HM+dwTClLCrxX0pPyn78cLNb3m92np+xqkbViIWGQEFu8wLIsakMo9r0lb+m5IZ/UWB7xRWLRI=@vger.kernel.org
X-Gm-Message-State: AFuF++kQitwDQVII5+UO5y+7SZH30tTfwssFRW6Lrw3/BSC9SnhAq4TE
	+tvYE4DlfznoZ9ML3EVlzAj0p2vIEH4QLMhnh3F4PdYQVo3Jf8QXRteh
X-Gm-Gg: AR+sD129kXofziN87z1JsXW8mu0hPoi8SIe2ud0km/5Nx9/nT1eLwxNFLoiaQdAj65E
	3pk48ppPsMldZur0cKhgC/cl6sWYEwKyGtiqBV3tSsBDJB1mz6bwY1vjQJ/3FeE7T3+1Rk3c5Mk
	PqcstycyA00MVGPBANANKFzS7nxqJRUWl0tKtOSy2NtnUOo487390IcOynzwQwwUC4v7QfU+fNS
	fAD5XVThJhWZY/4HqJld1H+K5cE5wJIYCjereJY0/UYnyEM/1rRw050Q55lyYf6Rl1WRcJ71ScG
	MEefBTQ2fMwyOTeftfSqrGmUq+QVdItqG1g592Vr5I7n4387oOh9Zvq/zV8aY7ZbLKneUCMhbyp
	xagfTx5d6ukvx9sD8iO8LUve2qkN6Smvapjarc0d29SLa5erGoNOoDcvHt3WlDMqopW0nfa27lR
	tyDafPi1I1EGfNP1nrRSjjeRWE9OIG46rFNgAOTDeHgHAmdtbQ9lcR7uFN0Ef8mzGDy/vsvGkCk
	suM4U66MtVk
X-Received: by 2002:a17:90b:5207:b0:38e:c1ba:4f94 with SMTP id 98e67ed59e1d1-395a044f253mr20276289a91.2.1787326954497;
        Fri, 21 Aug 2026 08:42:34 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm42903185c88.13.2026.08.21.08.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:42:33 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 10/13] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Fri, 21 Aug 2026 15:40:27 +0000
Message-ID: <20260821154030.2514-11-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821154030.2514-1-sreeshankar0910@gmail.com>
References: <20260821154030.2514-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f..0cbdb3b2f 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -74,6 +74,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350
-- 
2.43.0

