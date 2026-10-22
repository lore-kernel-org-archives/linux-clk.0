Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792684655;
	b=jz56CbSMwjPg+NOzVxzr3toBE1XVA9mg2kUOlMsj1nX3OLSuEhIL+9b/RM0afHooGlw9
	 60s6tCFAjk/Luj3mFC0B2uSuT8Wi3kwJFKIy/Lndexn+lxKmBMFF3mvWbWEbKshpYCS6s
	 yGroDvlwjjrZVT3aHHEw9dtJTdV82nuE0vJOkdWeIV+n3kDsv6trZygfedcPLXA1BMqnX
	 XiJAiQC7OehX6wjGQRa0kZgYowAWrNn2bxKXVSWd2nb7E1r3DISyGEtC1H5rEKkPCzHEs
	 hzs4VldNw4DoJxk6CExNLG/lII91qcU+/OR4f4wil+mH4D4S2G6F1TCgH90EMmOHUCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=bCyNFGNC5QAv5YoFhc+XguwmFWmtXQoZNr4gvZ9GhCA=;
	b=4lsArQ/8nBcaFo3MvCkxOOBM70cR9xP1mfdDB6Ep8kcGEvCawhtS670fDKMQAh/c6qcJ
	 6LmdTuzsAIIZLSRiQfrGvw7z2HHP8XeWjSsV7GlfO5Dpt6PNUYpI/Bv5eS7L9TdeQquJy
	 6AhxV7E8Qk+3rttBrRwFpyr+8KGPbT7f2cCBBuzUUf+/f2toYCPRCsgb/ZDgfGpYWlebj
	 yTtESdRR0RZIN68Cdjgejlch74H3lJ/Ei0g+6C/WOcCzVY4LZOBtoK5fjdcloP+uW9CE6
	 XfimywckO00cGcAxT9v1E5VZ3sJDdgFzY3lw+R9hhQg19897MVU0J2Giv8UHwRIT+Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mopEgmah;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15FC606A31B
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 15:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B15FC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mopEgmah
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2001dd4e7so21891775e9.3
        for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 08:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792684653; x=1793289453; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bCyNFGNC5QAv5YoFhc+XguwmFWmtXQoZNr4gvZ9GhCA=;
        b=mopEgmahGi2LZ/MpaHEcX854qnec/UxPeuBg/hGh/Z9nqojzxFpELxS5fnOV7Ltg+9
         Gu+BuVPMR0i/9krCj8jdSbsiDRrbzaKK9/0x3Oh6BYf7feHfZLq9C/pypGvH48fJZQNS
         OoENBd9sWkdVdvP/6JYfb+eE8DWXUUVdJMnUm5YLcqYZ093zo6wW5TD8XhCyDUKicZAD
         wdO2+v0YRLJ3j4PWEOrXP8MJnwWGsaqquCM89EB0hjYjSodI1yeqMauHYpgy9nEeDDWv
         uPCsmw/luwwKeW3N7URKQ/DABaSPe9OHD4HGV0R7QRryY5gehPYFx5qxdbr8ZAoE7vx+
         QIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792684653; x=1793289453;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bCyNFGNC5QAv5YoFhc+XguwmFWmtXQoZNr4gvZ9GhCA=;
        b=P0Et2/9Ov3u+Qb/SlmT3J3/HLRMXZ+qopRkR4B6MVS31Je4w91Gu9sLdsZ72KHexVb
         ZASjzZMyVDd4WkDazpnkLPdl7KXQcBqGQVd86yHTcdn10wn7JfQgqx/2zxgwuA0loZhU
         65+Vpy8FtVskkrXGenNf6PGnucmbgO1nsOTQbyY+mSXMUpEhWKlX+laaDCiKNSD460Em
         mCkGXlf2Ttck+w9/g+Y+sJikYEXEIAZTeaBr5eDJWl1io/wWbwCfO4Upvg+ozbvbAQvs
         gOWJEoq/BjxBC+UPuH3O9Sa6uSPUp/7FAgfKqCgCrJaBCXmxNz4QEaberqRt3WngUKei
         750Q==
