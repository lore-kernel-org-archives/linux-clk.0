Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5A0299AAA
	for <linux-clk@vger.kernel.org>; Wed, 25 Jun 2025 09:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842797; cv=none; b=G7t2T0LDgpx2qnbtWaXI6CCcHxCzyaok/A4jDW8dZq48wEv78mhilcSOH2fNGNzggz/3KZDErnL7sLUyLo1JXC6kJQ/4fFs4E2LlgVFCTOeiVBRTH8BALwEv8Lq5JrSNyo8fL/vT9QDasbktS9AXTu6dp/cOX2tWbOmRhxvIYRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842797; c=relaxed/simple;
	bh=Gwv86YaLq4nMyYuk8Ga+pLFqTHUG/EjtEAyeU2iFtZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OH98yHNXjyQLxNU4/Kju/gOyDZbG7zGbtXgh0CUy8GKkzVQLNv8yaINa4woJVlnc6/+aj7ivWcshAJsMPzeclGiJqha6zmew7fzUOZ8RlkeJo47nfpz4ZZpj7JjxZkN3NfctBaGct3F/MJyV23XM+kd9qwTHrLkIjqp31YfGtHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=w55maAI2; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="w55maAI2"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-adb2bb25105so1002830266b.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Jun 2025 02:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842793; x=1751447593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QIonQPzr0yW+9KIT56dpfw0JEE8zh3WfbxaXN1wXE2A=;
        b=w55maAI2ViAGgCOVeC0bOEilvnyX84oSsNpmx4XY9AGM1IiE/Iu44HnvawufvNk9UP
         stlQ21LmVzeSpgmjsc5rHL1P0Q+VOdZvDMWMNi4Crs9+4xZzV02o6KpTO5VLU6wmD3cj
         dMbqX2xmjeFp5ukWbjn9armAmkORYRJWKnifczORnNiarvXblkkzydlFt8gTlYsPFBIe
         6jf7KImXkNG/HmF0xka4Ks5AjTSm1mRu12muq8Isdu2lLhbOL7X5hxtGQh7Z6iAkAnob
         WwOsaHtSoBoGnGvRItx4Mr1kHmSWm76lWPiBiPkR5G991S/DERb/CKYppEB9MvoozwWE
         uNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842793; x=1751447593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIonQPzr0yW+9KIT56dpfw0JEE8zh3WfbxaXN1wXE2A=;
        b=nL8CLdZ9WVH3lDZiYpr3/e57f5af+xloN5MneSe8+EmWv12oWJXlbFDj9rmcEW0MsR
         Lg3J+p4z296LaBMRyoiU9Rla8nen0mPvb+1ods3TniGF/qViMWyJWMdqGxqu2uhMrkID
         LZovyV0Zq4qw6rp03L9vFI+ncK2u1sK/GYzZT5k2py+Pg6UiUcpraIr9eNFrf2hv+i4k
         Dq9yEifTSN66swDPH57kttif4MgH1BT5StGOGaKVZbulkSwmUKZbFwYeMo4/2RxfcqF2
         jbOH2c0vpZB0JZoGhil+OsslukaNFuPHSXsJQROmcfufALzlbDOEFbU49IROxx4f0yDW
         5UGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkwDkMYJpzbquRy+I/muEglxv2zk+a/O1zXaWevX8Nu2MA+9Sz2byXrmCAi4i+Y0fwBbzqVmWmrUM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxly3gm3mrJ1BORpe+wvWzCv0FmaGYK8mDTrS7Xf/smylta0avZ
	pP0EWuxkI0l8wSHRBLByodKPe4W9vqqUBDSiMGVyH864stDw6uJhy7oYrNQJ/MPn82A=
X-Gm-Gg: ASbGncvJsL8YN10pZs20ygJImTme4ahAoPPjRa7BPx4vRHh6iyWHlsYFK7E840Nou5C
	6HSUf3IxMkk3fl5VdhZc0xQ8ceNmy9tnlSDZFRQ1li9qJ36XzkOeVSsqo/ILff9zpS0xKBBeTV5
	/qFt8LyZ01WaheQqJtn9ch1MP9el3bL5FJ2EXJpv7kynOqv2JyraFuau7JUOlE4oZx+d/9HVgJd
	7GlrwTDAYpbR8SqqB1uDe9w9Uku5cayl0OL9lCJAOGgAcEMX4CJ1oZyll4eVzj3jFbwB1KIRvl4
	lggPeqbF7ZDq4mBIlDidCXVFFHhFjBBZlBzZfbDyeaXO2HAdAwlUO0eg62OSFMQOcmUZwR8Dwhh
	zRtQ8CCa+c2G9vpwEO5/PImoxW8UK8b2i
X-Google-Smtp-Source: AGHT+IERi2KHtQmQ4ho4DAkM8LuxU28cCOfHg6BLub6/yIICgropn78NU/dR0TfXuDcxZ6KxmKngVg==
X-Received: by 2002:a17:906:4914:b0:ad8:8efe:31fb with SMTP id a640c23a62f3a-ae0beb3d1b8mr209242166b.54.1750842793405;
        Wed, 25 Jun 2025 02:13:13 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0a93f5e96sm272499466b.74.2025.06.25.02.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:13:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:12:47 +0200
Subject: [PATCH 1/4] dt-bindings: clock: qcom: Document the SM7635 RPMH
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-clocks-misc-v1-1-45fea645d39b@fairphone.com>
References: <20250625-sm7635-clocks-misc-v1-0-45fea645d39b@fairphone.com>
In-Reply-To: <20250625-sm7635-clocks-misc-v1-0-45fea645d39b@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842791; l=844;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Gwv86YaLq4nMyYuk8Ga+pLFqTHUG/EjtEAyeU2iFtZE=;
 b=dykpNwSjr0QLGEvzyK2lLZvCnvMi6GOSDRyxweW5VB0Oy8wkfDV3gYnxPAlaPGhVjMQEC9I8M
 gVc59G4W7/IB05nJrDZCgmK3yGnOuYo7iM0Us/OIXDZgypH5MsSxULX
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings documentation for the SM7635 RPMH Clock Controller.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index dcb872b9cf3e01f87d4fc546311eb758ee63af9a..340dc2613c9d8c6d1c5ca4fc74801ee6d4d197d8 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -32,6 +32,7 @@ properties:
       - qcom,sdx75-rpmh-clk
       - qcom,sm4450-rpmh-clk
       - qcom,sm6350-rpmh-clk
+      - qcom,sm7635-rpmh-clk
       - qcom,sm8150-rpmh-clk
       - qcom,sm8250-rpmh-clk
       - qcom,sm8350-rpmh-clk

-- 
2.50.0

