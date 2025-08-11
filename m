Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDE52DAFC5
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 22:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754950636; cv=none; b=hTFmaLbaenwVSzukWwSqGyXXBkfodjwDZdlwOIjIFq/tHV4TavJNjyPpX0D6EzyJysv1pt6yZ3Nhz9ckEpEokHtmrtF0VC4os3jWEcMsvCpFQhtO9Du3GYdQcEF7sHskzsPDnOXHCOanrR9Wof75+KcXPZh2QIVth3+VC1Ezlrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754950636; c=relaxed/simple;
	bh=6zMbsQeemaLT9qsDKon3L3xPV4wlTm/uDmufkhqLnVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=s0bkm95bUuqtFrsbzkGVCCogwWbwBaTDPnIvf250CbzsG+0yNHc7foUwBLa++t+o+zVNYlr7vi+blpqzA961FLKk3jvDhCLl4sM6IphzAMJkGw1OzjKGN8nhTa5y0LuCI2Ba50RoTidTW2W+QsP4vltZ9T1nMk1gjQy8aQoiDbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=MoVJWFI6; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MoVJWFI6"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2eb5cbe41e1so5322057fac.0
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 15:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1754950633; x=1755555433; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xNjy4x9oFNeCSMPDvjvsMqdoAFBJssytJuYnj0zLwq8=;
        b=MoVJWFI6IWfPoRMAbLUeAap+YdCPVPWnM5TuFnNwoFCRikUnYS7vzG+g/QpXEOIxtl
         zh2K/ejltXfx4jTYBI06+uoux8EqUN/nuK4SHJBSsElvBEnhwoy+QVtLGIWhVGJZA7H+
         ez+tPtBNhEJpOdXh2YoeRpCP5mfno0Y/XsQCLqRz5QwDBd6hCL3TjIj7XO7PMIZ+9Pqg
         5FWxq+IVhGPhS+Umvnwrs3dNNT0OEqTnbikFecql68nirGl0UeaubFfQQt5LNLw1SM2k
         eCm8+WfHVOHInQd46hGkg+RMAQ2kZPPviFm4PRN0Tj5NWAg2qx6+xC1bceJgCsh6AKP5
         V1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754950633; x=1755555433;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNjy4x9oFNeCSMPDvjvsMqdoAFBJssytJuYnj0zLwq8=;
        b=HuYjHcmD77JoLawanlRLTlG8kbvM7omWMk2LoG5SUCE1lXLKJajK7gNAYT/bCjkdzr
         JD0lObPze5D4BNOT8Wfa59DYWU8BTZ35s1e0AYAFDQom7VjabwgXyF6Kk9sl++VQ8MFE
         TXNiehkRSPLYh35iHUqAdEReQdxr6BR6mcZthQDVL8PYbAl97noNbCuW8x2AAYpluxKK
         KPJvE8jls2nm2KiSs3OZ2HKYDw3pFuoGSQOuWbdM5VeJe2+A2iyBfbcl9/44qH07e0zH
         iUFepBmZWUxU35VYUimDPTb+oDEr/o2lLIYvQ0672gE5K+cL51WCbFE/QfEFXKvF7R/f
         7s6g==
X-Gm-Message-State: AOJu0Yx6+hMRNLdugc32i/kiWz9INNXMtxXZmmE24BnAqbPaOdaNU1T/
	mTpZ1muwGUJLKgcgg3xaHbo4Up/YschkkUYKtIJlMqUrWIKGYfaMeIWTFnjT0z31osw=
X-Gm-Gg: ASbGncvvzR6ReQSFWLfvaMzJBFHxsFmsgJ7SEMDdww5xrNxhgTAXHtHA8GjaIvprRB2
	yVDVkUc5QqyaRvnbKSKl7I3EOIYJvZGD+VBDVvvVoLQ/eRMIN6G8TjqWcKbvDzlVgek9SAasMyF
	Of3qhNS6MzvXIhaAIYTlUGC2WkDoeCJwB22OwXpOxIPEj9NAZVMGEOHy04MVxBRRy8GbCa/UZ8n
	Y9rBFEjbUMBI8GVMeJg6aFGnJji8TLdqaG1wvaIrnZgEGfmx83UEqV2lLyR+IkMUBNVooGXCJ1C
	aYE/8hEb/lATOeBhySw/XX5GnX/DZJRDKQHBASLPGOVYzNYkGHEBvvGmTXcl/mTjI7Sjs0SGSJM
	D3jUj1ROO1Xm7cmuuRzWjW3brDtMf