X-Gm-Message-State: AFq9FYKNWMiLrgC9Da1QT4TPSBHy95tXBweXR2uML6mXL2RazBlNhiwP
	gn+dEa5D7UKE0aII0tvTHIxBIWedyjRM+m/C7R/lNMzKqhkQcJ7ZeGn4TFhO4rIYE9A=
X-Gm-Gg: AYBFou0OIdRQTrTiLNR/8COmWorJOjDpOwd8ux75qRR6jDgF/BT8FUwxouGzFaEdTCQ
	wxUXIgW/MxQg5VLXdAK+mvHZceHIgmFrCgW4sLhYeehzaY7w74etamtJ5VFss7J2pjnBpmyNhrh
	ht5Wi5XGt+Q2PioZi5FD5OITCLmXDguSP0JEPmFflT6ottj20I5TapVHf1uZIie4yTzzfx0VbVL
	svAMFFP4qsq1r7EI05xmP3fBqNPD0n9qtCFNs+hgYmwUWGAq6Jkb/xsnvZHfbjWsLJSKXgM/s2M
	jHcHR6Dc7rsJFq9LDKN2N5lAQ12IP+QcMDCae1YWXsVRymEMUlTFZiSBRv3ZsA99V9eXdzSkMua
	GkrNJbfUEd9Y2vSIJGU/JMKrLh7QyCVWZFlDtK375JjoSxQ4VUst6nFc1pI9hSDvD7AWHDHrE/q
	olZIdI5WF1SrqXY/pJCq6WT4sLcTRr7sH5mnFBRhH5fpoZa5indsrG/AwLUJQfjhOT8jN5dK8mm
	N4yJvGl+ZhO0zfx1ISDauKTQd9IkH2zum2cb6sm+C8ZA6LA5n/1nXC5JQBB+Z0aNEkaNLbpD9WH
	yn09BHu4vmlQKtFpTKJZmlJPXB66
X-Received: by 2002:a05:600c:3548:b0:4a1:e774:370c with SMTP id 5b1f17b1804b1-4a1fdd145edmr114281495e9.30.1792684652964;
        Thu, 22 Oct 2026 08:57:32 -0700 (PDT)
Received: from [127.0.0.1] (mob-83-225-32-96.net.vodafone.it. [83.225.32.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd360e4sm96519725e9.4.2026.10.22.08.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:57:32 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 17:57:26 +0200
Subject: [PATCH] MAINTAINERS: cover all the headers in ARM/Amlogic Meson
 SoC CLOCK FRAMEWORK
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
Message-Id: <20261022-upstream-maintainers-clk-headers-v1-1-d09dd4db01d6@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQrCMBBFr1Jm7UAz2CBeRVzEdGJHbSwzqQild
 2+qiw/vbd5fwFiFDc7NAsofMXnnKu7QQBxCvjNKXx2oJe9aIpwnK8phxDFILnWshvH1xIFDv3O
 K5P0pHV3qAtTMpJzk+7u4XP9u8+3BsexdWNcN9iE8poQAAAA=
X-Change-ID: 20261022-upstream-maintainers-clk-headers-fc2668f41f5a
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

The ARM/Amlogic Meson SoC CLOCK FRAMEWORK section was written when the
GXBB and Meson8 headers were the only clock headers, and only the A1
ones were added to it since. The headers of the AXG, G12A, A9, C3, S4
and T7 clock controllers in include/dt-bindings/clock/ are not covered,
so ./scripts/get_maintainer.pl does not return this section for them.

Match every amlogic,* clock header, and the axg* and g12a* ones.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..e5bda99b3015 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2555,7 +2555,9 @@ L:	linux-amlogic@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/amlogic*
 F:	drivers/clk/meson/
-F:	include/dt-bindings/clock/amlogic,a1*
+F:	include/dt-bindings/clock/amlogic,*
+F:	include/dt-bindings/clock/axg*
+F:	include/dt-bindings/clock/g12a*
 F:	include/dt-bindings/clock/gxbb*
 F:	include/dt-bindings/clock/meson*
 

---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261022-upstream-maintainers-clk-headers-fc2668f41f5a

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

