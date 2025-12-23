Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7FD352951
	for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 20:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521262; cv=none; b=aFFusX1jeacXHK5CeWYrUx6jrSSJg1gOt4J5l/QxQ7IUsWv43XhI6wI2P/WhbU0k5O8YAaotyaBafUUasvB5D0hLT62bMRbOqF4clvlnLrM4rVdQBfgBbb4EgBlSdpVdJwMS8517dmGSBrmFam/aT39oaPjVSTNKp9wNoOs300s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521262; c=relaxed/simple;
	bh=7hKH5EzmH1tw2QTQXNXPEJl0sVHK/le/PcpUxmqe6fQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OeWil4jPzHk+npTTpr+f5OiFPznIvaim8zLF8u4Mwpim6KCv64x2+PC4Mp9Q4ALZ+nB72cW/5xJp3YBP9bKDKiTZCiBqRAiEDV3PzhiHI3pkoffHJ1kNEMDD4qE9Pey9Hf34gcbENLkHEJEODlFXo0X8WU0ZZhzdyoz3galCcdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=qEXm32uj; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="qEXm32uj"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so5324265b3a.2
        for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 12:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521260; x=1767126060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MElNA+evLW3q9gh9PLqoqAuYhUoiUgxuy1qDVWGw3Ao=;
        b=qEXm32uj1+odh+mia+XgDAG39bxsV8BBnWSP0gbyH5RJhUfEzyjInuhiC1FtX9Wppx
         KLxk0YDYruP0rpIpgefdNHqLi8+C65Db06vxmizhWFJNlUeyE4PALzO+idf0NA0jEvMt
         4bfGeG4K9boAoeBljyhuYdHQPXx1fzDNbBeLm+/ymuEu2mywxvu0nFbFozqKna0aW5o9
         UF/l+z+RE/wWwKcEoAMBfnOLbiRWzz5O8Ua1eIoWr08agzCuSQBanUqTE3b4fvbRKl4J
         RwJDjpDIeBb/IhuLWShFAWC3/IHBkQBxlolO5/7LijryExtWwxx8zreGCz/caCv02scj
         QTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521260; x=1767126060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MElNA+evLW3q9gh9PLqoqAuYhUoiUgxuy1qDVWGw3Ao=;
        b=hQSYKY0zMsTVDnN9NXiODjmdVVwi7GCJgQ8qKtF8pHZ2w1mWy6E+mAwtiH809r6ZNU
         5Sy9W9dvagdK8yYtvpgS7x+h8uq4F3sMG2Csr3YN9w2TxMUyTnnJ1l6JVc076JxLdVM7
         NBQ8Vt1xVU+6l2GjsZaOz6Z5DeH56c8C/2K5VRw93l4cvUxNHSVbixkbuIqX/1z9rLGV
         QEGcT+gy5w27vpv5cXFSsxnuUzcsjW3cdId2Mm8+Fy6mUX1/xOkytgmmZQgKpyJhCPOO
         RZggRlLmlEIFLI5XMqKp3DBhl2yZ/HzyYK7ORxXsZnC+DgAmtbgcTa6h/BAQOK8g9GRM
         Pk2g==
X-Forwarded-Encrypted: i=1; AJvYcCU1nE/rPWW21LR/qho9jy08kh35fqIussE1YbNf6IRYERdUTjP59VWgVl0Hpw81DlFEgRVjZeqWwKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YydHp8XA0NsJ7Cir51nhIqlk9FnK+GEUnvvGoKkEPMr6jIlxpDk
	AdvKoxixHhLy58kO0Ry6n8A1M0LHBwJ2M/cNplvkM1dUt2FEvvb5qe8USHuZa1H+S8g=
X-Gm-Gg: AY/fxX7WzSFgLHL+9cbEOnWzcGUo6PwtnevTSOXSQLKg17aiMwj5cBIm/uXYYF5Wm6U
	/H81ubQ6nTsHwMFdbD4MFC2ttOehT49RYdK7BvU1wS+SsVr64dm2wL7u4Y5HnwuwP2NVbYMVuCY
	rPkF9RrP8ZnLqn2N1FRir1AkX0bFnfW+QQwP3ChUEfaY+MbYwxs9lRNEs+BrUjSr2LESyVhg9PI
	fFjyZT05pgGmQrxKGfgqlhAEH+HPVx1qva0+CGyufyFKPaX8rPyBS/6ZGq/2jGtxUYsD6LCXOe9
	+Bd+Tl2NIfjTXu9XEntTToaYjChPMjWYNv1wi3jAq3wVsvHwUuXUjBuQoO7qsXoZqKuRJ4pgUzl
	NZHnyv9ZhggF9L0aTliGaSt8vNTBPQjppjcXa2zydWXacT7lGKjDsNa2N80s2fOeOrwJxnZSVRL
	leMqRARx4ZeIydDM30CrR68vZFagblhG6D3l2+lEADAdazE2z1Rr7fEM8lQeOfuvTLE2BVUMITK
	CqjiSe0
X-Google-Smtp-Source: AGHT+IHKfwHDjFbBjFoOP1ZNZG2yYIy8Xdi86MslAqVbrnS76U8emwCJO7CURd8duOcxnItzlu++Ng==
X-Received: by 2002:a05:6a20:7289:b0:366:1880:7e06 with SMTP id adf61e73a8af0-376a5449622mr15082294637.0.1766521260025;
        Tue, 23 Dec 2025 12:21:00 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:20:59 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	broonie@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 09/15] dt-bindings: crypto: atmel,at91sam9g46-sha: add microchip,lan9691-sha
Date: Tue, 23 Dec 2025 21:16:20 +0100
Message-ID: <20251223201921.1332786-10-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223201921.1332786-1-robert.marko@sartura.hr>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Microchip LAN969x SHA compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 .../devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
index 39e076b275b3..16704ff0dd7f 100644
--- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
+++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
@@ -16,6 +16,7 @@ properties:
       - const: atmel,at91sam9g46-sha
       - items:
           - enum:
+              - microchip,lan9691-sha
               - microchip,sam9x7-sha
               - microchip,sama7d65-sha
           - const: atmel,at91sam9g46-sha
-- 
2.52.0

