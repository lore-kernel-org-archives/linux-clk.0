Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501230;
	b=iiczGnyO0mvw8LGgErWOnQWAqxjgXO5gfBbb4S9EUMOjcWPYmya0BEa/IkHYaNU2qz8A
	 6Adz4MVV7wwIaFLKNZaq4TdaBreH2qSZYyzfRv36Jn4ROZL03PNO+T9MJxPpt1Jb3h7j8
	 KkckepAWfBM4veQum5m7RGx1TRllawPXHeHRhXe5RG7kvHktoA7bMFArRujBMq3gTHxyt
	 f1NwPe+TOKW7Pm8yB0r6xCIxR6mzePE2+/GO8snx5ylPkoK33Tkjxj90mjhu8lGuvUINo
	 GbtEOb0RoR40PW6MsTSpfx5F2KiF68wJTYfxjQ054Y0GpOUq7XQudmt7emkK5LEhTpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gDnFObZ0K2X9/qO2ilzZd80c6UZ6TUK8OX6LvufmLAA=;
	b=Ug1MV+ZHXa9aa+b3vK3FAib+Bf+D2AEEQ6nDpY5q1sfE3wUXHaKHXuIkav9MfMEV3L00
	 /ac2IOPO3X7JXs0KmdAwvLog33ptCafdHfteb+ZzN7SaHuBeooPjmDOeP35DVRSTgnhiU
	 c3gc8HrsoyWQe/q1kJtMBw2IphdpbEccHMiXiVCuce54ipcJh4jb767HN4o9cShIU4q2L
	 SSIMJmYyms8z1/4gUxJHPlH9Ygp5eASbzDxHjWGSPR+RizSrzz+HkIwOuAXC0etJmCKP6
	 Wc57G+Xoq8JPtvLLdPBrhG96rMjvVebQAX+I8SV+yFdd2SgDv/vsU89N9B0nAHk4LpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="p4l/8DF9";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4D760A4AC2
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 13:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF4D760A4AC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p4l/8DF9
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso2058773f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 06:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501228; x=1793106028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gDnFObZ0K2X9/qO2ilzZd80c6UZ6TUK8OX6LvufmLAA=;
        b=p4l/8DF9+/kYzcvHQwOneewQdIXFBAmaAIofNK4rYogA0p6b2j/4k28KAy04iAOQ+v
         Q8+DfkO/hKDcSxybfRIB/8oGAkscX0EMrg0N1JIRBHIhmHjDxc7gpzxJvNaM7uamfipj
         FQbgA11uYbN+ERU4IiiyOgZhWX6v7sRYJZBzWkuMK2EVtHtek6ObeuyA0FbWaUBVRg2i
         iOaFZ3M+c9VQuy1OxKyUIP/kjUGSLEheSnAiCfnKqofRPPslBWn1sMhSPAK3c+dq4AQf
         5Aer6fU9gvSOdpYJw408drds4U9ySb6zuO/55i8bNFqdGjukPkM0kDIdyU0IuHXi5plR
         W0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501228; x=1793106028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gDnFObZ0K2X9/qO2ilzZd80c6UZ6TUK8OX6LvufmLAA=;
        b=RWH3T/KV3xr+4huUFI828v5ci01f21ssesmNjI4vjqcEZk3LZoML363hodhLf1AVbi
         23AiWvuXoG5+ng6ViN2IhzjlQKUOJT3DsvdT5lT0vUUl0gK+r0U2K4bsAGTE8ujIwakp
         8PVdNX9CCbZytypT4Dg8gAyK+1+DTFXDpuM70hpqFsbehx15pjyvUZul7HMKIX4q/DiY
         WkI/722x/Gyl0veN848/ATgmgvsfGZT1XUb+hOHXgpy8ZH4JYYsWHYwrz+VPgy0KIsy1
         ETJgGj+jtb+rJ/5f9vwmpsRq4lEAFFl3ADpEfJNWg/BWg9VWxFsYSq76gaV3qOc0Q2VV
         huUg==
