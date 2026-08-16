Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F1642050
	for <linux-clk@vger.kernel.org>; Sun, 16 Aug 2026 13:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786886240; cv=none; b=TgZTwZx6V5CNmcKCMOFBbtHiFwNBcRLULwilZfImlhCMzQ0L7eIHLp50aNNRRj7Zg3fFh3yJeCO1ic1OmPvVzZ7Up/ocEu6uKlQIC7f++3SHZRaBCjQk26O+WYs8QUEt6nNAk1PLUA72LoQ7uoZd2+T1RIiE2omnUTm33uhQhSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786886240; c=relaxed/simple;
	bh=9lh6SnLl8V0+6EkqXPMHz3NbVXtbKUgYWv5JtTJxcyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LEVTS9hf/zsEfcluYmixvgH+M6zyrX/HU2jYk5vWYNa3DFgGjw+1j/476b3YVfac1Jne1EZJzbZVpJHrv/HNLCJwztaxr78H8TgJljHXeGQG4kbEZSxnLvYUOkDeWf9OfU9N3GZHVg3Oxg1BQLbEcEMlvYDPQeBuStJC9+e1N9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmOz/1gV; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmOz/1gV"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso3452532a91.2
        for <linux-clk@vger.kernel.org>; Sun, 16 Aug 2026 06:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786886239; x=1787491039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ovohQRp3uO6IS6H5dgbCzXT2FrwL8JP6NNpNzDBnNU=;
        b=bmOz/1gVcR6ERdXCY4tLCk57ymrS/g98sSiUme3dKv+xQ5sMgoC/EzH4emwO29XxLV
         a36aD09e4/340bdouXhd1ezxag3hdM5p98qZ+6ZTW2Uxp84iliI34IiOG+dXRCFx2mk1
         OiHz43SoEe8B0kZv2sreYJa14qGujKnGqmz8slCKbHNeDDlSi3LmB/mOb+RGJQ/tShxy
         nvO336O4BWx+/lx29a8yNAW6CVzon8n5lcsC0mFwL5DwYY5Bim5TNJaHm6bM2PIN0hZn
         hsWHkT5nsIfNzzAXXUoWL4xmRMpES1mj0Z4WywuTuKZoyBsq0XYV60YXcN87xhR7CWm7
         xVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786886239; x=1787491039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ovohQRp3uO6IS6H5dgbCzXT2FrwL8JP6NNpNzDBnNU=;
        b=hnSKqRpNSAdX4iF+uMIsCEWPIePqBxTTyuU6U6LIAYBh7h4OCwiBxMN5VL9LLt2d0v
         tVFQbN68naA648J0A5ZOWY20fPWEyTl6ahPtLrTtKQxuAhqWR2PWf+/lfM23GsjYpjJb
         efikijEvBCkxG7F19uNfh6ggvyGkltIn7EYbWq5KDwOJr2BmJ+9fN1pE15t3C1jAj7We
         zUkxlN/NCX0/l12f6uvy9K5N++8+KcEBUIrFoWs6xhg4sJHwHFnq+6o3y/68k9PBOgYV
         HBAl9k2RZlGqx759tYjtHo39shk5+1boaR4J3yHKsEHd95ileRivPKSTPFwp2WZmYx2T
         FWgQ==
X-Forwarded-Encrypted: i=1; AHgh+RozYVMZUDOaFMSrFR/kJlV6PeMso8YIteAeZLgJqaJEywUCCz9PRvQmB6quc9S3baNEkVKKn+TPkTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFf6LZYyLqXzFH5kejv7PRI+cOG5bQFmmKOgK6+OiECWTNswiV
	CtXfVnyIQ1X5KCUk1IeA3bZCL6lrS8sv8MzCEMhV50ZUZqPkiE6K2ldk
X-Gm-Gg: AR+sD118w0Ii++O4z2YlJ+0++2U+o9/X8oPtmDGO+A3MCLrWQFC+b+wQFVgn6slVj8D
	J6w7mEpAIzveEDQ+FGqxMT6gOqlUsrb4DBgGrY7Crvd11u9H0AwDPDxYGUKWGfMG5juQdzcPj9p
	ZXMvwsGiYWuhgx4wBKO8GeoL863bv3lWXziFoid+/mqMXzDeYqynwGryO3rX7wyoOPtAN/Mirbr
	JFrZw+FgFoa7Uvs4IXI6JGsBWWt/agIGxs/sSjIBQic1l3A4NIhzSiclYpGn/ZUTFdzSPzQjcDx
	LX+CQG653xcM2YEiyJGI8nFOrRr932xe4paA5zFljRk7b5fFxLPax81GiB+3TdjHGlqnAsjAO1U
	nBIkLDtyIH+AMTaHbedZ9CVdAcnQ017ubueTpyr58+LHokayErI2dU1xwL9PzTIyZ/hBCDILxkH
	oi6u1fcsfkA3tVt98S9Gfif2rpnETdi99eXdIbjCISEYQRgeYDD0oCWGLg3dHggbVWJIq6r4gnI
	ZhhuIfHS9mv
X-Received: by 2002:a17:90b:3f50:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-3933b7213c9mr19862401a91.5.1786886238756;
        Sun, 16 Aug 2026 06:17:18 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.131])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413887e3e7sm29235330c88.9.2026.08.16.06.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 06:17:18 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quic_tdas@quicinc.com
Cc: bmasney@redhat.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 2/2] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC bindings for SM7250
Date: Sun, 16 Aug 2026 13:16:45 +0000
Message-ID: <20260816131646.10551-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816131646.10551-1-sreeshankar0910@gmail.com>
References: <20260816131646.10551-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document RPMHCC bindings for clock rpmh driver on Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index d344b3386..df9e37f90 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -38,6 +38,7 @@ properties:
       - qcom,sdx75-rpmh-clk
       - qcom,sm4450-rpmh-clk
       - qcom,sm6350-rpmh-clk
+      - qcom,sm7250-rpmh-clk
       - qcom,sm8150-rpmh-clk
       - qcom,sm8250-rpmh-clk
       - qcom,sm8350-rpmh-clk
-- 
2.43.0