X-Google-Smtp-Source: AGHT+IGfPiRvZKy6rxD4u9Cif9ZJqjUmLXidFEtaaqAJKIjiQ75nNSgQ5MRUryvHD4v6+OcsVx68HA==
X-Received: by 2002:a05:6870:700c:b0:2d4:e8fd:7ffb with SMTP id 586e51a60fabf-30c94e8080fmr798012fac.1.1754950632887;
        Mon, 11 Aug 2025 15:17:12 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4a4f:fe55:51b4:b5ba])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-30c8cc3b8a9sm475177fac.19.2025.08.11.15.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 15:17:11 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 11 Aug 2025 17:17:01 -0500
Subject: [PATCH] dt-bindings: clock: adi,axi-clkgen: add clock-output-names
 property
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-dt-bindings-clk-axi-clkgen-add-clock-output-names-property-v1-1-f02727736aa7@baylibre.com>
X-B4-Tracking: v=1; b=H4sIANxrmmgC/x2NQQqDMBAAvyJ77oJRC+JXSg8x2aSLdhOSKBbx7
 017mpnTnJApMWWYmhMS7Zw5SA11a8C8tHhCtrWha7t7OyqFtuDMYll8RrMuqA/+0ZOgtrZqMAu
 GrcStoOg3ZYwpRErlg25QvenJjbMboA5iIsfHf/54XtcXikBLnYwAAAA=
X-Change-ID: 20250811-dt-bindings-clk-axi-clkgen-add-clock-output-names-property-f413c3ef8bf4
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1351; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=6zMbsQeemaLT9qsDKon3L3xPV4wlTm/uDmufkhqLnVY=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBommvguy/LPYy0gdbX3Hcqe+qgkhBDoIbu0U6Po
 vM2msDB/EuJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaJpr4AAKCRDCzCAB/wGP
 wD8qB/9Y81s4hgteVENjJBEJVhH0/XRGa4C4OPOfAhy/rC2BXj5E1ae1MH27tHk2L5OrlyGm0FG
 Cyg83PMwCHuE3QmpOZBAw28shznI5C+GGS0SjIGefq+AefIYqjYBD/rUCbCo/sFmTdIoB+L9YnV
 Sy2Rdh7Ti1HdYRQBinkvnykThfWJ2JRqgBfxa8MBk/43iZl9OocMmEgzea1Q9Yny7v13h1AYwxn
 1NhbR7ZJl0Fcw6lbaRH+D3X7uk7ObYYMHSd0VJnie6ceFPZS5DEguqDMqoqqaonHsS0Nn/IwEC/
 kCvW6vuRA8ma6gYJnRZ1Mjo0YVTymyhXHTifS0ocBq+hyYgb
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add an optional `clock-output-names` property to the ADI AXI Clock
Generator binding. This is already being used in the Linux driver and
real-world dtbs, so we should document it to allow for correct binding
validation.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 Documentation/devicetree/bindings/clock/adi,axi-clkgen.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/adi,axi-clkgen.yaml b/Documentation/devicetree/bindings/clock/adi,axi-clkgen.yaml
index 2b2041818a0a44456ee986fe29d32346f68835f3..6eea1a41150a7c90153cffcfb5b4862c243b4e0f 100644
--- a/Documentation/devicetree/bindings/clock/adi,axi-clkgen.yaml
+++ b/Documentation/devicetree/bindings/clock/adi,axi-clkgen.yaml
@@ -42,6 +42,9 @@ properties:
           - const: clkin2
           - const: s_axi_aclk
 
+  clock-output-names:
+    maxItems: 1
+
   '#clock-cells':
     const: 0
 
@@ -65,4 +68,5 @@ examples:
       reg = <0xff000000 0x1000>;
       clocks = <&osc 1>, <&clkc 15>;
       clock-names = "clkin1", "s_axi_aclk";
+      clock-output-names = "spi_sclk";
     };

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250811-dt-bindings-clk-axi-clkgen-add-clock-output-names-property-f413c3ef8bf4

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

