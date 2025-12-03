Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652CD2F3605
	for <linux-clk@vger.kernel.org>; Wed,  3 Dec 2025 12:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764764613; cv=none; b=ruHMhXsNem9t491sj1gqRLJZ6J3GKGkVybSfy9H8Xu9IK54bdjkn/z9Zh0VMyqi2LQ0LeLyOiWRFJc8TMcVDDPFH74xfSMzx/K2AryNjynjZ3HYJ8lFPlCunuPGsKKy+sqbG2E1vdC2M/YeaQ9hJoZmhFz4oE539bYC83kE+/gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764764613; c=relaxed/simple;
	bh=NxtJzgFmiV1E4Vkc5ZsSa30BPNQ2UxpzQEAUPNYwUwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SxWCPn6M7NYwfrMN4fbMg5Fq+YcZewZkZ26bbnnakXo4mMrDOqz/jIwCyI+Mt2S6+Qftf2Y+8XrNiGdq0TdFmDFjGHue2RHu9Gnl6F+QUnYQjIFNklNm149XIPTqFopqPsdPYRJ2EK51D4lSd4yJPiaggsFPz1sPf7669AJIu64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=M/ty+Bga; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="M/ty+Bga"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-882390f7952so72313676d6.3
        for <linux-clk@vger.kernel.org>; Wed, 03 Dec 2025 04:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1764764610; x=1765369410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UFfRQ/mCyul9iPxIkRd9hdWn0tYgTUuUvSNMVexe3M=;
        b=M/ty+Bgaxdkal1GaEoT82ZPaoC4BadaQyRTHmrMGmAxXyQqDi5uSZoYKXQwXea+oee
         NvSMKLBHybz4n++aWptzBgagbRbz7hnZ1LJa1V7QAN/hfrqzG7azzZbAe3SmVuVdYyAV
         rGJ3lM+z1DrK9y529LT+xkSAyLDNBkN4JZix1HncZxgvaOZgyYBwwkQoGcSu07YvvXCu
         KACe0JF6m3V2ZTH26IqQVyVhq6C2/WIII8fwJyG5P0Z7wEjs6etQO+08hzMirGuJinf+
         6k4Eia7Bvfj6wQuF7obGWxA9PTMPuRfrMiGzsvzmr+0wBvTKBrWyTAnWgYEycCGk1PHR
         jeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764764610; x=1765369410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2UFfRQ/mCyul9iPxIkRd9hdWn0tYgTUuUvSNMVexe3M=;
        b=L2SIgHxepCI4oGw2adlcqsrqIXE5Y3UbpaR7zjhGgGpbaZIx30hpksSh3NW/zPSuAD
         OC5RDKpq7nNVRDxycdmwgBBS9iegINt7iacnfeWXWhKJsjtzcg+kyJjLU3+Z72AtpTVx
         NvzcQBDWpAl4NGyuBPJlShw07zYQxSYJOyKOMPt4E8Vhrnq3D0LltzSd8GZiZ/ZRKZ58
         ENrsiepwc5euLEpz6XEIbZFXFCxoUFDEI4xQHvaWEThLCnn0CVOLLheVzOZhr+mvtwuY
         JFszadHF0waVR/BW6+nyg8iysl4qAns0ZJgGF2JY3920glJZOwKfZ2q+wy9rTTrwhRyw
         W5PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNtmCMO+Y8XIALkpDqnqvv66dY1Eh/FZu4a33GlGVsyIzKgEiHf11EWXjO939Y9FW+9NFd8FkHXp0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJfbrEdhwwxejojV9txqsKSQUeTTd2cvXvwyZKH7gza0tFV6lr
	pVV/oXGvYeICIOhw6jcUpbj1N4eajrPdctS98heDUmMt4gSvZrKjraj054efv4U1adA=
X-Gm-Gg: ASbGncsKaAB6fMLuOUnb4Is3hSegvBnf2aTd48yZqBJSvV4u9crW0tUQNtavxmxaJVJ
	eiLvFaimZsX+XS4qD/x7MwC/9d6vaeAo7sfZF9HCw2srAWsvpYpt+5Ui5Wv4BQe+FfGXtjbpb7K
	4QlcYUYUHlYRnlQEN7cbSBw46rKWdZsk+JnCJ+Drxr3hXjKHT30NTwxWzgif3zgk9q1u5OAP0Nh
	Yjzgj8hMvEH23AUZxRcg/0TlSEtrEU1lXHFmPgT613CNq0GpTB81MZurOTfRiiHdctGdcV07sg+
	xfZle3hWVYJnUDTn0C31QIVhIAc/Ay4F+EhEdNACdlTLptUKqIE5UDU/N6ZIE58GMGvqK0C4bem
	0gVQTjiPQfcAGNuFxNnRc8DE2f2d+loGclM2aT9/WpYIxXzE7VDXvroTCa7t1JoF0bfL/icXgnP
	S4jRYl9zccgfz9ghhOIcqLZlWT83/3Tzcb/9pwoPLnBmgu
X-Google-Smtp-Source: AGHT+IGsaXlqNMoWBqDJybU7SgFep9PuPbieD5S4OluHzHLsLb5SxcZWmzH1944iGtWvvNXqPDBk/A==
X-Received: by 2002:a05:6214:33c9:b0:886:3fd2:ea78 with SMTP id 6a1803df08f44-888194c597amr27028086d6.24.1764764610234;
        Wed, 03 Dec 2025 04:23:30 -0800 (PST)
Received: from fedora (cpezg-94-253-146-247-cbl.xnet.hr. [94.253.146.247])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-4efd2f9a755sm115214351cf.3.2025.12.03.04.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 04:23:29 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	richardcochran@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 2/4] dt-bindings: arm: Document Microchip LAN969x
Date: Wed,  3 Dec 2025 13:21:30 +0100
Message-ID: <20251203122313.1287950-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203122313.1287950-1-robert.marko@sartura.hr>
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Microchip LAN969x is a series of multi-port, multi-gigabit switches based
on ARMv8 Cortex-A53 CPU.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../bindings/arm/microchip,lan969x.yaml       | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/microchip,lan969x.yaml

diff --git a/Documentation/devicetree/bindings/arm/microchip,lan969x.yaml b/Documentation/devicetree/bindings/arm/microchip,lan969x.yaml
new file mode 100644
index 000000000000..3fa1d4ed40d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/microchip,lan969x.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/microchip,lan969x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip LAN969x Boards
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+description: |+
+   The Microchip LAN969x SoC is a ARMv8-based used in a family of
+   multi-port, multi-gigabit switches.
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: The LAN969x EVB (EV23X71A) is a 24x 1G + 4x 10G
+          Ethernet development system board.
+        items:
+          - const: microchip,ev23x71a
+          - const: microchip,lan969x
+
+required:
+  - compatible
+
+additionalProperties: true
+
+...
-- 
2.52.0

