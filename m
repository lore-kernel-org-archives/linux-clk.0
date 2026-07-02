Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AA641C30F
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 08:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979851; cv=none; b=hY3tz5mnOujtQUFP0fca9fWYy8npnpTTntiJvoW6pnyL+aZVINMJSrGAdUqqeHicwyo3PxkQM4sddbMCMubUySoEEs8KQkvqDNhm90PUBAvY9R7evbq6qVjJJlRVtr7Ioww6r+pF7iyF1L8LxK8bbUmx/iXsYjooSbOCkVh0Mx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979851; c=relaxed/simple;
	bh=CzBUXV7sOVhx3D4ZGCj9tufXm0ii5Jrd89A5CtNYTv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dSztvqWc3aHaPLdCP5jkyVhlAavWPtFe4Jic5Fw+kKRrwbmorXSJ4UhKYKXsWWTTvwAF1oTjjIbS2+HlvgmzlqTumCbxhz/ICEYGB9Fh1zGHrqwr2nwGYZbCwqVHjjYmW8G3Sm81EuDdMqdeOJtAQYZtls9ruxtnc5BhRgvP6m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=nQlvWCLE; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="nQlvWCLE"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-474e7ba9fd6so853812f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 01:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782979848; x=1783584648; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XOiiEpGpIC5lxOzEa7sAsZH1/Y83nzXYTBPvtikqmXw=;
        b=nQlvWCLEPlHDW/pUxu38mncdVLzDn6n9Pv/pyUqEW2loAADwDYlLTS82eya7dv1b0F
         1LnxN43oXYC5ygOn/YdX+f1VALXJo2k8QQf2WnUfz0JxbbfoxV1xJFQU/iAhMe7d9gEB
         LgwIw3clh1kJtsrcGsgCa3P91j4zQeOy8+IOWJYbQIXUSLID6BgyAIrMDLa9Ikk+Tnvo
         Kjl/KqhHnZ9OnHhLRTgIlKvXKrKzfsrs97AncHGtOmRqxCs5gbngLjrvPNE9Z8Pi9V7R
         azaccBga62+15UXUarzY3RkAqFz4BwYqLUhZjp5CWwOZgyflyYt0P16b6IiiFOh1bYoF
         zqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979848; x=1783584648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XOiiEpGpIC5lxOzEa7sAsZH1/Y83nzXYTBPvtikqmXw=;
        b=P3VuDesQC8s3aHR/9uLW5BH5jxsW13WbixkKwOy2Kpxj5cjQEUlQ1GyNy2zm0j/hch
         itWOyB8g2FgL0Q1Rd//p/s8hMVV9BZsBznYGUZoGLzekQnEwdn15WdZZCTlDFw5xRHwq
         oNo1sHjhzsNRB++za+d2ERazpaUIdSZkJUNgs2w1z73HESA4EM4TqsRcHA4xJ0b3OKfv
         4l+aTZviU5OsAkRxlTLYHvJZ3ObwIvIo6tkbLbgq7H5/Qk/4B42s+t6VuACFeDMQbm0j
         rRrsLNmaEJuhtvVEuRmZwQXJOJNI76l8Twv9rDGwgGLOfQUWO0l5F85T258Zu7sIo5g+
         9SNg==
X-Forwarded-Encrypted: i=1; AHgh+RqQRQv+hQd2K/QHjTrUjteLhtrHw71t5qhMV9MBrMbXYiLPfPtAhv6hYGoWjZzJlRqzEfC3xhvGE2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp8jcAeezzI9uFjrXk4hJVlrAeprapi8UETKSyU7wvZfUXLopG
	ePz5G6Q33XKXhJFHaETGDG5YAfHD68G3ocZY5uQ5FV33PoKSSKfaEcuD7KTDDgxhGAw=
X-Gm-Gg: AfdE7cmojOcJEbfFaUUEt+c1noct6Q/SzgghEYWJ2peBVtwjxAOBEfYxhPfNSw7UPD6
	dwM++C2NJ7v+kb6D2h1nS+fsDvisSUctMwrnl6/EK8W18wcbcYlkKR9H/mj4dtHpomx/HIX0flv
	efxD/8tk76si3axfFMXU3FsYlbcPffoarM39lEc1LWmuNM9+TVd8cfwLWebl5SE9IJGCXRsSoRn
	KHfZPulnd32OlAH8+IJNz9CTCcGGLQAQ74praT9euYpMdxTrZFWOOMjVCOsthCmR2PEICJNrvli
	hXjesEaT5dZpnRe214aHLHjPALR7SV4DypqqTRv4CKCsOSmLC2s3Cs+i4HSMPQItb8lEH7q9+QH
	BgAufklohFJ1AUMcaaJTHMz+mMVGN/gE3QvjC/T64g4qwHerkulOGKtLvrpGMoeZeqOEec0SeDd
	3EdgEFpH8JOgs=