X-Forwarded-Encrypted: i=1; AKwUvBxgmK/kLcH4mZwJMc+ySDS8ZGOJCPD0Io2nSplUyBdabopH0EtJCCHCsYLwmrlh6UJ+0YmLKv+i/ps=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6iV9GpOmHfOIh1Tjo5KLihnekGIQcBISCe9LgUhDXY7dW0a2G
	aImVv9Q9HT/WtWo3n/mMPFGOQ4u2ZrYIe+hd6OnW9FC1sTaa0jWd7kl/
X-Gm-Gg: AYBFou3BHtB4lpIoHz7c5uWXDwFUk5OCLVDxnGrU3GZctG2Eab3V1jsDyp6UKCpCD2I
	rKkIbjiNO+zP1vWH/InPs2oDWpRGQUeECMJqMZ+53W+J8RfiAJPeAwZyxapxnrGcOkFoRzXkQvg
	YdxyL0rNJfigiy8/GL/Ltn9yg//yFAtiNo9y6p+qRDyVWYJF+1Yay77iAFQxWO6kP8uhYt9R/6k
	DQyybqcVd6rTgZnkZSLl+Y16+GzUXzJhBLXucks6/vVwZrSAq9btP78Y3xC/z8EPlIXROU5B6tX
	ET80W0muqiTjzOXB0ODAonGGIdJRUT7e6C2E9u0C8ii798LaTWtYHrNuixUvQ48MNM/PZ1MYq1N
	V/s63zwfHRoU+HV/d+gl8f6AGJgHKxU2vbArLwhKrrFCx44PjFQYTZfg7/IJsSoMY/SjU/W7zJK
	/YtJdh0Aaeh5y6usgF0bBRn/cto+tzUawO0JWyf2lgqSiQUVML4mE9kd90FLxOa2lIf3896Oe3P
	0F9pAjqM6gjFMIEyJrgnpmc2CKqEcQyyHMbglG4NHh1Io3FJMVTuZJXPlavfnoRn03GhcUzNA==
X-Received: by 2002:a05:6000:4205:b0:48e:dee:52bc with SMTP id ffacd0b85a97d-48e0dee52f0mr18975446f8f.0.1792501227440;
        Tue, 20 Oct 2026 06:00:27 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d830e91sm6114754f8f.54.2026.10.20.06.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:00:27 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 20 Oct 2026 15:00:18 +0200
Subject: [PATCH v3 7/8] of: property: fw_devlink: Follow clock nexus maps
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
Message-Id: <20261020-fw-devlink-nexus-ready-v3-7-fd6f1c17e16d@toradex.com>
References: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
In-Reply-To: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, 
 Frank Li <Frank.li@oss.nxp.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Leonardo Costa <leonardo.costa@toradex.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Clock consumers use of_parse_phandle_with_args_map() to resolve
specifiers through clock-map properties. fw_devlink instead parses the
clocks property as a direct phandle reference, so it records the nexus
node as the supplier rather than the mapped clock provider.

A nexus is a translation node, not the clock provider, and need not be
populated as a device. The resulting fwnode link can therefore remain
unresolved and indefinitely defer the consumer while
device_links_check_suppliers() waits for the nexus.

Use the map-aware parser for clocks so fw_devlink resolves the same
provider as the clock consumer API. Direct clock references continue to
work because the map-aware parser returns the original provider when no
clock-map property is present.

Fixes: aacc54c67869 ("clk: Add support for clock nexus dt bindings")
Link: https://lore.kernel.org/all/20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com/
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
aacc54c67869 ("clk: Add support for clock nexus dt bindings") has been
in clk-next and linux-next with the same hash since next-20260907. There
is no build-time dependency on it, but this patch should not reach
mainline before it.
---
 drivers/of/property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 53301cdac6a9..2388d607136f 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1422,7 +1422,7 @@ struct supplier_bindings {
 	u8 fwlink_flags;
 };
 
-DEFINE_SIMPLE_PROP(clocks, "clocks", "#clock-cells")
+DEFINE_SIMPLE_NEXUS_PROP(clocks, "clocks", "clock")
 DEFINE_SIMPLE_PROP(interconnects, "interconnects", "#interconnect-cells")
 DEFINE_SIMPLE_PROP(iommus, "iommus", "#iommu-cells")
 DEFINE_SIMPLE_PROP(mboxes, "mboxes", "#mbox-cells")

-- 
2.43.0

