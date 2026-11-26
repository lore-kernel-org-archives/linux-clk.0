Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669177;
	b=lHSYUyuCsqUeNSXvcXcCWJGbpGPPi787DKF1Oy2lPXgQ5u5D/rS7ND0kbECbr7NA1ybf
	 FdzE8LXWtvuMhSwY0fDrYxY0211S1mW07rgQlsMNwNzevCJGTv3d+TQ8psTDTLgE7wO62
	 qlRctYfRuaYFEh2ZX8MZMzsRsQxS/u1dNn8/5TplkEt8ryo3+x7iI/xOKBPCKkAZAMbQo
	 tcPvMRBPE32/mZ4aKAHiygZm+aVyf8mJ69BgugXT/tDwRsMY/eA6SIBWEOsI9KorVYQp3
	 12LIH1hpwAY/Wb16e+AR2FWCXPmlet9c5heXKbhadmbCX6/fu5XcwxWXGYPA4DW01Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669177;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
	b=cqht8OdjPfuukBBirmhhICgXzCyCxw1s+rGhGajZqNNDAZNGiUu5VhQRMAOwgrASUUIi
	 yR1SZZSPZY2mFedxrTbFmEbAAxKjHkz539DF8XQ8Zm4xf7XsV5yXbVsjKflbgz+SSv/C+
	 GD0Xi3QRVNd1CC7HJwfpKLi5m8p1AMe6OwYB6rJtbvKJL68HOiKXkZ6+Aw0y4c2uqR+YA
	 uPmBQr3AQ/56Yr2Cwd07PZkVwgdVItA9DxU12v9YYZj8lzH+F3FHDGnoyhb7Gav2yxfOu
	 lXWhi73HMbt2cXM02oRcarBmcTfPeRTTTvRUJKoNaup6XafK3bmyLP8hNnbECSoS15Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NFzPJxa7;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDC4606A321
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 04:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FDC4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NFzPJxa7
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so10953798c88.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 20:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669175; x=1796273975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
        b=NFzPJxa7EhtRIB8MazICb1dZm6fNciu0+eLItxW0oiWruoT5aOguqNE9G7jmzxP/nA
         RkpbDJiqDE5/e/XWOmDUN9BV9cSiaDUdMuaUhMM5Z1F+/uyFtVQotT/LTzXewNqPOcrK
         541FmdJagqAoifV30pAUDCG4f8L7RW4NhtqiSqPAIzbhUAc+6zECJG7U9IjNiZrzGU6Q
         t+0xX+hdpAo23j3UIy+7AbGneIcGJTSZpbhmnjOS00LsvKUAP5XNqSiAFcbuW89YxiVX
         0ifHTVOKgbf+QXew0DyLfF/gaqOm2d43nuwGJtKoPISb2Lrlip4DV0RUkvymXqVvE1aX
         1tCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669175; x=1796273975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
        b=syPfHuJXdZzL/3StulEaCB5iR4RTcxq6m8bi10Jie80KsZWgIHaLq2YGwij5ZbbnWm
         LnCMGRC44RnZutn/WvM5N9B+OT0B8wECkVSG14ozNIBbxkusvqIvgRW//ygWMEOYy7T6
         FEo5QwfiKKS2DXanZApXx9myDSCwFnAv+r4uso/Y8HkjV5dUH2jNaHkhTlyoOItUP44q
         e8HrfkoFGgR5I2IabsPw0PGYT7z0CF8GqTQlkkzteDjcrxOsU8+AEABemfWPExnjEv2B
         jDkiyHdqeLjU+wjhwK/Ie6KQT3z9A7I4H5NLG7FyfMDLAZQJChboxbaphpqxe4NJmzzg
         6YNA==
X-Forwarded-Encrypted: i=1; AL+hErE3+iN/VYrmS4MbCBPeyspkhy88ctatDm3a/olai6B1jhRkZ5CF9FVo8N0xJh9M7xrVRcQ6i/TAa1M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fQAJwtn7K5SMnkcfpZWOSRMeA3s+NFmft4gDn73vYo4Nuy3rv
	dc8h7P5u1a/bLNrCxWgr9aoB/6Wh72Fqbu0OU9nFCcwaP8oNRjdK8nzk
X-Gm-Gg: AZFdTZc621Fg6NbupnOphzy8hIm8IzVJsxI+sv49BiVOt0jFFGLAeXg5rVDXDYsoaT1
	JRUoijqRubKtnG+oapw8lT4PdvqIPc32FsLaVS3U+I49jUsC/l0xI8nhsUe2QNqmCNM+IBDRZjM
	udWUVGd7colOi9RL/W44OPWTf11qdGHYY5aF6AOLvecGZX1U6DzKufsWAYKMySfocSwHBFI2WRW
	IpJORYzGLtBxrMXbuC7cvpcRcbO8nXct6pth0REgYqjH3L6PEp7fV56nsSC7SmBPa5xNIk6LCjg
	+NJhXTGKPOyptzO+zGdwMkdigGIX0ZHJjmHLpNE5vN62FWFaR/OcT+HNMWQ7rccMmr5rZAtVJHp
	V81AnFn1cN+n8da7OrGGX3TLDZuVhQD6ojQJnluOGqc7jyg5kXhuyNrSkj487zNaGFXlY6P9WOf
	xYvxtpkSFRkHk8vJM1ev5fagFrv9U/GNGu5OPqiNsGTO3qw2fMs83FMFaFkKHqTsHwsLPCs7c5W
	gBsZIFK5EzYbxwWVh5F/0iHo45pXtwOTOLeg24rZ68x8fcCGqKElNWdM9hw6u7pPe1OJzBCg8iX
	j6kCDULf8bqg87meGDCGaYkb8948Q8EvjYkQ6Zv9VQuUoWmIcJsWSg3vfo1VQgkRBnrSWR17MqX
	ceGGfqZE=
X-Received: by 2002:a05:7300:430a:b0:382:7375:1306 with SMTP id 5a478bee46e88-3856fc603eemr27572642eec.14.1795669175490;
        Wed, 25 Nov 2026 20:59:35 -0800 (PST)
Received: from Sobhana.localdomain ([152.59.222.211])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm54800362eec.7.2026.11.25.20.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:59:35 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 26 Nov 2026 04:58:12 +0000
Subject: [PATCH RESEND v15 7/8] dt-bindings: cpufreq: qcom-hw: Document
 SM7250 cpufreq hardware
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
Message-Id: <20261126-sm7250-v15-7-492014ec0a52@gmail.com>
References: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
In-Reply-To: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795669088; l=1157;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=tYOW7ZwAVWXKL25nNQ4vkjon/atY4Dhfdawj8MhM0Nc=;
 b=8XP+FxMcNtFvSYN8lg3S9ocnbk4kDsIE+kYG7fw3nlTEyPSnWVN5CZnQShpMnN17s5A1283xW
 e+Hz0YVjyQNCExYfLFHhn0nc2qpGwYHJGGrY6U07WfxPHY8D44hRghs
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the cpufreq hardware on the SM7250 SoC.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..f8cdb652f 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
 
@@ -201,6 +202,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
     then:
       properties:

-- 
2.43.0