X-Received: by 2002:a05:6000:18a4:b0:465:ba53:a006 with SMTP id ffacd0b85a97d-477588e7d03mr7472094f8f.23.1782979847883;
        Thu, 02 Jul 2026 01:10:47 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2e3a:7dcd:d2a4:6556])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-477dd94c829sm6374826f8f.24.2026.07.02.01.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:10:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 02 Jul 2026 10:10:01 +0200
Subject: [PATCH v3 2/8] dt-bindings: rtc: sun6i: add sun60i-a733 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-a733-rtc-v3-2-eb2580374de6@baylibre.com>
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
In-Reply-To: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=CzBUXV7sOVhx3D4ZGCj9tufXm0ii5Jrd89A5CtNYTv4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqRhz3c3Z+CDWtJbpQmgihyGCywyiqoUE3JkQyt
 6xSTIHXDA6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakYc9wAKCRDm/A8cN/La
 hev+D/9qqaYp4+SX4EN+QRwhZL9SKx/Rjuxo5TLCmPxSfNWP/r82A0hPjW8lkiXBaHr0JFpStVl
 jzHLZcQ93NroFjk9JyixfEnW2GKdPE/DADdhVBQBRnB8rwQxJHJWFuWFL6JrbU1MW9Wj48laRaa
 6cmou7Koc4vN+e9OClHXcB+Nw8NQ1okWbDUzwmbsZfMypkIyQnIPsvc/HX4u5tsUDCfVbU3x8+n
 iyPB2URXAHkgLi2muc2ZWr2FTnuSYE7rFOjsax5ymg7+CQzHWLED0nz8JFxqd2BaraF+Qeg95T/
 +fCm1g8Rjb4/vkW63foqIcmbd4PdtFdq5SPpcG5jWN8PXRcU+PrZ3gng3z2/Yl9+lSZtxJHplnG
 rM7K78UOnSYxqV0XZb75pVHjQSkgFC1JNOk+XtV3dTi1Oc7o21Twp4ct6qLAeJ5vV+WWYivLCPR
 t9TGq2qozq7pQPVtqppeCAXrgwi3U4O2bWOu3CYOv3ZJrVvXScRmFujVs8Gr5p1N5y4w2Rf9p/a
 3PKVMaOyiM1tf8rUsiCGqyl8HffUlRS/Ih34/QYfrutYr/EJfx7lTzxu6Guntcq93hoEVXn7vsy
 I69t0vQV7mb0t2d+pLhEXvDPk+OaCQ2lD2nOrPz0aMGgCg8r/ez2P+dYIfEpxKh5fqfbk1zpoqw
 3YvXKzSzMXDUKZQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add a new rtc compatible for the sun60i-a733 SoC and new IDs for the
peripheral oscillator clock gates of this SoC.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 1 +
 include/dt-bindings/clock/sun6i-rtc.h                              | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index 959a012c626f..f2b91186ed37 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -33,6 +33,7 @@ properties:
           - enum:
               - allwinner,sun20i-d1-rtc
               - allwinner,sun55i-a523-rtc
+              - allwinner,sun60i-a733-rtc
           - const: allwinner,sun50i-r329-rtc
 
   reg:
diff --git a/include/dt-bindings/clock/sun6i-rtc.h b/include/dt-bindings/clock/sun6i-rtc.h
index 3bd3aa3d57ce..5132a393ca4b 100644
--- a/include/dt-bindings/clock/sun6i-rtc.h
+++ b/include/dt-bindings/clock/sun6i-rtc.h
@@ -6,5 +6,9 @@
 #define CLK_OSC32K		0
 #define CLK_OSC32K_FANOUT	1
 #define CLK_IOSC		2
+#define CLK_HOSC_UFS		8
+#define CLK_HOSC_HDMI		9
+#define CLK_HOSC_SERDES0	10
+#define CLK_HOSC_SERDES1	11
 
 #endif /* _DT_BINDINGS_CLK_SUN6I_RTC_H_ */

-- 
2.47.3

